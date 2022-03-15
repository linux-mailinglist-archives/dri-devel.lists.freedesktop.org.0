Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A06E4D9F50
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 16:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DD310E546;
	Tue, 15 Mar 2022 15:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161CC10E53D;
 Tue, 15 Mar 2022 15:51:41 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 l24-20020a4a8558000000b00320d5a1f938so24907589ooh.8; 
 Tue, 15 Mar 2022 08:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hXJSr2Riukg6sLC81qnw2+4YK/hUVT2VEwcL13m5MRw=;
 b=F5UxW4xBOA4id2EKViUjwaTL2L7Rne8ANhJGB6eRDgcEkf0Ez4sxDLUTUJXuYLH9i/
 ikXZw67iyjjgDfKx3WO1bGSQwoqivnkyzLsPNZNwo3Hk37oUNPplkqnqAcYedC0rAzBZ
 mq2qQn0Drt/hLDv2KYGOrRDPIZHxzRbm/0jU+NEijcmsk0xJ3SpHcygIOy9VbqLf00b2
 OcYNHPDs/LX7aPqN0Mgx12t4a/oQg6+sIfHAYQ+PunKcCoy4UhI6nvf9eljlibVvUuvj
 72fQMLBmghTQzGYJi5VNTLLRu/jZflDHG/QeZI5ughzB7tJzTI2F7oIqajoZk+7P5Rue
 Bieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hXJSr2Riukg6sLC81qnw2+4YK/hUVT2VEwcL13m5MRw=;
 b=Dys1OAXDts4W5i7V4DswdMvaaxopEdnf2cKvJqgOg+hTsjGaVAhSt9yIL41WtxD/xu
 mftAj8NY62Fwwr/l1z9k5vPVlmRBqovH2ulrszX6PNJVx+aE2CptSZcmYZJcRp9sA61B
 5/WbrPX6B1m5Qp0tC6Husj87c60VRp7NhX53aHoHOiB5Jxv4UmUMTJdojw2eRB96dzel
 5PVFKLIDUoun/lGmZxwmJhrHnwVUShYmTrX6ysvuLuPNaOJCCEbt/Jtjt8NtxdwVg6wQ
 7jFRWeH3Mtv2G0owRVUDY4veWkK30HcqTkbsfKvLLyjumP5GW9KXvVwtUWvt10ahuwPC
 54Cw==
X-Gm-Message-State: AOAM531D3ge83YW2WvNhIvlwRtuA0v7RzUxZcDwFKJXNk5GCrsKDtT7w
 IfOCXpP4lEbQZAxV3MaDABWLnjVNu8ExYbcnh3s=
X-Google-Smtp-Source: ABdhPJwxx1IWwZmVPysAWToOvN9DlgTFvAw4uemt8AVvgMLB/Lqxvpyu2g0j5plBDR8QwAPwsdCLZMpJJpzi28U3hb4=
X-Received: by 2002:a05:6870:630c:b0:da:b3f:324d with SMTP id
 s12-20020a056870630c00b000da0b3f324dmr1821885oao.253.1647359500464; Tue, 15
 Mar 2022 08:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220314115354.144023-1-Julia.Lawall@inria.fr>
 <20220314115354.144023-24-Julia.Lawall@inria.fr>
In-Reply-To: <20220314115354.144023-24-Julia.Lawall@inria.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Mar 2022 11:51:28 -0400
Message-ID: <CADnq5_PqHgorHeLbZhF2MKt39GDhJvcD6yjWRN209h1A4fQgcg@mail.gmail.com>
Subject: Re: [PATCH 23/30] drm/amdgpu/dc: fix typos in comments
To: Julia Lawall <Julia.Lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Mar 14, 2022 at 8:01 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:
>
> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
>  drivers/gpu/drm/amd/display/dc/bios/command_table.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table.c b/drivers/gpu/drm/amd/display/dc/bios/command_table.c
> index ad13e4e36d77..0e36cd800fc9 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/command_table.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/command_table.c
> @@ -456,7 +456,7 @@ static enum bp_result transmitter_control_v2(
>                 if ((CONNECTOR_ID_DUAL_LINK_DVII == connector_id) ||
>                                 (CONNECTOR_ID_DUAL_LINK_DVID == connector_id))
>                         /* on INIT this bit should be set according to the
> -                        * phisycal connector
> +                        * physical connector
>                          * Bit0: dual link connector flag
>                          * =0 connector is single link connector
>                          * =1 connector is dual link connector
> @@ -468,7 +468,7 @@ static enum bp_result transmitter_control_v2(
>                                 cpu_to_le16((uint8_t)cntl->connector_obj_id.id);
>                 break;
>         case TRANSMITTER_CONTROL_SET_VOLTAGE_AND_PREEMPASIS:
> -               /* votage swing and pre-emphsis */
> +               /* voltage swing and pre-emphsis */
>                 params.asMode.ucLaneSel = (uint8_t)cntl->lane_select;
>                 params.asMode.ucLaneSet = (uint8_t)cntl->lane_settings;
>                 break;
> @@ -2120,7 +2120,7 @@ static enum bp_result program_clock_v5(
>         memset(&params, 0, sizeof(params));
>         if (!bp->cmd_helper->clock_source_id_to_atom(
>                         bp_params->pll_id, &atom_pll_id)) {
> -               BREAK_TO_DEBUGGER(); /* Invalid Inpute!! */
> +               BREAK_TO_DEBUGGER(); /* Invalid Input!! */
>                 return BP_RESULT_BADINPUT;
>         }
>
>
