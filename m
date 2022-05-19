Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A12952CCB8
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 09:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B2D11AC3A;
	Thu, 19 May 2022 07:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93A011AC3A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 07:19:40 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id k2so4268959qtp.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 00:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=REdU6yQ0LkgcyYqOaju3zdpW9ygW1nqPdZvdg9KIbtw=;
 b=L8kasVLT3pc/rmvp/8UzgiaM7s04Pb46VMiE9KzGFNSCNURdVmVO7mLvJ0o5VBcP15
 LqT0TzAbejgS+g1Sqbxkw3gXOLb4A4j9wwDNHBMyE6Q5vLrB0byyWXUrqfjBxdoPIUCe
 5+2NzTSy5gLjM/ClWJ/LM6joNGC0ONLO/bhrpZ8kJC0jYUfsJ60mocURWB+cFL/UBwhX
 hSNxUp9gHNbY4LfHB/Y0Sqzq6WCYes+Cj3BlFlvHkh1Y5N1FeKO1ufbeym+JKPoyOzS2
 ITU1JBPvhdTcGeCuoGM4zpdNsisJgMEfjz0J7MxLO3h0L9dK4NTA5oe6Vb6RAJth8gB1
 vEEw==
X-Gm-Message-State: AOAM531V9omQ18CNVvU7V9mx3+snq7TuL4ksrGIZZDuqnL8wRLj+45LU
 /oEUnQ5KrM+jf6vXAobX22vWlVTrVflpfA==
X-Google-Smtp-Source: ABdhPJzaVdfgDnaFuTAlIXZ0tRSYbcasYKnp9sIJ3yJ5teV6ZaSkqjtGxc4fL8dXBuAQZVcqgKKs8A==
X-Received: by 2002:ac8:5c49:0:b0:2f3:b5bb:acbd with SMTP id
 j9-20020ac85c49000000b002f3b5bbacbdmr2862287qtj.542.1652944779475; 
 Thu, 19 May 2022 00:19:39 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178]) by smtp.gmail.com with ESMTPSA id
 b18-20020ac844d2000000b002f3d23cf87esm866832qto.27.2022.05.19.00.19.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 00:19:38 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id e78so7488014ybc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 00:19:38 -0700 (PDT)
X-Received: by 2002:a81:9b0c:0:b0:2f4:c522:7d3c with SMTP id
 s12-20020a819b0c000000b002f4c5227d3cmr3231864ywg.316.1652944295889; Thu, 19
 May 2022 00:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220518183006.14548-1-tzimmermann@suse.de>
 <20220518183006.14548-3-tzimmermann@suse.de>
 <20220518185156.GJ163591@kunlun.suse.cz>
In-Reply-To: <20220518185156.GJ163591@kunlun.suse.cz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 May 2022 09:11:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUws2eJ4pHng4GD0PjuvMj5Hef_y_YyM4fUJV9xdUVuEQ@mail.gmail.com>
Message-ID: <CAMuHMdUws2eJ4pHng4GD0PjuvMj5Hef_y_YyM4fUJV9xdUVuEQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/tiny: Add ofdrm for Open Firmware framebuffers
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michal,

On Wed, May 18, 2022 at 8:54 PM Michal Such=C3=A1nek <msuchanek@suse.de> wr=
ote:
> On Wed, May 18, 2022 at 08:30:06PM +0200, Thomas Zimmermann wrote:
> > --- a/drivers/gpu/drm/tiny/Kconfig
> > +++ b/drivers/gpu/drm/tiny/Kconfig
> > @@ -51,6 +51,18 @@ config DRM_GM12U320
> >        This is a KMS driver for projectors which use the GM12U320 chips=
et
> >        for video transfer over USB2/3, such as the Acer C120 mini proje=
ctor.
> >
> > +config DRM_OFDRM
> > +     tristate "Open Firmware display driver"
> > +     depends on DRM && MMU && PPC
>
> Does this build with !PCI?
>
> The driver uses some PCI functions, so it might possibly break with
> randconfig. I don't think there are practical !PCI PPC configurations.

IIRC, the first PowerMacs didn't have PCI.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
