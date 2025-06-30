Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 306A2AEE38D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 18:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863D310E234;
	Mon, 30 Jun 2025 16:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C5B10E234
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 16:09:06 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-6fad8b4c927so23495896d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 09:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751299745; x=1751904545;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/ESUYQIUUEOXWfvuUjT7YbrJEqAbPIXkMFZKy7WGl1Y=;
 b=aB0q5gi94oHHPE4JsQbAD04sksiVNe4VAHGRIcNEbVIGoOn48OGGq1i4j1bFMNoh1x
 v05vZapICi56YXvCOkoS9kd5gOlHsWJeHlUtOA8ju7XRmm3Kmy2W/jiQJp2lW0uCOns+
 ngRz8szbile2upBPynbTEOBqUoJsiMc/G3SiDLZ5QbkV5tr/btCq2ZoRF+SWJTV2aLAx
 2LC+Syq6kKbiKU+DtANN5eIWxd9FXWHOq2r3M2caMRM9r3DaZHK/HSlW4ZDGEgqntZdt
 4AK8Gt+XVDm7FqvVcvZTpCInJg0ux8ywACyjKk9/tFPz//6Fmk+Voj5EgnZfxPXHnS9W
 I3uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNiTit1Rs633XmdkAmY0Xh4uPaFPwsP4V+3yZ03wf43ybrDIepcLTZRDi8uHr/tuIVFSEjiB9eKv0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpP8PycnZJIhtCUjsCCff824WedM2+wlelwaUWYi5NsAqumTuv
 W6zO2PG3htOnCoIjKF0WFDdFIDffZNAaO+4qqdQcIbdGVjGt8XmUADs6DfYY0Vpp
X-Gm-Gg: ASbGncsOl9NTkiALnF39/J/c1YH5DrB8OheNrtbfydfHhFlqXa3PGPyb4GXA8EFDgX6
 0YrlOWDk2jS/sfJVHpq0p24InWaAnWY3XLwkPHkSILn1U2qrqpi7woSxSob7jcWfZMIAx0f44WK
 YJaZbgM6uLVfNh4KuFY/InrUwGUgjcMIoZ9OatZnkMVXm7IByusD2+VBssv+If9W6TC9cYRq8fm
 0CMzf5pXTUQO2SZhEVvxYJ5e0t/X1NPFTx4es798oNrP0XSJF7IH8BjmoaGDuhbLVy47ESGCQsG
 0ANX9gtxTAKzxWeyxMMitMqSdcr+quqHgSbxbuQJNld87xf/qtX5KKZHVusJElvHHFMgSZTGFaJ
 KxGC2cBB2ztAxEN4XssJW3KczbzBP
X-Google-Smtp-Source: AGHT+IFS+W2FduWak24mMWE3prwP4WwwrITqcjzFdgXBV8kC9jdpAPOf4n3WGviMh4s3ehXAfmu7pQ==
X-Received: by 2002:a05:6214:2c0c:b0:6fb:5634:d8b4 with SMTP id
 6a1803df08f44-70003c924e0mr220216986d6.30.1751299744702; 
 Mon, 30 Jun 2025 09:09:04 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com.
 [209.85.222.176]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6fd771aaccbsm70235436d6.27.2025.06.30.09.09.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 09:09:04 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7d40874b399so201425385a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 09:09:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWXqUV45cefm1VTLrOTHtBU5XlvqCwl/f68wgxjb6omdsGY/QupQxd7BsvD2k/2PqhqNDQoN3iiTqI=@lists.freedesktop.org
X-Received: by 2002:a05:620a:a816:b0:7d3:ad4f:ce0d with SMTP id
 af79cd13be357-7d4439a8318mr2015298385a.47.1751299744039; Mon, 30 Jun 2025
 09:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250611234913.161861-1-marek.vasut+renesas@mailbox.org>
 <109b5c25-f54c-4413-aa62-8e2ae621c8e6@linaro.org>
 <a263d600-4f62-4d40-864c-e0b0c42f6863@mailbox.org>
 <ef842208-069e-4471-8680-f945d5ccb1a7@linaro.org>
 <e6c51a8d-978e-44f0-bff1-efcd05617aa7@mailbox.org>
 <67da8003-ced9-4b52-a484-b37147068ae7@linaro.org>
 <32d302d6-b404-4814-9f17-fda5fe0d3391@mailbox.org>
 <5ff999e9-f0b1-4550-98c8-2d1eb7e97389@linaro.org>
