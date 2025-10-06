Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CE1BBF299
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 22:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C8910E0E1;
	Mon,  6 Oct 2025 20:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q4eG8C5D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B8910E0E1
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 20:14:42 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596F0YIs002759
 for <dri-devel@lists.freedesktop.org>; Mon, 6 Oct 2025 20:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YafftRWByjLDaFGPU4UHzyU88JZd5Y6+rQcB/WOpZU4=; b=Q4eG8C5DypE2DTt7
 Bc4GnsGjFuklJUwlxMUDbeuWMYMlJg8+s1LJnwyqKp0gLPWbt9IULqaZJC3A75BD
 /jds4cD8tOoIM+Dc66lAQrXBvPGrT4q9flm1Y4rLKE6GoLfV6Yq45XW7x1MOKjFb
 nZ1qfVQrLXubjFna6WJYDI2rPFFofAxLN8Bngmisu2ayOk3mM/m6jaBhItNAunQW
 +XxwYHUypw1vK1Hvn0cjDgNosTp26QrVh2CwFBcPg9v0PM/Ix4ZFd2YxDxXUOTnA
 Ln32E/o006on6A0+uiw1GyIX+epNUrlMBAMka43Xt92DBoZ/LV5zxNV4gpTBMbuN
 nrGcqA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn592c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 20:14:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b5a013bc46dso3751146a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 13:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759781680; x=1760386480;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YafftRWByjLDaFGPU4UHzyU88JZd5Y6+rQcB/WOpZU4=;
 b=l1r9e2yZi3WM0dT2ca7tpXynzrpbzMRLB3tUFw5cXNbjMwlxQ0odUtYi8b0Ar7QKjJ
 kRrIA4cRCr8Owri7xnWSABiEvmuDch1SBOmYIkR5r7xol2xPNjR1JR4mvg89UnwynRfS
 hB7Qe8/RrXZNaNS0E1noTkRRilNKPuTeCJcL8Q8YHYMfwyghMfOfq3YnPyP+7WuDXupl
 Af5w1ddjFRiZpWe1GpYqsX7Y+D+RG74qmY23m8EcVp94oUus5okKcAAQA4fOHEenSUGc
 PaGNu/4l9rEhvroMOLtCAC04yYNg3zp+oN45PzQVO5fywW/0ab5YJYZ8WK6e83vZRTBj
 Lfug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOUBWj4r87nfuHyXR+sNxw9N1C/JmWeVvXPYUsMdyGgiCaeI9N3e7nCmpMZVJuPfJKtICkIZrO4io=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1LinHf65fJFTepLKu+6oHSXfznrX1zajn0ox34EElsFP+2D7m
 ZK1r6lQvvGTXxlOPA2xq3LG84vz8Li9XQSh3A6zdvTjwMlTDgHOJ0vmnJSPdmvnF9BUNck9Um9d
 pCDCY8k8fIxa14fck2cljE/uTxa6KdvazLvN1B6Pz5q/WWM/eJr6dm+F0NXJPmzXHs0taW6k=
X-Gm-Gg: ASbGncsbg8IJoBn/dIWNxQde51guGJLwRo+Nfj9HBIkdja4PV1mRvja9z3pM8sdrvPy
 lPKNo8ZGooLk1XodqgI6FbhdI74q9qV5s7fnNwF+cGtkNrgviuluz2ngpzel8+4eAnddKsncbgG
 v62goGCqhK6ZfTCETKOvXxyJbigx/fYM23zEw9z+ZyoD8nGV/pbCrry12Jq9iaostF2kxP9YPbn
 nPBXlPdrl66klZSwhNvJTK5upcMWs6RhNL0K723TVovueuTb5zy81AIustBpz/PEAHBoMus43qh
 nvsdUGAdAEgOuONtH/lWe0jqxMAGUT/8WzeVnYI92Lw76HPZ/ZM5yPHlh+iXTQ+5TutkI6RBDXC
 W+0ApNHPHqY7BLwqY3pk=
X-Received: by 2002:a17:903:3c25:b0:28e:9427:68f6 with SMTP id
 d9443c01a7336-28e9a593d32mr160462375ad.27.1759781680553; 
 Mon, 06 Oct 2025 13:14:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMy6IH1KAtr1j9MdJ9iYW2madM3BGB3q4dXxdL4hFhciKoi1zB57zp/KlO68jvuc7tMpkzXQ==
X-Received: by 2002:a17:903:3c25:b0:28e:9427:68f6 with SMTP id
 d9443c01a7336-28e9a593d32mr160462145ad.27.1759781680134; 
 Mon, 06 Oct 2025 13:14:40 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d11080csm141732895ad.1.2025.10.06.13.14.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 13:14:39 -0700 (PDT)
Message-ID: <1d46a5a2-3495-4111-97c2-b726452d239e@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 14:14:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] accel/qaic: Replace kzalloc + copy_from_user with
 memdup_user
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250917124805.90395-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250917124805.90395-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX0CB+BVXItU0R
 btWR7ktHPdpEG8QvplMOOd/jrZRIvYretGp2Who1LM8zNCEBSKnayLLfWFobj7S484PTfsmNIRE
 bu5xHUsc1JJixraQHpVFTMDLgBo2fsSMBW8n7SkRkkL02bPO18251PXe0lrC/M1iM6l6/VRWlrI
 CYEG+5NlnTcDzNnL3mOLFXiaePkmaS8YtFTNXcnTD2HTIcev6VL/v5a02sHf5RnwBXvkoHy2XB3
 Jm4eovMu3EXFf4E1Z7TPh0DCTTPvDGYqmIG0tQcc4Nj2iU5Ibs8lkq/f46B2/w4tYeO+C0oCQjq
 LSrGcllmYjeT6Dm8zRItyT/Fbrfuk90AJkfOLzugMSJBt6+5WvSo1OXoztb4ef6h1HYeLrlJdnW
 c7BzWLHW0RKFDdLQaeI7QMFfUIPcnA==
X-Proofpoint-GUID: B6WY5D6-rpvcNm1YuRM32MigokqF3s-1
X-Proofpoint-ORIG-GUID: B6WY5D6-rpvcNm1YuRM32MigokqF3s-1
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e42331 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=mx5ec8yL7mgqVsH1_UkA:9
 a=QEXdDO2ut3YA:10 a=vyftHvtinYYA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001
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

On 9/17/2025 6:48 AM, Thorsten Blum wrote:
> Replace kzalloc() followed by copy_from_user() with memdup_user() to
> improve and simplify qaic_attach_slice_bo_ioctl().
> 
> No functional changes intended.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied to drm-misc-next.

-Jeff
