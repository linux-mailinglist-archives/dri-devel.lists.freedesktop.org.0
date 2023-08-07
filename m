Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEA9772C20
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FE310E321;
	Mon,  7 Aug 2023 17:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC43210E321;
 Mon,  7 Aug 2023 17:10:08 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1bf08ca187cso3522870fac.3; 
 Mon, 07 Aug 2023 10:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428208; x=1692033008;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YVnv4Pt11q/ZKsoCJD2SAX36HKBbik8lLwU9hV+RPkI=;
 b=oywPoegN13kmjmfc1hbMrkM6c8UhdKOpLvWPnCis7HDZzdByg9orxAspo3B5FX2T19
 u6BUE3G9LTpdj2mR9LBaeVDgspHapuIVLCmE7M3LDyK4BnLBIkcb0PFRgvTxVIRw0Q3S
 Km0qyzEdOdFE7W34yBmgk/xVOuI0lL3TJ+KBhwCDtlqr9SsnqTEXgzE27SFXnQQ2qFTT
 Pbrl6kibusLcdiP2M/LC0k4Kg6t+kcXMYiOTUv4+CYYhQuxNtK4U7AGT3Cw0ek7cqM0b
 /UdopVVPDvkBXNqdhL0NH4e3PU44lN2R+jAytKTEvJXXjlp+5F2yIe3DfQBgPuHzP3VA
 xZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428208; x=1692033008;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YVnv4Pt11q/ZKsoCJD2SAX36HKBbik8lLwU9hV+RPkI=;
 b=DzEFLsikB92ke32C2EnWWkPHDHVPdYZ9XwmMfa8O0djV4/QwjsZuIxVVZtMH3VbdLG
 xzFlBRxNYclAgtm14gxVUXkBfvVcHZECiNeTYWy0jutAX7qFnBVdYNX/3TRTszGbWUC0
 eXE2RD64d79Ht0VVPp7EQMrCtO7hAdpRnQphp1ypi6t16TNgRCU8UN4wVKrFSRVuNZ4W
 Svsy2ZCyJ4PeCWDnATVf4xegzB98iXxTuKdVnMuhKTh3jKq5imcdCMv4dMRq/VShf918
 bJewIWjmg+fwKT+GszW0s8RCXzHyb6UVHSQG2e3f28CXBOrO2zqJWa1kBcGQbGCeF7Ca
 pzhQ==
X-Gm-Message-State: AOJu0Yxd9aBRpPTbPDEOs4MwArUJY2jWxs752f/4ICGu05AtuYXCguPJ
 VPPiOCqJmhrTy8VFpaABCiIfAMF+YFluvMR22dU=
X-Google-Smtp-Source: AGHT+IEGee/UoJizGgd8V5/QtJKZOQUAowC18ZU+CvbPZSqKpklX8z5WMafDRzxaLFJf/Vt/vMup6KocjkmPjs2aFjY=
X-Received: by 2002:a05:6870:a916:b0:1bf:7cdc:df0 with SMTP id
 eq22-20020a056870a91600b001bf7cdc0df0mr11644328oab.35.1691428208036; Mon, 07
 Aug 2023 10:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230802025443.10458-1-sunran001@208suo.com>
In-Reply-To: <20230802025443.10458-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:09:57 -0400
Message-ID: <CADnq5_MedA1DMxAqAjg5EOYo65cguZdF0etHV=Q0NHahcchw0A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Clean up errors in dce112_hw_sequencer.c
To: Ran Sun <sunran001@208suo.com>
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 1, 2023 at 10:54=E2=80=AFPM Ran Sun <sunran001@208suo.com> wrot=
e:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: space required before the open brace '{'
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dce112/dce112_hw_sequencer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce112/dce112_hw_sequencer.c =
b/drivers/gpu/drm/amd/display/dc/dce112/dce112_hw_sequencer.c
> index 690caaaff019..0ef9ebb3c1e2 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce112/dce112_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce112/dce112_hw_sequencer.c
> @@ -127,7 +127,7 @@ static bool dce112_enable_display_power_gating(
>         else
>                 cntl =3D ASIC_PIPE_DISABLE;
>
> -       if (power_gating !=3D PIPE_GATING_CONTROL_INIT || controller_id =
=3D=3D 0){
> +       if (power_gating !=3D PIPE_GATING_CONTROL_INIT || controller_id =
=3D=3D 0) {
>
>                 bp_result =3D dcb->funcs->enable_disp_power_gating(
>                                                 dcb, controller_id + 1, c=
ntl);
> --
> 2.17.1
>
