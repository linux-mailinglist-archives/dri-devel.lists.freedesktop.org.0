Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 508E612DEA0
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jan 2020 12:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2E589804;
	Wed,  1 Jan 2020 11:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F83897EE;
 Wed,  1 Jan 2020 09:40:16 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id q8so20639084pfh.7;
 Wed, 01 Jan 2020 01:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=H/6Fruq4L+is5MAGLCLnDa2kYoz3ypv5Xq87O+YG7dw=;
 b=TRVfiwLpS3gBwr93EH1UC3q2CxlOD58tSPzLvZyvXX08YQj/2dWxxs63GU/pHCXrbV
 kwuz/0wDEhp3dtMDLp9MRgdrGluIn7juafSYST1o7O8frJrRr7lGYYMiCTj9s/39m2Ou
 PD5plYGQ9VsjT9uA4UXBRjo80RbiLCmD04P7qHggegZ755PppHr5+FWdwuNYkBErfSac
 eI0DRWFPGZiLijig2z6G/Tam345Q+wzmbuXzfrGwqXd/23GOnqTiGrrV9nAiF7Ra0f7b
 o06GNBOJ/F4VjxjwPHeLmVIjwjAxS63ts4puy3Ah+5+H2srZ7PCs6n8KodcoXLtXR3lY
 lnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=H/6Fruq4L+is5MAGLCLnDa2kYoz3ypv5Xq87O+YG7dw=;
 b=qtxKOvhzJp3Y7VUHpT5+PfaRvqN4B4YJmmx+eN8kPfdzmMb7BNbFhqR11TgclMWXqb
 zGal7nGCSe+fCtAWz0s4zGo41xf8B59CXEY8BWqLAOYgwY7X/4KhRO3/91jz6bXzZ+Zo
 /QPekKWnzkKDf+bIVe6+XEi32DTU0VYMyEBLbrw05mfdSacx6TAMcfiTzI4MpORnyMzd
 HjAOyty73jGz1qwmQ3B/onqs1WM6VduDW76VvTmFf8Lu1PjoNWiOl0SqvtSuEGX4KVjX
 vV8muixd4GRBDJysYFno1LCmUQQ5GjBzt9HNBLW345RGOz6zdNSJaUEFDc/PQx7d8Qob
 elTg==
X-Gm-Message-State: APjAAAXdQio/0k8k9r+KfevkKGrcoZKb1ZtCTVr5m6ge0a5PXlSvqrWQ
 aL/b/goiQ85rlCCwuOnaZrk=
X-Google-Smtp-Source: APXvYqzc9owyZiEIkTs7gOcA6/mNU6W029/LpmhwbeZvUlJfeH3ec+8FXxZztntc3uJzsrtjhPjtbA==
X-Received: by 2002:a63:3196:: with SMTP id
 x144mr83100783pgx.319.1577871616059; 
 Wed, 01 Jan 2020 01:40:16 -0800 (PST)
Received: from wambui ([197.237.61.225])
 by smtp.gmail.com with ESMTPSA id r14sm59314953pfh.10.2020.01.01.01.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 01:40:15 -0800 (PST)
Date: Wed, 1 Jan 2020 12:40:03 +0300
From: Wambui Karuga <wambui.karugax@gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH] drm/nouveau: declare constants as unsigned long.
Message-ID: <20200101094003.GA5673@wambui>
References: <20191231205345.32615-1-wambui.karugax@gmail.com>
 <CAKb7Uvii6RTp3FsX6z+4VuX6xcS9_SQ+CMC-UBOHVJY5BeWgew@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7Uvii6RTp3FsX6z+4VuX6xcS9_SQ+CMC-UBOHVJY5BeWgew@mail.gmail.com>
X-Mailman-Approved-At: Wed, 01 Jan 2020 11:13:41 +0000
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
Reply-To: CAKb7Uvii6RTp3FsX6z+4VuX6xcS9_SQ+CMC-UBOHVJY5BeWgew@mail.gmail.com
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 31, 2019 at 06:53:55PM -0500, Ilia Mirkin wrote:
> Probably want ULL for 32-bit arches to be correct here too.
> 
Okay, I can convert them to ULL and send a v2.

