Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA70B1419D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 20:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0B710E568;
	Mon, 28 Jul 2025 18:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uw7u9BM1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D385610E567;
 Mon, 28 Jul 2025 18:00:32 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-23fc4b64b6eso3290045ad.3; 
 Mon, 28 Jul 2025 11:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753725632; x=1754330432; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XoqYYinGUT1hY70tZp5kDiOhRrEJYw5q7X2gewe+7GE=;
 b=Uw7u9BM1OzRD/jebU39dCsF1smA0o2CQJH6BgRJIoC7niCda8gLUdWaCMI3799vGfX
 UMIYvc535F4kWiMrtAZZ/lH5tOnotoc/fX/oI0fIM+1zwEy6X+Ewtn3Ih4IW5ROtwbMr
 B5tlmyRIJl/DHGi29gaDcKa0wF/Cg0JelxooGdIl6g1mCkQHGs+667uaObwg6Olmk3aY
 Ih85eQpH/0doPj/n13vWZASyaYrFgEJB1apC9mWl7iwOG4Xq0COudAMPW46TiBflsKMo
 z5oZDp6m5OVEtBq/DC0WD8IzlBcG5LkvUaio+iCjc8KhHPG3Qkzt9xcDCopUY2wPqlvd
 atGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753725632; x=1754330432;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XoqYYinGUT1hY70tZp5kDiOhRrEJYw5q7X2gewe+7GE=;
 b=kIwDvcjby2o2YcDayryennU5mYtu3cP6pW8oVheMgGwZgsIET1/VX6kaKDtPDYiNqm
 iV9pv2IN/BfGHAbRm1+Z4zrGic3tpALlswpnP/+tJHtEDR3sZ/05h/+fWAGEokf6VTYy
 617xD9tIo1OPuUpGp34Pe7f6AI740+P9j1yN1qmoNP2YRcNua1SxjZeSyoE2SSz+FGUh
 hsXMoHMJHbe5jJaMou2efpslqnDTGPA6BEeguchzMzquvbglbK9yFCOh+R1tuYzScNox
 OMbxSOkNXbiqr8XL3WnlAf4wKSgzz4RLKxPk4DwI9nt8bICasFKiHX7TbJhjK+ARdnnT
 7SuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzNISPiZbhmm5+WjsZH/a96kGOpvNNngC9KH7bU+tyj207SpYqTYgPpcjq7jb/8SYstIJWsU7n21k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWfqUU5YF/Hs91xd+CR6ThfmUfyfeRwfQTdaZP4HLX8br84B2+
 8Y9g+87L3Twbv5cCa6WcQctUqUiDjMcS9vZhf1J1d2+o+0NmO+saK+iYSw+Tr4z8UyuBvrJngek
 p7szj1BKyPXDh0jwABlGEYlqInnNVhPU=
X-Gm-Gg: ASbGnctddnbe+s21gVmYltoqKPY9/trIhIoBImyLOOg8HupiZicFARdnVRNlkqu6F6z
 KkrslSwIJ5dJ3m8DbXT5RJIT18i6trYUZUJYNOXIFgimL6HS8mOqbItkHtwunLhzmr6TST+Eao/
 XiEA2dxnBWqzANyjRW8SBh+PaMbATdTwkTCYc8tKG+pDky/E7AO/uLgrU9kTrfFo45dTVMvRnCh
 cqScD1YEd76pjLuCv0=
X-Google-Smtp-Source: AGHT+IEVkGues0dVewLJgtAazrp1hjhHH6TcJVTYrQwHgQlASHSNcB1TLzTatAQ+AU1xf/16ViJHiWcanzgH44dC6nc=
X-Received: by 2002:a17:903:2f83:b0:234:f1b5:6e9b with SMTP id
 d9443c01a7336-23fb304f98emr80326785ad.1.1753725632049; Mon, 28 Jul 2025
 11:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250718195738.2919761-1-alexander.deucher@amd.com>
 <20250718195738.2919761-2-alexander.deucher@amd.com>
