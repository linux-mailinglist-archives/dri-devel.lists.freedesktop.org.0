Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49108760148
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 23:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A26E10E361;
	Mon, 24 Jul 2023 21:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAB110E361;
 Mon, 24 Jul 2023 21:37:32 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1b05d63080cso3793724fac.2; 
 Mon, 24 Jul 2023 14:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690234652; x=1690839452;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TkeAJxpiQ/idMwH3oce7flspbZxR7pnAxBD0GoiDwWc=;
 b=qJcNSDACykX0wO7dRF7oZEWaBkrZyE16690N+KDWr4dqJ7KP5eogFOX8iScGU9tRf6
 RalSvKV4aisQRDuU1UVStNC6KicOiblnyLw5fKZaRwmsHDjhyjas7tO+3TbfGaHgQv/D
 bNjkDmp4Mn3Y23O1t9n+OSJNbE6nv39gp6BRcDK7AtkzL02oPnRbsyEBu2ozsUKTJ3lz
 eeowAV4EaUj06x5dyFCynqNNHdcIFmbNNxZzY2V/4OJXyrZs2C6OXjdOzeBkgsi8MoQ5
 Yof3CcpZQulvMICOKHbRGtp1o22d6WjKD+11vnIxgvLYH4/oNfumYLqm9DB37VuOtsNd
 1UOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690234652; x=1690839452;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TkeAJxpiQ/idMwH3oce7flspbZxR7pnAxBD0GoiDwWc=;
 b=XOnT0wNCe6jrUUI7/c1rWbVw/iWisA4ztWiCJXMcLgFv+zwLA3GshddT5Jb6Y19LFi
 6nC2cmjXMG46SdHcbv0xFNwI9667SU8Cb8TmPvqEGb7N8FLBPCd257a/qk5H0bI9ndiY
 O0kPMtowaMu0+QwdRCIlKsAnTU5r75xtWJ5tkqnpLzGUUUxx5IqToHrG1mSpPDseDQTr
 WIKmiunGhAKNqim+yiEW7WW8k5/0xdYTRUbAw2INK/zuBS94PLLjbDpgFjonIkZtfAZ+
 8aojkK1CUGEN4FxUdPRRp1G/ov7ywsK8JTpu/4wxoW/YNAgZgfFi65tYJINPHgT1Mrgt
 VtAQ==
X-Gm-Message-State: ABy/qLa5UDMosjC4vaYVi7MWcBqsrf7fiF/hbjYJNB26dMIvHWwBEMVP
 jG9qft2HwvpJC1PG00tmsiM7uMoOqV3As7wunFU=
X-Google-Smtp-Source: APBJJlGfrk7DFyXtuArhwvbQsVqEisNZyrJjTn2guuq84bwAVoiRtL89ugXI7wZM8khf30yUEb9pTY4OQLTWdMWRiQM=
X-Received: by 2002:a05:6871:90:b0:1b0:7078:5889 with SMTP id
 u16-20020a056871009000b001b070785889mr13832510oaa.12.1690234651777; Mon, 24
 Jul 2023 14:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230724031126.7694-1-xujianghui@cdjrlc.com>
 <3a9a96f2b98642a86bdc33c3149cac97@208suo.com>
In-Reply-To: <3a9a96f2b98642a86bdc33c3149cac97@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jul 2023 17:37:20 -0400
Message-ID: <CADnq5_M5ARBP2mV07=5Yv5U5UhEchDCB2L00z-hLDQqDFkNS9A@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: that open brace { should be on the previous
 line
To: sunran001@208suo.com
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 23, 2023 at 11:12=E2=80=AFPM <sunran001@208suo.com> wrote:
>
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/radeon/ni_dpm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/ni_dpm.c
> b/drivers/gpu/drm/radeon/ni_dpm.c
> index a101ba00ea30..1cf4de4cda23 100644
> --- a/drivers/gpu/drm/radeon/ni_dpm.c
> +++ b/drivers/gpu/drm/radeon/ni_dpm.c
> @@ -625,7 +625,7 @@ static const u32 cayman_mgcg_disable[] =3D
>   };
>   #define CAYMAN_MGCG_DISABLE_LENGTH   sizeof(cayman_mgcg_disable) / (3 *
> sizeof(u32))
>
> -static const u32 cayman_mgcg_enable[] =3D :621 {
> +static const u32 cayman_mgcg_enable[] =3D : 621 {

Something weird here.

Alex

>         0x0000802c, 0xc0000000, 0xffffffff,
>         0x000008f8, 0x00000000, 0xffffffff,
>         0x000008fc, 0x00000000, 0xffffffff,
