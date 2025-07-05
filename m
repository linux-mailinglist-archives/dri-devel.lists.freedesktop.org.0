Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDF7AFA039
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 15:20:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC56B10E10A;
	Sat,  5 Jul 2025 13:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2jqpw5Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874E510E10A
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 13:20:52 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565AbKMg007164
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 13:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RPpxJ1usBrNjKvHIjv3y2tT5s3fkHooWPv/2s8UOe6I=; b=Q2jqpw5Yty9zS/mE
 0TLedV8tnzuC145IXtGi9hKnhvGyAYYpOBv4LyO/6nh0YfdtRFaiISbbXVKyENSX
 vD/7Wr+qBEcLnlfXR9tVI7tk0xaNoa76aDWkv+7f4B6BMZzgzfRmVyPTxb4In+YR
 bgA8kUmc23c059MAIpA1+KoUZB0A7F69yOHfUQZ1Cr3WoinkY0GELiex5xQPkRuM
 bmmD36lKTQ53BkQIrmgwBf18o0FjtLmDyUhPsLMJVP52hIXJUODNRWIzENKVHXtr
 nmB/AUPSZPm7egkvOfMnMzXyc8MK+JgcLLqrXJAKLHbQoOGEpNcQ/pnararOzlg9
 jxVoaw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7q0xyb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 13:20:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d40f335529so430673485a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 06:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751721650; x=1752326450;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RPpxJ1usBrNjKvHIjv3y2tT5s3fkHooWPv/2s8UOe6I=;
 b=qmxtVrAaORmw09bi0KHE8pmqi4f6cdYVnfvjYdd+80w1lRvbiKu61KM8p4ja1eS4zP
 BG26SnpyFrVJ1LkHl3RN+HCoYSIMjMBnyNrgJEeH5xnq5AyUGaTsG+Umpy+eAfV11grl
 YFSQg1CB2v4tRK8kFOQmUm8fxRXiwoca6YpgHV0M1Z+QaUlu6YHbmAwEy541YhdvPhWZ
 RNaDxVqqBZTnUQpdbA57wprzj0BLQr3UIjsXRn81rm7QhU/viEFj3DZb53r804HeTXFg
 vDOAW54hee7riViF/OGF2hcnSN2jR+At3EwTf6dQXV2XGrdAZJhZBplL+pY4WdZUe1/T
 xn2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+0Xb7h1grc/G4Mlray/eiE6b90RiFGxv5myoSLdUcJP+13Wv9I7H7JAi2Ihfabo9W1PPLHKLBvjI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGXg6R/bF3QWpJDHI1f75DpG/BS9+VNPWM14mn5qz36bTd30R4
 fL6yhbiJ+Dr/yCvgOj8A9UEuQtIFabM3GQKcOBVJeJBWwfQ/EycncD+zRk4Yd6v/TWGxYWPj+iF
 RGxn94Ju9PKrm33vg9rcpCgWGQXrSeSmO8Nou4BCSAuXKueJAG1wt/eDw6t/8i8MomNVWcX0=
X-Gm-Gg: ASbGnctl3GZCVp/bpfAAwxJJZWlleTqjkSv7t2e5UcY6ie0Vm7bSzXDv+vuFNwzhGNX
 kyXPDmtjJ+HL6/WrQR1kj95LzrWjHe3J+p9JuCleX9hwQxyDkLdzEse1ZFoLkjteKeYAhWM6l+j
 kVHyoALPyUAyHYbFF8S6bVWjoR0Pm4cnany/prSl4FGY//ai4CnbUCzfCQrr1LHlKFii14yOoC1
 IZCuatIu9PDUO9pBbPYb6rgbe6vNvTUvN66UinqbUEfUmNHGx37JUjDJvb81/StFjyV5YDpN6d2
 vbC2vCdAVJFVIT5m50x0ENH3kHUxBeAXqaFCL/FRTK0OTRgseAdpWIUXZVoDO9WAfma8tx5nINI
 vGChs6m7UnhLNboy6nu5zhYYRa/HIUKJKhlY=
X-Received: by 2002:a05:620a:29d6:b0:7d4:3c38:7da5 with SMTP id
 af79cd13be357-7d5dc6b8d41mr905335785a.14.1751721650566; 
 Sat, 05 Jul 2025 06:20:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEykqonacErWWXyzoc8AUTjmeChUXBwp2f1L04Yp8dJx+7ljWl7gkvbra3cS6aaAdP6KUCpmg==
X-Received: by 2002:a05:620a:29d6:b0:7d4:3c38:7da5 with SMTP id
 af79cd13be357-7d5dc6b8d41mr905332385a.14.1751721650087; 
 Sat, 05 Jul 2025 06:20:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556383baf0asm591307e87.7.2025.07.05.06.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 06:20:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20250703-hdmi-cec-helper-unreg-fix-v1-1-7e7b0eb578bb@collabora.com>
References: <20250703-hdmi-cec-helper-unreg-fix-v1-1-7e7b0eb578bb@collabora.com>
Subject: Re: [PATCH] drm/display: hdmi-cec-helper: Fix adapter unregistration
Message-Id: <175172164893.2789471.241982274720939325.b4-ty@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 16:20:48 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA4NyBTYWx0ZWRfXyR7EHMLDWtCu
 o6Gk7fZv01c7RPwCqdDvimUz2TLciHyQY7xJ1AGZIyC10dkKp3lLOWmiHkGP5XmHRlvWJPcqwjb
 jBHRXJ492a08UbLJathwEKI9uDg3xf3ETGufhxQCSoPdn4u1dS6zJmJIv07ew/K7GDXNN7uVC/f
 bWQ4p2UONdCHgxhHBrYKyPkmoPeGo0bLJ/0pKMpkBVrvaO54CQ2QYep/CtoH1OhwDfgH8axa1qp
 ryqXcg0Uq0hfb+/TtHag9r6Ej/Rxe5r8t1XYK/RAbbHUf1rt+EwSv89nlSOPcRRZP/eozefclQW
 HGGRoakqLnTeblzV/ExAbLIHf1UUnBAxtgMd95nOuauhEU/dALMPADKDMI73EKczlBfGrw1aPx0
 TZTQpf0o8zP8fvDtMui7mCXfZpDZpU/r+luVg4y7yFUcn+tIwDGhTsj1ASUyKiXGpw+ghTB9
X-Proofpoint-GUID: Za7DHi14z4GpoyBy5vqvvOcGvghJoEE3
X-Proofpoint-ORIG-GUID: Za7DHi14z4GpoyBy5vqvvOcGvghJoEE3
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686926b3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=FPokAKTh0P3oSSPBHH8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050087
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

On Thu, 03 Jul 2025 23:05:45 +0300, Cristian Ciocaltea wrote:
> Attempting to reload a kernel module of an HDMI driver making use of the
> new CEC helpers revealed a resource deallocation issue, i.e. the entries
> in /dev/cec* keep growing.
> 
> Moreover, after a couple of tries the kernel crashes and the whole
> system freezes:
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm/display: hdmi-cec-helper: Fix adapter unregistration
      commit: 19920ab98e17af4e733ec4c69881d8ce433d3f1d

Best regards,
-- 
With best wishes
Dmitry


