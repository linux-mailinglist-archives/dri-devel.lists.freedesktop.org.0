Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C0A8A1FE8
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 22:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7635F10F31D;
	Thu, 11 Apr 2024 20:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="o/fm7/6X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C39010F31D;
 Thu, 11 Apr 2024 20:09:43 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43BK9b50030157; Thu, 11 Apr 2024 20:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=qcppdkim1; bh=oT+kBQk8myAJZWEuknOlg
 stGciuw3yJhM5+CnC+sUXI=; b=o/fm7/6XdJLGpgcBILMKFyA6DSkQs3lCmcpj/
 /QxMNCtlhdtKr8e22vIJx2ECce80B24H+b6D3xMTfIiGK1l+j4DvoHnzQPvR44i9
 BG7osgp2o5nrMMY1ovK8wfL7f+MZBgBLFjOTnrSiPpZy1+KTbu1mpnkTi/OqRNUE
 6ncyaSNbvSJzGB9MB6ZcMO6ouCTqW+unR5KUXumZiDt8hMVqXXHzUf1Q48ytB/vt
 SpMhLJxBR9/iv5wD2kkOw/VX9LCuZdYnkp5USUHqfVgCnp9pHBBi79mC2yIoKA3b
 PUGuYCOEKbSpyrctS7+IKbQsHm0fhiTLCf0SGjsLW0ti+lqbw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xedugsme8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Apr 2024 20:09:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BK9a6Z010806
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Apr 2024 20:09:36 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 11 Apr 2024 13:09:35 -0700
Date: Thu, 11 Apr 2024 13:09:35 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/6] soc: qcom: Move some socinfo defines to the header,
 expand them
Message-ID: <20240411130802689-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-1-ce2b864251b1@linaro.org>
 <20240410132510649-0700.eberman@hu-eberman-lv.qualcomm.com>
 <2c2bca6c-b429-4cef-b63a-ee3bd6c9eecb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2c2bca6c-b429-4cef-b63a-ee3bd6c9eecb@linaro.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: N-2hjQ6NN5_fsWQdiyhe_wsTQEBaVcKO
X-Proofpoint-ORIG-GUID: N-2hjQ6NN5_fsWQdiyhe_wsTQEBaVcKO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_10,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404110148
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

On Thu, Apr 11, 2024 at 10:05:30PM +0200, Konrad Dybcio wrote:
> 
> 
> On 4/11/24 20:55, Elliot Berman wrote:
> > On Fri, Apr 05, 2024 at 10:41:29AM +0200, Konrad Dybcio wrote:
> > > In preparation for parsing the chip "feature code" (FC) and "product
> > > code" (PC) (essentially the parameters that let us conclusively
> > > characterize the sillicon we're running on, including various speed
> > > bins), move the socinfo version defines to the public header and
> > > include some more FC/PC defines.
> > > 
> > > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > ---
> 
> [...]
> 
> > > +	SOCINFO_FC_EXT_RESERVE,
> > > +};
> > 
> > SOCINFO_FC_EXT_RESERVE was a convenient limit since we mapped
> > SOCINFO_FC_AA -> string "AA" via an array, and we've only needed the 8
> > feature codes so far.
> > 
> > We should remove the EXT_RESERVE and test for the Y0-YF (internal
> > feature code) values instead.
> 
> OK
> 
> > 
> > > +
> > > +/* Internal feature codes */
> > > +/* Valid values: 0 <= n <= 0xf */
> > > +#define SOCINFO_FC_Yn(n)		(0xf1 + n)
> > > +#define SOCINFO_FC_INT_RESERVE		SOCINFO_FC_Yn(0x10)
> > 
> > We probably should've named this SOCINFO_FC_INT_MAX. Reserve implies
> > it's reserved for some future use, but it's really the max value it
> > could be.
> 
> So, should SOCINFO_FC_Yn(0x10) also be considered valid, or is (0xf)
> the last one?
> 

0xf is the last one.

Thanks,
Elliot

> > 
> > > +
> > > +/* Product codes */
> > > +#define SOCINFO_PC_UNKNOWN		0
> > > +/* Valid values: 0 <= n <= 8, the rest is reserved */
> > > +#define SOCINFO_PCn(n)			(n + 1)
> > > +#define SOCINFO_PC_RESERVE		(BIT(31) - 1)
> > 
> > Similar comments here as the SOCINFO_FC_EXT_*. It's more like known
> > values are [0,8], but more values could come in future chipsets.
> 
> Ok, sounds good, I'll remove the comment then
> 
> Konrad
