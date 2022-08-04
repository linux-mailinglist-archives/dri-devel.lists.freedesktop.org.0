Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 328265896B3
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 05:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FC010F4A0;
	Thu,  4 Aug 2022 03:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346EF11B449
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 03:47:45 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id tl27so16830227ejc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 20:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=wyof0bkxuLb7l+bW3evuMnDsgT1C3T/ocuCEfridqEI=;
 b=YOlanNtbyFxg8zqgJxqaze8MqqqzS2vIkh+xow7vp8sZud9d5nlNTgg2xBW7zgdIm/
 XkYaoItWl8EKHeep0zfLcRZqJiCm1AhE06/GrhCT8BtqzueQ2TSH6UdgYngjRmtIhtl6
 UKVq2AF4IXgWjr4XtceN65Guj6s45iizfstzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=wyof0bkxuLb7l+bW3evuMnDsgT1C3T/ocuCEfridqEI=;
 b=rXQe39i7+W0fP8Fbiu1nQMSHyHfau+HmvAE7/l/W1sadSUeK/T6J3ksY7rBD382d26
 7Ep5DbmZ6zkZOP61cO2KEyDiBNcVUaWtympFS6Kn0vTVS+IqNlgwNbw45qgmcofY5Jfz
 i6OCwVtKevXVa+dqw+muJwJ9a2aFvwaQ91rI9rPuyA32E29FvkA7s1I4S5uGRcxmxipO
 1mp0+/rF9Ebdv2iq5hC4+TVbwiyBYoZNF+Lz6k1pVGxW6JFqs8APH1l+axrfTtAQ+YQC
 VJbhc06cDmKSDTFBiU5uKZnenbXOUTevpTc9lFhmggJv0iNfSzZt9aRN77mLZtMvkm1J
 2BsA==
X-Gm-Message-State: AJIora/svM56I6VfyLTHoNtKCgWYs853vzI87rBOMIrMegILiLHpN/g0
 wxqQ4UDXT+zcwSEzjPxdJbTeuc6GOuPlfoNe
X-Google-Smtp-Source: AGRyM1tATZGYYiRETa6t6Xps2NYcaNVvUDIfqqGtFzDDG5S3GUArfafVYJtAs3D+OgfhKCE67kUKfw==
X-Received: by 2002:a17:907:6e1d:b0:72f:20ad:e1b6 with SMTP id
 sd29-20020a1709076e1d00b0072f20ade1b6mr22805362ejc.545.1659584864194; 
 Wed, 03 Aug 2022 20:47:44 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 17-20020a170906201100b006fee98045cdsm158106ejo.10.2022.08.03.20.47.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 20:47:43 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id z17so19059141wrq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 20:47:43 -0700 (PDT)
X-Received: by 2002:a5d:638b:0:b0:220:6e1a:8794 with SMTP id
 p11-20020a5d638b000000b002206e1a8794mr7203271wru.193.1659584863178; Wed, 03
 Aug 2022 20:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twFEv8AcRQG-WXg5owy_Xhxy3DqnvVCFHgtd4TYCcKWEQ@mail.gmail.com>
 <CAHk-=whXSt2N0GcoPC6XxXXLMpXm-34ua+X4AhPsLoqBcF6Xqg@mail.gmail.com>
 <CAHk-=wj8UHvjsVPohpRA1RJo1upyKoSnjcsys+=vbRVbpPvBMg@mail.gmail.com>
 <CAPM=9txsYE1zFDW+ehHQv138DoeT1Fw6hfzfPa4czvXGSjefjw@mail.gmail.com>
In-Reply-To: <CAPM=9txsYE1zFDW+ehHQv138DoeT1Fw6hfzfPa4czvXGSjefjw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 3 Aug 2022 20:47:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj+yzauNXiEwHfCrkbdLSQkizdR1Q3YJLAqPo6AVq2_4Q@mail.gmail.com>
Message-ID: <CAHk-=wj+yzauNXiEwHfCrkbdLSQkizdR1Q3YJLAqPo6AVq2_4Q@mail.gmail.com>
Subject: Re: [git pull] drm for 5.20/6.0
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

On Wed, Aug 3, 2022 at 8:37 PM Dave Airlie <airlied@gmail.com> wrote:
>
> Actually I did miss that so that looks good.

.. I wish it did, but I just actually test-booted my desktop with the
result, and it crashes the X server.  This seems to be the splat in
Xorg.0.log:

  (II) Initializing extension DRI2
  (II) AMDGPU(0): Setting screen physical size to 2032 x 571
  (EE)
  (EE) Backtrace:
  (EE) 0: /usr/libexec/Xorg (OsLookupColor+0x13d) [0x55b1dc61258d]
  (EE) 1: /lib64/libc.so.6 (__sigaction+0x50) [0x7f7972a3ea70]
  (EE) 2: /usr/lib64/xorg/modules/drivers/amdgpu_drv.so
(AMDGPUCreateWindow_oneshot+0x101) [0x7f797207ddd1]
  (EE) 3: /usr/libexec/Xorg (compIsAlternateVisual+0xdc4) [0x55b1dc545fa4]
  (EE) 4: /usr/libexec/Xorg (InitRootWindow+0x17) [0x55b1dc4e0047]
  (EE) 5: /usr/libexec/Xorg (miPutImage+0xd4c) [0x55b1dc49e60b]
  (EE) 6: /lib64/libc.so.6 (__libc_start_call_main+0x80) [0x7f7972a29550]
  (EE) 7: /lib64/libc.so.6 (__libc_start_main+0x89) [0x7f7972a29609]
  (EE) 8: /usr/libexec/Xorg (_start+0x25) [0x55b1dc49f2c5]
  (EE)
  (EE) Segmentation fault at address 0x4
  (EE)
Fatal server error:
  (EE) Caught signal 11 (Segmentation fault). Server aborting

so something is going horribly wrong. No kernel oops, though.

It works on my intel laptop, so it's amdgpu somewhere.

I guess I will start bisecting. Oy vey.

             Linus
