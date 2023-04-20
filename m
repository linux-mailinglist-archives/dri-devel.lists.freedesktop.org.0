Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0D76E96EA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 16:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6C810EC5B;
	Thu, 20 Apr 2023 14:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB7E10EC5B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 14:21:52 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id c3so2977169ljf.7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 07:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682000509; x=1684592509;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v+ntSNli+3961rRN83tx2G/slCSVpZgHaGQlcoQLCYo=;
 b=Uqv07ao+xZr6LdHd5l6C8NQb11Uc23AO1zPWtFdTw2tTS7WBn8HTVk5tZykSvAl5xk
 g/9web9O4pVjtmsUvRgYYNczCN0n+QhDV8gxMCXOBfik3SgsrUf7of0GM4hhD8imqmPi
 9uhBdqO5+vwMRgV9D82vUisq+n2ZFJauzK9T8BcqcZ9QqkvEt/ZDIreiG0Umc0tRZHT3
 Yg+9eAz0lWBGnrYnHchqib4g8HIw/IsbZmNRNNU0TtgF1sCnF4kSZZPGA+gVp+hF4Qwr
 DMg1dnefJrZ73or9mMNvmfq/MkUrzrIzN3/aAZ5OMpNt4ks3ZQsCLKjTsFtuem0+oT5c
 UbHg==
X-Gm-Message-State: AAQBX9eXuLJaKS5jmWKheYfiORlVldGRz5nBbaXx2Uv6cS++pgBaH/FQ
 huVS/8MUYNdORhm5rT7eKjxmoaezvz9s4TR+
X-Google-Smtp-Source: AKy350bZvN85UZMkcCuDwB0+4iKMsGkdLbBRalRULot8K2NsA4tKV0vWIomwY0rHEDPQhUzsoGX79w==
X-Received: by 2002:a2e:3e0c:0:b0:2a8:c3c7:b551 with SMTP id
 l12-20020a2e3e0c000000b002a8c3c7b551mr564321lja.17.1682000509504; 
 Thu, 20 Apr 2023 07:21:49 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49]) by smtp.gmail.com with ESMTPSA id
 e7-20020a2e9e07000000b00295b842c2dbsm255607ljk.133.2023.04.20.07.21.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 07:21:48 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-4eed6ddcae1so2800580e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 07:21:47 -0700 (PDT)
X-Received: by 2002:ac2:5339:0:b0:4ed:d542:6f65 with SMTP id
 f25-20020ac25339000000b004edd5426f65mr515553lfh.5.1682000507607; Thu, 20 Apr
 2023 07:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230420030500.1578756-1-suijingfeng@loongson.cn>
 <8ec3734b-4bc2-ad8f-fc17-3002f22d1fc9@suse.de>
 <12c8efaa-7266-5436-dc53-009a0d23b53f@suse.de>
 <4a0fdbe0-cd4f-9c87-f73a-6d27f5c497bb@189.cn>
 <f541018f-bb7f-ac58-bbb8-797069e49c3f@suse.de>
 <CAMuHMdVGtvgcQuTR9bfMh1cM86TYXSByxJzW5eJtF9A0ZLRF3w@mail.gmail.com>
 <3d455074-bd51-51a0-7692-a0b4ca961355@suse.de>
In-Reply-To: <3d455074-bd51-51a0-7692-a0b4ca961355@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Apr 2023 16:21:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXHMeiaew7wbj-aNL0oZ=X3gfoSBkMYAbbdyfe6bVZcfQ@mail.gmail.com>
Message-ID: <CAMuHMdXHMeiaew7wbj-aNL0oZ=X3gfoSBkMYAbbdyfe6bVZcfQ@mail.gmail.com>
Subject: Re: [PATCH v5] drm/fbdev-generic: prohibit potential out-of-bounds
 access
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Li Yi <liyi@loongson.cn>,
 Helge Deller <deller@gmx.de>, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sui Jingfeng <15330273260@189.cn>, loongson-kernel@lists.loongnix.cn
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Apr 20, 2023 at 2:59=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Am 20.04.23 um 14:25 schrieb Geert Uytterhoeven:
> > On Thu, Apr 20, 2023 at 1:10=E2=80=AFPM Thomas Zimmermann <tzimmermann@=
suse.de> wrote:
> >> Am 20.04.23 um 12:04 schrieb Sui Jingfeng:
> >>> What will happen if the 'screen_size' is not page_size aligned and mm=
ap
> >>> will mapping in the granularity of pages ?
> >>
> >> You need to map at page granularity. If screen_size is not page-size
> >> aligned, there's this trailing buffer that is accessible, but cannot b=
e
> >> displayed. But userspace has no direct way of knowing that, so let's
> >> ignore that problem for now.
> >
> > Userspace can know, if fb_fix_screeninfo.smem_{start,len} match
> > the actual offset and size.
>
> Can you elaborate? How can userspace detect/compute the actually usable
> space?

By looking at fb_fix_screeninfo.smem_{start,len}, which are the (physical)
address and length of the frame buffer.

>  From grep'ing fbdev drivers, smem_len appears to be a multiple of the
> pagesize. (?) screen_size is not exported and line_length in the fixed
>
> portion. Or can line_length change between modes? In that case it should
> be (yres_virtual * line_length), right?

smem_{start,len} are not guaranteed to be page-aligned.
Fbtest[1] and Xorg should handle that fine.

line_length can change between modes.  It's part of fb_fix_screeninfo,
because it's fixed in the sense that it depends on the video mode, and
the user cannot specify its value.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/fbtest.git/tree/f=
b.c#n199

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
