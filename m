Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB11A030F7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 20:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA01110E369;
	Mon,  6 Jan 2025 19:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="h+BV8lyM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A905910E23B;
 Mon,  6 Jan 2025 19:55:55 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506I3PEl021863;
 Mon, 6 Jan 2025 19:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 69S6/yCDEUmLTLWLaZeiznwVrsvneuJf/fMeApdwdBo=; b=h+BV8lyM/YeuT9Xu
 bRG6JLIq1dvMdXFXU/mWQ8vlPTzfAOGvlIaZ00EVMQME5/4MnsfcY8AoLWInMdDv
 5ZEDZmpVYmPSvPVyaBoq4qlTvyNTdAE5+uc3RAqMb+O5wBkV+IsJnx4GV2RFQ/kl
 CqKq/+56nuKDyIPx1eU/NfKYkdFbBCTnjkJVsxR+g4JXg1z/c4yyFS3GK6ygBZZj
 QL/DU+00tcyFUaUTwQc4RPGKj6QhoFp/fKsvqg63tqkAyK0HGFPOOss2A6sr5Tp/
 ycEPnyUYbmJX5ckSS6NmQHU4J/iMqNjIH4YyKSG3w+8vn87X82ZzbydaAIXWuodT
 KeM8qw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440m4a078y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2025 19:55:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 506Jtm87008786
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 6 Jan 2025 19:55:48 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 6 Jan 2025 11:55:43 -0800
Date: Tue, 7 Jan 2025 01:25:39 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Maya Matuszczyk <maccraft123mc@gmail.com>
CC: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 0/6] Support for GPU ACD feature on Adreno X1-85
Message-ID: <20250106195539.tcta6yoyijfrgzhh@hu-akhilpo-hyd.qualcomm.com>
References: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
 <CAO_MupJ21kOQPZG_=87mC-fQKmL=-K9AgOjriWR=wXCKU0897w@mail.gmail.com>
 <CAF6AEGvYFL9Q88c727eFrTgDb+FvnPm2d=6niLu80DM1DJdm5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvYFL9Q88c727eFrTgDb+FvnPm2d=6niLu80DM1DJdm5g@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: fhsolYq8FXxnhPD0-PEQ5aGzumBNI4TN
X-Proofpoint-ORIG-GUID: fhsolYq8FXxnhPD0-PEQ5aGzumBNI4TN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501060173
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

On Sun, Jan 05, 2025 at 04:55:42PM -0800, Rob Clark wrote:
> fwiw, I did see some perf boost (was mainly looking at gfxbench aztec
> ruins vk high/normal, and also a separate mesa MR that fixes some LRZ
> issues with turnip, so I don't remember how much boost was related to
> which offhand)..  I've not seen corruption yet (gnome-shell / f41),
> although what you describe sounds cache-line(ish) and could be just
> timing related.  You could limit max freq via
> /sys/devices/platform/soc@0/3d00000.gpu/devfreq/3d00000.gpu/max_freq
> and see if that "fixes" things.  I don't really expect this patchset
> to introduce these sorts of issues, but maybe the increased freq
> exposes some preexisting conditions?

Actually, ACD related issues may show up as weird glitches in HW because
of HW spec violation. These issues are very very rare in production
devices though. And the behavior may vary between devices due to silicon
variations.

@Maya, thanks for testing this series. Sorry, one of my patch is buggy.
Could you please apply the below diff and check once?

--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -725,7 +725,7 @@ static int a6xx_hfi_enable_acd(struct a6xx_gmu *gmu)
        }

        /* Send ACD table to GMU */
