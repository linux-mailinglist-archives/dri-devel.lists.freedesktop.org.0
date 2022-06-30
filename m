Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CB5562113
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 19:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADC411B155;
	Thu, 30 Jun 2022 17:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403CD11B151
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 17:18:22 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id t25so34874841lfg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=h6a1dWXChTwCKwnW/kNd1JMMGxhKCAfODxl0ifUihRY=;
 b=yfS9EQ2f30wjZUo7Mmyex+du61oijkfvbfouHHFq7LGnTU01gHm0lXJwJs4rqk6hp3
 YrCSg3eXuvUnvtgMFcKtSKl6fnLVRof+YoZEJ/ftdo7q1NDXtXEQDb7awy30FV9wr4nG
 +61MbaP7BkTcZMOaDaCn0mTw+RosCRlUhn/DtO/j4Oolpx0KSI9esJAt9wspCIGDHa+4
 OBtz4dDEIOWWl5/EZ2vPCRLEIegpbEtz5cChBXRZSy6wu2g27NqtWA0F3X+TT0oR14Gk
 WPXVR7vL7LPd7+qRrQzjxB0/TstzVp5W1DFrpWr7wX8U1BrqkNP+9QeD3T6XBNx5bO23
 b23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=h6a1dWXChTwCKwnW/kNd1JMMGxhKCAfODxl0ifUihRY=;
 b=BdbLcmWwMCFhnXLEOT9Vcihg3uwfICHNbgVVs7pQ/PbIxSChj+uNCwWSmPmv7QvtGf
 FGaNvKrMDEWxdHfm2AMSm6BlcoEMlrscv/48y1W9QBNIYeTc1c+hqtWR3bH0r+WoIGWV
 ekfrdk7xMmD+dIMXzKZApxoBIxQE7ZV+OdobgUyOqZIGEElzFU5rdpknR3kNK7VPt1Yi
 M412e83z9azA6wosjrMXfJlHyUcjAU+GA/ZwqxnAR4OiBVpTT1mrsAHxEOkzMBmooPOC
 NlTCPSOPlAyYD0r4ucwTXunUoL+1GmD2JteSi3Pjl+cdwITdD+MSEWSDZS22Gwe7D1O2
 3NgA==
X-Gm-Message-State: AJIora+FULLLL0V/dSxLBLX/wf4Yy3d5mkNDZ3eDfyIlt432u22AfVTd
 w4qE/CStiZgB0aHiOiRAl43Zmg==
X-Google-Smtp-Source: AGRyM1s8R8bDIioUiYfE/tW3QennF5sAfDl/cwAX8X6a6afK/dqg3TKlgCkCUM1zaXwFsLBpgZdffQ==
X-Received: by 2002:a05:6512:22cd:b0:47f:6e84:f51c with SMTP id
 g13-20020a05651222cd00b0047f6e84f51cmr6067710lfu.175.1656609500594; 
 Thu, 30 Jun 2022 10:18:20 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.229.210]) by smtp.gmail.com with ESMTPSA id
 v10-20020a2ea60a000000b0025bf92bd024sm348973ljp.102.2022.06.30.10.18.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jun 2022 10:18:20 -0700 (PDT)
Date: Thu, 30 Jun 2022 20:18:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_7/7=5D_dt-bindings=3A_msm=3A_dsi=3A_Ad?=
 =?US-ASCII?Q?d_missing_qcom=2Cdsi-phy-regulator-ldo-mode?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20220630120845.3356144-8-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-8-bryan.odonoghue@linaro.org>
Message-ID: <1FDC4CED-AFE7-4D68-9D48-58751DBBF4F6@linaro.org>
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



On 30 June 2022 15:08:45 GMT+03:00, Bryan O'Donoghue <bryan=2Eodonoghue@li=
naro=2Eorg> wrote:
>Add in missing qcom,dsi-phy-regulator-ldo-mode to the 28nm DSI PHY=2E
>When converting from =2Etxt to =2Eyaml we missed this one=2E
>
>Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bin=
dings")
>Signed-off-by: Bryan O'Donoghue <bryan=2Eodonoghue@linaro=2Eorg>

Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>


>---
> =2E=2E=2E/devicetree/bindings/display/msm/dsi-phy-28nm=2Eyaml          |=
 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm=
=2Eyaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm=2Eyaml
>index 9ecd513d93661=2E=2E3551e166db966 100644
>--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm=2Eyaml
>+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm=2Eyaml
>@@ -40,6 +40,9 @@ properties:
>       - description: dsi phy register set
>       - description: dsi phy regulator register set
>=20
>+  qcom,dsi-phy-regulator-ldo-mode:
>+    description: Boolean value indicating if the LDO mode PHY regulator =
is wanted=2E
>+
>   reg-names:
>     items:
>       - const: dsi_pll

--=20
With best wishes
Dmitry
