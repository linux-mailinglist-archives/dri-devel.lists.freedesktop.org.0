Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 952F2B0D9E6
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 14:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49AC10E676;
	Tue, 22 Jul 2025 12:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hApQCgri";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE9810E677
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 12:41:31 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7cZU6010840
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 12:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HPoaxvi/5bO/h7eZRr8RStad9S7OsZapYBjDAZ9z2vs=; b=hApQCgrivdspZnYY
 3OERPstgvrzphY/dKNp579DQ5dYZPAnwmJqrCMvSkEwl4W4eHhsTJaToolr8zHqk
 jDGQvPJUFULQ/6tu14rdMZi1Z03vW0C1DXIypjeTuB0greUXJTUznDHVh6bSu8dx
 9SbMC3P6C/CQUTGSwvg+sGeXYyDuDL/Wzgj4t6ekEG16aPS5QcaY/uQqhln5OMFg
 SctF1KaauPW328JGVJ5sjps8vfMfScEX5mN+UNpx9qySgJEkW5P5QMmJTaPCp8Gs
 Cy4AHFzviMAySdPyS4LnKrs03avf+8RfncCl/CFOOgAD8AUup1jysp1KO8BXeFB1
 F7eThg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045vys62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 12:41:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e33af599bcso857119985a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 05:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753188089; x=1753792889;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HPoaxvi/5bO/h7eZRr8RStad9S7OsZapYBjDAZ9z2vs=;
 b=rfIMfCcdLQ6zvsb7lBcDZ+vzPK4ywqm9xlRW4vyyy+0eu3OgGPIe4hcMTaN+ttXaLN
 FOkMVnIpobF+1HjIENPP2T0Cfx+vzhbW9YX67azzEppU99YWPHuaW6c81BWUCjN64EFq
 Ztxn1gMdsHgNHKrpUNANOeRQvhZkWWg+cREUhEL886lVqci5PGglrbcGJweg+LSr22x9
 hn8Jq7tdTfE8a15R55Hu7cYTlgB4yBg0fp+ct6RdcVjEhHXUwlHxMEK2/kqaEyDbVbO3
 dpsXGpZTOokDe4OU8E6LUcOGrXrboS2XgR/xb5+aWA3o1rpadk8bmsKytwiumq8QIxF0
 zWsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX03lt+P1F4GDGEdwiBB+JHs3Mvm66LzR9HTHAX7G74fIjb+RYYaEkC/XXNgYNwyAp7Uu905E394wE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUx7yMlkRK+O18cfKRQ3NXeU727GB57yqdw3U16p1M22OVjBg8
 M7OraTbQFuwsqcEh3Dm4Yjaz0k1WnHYap/24WhDPLJs1Txe0SRSQdxPzUaAIQ/HXAqDm7ZU6HWt
 mVHWmzF+Btw5ZTKyPFhCNoxQM4Hip/IjUT6oT2Bqba/lBoD3C12j0HKbfoWOwczeq2O6iST4=
X-Gm-Gg: ASbGnctaqnYjQrnhyCrI4WEyjCXRzVzs4I1QZaD351EqUebK7z72GgxcuUQIOg0rleY
 2QKpPlUfp5D2M9ddBXmuw+iJNP/RdjCwE6eehy8vEdbUmvjneH2UrW21XGQ4zAwY9dqA72JF+jD
 MT97ZuxyRVS3gJyHnI5Rd0ay0ZWjSZWPcC38szZWNbT5PVbStLcdMuHRSaz8IJrTo1evyjVtrbT
 5cYkEyfDabzx0ptKSklDieZ23zBU5p1Jxnh57jJvTfXe/MulFfcob00l1a2FpVw4AdNlGUwLQl8
 qmaxBO6N3i1aOeZ4fV6reVvuAh4h5j93QdztX5RShxsLEXM787MudZlWdHY76fNyTdNGvhAJsOs
 ICaviF8LM9l8u3t0cvdShmL0wtgDabNVp+Z6Wh14nZIB91JRbp13l
X-Received: by 2002:a05:620a:a111:b0:7e0:6aa7:386 with SMTP id
 af79cd13be357-7e34d8fc169mr2764100885a.19.1753188088845; 
 Tue, 22 Jul 2025 05:41:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA4wANK0XSCQTa2429llOZl1wgDzsnRsA6lFOrCo2WksXeOi8CYcvEop+soj69BYJ4tBRyrQ==
