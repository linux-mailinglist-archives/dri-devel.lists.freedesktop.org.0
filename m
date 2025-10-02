Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 576A2BB522E
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 22:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E2C10E848;
	Thu,  2 Oct 2025 20:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kaROFznE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFD610E845
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 20:38:53 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5929CtoY022669
 for <dri-devel@lists.freedesktop.org>; Thu, 2 Oct 2025 20:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 M4x/junmy+fj03/LZZBzwfiTmBsCnIUC7WDiYxw7F3I=; b=kaROFznEaRc89L7D
 x5baXEL7Yeup+eeFubnAaA+lIEygh/JQLF+maNGW4BtczGYq3JGtHAGzZzloMnOT
 b67FoW2PQR82SNjals9Hnf2RgC0EqUrLZ4Q8jLfdD4mTi6P8hgpkERi8HJtJdIws
 QkQH7vFiwsF76jfwHsExIcXJEGtT/L0P1+BEMxlLrQ/EpihnJLZxgl4mAck+HqkG
 HZ139l8j/AQGpv7JJYkhy7sfFM1yoifq0XYhxen/O+KNPp9GCnvCCQyCYkKutflm
 Didb5r2Rsxdt+HpSf9FGLx9Ojt8Dxk+BvuLBgGcSBKLWXWU9Chq2sAj0A7TRoYb0
 5Soliw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n9b59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 20:38:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-78117c85670so1714262b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 13:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759437531; x=1760042331;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M4x/junmy+fj03/LZZBzwfiTmBsCnIUC7WDiYxw7F3I=;
 b=GSCYhhp36Qp+BpXtUtTORaYS+pUIDxwlynOcIRaZoqp5KrT5Wo0mIpr26SsG7glCSa
 DH6zj38Pk+SH6MS/x695OG1EOwSjb96xyVWZ+nP7I1RbGGZS1HriHLTOaLLc02BPSMiM
 gCnzEykzUX2+Lb2S02p8vq566P5siIw2G7FDbPWTau9eHoGicjAF80E/DIvo5VVDDdyX
 27EnlRpZ0GsaZ+XJGGdn+Vku3wTX+oDeXV3UQTX1iwdLkL8uKGK1PrY7N2RTP+SyzS7s
 4W9cHHefGLgEgdkZ9HEJ+aMhWeYGf7bPO/Pwpr/BuxnCYtlBK03m+zMWlbHskAbgUzUz
 9jZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGCUd0dtCHcgdAtCwvxkfVxt61KU7DMPsR4UHhTdwCMrOt8lIdRVHBEtK3QpCLsARHM5LB+DwmR5Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywh6+OOVW9vuuQhi9ig1OXyqEbKDnI9+7x1MCa9d2Tfo6elZszK
 yI6dZjVPDlwRLdeXVHHFGo8i2oUyJVMtVk0FTeh2T44I4NoDKjCIIzYF1plTBd+eeCwSoKPLN/Z
 uVYDg1OZHGFAE9pMQUeZAASz1aWaXqrHaY5ZOduCxcyBnypIvDkw4ZF03uY055eLNu/p26aE=
X-Gm-Gg: ASbGnctscmVgWmLpy+fU+FCU2MnY3d7wdhV6AOiFVTPlQFvC4AshxV/v9Z0+VOttZXt
 BbjiyrYAC6bsJEZf/meNQSSyz/GfTiwHerSWxRICrjMKbGGzUZAU+QZRqObCxg5lmVIRRpKrJa+
 yt4LfHv5VuuxmbsV7nVpOL1si9O1LvrupDwRnnxopMcQ8L/05nZtSv1efv92rXqSQ6rlUxjMHcY
 HWlieQFnYc/2+q6SGNsBmjD0sP/kKEa4/jh45+F/tjKg2biSIVYP65ig3ohXiT/iSkvGI5AolP3
 wasMinlxzesbAWdFn2uCsxpyGFk6O/pdsKtmFW+DCVmRULQcNmt3pfCYggPy4MeUz2n3IhUnVL9
 iAYs3JC+TAzlFSS/rGGbykaSUu8VDRJoG
X-Received: by 2002:a05:6a00:3c8c:b0:77e:d2f7:f307 with SMTP id
 d2e1a72fcca58-78c992116c7mr845540b3a.9.1759437530696; 
 Thu, 02 Oct 2025 13:38:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhslu8A5VT8wFaS2qNtZbxY38+uYrEOLOZI2YFZUzBLIBrm8UHrrp8gR7lGYANij91N5/Faw==
X-Received: by 2002:a05:6a00:3c8c:b0:77e:d2f7:f307 with SMTP id
 d2e1a72fcca58-78c992116c7mr845516b3a.9.1759437530238; 
 Thu, 02 Oct 2025 13:38:50 -0700 (PDT)
Received: from [10.226.49.150] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b020537e0sm2939261b3a.56.2025.10.02.13.38.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Oct 2025 13:38:49 -0700 (PDT)
Message-ID: <c8caad3b-d7b9-4e0c-8d90-5b2bc576cabf@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 14:38:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Introduce DRM_RAS using generic netlink for RAS
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Hawking Zhang <Hawking.Zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Lukas Wunner <lukas@wunner.de>, Dave Airlie <airlied@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20250929214415.326414-4-rodrigo.vivi@intel.com>
Content-Language: en-US
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
In-Reply-To: <20250929214415.326414-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 04PLhwHNonmE43AAu0XCCDnmIU-5jVyd
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68dee2db cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=U-pXEFeJcyFK5CHIgrgA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 04PLhwHNonmE43AAu0XCCDnmIU-5jVyd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfXxEWsaajIKzcl
 WZtIwFjnuJAY/2zNHb7OSYaTk7eLDgFGHeAYLqNHqV8YmjJgOFFIlqgzPQP0n8lhIkUoXXpXsM5
 DBMx8A0PtYujfqVFDQCilOl9FvP60+SOP5Hv0YLEI5Dno/QT+iySPBDJl0L0t94/cu/0Bd1dsDG
 JkyoqktSJwpRcp+4eP/2KKuIdki0vJzOT65k4EnWZjYmIcgCgNK9TojfROQZKm5a52frwiTNuXT
 NVwnZ+6mMCZvRbwUqKfURMlScMag1qOl3Hpbb4GMsd89eU5/j+ydKv+Dh+tO7INoyDEsfAwQxgq
 BXQy+T2jbcz+1odfEDVpiYgU32DFEAiFaUeehMKlXV9yunIwAjWH3xXq6k8Sxb5xh4BIZzScO1L
 1WPboia3kFWV3BiV7temP7W3HiIfXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001
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

I think this looks good, adding telemetry functionality as a node type 
and in the yaml spec looks straightforward (despite some potential 
naming awkwardness with the RAS module). Thanks for adding this.

Have you considered how this might work for containerized workloads? 
Specifically, I think it would be best if the underlying drm_ras nodes 
are only accessible for containerized workloads where the device has 
been explicitly passed in. Do you know if this is handled automatically 
with the existing netlink implementation? I imagine that this would be 
of interest to the broader community outside of Qualcomm as well.

> Also, it is worth to mention that we have a in-tree pyynl/cli.py tool that entirely
> exercises this new API, hence I hope this can be the reference code for the uAPI
> usage, while we continue with the plan of introducing IGT tests and tools for this
> and adjusting the internal vendor tools to open with open source developments and
> changing them to support these flows.

I think it would be nice to see some accompanying userspace code that 
makes use of this implementation to have as a reference if at all possible.

As a side note, I will be on vacation for a couple of weeks as of this 
weekend and my response time will be affected.

Thanks,

Zack
