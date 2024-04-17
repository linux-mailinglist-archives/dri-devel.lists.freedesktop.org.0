Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F24A98A7D08
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 09:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0B6113236;
	Wed, 17 Apr 2024 07:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1354113236
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 07:30:46 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dde0b30ebe2so4883266276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 00:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713339045; x=1713943845;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xtInziVXajqdYdbn8kqIjqOC2K657alE2kZmp/MOz+Q=;
 b=jIjhAd3iRcu0QGk29A6R+VYaiKIx8aOdvb8kl7o8bUsHEBFBnRTVIDNopSLSO67Qvc
 RVZH0dHpX1AjS3ByVQHKbZ9xGk7Pgyb10ORUTpq9Q69+FaAIXxH4hu/6wavADh8Y9a61
 Jl58f7Lq1cqaoHbN53+xnqroIt3fHZrvqMH8TjtOR55keuolzLjc7l4XP6PUDeNgIBdB
 mF/MBxyuGeaCfvhRoxckqOz75oRwq28Rdm27H6vrmHtrLs65SG2UGAtj6gsX6gpkHVXp
 xaCAmI6vIYvxlcN223HeFPpgUf6xyKPPZ6leU43z38EyZw7k0ncpaOvM3BaKIlogSEXh
 RLUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL7r6GhpAAcpZ0fkFRHua28I7CrKdAsq84Kr4QU0yIBpnm4uu6/TzjD+kJzJdIoWw8N4gEbtp3jyKRaeZwz9ARturLfRfOqenIotgFnEw2
X-Gm-Message-State: AOJu0YwQj3zC+EopqPX69RGgRhj1el6Y51LXtnC0PZOLuPL45zapobAJ
 umyW7Pn5DlHqDhaqLkfk4fywMNbaq4fDmxAfxCBb/7nQrM43E+HKwZPas31P
X-Google-Smtp-Source: AGHT+IHwfjsHMTb+BLNGeImBKTlDoT5bURyncaYoP0k8u5yGI/xgN8PA0Eqwbs8ip3TOGJSRkktK0A==
X-Received: by 2002:a25:84c6:0:b0:dcc:693e:b396 with SMTP id
 x6-20020a2584c6000000b00dcc693eb396mr13504920ybm.2.1713339044933; 
 Wed, 17 Apr 2024 00:30:44 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 x197-20020a25e0ce000000b00dcc45635f27sm2886811ybg.18.2024.04.17.00.30.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 00:30:44 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dde0b30ebe2so4883250276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 00:30:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVf2kK/SZFUW8RnXcK9dX1Ul48GoD3spf988r3EyT5aBCsl36ibvgu/eUQuOxBkIU34nW9hjH3mOtTR9oihII0B92zutOlz4bTMseCKn2u/
X-Received: by 2002:a05:6902:1b93:b0:dcf:288e:21ca with SMTP id
 ei19-20020a0569021b9300b00dcf288e21camr16085636ybb.11.1713339044217; Wed, 17
 Apr 2024 00:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-9-tzimmermann@suse.de>
 <87r0f54kir.fsf@minerva.mail-host-address-is-not-set>
 <6cdccec9-e1a1-477b-a41a-4fb9d94d3238@suse.de>
In-Reply-To: <6cdccec9-e1a1-477b-a41a-4fb9d94d3238@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Apr 2024 09:30:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJCKnJi-jk1wipUgLfbEqneBpmG5OsMMnMAnhAW9xApQ@mail.gmail.com>
Message-ID: <CAMuHMdVJCKnJi-jk1wipUgLfbEqneBpmG5OsMMnMAnhAW9xApQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/43] drm/fbdev: Add fbdev-shmem
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, Apr 16, 2024 at 2:07=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Am 16.04.24 um 13:25 schrieb Javier Martinez Canillas:
> > Thomas Zimmermann <tzimmermann@suse.de> writes:
> > Do I understand correctly that info->fix.smem_start doesn't have to be =
set
> > because that's only used for I/O memory?
>
> It's the start of the framebuffer memory in physical memory. Setting
> smem_start only makes sense if the framebuffer is physically continuous,
> which isn't the case here.

Nothing really needs fix.smem_start, it's mainly for informative use.
However, if smem_start is not page-aligned, userspace does need to
know the start offset inside the page (see below).

> > This also made me think why info->fix.smem_len is really needed. Can't =
we
> > make the fbdev core to only look at that if info->screen_size is not se=
t ?
>
> The fbdev core doesn't use smem_len AFAICT. But smem_len is part of the
> fbdev UAPI, so I set it. I assume that programs use it to go to the end
> of the framebuffer memory.

On fbdev drivers also exporting MMIO to userspace, /dev/fbX contains
two parts: first the frame buffer, followed by the MMIO registers.
Both parts are an integral number of pages, based on fix.smem_{start,len}
resp. fix.mmio_{start,len}.

Old XFree86 used the MMIO part to implement hardware acceleration
when running on top of fbdev.

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
