Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DB5AB3267
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 10:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4FC810E33A;
	Mon, 12 May 2025 08:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ioGETL0s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F4F10E33A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 08:57:41 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BMF2ED032418
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 08:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WCu8OmpIpvAXaghG4OPN9b5lJzbPYP6bs2hD91ODU3s=; b=ioGETL0sMyi0PkaQ
 PN+0UtgVBOhfgaQdwxPbSaRPCf14PZU4dhU7l8fCRPs702I2i+ZR5p9nY4ae5zC+
 TnX51QvLSN9nsIYkGLAfiaKJJpYr1G13tzZ8saI2T09Bfv6/u6bhPhpTnrzLy+jw
 3Wu+gyVH5vbzW+U1wDDI+DHacikP/X/M5C0ui/ud+VefPdbgv2V0rc0z134svEYp
 mwW61XU5p1acNrb9p5rriY3BML9DC61SK54W/Pc8wyznw0k59w3gxzcUqJ3j2wfL
 MFqZxN3NRUYYfEbDF7udc0SjPBBrC5bRDlxZTuT/8iRWYQaweG847tVby2zHlQPu
 v8SwPQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hvghbykv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 08:57:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7caef20a528so1148019885a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 01:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747040259; x=1747645059;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WCu8OmpIpvAXaghG4OPN9b5lJzbPYP6bs2hD91ODU3s=;
 b=SEi1CW57FW1yIVBdi0kVyGMaQQMv/SbPJZKxHAaostQHuiNpd7B+R+5xWO2/ENa256
 wynoPS2QS/AWnpzCl/zSZLI+1NW+CEFpVXmZyMHtPeG7M3qLNpSuDFb0nV8wpl3Mjr/y
 BZX4X3EyhyyD7/xaGnaxJXuNRN6Qz9nagX9ezs24Zi45fjEDqwUbfRZO0M8kEZ2UdMxw
 2THz1/LFY8NTCz0d8CKc5S/Y5ue9vyN01eppkkoAGVDVf9+jLjuJdX+hIQG/ff7Xxr3r
 38S/8m4X32/e78pmCSP8PpFEwzpJ9Lt2Qw6Py0iSOtN6zqi+nyYV24De8JQMeT1y0Xst
 UcEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4ffxs4D0lD1wurQhpSKoEqf3E0TYAHlag2sh398MckJZRz3hwtsHY2a6rF9hNbOEJrKWiwpWiQ8g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyw/koBAEpOkxKf5+UOb4wmQcf2KIR6DtzupQLjin9MkivJK8wI
 9TnomYmSQmFmbopE/wfowjg27fQyCJPR+tuhDIIKtnIFHlBAfW8Dz5C1FHhP8F3LPSr5gLrZ/Tk
 wug7vycQJp94GvS2nIJdVAQs8QooxRSvYQ8uBd4E/Jr190i6a7XfWRCP3/AumgVh0/Gc=
X-Gm-Gg: ASbGnctp5qw1OOyUwcTtDX7WaRT8u7rjWpEFgauJwySdfoWdAgHivtAOpDUDefm2ztM
 uuSO6bNVQBImmpteV0eG6cfGezIdgvncetGMcoaglSkoVcXFT3sHE8cLgsGxQrW7thMczhIx3NF
 KYECCy/pTk3xtyuYW0LEzCPFVCO8CBBCG0SlaKiWGKYDEHNJRlq2+FS4Q3AjDQqvVvDudFzx/Sf
 06n3czFahzEp7xhQcc5EaxosTsSpD1vbBWFYhI3lpTN9cvjo0y4z8bVb0wDjrIgBeNGrVhXRVGj
 9rzjsJUU1bdYEzYspeqEkNp5odsxB25ecyY+L/5WZ60VLrMAEdUqY/MIXzfFh/9lMeVBOJRjBUM
 =
