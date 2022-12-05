Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 578D76439BC
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 00:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E77310E2B8;
	Mon,  5 Dec 2022 23:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5259C10E0DD
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 23:58:49 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id x28so3768177lfn.6
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 15:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=doSWp/8FuNr+NEV3HjPTJkGGPY6r8PL0hvET2gbpcas=;
 b=Qerm5bC31eCO/u9ZcVP1OcqKBknqnslFPZd1KK3o1V2jy51sySmxFQBQZRAhfyjlr5
 0iF9IRsEbwty3qVO1wOSB1T87h54s4gx2dJ/E70LBpDUfxeBT2cSM76kwX5YzDpxthuy
 UnYbMgHX4IGFYzj1YAZQBQTpVChrQM5rc9K3429C+Jc0ZgfYBnYlDrz+7g2oiSPSXnK2
 QHFngs5DeLtpPzW019h10iP/OTn9g1CjjuZZRz4zuO33qvD06K6FnsWDYHMpslkxGyAW
 kCsR8n5tZFQ550S05KB+1mMT0htMsGwqyCLZkyGESXATDlNoAS3dU+8IhaYxSoZUBpq5
 Kgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=doSWp/8FuNr+NEV3HjPTJkGGPY6r8PL0hvET2gbpcas=;
 b=AQaBntFO9sH4ud+6s6C4N/9rQpCvyIQEzIvvvyqCC/UBMXikYWNfPOWYzfTBjzORam
 2//5whzpJVE0sExKsmpX6NjGNuIFqau+lQkwjOF8QedU5jnLVqNZWKGWIrbtH2zDrvAg
 /XMsXU2cmS5qPFC5lAHIi0G8VgHwKz6EpXFWjhB32XuWdnloJ8Gp63nHJnwUqVshWE7J
 qKhvBpL8uGeykcZ5mBNWteZUpfNHv20OXqprmuu808eBZ9WNaEUrWidXYrMSwgW6Asaw
 1b3xuhVOwXtBzHoHjyGBFG6srRqlUztoeEdmESdj4mltJojmHG5nFx4yoA6Tj+dsnxh8
 fT9w==
X-Gm-Message-State: ANoB5pmfpNtzykAS0zPsJ8ABu4EBGA+Q1q1mKoAPEjJukW0oaLDVr5wv
 t1yFXiQh61GH9K2PcjcX/NPVYw==
X-Google-Smtp-Source: AA0mqf4iVNbwTKjN8IO9W2OPq2uXL5c4w2KkFC+MzkP3JxqHL9eP3wjuwJUr9hB+oLt1r/8eCoxMEA==
X-Received: by 2002:ac2:4e14:0:b0:4af:f5a0:8786 with SMTP id
 e20-20020ac24e14000000b004aff5a08786mr26291071lfr.265.1670284727601; 
 Mon, 05 Dec 2022 15:58:47 -0800 (PST)
Received: from [127.0.0.1] ([188.170.72.128]) by smtp.gmail.com with ESMTPSA id
 bp33-20020a05651215a100b004b5701b5337sm721215lfb.104.2022.12.05.15.58.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 15:58:47 -0800 (PST)
Date: Tue, 06 Dec 2022 02:41:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@somainline.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, airlied@gmail.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v9_4/5=5D_drm/msm/dp=3A_parser_link?=
 =?US-ASCII?Q?-frequencies_as_property_of_dp=5Fout_endpoint?=
User-Agent: K-9 Mail for Android
In-Reply-To: <1670281694-13281-5-git-send-email-quic_khsieh@quicinc.com>
References: <1670281694-13281-1-git-send-email-quic_khsieh@quicinc.com>
 <1670281694-13281-5-git-send-email-quic_khsieh@quicinc.com>
Message-ID: <90C493B1-E7E3-46A9-89F0-443922B8FEF5@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