X-Received: by 2002:a05:620a:a111:b0:7e0:6aa7:386 with SMTP id
 af79cd13be357-7e34d8fc169mr2764096785a.19.1753188088259; 
 Tue, 22 Jul 2025 05:41:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a35b5a7dfsm1746438e87.227.2025.07.22.05.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 05:41:27 -0700 (PDT)
Date: Tue, 22 Jul 2025 15:41:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 konrad.dybcio@oss.qualcomm.com, fange.zhang@oss.qualcomm.com,
 quic_lliu6@quicinc.com, quic_yongmou@quicinc.com
Subject: Re: [PATCH v2 02/13] dt-bindings: phy: Add binding for QCS615
 standalone QMP DP PHY
Message-ID: <w3rwao5wbmstdyics6qhp7beulbbp5ludqkwpfsmevgqmzz3d6@u2e533zlitkr>
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
 <20250722-add-displayport-support-for-qcs615-platform-v2-2-42b4037171f8@oss.qualcomm.com>
 <jemfu5sy7k4a2iar55im5bhyhxzlrwpftmpqmps3b2tco7r6a2@oodls7gi45yy>
 <e673a3a3-6924-49db-9040-e34b82199a43@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e673a3a3-6924-49db-9040-e34b82199a43@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=687f86fa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=Oh2cFVv5AAAA:8 a=EUspDBNiAAAA:8 a=O_WmNVlCytCE8eSXzh4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-GUID: jnThLrniJikdJgHrTRat6MXV_GzRKdj2
X-Proofpoint-ORIG-GUID: jnThLrniJikdJgHrTRat6MXV_GzRKdj2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEwMyBTYWx0ZWRfX9on1/e0531UW
 TL1UPHGTq2JJWccfddjXaQsBVxlhWXKwmjQNODBW9BOK9zYNIsWuyJQuxWJJNmrs/NNcGs5vaCT
 g6MT787ICVXcvMT1Ee9dzxO7DS/8ImyxdrcckjRx92RbunAkpLrtRtkXyovKWtrN8cI8OZQi3Ok
 T9IORXVPrbITg4Ht+Dn+zhb1fE4AStQA8GjhSInMOvOwZZyR0wwLgIj1n9hDAJG+RPSbFup7cHt
 rlUL64Krcij6BS2+RksjcALhfys/nuAjzv2wnTdYQ72MslYRan/OhyW3Tl3LHbezXCRapl1fFlu
 1I69V/9mL56x75MtO8xk24WYkbPMaRRFuoiEHB7MQngZcp+d0me9NA0SJJVBXCKRhYwP2LmJclK
 4jvkphw5N8CW6VogRlpfEhizN44Nvu46csW9qPtHLBRrbQnc+xyX6v+lF25sg/CAAfNqAub1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220103
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

On Tue, Jul 22, 2025 at 08:05:06PM +0800, Xiangxu Yin wrote:
> 
> On 7/22/2025 4:38 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 22, 2025 at 03:22:03PM +0800, Xiangxu Yin wrote:
> >> Introduce device tree binding documentation for the Qualcomm QMP DP PHY
> >> on QCS615 SoCs. This PHY supports DisplayPort functionality and is
> >> designed to operate independently from the USB3 PHY.
> >>
> >> Unlike combo PHYs found on other platforms, the QCS615 DP PHY is
> >> standalone and does not support USB/DP multiplexing. The binding
> >> describes the required clocks, resets, TCSR configuration, and clock/PHY
> >> cells for proper integration.
> > Simply put: no, this is not correct. Even if you go to the SM6150 block
> > diagram, it points out that DP uses the USB3 PHY, not a separate DP PHY.
> >
> > I thought that we have discussed it beforehand.
> >
> > I can quote my comment from the previous thread:
> >
> >>> No. It means replacing extending existing entries with bigger reg and
> >>> #phy-cells = <1>. The driver must keep working with old node definitions
> >>> as is to ensure backwards compatibility. New nodes should make it
> >>> register two PHYs (USB3 and DP). On the driver side modify generic code
> >>> paths, all platforms supported by the driver should be able to support
> >>> USB3+DP combination.
> > Looking at the hardware memory maps:
> >
> > MSM8998: USB3 PHY regs at 0xc010000, DP PHY regs at 0xc011000
> > SDM660: USB3 PHY regs at 0xc010000, DP PHY regs at 0xc011000
> > QCM2290: USB3 PHY regs at 0x1615000, DP PHY regs at 0x1616000
> > SM6115: USB3 PHY regs at 0x1615000, DP PHY regs at 0x1616000
> >
> > Now:
> > SM6150: USB3 PHY regs at 0x88e6000
> >         USB3 PHY regs at 0x88e8000, DP PHY regs at 0x88e9000
> >
> > I do not know, why msm-4.14 didn't describe second USB3 PHY. Maybe you
> > can comment on it.
> >
> > But based on that list, the only special case that we need to handle is
> > the first USB3 PHY, which doesn't have a corresponding DP PHY block. But
> > it will be handled anyway by the code that implements support for the
> > existing DT entries. All other hardware blocks are combo USB+DP PHYs.
> >
> > Having all of that in mind, please, for v3 patchset implement USB+DP
> > support in the phy-qcom-qmp-usbc driver and add the following logic
> > that also was requested in v1 review:
> >
> >>> Not quite. Both USB3 and DP drivers should be calling power_on / _off.
> >>> If USB3 is on, powering on DP PHY should fail. Vice versa, if DP is on,
> >>> powering on USB should fail.
> > I think our understanding might not be fully aligned. 

