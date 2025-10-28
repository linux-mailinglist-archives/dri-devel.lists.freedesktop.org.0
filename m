Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2E1C16C5C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 21:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1764510E11F;
	Tue, 28 Oct 2025 20:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hvjRUy3/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUVNrISf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD6F10E11F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 20:28:24 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJllD22524097
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 20:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 39F+4wX7/vZJCdod1X2FVuwp5OFLEREjUNLwgk9n3lQ=; b=hvjRUy3/OFB6RhdY
 ilyE2VH6s04IKSwsS9A+62NyBWMmqUmi2wmtl59JeR+rEVCpCNfcH27C7PjwEASD
 J1DbOzbrRtP9IDNs6ayjG4HvuNpeCK3X+4tFDk886TZBXwwFlhYTCfRSSDu32hdZ
 FMRHwhYKVFBAFGt3FwP54VPir78/+tfixHenYsyBCTuLnh6Pf/9AXHPQ3KNsYKqQ
 0hdf9eiLwLzTQc4eKbIPUnKjYNzcRg32SgawSvMlvI7hUxHbcy44VUU39FTvkXK9
 szNsusPwSRVmk4l8/6dDdz86RytuF+80iXIOx5krQfTiOhZrgDNnUWtuRDknjpHu
 ed6jAA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1r3qr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 20:28:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b62ebb4e7c7so5022484a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 13:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761683303; x=1762288103;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=39F+4wX7/vZJCdod1X2FVuwp5OFLEREjUNLwgk9n3lQ=;
 b=cUVNrISfXX8Orz5wZ1XFMkocn3rHpLaiTggCLCXmCK1kupQ/8UBwBkEReDUkDZsPJy
 eIooQHzfnZ+/dlMn59D0JwH3W5Jpvv0KLfVMTzd36Xp+Nx5lPn8dxvHtn2PQ+b7hrXVC
 m7I6kuu93IgK078FwLgO0GbODS9wWZtCfqDjF5e0CijuNJeSPRYo/xcbV2Z4SykeAR64
 JzCZ3O2AUEXDtzl+ei8bcK0KPXlhqA24la2+qRREVPiEG1Gj9vD3yMzMwMl0PSyJCgn9
 bGlTFgNDHZkz2CS19R01QedW+tY0d7gKB8e7uvTZLnyuqAMGHmIYN4kw8UlOFL9GtFvI
 zDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761683303; x=1762288103;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=39F+4wX7/vZJCdod1X2FVuwp5OFLEREjUNLwgk9n3lQ=;
 b=cILmLoH2xWHDQ2JDMuxlF+yC1qexKvvXuShQYxWrGCSOy2CDIWChMds/963J/54wId
 nmwAeiCztMz6G2RhDLkiMODaX5OjrWLWskKh5bAiYasuWUQ2xJpufDa/z2ADwZghAIEb
 B+ZRojHUeEUlBq7h0bRi7ZamdP5S9wU34meX+ocfuzKV9bFKEIFz1NlNwVnjzEeB7L7j
 CztQ3zZqAlhEUndp9Abhpw9V3iEZUicm+lcxexTyECFFLbJIyVvEmMr3cN4th9+QhqOY
 eBREnwySpr3di5ftJBtF/WgLARmKSVnXMHyg/2dViALdlYudMAbhHdtgK8vLiw/NPXP8
 v1tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9e+r5URMT4Y6Xy7NCKnJXxSWV0aIouzLrCYMCyyrYGJeMh+OHMa7QwzDt5VY8mZPcrLJmdq5bx5A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJJRWehrak6GPrtgvpuQcX3+/OhaLYjkGnsumpJVQHSneie3p4
 PVGDx9GUXyFgo1u6GqHnAuiFkRo/lI1iexemvfpNTgifLDcucr7yffuu9TNFgSUfgwIlnm23gtk
 eY2Eln75WHoM4L6jub2GAQcn0JIInTIQV2H+iX4O32hQ2sSqi1VJ1+Ax7iTXW2PmaQU1uh7I=
