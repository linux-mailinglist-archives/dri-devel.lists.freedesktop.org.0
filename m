Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4ECB43D6F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 15:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9284310EA42;
	Thu,  4 Sep 2025 13:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cwx9WVMR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1C510EA42
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 13:41:26 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XKHj023173
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 13:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zsELVXxRDHkuw5FMHFijxtZb/8PZgVuV6Is5bNS8FOo=; b=Cwx9WVMRoXcGhNxX
 JbFwbDU0B98RMzT7mQ+4fVrgLvqjoDxpmRZW5wR1MUylCVa+Wsbni1nshwCSVTdm
 38Xv8wglQKlb13wBoWI3wmmvC7n1az7la0t6V0rx9hY8hPkOIUPFxD1mx8wMTDyT
 FcVE1CBH5c2US9AcV8K1ZfL3mIionmkmF0fMt6R6EarflOcsREQR3fVgt9hcH2e0
 ZAkPH3umZgpbn+0rHNnMYIgRanZ+mWVfzLyWQagTRclU0PpsKY4Q5HhNIba7MI1Q
 RQoBiOvCATtXKImAucohLsd1DwL25T3D/m/RZZ7tLb4WxluBR0aSZvjS3DrW8CJ2
 MKm7VA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0eqs19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 13:41:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b3349c2c38so25084121cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 06:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756993283; x=1757598083;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zsELVXxRDHkuw5FMHFijxtZb/8PZgVuV6Is5bNS8FOo=;
 b=IOGAhpVtokwNPEcgHgM4oTAjtF7/prXZI4g6iRAkcQfIiNGdx2VTdSQAP//hxIzsNl
 B4BTyXBZsUYT3aTdwVndNRX8MBbSVQVtfQQz1/txGSmzLC1Ji1s5ku4fU2RkifFCoiXd
 OYhqwhQleT9UhHr9wWJKPWeW9aTL45rjagJpLWXA8TGUnRCfEoja1D64PhLTOSeShg4H
 LSALh6d6OgOUNfX+1tqnmceoKUXHoLlIE3xl1D8AzDOJwKZFLH7BjpfWLHJpC/WP0meZ
 V59R6wOE6PBAuea5rwQ3fv4P90mIZda1HuK9Mf8/op8LYtZlUqdRFPE2KhE5Q6fZCPtC
 ADcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+H8MNZHxC5WgywO5AsubBXn7yxCZVbPK4GUHKJY+w8h+o0G1RY7ryg0CPPVNF1MhbOiM4rTSjZ5M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkLW98GgxMf6brnpC1HyZYbtdKAZC9J4pJ/4ADIC/e4O90gv1v
 OKBw6CupJcBkvvmcgsbbox5zcKNodGZOCcGNqGB8R3420kuAu6iXsXq9DP6Vh7hTVXzpZst40nQ
 WPL2aB+DpDAP+Cu8OT5MoFncwd4SqewHg42fWC5rqofpRMPVucLcmiLIvocYiydh9LPFTiX8=
X-Gm-Gg: ASbGncu4VHeriW+1KNcam2e8iK4Ku4TcvG/0enkXmGWv75wvc6gx8EZdsqmxd5BWWCh
 mrWOlaStD5Y4ETG4fQsG9OxMhonjVguOsd8Z1HGekNNQ1ZYafCBrW6YyxavOQPMN1l+8ytOaeZK
 9FWE8JC6L/nwnmWTBYHZZOMzVHf3p7qngQAqI/SqNkn2GBXxLdyhoPfspnFOMaVqFuwNQaVl4u6
 jyP4H9QwrNyCr8SXT8dseNaA1+RrxXq1CYuve3ZOfIrXu4WpvPcrO85CfCpxCsaK22g+PzJI7Mg
 UsylAIvUo7tggKbGnD7MdlCQTVRGB91WaqEB25OXrwfBXhkpBdmj9ViS4YGOAC62c9+r4NQdElD
 NYdTeLOuwRAF6fGwB0SWFWR9K6A5xAKkMqri14C4GtZSwDaHjMgtC
