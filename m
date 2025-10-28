Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE11C140BB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 11:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380B510E379;
	Tue, 28 Oct 2025 10:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="JD1RHsEV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995CA10E379;
 Tue, 28 Oct 2025 10:18:02 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SA3G141238177; Tue, 28 Oct 2025 10:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MGKDPJuZtjAxrjYhGFT8RJZr9Zo2yfRsW8QGozN2CcE=; b=JD1RHsEVQMfZw6Bc
 0ujWn82mVDZyit5vVP+3rnirjfvNrHKnQ2/D2mSoz9u1tpfEEkjF2oRh6X8BRmMd
 fRNJONfBLsckyqgXyDnN3fL0HlDyEJffIaoU/5c6vxwZsMgWhWhwFqDFPC1zwTTb
 BX5AJsW/7tzYm48aII9UCbJujh2uGrj86IidiMVeco5E4tsWo++xlEnlxlHaRDxB
 8Oa1PZ0wav73WziCZOQQNdQE6GtClG594Htp0CfrtrZLs5JqUX2Zf7X2rbRRC1cs
 AT19/6S331Doco6qH4F0hZWP2unyFDaKNGdb4/wBRtzJCRvpeVvorUBCEZ+KJ1zZ
 1uMTmw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2ur3g14y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Oct 2025 10:17:55 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59SAHsS8013435
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Oct 2025 10:17:54 GMT
Received: from [10.206.96.75] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 28 Oct
 2025 03:17:45 -0700
Message-ID: <9bddcef9-56dd-46be-9354-c47f15b900f4@quicinc.com>
Date: Tue, 28 Oct 2025 15:47:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: lemans: Add edp reference clock
 for edp phy
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <robin.clark@oss.qualcomm.com>, <lumag@kernel.org>,
 <abhinav.kumar@linux.dev>, <jessica.zhang@oss.qualcomm.com>,
 <sean@poorly.run>, <marijn.suijten@somainline.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <quic_mahap@quicinc.com>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <mani@kernel.org>,
 <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
 <vkoul@kernel.org>, <kishon@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>, <linux-phy@lists.infradead.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
 <quic_vproddut@quicinc.com>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
 <20251013104806.6599-4-quic_riteshk@quicinc.com>
 <c4bhkhw6xlaqlwhbataveafav6jcsrgnazk72lkgtj3fygwqjc@4bp5w4q5sygh>
From: Ritesh Kumar <quic_riteshk@quicinc.com>
In-Reply-To: <c4bhkhw6xlaqlwhbataveafav6jcsrgnazk72lkgtj3fygwqjc@4bp5w4q5sygh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA4NyBTYWx0ZWRfX1EF3sIFgt2Qw
 TMU/4Tn9tkFVdEAs3L+ssjUakiYviKALHHiVlOr4IfSaCINBMf5FnDwmccqrwZyDdM99rsGQ91A
 tKBBqNP8ydMT2NB87zs7lD0NgMnqf/mqhiOqO7TQl+vYuuVincbQJkrE1fadsuCxAREp/wOPCa5
 s7B4XgH0SL6dPnYoEe0iWHyU7R6wi2+kD3mPlEU7z7cDFDayariqC0Sxoitlo8nhO8HsYv44Ywj
 ExRSnp4RQv/A7NUpraxui4foMafDytSkhN57HVXXR4O7OCd8WW0BmK5bPmvLwwMqXbaxXq1Z/zl
 LezFnmSyzUp7wh1RQ/5ehHjJAaTPxT2HgAmA2MzTpIaNs/GuiNpDIA3RWXLhpoF/wtR28oCao50
 9VSg2zh8SO6NJW+s2z8nRzRVXMdLfg==
X-Authority-Analysis: v=2.4 cv=Jub8bc4C c=1 sm=1 tr=0 ts=69009853 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=uennSmqHBHGcuoTQaU0A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-GUID: qrXBQMZvM0paN3xBsggAJcVzc11zzxeK
X-Proofpoint-ORIG-GUID: qrXBQMZvM0paN3xBsggAJcVzc11zzxeK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280087
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


On 10/13/2025 6:05 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 13, 2025 at 04:18:06PM +0530, Ritesh Kumar wrote:
> > Add edp reference clock for edp phy on lemans chipset.
>
> eDP, PHY, Fixes:foo bar baz

Sure, will update in next version.

>
> > 
> > Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/lemans.dtsi | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > index cf685cb186ed..1bcf1edd9382 100644
> > --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > @@ -5034,9 +5034,11 @@
> >  				      <0x0 0x0aec2000 0x0 0x1c8>;
> >  
> >  				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
> > -					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
> > +					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> > +					 <&gcc GCC_EDP_REF_CLKREF_EN>;
> >  				clock-names = "aux",
> > -					      "cfg_ahb";
> > +					      "cfg_ahb",
> > +					      "ref";
> >  
> >  				#clock-cells = <1>;
> >  				#phy-cells = <0>;
> > @@ -5053,9 +5055,11 @@
> >  				      <0x0 0x0aec5000 0x0 0x1c8>;
> >  
> >  				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
> > -					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
> > +					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> > +					 <&gcc GCC_EDP_REF_CLKREF_EN>;
> >  				clock-names = "aux",
> > -					      "cfg_ahb";
> > +					      "cfg_ahb",
> > +					      "ref";
> >  
> >  				#clock-cells = <1>;
> >  				#phy-cells = <0>;
> > -- 
> > 2.17.1
> > 
>
