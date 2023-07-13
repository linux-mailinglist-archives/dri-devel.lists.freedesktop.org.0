Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B49A752B29
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 21:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA2610E0A8;
	Thu, 13 Jul 2023 19:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C4E10E0A8;
 Thu, 13 Jul 2023 19:46:33 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36DIk8mV011801; Thu, 13 Jul 2023 19:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=ZMjWNYjfFS1fBTnHIK743de/XPQBIpbXjBcJeB0a23A=;
 b=grjqAgvjKR+4R3yOJh2OT0FuDmDM0ClyVPaCq8AUF9qhXjSmmcJiN2TUhCDxvj3c1Gvn
 78ZzaFmTRp4gza3T5uBBXubd3bCfhbI3kjjUso3ES6Hn2i2GpY8jjNJVXCYE3jw97qPr
 UTSaETgeuip7VsjXe9axEEz8Tq22JzkTlL/huSVPnIq7K7geylbmU5jSfhcBAqpZDpUK
 A1IcPZKBA/rmovMXfeQJFhA5W/pLn7O1J5/JkQJVNI5AkglMj202fhzeA4J+4iBu3zmo
 bgcfGit78sEAZoTpnW4FMnxXIp6COMCwrCgtN8cvPbP+YNLvbmEG+k2HYmsRYVtlVV1g RA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rtptr03q1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jul 2023 19:46:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36DJkSY0012904
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jul 2023 19:46:28 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 13 Jul 2023 12:46:26 -0700
Date: Fri, 14 Jul 2023 01:16:23 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 02/12] drm/msm/adreno: Remove redundant gmem size param
Message-ID: <iukw2vxcntw2zj35ftwiciu3cl65hpdjyny64jxa75hdbtwhib@kbrqpdoag22z>
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-3-robdclark@gmail.com>
 <97693b20-f374-db81-47b0-e77802dfe3a6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <97693b20-f374-db81-47b0-e77802dfe3a6@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: kn6JRL-ElrSQnZ9qLppw4mtOm0DaMo8b
X-Proofpoint-GUID: kn6JRL-ElrSQnZ9qLppw4mtOm0DaMo8b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_08,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307130174
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 07, 2023 at 01:22:56AM +0200, Konrad Dybcio wrote:
> 
> On 6.07.2023 23:10, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > Even in the ocmem case, the allocated ocmem buffer size should match the
> > requested size.
> > 
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> [...]
> 
> > +
> > +	WARN_ON(ocmem_hdl->len != adreno_gpu->info->gmem);
> I believe this should be an error condition. If the sizes are mismatched,
> best case scenario you get suboptimal perf and worst case scenario your
> system explodes.

No, the worst case scenarios are subtle bugs like random corruptions,
pagefaults etc which you debug for months. ;)

-Akhil.

> 
> Very nice cleanup though!
> 
> Konrad
> >  
> >  	return 0;
> >  }
> > @@ -1097,7 +1098,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> >  
> >  	adreno_gpu->funcs = funcs;
> >  	adreno_gpu->info = adreno_info(config->rev);
> > -	adreno_gpu->gmem = adreno_gpu->info->gmem;
> >  	adreno_gpu->revn = adreno_gpu->info->revn;
> >  	adreno_gpu->rev = *rev;
> >  
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > index 6830c3776c2d..aaf09c642dc6 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -77,7 +77,6 @@ struct adreno_gpu {
> >  	struct msm_gpu base;
> >  	struct adreno_rev rev;
> >  	const struct adreno_info *info;
> > -	uint32_t gmem;  /* actual gmem size */
> >  	uint32_t revn;  /* numeric revision name */
> >  	uint16_t speedbin;
> >  	const struct adreno_gpu_funcs *funcs;