X-Gm-Gg: ASbGnctMbLSexFJdZ5Gz6cpHHcEozAwnZDVnTKlTVEGXVo8T2+2z4okt4NN5ZdgJVIi
 3LD20SbD159XUS91VtKTpheITFva40pBjjUc1E/KqnkQRc03D3dJNtW26cCGJmJngFWtOUuGBHd
 UnfzdQ3Pyp8lG1VDzK+HRj14/nCYwbdJu+m2Ozfe7piZzE11AB/udaRcbgm+pIGcO3upVQMdBtE
 kFpamQ4TexkV3YsDiD1JK12jeVPqalLWh8kq3cDOOC5r22d3Il9Y7jD1RL4vQzmUKMMparMm5N0
 oaEyro69gmhet/oJbpUK8g6cFI6Sem1IGuulW+NuVFBwSoH/LcrMIeSqoDfkGPfoeUvORIBwgS6
 Yt8pmpJFjnp9wTHrSrfaxHPPUwHeXuqv5k+gagGT5tEl69eg11m/5
X-Received: by 2002:a17:903:234d:b0:290:7e29:f59f with SMTP id
 d9443c01a7336-294dee60875mr5842355ad.27.1761683303139; 
 Tue, 28 Oct 2025 13:28:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+oY+KTZdLdnMK/py0cYeuH9Wttgce2ckBjFlqNYISBlvh0qxfcOnniR28w3lwyQobo3evCQ==
X-Received: by 2002:a17:903:234d:b0:290:7e29:f59f with SMTP id
 d9443c01a7336-294dee60875mr5842155ad.27.1761683302665; 
 Tue, 28 Oct 2025 13:28:22 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498d230c5sm126776955ad.47.2025.10.28.13.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 13:28:22 -0700 (PDT)
Message-ID: <2a11acc6-28c6-401d-a5c4-d18e75b128d1@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 14:28:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Fix race condition when unbinding BOs
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
References: <20251028070559.135097-1-karol.wachowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251028070559.135097-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3h4o7QI4-dYGzAO6wCMnJOBOFAejtHWj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE3MSBTYWx0ZWRfXxnjEIs+VQDl+
 8a+1flnB5ogGsQQWZMz2sOY8mieHspUc8n7pd5leDDepgNC6wH+UPXClclvPKljSB15SomAUqBf
 Hx810SKzLO5Jj5rUUujn9QK08H1siJ1Cs3zNlmeUK1cVEKQeeLp9wquk+LCSE3gNSN+xR1EgDed
 fyVEutzzdz1+up03j4G6vlTkEk8Bkp0vY/i98kYf/OTUI+lXZGsS4XY26KuwyiMoYB410sModmq
 qieCvMyuID1IrmvW59ZUa9esYlOxoIUR9kHTzWKhV1GgsFQTdF+05N94IwHBTpkN/VD/UyQZyeg
 ZTzEr/ktLYRcuTzrcGX4f7xYLKJscg4xelTbmyOQ+e/1F6EpI4Jl3b83zAffYaJRDoFb1+mLVLL
 CXYqXOJWd7AFNd4L3Ej7Yib/+xTzHg==
X-Proofpoint-ORIG-GUID: 3h4o7QI4-dYGzAO6wCMnJOBOFAejtHWj
X-Authority-Analysis: v=2.4 cv=UObQ3Sfy c=1 sm=1 tr=0 ts=69012767 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=I6CEikiqoV9Z9warEy4A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280171
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

On 10/28/2025 1:05 AM, Karol Wachowski wrote:
> From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
> 
> Fix 'Memory manager not clean during takedown' warning that occurs
> when ivpu_gem_bo_free() removes the BO from the BOs list before it
> gets unmapped. Then file_priv_unbind() triggers a warning in
> drm_mm_takedown() during context teardown.
> 
> Protect the unmapping sequence with bo_list_lock to ensure the BO is
> always fully unmapped when removed from the list. This ensures the BO
> is either fully unmapped at context teardown time or present on the
> list and unmapped by file_priv_unbind().
> 

Should this have a Fixes tag? Sounds like just a splat, but a user 
visible one perhaps.

-Jeff
