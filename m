Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF2888A90A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 17:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E82610E6C3;
	Mon, 25 Mar 2024 16:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ElaV+tQb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5955410E6C3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 16:24:30 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42PFJRgN002864; Mon, 25 Mar 2024 16:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=Nn9fN1vkKZJygatVmpiQk3bcd3tDo2rNKgR/PK0BkQk=; b=El
 aV+tQbIC7BxbKdfxIy+uo+RYyxD+CHPbFhWyRHevwI5gW7/UpM0jPZw24k0a0/2O
 iDVTMOzOGLrsvMRJ+FyNQu2o1gELjqlqFz6g8w3MZUzR59oNHnyAHYRqg8GksZit
 AtDKx7UYsZgfxDqj3y66L8oMfh9Cq9RATkEvGIBxZOtRoLBTdGBo8aEzM6AzUw2L
 UllEXTp+TXRWgVDbME6Q8YBxq/nLZ6EVyTki7yWXY6kZqSdTO3Fsuih8zxSEOE5E
 tCYCq3t+nEHc4iNfkUp20dmUyqZNp1EOfN863ISRrrVBTbnhQpmWcFxlj3sw+4ux
 vy8NDZt4Q+HPpQpt/dBw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x38am8rje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Mar 2024 16:24:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42PGOOqq016742
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Mar 2024 16:24:24 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 25 Mar
 2024 09:24:24 -0700
Message-ID: <59d64455-af2d-4d6f-beca-a78f1ac87236@quicinc.com>
Date: Mon, 25 Mar 2024 09:24:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: replace utf multiply with an ascii x
Content-Language: en-US
To: Prasad Pandit <ppandit@redhat.com>
CC: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Neil Armstrong
 <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, <dri-devel@lists.freedesktop.org>,
 Prasad Pandit <pjp@fedoraproject.org>
References: <20240322120339.1802922-1-ppandit@redhat.com>
 <1e546c01-1126-45c8-9104-14e769dedb8b@quicinc.com>
 <CAE8KmOz6giC0mAr02TDC5c6V-G-K46ydMdpNqiJ3gQFC2ETh1w@mail.gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CAE8KmOz6giC0mAr02TDC5c6V-G-K46ydMdpNqiJ3gQFC2ETh1w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: NwfPwb7z-Xkq8RCBGaQnc3ftfdPnKzwm
X-Proofpoint-GUID: NwfPwb7z-Xkq8RCBGaQnc3ftfdPnKzwm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_13,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 mlxlogscore=620 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403250092
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



On 3/23/2024 12:40 AM, Prasad Pandit wrote:
> On Fri, 22 Mar 2024 at 20:54, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>> Seems that this also happens in 2 other Kconfig entries. Can you replace those as well?
> 
> * Yes, I've sent a revised patch.

Acked, thanks!

> 
> Thank you.
> ---
>    - Prasad
> 