Thanks,
wambui.

> On Tue, Dec 31, 2019 at 3:53 PM Wambui Karuga <wambui.karugax@gmail.com> wrote:
> >
> > Explicitly declare constants are unsigned long to address the following
> > sparse warnings:
> > warning: constant is so big it is long
> >
> > Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c | 2 +-
> >  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c | 2 +-
> >  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c | 2 +-
> >  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c | 2 +-
> >  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c | 2 +-
> >  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c | 2 +-
> >  6 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c
> > index ac87a3b6b7c9..506b358fcdb6 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c
> > @@ -655,7 +655,7 @@ gf100_ram_new_(const struct nvkm_ram_func *func,
> >
> >  static const struct nvkm_ram_func
> >  gf100_ram = {
> > -       .upper = 0x0200000000,
> > +       .upper = 0x0200000000UL,
> >         .probe_fbp = gf100_ram_probe_fbp,
> >         .probe_fbp_amount = gf100_ram_probe_fbp_amount,
> >         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c
> > index 70a06e3cd55a..3bc39895bbce 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c
> > @@ -43,7 +43,7 @@ gf108_ram_probe_fbp_amount(const struct nvkm_ram_func *func, u32 fbpao,
> >
> >  static const struct nvkm_ram_func
> >  gf108_ram = {
> > -       .upper = 0x0200000000,
> > +       .upper = 0x0200000000UL,
> >         .probe_fbp = gf100_ram_probe_fbp,
> >         .probe_fbp_amount = gf108_ram_probe_fbp_amount,
> >         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
> > index 456aed1f2a02..d01f32c0956a 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
> > @@ -1698,7 +1698,7 @@ gk104_ram_new_(const struct nvkm_ram_func *func, struct nvkm_fb *fb,
> >
> >  static const struct nvkm_ram_func
> >  gk104_ram = {
> > -       .upper = 0x0200000000,
> > +       .upper = 0x0200000000UL,
> >         .probe_fbp = gf100_ram_probe_fbp,
> >         .probe_fbp_amount = gf108_ram_probe_fbp_amount,
> >         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c
> > index 27c68e3f9772..e24ac664eb15 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c
> > @@ -33,7 +33,7 @@ gm107_ram_probe_fbp(const struct nvkm_ram_func *func,
> >
> >  static const struct nvkm_ram_func
> >  gm107_ram = {
> > -       .upper = 0x1000000000,
> > +       .upper = 0x1000000000UL,
> >         .probe_fbp = gm107_ram_probe_fbp,
> >         .probe_fbp_amount = gf108_ram_probe_fbp_amount,
> >         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c
> > index 6b0cac1fe7b4..17994cbda54b 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c
> > @@ -48,7 +48,7 @@ gm200_ram_probe_fbp_amount(const struct nvkm_ram_func *func, u32 fbpao,
> >
> >  static const struct nvkm_ram_func
> >  gm200_ram = {
> > -       .upper = 0x1000000000,
> > +       .upper = 0x1000000000UL,
> >         .probe_fbp = gm107_ram_probe_fbp,
> >         .probe_fbp_amount = gm200_ram_probe_fbp_amount,
> >         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
> > index adb62a6beb63..7a07a6ed4578 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
> > @@ -79,7 +79,7 @@ gp100_ram_probe_fbpa(struct nvkm_device *device, int fbpa)
> >
> >  static const struct nvkm_ram_func
> >  gp100_ram = {
> > -       .upper = 0x1000000000,
> > +       .upper = 0x1000000000UL,
> >         .probe_fbp = gm107_ram_probe_fbp,
> >         .probe_fbp_amount = gm200_ram_probe_fbp_amount,
> >         .probe_fbpa_amount = gp100_ram_probe_fbpa,
> > --
> > 2.17.1
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
