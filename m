Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F616792C78
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 19:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B29910E021;
	Tue,  5 Sep 2023 17:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6CA10E021;
 Tue,  5 Sep 2023 17:34:09 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3ab2a0391c0so1863540b6e.1; 
 Tue, 05 Sep 2023 10:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693935249; x=1694540049; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KfuowvwObkut1KV19PYoCVuKvUfR++LVS9zQ0uZCb2Q=;
 b=DZUGxM9d+ZVDjiDN49rbYYg26ggQzTzfdpQGDFIecSNWO7p+QaFPecmN1YnTInG5dz
 eGWQ5mHmMlErZzUzuggkbTNdzxfI9D5x+kpW4dGUveHF7Q/uJAWjIKmXoULDDici5YgG
 GgeDiBdT3ETQ+GQlxN9rH5It8rego9Xdew3ZNQiTN7XjvSnFsLn5j1F6VmzGL0lNCeFh
 8RbhaBSJKDJ7adZrRUu83Nnf7ni1hpwoPTWbFgwpJIv4SA++HzQu+4HUdNPNCowEBU2K
 TwnT41KCPde/+Y6IS06gTC/oSRg+NBvH+zXxd7qreR7CIgtflWCO4Dh3DIsKacVR9o3y
 RgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693935249; x=1694540049;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KfuowvwObkut1KV19PYoCVuKvUfR++LVS9zQ0uZCb2Q=;
 b=Np1dDT7cMFqH6zIhPfUAgpRkFbHjMq4D4aeWlcOABy8kGSpXIDeHUjpTE2P5bsccx6
 aNn1JutRzuB0zluNOilyIsk30agOgM/jouqL3jkDBhaYQT2FTwUhyTeHbBa103Q1rDqV
 Ia36G2IGOsm27oHrZblcoDM3pVFF5FipnjxVvMzcMXe7bzt4zJhslgdOD2GGX015FcGm
 zLCt1DbA8DpdQQi4NcZOq9/e0T1XpUtrbCe2NPRWG9YYG4ClChkqvR/0AuCYb4TDRcBf
 F6z2FWvi+kWUfcB1IhzaQZLEaLlONA6pWjNPIGaXbcn0hUrQInjycxao5bYnsrdRGnfh
 SHXQ==
X-Gm-Message-State: AOJu0YzQels5VT0IfiZYavc+YMpm+Zr/3bioi5hcUOb4HgOGg80ccoxj
 MX2wUow5pDjbDVFVEew94v7ne39n1jN/rSEV4zM=
X-Google-Smtp-Source: AGHT+IGg9ylwZSq88bEkF4d97ifutJU9DeuhtEPm9/ygCOF+DF9FwTwAk5NeAM2D74H+Rh1cSaJp9GP5hbCPYf+4PRM=
X-Received: by 2002:a05:6808:1406:b0:3a8:f3e7:d691 with SMTP id
 w6-20020a056808140600b003a8f3e7d691mr20687345oiv.37.1693935249151; Tue, 05
 Sep 2023 10:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230901005226.42307-1-yang.lee@linux.alibaba.com>
 <20230901005226.42307-2-yang.lee@linux.alibaba.com>
In-Reply-To: <20230901005226.42307-2-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 5 Sep 2023 13:33:58 -0400
Message-ID: <CADnq5_PRu+gzh5LHobvwN-uHaTShEoBn3rjx4C0Pc1O0mv2G=g@mail.gmail.com>
Subject: Re: [PATCH -next 2/4] drm/amd/display: Remove duplicated include in
 dcn35_optc.c
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Aug 31, 2023 at 8:52=E2=80=AFPM Yang Li <yang.lee@linux.alibaba.com=
> wrote:
>
> ./drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c: dcn35_optc.h is incl=
uded more than once.
>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c b/drivers/=
gpu/drm/amd/display/dc/dcn35/dcn35_optc.c
> index d64be1a5071c..2bea1e475096 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c
> @@ -23,7 +23,6 @@
>   */
>
>  #include "dcn35_optc.h"
> -#include "dcn35_optc.h"
>
>  #include "dcn30/dcn30_optc.h"
>  #include "dcn31/dcn31_optc.h"
> --
> 2.20.1.7.g153144c
>