X-Received: by 2002:a05:620a:600d:b0:7c5:6140:734f with SMTP id
 af79cd13be357-7cd010f6691mr2207967385a.18.1747040259075; 
 Mon, 12 May 2025 01:57:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFE5x6HT6KpjSIct+iRTI4CA9tVAYJyExzIKxtfvfydEY5rmUG/Yy57boAJSWfYreYEAmrHEA==
X-Received: by 2002:a05:620a:600d:b0:7c5:6140:734f with SMTP id
 af79cd13be357-7cd010f6691mr2207965185a.18.1747040258733; 
 Mon, 12 May 2025 01:57:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64bf62asm1421452e87.182.2025.05.12.01.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 01:57:37 -0700 (PDT)
Date: Mon, 12 May 2025 11:57:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Connor Abbott <cwabbott0@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFT 01/14] soc: qcom: Add UBWC config provider
Message-ID: <g2u5iedr2mjtvuru5e7pum6tieh2mzdkxaluka3lxrvo7uteuu@2fky7dn5kuhe>
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-1-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7H6FGm0npQnG+M3Jzn9RSL9CYkkDg3rtH+=on4_caPTZQ@mail.gmail.com>
 <17431c94-7215-4e50-acc9-7df97558af16@oss.qualcomm.com>
 <yxmlvcnfjk2nvkqz23lyid4itacrptgpair3zptz7wqsrecsr5@27euwgdw3zvn>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nnyxux666vjexpkd"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yxmlvcnfjk2nvkqz23lyid4itacrptgpair3zptz7wqsrecsr5@27euwgdw3zvn>
X-Proofpoint-GUID: xbhsHBdYD0i2n3Nmt5U89Dp6DJfNdiZ5
X-Proofpoint-ORIG-GUID: xbhsHBdYD0i2n3Nmt5U89Dp6DJfNdiZ5
X-Authority-Analysis: v=2.4 cv=AMDybF65 c=1 sm=1 tr=0 ts=6821b804 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aI8By1pUJ2IUBeezcS4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=SCwkq14EKksXobB6mvQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDA5NCBTYWx0ZWRfX5tH/77YOLAcO
 wCwKFpB0/YFV5esCb417Bt944o7rC7w/1TlVPw2cSPRu51C0+kJ6S7Im3w+3g4qhmIfN9xv46YY
 DANU9Qy2Yl85iwPFFjqtgGT0kP+6zl98WMQG9HCa6N3qfet285VdP5GCgJghy7ZU47VoHH2xBSt
 /ECpZ67bgh9RLPR+aWf3CCFFwEmcS1/FYLGThBr5zMdYSDdv2MF86MCNvXeYzp5haDzq7WSdaTZ
 vzNj4hvFgd+Y0lzONmO0tbz/YUx5CY339g+emc8QrKkmmDVjJq33C7+RHMRCAz0KgulHEAKh58S
 8BrqEJNkEXja9fABcNatqQN76VIS2HYt/zqxSQdU3r+uxQOfIzG7ANQ5nt1tHvgUyvcRD4Tn1Jm
 0qXVn5buU57vfb3YpIp9vc+j3zDuxLgrsIeT6Duh8qUaP23+D6QqpM92Tz6O6J44h1qAm99H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120094
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