X-Received: by 2002:ac8:7e86:0:b0:4b5:e31d:af59 with SMTP id
 d75a77b69052e-4b5e31db532mr9157251cf.50.1756993283323; 
 Thu, 04 Sep 2025 06:41:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcgLGNiPs4Y1Vcd2Iz1iaQB6nGFAqgRYhRmHUOPvj8u6gebWGRLPtVbV8arNifS1AxKcE8lA==
X-Received: by 2002:ac8:7e86:0:b0:4b5:e31d:af59 with SMTP id
 d75a77b69052e-4b5e31db532mr9156201cf.50.1756993282352; 
 Thu, 04 Sep 2025 06:41:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad25d8fsm1218765e87.129.2025.09.04.06.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 06:41:21 -0700 (PDT)
Date: Thu, 4 Sep 2025 16:41:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v11 0/6] Display enablement changes for Qualcomm QCS8300
 platform
Message-ID: <fgzptkddxhgqpsylthgo4a465jwypcu2oxo6woeihyukpn3zqd@hitdv3ujjhvc>
References: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
 <5bc0203c-21a1-4948-96ff-8eae844bfb93@oss.qualcomm.com>
 <d2940186-7baf-41d3-80dd-fbc860ac5acb@oss.qualcomm.com>
 <f3aa35bb-5ac7-4fe3-904e-2dd97b9c034a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3aa35bb-5ac7-4fe3-904e-2dd97b9c034a@oss.qualcomm.com>
X-Proofpoint-GUID: KUP3qvfF7ypPUPHjRcxKMPeQdPXQkVtv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX3siXporS7nPv
 TeQ9GK2hlbkMoRc3biqDD0lx5/fvn13QAHWyNkmVxMSBcHo1dXOUTGi+2EYiFIKAk0Pf1ic4Agw
 zzjwhr2+nfM93TdGElYr2UH3YprNRjgZrVqTEK+1Cr+Yr/0FKvWcbWd7x1MK5elYv/PMYxdopMC
 k1V2sPqML4M5KQJTRJNXkTRpUheuLF83/Gb7laK8eU301lQ4QqIgihtafTg6M6IS3zCfDcux7S4
 noHMYcmJB304xe+2gKjaWq3U/ATOmKq3kbnpDMKFKu2NETxCBKfliml0rA8Iyqsu8ORV9Pec2F/
 tUlEsG2j57jB+mE7I2av52ZqhAiQow9oteKnfbmwsldhF1+jy4+9T1RbdWTUmW37a/jjBYeNDT1
 kKE1Ybtb
X-Proofpoint-ORIG-GUID: KUP3qvfF7ypPUPHjRcxKMPeQdPXQkVtv
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b99706 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=1XWaLZrsAAAA:8 a=KKAkSRfTAAAA:8 a=4e3-kZboNEHOVYa1lVwA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
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

