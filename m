Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB735F59F4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 20:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7776110E74C;
	Wed,  5 Oct 2022 18:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320E110E743
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 18:38:55 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-131dda37dddso19896576fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Oct 2022 11:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uWGfOQNoiUR5+ft56H+DZe0QVsHI27BeyjlrNzwymwA=;
 b=b/2ws6naoA1zK5Fni/IVTuECUTXhcVShJRsUWlc+utLejWBsJw6drZ34b3LMOQG56V
 0jLCzKHgreodGZ1ODUAIfUVwSFNuEppcozm8XReuA3qXDCdx5Ve0bmNJbZyFEOETdhN/
 SXjfLlbNmEPscfdR5L1sz+Yog5/KhDqKzDYwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uWGfOQNoiUR5+ft56H+DZe0QVsHI27BeyjlrNzwymwA=;
 b=P5aI4hDXhV1asnCEoVaK3MFeWMMyR1QQf5KESRAi8elvrqkFXrXaeGUlzlDUqhVSPK
 VyiPoziHn80CbRDKCASPXfFvEQK9gu5oCAg6d2CJFnPvOsDx1xd1qNi7zEjxtH/5amRD
 337tieRsDUJeZFERZRLdFqaQa8hJq1RRCFKcUcbrMc4Qq4GeSgSFp4fUQIGdbyNDVoAW
 r8g4WkF7Lydz1MaTCEWrVwqCOQ2tD9XEKdznj1Gz+shC8opMPLc+Td2YzW7wgRZQVM0t
 /mKrLut8sRWZZvuYiarNIo3mfwtT1Moc2+kHIDhpe25X0J/t5kG6urc1auqRFGe168W1
 v3Nw==
X-Gm-Message-State: ACrzQf2Wh30yT0OQSFHIRjilHzXaycYCS3/nyY7ZktSnvVCUg9RxThsS
 F4eOcTqb/UlTdDyvbWowTVQkCXy/JZBjRA==
X-Google-Smtp-Source: AMsMyM4O2C1dVjh0pzdRX5teM6AajI/IbuidJRdGWC2a4xLt7kDxgW2epUsSqFQaJ1x9evOMqNShRQ==
X-Received: by 2002:a05:6870:34d:b0:127:cb87:a169 with SMTP id
 n13-20020a056870034d00b00127cb87a169mr495300oaf.87.1664995132888; 
 Wed, 05 Oct 2022 11:38:52 -0700 (PDT)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com.
 [209.85.167.181]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0013297705e5dsm2869423oac.28.2022.10.05.11.38.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Oct 2022 11:38:51 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id m81so18576803oia.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Oct 2022 11:38:51 -0700 (PDT)
X-Received: by 2002:a05:6808:2012:b0:34f:ca73:ee55 with SMTP id
 q18-20020a056808201200b0034fca73ee55mr591338oiw.229.1664995131487; Wed, 05
 Oct 2022 11:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzs4n8dDQ_XVVPS_5jrBgsNkhDQvf-B_XmUg+EG_M2i4Q@mail.gmail.com>
In-Reply-To: <CAPM=9tzs4n8dDQ_XVVPS_5jrBgsNkhDQvf-B_XmUg+EG_M2i4Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 5 Oct 2022 11:38:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgJmLVs7MYd=uF4+b32Fwmvgc0MLr4TEUSBEPf5U6=W5g@mail.gmail.com>
Message-ID: <CAHk-=wgJmLVs7MYd=uF4+b32Fwmvgc0MLr4TEUSBEPf5U6=W5g@mail.gmail.com>
Subject: Re: [git pull] drm for 6.1-rc1
To: Dave Airlie <airlied@gmail.com>
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
> This is very conflict heavy, mostly the correct answer is picking
> the version from drm-next.

Ugh, yes, that was a bit annoying.

I get the same end result as you did, but I do wonder if the drm
people should try to keep some kind of separate "fixes" branches for
things that go both into the development tree and then get sent to me
for fixes pulls?

Hopefully this "lots of pointless noise" was a one-off, but it might
be due to how you guys work..

                      Linus
