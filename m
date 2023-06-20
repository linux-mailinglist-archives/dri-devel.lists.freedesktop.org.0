Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9071B737108
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 17:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD4E10E191;
	Tue, 20 Jun 2023 15:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3E310E191
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 15:56:04 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35KDdRKM006735; Tue, 20 Jun 2023 15:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ga/krI8e0n8fAkjFw/tlxgDDKSIQWSPvduswI6JkWKU=;
 b=dh3y7rHNbURVv3URxJFHeP1Oz21AWBn7lQB2zXOB4DIEEcIk3tCoSOnw351fBq2iySIy
 tF+t8Nur7/RUFIh+uyYFIlduIpzhTUsWYbXp2Pyk9qRwhYtQj0LijFUfwgg/wh5pLeRU
 vlSiM4qMmgICgDATvGqAbRoxnMNl4+dTEPYSlos9YcwXBfyseEtNpdGIAnLLADwdERmT
 XQrz1cPAg1E3PGrbNQiYVqn1bY++hF0D/YlVil9uiQ9iZyNH+3qHLwUJHJzi18Ar0w5J
 h5t1c/Q2UNNUpM4IXuXuRzVRjU4Ch7NaNv6XDfQg5ndQMDZaWTkjyA5W96/0bGNKfMm6 og== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rb7susb1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jun 2023 15:55:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35KFtToT004325
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jun 2023 15:55:29 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 20 Jun
 2023 08:55:28 -0700
Message-ID: <9e76793f-52c6-ea3a-536c-8e6d6b706e4c@quicinc.com>
Date: Tue, 20 Jun 2023 09:55:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 3/3] drm/prime: Unexport helpers for fd/handle
 conversion
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, <daniel@ffwll.ch>,
 <airlied@gmail.com>, <mripard@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <zackr@vmware.com>,
 <contact@emersion.fr>, <linux-graphics-maintainer@vmware.com>,
 <alexdeucher@gmail.com>
References: <20230620080252.16368-1-tzimmermann@suse.de>
 <20230620080252.16368-4-tzimmermann@suse.de>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230620080252.16368-4-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: HzK5zQkiqJZgbUvRVe1Qrvw5gNebLWms
X-Proofpoint-ORIG-GUID: HzK5zQkiqJZgbUvRVe1Qrvw5gNebLWms
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-20_11,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 mlxlogscore=724 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306200144
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/20/2023 1:59 AM, Thomas Zimmermann wrote:
> Unexport drm_gem_prime_fd_to_handle() and drm_gem_prime_handle_to_fd().
> Both are only used internally within the PRIME code.
> 
> v2:
> 	* reword docs as functions are now unexported (Simon)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Simon Ser <contact@emersion.fr>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