On Thu, Sep 04, 2025 at 05:31:01PM +0800, Yongxing Mou wrote:
> 
> 
> On 9/4/2025 4:21 PM, Konrad Dybcio wrote:
> > On 9/4/25 9:55 AM, Yongxing Mou wrote:
> > > 
> > > 
> > > On 9/4/2025 3:22 PM, Yongxing Mou wrote:
> > > > This series introduces support to enable the Mobile Display Subsystem (MDSS)
> > > > , Display Processing Unit (DPU), DisplayPort controller for the Qualcomm
> > > > QCS8300 target. It includes the addition of the hardware catalog, compatible
> > > > string, and their YAML bindings.
> > > > 
> > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > ---
> > > > Changes in v11: Fixed review comments from Dmitry.
> > > > - Rebase to MST bindings V8.
> > > > - Update the clocks-name for QCS8300 in dp-controller.
> > > > - Link to v10: https://lore.kernel.org/r/20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com
> > > > 
> > > > Changes in v10:
> > > > - Rebase to MST bindings V7.
> > > > - Update the P2/P3/MST2LINK/MST3LINK regions in MDSS yaml.
> > > > - Link to v9: https://lore.kernel.org/r/20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com
> > > > 
> > > > Changes in v9: Fixed review comments from Dmitry.
> > > > - Updated the description of dp-controller DT binding.
> > > > - Add new clause only work for QCS8300(one DP controller with 4 streams).
> > > > - Link to v8: https://lore.kernel.org/r/20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com
> > > > 
> > > > Changes in v8: Fixed review comments from Krzysztof, Dmitry.
> > > > - Fixed incorrect description for dp-controller in driver/dt-binding.[Krzysztof][Dmitry]
> > > > - Fixed incorrect description for ubwc change.[Dmitry]
> > > > - Link to v7: https://lore.kernel.org/r/20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com
> > > > 
> > > > Changes in v7: Fixed review comments from Dmitry.
> > > > - Rebase to next-20250818 and 4 pixel stream series V6.
> > > > - Add more description for the dp-controller dt-bingding change.[Dmitry]
> > > > - Reorder the MDSS change and UBWC change.[Dmitry]
> > > > - Switch to the OSS email.
> > > > - Link to v6: https://lore.kernel.org/r/20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com
> > > > 
> > > > Changes in v6: Fixed review comments from Konrad, Dmitry.
> > > > - Rewrite commit msg in dp-controller dt-binding change.[Dmitry]
> > > > - Optimize the description in MDSS dt-binding.[Dmitry]
> > > > - Pass the sc8280xp_data as fallback in the UBWC change.[Konrad]
> > > > - Add the DP controller driver change.
> > > > - Link to v5: https://lore.kernel.org/r/20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com
> > > > 
> > > > Changes in v5:Fixed review comments from Krzysztof, Dmitry.
> > > > - Rebase to next-20250717.
> > > > - Change DP compatible to qcs8300-dp due to add 4 streams support.
> > > > - Add QCS8300 UBWC config change due to rebase.
> > > > - Add 4 streams clk and phy in the mdss yaml.
> > > > - Link to v4: https://lore.kernel.org/r/20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com
> > > > 
> > > > Changes in v4:Fixed review comments from Krzysztof, Dmitry.
> > > > - Use the common style for the dt-bindings commits.[Dmitry]
> > > > - Update the commits msg for the mdss binding patch, explain why they
> > > >     reuse different platform drivers.[Krzysztof]
> > > > - Link to v3: https://lore.kernel.org/r/20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com
> > > > 
> > > > Changes in v3:Fixed review comments from Krzysztof, Dmitry.
> > > > - Fix the missing space issue in commit message.[Krzysztof]
> > > > - Separate the patch for the phy from this series.[Dmitry]
> > > > - Remove unused dependencies and update in the cover letter.[Dmitry][Krzysztof]
> > > > - Link to v2: https://lore.kernel.org/r/20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com
> > > > 
> > > > Changes in v2:Fixed review comments from Krzysztof, Dmitry, Rob.
> > > > - Decouple the devicetree changes from this series.[Dmitry][Krzysztof]
> > > > - Drop the dpu driver changes and reuse SA8775P DPU driver.[Dmitry]
> > > > - Fix compilation issues in MDSS bindings.[Rob][Krzysztof]
> > > > - Correct formatting errors and remove unnecessary status in MDSS
> > > >     bindings.[Krzysztof]
> > > > - Add the the necessary information in MDSS changes commit msg.[Dmitry]
> > > > - Rebase MDSS driver changes to https://lore.kernel.org/dri-devel/
> > > >     20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/.[Dmitry]
> > > > - Package the DisplayPort controller and eDP PHY bindings document to
> > > >     this patch series.
> > > > - Collecting MDSS changes reviewd-by Dmitry.
> > > > - Reuse the sa8775p eDP PHY as a fallback compat.[Dmitry]
> > > > - Reuse the sm8650 DP controller as a fallback compat.[Dmitry]
> > > > - Link to v1: https://lore.kernel.org/r/20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com
> > > > ---
> > > > This series depend on 4 pixel streams dt-binding series:
> > > > https://lore.kernel.org/all/20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com/
> > > > 
> > > > and separate eDP PHY binding:
> > > > https://lore.kernel.org/all/20250730072725.1433360-1-quic_yongmou@quicinc.com/
> > > > 
> > > > ---
> > > > Yongxing Mou (6):
> > > >         dt-bindings: display/msm: Document the DPU for QCS8300
> > > >         dt-bindings: display/msm: dp-controller: document QCS8300 compatible
> > > >         dt-bindings: display/msm: Document MDSS on QCS8300
> > > >         soc: qcom: ubwc: Add QCS8300 UBWC cfg
> > > >         drm/msm: mdss: Add QCS8300 support
> > > >         drm/msm/dp: Add DisplayPort controller for QCS8300
> > > > 
> > > >    .../bindings/display/msm/dp-controller.yaml        |  22 ++
> > > >    .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 286 +++++++++++++++++++++
> > > >    .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  15 +-
> > > >    drivers/gpu/drm/msm/dp/dp_display.c                |   1 +
> > > >    drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
> > > >    drivers/soc/qcom/ubwc_config.c                     |   1 +
> > > >    6 files changed, 321 insertions(+), 5 deletions(-)
> > > > ---
> > > > base-commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
> > > > change-id: 20250818-qcs8300_mdss-a363f0d0ba0b
> > > > prerequisite-message-id: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
> > > > prerequisite-patch-id: ffeeb0739a4b3d310912f4bb6c0bd17802818879
> > > > prerequisite-patch-id: cdc3f4515ab23a8b2ce719bbdbcb56043803d03f
> > > > prerequisite-patch-id: 048b11765f49af4a728db1525fef1eb8ad48bf88
> > > > prerequisite-patch-id: f0f92109d1bfffa6a1142f2aaecbd72a29b858c0
> > > > prerequisite-patch-id: a8185cf3ddd85b9058691500b8dc0c57c8226e97
> > > > prerequisite-patch-id: a389a2e4eca44bf62bb2c861c96596368be7a021
> > > > prerequisite-patch-id: 09ec7f51de0a65c68c2c781750177017f32747ba
> > > > prerequisite-patch-id: f76ab0ae189df14acc851fa52f8f8e8faed9a505
> > > > prerequisite-patch-id: 983fc8a7bea459505c5b27db1a1ef7581936555c
> > > > prerequisite-message-id: <20250730072725.1433360-1-quic_yongmou@quicinc.com>
> > > > prerequisite-patch-id: 2ea89bba3c9c6ba37250ebd947c1d4acedc78a5d
> > > > 
> > > > Best regards,
> > > 
> > > Hi, maintainers:
> > > sorry for the inconvenience caused. This series is missing patch 5 and patch 6 due to network issues. May I resend it? The missed two changes are identical to V10.
> > 
> > You can fix that manually by sending them both through
> > 
> > b4 send -o /tmp/
> > git send-email --in-reply-to=<cover letter msgid> /tmp/0005-xyz-abc.patch
> > git send-email --in-reply-to=<cover letter msgid> /tmp/0006-xyz-abc.patch
> > 
> > Konrad
> Thanks for guide, when i use cmd  "git send-email
> --in-reply-to="20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com"
> ~/tmpyongmou/0005-drm-msm-mdss-add-qcs8300-support.eml", seems something
> wrong, error log:
> mou@oss.qualcomm.com>,  Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com>'
> (body) Adding cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> from
> line 'Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>'
> 5.1.3 The recipient address <y> is not a valid RFC 5321 address. For more
> 5.1.3 information, go to
> 5.1.3  https://support.google.com/a/answer/3221692 and review RFC 5321
> 5.1.3 specifications. d9443c01a7336-24b1ba1718bsm64512315ad.39 - gsmtpWould
> you mind sharing some suggestions for this? Thanks~~

When `git send-email` asks you, just press 'Enter', no extra chars. Or
it migth be easier to just `b4 send --resend`.

-- 
With best wishes
Dmitry
