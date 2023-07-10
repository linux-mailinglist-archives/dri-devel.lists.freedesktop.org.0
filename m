Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3AC74DC66
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 19:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5298310E2B4;
	Mon, 10 Jul 2023 17:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3630810E2AF;
 Mon, 10 Jul 2023 17:25:42 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-56352146799so3700257eaf.3; 
 Mon, 10 Jul 2023 10:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689009941; x=1691601941;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QwgPAnsoGImOTpKq/zgwf6map72bf6KrCfvboKElITA=;
 b=DnCRB6tsdzjlZdKHrMnTb+fC53VCqYuDwixkgrKRM5vkGYDJ6nsznyKJbdq55hSYir
 mFzCJQA1nH7WVsRT814upyrlygD8ernOA230UGe35rMY0mRqzasAH9olSl2vrbuMF7GJ
 Hi9NqqnbgQUWtLUHVa4+cQgOxLdcucRMuFEEPCwgLMMYWFBfDAaKCESSQUqk5LLYS9rx
 So7fu0G4QstJOO+fjRuIYdM0Ov+YkF9F3a0ycLNIcK7qqF15+UyKhpdwKyNdqA4yjjdK
 WFqpyuTYa58MYkQT5vNszobbwT6ex9gjhFkYReikjFaICWssNy4t521UH339mhzP3S33
 dHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689009941; x=1691601941;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QwgPAnsoGImOTpKq/zgwf6map72bf6KrCfvboKElITA=;
 b=l23nVXo1RzzlgLhFOisWTSY/KzEiqTgvP2hjHAdjJcoWCbN+kEmvm4zP9EPVhUzvgv
 0MlOu6hcaKro78FehopdjOap005ip9LjXdl2jZep4xYhjzMLkTg9HCoTOmGCdRSVEpnE
 agQt/dBKuUOyULZDVGjQzKuDHz9/TTE/mWQR0fqIVjlselmFWmm3E37+4LsE2rcRacJs
 svvxnKF2ElrBPab3sZPE74OPhf3ptOFvhrwIfTPtzz9C6DUQQLSej37ZCjl8a8cicWDX
 Y73y7WNyCj6L2JV0/76Q8pyETlgziV/Hu2gV3eT4NzlON+drrPufrh1TTVB6houFn7ZB
 LRZQ==
X-Gm-Message-State: ABy/qLZJMlDh5f7YQN/cF5tbm2vWC5uGInX8qXJupMR/z2NsNBm2lrQt
 XARuBr45DMPcaO1Dn13TbSPTMyCuyKkaZwte1oU=
X-Google-Smtp-Source: APBJJlH/RdvKZQnN1ndDfZW8FAy2oHtzFDZlusBzzOd+2kexWvU0EPGCZvfCyy3cnsNAgi5CdTrlDwOygmJybHGlQDk=
X-Received: by 2002:aca:2308:0:b0:3a1:b638:9c2c with SMTP id
 e8-20020aca2308000000b003a1b6389c2cmr11821118oie.55.1689009941122; Mon, 10
 Jul 2023 10:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230710082515.54604-1-xujianghui@cdjrlc.com>
 <0cd737878affc60b7b34d58ea9e10e50@208suo.com>
In-Reply-To: <0cd737878affc60b7b34d58ea9e10e50@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 Jul 2023 13:25:30 -0400
Message-ID: <CADnq5_MAcyk=h8BebxrZ52n0Dsh3vj9PtjEUaD=PfDmhkej-cg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: ERROR: "(foo*)" should be "(foo *)"
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Jul 10, 2023 at 4:27=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> Fix four occurrences of the checkpatch.pl error:
> ERROR: "(foo*)" should be "(foo *)"
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/radeon/radeon_atombios.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c
> b/drivers/gpu/drm/radeon/radeon_atombios.c
> index bf3c411a55c5..85c4bb186203 100644
> --- a/drivers/gpu/drm/radeon/radeon_atombios.c
> +++ b/drivers/gpu/drm/radeon/radeon_atombios.c
> @@ -1389,7 +1389,7 @@ bool radeon_atombios_get_ppll_ss_info(struct
> radeon_device *rdev,
>
>           num_indices =3D (size - sizeof(ATOM_COMMON_TABLE_HEADER)) /
>               sizeof(ATOM_SPREAD_SPECTRUM_ASSIGNMENT);
> -        ss_assign =3D (struct _ATOM_SPREAD_SPECTRUM_ASSIGNMENT*)
> +        ss_assign =3D (struct _ATOM_SPREAD_SPECTRUM_ASSIGNMENT *)
>               ((u8 *)&ss_info->asSS_Info[0]);
>           for (i =3D 0; i < num_indices; i++) {
>               if (ss_assign->ucSS_Id =3D=3D id) {
> @@ -1402,7 +1402,7 @@ bool radeon_atombios_get_ppll_ss_info(struct
> radeon_device *rdev,
>                   ss->refdiv =3D ss_assign->ucRecommendedRef_Div;
>                   return true;
>               }
> -            ss_assign =3D (struct _ATOM_SPREAD_SPECTRUM_ASSIGNMENT*)
> +            ss_assign =3D (struct _ATOM_SPREAD_SPECTRUM_ASSIGNMENT *)
>                   ((u8 *)ss_assign + sizeof(struct
> _ATOM_SPREAD_SPECTRUM_ASSIGNMENT));
>           }
>       }
> @@ -3406,7 +3406,7 @@ static ATOM_VOLTAGE_OBJECT_V2
> *atom_lookup_voltage_object_v2(ATOM_VOLTAGE_OBJECT
>   {
>       u32 size =3D le16_to_cpu(v2->sHeader.usStructureSize);
>       u32 offset =3D offsetof(ATOM_VOLTAGE_OBJECT_INFO_V2,
> asVoltageObj[0]);
> -    u8 *start =3D (u8*)v2;
> +    u8 *start =3D (u8 *)v2;
>
>       while (offset < size) {
>           ATOM_VOLTAGE_OBJECT_V2 *vo =3D (ATOM_VOLTAGE_OBJECT_V2 *)(start=
 +
> offset);
> @@ -3423,7 +3423,7 @@ static ATOM_VOLTAGE_OBJECT_V3
> *atom_lookup_voltage_object_v3(ATOM_VOLTAGE_OBJECT
>   {
>       u32 size =3D le16_to_cpu(v3->sHeader.usStructureSize);
>       u32 offset =3D offsetof(ATOM_VOLTAGE_OBJECT_INFO_V3_1,
> asVoltageObj[0]);
> -    u8 *start =3D (u8*)v3;
> +    u8 *start =3D (u8 *)v3;
>
>       while (offset < size) {
>           ATOM_VOLTAGE_OBJECT_V3 *vo =3D (ATOM_VOLTAGE_OBJECT_V3 *)(start=
 +
> offset);