I did not write this. Please fix your mailer to quote messages properly.
As you are using Thunderbird, I'm not sure where the issue comes from.

Also please fix it to wrap your responses somwhere logically.

> > Perhaps this is because I didn’t accurately update the mutual exclusion relationships and test results for the different PHYs. 
> > Let me clarify my latest findings and explain why I believe these are separate PHYs that require mutual exclusion via TCSR.
> >
> > 1. About the TCSR DP_PHYMODE Registers
> >
> > MSM8998/SDM660:
> > 	Only one TCSR_USB3_DP_PHYMODE register at 0x1FCB248.
> > QCM2290/SM6115:
> > 	TCSR_USB3_0_DP_PHYMODE at 0x3CB248
> > 	TCSR_USB3_1_DP_PHYMODE at 0x3CB24C
> > SM6150:
> > 	TCSR_USB3_0_DP_PHYMODE at 0x1FCB248
> > 	TCSR_USB3_1_DP_PHYMODE at 0x1FCB24C

SM6150 has two different sets of output pins, so the first register
covers first set of SS lanes (which are routed to the documented SS
PHY), the second register covers the second set of SS lanes (which are
routed to the DP and secondary USB PHY).

I can only assume that the same configuration was supposed to be
applicable to QCM2290 / SM6115, but was later removed / disabled, while
the registers were kept in the TCSR block.

> > Even though MSM8998, SDM660, QCM2290, and SM6115 all have one USB3 PHY and one DP PHY, the TCSR DP_PHYMODE register configuration is different on each platform.
> >
> > Additionally, I found some interesting register documentation for QCM2290/SM6115:
> > 	TCSR_USB3_0_DP_PHYMODE: “In kamorta this one is for mobile usb. DP not supported.”
> > 	TCSR_USB3_1_DP_PHYMODE: “DP mode supported for Auto usb in kamorta.”
> > I think the reason for having two different TCSR registers is to allow both the USB3.0 and DP PHYs to be useds at the same time in certain product configurations.

Sure. One for the first PHY (USB), one for the second PHY (USB+DP).
If you check the memory map, you will find the second VLS CLAMP register
for the second USB PHY.

> >
> > 2. SM6150 Test Results
> > When TCSR_DP_PHYMODE_0 is switched to DP, the USB3 primary PHY cannot work, and the DP PHY is also not functional (possibly due to clock lack or other configuration mismatch with this TCSR setting).
> > When TCSR_DP_PHYMODE_1 is switched to DP, both the USB3 primary PHY and the DP PHY work normally.
> > I think "why msm-4.14 didn't describe second USB3 PHY", because TCSR_DP_PHYMODE_1 always works in DP mode.
> > https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c67d4f1915b05d0c1488/drivers/gpu/drm/msm/dp/dp_catalog_v200.c

Here it still programs the TCSR register.

> >
> > Based on these info, I believe these are separate PHYs, and only the
> > TCSR DP_PHYMODE registers determine which USB3/DP PHYs are paired or
> > mutually exclusive. This is why I have maintained separate private
> > data for each PHY and implemented Power on mutex control via TCSR,
> > rather than using a qmp_combo-like structure.

Still, no. Check the block diagram of SM6150.

> >
> > Given the above, do you think we still need to force USB and DP to be strictly bound together like a combo PHY?

Yes.

> >
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  .../bindings/phy/qcom,qcs615-qmp-dp-phy.yaml       | 111 +++++++++++++++++++++
> >>  1 file changed, 111 insertions(+)
> >>

-- 
With best wishes
Dmitry