In-Reply-To: <5ff999e9-f0b1-4550-98c8-2d1eb7e97389@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Jun 2025 18:08:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVKad84Yfsg=ZFMhzc2SxNmBT=NqWaHTGF9sh_12iNKYQ@mail.gmail.com>
X-Gm-Features: Ac12FXywMjoREQPTWoeAnfKEMIRlm_XHuzAH_qpPoDC1H1n0WbeRjxoMHk2x9xI
Message-ID: <CAMuHMdVKad84Yfsg=ZFMhzc2SxNmBT=NqWaHTGF9sh_12iNKYQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: ilitek-ili9881c: Use u8 for lane count
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Mon, 30 Jun 2025 at 17:34, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> On 21/06/2025 18:03, Marek Vasut wrote:
> > On 6/16/25 6:26 PM, Neil Armstrong wrote:
> >> On 16/06/2025 18:05, Marek Vasut wrote:
> >>> On 6/16/25 1:45 PM, Neil Armstrong wrote:
> >>>> On 13/06/2025 12:54, Marek Vasut wrote:
> >>>>> On 6/13/25 11:29 AM, Neil Armstrong wrote:
> >>>>>> On 12/06/2025 01:49, Marek Vasut wrote:
> >>>>>>> Use u8 to hold lane count in struct ili9881c_desc {} to avoid
> >>>>>>> alignment gap between default_address_mode and lanes members.
> >>>>>>> The ili9881c controller can only operate up to 4 DSI lanes, so
> >>>>>>> there is no chance this value can ever be larger than 4. No
> >>>>>>> functional change.
> >>>>>>
> >>>>>> The u8 will still take at least 4 bytes and cpu will still
> >>>>>> do at least a 32bit memory access, so there's no point to change
> >>>>>> it to u8.
> >>>>> Assuming this layout:
> >>>>>
> >>>>>    40 struct ili9881c_desc {
> >>>>>    41         const struct ili9881c_instr *init;
> >>>>>    42         const size_t init_length;
> >>>>>    43         const struct drm_display_mode *mode;
> >>>>>    44         const unsigned long mode_flags;
> >>>>>    45         u8 default_address_mode;
> >>>>>    46         u8 lanes;
> >>>>>    47 };
> >>>>>
> >>>>> I wrote a quick test:
> >>>>>
> >>>>> $ cat test.c
> >>>>> #include <stdio.h>
> >>>>> #include <stdint.h>
> >>>>>
> >>>>> struct foo {
> >>>>>      void *a;
> >>>>>      size_t b;
> >>>>>      void *c;
> >>>>>      unsigned long d;
> >>>>>
> >>>>>      uint8_t x;
> >>>>>      unsigned long y; // ~= lanes
> >>>>> };
> >>>>>
> >>>>> struct bar {
> >>>>>      void *a;
> >>>>>      size_t b;
> >>>>>      void *c;
> >>>>>      unsigned long d;
> >>>>>
> >>>>>      uint8_t x;
> >>>>>      uint8_t y; // ~= lanes
> >>>>> };
> >>>>>
> >>>>> int main(void)
> >>>>> {
> >>>>>      printf("%d %d\n", sizeof(struct foo), sizeof(struct bar));
> >>>>>      return 0;
> >>>>> }
> >>>>>
> >>>>> With which I get these results on x86-64:
> >>>>>
> >>>>> $ gcc -o test test.c && ./test
> >>>>> 48 40
> >>>>>
> >>>>> And on x86 32bit:
> >>>>>
> >>>>> $ i686-linux-gnu-gcc -o test test.c && ./test
> >>>>> 24 20
> >>>>>
> >>>>> Maybe there is some improvement ?
> >>>>
> >>>> Try again with code size included, and other archs since 99% of the users would be an arm/riscv based boards.
> >>> Doesn't that mean, that one some systems it wins us a bit of memory utilization improvement, and on other systems it has no impact ?
> >>
> >> 4 or 8 bytes less in a dynamically allocated struct which is by default aligned

These structures are static, and not allocated dynamically.

> >> on 64 bytes by default on x86, 128 on aarch64, 32/64/128 on arm32, 64 on riscv, sorry this is negligible.
> > It is still not zero, so why tolerate the inefficiency when it can be improved ?
> >
> > Is this change rejected ?
>
> I won't nack it since it's technically correct, but won't ack it since it's an useless change.

On arm32:

    $ bloat-o-meter drivers/gpu/drm/panel/panel-ilitek-ili9881c.o{.orig,}
    add/remove: 0/0 grow/shrink: 0/8 up/down: 0/-32 (-32)

Surprisingly, even on arm64:

    $ bloat-o-meter drivers/gpu/drm/panel/panel-ilitek-ili9881c.o{.orig,}
    add/remove: 0/0 grow/shrink: 0/8 up/down: 0/-64 (-64)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
