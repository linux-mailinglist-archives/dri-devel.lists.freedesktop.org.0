Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2CB6F5A0
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jul 2019 22:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CF689AD2;
	Sun, 21 Jul 2019 20:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB71989AD2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2019 20:38:58 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v24so35539024ljg.13
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2019 13:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VFhbBpOoZTNy9EMhjzpqd/YuAOOhoH6s3ZbDQhN/5VM=;
 b=W5LV7ZkuLL8GP4ucHCnD0/zfG/V5fpnqMH2VhTv0EkrHudHAeH+6uvUzVI9B+ecxJJ
 N3Knipwyg0RbELBonFIrTPGjgpTy2D6ZuQxotNESaotrTWaorVKEtfEa+qvvMZYYv0l5
 h13hTp/RtKxI94Ps4DB73gGV2E1q24OM6GY5TQ4om0dffHSID40xVZuxF5VD5krQoMar
 pAvCAOwhDhh3IiTry8At3GeEwavlWBpqkjPSrwDvrIdehnP7N8jq7JISOEHKfAIFfaR/
 kO6f1A0HHoYirr9mAfegPk/e1nlAJDbwSu8/f7klGXjRof3xIhYJLNAMt8mTulHmiKgI
 s/+g==
X-Gm-Message-State: APjAAAUsfpRgQJ6mJ4/9eEIOjikcET9wZvoHd+7KQSzBr/MUpVIRsT+b
 02Sa+jHB7qDLZt7BeBbIXqAnPNyrCok=
X-Google-Smtp-Source: APXvYqxvNCd/ketNXTdZbUIcunuyUZUmqhv27fU6Z4+0/Awpl/QV7Yl80hYkAob2FRnuBGVVw8Uemg==
X-Received: by 2002:a2e:9ad1:: with SMTP id p17mr34499078ljj.34.1563741536642; 
 Sun, 21 Jul 2019 13:38:56 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id b25sm5738867lfq.11.2019.07.21.13.38.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Sun, 21 Jul 2019 13:38:56 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 62so20221736lfa.8
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2019 13:38:55 -0700 (PDT)
X-Received: by 2002:ac2:5601:: with SMTP id v1mr30384046lfd.106.1563741535585; 
 Sun, 21 Jul 2019 13:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190721201956.941-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20190721201956.941-1-daniel.vetter@ffwll.ch>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 21 Jul 2019 13:38:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiaHB_0bS_x=p-xeyp7bW7bGgkZ9QkXe6SS9axu7OP95w@mail.gmail.com>
Message-ID: <CAHk-=wiaHB_0bS_x=p-xeyp7bW7bGgkZ9QkXe6SS9axu7OP95w@mail.gmail.com>
Subject: Re: [PATCH] fbdev: Ditch fb_edid_add_monspecs
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=VFhbBpOoZTNy9EMhjzpqd/YuAOOhoH6s3ZbDQhN/5VM=;
 b=EYyAu5FNL7gKp0HuaHxd3VFhuw6OMNQ1ynqqj6BKsVxhnlAOQzaSgoqA2/t5l63YVC
 UK7L9wQH/n7peWeSk05TUKDMFY6v8Jwp73ku2LrkRQvdJHt7ULoCbcRQ5wDFhLLVzafi
 fWcVH07bkb/MP62sTSMXJXpR9LaasGZFbWyfk=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tavis Ormandy <taviso@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdWwgMjEsIDIwMTkgYXQgMToyMCBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPiB3cm90ZToKPgo+IEl0J3MgZGVhZCBjb2RlIGV2ZXIgc2luY2UKCkxvdmVs
eS4gQWNrLgoKICAgICAgICAgICAgICAgTGludXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
