Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861917510A1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 20:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AE910E5C4;
	Wed, 12 Jul 2023 18:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C713E10E5C4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 18:38:16 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36CHYd7J032399; Wed, 12 Jul 2023 18:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=A6GEDOnm3cKUgqYIiizub9lvXdmFmIKKT8Gx8mWiXNM=;
 b=O7ZgvT3+E40MAfT7BARR/77UXkl91NEZzeqgU/Qu/C1cjfyPK1l66usdYOQtN4tC5tBG
 fgCJCaNdXAWXJowzS62ymSG/EPTwjYWt5tjEt3lEnKduukDYxCFA+9WJnJD6h/X2wcZp
 HXrbo69fMrJuO0K2t+ln3ykSKCDm7fCu6czoKNnTjXvXKrVB08yCpxXpEG13Gy90dtMR
 uPjiWSK0OFSRbr8mOtPrtHd21qMo4BnOMEcSH1kvxFGUiOyyonWgUUwOqJSp8o9EIy5s
 i+fe19R/F5P7L0TI5+vR0rO/mUkSV3KVZtBk0601geL2VyqYFphDSHrwyRODQnJDd5Kf Gw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rsgara5eh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 18:38:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36CIc1Zm022848
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 18:38:01 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 12 Jul
 2023 11:38:01 -0700
Message-ID: <826fbe00-0e9d-7330-8762-a069ef933eaf@quicinc.com>
Date: Wed, 12 Jul 2023 12:37:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] drm/doc: document that PRIME import/export is always
 supported
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>, <dri-devel@lists.freedesktop.org>
References: <20230712183156.191445-1-contact@emersion.fr>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230712183156.191445-1-contact@emersion.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 6ohv3rt6tAMrIRfunmJobgFUi4XeqQUU
X-Proofpoint-ORIG-GUID: 6ohv3rt6tAMrIRfunmJobgFUi4XeqQUU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_13,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 mlxlogscore=861 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1011 adultscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307120168
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/12/2023 12:32 PM, Simon Ser wrote:
> Since commit 6b85aa68d9d5 ("drm: Enable PRIME import/export for all
> drivers"), import/export is always supported. Document this so that
> user-space knows what to expect.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>

Seems reasonable to me.
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
