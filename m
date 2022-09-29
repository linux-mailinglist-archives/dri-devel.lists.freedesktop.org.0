Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 485075EF4BA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 13:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3183A10E5F2;
	Thu, 29 Sep 2022 11:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAC310E5AF;
 Thu, 29 Sep 2022 11:51:13 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28TBhLJY017900;
 Thu, 29 Sep 2022 11:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=hrGxqKIP1J6IorcVpPqieu0Smi370k03ViTx7kfgyqk=;
 b=l/ukuZW+SbuLWSKBaBGoc0w0Vvav6VoK35d6qQaK9HqnAuNANStLLFZ4a5YEWu/jx5hv
 46aLM3jbkJRtWzclu1vEng/Gc+C7EFJy27d67qorDpDSlml1TTGpeFLdPKe5N/QLJbN/
 zB0KrujvQ6Ik1CLgsbPcpjn2LkwtwtFVtBZgyZ+m2WIFhM04xZSRxZqJvNaMnXNFh0qr
 dQEeAAiZbtZ9bM8H0dlhnUre4MaTsVf0ATKp6nwAECwT3kwG6KvjF6blBcjkYSwRNwC7
 IsVd2IfJ5p5g9UNhom5U2OMd/mA/VdekoDe78ISMa1Tr4XUXJpsznAFwX1ZpciPyyvju tg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jw4xq9apv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Sep 2022 11:51:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28TBp8fS000689
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Sep 2022 11:51:08 GMT
Received: from [10.204.67.102] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 29 Sep
 2022 04:51:07 -0700
Message-ID: <6504933c-048d-310a-1651-58528f868bdb@quicinc.com>
Date: Thu, 29 Sep 2022 17:21:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Freedreno] [PATCH -next] drm/msm/msm_gem_shrinker: fix compile
 error in can_block()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
References: <20220929093022.2428520-1-yangyingliang@huawei.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20220929093022.2428520-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: PdVcu667UtcKV8Kfd6GWONjeEDQ1DfaJ
X-Proofpoint-ORIG-GUID: PdVcu667UtcKV8Kfd6GWONjeEDQ1DfaJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_06,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209290073
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

On 9/29/2022 3:00 PM, Yang Yingliang wrote:
> I got the compile error:
>
>    drivers/gpu/drm/msm/msm_gem_shrinker.c: In function ‘can_block’:
>    drivers/gpu/drm/msm/msm_gem_shrinker.c:29:21: error: ‘__GFP_ATOMIC’ undeclared (first use in this function); did you mean ‘GFP_ATOMIC’?
>      if (sc->gfp_mask & __GFP_ATOMIC)
>                         ^~~~~~~~~~~~
>                         GFP_ATOMIC
>    drivers/gpu/drm/msm/msm_gem_shrinker.c:29:21: note: each undeclared identifier is reported only once for each function it appears in
>
> __GFP_ATOMIC is dropped by commit 6708fe6bec50 ("mm: discard __GFP_ATOMIC").
> Use __GFP_HIGH instead.
>
> Fixes: 025d27239a2f ("drm/msm/gem: Evict active GEM objects when necessary")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> index 58e0513be5f4..6a0de6cdb82b 100644
> --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> @@ -26,7 +26,7 @@ static bool can_swap(void)
>   
>   static bool can_block(struct shrink_control *sc)
>   {
> -	if (sc->gfp_mask & __GFP_ATOMIC)
> +	if (sc->gfp_mask & __GFP_HIGH)
>   		return false;
>   	return current_is_kswapd() || (sc->gfp_mask & __GFP_RECLAIM);
>   }

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>


-Akhil.
