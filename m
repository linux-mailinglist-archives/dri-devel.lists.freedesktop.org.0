Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0634223429A
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 11:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248886EA49;
	Fri, 31 Jul 2020 09:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DC36EA49
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 09:25:26 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f18so27359051wrs.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 02:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=W7elt/3QM3fA/Gme2KdbanyGQczEnz6cPgRVDqnh0MQ=;
 b=iMis5uSMJZ4dxy7sNg9hqQtMhwfW6UIBNGE5Tmsubd35OsnleyjQWHDMfPl54TnEN/
 Ltll5XcOEpMjU0lKNB4Bl2ipt8IdKEeoxTb+mHJghXoSUadN82rdnFRtuEOgdXfwr3XZ
 hUty4Iq24nw9YDP9mpV7Ytuh+sur9vX1s5JwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=W7elt/3QM3fA/Gme2KdbanyGQczEnz6cPgRVDqnh0MQ=;
 b=tjoVq32XhBgYouvR/0Fd80ImhSEMC42Fo7oIZVwcTe+3GZI/FTrgkzW1n8vlgiIotn
 RxsAV8qleDg3wL4zPIjoizxAYkWXzHHt+xvRetAr60n0VVwHhDJN2bHqdSNyLgT7T7AI
 xqRgGUtdKXcdSEySISiBIY/NEeHQFW1NUBzos8c/Y0tEsaTed66aG0Gb2EKUWL2TunWX
 cq2UL/yVf8pIz5iJQZ0E6aZ/UjnlkmtbkQFrkP4PImG7z0XG0RJeepFEbg5ZyXt1J34B
 m5FEXXm9oT60f0Wrm6bGFWKZipJOEXd8lH/dk32/dlMnCJhe20MdctEAooVE0BQq+hqs
 CqWg==
X-Gm-Message-State: AOAM532HdfcjKdj1p7zf6CAIhNqY7G3AuEH+FtYu9vl4R2kCrRzq9xOj
 YRanochj71S6/iSBcSzb5qA8Kw==
X-Google-Smtp-Source: ABdhPJwMBKf4Rrzu6gmQ0/yuvOxsHQU8Z2SyuuqOGMVzWz+zdAF7XTahzEp8A1WVZsOxRGcM7U4QIA==
X-Received: by 2002:a5d:6a42:: with SMTP id t2mr2583103wrw.13.1596187525597;
 Fri, 31 Jul 2020 02:25:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z11sm12149342wrw.93.2020.07.31.02.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 02:25:25 -0700 (PDT)
Date: Fri, 31 Jul 2020 11:25:23 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH] Added orientation quirk for ASUS tablet model T103HAF
Message-ID: <20200731092523.GX6419@phenom.ffwll.local>
References: <7d86140e-cf6b-ba96-c6fd-02f4d3da246e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d86140e-cf6b-ba96-c6fd-02f4d3da246e@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 29, 2020 at 05:54:16PM +0300, Marius Iacob wrote:
> From 06ba7d3e64e55262bf818084904eec7b7320a2ad Mon Sep 17 00:00:00 2001
> From: Marius Iacob <themariusus@gmail.com>
> Date: Wed, 29 Jul 2020 16:51:41 +0300
> Subject: [PATCH] Added orientation quirk for ASUS tablet model T103HAF

Please format the patch per

https://www.kernel.org/doc/html/latest/process/submitting-patches.html

- subject needs drm: prefix
- signed-off-by missing
- git apply-mbox fails to parse this, don't just paste the output of
  something like git show, that doesn't work

Yes I know the kernel process isn't very friendly for newbies, apologies.
-Daniel
> =

> ---
> =A0drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
> =A01 file changed, 6 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index d00ea384dcbf..58f5dc2f6dd5 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -121,6 +121,12 @@ static const struct dmi_system_id orientation_data[]=
 =3D
> {
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DMI_EXACT_MATCH(DMI_P=
RODUCT_NAME, "T101HA"),
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 },
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .driver_data =3D (void *)&l=
cd800x1280_rightside_up,
> +=A0=A0=A0=A0=A0=A0 }, {=A0=A0=A0 /* Asus T103HAF */
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .matches =3D {
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DMI_EXACT_MATCH(DMI_SYS=
_VENDOR, "ASUSTeK COMPUTER INC."),
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DMI_EXACT_MATCH(DMI_PRO=
DUCT_NAME, "T103HAF"),
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 },
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .driver_data =3D (void *)&lcd=
800x1280_rightside_up,
> =A0=A0=A0=A0=A0=A0=A0 }, {=A0=A0=A0 /* GPD MicroPC (generic strings, also=
 match on bios date) */
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .matches =3D {
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DMI_EXACT_MATCH(DMI_S=
YS_VENDOR, "Default string"),
> --
> 2.27.0
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