--nnyxux666vjexpkd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, May 12, 2025 at 12:13:40AM +0300, Dmitry Baryshkov wrote:
> On Fri, May 09, 2025 at 02:28:55PM +0200, Konrad Dybcio wrote:
> > On 5/8/25 10:12 PM, Connor Abbott wrote:
> > > On Thu, May 8, 2025 at 2:13 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
> > >>
> > >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > >>
> > >> Add a file that will serve as a single source of truth for UBWC
> > >> configuration data for various multimedia blocks.
> > >>
> > >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > >> ---
> > 
> > [...]
> > 
> > >> +struct qcom_ubwc_cfg_data {
> > >> +       u32 ubwc_enc_version;
> > >> +       /* Can be read from MDSS_BASE + 0x58 */
> > >> +       u32 ubwc_dec_version;
> > >> +       u32 ubwc_swizzle;
> > >> +       int highest_bank_bit;
> > >> +       bool ubwc_bank_spread;
> > >> +       bool macrotile_mode;
> > >> +       u32 mdss_reg_bus_bw;
> > > 
> > > This doesn't really seem relevant to UBWC?
> > 
> > I'll admit I just took it with the rest of properties for a simpler transition.
> > 
> > Generally, we could ma-a-a-aybe just make up a common value and pray it doesn't
> > break anything, as we're taking numbers that translate to ANYTHING_ABOVE_OFF or
> > ANYTHING_ABOVE_OFF_PLUS_1 in most cases wrt a cpu-ipblock path.
> 
> I'd rather not do that. Let me check if I can cook it on top of your
> series.


See the attached patch.

-- 
With best wishes
Dmitry

--nnyxux666vjexpkd
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-drm-msm-bring-MDSS-bandwidth-data-back-to-msm_mdss.patch"

From cf3fe1a79c035dbf1b62143fe4219b15096bb8b1 Mon Sep 17 00:00:00 2001
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 12 May 2025 11:55:59 +0300
Subject: [PATCH] drm/msm: bring MDSS bandwidth data back to msm_mdss

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 85 +++++++++++++++++++++-------------
 drivers/soc/qcom/ubwc_config.c | 20 --------
 include/linux/soc/qcom/ubwc.h  |  1 -
 3 files changed, 54 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 71f5440994cc..a71597dc1e4d 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -24,7 +24,9 @@
 
 #define MIN_IB_BW	400000000UL /* Min ib vote 400MB */
 
-#define DEFAULT_REG_BW	153600 /* Used in mdss fbdev driver */
+struct msm_mdss_data {
+	u32 reg_bus_bw;
+};
 
 struct msm_mdss {
 	struct device *dev;
@@ -38,6 +40,7 @@ struct msm_mdss {
 		struct irq_domain *domain;
 	} irq_controller;
 	const struct qcom_ubwc_cfg_data *mdss_data;
+	u32 reg_bus_bw;
 	struct icc_path *mdp_path[2];
 	u32 num_mdp_paths;
 	struct icc_path *reg_bus_path;
@@ -235,12 +238,8 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
 		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(MIN_IB_BW));
 
-	if (msm_mdss->mdss_data && msm_mdss->mdss_data->mdss_reg_bus_bw)
-		icc_set_bw(msm_mdss->reg_bus_path, 0,
-			   msm_mdss->mdss_data->mdss_reg_bus_bw);
-	else
-		icc_set_bw(msm_mdss->reg_bus_path, 0,
-			   DEFAULT_REG_BW);
+	icc_set_bw(msm_mdss->reg_bus_path, 0,
+		   msm_mdss->reg_bus_bw);
 
 	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
 	if (ret) {
@@ -376,6 +375,7 @@ static int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_d
 
 static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5)
 {
+	const struct msm_mdss_data *mdss_data;
 	struct msm_mdss *msm_mdss;
 	int ret;
 	int irq;
@@ -392,6 +392,12 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 	if (IS_ERR(msm_mdss->mdss_data))
 		return ERR_CAST(msm_mdss->mdss_data);
 
+	mdss_data = of_device_get_match_data(&pdev->dev);
+	if (!mdss_data)
+		return ERR_PTR(-EINVAL);
+
+	msm_mdss->reg_bus_bw = mdss_data->reg_bus_bw;
+
 	msm_mdss->mmio = devm_platform_ioremap_resource_byname(pdev, is_mdp5 ? "mdss_phys" : "mdss");
 	if (IS_ERR(msm_mdss->mmio))
 		return ERR_CAST(msm_mdss->mmio);
@@ -509,31 +515,48 @@ static void mdss_remove(struct platform_device *pdev)
 	msm_mdss_destroy(mdss);
 }
 
+static const struct msm_mdss_data data_57k = {
+	.reg_bus_bw = 57000,
+};
+
+static const struct msm_mdss_data data_74k = {
+	.reg_bus_bw = 74000,
+};
+
+static const struct msm_mdss_data data_76k8 = {
+	.reg_bus_bw = 76800,
+};
+
+static const struct msm_mdss_data data_153k6 = {
+	.reg_bus_bw = 153600,
+};
+
 static const struct of_device_id mdss_dt_match[] = {
-	{ .compatible = "qcom,mdss" },
-	{ .compatible = "qcom,msm8998-mdss" },
-	{ .compatible = "qcom,qcm2290-mdss" },
-	{ .compatible = "qcom,sa8775p-mdss" },
-	{ .compatible = "qcom,sar2130p-mdss" },
-	{ .compatible = "qcom,sdm670-mdss" },
-	{ .compatible = "qcom,sdm845-mdss" },
-	{ .compatible = "qcom,sc7180-mdss" },
-	{ .compatible = "qcom,sc7280-mdss" },
-	{ .compatible = "qcom,sc8180x-mdss" },
-	{ .compatible = "qcom,sc8280xp-mdss" },
-	{ .compatible = "qcom,sm6115-mdss" },
-	{ .compatible = "qcom,sm6125-mdss" },
-	{ .compatible = "qcom,sm6150-mdss" },
-	{ .compatible = "qcom,sm6350-mdss" },
-	{ .compatible = "qcom,sm6375-mdss" },
-	{ .compatible = "qcom,sm7150-mdss" },
-	{ .compatible = "qcom,sm8150-mdss" },
-	{ .compatible = "qcom,sm8250-mdss" },
-	{ .compatible = "qcom,sm8350-mdss" },
-	{ .compatible = "qcom,sm8450-mdss" },
-	{ .compatible = "qcom,sm8550-mdss" },
-	{ .compatible = "qcom,sm8650-mdss" },
-	{ .compatible = "qcom,x1e80100-mdss"},
+	{ .compatible = "qcom,mdss", .data = &data_153k6 },
+	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k},
+	{ .compatible = "qcom,sar2130p-mdss", .data = &data_74k},
+	{ .compatible = "qcom,sdm670-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sdm845-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sc7180-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sc7280-mdss", .data = &data_74k },
+	{ .compatible = "qcom,sc8180x-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sc8280xp-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sm6115-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sm6125-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sm6150-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sm6350-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sm6375-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sm7150-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sm8150-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sm8250-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sm8350-mdss", .data = &data_74k },
+	{ .compatible = "qcom,sm8450-mdss", .data = &data_74k },
+	{ .compatible = "qcom,sm8550-mdss", .data = &data_57k },
+	{ .compatible = "qcom,sm8650-mdss", .data = &data_57k },
+	/* TODO: x1e8: Add reg_bus_bw with real value */
+	{ .compatible = "qcom,x1e80100-mdss", .data = &data_153k6 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);
diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 3f81fb2aab28..43c9e6facb73 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -16,20 +16,17 @@ static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
 	.highest_bank_bit = 1,
-	.mdss_reg_bus_bw = 76800,
 };
 
 static const struct qcom_ubwc_cfg_data msm8998_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
 	.highest_bank_bit = 2,
