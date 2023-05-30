Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 226FC71672C
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 17:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0F410E3CB;
	Tue, 30 May 2023 15:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C3910E3C3;
 Tue, 30 May 2023 15:35:24 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34UCJp1K024095; Tue, 30 May 2023 15:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=skSq/3wjBOOrOFYaFyqU5datAvG+hJCy5UlbCpb6VpU=;
 b=NH8a+1AlJziAmcV58Qt/0Gt45OzWRQgtcf2UZE3UemSkxfPrh2XzLf2EPJN2jNleZ2A7
 c+NdupLmhSd5vVx6dq701ZbCSABoVYrUjuKlpXcgs9Vp/axXAlG4L60bu07ZRHNoV9Ku
 lTWOCfrkE/6IKITYCAQAtkGXqeVoy+KvzqB3zfmiccKXjtaXEvT7lbcd4RLzIf61tUKR
 cVzGgRvzfxiRjO+dJxC1IGDnwfxKoqEtFlKoXNg1hLENlGKz81LtXMxNKoLtyh76qtS0
 kLr4Hbp7atuzko1gSeoial2xddN3p69pbmrZWZRgVBBI0xuGT4BSfQADhH5YReVvidy+ MA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qw83csgq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 May 2023 15:35:16 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34UFZFns025420
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 May 2023 15:35:15 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 30 May 2023 08:35:15 -0700
Date: Tue, 30 May 2023 08:35:14 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sc8280xp: Add GPU related nodes
Message-ID: <20230530153514.GB3643653@hu-bjorande-lv.qualcomm.com>
References: <20230523011522.65351-1-quic_bjorande@quicinc.com>
 <20230523011522.65351-3-quic_bjorande@quicinc.com>
 <097944b0-fa7a-ad4d-1c3d-e74ab2b977de@linaro.org>
 <20230528170717.GG2814@thinkpad>
 <a64ac105-90cf-eea0-5cb2-74be201386a9@linaro.org>
 <20230529084614.GA5633@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230529084614.GA5633@thinkpad>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Iaw4nqPVzVr6xQzEOckkqYwyln9jy74X
X-Proofpoint-GUID: Iaw4nqPVzVr6xQzEOckkqYwyln9jy74X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_11,2023-05-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 mlxlogscore=917 priorityscore=1501 spamscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305300125
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
Cc: devicetree@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 johan@kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 29, 2023 at 02:16:14PM +0530, Manivannan Sadhasivam wrote:
> On Mon, May 29, 2023 at 09:38:59AM +0200, Konrad Dybcio wrote:
> > On 28.05.2023 19:07, Manivannan Sadhasivam wrote:
> > > On Tue, May 23, 2023 at 09:59:53AM +0200, Konrad Dybcio wrote:
> > >> On 23.05.2023 03:15, Bjorn Andersson wrote:
> > >>> From: Bjorn Andersson <bjorn.andersson@linaro.org>
[..]
> > >>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
[..]
> > >>> +		gmu: gmu@3d6a000 {
[..]
> > >>> +			status = "disabled";
> > >> I've recently discovered that - and I am not 100% sure - all GMUs are
> > >> cache-coherent. Could you please ask somebody at qc about this?
> > >>
> > > 
> > > AFAIU, GMU's job is controlling the voltage and clock to the GPU.
> > Not just that, it's only the limited functionality we've implemented
> > upstream so far.
> > 
> 
> Okay, good to know!
> 
> > It doesn't do
> > > any data transactions on its own.
> > Of course it does. AP communication is done through MMIO writes and
> > the GMU talks to RPMh via the GPU RSC directly. Apart from that, some
> > of the GPU registers (that nota bene don't have anything to do with
> > the GMU M3 core itself) lay within the GMU address space.
> > 

But those aren't shared memory accesses.

> 
> That doesn't justify the fact that cache coherency is needed, especially
> MMIO writes, unless GMU could snoop the MMIO writes to AP caches.
> 

In reviewing the downstream state again I noticed that the GPU smmu is
marked dma-coherent, so I will adjust that in v3.

Regards,
Bjorn
