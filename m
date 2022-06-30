Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 817305620D7
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 19:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20B911A72F;
	Thu, 30 Jun 2022 17:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA4811A73B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 17:07:47 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id f39so34879967lfv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 10:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=5h9m2r1as3dVO5Ej+4ZiJew20CUmK76LyEozgtg6ehk=;
 b=RpClWCfbqMGu2IaKWsyy/R7HM5UFKNt5IfpnOqCRNW7IeAGO0hOQ8gg3W3l8GwANGS
 DndKo5NBBpM7M4OzjLhDl4yyHG1a2jZ4FTPnoNrWLzvsn56ATwrLWpSkSt5wSv3rKAzi
 b1UlsdO/ZFFZxcP7I301pb460P5tLR90qusgBA9D80fQZCRHaYD/f/Mndrmv46pmuxKa
 qEzW8NhW1huy78tXn0ahmqTf/fRTK83e6KpRM2Og0b/4LkNTnPkTIS2PQ3Ww9KSWtv6m
 aaO7S3XYrMgcSvL2T3iBfBcprAhBJamvksBcnSLMCPD8Pwrhs6FSQnvorU6rgaqtRhRa
 q6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=5h9m2r1as3dVO5Ej+4ZiJew20CUmK76LyEozgtg6ehk=;
 b=nTyNRvwtMpSuzEDsGMZilqCeyRNcYqP1KDGLqkenJDTb1VwXL/xvpDLEacl920CPwr
 wCKLvhQAUOn87j94wAVSdvKIibu/2u9BCkulUSQ8bo0IGQaTgaY0cIwiAyXjbPIUstzh
 1cOt4QzCI1/5FeVBMSvCTBY2h7vOCFEc7EvmLs9q30iofB5X4QE9rhEe4o9glA7um1iJ
 Ps6o9wPWxih+y+Z3gTw2rJ33Myk8F7LnrrMAfNYZ5X5xUz7wq4gv9MutBYFiH1rdoEsk
 +clWntD/0ySiCvrRG6iNPqpCHJWdlFFcJBfWWk29bbfuEI8h12XYIHFfWU1MuqbjjP/t
 TleA==
X-Gm-Message-State: AJIora/DTA3Do9uvI4YP21s0ZXTeD+DFFyEK9GEygVEwwLQjgv0O1xLG
 p7PWw2r6wa3sD2wN+KTqdCkOdQ==
X-Google-Smtp-Source: AGRyM1sYxOrvJE5VNAQuV35nuPVYN8Uc4ZOlo7XwTERwo1oW9GaijikgQCz+byZALgT7XFQduQmvEg==
X-Received: by 2002:a05:6512:3e0e:b0:47f:6a95:9b98 with SMTP id
 i14-20020a0565123e0e00b0047f6a959b98mr6372997lfv.177.1656608865898; 
 Thu, 30 Jun 2022 10:07:45 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.229.210]) by smtp.gmail.com with ESMTPSA id
 c7-20020a19e347000000b004791fc12f6asm3194067lfk.46.2022.06.30.10.07.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jun 2022 10:07:44 -0700 (PDT)
Date: Thu, 30 Jun 2022 20:07:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/7=5D_dt-bindings=3A_msm=3A_ds?=
 =?US-ASCII?Q?i=3A_Fix_operating-points-v2_constraint?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20220630120845.3356144-3-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-3-bryan.odonoghue@linaro.org>
Message-ID: <6334180D-C29F-4EB4-BD2D-1F832E9FF990@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 30 June 2022 15:08:40 GMT+03:00, Bryan O'Donoghue <bryan=2Eodonoghue@li=
naro=2Eorg> wrote:
>The existing msm8916=2Edtsi does not depend on nor require operating poin=
ts=2E
>
>Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bin=
dings")
>Signed-off-by: Bryan O'Donoghue <bryan=2Eodonoghue@linaro=2Eorg>


Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>

>---
> =2E=2E=2E/devicetree/bindings/display/msm/dsi-controller-main=2Eyaml    =
 | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main=2Eyaml b/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main=2Eyaml
>index 717a5d255ffe4=2E=2E101adec8d9152 100644
>--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main=
=2Eyaml
>+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main=
=2Eyaml
>@@ -137,7 +137,6 @@ required:
>   - assigned-clocks
>   - assigned-clock-parents
>   - power-domains
>-  - operating-points-v2
>   - ports
>=20
> additionalProperties: false

--=20
With best wishes
Dmitry