In-Reply-To: <20250718195738.2919761-2-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Jul 2025 14:00:20 -0400
X-Gm-Features: Ac12FXxqU4dnR4e1GKwGWwKCkIvagoTfuvQVfocsowIYbc_ViPAe3d2evQTlq_Q
Message-ID: <CADnq5_MYd2Wdshze+HQtD6wsqStqSTw9ar8+CR_LeKiLpG5pAg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/amdgpu: update mmhub 3.3 client id mappings
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

ping?

On Fri, Jul 18, 2025 at 4:08=E2=80=AFPM Alex Deucher <alexander.deucher@amd=
.com> wrote:
>
> Update the client id mapping so the correct clients
> get printed when there is a mmhub page fault.
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c | 104 +++++++++++++++++++++++-
>  1 file changed, 103 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c b/drivers/gpu/drm/am=
d/amdgpu/mmhub_v3_3.c
> index bc3d6c2fc87a4..9ae811d9a9dd5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c
> @@ -40,30 +40,128 @@
>
>  static const char *mmhub_client_ids_v3_3[][2] =3D {
>         [0][0] =3D "VMC",
> +       [1][0] =3D "ISPXT",
> +       [2][0] =3D "ISPIXT",
>         [4][0] =3D "DCEDMC",
>         [6][0] =3D "MP0",
>         [7][0] =3D "MP1",
>         [8][0] =3D "MPM",
> +       [9][0] =3D "ISPPDPRD",
> +       [10][0] =3D "ISPCSTATRD",
> +       [11][0] =3D "ISPBYRPRD",
> +       [12][0] =3D "ISPRGBPRD",
> +       [13][0] =3D "ISPMCFPRD",
> +       [14][0] =3D "ISPMCFPRD1",
> +       [15][0] =3D "ISPYUVPRD",
> +       [16][0] =3D "ISPMCSCRD",
> +       [17][0] =3D "ISPGDCRD",
> +       [18][0] =3D "ISPMERD",
> +       [22][0] =3D "ISPXT1",
> +       [23][0] =3D "ISPIXT1",
>         [24][0] =3D "HDP",
>         [25][0] =3D "LSDMA",
>         [26][0] =3D "JPEG",
>         [27][0] =3D "VPE",
> +       [28][0] =3D "VSCH",
>         [29][0] =3D "VCNU",
>         [30][0] =3D "VCN",
> +       [1][1] =3D "ISPXT",
> +       [2][1] =3D "ISPIXT",
>         [3][1] =3D "DCEDWB",
>         [4][1] =3D "DCEDMC",
>         [6][1] =3D "MP0",
>         [7][1] =3D "MP1",
>         [8][1] =3D "MPM",
> +       [9][1] =3D "ISPPDPWR",
> +       [10][1] =3D "ISPCSTATWR",
> +       [11][1] =3D "ISPBYRPWR",
> +       [12][1] =3D "ISPRGBPWR",
> +       [13][1] =3D "ISPMCFPWR",
> +       [14][1] =3D "ISPMCFPWR1",
> +       [15][1] =3D "ISPYUVPWR",
> +       [16][1] =3D "ISPMCSCWR",
> +       [17][1] =3D "ISPGDCWR",
> +       [18][1] =3D "ISPMEWR",
> +       [20][1] =3D "ISPMWR2",
> +       [21][1] =3D "OSSSYS",
> +       [22][1] =3D "ISPXT1",
> +       [23][1] =3D "ISPIXT1",
>         [21][1] =3D "OSSSYS",
>         [24][1] =3D "HDP",
>         [25][1] =3D "LSDMA",
>         [26][1] =3D "JPEG",
>         [27][1] =3D "VPE",
> +       [28][1] =3D "VSCH",
>         [29][1] =3D "VCNU",
>         [30][1] =3D "VCN",
>  };
>
> +static const char *mmhub_client_ids_v3_3_1[][2] =3D {
> +       [0][0] =3D "VMC",
> +       [4][0] =3D "DCEDMC",
> +       [6][0] =3D "MP0",
> +       [7][0] =3D "MP1",
> +       [8][0] =3D "MPM",
> +       [24][0] =3D "HDP",
> +       [25][0] =3D "LSDMA",
> +       [26][0] =3D "JPEG0",
> +       [27][0] =3D "VPE0",
> +       [28][0] =3D "VSCH",
> +       [29][0] =3D "VCNU0",
> +       [30][0] =3D "VCN0",
> +       [32+1][0] =3D "ISPXT",
> +       [32+2][0] =3D "ISPIXT",
> +       [32+9][0] =3D "ISPPDPRD",
> +       [32+10][0] =3D "ISPCSTATRD",
> +       [32+11][0] =3D "ISPBYRPRD",
> +       [32+12][0] =3D "ISPRGBPRD",
> +       [32+13][0] =3D "ISPMCFPRD",
> +       [32+14][0] =3D "ISPMCFPRD1",
> +       [32+15][0] =3D "ISPYUVPRD",
> +       [32+16][0] =3D "ISPMCSCRD",
> +       [32+17][0] =3D "ISPGDCRD",
> +       [32+18][0] =3D "ISPMERD",
> +       [32+22][0] =3D "ISPXT1",
> +       [32+23][0] =3D "ISPIXT1",
> +       [32+26][0] =3D "JPEG1",
> +       [32+27][0] =3D "VPE1",
> +       [32+29][0] =3D "VCNU1",
> +       [32+30][0] =3D "VCN1",
> +       [3][1] =3D "DCEDWB",
> +       [4][1] =3D "DCEDMC",
> +       [6][1] =3D "MP0",
> +       [7][1] =3D "MP1",
> +       [8][1] =3D "MPM",
> +       [21][1] =3D "OSSSYS",
> +       [24][1] =3D "HDP",
> +       [25][1] =3D "LSDMA",
> +       [26][1] =3D "JPEG0",
> +       [27][1] =3D "VPE0",
> +       [28][1] =3D "VSCH",
> +       [29][1] =3D "VCNU0",
> +       [30][1] =3D "VCN0",
> +       [32+1][1] =3D "ISPXT",
> +       [32+2][1] =3D "ISPIXT",
> +       [32+9][1] =3D "ISPPDPWR",
> +       [32+10][1] =3D "ISPCSTATWR",
> +       [32+11][1] =3D "ISPBYRPWR",
> +       [32+12][1] =3D "ISPRGBPWR",
> +       [32+13][1] =3D "ISPMCFPWR",
> +       [32+14][1] =3D "ISPMCFPWR1",
> +       [32+15][1] =3D "ISPYUVPWR",
> +       [32+16][1] =3D "ISPMCSCWR",
> +       [32+17][1] =3D "ISPGDCWR",
> +       [32+18][1] =3D "ISPMEWR",
> +       [32+19][1] =3D "ISPMWR1",
> +       [32+20][1] =3D "ISPMWR2",
> +       [32+22][1] =3D "ISPXT1",
> +       [32+23][1] =3D "ISPIXT1",
> +       [32+26][1] =3D "JPEG1",
> +       [32+27][1] =3D "VPE1",
> +       [32+29][1] =3D "VCNU1",
> +       [32+30][1] =3D "VCN1",
> +};
> +
>  static uint32_t mmhub_v3_3_get_invalidate_req(unsigned int vmid,
>                                                 uint32_t flush_type)
>  {
> @@ -102,12 +200,16 @@ mmhub_v3_3_print_l2_protection_fault_status(struct =
amdgpu_device *adev,
>
>         switch (amdgpu_ip_version(adev, MMHUB_HWIP, 0)) {
>         case IP_VERSION(3, 3, 0):
> -       case IP_VERSION(3, 3, 1):
>         case IP_VERSION(3, 3, 2):
>                 mmhub_cid =3D cid < ARRAY_SIZE(mmhub_client_ids_v3_3) ?
>                             mmhub_client_ids_v3_3[cid][rw] :
>                             cid =3D=3D 0x140 ? "UMSCH" : NULL;
>                 break;
> +       case IP_VERSION(3, 3, 1):
> +               mmhub_cid =3D cid < ARRAY_SIZE(mmhub_client_ids_v3_3_1) ?
> +                           mmhub_client_ids_v3_3_1[cid][rw] :
> +                           cid =3D=3D 0x140 ? "UMSCH" : NULL;
> +               break;
>         default:
>                 mmhub_cid =3D NULL;
>                 break;
> --
> 2.50.1
>
