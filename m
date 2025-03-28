Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FF0A74E5F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 17:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D2510EA57;
	Fri, 28 Mar 2025 16:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLqUlF8Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD6810EA50
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 16:16:39 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SAqrBU023507
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 16:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 B759YGuSR8/g/OsdQG8l1yWCBSW95rqY5su4+Bu54AY=; b=BLqUlF8Q/hcFVuBn
 mUqD58LEk5n6r21nLVfjuFmB5a6T/vjg2ua4jhD5Pf//22pwQmKr/PTbtAcOGlME
 d2n8+Ssk5wlZmMJH1kTMrtvhETh2t1DnuZRjFRf3Qj5fBdQdDqo1ovt1m8B8bPra
 LcN1JmohI3rVTvQoN0Z0q60XVoVKgQlurCvDH9p6rjq1op0IcQjRfdybBQpbpf/2
 H8RWjjJScv0gNF9J7y4WFiAW5sMB5eEuMvKtFeF3IBTVr5G8mqRHSNM38fG9kGGv
 H4NLTOmFjzV8VtOaVB+x8ASxunMWKYadeSdvKvOuI0EXKJFB/v3qdQCQ2ogJb2si
 XtLLYQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45njsc2d37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 16:16:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-224191d9228so52253465ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 09:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743178597; x=1743783397;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B759YGuSR8/g/OsdQG8l1yWCBSW95rqY5su4+Bu54AY=;
 b=R4WQOjt+dAQTTt+ix+IVziXgnx9B297WR+lggAc9jJqxbyNxFJMxcHsTgxqv0QePXX
 CmCOVqhZm9VcKVOrk1H6ULU0BCs0JXRXoTmtKjfGbJpYic8k44JD9JaDBE6DY6faGBOH
 M2o3diFvc4JoaaOHmKPFU86Ueb0AHYl7JsgCswVOfeLjpJqFVUGgN+0lTVqEgQkFvzh3
 n3hOqm0PMTSqcUiESqjg+iXqFn9a5gl7qTzPFzLw1fDQxcps7yhKl3n37r7EfEOSrmJK
 Odh5wsTgSjkQlVu5707Kq4J2+RyZWiPFia1Uma2UgqYJuuPfd9wKLO9AvmYOd+YXBepU
 Wg7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaJC/nVarYxnDzG6arxGZGj6+5ey17tIEYTLKjdrF2NBMyOB+ynpIH6vG1nNbjpOSrel1A82QtLLw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1tyVbhlET6PP8Q36B7as2Kz+6vCZC9OlQolHJJcyxlQ0kS88V
 eSgD+uOZ7KCiEAkn+HVX29c+UpdFsFKcQQvlJlY+sueqDMeYogrxJi0PUBCR+r605tJ7RWd7WaF
 HpzgeHt66Clv7nAYrFkWgUZy1iXGMSRXrbRqWY097DArp3xSheLSk/D8dIbA3usTS7G8=
X-Gm-Gg: ASbGncvsYGiSqrxXYq+uHQjZci0HMkd6IHUknBhlNtSyChiALstdgE7NLUupmMP/Src
 7GNUw/kMG7i90J3mN+h8eD2pE7qbEpmUTaKEu42fcPlMrUqjpJKRA/9x95RxPOk2Lchv+dYSCqB
 8W6XcY6RAjASSRwJXl9BiMOCwzWSHdhe0tE0Aff3IOjrRmQE2H7F2ma2a90LuqbyWyoHpyFQFj0
 BLqccRBGFSNUHqYE0bmja1A0FLTVxII3c7Ke3fzAyw/y9/4HOhAvPsqSRBI0tOBZ3tQ/9ByBT1d
 D8VO50HD4rssHDD6jB/SCXLTD24x8xRFLhgGwXFXQMCik3bj+NY6CRHJQcIFc3JRlg==
X-Received: by 2002:a05:6a00:3904:b0:731:737c:3224 with SMTP id
 d2e1a72fcca58-73960e225abmr11435022b3a.10.1743178597424; 
 Fri, 28 Mar 2025 09:16:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT7dTLMyDkYpfkimHY1G/1zkIlOuVqtTlPHJknPeb1bpYe5ITQX9VQXyNO7yhOATzBrQtSmg==
X-Received: by 2002:a05:6a00:3904:b0:731:737c:3224 with SMTP id
 d2e1a72fcca58-73960e225abmr11434983b3a.10.1743178596848; 
 Fri, 28 Mar 2025 09:16:36 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739710ae9a3sm2010625b3a.143.2025.03.28.09.16.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Mar 2025 09:16:36 -0700 (PDT)
Message-ID: <8e8a2de5-14b7-420d-a80e-69422d43ce3c@oss.qualcomm.com>
Date: Fri, 28 Mar 2025 10:16:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] accel/amdxdna: Add BO import and export
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 jacek.lawrynowicz@linux.intel.com, mario.limonciello@amd.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com
References: <20250325200105.2744079-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250325200105.2744079-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fJk53Yae c=1 sm=1 tr=0 ts=67e6cb66 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8
 a=hqc9sBmNjcyLIcRXNsUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: zzDMd_PIBr0i5wP0nAq6XO9K6d7WqqqD
X-Proofpoint-ORIG-GUID: zzDMd_PIBr0i5wP0nAq6XO9K6d7WqqqD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280113
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

On 3/25/2025 2:01 PM, Lizhi Hou wrote:
> Add amdxdna_gem_prime_export() and amdxdna_gem_prime_import() for BO
> import and export. Register mmu notifier for imported BO as well. When
> MMU_NOTIFIER_UNMAP event is received, queue work to remove the notifier.
> 
> The same BO could be mapped multiple times if it is exported and imported
> by an application. Use a link list to track VMAs the BO been mapped.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

I think this was just a one time glitch, but please remember to include 
a changelog for v2+.
