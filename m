Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11029AEFDFC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 17:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC3510E2CB;
	Tue,  1 Jul 2025 15:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IXdIeObC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8370F10E2CB
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 15:23:46 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619pwoU032540
 for <dri-devel@lists.freedesktop.org>; Tue, 1 Jul 2025 15:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 exYQa/SxTFohiL9rk/rsqhEqPzoQg/k5BFR36bKcrY8=; b=IXdIeObCcsIBWc8x
 qWgx7B0Ohk6eLOrElKt8nIaWr8OuMFD/ZG22UC69pZKvTltAj51G17N8jEoMZkZa
 ebKwDUu8S3bf1QZIqYD34F8AvzNg+qAVZ4gVaYBDRWxs8wo1efeFX8jiL6iA6nzz
 mwpUIJscwsoUSRQVCFJsnt5Z+enL+6Go8Fplhjer7LRSSV4xTmBACp5JZtR0LL4x
 Fz7SdqRRLY0Oc0xTscvZ7ZCvfP6Lj3OAGCQ6fArguFmPQgzzOeexYTIWP6rOzN8S
 N/T3Eub5jDgqo+OLUov1ei5+mujCoQ4FZrO0P9rzvwm8cogItCVd/R+l6qcu4lBZ
 DjELzA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k9g5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 15:23:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2349498f00eso53702065ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 08:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751383425; x=1751988225;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=exYQa/SxTFohiL9rk/rsqhEqPzoQg/k5BFR36bKcrY8=;
 b=wk7XiPBFP/hzgVGwXWE6pIM/gr3Sob1Tx4s+zjMFQfXfA4sxv3DhzsxfSDLpHDVQNx
 Vkk+9lboWik7TLWc4xl15GH7Ie8JQt5ETZLu21F9N3EXmRGxO//Qiz7R7OwYc52qTdk1
 uyQDOexHGkA5h+YW3oqnsbYOyKJlU2jEnFBu9K3pgDDciEncromHM6vBmltdvWZrS7oV
 UBVa7LAMJcWwpCTl7zIl9WnTuYJHjPgv0vDOS+oFzFs5uDYiy7xGq7sKnhmKQ7QDphkL
 al5q9wWAvdLDJ2c8+vCYlTSVMk2n+m6KL55OnidrM4kpbk1ka2Egw1Nm57YgmVxZDhUP
 svjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl5Bugtii4xNu6CVF+nPEm/0TTtgmcXDkmE8/gf0VirEMfphcLQ+DPElx9JppxkT0snmKAjJJuG/E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+yGi3YhzuUB4XUEqhutcMwD/CVZUlmLLxReJ6E+nYLCHrgFWc
 +n/RXd4XGVhHeHfpLP4PBYWT3f5jF9TXytNO/MwPD9Ix4A9FfgGmsTQCDgeXL40gWIGT6XcxlSZ
 qKZZU7If380eATPMPMbmLVf5h2BzA/x7lQ+07XUJwcn7v8lapj+e5uI+aALHTPbkHPWDEUQQ=
X-Gm-Gg: ASbGncvrzsM2K22Ebfma98rjvKo89q+3sqMw5k5oekiaMhdAfw3uGIcWkojhb9fMN0x
 tCKkGLa3uFio3mbUfEel4/Ria6lNg5knIbDZ2wh9hfftc6nUiSl5Y0gNg5+J+BI9In8vdIE9DgC
 Juq0OOwtqFQVitQw6p2bOMuBUUtUIou/eKKuK5ZRaihdVeKEjUHbx1dDXX9A8J4tkE6dwz5ftDa
 38VkGE4Sxaz+D7Y/kg0+w1iLzfz5CeLIjtLuboEZf3wTp80bz+ciGMevce1US+QlyGGBPv/ZgbY
 YEsF/n7cJ/fzfqR2l6TPODtOnnKAGuv9pIn0cwyYTFe5e/23gx1u+MrABQjP/2YSBh4GGmUX
X-Received: by 2002:a17:902:db01:b0:231:9817:6ec1 with SMTP id
 d9443c01a7336-23b354dcec6mr61641665ad.17.1751383424984; 
 Tue, 01 Jul 2025 08:23:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzeFM4sfWDHwxnw4b8YUjQqPTFrx84Wk9Tl/cQIW7vhIff40Tj7+wyn3B1Cpbc96mvyds34A==
X-Received: by 2002:a17:902:db01:b0:231:9817:6ec1 with SMTP id
 d9443c01a7336-23b354dcec6mr61641205ad.17.1751383424416; 
 Tue, 01 Jul 2025 08:23:44 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3c8b52sm106544015ad.244.2025.07.01.08.23.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 08:23:44 -0700 (PDT)
Message-ID: <643a59de-79c6-4440-bc62-4b89eea784a3@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 09:23:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] drm: move the debugfs accel driver code to drm
 layer
To: "Khatri, Sunil" <sukhatri@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250630143613.2520111-1-sunil.khatri@amd.com>
 <9e45cdbe-8cdf-42ab-8769-067ff8f30e1c@oss.qualcomm.com>
 <7d1d4aef-8819-4e5b-af83-762a8d2ca0fa@amd.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <7d1d4aef-8819-4e5b-af83-762a8d2ca0fa@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6863fd82 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=jG12YPyu7umpLBzujXsA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwMiBTYWx0ZWRfXy0z2bFzXVGS0
 dxrrgEMCoIEHfKGGAsXy4GEskBfhGlwhVPFD8F2z8f4EoUEIHuXJebk/c2fRPDRT8XybAri9HQi
 WKkMCtQ8F9dmJjYNhLjOgD+eloNzrSYCCeI8k+b8EUGDbsVKv+CFXMvS28FbrqNiSCU/bQzYvpM
 +oiUNT+yWt0MOX2ZtGIgKVBrdpY5ajGAHYXvL9xBcY7zVLSXp100URGosXfFd+T3QbCclhG7jdx
 OR7I4xLZDKdNLX22DwWWrxHdVSIe4Cvl3lBxGhb0ABmhDvkxZdSWa5/8t4UvNlg7utkKMHdjecE
 y4U31VEVwC6CfCcB8rHD2Fgi2vHluEPtGVk8EzUTkOEt/6YVxmDuTH/Ez9sWxSjELDxnutb7voq
 UaMiMKy7uskT8SZevkNuIMCCN0pIRju2ibh0yBNPmJpYrjTpAceWRfZUcoMXlumjYudjSrMm
X-Proofpoint-ORIG-GUID: jE6d4aLMFMPkWXJiow56vyPOc9HRx23V
X-Proofpoint-GUID: jE6d4aLMFMPkWXJiow56vyPOc9HRx23V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010102
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

On 7/1/2025 12:14 AM, Khatri, Sunil wrote:
> 
> On 6/30/2025 8:49 PM, Jeff Hugo wrote:
>> On 6/30/2025 8:36 AM, Sunil Khatri wrote:
>>
>> I don't see a cover letter on list. Surely there should be one?
> Yes there is one with the first version of patches.

I don't even see a v1 on the list for this patch when searching the 
subject.  Typically the cover letter is sent out with every version of 
the series.  This is v7, surely the content of the cover letter has also 
evolved.

-Jeff
