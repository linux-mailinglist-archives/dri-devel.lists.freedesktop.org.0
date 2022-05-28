Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEEC536DFD
	for <lists+dri-devel@lfdr.de>; Sat, 28 May 2022 19:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B78D10E2F9;
	Sat, 28 May 2022 17:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D4910E2F9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 17:41:20 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id me2so982703ejb.9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 10:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pP5sQR3QwXNtypqdUBNCTZlpu49d035rXCG+jxDoA2s=;
 b=Z70GBvzBscFi3wczPp/1gBU54OJpVhVtHdRLTSfj2K/6zYlVoev9uCuNVqs5HUSD6f
 AxHO+J2LAuG3MqxfhY3/pQ1sdLe7lXw7Q1xxXU6eXyGm/7Xyqf/1CmirEGCn6tq8hsj1
 FuIAAeHZ2rF1M229MhVKggd35Tg9CBjRlQDRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pP5sQR3QwXNtypqdUBNCTZlpu49d035rXCG+jxDoA2s=;
 b=vdtMCGNVFx2+Mz37px+oyWB42rkWSl4wBcExilnCeUB6XuUi1x+X/nSUoK3sroMsLR
 /jMPV/1U523C+Nvvx24sHlFVcJXeJcFtIUQ79B9+YUhiUOp1hAfykFim4P35UJ/c+cB3
 ZpMT6NkJx6a0XFAvuykZI3+LiF9i0EBb8EyqLEtmbhgxBu0Cv4OueMv4U/JIC4/Vcz15
 i8jp5kVsYkimzElalxzS3/ZOoqoK4Lm74xrRW6O9f3Tbsm2pKCBa+aW5QyfS2frI5NYi
 5HQgXjilaA9kEl9aKIo7kF+c5JRW2BrIrLQlE3nMj7llqLZFlFsIYQkrNdTSfPI4cNHF
 rqqA==
X-Gm-Message-State: AOAM533bqEu41wyDWzjslHIf16vQTLIfOPAVNeqSovGKZhy/fp6naaYy
 rqiia1zxDKCw9et6134K1VYAoYxX6sHydMVe
X-Google-Smtp-Source: ABdhPJx31oKXIQ5DNgRhgGR/alLwHjoz1YKqSFvSrRd2OaUQ/3s27ZII1/DHf1J5oUiUREFB/oSNTg==
X-Received: by 2002:a17:907:7246:b0:6ff:241f:200a with SMTP id
 ds6-20020a170907724600b006ff241f200amr11873498ejc.543.1653759678782; 
 Sat, 28 May 2022 10:41:18 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54]) by smtp.gmail.com with ESMTPSA id
 i20-20020a17090639d400b006fec1a73e48sm2510635eje.64.2022.05.28.10.41.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 May 2022 10:41:16 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id v17so5436634wrv.2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 10:41:16 -0700 (PDT)
X-Received: by 2002:adf:dcc5:0:b0:210:1f95:c5d0 with SMTP id
 x5-20020adfdcc5000000b002101f95c5d0mr5490672wrm.97.1653759675983; Sat, 28 May
 2022 10:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <YpCUzStDnSgQLNFN@debian>
 <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
 <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
 <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
 <YpIR67FMtTGCwARZ@debian>
In-Reply-To: <YpIR67FMtTGCwARZ@debian>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 28 May 2022 10:40:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjuyHE=1wLgHncub8FfgeyYqfWYsy4-YrhAvq9991h_Aw@mail.gmail.com>
Message-ID: <CAHk-=wjuyHE=1wLgHncub8FfgeyYqfWYsy4-YrhAvq9991h_Aw@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 28, 2022 at 5:13 AM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> just tried this with
> make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- drivers/gpu/drm/drm_edid.s
>
> size_of_edid:
>         mov     r0, #144        @,
>         ldmfd   sp, {fp, sp, pc}        @

So digging a bit deeper - since I have am arm compiler after all - I
note that 'sizeof(detailed_timings)' is 88.

Which is completely wrong. It should be 72 bytes (an array of 4
structures, each 18 bytes in size).

I have not dug deeper, but that is clearly the issue.

Now, why that only happens on that spear3xx_defconfig, I have no idea.

             Linus