6 =D0=B4=D0=B5=D0=BA=D0=B0=D0=B1=D1=80=D1=8F 2022 =D0=B3=2E 02:08:13 GMT+03=
:00, Kuogee Hsieh <quic_khsieh@quicinc=2Ecom> =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>Add capability to parser and retrieve max DP link supported rate from
>link-frequencies property of dp_out endpoint=2E
>
>Changes in v6:
>-- second patch after split parser patch into two patches
>
>Changes in v7:
>-- without checking cnt against DP_MAX_NUM_DP_LANES to retrieve link rate
>
>Changes in v9:
>-- separate parser link-frequencies out of data-lanes
>
>Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc=2Ecom>
>---
> drivers/gpu/drm/msm/dp/dp_parser=2Ec | 20 ++++++++++++++++++--
> drivers/gpu/drm/msm/dp/dp_parser=2Eh |  2 ++
> 2 files changed, 20 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/msm/dp/dp_parser=2Ec b/drivers/gpu/drm/msm/d=
p/dp_parser=2Ec
>index b5f7e70=2E=2Efdea843 100644
>--- a/drivers/gpu/drm/msm/dp/dp_parser=2Ec
>+++ b/drivers/gpu/drm/msm/dp/dp_parser=2Ec
>@@ -94,15 +94,17 @@ static int dp_parser_ctrl_res(struct dp_parser *parse=
r)
> static int dp_parser_misc(struct dp_parser *parser)
> {
> 	struct device_node *of_node =3D parser->pdev->dev=2Eof_node;
>+	struct device_node *endpoint;
>+	u64 frequency;
> 	int cnt;
>=20
> 	/*
> 	 * data-lanes is the property of dp_out endpoint
> 	 */
> 	cnt =3D drm_of_get_data_lanes_count_ep(of_node, 1, 0, 1, DP_MAX_NUM_DP_=
LANES);
>-	if (cnt > 0)
>+	if (cnt > 0) {
> 		parser->max_dp_lanes =3D cnt;
>-	else {
>+	} else {

This belongs to the previous patch=20

> 		/*
> 		 * legacy code, data-lanes is the property of mdss_dp node
> 		 */
>@@ -113,6 +115,20 @@ static int dp_parser_misc(struct dp_parser *parser)
> 			parser->max_dp_lanes =3D DP_MAX_NUM_DP_LANES; /* 4 lanes */
> 	}
>=20
>+	cnt =3D 0;
>+	endpoint =3D of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
>+	if (endpoint)
>+		cnt =3D of_property_count_u64_elems(endpoint, "link-frequencies");
>+	of_node_put(endpoint);
>+	if (cnt > 0) {
>+		of_property_read_u64_index(endpoint, "link-frequencies",

And this is use after free=2E

I still think than an additional function would make code simpler=2E You c=
an return an error code at any point=2E And then handle it in the calling c=
ode=2E

>+						cnt - 1, &frequency);
>+		frequency /=3D 10;	/* from symbol rate to link rate */
>+		parser->max_dp_link_rate =3D (frequency / 1000); /* kbits */
>+	} else {
>+		parser->max_dp_link_rate =3D DP_LINK_RATE_HBR2; /* 540000 khz */
>+	}
>+
> 	return 0;
> }
>=20
>diff --git a/drivers/gpu/drm/msm/dp/dp_parser=2Eh b/drivers/gpu/drm/msm/d=
p/dp_parser=2Eh
>index 866c1a8=2E=2E3ddf639 100644
>--- a/drivers/gpu/drm/msm/dp/dp_parser=2Eh
>+++ b/drivers/gpu/drm/msm/dp/dp_parser=2Eh
>@@ -15,6 +15,7 @@
> #define DP_LABEL "MDSS DP DISPLAY"
> #define DP_MAX_PIXEL_CLK_KHZ	675000
> #define DP_MAX_NUM_DP_LANES	4
>+#define DP_LINK_RATE_HBR2       540000
>=20
> enum dp_pm_type {
> 	DP_CORE_PM,
>@@ -119,6 +120,7 @@ struct dp_parser {
> 	struct dp_io io;
> 	struct dp_display_data disp_data;
> 	u32 max_dp_lanes;
>+	u32 max_dp_link_rate;
> 	struct drm_bridge *next_bridge;
>=20
> 	int (*parse)(struct dp_parser *parser);

