Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13030AC6CB1
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 17:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8CF10E622;
	Wed, 28 May 2025 15:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5MaYfzv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571CD10E622
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 15:15:26 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S6FnVQ028888
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 15:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MgByvl3ckepaF69BlogdaJiFhvkLD/m96L5RpVcp7qM=; b=D5MaYfzvKtuJwZvz
 rLONKXRmnr/g/cNFjxC7n6YCLI/1Xc+m8xKSaI5lrB7z3tS3QiKXZf+L+fkcuRCB
 m4NvPCotvqHQBQOvcFrVscHaVyh5+W6P44GhvJovyilLvwe6yBQYRi5ltXe8h220
 nsddoYvC5MOWtFKED9mN7zc8Vu6lgQISNji01QoYv6rsTpWMT6e9hcVT/xuM158r
 o0A4xdgXDhO0avKWDo0WhylglTtSNx+Othmqy4aNLmBWNJLD27ft3uR0Om+cVsyA
 xpF9OeVWnaSDxnbNHoE6vWrVcir/QEj6MSOWgtmmEkSSlnddsv8f9IaeflInn0CX
 DhrFvg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf31a8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 15:15:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-23415056f5bso53065645ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 08:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748445324; x=1749050124;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MgByvl3ckepaF69BlogdaJiFhvkLD/m96L5RpVcp7qM=;
 b=USV2KNGHlgZNXcnYtXuWyugPsuIJml8Nxj6tm1z+yj+OPCe4vu44GZBwBLqEMvoFsA
 srAl4qkwYWBViiyGL8tmp8BCt4/lrcOT80fHb/Tq2/IAD7y2llvT6kCaGeIiOUB0PSkf
 KGBwmY/ddLKbG+Qw7NIoQaTes2yrKFBQpFynU5foBkKkplTlU9USPkK6ecwbRKHlG5xX
 adcYzLHX2JrWCuAz7F2JVM0hFEOOIGUabjjV86oId7oEBqBMrn5u9XSExrdJZCVNUe9D
 h8MHaNsceQ19BjPPoWTgGIKnrZACHlUm1PJt3E83e3JFIv8rmiMKBjNu+Sov0UU2+ZBd
 1mTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+3fyCq0Xm6WBIwPyfaChSgY/zd8uTf3laQsE94KFOQAgSienidxMiViQ2KRoow3sg+pDhPwJ499A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjHAtdTz/NbtYD4UtrkDbcqmD23qWyYAhRbj/O8tyB03krlkDx
 CpfeHY26QpbuClqz493NwiB2VF13qjf/+X4cOWjSoHpDE0QUWYXkm6AsYjVZgZYsH9sgp3aR/QO
 XzBIN2mVgsuOUvJrRht6UnZbnxQl/MH9d4H3k+ia2cpmdlOyku4gYwIP2zvZTZTOmYpSjFFg=
X-Gm-Gg: ASbGnct3EcfJ5SGMdtGM6YyvJqsu7aXKOrzoHf2Z3JRqso1QrF3bbaqNpdhVFbw7ojs
 OsZ4Q5ury8290tHLptbwyPQh+vjAkOUFzy7uUbx4Dmxw3mQjezDR7Tiq2k1k05LB9T2phcH/5W4
 RF36UObAhIo9qFCO3rB8VwWWPVkgCbF/GDRxKJ9dkO/G10/sTgP2Jp3fiuqmPpT6MdOAqDfMcT7
 6FZulmY7Ghf6B/uvBMU1W/KA/ciEMnWaCANEL6MgVeGb8+QJyl/yeSKCDiOHPqIGJvDAsDZ89zZ
 3DHVi9YN6Zlge3awntW9lQs45tu8gZSIAr5qcbWTdW/tRn9sWokTYsEKAXLHQQ==
X-Received: by 2002:a17:903:1547:b0:234:d679:72e9 with SMTP id
 d9443c01a7336-234d67975f6mr34198855ad.12.1748445324630; 
 Wed, 28 May 2025 08:15:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+fHExXpmEQ68MffV+vPEWdglq/8jBdvplEo6II6kIixUdE9kLKmnfJY0nJ0aFhZ6ORv5X2A==
X-Received: by 2002:a17:903:1547:b0:234:d679:72e9 with SMTP id
 d9443c01a7336-234d67975f6mr34198595ad.12.1748445324263; 
 Wed, 28 May 2025 08:15:24 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-234d35cbb41sm12929605ad.256.2025.05.28.08.15.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 May 2025 08:15:23 -0700 (PDT)
Message-ID: <70ad82b5-19f3-4e05-bc7a-858dafc563ef@oss.qualcomm.com>
Date: Wed, 28 May 2025 09:15:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] accel/qaic: delete qaic_bo.handle
To: Simona Vetter <simona.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, Carl Vanderlip <quic_carlv@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Simona Vetter <simona.vetter@intel.com>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
 <20250528091307.1894940-5-simona.vetter@ffwll.ch>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250528091307.1894940-5-simona.vetter@ffwll.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=6837288d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=k3QLI3o3WigVO6453v0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Plgd-01QSi6L7MiQYIc8cyZHkp-EBJc5
X-Proofpoint-GUID: Plgd-01QSi6L7MiQYIc8cyZHkp-EBJc5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEzMSBTYWx0ZWRfX3wx79NxWJZF/
 C9bOZqvPLC1QdZHmXi/CrFqM+0M7w8+7pjkVeAWCZp98P/N81h4d/8JHzKiP58xSvp4BwK6PtaC
 ZzSfKgDD6syPslnaWi3tDa97tHId8K4M0D42GL7vQ5sT8N2BDGwhhZqe6Soo4JxCB8gN38lFUYs
 AwyIf2MxMD0gQYPOGxAMW7CNnt3d2EG3HLy91EeKLj8sBJlDxVo0we5k847q8e3Eyx+XVN80eGa
 wV9zshZ7klwNrey+kQa+3QHsUDC+qZXPC9cuU720UpJlW23rvc49gmJHr5592nr26HPHpbY/gLo
 v6Z+GhR3BoK+SMKg75q+tEPdlbMokUa3vNR5Giq0xgOQ3Kvl5MRmAep4EpmSvGECddp0AJDNsQx
 HHpC4omRkFCP40a7crm78pRsHlC1IqKoTNRwKTGQJAChSJ6mzQvHGZVZ/NMKHT7JxaNUquJQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280131
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

On 5/28/2025 3:13 AM, Simona Vetter wrote:
> Handles are per-file, not global, so this makes no sense. Plus it's
> set only after calling drm_gem_handle_create(), and drivers are not
> allowed to further intialize a bo after that function has published it
> already.

intialize -> initialize

> It is also entirely unused, which helps enormously with removing it
> :-)

There is a downstream reference to it which hasn't quite made it 
upstream yet, but tweaking that should be fine. This is clearly a 
problem anyways, so we'll need to find a solution regardless. Thank you 
very much for the audit.

> Since we're still holding a reference to the bo nothing bad can
> happen, hence not cc: stable material.
> 
> Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> Cc: Carl Vanderlip <quic_carlv@quicinc.com>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Simona Vetter <simona.vetter@intel.com>

SOB chain seems weird to me. I got this email from @ffwll.ch, which 
would be the author. Where is @intel.com contributing to the handoff of 
the patch?

Overall, looks good to me. Seems like either I can ack this, and you can 
merge, or I can just take it forward. I have no preference.  Do you?

-Jeff