-       ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_ACD, &msg, sizeof(msg), NULL, 0);
+       ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_ACD, acd_table, sizeof(*acd_table), NULL, 0);
        if (ret) {
                DRM_DEV_ERROR(gmu->dev, "Unable to ACD table (%d)\n", ret);
                return ret;

--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -109,7 +109,7 @@ static int a6xx_hfi_wait_for_ack(struct a6xx_gmu *gmu, u32 id, u32 seqnum,

        /* Wait for a response */
        ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
-               val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 5000);
+               val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 1000000);

        if (ret) {
                DRM_DEV_ERROR(gmu->dev,


-Akhil
> 
> BR,
> -R
> 
> On Sun, Jan 5, 2025 at 9:56 AM Maya Matuszczyk <maccraft123mc@gmail.com> wrote:
> >
> > Hi,
> > I've applied this series for testing, and I've no performance
> > increase, and some screen corruption, there's some lines(mostly white)
> > on my yoga slim 7x that appear on the bottom of the screen. When I
> > move my cursor in swaywm over it, the lines get occluded by the cursor
> > and screenshots don't show these lines.
> >
> > Best Regards,
> > Maya Matuszczyk
> >
> > pon., 30 gru 2024 o 22:11 Akhil P Oommen <quic_akhilpo@quicinc.com> napisał(a):
> > >
> > > This series adds support for ACD feature for Adreno GPU which helps to
> > > lower the power consumption on GX rail and also sometimes is a requirement
> > > to enable higher GPU frequencies. At high level, following are the
> > > sequences required for ACD feature:
> > >         1. Identify the ACD level data for each regulator corner
> > >         2. Send a message to AOSS to switch voltage plan
> > >         3. Send a table with ACD level information to GMU during every
> > >         gpu wake up
> > >
> > > For (1), it is better to keep ACD level data in devicetree because this
> > > value depends on the process node, voltage margins etc which are
> > > chipset specific. For instance, same GPU HW IP on a different chipset
> > > would have a different set of values. So, a new schema which extends
> > > opp-v2 is created to add a new property called "qcom,opp-acd-level".
> > >
> > > ACD support is dynamically detected based on the presence of
> > > "qcom,opp-acd-level" property in GPU's opp table. Also, qmp node should be
> > > present under GMU node in devicetree for communication with AOSS.
> > >
> > > The devicetree patch in this series adds the acd-level data for X1-85
> > > GPU present in Snapdragon X1 Elite chipset.
> > >
> > > The last two devicetree patches are for Bjorn and all the rest for
> > > Rob Clark.
> > >
> > > ---
> > > Changes in v3:
> > > - Rebased on top of v6.13-rc4 since X1E doesn't boot properly with msm-next
> > > - Update patternProperties regex (Krzysztof)
> > > - Update MAINTAINERS file include the new opp-v2-qcom-adreno.yaml
> > > - Update the new dt properties' description
> > > - Do not move qmp_get() to acd probe (Konrad)
> > > - New patches: patch#2, #3 and #6
> > > - Link to v2: https://lore.kernel.org/r/20241021-gpu-acd-v2-0-9c25a62803bc@quicinc.com
> > >
> > > Changes in v2:
> > > - Removed RFC tag for the series
> > > - Improve documentation for the new dt bindings (Krzysztof)
> > > - Add fallback compatible string for opp-table (Krzysztof)
> > > - Link to v1: https://lore.kernel.org/r/20241012-gpu-acd-v1-0-1e5e91aa95b6@quicinc.com
> > >
> > > ---
> > > Akhil P Oommen (6):
> > >       drm/msm/adreno: Add support for ACD
> > >       drm/msm: a6x: Rework qmp_get() error handling
> > >       drm/msm/adreno: Add module param to disable ACD
> > >       dt-bindings: opp: Add v2-qcom-adreno vendor bindings
> > >       arm64: dts: qcom: x1e80100: Add ACD levels for GPU
> > >       arm64: dts: qcom: x1e80100: Add OPPs up to Turbo L3 for GPU
> > >
> > >  .../bindings/opp/opp-v2-qcom-adreno.yaml           | 97 ++++++++++++++++++++++
> > >  MAINTAINERS                                        |  1 +
> > >  arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 25 +++++-
> > >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 96 ++++++++++++++++++---
> > >  drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |  1 +
> > >  drivers/gpu/drm/msm/adreno/a6xx_hfi.c              | 36 ++++++++
> > >  drivers/gpu/drm/msm/adreno/a6xx_hfi.h              | 21 +++++
> > >  drivers/gpu/drm/msm/adreno/adreno_device.c         |  4 +
> > >  8 files changed, 268 insertions(+), 13 deletions(-)
> > > ---
> > > base-commit: dbfac60febfa806abb2d384cb6441e77335d2799
> > > change-id: 20240724-gpu-acd-6c1dc5dcf516
> > >
> > > Best regards,
> > > --
> > > Akhil P Oommen <quic_akhilpo@quicinc.com>
> > >
> > >
