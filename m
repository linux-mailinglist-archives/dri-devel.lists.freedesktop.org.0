Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5712A86269
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 17:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF7010EC0A;
	Fri, 11 Apr 2025 15:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ax3oC57y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160EB10EC0A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 15:56:08 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BFJrAM018797
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 15:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IvhKVowDhFsDOwnZ0J1pi+6ZtmcQtfP79gYnQ76SBSY=; b=Ax3oC57yIniGV62A
 GEfx8KJpxF7SpCnrY4LRJmCns+ympAjQXghr/5SHrZtz4pTqJ4MZ8f+hUUfyJYiJ
 BGDlBmcxwVnwC7I2UKU7wyQf4f9O4Lg7W8kWo7Ow8djqyS4gzu+TKt0ik4MPymet
 RBRG3we6uT7Q7JtfEGZIadeEbTcXWREFnFJGyPSgtf+w+GjgBMHlMNNbkW3hvUsa
 mxQn5HlxR5gWbEiGrI8wH+3i/pt40vfHPbX2jQJTt86q3l4Zd/lFsddYPXqidzDZ
 6hvfgVaig5MnQj5sUyHTsG0A4kNdUzJH9aVPiIF4+kQDWmyxkyrzV+3JHYkYNFvb
 fXXQBg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgu293-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 15:56:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2240a960f9cso20806445ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 08:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744386965; x=1744991765;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IvhKVowDhFsDOwnZ0J1pi+6ZtmcQtfP79gYnQ76SBSY=;
 b=Y+3YWj54yhfTAgpFX43+4lYecUHTZCI+3WZpOpleIh+WHnKVL1HXZc3HytBwTfBR5A
 i7rWA4IgcWrXahcADeFceaaxUGB+c2XVYUfRIyJSn/IMGl5RTd3Lfe5tphcachPVqPOK
 tZWjJKumoHkanxXogGUxOae+PJPR/hBi4P5usFWod9Eowp5DgsMC3tDs4FBs35FMZ2dU
 L73DRAPe7WL3A25OPi0OyYKdIo7NjIcE7775uUzQXlG+dQzihyISy0IuGD3unVEVI6R4
 1mpI8VQ5YHIGCEro56Mpku/AqglF766IipGazQBh4J+Cn6NBLzs7FWMc9sjwL1EVcY36
 pOoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSv3bALJ1wHD3xO3ztFShZAcuU0UK/BuojzKWgoPkyinQKYfGGIPwgVTBsNHy69c0JMaLhxwy3wH8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzeuarq/uw6I6hlDXrKaxof8XQcvvt3ckcZgI6vzt1hJRDW1gKJ
 EoSfmYUmY8J3btfkqRk5xPDwmHk+7c2xtvKHe6yCkYKhehFZQxPD3rbzJkTPZEhlvDJDPN0INQr
 /nnwG/gtnk49KVR1kzTR7Goq6d+9TnOSkwq7yeFGgw513h5Qcw+YbPLXQO9qGqsheoo8=
X-Gm-Gg: ASbGncsoOnmcYiyRVvb9I+HDdOU1JQECk708TImBuwjcAl8g7RBgb7dD8ahQd0mkpqR
 WGHYNtEUK6ghzCDelkaSeepDf8cOKngjRRcsz+4vLwITwXSJix3p2773w+4taZkP27j74/pohaD
 zc40pO+7cjv14Wn8+8vkXo6jQQjHlGPhFvLP7t3EDzko6WjMMRJMQQu1Bpaak42QeHt39JOj6sP
 j9a6u0V77O/Z2aw+s0vCwb60WKxfyEjB7DOL0g3LZcEQuzYRcVNZL3+4xR1VOXC8y2ADTq38xsk
 VF5TXJheOkqywbEwdl6umefIVWxI1UmG9yUY4mT5VyIar4lyCJBMLYLmj6UE+w==
X-Received: by 2002:a17:902:ea0b:b0:223:64bb:f657 with SMTP id
 d9443c01a7336-22bea4fde71mr49467575ad.46.1744386965363; 
 Fri, 11 Apr 2025 08:56:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHySzRO76XL/H38ow5Xz1Fbomei564/J+lCLgFhEA9M/x29ck+Cz5AOhsbIgCGup67gE23IhQ==
X-Received: by 2002:a17:902:ea0b:b0:223:64bb:f657 with SMTP id
 d9443c01a7336-22bea4fde71mr49467355ad.46.1744386965032; 
 Fri, 11 Apr 2025 08:56:05 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7b65105sm51370145ad.44.2025.04.11.08.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 08:56:04 -0700 (PDT)
Message-ID: <c954cb1b-7ba7-464a-a115-429c6085c8ce@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 09:56:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Fix incorrect size of ERT_START_NPU
 commands
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com
References: <20250409210013.10854-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250409210013.10854-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f93b96 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8
 a=MVSHWqWNM0uh__QEkt8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Six6eW3mQarNho7wOjRw9kLPH-rw2nny
X-Proofpoint-GUID: Six6eW3mQarNho7wOjRw9kLPH-rw2nny
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110101
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

On 4/9/2025 3:00 PM, Lizhi Hou wrote:
> When multiple ERT_START_NPU commands are combined in one buffer, the
> buffer size calculation is incorrect. Also, the condition to make sure
> the buffer size is not beyond 4K is also fixed.
> 
> Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
