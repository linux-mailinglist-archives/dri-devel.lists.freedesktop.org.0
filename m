Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC384AFA4CC
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 13:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DE910E284;
	Sun,  6 Jul 2025 11:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nn/0OJ7F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1610810E284
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 11:42:55 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566BMlNN012795
 for <dri-devel@lists.freedesktop.org>; Sun, 6 Jul 2025 11:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=JB/XviBNoG6Wd2Sk46ca++Nq
 /pAT5tc7VNBX6s5gVgU=; b=Nn/0OJ7F+OYtcvjfojmd0+fMyOJjwJJsMJE28YEq
 Vmo74tskb+HolUlEh3TxLsYr8VQqtLBHQOIdpmBScN5iMJZQJv8JJBDpxkZ71S/r
 8b5vcrVRD3HRd0fh+75rJo1Z9Eggu7KzE3lNEfCmyKio5dXDscdFHT/svL4+SmE7
 oP4Fnx7UZ+rdp/UvYe5IUYYoI0iTUyiXBoULOqsLdw3Bljhi8XPHF122AIf/LmBd
 ff4YQuL71GycEiEf/77YEoL1p9ZMrh7YiIJePOkInS1G8iJevh+YibEvDIu0U1h0
 sRn8P8nGh1YwnAuZe8N3nwXodnX16O/Zd3gtbEgHa4uM6Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdqc33u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 11:42:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d399070cecso403652785a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 04:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751802173; x=1752406973;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JB/XviBNoG6Wd2Sk46ca++Nq/pAT5tc7VNBX6s5gVgU=;
 b=BclJuiMdHUXgWyE1O8aMJg8z7J1OR3adUG60e0z9YYDkBXFTMl7f55oeVQleaFLubZ
 qV/PGTqzAmE8XVghoxtuOjRo20GGLcQc5FQ6XJI2erOoB5AqKRUO+cFBYN8M0npW6glZ
 pYkps4dpDc1GL3NqZocFCDnblTyZ2vu89joe5FuENmcDIKVOjJtoclX4ClVDEe1r3QSE
 gytHdVK+L1UVePUnAbWHfE1XgKY4BIar/pA23De6L9bFZfLdxc032uSOD7p2y1Ynl8Iv
 vVUo1/jzcgqA9agmpexL1zFoRCgwX7OHJGTEevV3aolygwvXn5c8x3BDpOqtEJEIv6PK
 kXHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/JUwvomev/tg8u//n2ecwp1616nFG365BLrBoe9muj4haJVgrpxZfl9BdwVAUMsjCYT49qijmINo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZOFvUt0k2nwfZ2rHPw8tUaKZjcjUGOA+2+6Rvdi5WBnQjxays
 ylmrIghc8/oPx3MMKpn6wJBK7WO+CQ/8k2aJPpyB6IA+oTlpUDqfvKxElutBss0/hyIb+xc8QSK
 eEiqq1YhqzqM69aUyMqpoYWLIrV3KVlAAGmf6FeAGRaBjKLdJUq7TSCGG2w9DqJltMW9luac=
X-Gm-Gg: ASbGncu/dHQJjD/FJn+7m+k31NOQ/jQEa82R/KkCzK/0ndRiejke3uYBn9j+uIGW7WW
 djS9/Wk6AkaEHpiOPz3YKJCyPtVWfXLHCfRIYZlmgS30/lB2/jIlD+MuO2q5Quh1NBGLSLCbrqW
 8K0lZLmu8+RoEW730t3OkZYG4Au+ZP8qsuxwqnczRmFW9DM35Mf7JPLNYztXFUIH+zvsovQX4Rq
 S7no+R05QOdH+9O25ZN7/ErmI1bZjkxuCZ6Qw2ytHgFnWMTt6PXNFC8F/D8Mv6JtLQ9Qw88UDw+
 tzTFg+K9BN8NZ7RAtyTn2XxXb3robSG5RX5WyyV0IdeLTR8XJDuSf0VG7K484RWgMFfUBg03Zuu
 aHTuO10VNNNtqFzDmS9YorI/UyK3teqfkXN8=
