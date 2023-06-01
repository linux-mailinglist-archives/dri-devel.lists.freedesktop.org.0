Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE08B71F267
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 20:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9BA10E255;
	Thu,  1 Jun 2023 18:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AE210E267;
 Thu,  1 Jun 2023 18:51:28 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 351Fh8rQ010572; Thu, 1 Jun 2023 18:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=/o27oaTZwom7lgPceWI/6gu5Br5ovRQKkXhKmeNeyuE=;
 b=A8H1zCd8XwBt8n3x2ln3ZgOeqFxA5IKhD8SL4LYfAmf55rTTffH8kKvg79UPc1XrShcl
 lZvrTiSXbonGw0l3huQbmv7Sgi0OQq57MCZPRhp45j0DVJNpUFseS5WzJuLqUmmI1rjX
 f1gKZnNjEAx5E3aSE4sS6bP+juOdti97heV9kK91boD9KUn24Vyr52/U2dWNWlhHHZSS
 yEBShlbKlAZuV0UTPFzZ5YpjrSbgGNzpWdIZvIw2Ke7Zu01MvGXa4Tw7UaHGoOLmyORD
 t1VRK+J30g/DlODr2ocvKPqdrYA+1ynqmiuR64dF5DgL9WFCTwJmlkzkweIvHAooZ5M3 NQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qxqyd9kax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jun 2023 18:51:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 351IpNxB030625
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Jun 2023 18:51:23 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 1 Jun 2023 11:51:19 -0700
Date: Fri, 2 Jun 2023 00:21:17 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sc8280xp: Add GPU related nodes
Message-ID: <wirvpuzwcqn4ywvhshyfxp3upk6elc5walifaokapftqoiipxp@62h5ev3neofu>
References: <20230523011522.65351-1-quic_bjorande@quicinc.com>
 <20230523011522.65351-3-quic_bjorande@quicinc.com>
 <097944b0-fa7a-ad4d-1c3d-e74ab2b977de@linaro.org>
 <20230528170717.GG2814@thinkpad>
 <a64ac105-90cf-eea0-5cb2-74be201386a9@linaro.org>
 <20230529084614.GA5633@thinkpad>
 <20230530153514.GB3643653@hu-bjorande-lv.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230530153514.GB3643653@hu-bjorande-lv.qualcomm.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: l4PvP01TFZIut_KzpnBA0p8yEAcT8jnW
X-Proofpoint-GUID: l4PvP01TFZIut_KzpnBA0p8yEAcT8jnW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=816 phishscore=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2306010163
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
Cc: devicetree@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 johan@kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 30, 2023 at 08:35:14AM -0700, Bjorn Andersson wrote:
> 
> On Mon, May 29, 2023 at 02:16:14PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, May 29, 2023 at 09:38:59AM +0200, Konrad Dybcio wrote:
> > > On 28.05.2023 19:07, Manivannan Sadhasivam wrote:
> > > > On Tue, May 23, 2023 at 09:59:53AM +0200, Konrad Dybcio wrote:
> > > >> On 23.05.2023 03:15, Bjorn Andersson wrote:
> > > >>> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> [..]
> > > >>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> [..]
> > > >>> +		gmu: gmu@3d6a000 {
> [..]
> > > >>> +			status = "disabled";
> > > >> I've recently discovered that - and I am not 100% sure - all GMUs are
> > > >> cache-coherent. Could you please ask somebody at qc about this?
> > > >>
> > > > 
> > > > AFAIU, GMU's job is controlling the voltage and clock to the GPU.
> > > Not just that, it's only the limited functionality we've implemented
> > > upstream so far.
> > > 
> > 
> > Okay, good to know!
> > 
> > > It doesn't do
> > > > any data transactions on its own.
> > > Of course it does. AP communication is done through MMIO writes and
> > > the GMU talks to RPMh via the GPU RSC directly. Apart from that, some
> > > of the GPU registers (that nota bene don't have anything to do with
> > > the GMU M3 core itself) lay within the GMU address space.
> > > 
> 
> But those aren't shared memory accesses.
> 
> > 
> > That doesn't justify the fact that cache coherency is needed, especially
> > MMIO writes, unless GMU could snoop the MMIO writes to AP caches.
> > 
> 
> In reviewing the downstream state again I noticed that the GPU smmu is
> marked dma-coherent, so I will adjust that in v3.
Bjorn,

Would you mind sharing a perf delta (preferrably manhattan offscreen)
you see with and without this dma-coherent property?

-Akhil.
> 
> Regards,
> Bjorn
