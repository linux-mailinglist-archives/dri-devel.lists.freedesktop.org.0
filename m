Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904AF8039E9
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 17:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D6310E28D;
	Mon,  4 Dec 2023 16:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B4A10E0F8;
 Mon,  4 Dec 2023 16:16:01 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-58d18c224c7so2806872eaf.2; 
 Mon, 04 Dec 2023 08:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701706561; x=1702311361; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d3Rq26SmtNxjBHL+7sodH6Y3hH55K8uHLftxea/5aOE=;
 b=Oq3vy+umz1q4tuwxnTX4RGTZI/5DHjdTyLLMJfAiL5LLTUxnFsQbReOc/6yU/g9I44
 7Ovixj/OHHiTrCnPr76VPWaIDajSxuHlJFmrwGZAjwFldAebXG2IvDCPeEr4ZB1e6ScA
 kTaWv+8GXWVrEGCjpmYEAsIHUVBRmt2xpNl01auIER7z0lrgudd0IJP0IfmVd/nXTSKX
 qWauYjM+qjf2j+mn7Y7KknmwRJfwaOuytQCG7IyGVnFLHNzbfZpqHJRNkO89EjbKdOtb
 hudc47RBjhBviaMWFN3GvuiieLD8f/L86C4xtrPdTJR6HzyRzcXhCMYDDkYNlZGFQW3e
 Zgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701706561; x=1702311361;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d3Rq26SmtNxjBHL+7sodH6Y3hH55K8uHLftxea/5aOE=;
 b=WA80zXgGrAEzkkMOsa74GYT+qi8Rv4rqHMcK+vWHEvoMpRjhlb+vwgDRwiJaS7SANN
 Yg8cPLR/fJYggYHMa6LfNp6XI9V7XFkn5rT0QHSNb0AN8o/bSVNoXkWKFeEPQaTk91Om
 Fuu1V/DDj16C0F6i70RfsFmzEH7/iQ614GijgA4K/+5Hjda6cC3aiQ/YkFEQWUvx6BsB
 P+k1eO3BQhkRee6i7coaWW/RkBBOqK45a4/Em9ITfWSh9IUFhjkzU1mB4cNchcx0Myhg
 9+X40h/bvUuhncTmDEnegv4r21fcWlvycaOSS95N2yTpaQ+DFltbdx2RpnKzjNdxL3Cp
 nDtA==
X-Gm-Message-State: AOJu0Yz0iKN+xAESOGT9qzcy4xC5tMjwVt5sEn3uTD05mRxuYc1DC6BS
 sduDBP5MXaORR7v5rBsb+ctnqeLK7M7tsKYz0Rs=
X-Google-Smtp-Source: AGHT+IHeMg3IqYv1oObxg/a3nddlTB0cG433u6nB+9rzQjWp1RCFYTc4EHF1sSTYAthQMD9Dil0L+gzurrYUA6JyMAM=
X-Received: by 2002:a05:6870:c152:b0:1fb:75a:778d with SMTP id
 g18-20020a056870c15200b001fb075a778dmr4120921oad.62.1701706560957; Mon, 04
 Dec 2023 08:16:00 -0800 (PST)
MIME-Version: 1.0
References: <20231204090852.1650-1-tzimmermann@suse.de>
In-Reply-To: <20231204090852.1650-1-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 Dec 2023 11:15:49 -0500
Message-ID: <CADnq5_PRqcugQHibGbhGb2LvnJ5uEtLFqOf=HQOf8_8zthgt2Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] drm/plane-helpers: Minor clean ups
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
Cc: amd-gfx@lists.freedesktop.org, suijingfeng@loongson.cn, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 mripard@kernel.org, linux-arm-kernel@lists.infradead.org,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 4, 2023 at 4:09=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Move drm_plane_helper_atomic_check() into udl, which is the only
> driver using it. Remove several unnecessary include statements for
> <drm/drm_plane_helper.h>.
>
> v2:
>         * fix documentation (Sui)
>
> Thomas Zimmermann (8):
>   drm/plane-helper: Move drm_plane_helper_atomic_check() into udl
>   drm/amdgpu: Do not include <drm/drm_plane_helper.h>
>   drm/loongson: Do not include <drm/drm_plane_helper.h>
>   drm/shmobile: Do not include <drm/drm_plane_helper.h>
>   drm/solomon: Do not include <drm/drm_plane_helper.h>
>   drm/ofdrm: Do not include <drm/drm_plane_helper.h>
>   drm/simpledrm: Do not include <drm/drm_plane_helper.h>
>   drm/xlnx: Do not include <drm/drm_plane_helper.h>

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

>
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  1 -
>  drivers/gpu/drm/drm_crtc_helper.c             |  7 ++--
>  drivers/gpu/drm/drm_plane_helper.c            | 32 -------------------
>  drivers/gpu/drm/loongson/lsdc_plane.c         |  1 -
>  .../drm/renesas/shmobile/shmob_drm_plane.c    |  1 -
>  drivers/gpu/drm/solomon/ssd130x.h             |  1 -
>  drivers/gpu/drm/tiny/ofdrm.c                  |  1 -
>  drivers/gpu/drm/tiny/simpledrm.c              |  1 -
>  drivers/gpu/drm/udl/udl_modeset.c             | 19 +++++++++--
>  drivers/gpu/drm/xlnx/zynqmp_kms.c             |  1 -
>  include/drm/drm_plane_helper.h                |  2 --
>  11 files changed, 19 insertions(+), 48 deletions(-)
>
> --
> 2.43.0
>
