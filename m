Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6492694D50E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 18:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4D110E99C;
	Fri,  9 Aug 2024 16:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LkYP9m0f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D2010E99C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 16:52:51 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4799mgqM015951;
 Fri, 9 Aug 2024 16:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3OtSRxMjMwChT6ppgovQDG8n2yyeIzDV9nL+PQmt2AQ=; b=LkYP9m0faqut7o2C
 /cZbsn1YR0RZzcuQqd57XOx+5OWeeN/avneHkmSHwtu9RUk/CAGcfVgLoSPBATMz
 C0VnUm+4Q6HUFvSxh7mr16+68KLqWeXLWDWshO7TH9BvspBBfu6EkuQL3ejiyICf
 Xryg6ANcx/vDULSkSUBV4XXjfVoSlzpAFHeSCM3rIbX514Np8oYoZqFH/By8vome
 u3nRUi0y3ynj+vQOd48QE4sqNcitPjyaCQS7iHwiPKrYqTR5f0M8rzoh0C7V9Xrf
 VWzTUujWhN5qM7K1ETOnuwj/xPBd3qQ2UQbERukjkRgY9ROhnJ99xUnK0oz4W9nM
 dsE8vw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vdupp47c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Aug 2024 16:52:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 479GqkpJ009858
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 Aug 2024 16:52:46 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 Aug 2024
 09:52:45 -0700
Message-ID: <54cdd823-98cc-ae67-c824-fad664e796a6@quicinc.com>
Date: Fri, 9 Aug 2024 10:52:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel: drm_accel: remove incorrect comments
Content-Language: en-US
To: bajing <bajing@cmss.chinamobile.com>, <ogabbay@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240731064253.24523-1-bajing@cmss.chinamobile.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240731064253.24523-1-bajing@cmss.chinamobile.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: iWS63QX0a51Rfhujod6BKKy27V1zY1Fo
X-Proofpoint-GUID: iWS63QX0a51Rfhujod6BKKy27V1zY1Fo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_13,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0 mlxscore=0
 clxscore=1011 mlxlogscore=982 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408090121
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

On 7/31/2024 12:42 AM, bajing wrote:
> accel_minor_replace is of type void, so remove the explanation of the return value in the comments.
> 
> Signed-off-by: bajing <bajing@cmss.chinamobile.com>
> ---
>   drivers/accel/drm_accel.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
> index 16c3edb8c46e..09fb64444cc6 100644
> --- a/drivers/accel/drm_accel.c
> +++ b/drivers/accel/drm_accel.c
> @@ -161,8 +161,6 @@ void accel_minor_remove(int index)
>    * This function access the accel minors idr structure and replaces the pointer
>    * that is associated with an existing id. Because the minor pointer can be
>    * NULL, we need to explicitly pass the index.
> - *
> - * Return: 0 for success, negative value for error
>    */
>   void accel_minor_replace(struct drm_minor *minor, int index)
>   {

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