-	.mdss_reg_bus_bw = 76800,
 };
 
 static const struct qcom_ubwc_cfg_data qcm2290_data = {
 	/* no UBWC */
 	.highest_bank_bit = 2,
-	.mdss_reg_bus_bw = 76800,
 };
 
 static const struct qcom_ubwc_cfg_data sa8775p_data = {
@@ -39,7 +36,6 @@ static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 0,
 	.macrotile_mode = true,
-	.mdss_reg_bus_bw = 74000,
 };
 
 static const struct qcom_ubwc_cfg_data sar2130p_data = {
@@ -49,7 +45,6 @@ static const struct qcom_ubwc_cfg_data sar2130p_data = {
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 0,
 	.macrotile_mode = true,
-	.mdss_reg_bus_bw = 74000,
 };
 
 static const struct qcom_ubwc_cfg_data sc7180_data = {
@@ -58,7 +53,6 @@ static const struct qcom_ubwc_cfg_data sc7180_data = {
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 1,
-	.mdss_reg_bus_bw = 76800,
 };
 
 static const struct qcom_ubwc_cfg_data sc7280_data = {
@@ -68,7 +62,6 @@ static const struct qcom_ubwc_cfg_data sc7280_data = {
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 1,
 	.macrotile_mode = true,
-	.mdss_reg_bus_bw = 74000,
 };
 
 static const struct qcom_ubwc_cfg_data sc8180x_data = {
@@ -76,7 +69,6 @@ static const struct qcom_ubwc_cfg_data sc8180x_data = {
 	.ubwc_dec_version = UBWC_3_0,
 	.highest_bank_bit = 3,
 	.macrotile_mode = true,
-	.mdss_reg_bus_bw = 76800,
 };
 
 static const struct qcom_ubwc_cfg_data sc8280xp_data = {
@@ -86,21 +78,18 @@ static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 3,
 	.macrotile_mode = true,
-	.mdss_reg_bus_bw = 76800,
 };
 
 static const struct qcom_ubwc_cfg_data sdm670_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.highest_bank_bit = 1,
-	.mdss_reg_bus_bw = 76800,
 };
 
 static const struct qcom_ubwc_cfg_data sdm845_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.highest_bank_bit = 2,
-	.mdss_reg_bus_bw = 76800,
 };
 
 static const struct qcom_ubwc_cfg_data sm6115_data = {
@@ -109,7 +98,6 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
 	.ubwc_swizzle = 7,
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 1,
-	.mdss_reg_bus_bw = 76800,
 };
 
 static const struct qcom_ubwc_cfg_data sm6125_data = {
@@ -123,7 +111,6 @@ static const struct qcom_ubwc_cfg_data sm6150_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.highest_bank_bit = 1,
-	.mdss_reg_bus_bw = 76800,
 };
 
 static const struct qcom_ubwc_cfg_data sm6350_data = {
@@ -132,21 +119,18 @@ static const struct qcom_ubwc_cfg_data sm6350_data = {
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 1,
-	.mdss_reg_bus_bw = 76800,
 };
 
 static const struct qcom_ubwc_cfg_data sm7150_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.highest_bank_bit = 1,
-	.mdss_reg_bus_bw = 76800,
 };
 
 static const struct qcom_ubwc_cfg_data sm8150_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.highest_bank_bit = 2,
-	.mdss_reg_bus_bw = 76800,
 };
 
 static const struct qcom_ubwc_cfg_data sm8250_data = {
@@ -157,7 +141,6 @@ static const struct qcom_ubwc_cfg_data sm8250_data = {
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
 	.macrotile_mode = true,
-	.mdss_reg_bus_bw = 76800,
 };
 
 static const struct qcom_ubwc_cfg_data sm8350_data = {
@@ -168,7 +151,6 @@ static const struct qcom_ubwc_cfg_data sm8350_data = {
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
 	.macrotile_mode = true,
-	.mdss_reg_bus_bw = 74000,
 };
 
 static const struct qcom_ubwc_cfg_data sm8550_data = {
@@ -179,7 +161,6 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
 	.macrotile_mode = true,
-	.mdss_reg_bus_bw = 57000,
 };
 
 static const struct qcom_ubwc_cfg_data x1e80100_data = {
@@ -190,7 +171,6 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
 	.macrotile_mode = true,
-	/* TODO: Add mdss_reg_bus_bw with real value */
 };
 
 static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 450106e6aea0..e78645fc090f 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -17,7 +17,6 @@ struct qcom_ubwc_cfg_data {
 	int highest_bank_bit;
 	bool ubwc_bank_spread;
 	bool macrotile_mode;
-	u32 mdss_reg_bus_bw;
 };
 
 #define UBWC_1_0 0x10000000
-- 
2.39.5


--nnyxux666vjexpkd--
