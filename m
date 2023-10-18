Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A4F7CDE21
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 15:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0638210E3FA;
	Wed, 18 Oct 2023 13:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08ED10E3F8;
 Wed, 18 Oct 2023 13:59:30 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1e58a522e41so4059125fac.2; 
 Wed, 18 Oct 2023 06:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697637570; x=1698242370; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UJsFVEu0nZS2XQuTUeDLT7XtWcBNpvC9dTMB0YQtl08=;
 b=JAUqtocLqLE/HMdZeXC88mLO6ZJiDtpwkDq6ZYwFzEtfXfTc65daYU7l+ydFHZ+3E4
 p1C4aTTM5majyHIsI+kZdz1k6kzoIVA10ir12WjxBM/FY9syOC03hkefuixY2DFr7EXs
 CHBl26v3tlIJBSoS02TIxIIHMx7oriOaMLKXuQQHclAJvkVo3aJy6pbF2nrl2QzaS+Ra
 s0UoXIFyBUhVNOaSTPexLk+kbnDA1Bc4+wWLaaYborDMG2f6pzlfKiRa5CCg/+CDmpG/
 Bcbdz4ZbheFIQpE+cXgYKGAnHaxUkbL4ILBZKyVUINYxAowfmFhey0D+DBzxugK6bqyX
 5eIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697637570; x=1698242370;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UJsFVEu0nZS2XQuTUeDLT7XtWcBNpvC9dTMB0YQtl08=;
 b=gkLrJw1UokCkrfx8eOb1DH+hF6iwFurYNcjQfK68LA4iX40DfolRT6jYdEohVR71lD
 +W/1x8dYDgyZ/3CYEcHHDP0klOzBJa8zs+kGOl7p16ekYxg0yHeCX9X/srmBC26cCq72
 c3g7BAC3Mlplux9XCzr2m/gA2UVEGnrPdHjb0+wvul9lw3twNbxfbuoc7KHrxpeeNjc7
 qtVGLZbFvD5Q4BtZOBstg4npfEfHJbpahYuE+4lSSk35LtLol52RmpLc/JZObUWXfU2N
 jaEyEY7uZUqunsLnO6iPbp0Yrt1BPsHNQIKnBaovqa8yN7ggtcc+N9BWLmfV4kPOs3Fr
 D2MA==
X-Gm-Message-State: AOJu0Yy5lRRZSq4Z4L9jiRidj1Vmt0V4iQ6wvnPHKKPqqHYv27sli/X8
 HpLSNjwIv0kary4U0VwntX7Ys/I/NE2BoQCYhpjqNqWA
X-Google-Smtp-Source: AGHT+IHcSaXI8TATTgE0uFsyojz0oilu79AqJoPzqbYkazhnwilzrsOpJuwICO2yzMpVi+I/x9RR8bf6OhrrUddnT3U=
X-Received: by 2002:a05:6870:be98:b0:1ea:118d:3e8e with SMTP id
 nx24-20020a056870be9800b001ea118d3e8emr5548202oab.56.1697637570046; Wed, 18
 Oct 2023 06:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231018011614.10883-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20231018011614.10883-1-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 18 Oct 2023 09:59:19 -0400
Message-ID: <CADnq5_M=tRaFQVivkUQqRO1t_RWOgd5=FnRtuo4scAu5eTg+cg@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: Remove unneeded semicolon
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
Cc: Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Oct 17, 2023 at 9:16=E2=80=AFPM Yang Li <yang.lee@linux.alibaba.com=
> wrote:
>
> ./drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c:464:3-4: Un=
needed semicolon
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D6900
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c =
b/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c
> index 36baf35bb170..f45fbe820445 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c
> @@ -461,7 +461,7 @@ static void sort_pipes_for_splitting(struct dc_plane_=
pipe_pool *pipes)
>                                 swapped =3D false;
>                         }
>
> -               };
> +               }
>         }
>  }
>
> --
> 2.20.1.7.g153144c
>