X-Received: by 2002:a05:620a:444f:b0:7d5:d144:87dc with SMTP id
 af79cd13be357-7d5df14bae4mr954144185a.43.1751802172968; 
 Sun, 06 Jul 2025 04:42:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFib7rxO7QuHhQSCQVBhNvVA5wjVOmsPcLPJ2YorlNPsS3pG9N6gy80bngE4vfjIb1FX7YjiA==
X-Received: by 2002:a05:620a:444f:b0:7d5:d144:87dc with SMTP id
 af79cd13be357-7d5df14bae4mr954141585a.43.1751802172560; 
 Sun, 06 Jul 2025 04:42:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1afc1c87sm8241021fa.28.2025.07.06.04.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 04:42:51 -0700 (PDT)
Date: Sun, 6 Jul 2025 14:42:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 dri-devel@lists.freedesktop.org, lumag@kernel.org,
 Laurent.pinchart@ideasonboard.com, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: Re: [PATCH] drm/bridge: anx7625: Fix invalid EDID size
Message-ID: <qzyshiyj2ne5rpnoqildr5lrll6bamkydgidfaxatktqsvdsoi@j62qe4dslzzl>
References: <20250629023836.744441-1-loic.poulain@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629023836.744441-1-loic.poulain@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686a613d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g1VFs9uhBf4WLQjVR5MA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: NsrPW1Ej-SZM-tXQ1QSL7FnOGPYZqRCb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA3MyBTYWx0ZWRfX7xvAq+Lklv0p
 Y6LwFdOSZ3m4Kv1MoTVeWEwe41DCoMhpHTgS98dGCcOzn+Lde6fbCzwQhp4qDEvcLsEQcNpFHs/
 Mk1WUij1ir9Mb4q4vr68Kw87lq5nM9ahNqpwtEpdpi99dUpcpLlxVOoyu0Q51UlzmMB7pcZ5hRn
 jcKLLYMhxWOkXCg0WfqUKLM/+g96lgDATZ05UasnE11zltA9D0Y0fkL+41qDInTyF0PetcQTTEi
 ZOEGyADaL7kOwstA5hPr1PqE8BdlQUdw7lY8s/4jE4vl8mDG0Qkl5g9gaTBySpzzZbjvypleals
 gpGGsFi5Ays9tHXGXMEBeuwmpoIgqIIgk9NQElZegj9/9ijdwLNoaO7JJRkcEouclOS0XFpIiBL
 A99zc4MWc2wNOconCmGonkXcoe3/n5eNVJpZigJGv7+A9Tf0gAAmojq5IuOhnEjy2/PHr+aq
X-Proofpoint-GUID: NsrPW1Ej-SZM-tXQ1QSL7FnOGPYZqRCb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=783 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060073
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

On Sun, Jun 29, 2025 at 04:38:36AM +0200, Loic Poulain wrote:
> DRM checks EDID block count against allocated size in drm_edid_valid
> function. We have to allocate the right EDID size instead of the max
> size to prevent the EDID to be reported as invalid.
> 
> Fixes: 7c585f9a71aa ("drm/bridge: anx7625: use struct drm_edid more")

Cc: stable@kernel.org

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 8a9079c2ed5c..5a81d1bfc815 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1801,7 +1801,7 @@ static const struct drm_edid *anx7625_edid_read(struct anx7625_data *ctx)
>  		return NULL;
>  	}
>  
> -	ctx->cached_drm_edid = drm_edid_alloc(edid_buf, FOUR_BLOCK_SIZE);
> +	ctx->cached_drm_edid = drm_edid_alloc(edid_buf, edid_num * ONE_BLOCK_SIZE);
>  	kfree(edid_buf);
>  
>  out:
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
