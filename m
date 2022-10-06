Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DC75F6DB1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 20:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB1110E86B;
	Thu,  6 Oct 2022 18:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFED10E86B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 18:48:03 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id v134so3017099oie.10
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 11:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vJ9aXvF0UV+hPF6vLhTwevLaf+MHU+7z3WZDrs6PuE8=;
 b=C92DsrJa5pMHAVCLNB/mBu5Se8g4ReDdr4exh89KR8dSfA2vbRsHRJIS+8WJVKh7Hx
 x3HTDXWT9+itDjTTvo+rRQuBc/f4nbRtWpv5Kk6ZOys8syaQSHrTO/XveqoM7wUChlyI
 Yz8nvI/k5xSKmWTB2VxQGD63/h3PqBSNkLnZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vJ9aXvF0UV+hPF6vLhTwevLaf+MHU+7z3WZDrs6PuE8=;
 b=Kr6Gvb7ryIYg3TTHNqG+y90p19raspFtDyC8CkamMaACvSg3f3pveP+vciWGzPrv49
 FKDBtfUKrFJIo0mSXozkRzRxyZCds231KUF/0yaRf/KTU9bNZAJRADzBXaWKDpP1zwUV
 eWkwQdmhUGTr/NnQl1KTP8untA8EGVNj+Wvwpz4lUK0+sCFVjpm1J+Bx4tQnpKpqTgze
 0yQ0dvN7ynelXDHpEbeNfIHcT3dJpliDXX96MqdjBdUq8twYvR4/a8C8A9Gh2O4P5Q/D
 iWRZUT1dl1HUtnsGH/S72N9nB3VkJIAnLLqXWjiMaKRBXfKxb1iKCOaYVYULhvMd5el8
 Xu4Q==
X-Gm-Message-State: ACrzQf3JCSbRfUO32SYc9eOZ+EoJCXXuAP2EwHqJrMwl6PUXWfflpovh
 05EkuRybIYlTZAtJcbZqgRpA34GJBzJuYA==
X-Google-Smtp-Source: AMsMyM4HnM1sRS5fOx1yCO2KIUmoWbj1I02+BqH5dvB7eqMkSgbXsg5mEuCkRm7r3uoyQ0GBFjpM1A==
X-Received: by 2002:aca:5808:0:b0:350:9790:7fe with SMTP id
 m8-20020aca5808000000b00350979007femr5919232oib.79.1665082082345; 
 Thu, 06 Oct 2022 11:48:02 -0700 (PDT)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com.
 [209.85.161.48]) by smtp.gmail.com with ESMTPSA id
 q23-20020a0568080a9700b00342eade43d4sm5978567oij.13.2022.10.06.11.48.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 11:48:01 -0700 (PDT)
Received: by mail-oo1-f48.google.com with SMTP id
 c13-20020a4ac30d000000b0047663e3e16bso2018728ooq.6
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 11:48:01 -0700 (PDT)
X-Received: by 2002:a05:6830:611:b0:65c:26ce:5dc with SMTP id
 w17-20020a056830061100b0065c26ce05dcmr574454oti.176.1665082081255; Thu, 06
 Oct 2022 11:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzs4n8dDQ_XVVPS_5jrBgsNkhDQvf-B_XmUg+EG_M2i4Q@mail.gmail.com>
In-Reply-To: <CAPM=9tzs4n8dDQ_XVVPS_5jrBgsNkhDQvf-B_XmUg+EG_M2i4Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 6 Oct 2022 11:47:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=whUp5Ufur6Bmv=H-rDDTNJJ-KVqOKkL+5FmR01jp0dbcA@mail.gmail.com>
Message-ID: <CAHk-=whUp5Ufur6Bmv=H-rDDTNJJ-KVqOKkL+5FmR01jp0dbcA@mail.gmail.com>
Subject: Re: [git pull] drm for 6.1-rc1
To: Dave Airlie <airlied@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 4, 2022 at 8:42 PM Dave Airlie <airlied@gmail.com> wrote:
>
> Lots of stuff all over, some new AMD IP support and gang
> submit support [..]

Hmm.

I have now had my main desktop lock up twice after pulling this.
Nothing in the dmesg after a reboot, and nothing in particular that
seems to trigger it, so I have a hard time even guessing what's up,
but the drm changes are the primary suspect.

I will try to see if I can get any information out of the machine, but
with the symptom being just a dead machine ...

This is the same (old) Radeon device:

   49:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
[AMD/ATI] Ellesmere [Radeon RX 470/480/570/570X/580/580X/590] (rev e7)

with dual 4k monitors, running on my good old Threadripper setup.

Again, there's no explicit reason to blame the drm pull, except that
it started after that merge (that machine ran the kernel with the
networking pull for a day with no problems, and while there were other
pull requests in between them, they seem to be fairly unrelated to the
hardware I have).

But the lockup is so sporadic (twice in the last day) that I really
can't bisect it, so I'm afraid I have very very little info.

Any suggestions?

                      Linus
