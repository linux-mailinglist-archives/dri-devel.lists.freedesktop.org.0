Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 953E9B1AA74
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 23:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015FD10E45D;
	Mon,  4 Aug 2025 21:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U1I2kJOX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA7A10E45D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 21:43:21 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574GbvTi021762
 for <dri-devel@lists.freedesktop.org>; Mon, 4 Aug 2025 21:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Es8yYGkoaL9WsWMGWRUXzp1VH7ftdQ84HcS
 owvwXJBw=; b=U1I2kJOXu5Ur4+sTw5Sjtrk6MaCayoLLEJ7Y3QgF2BJtdTpyCSy
 1ibQv0Xan7sDVGeT5SdNiPJfB9RfP82+zQ/K9kDoHoXQGb8fS9s1DFhAfx/kd7Fe
 KyWn42hhOhM4+kZcA23Ky7/8+f3sYt+Mk0ZdOWAZz6dqS+Oh3PTBDlhoYCuPzyH+
 f49Lgr7QfXcZf8FLh4GrwMeWeknEt6yzoZctsFOi8HsP4nc1D1/N6L2YJ0zc3uId
 gVTOQG4nijVeiO4XrLNcpJhoq523VzB+QZqXEPAYbP1HU+lfhL/hppHEdsuWkC9D
 1dkCL0sQDAUSfSDhwcRjeeuSOt7vy5yLtGg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc6a8n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 21:43:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2407248a180so36340135ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 14:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754343800; x=1754948600;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Es8yYGkoaL9WsWMGWRUXzp1VH7ftdQ84HcSowvwXJBw=;
 b=ZUZZY4T2UBtsngQCeZHEi2tOttVtUNoYDXoRezI0roJi8THlG7XT+35j+bx6aYE2oQ
 8xu5erXBnGgaMyN3tAsTFUf5I6V2YxqazhJ6w0UlvB0mfEpcnGsGrPdPXexWZX6fExVo
 mtO1QeXQPvn66TxyFsELxkKhTc2IEAJpUKVFj0dJXEoBIDunzv2r7i7KEKc56ap6ihoj
 cSOGLgZ400lJFbq2CQijubonXY7zy9ilUsmvMHgYMNod2b1rL+Ce0YkvdJCHIKltaOWD
 gfMXyi7AxT9M+uwYvQMpiyQxFtjwn2PiZ4myes7pPZv56LZ6B+HcWgwVUn0uB++dwPpu
 HN0Q==
X-Gm-Message-State: AOJu0YxQcDCSsZ5aOm3XnAOiaFnRxu8Cj4CnjvYle35NQ/KkQyQ+6MyH
 a8RxS7N/xIOMvlUOzVPY041NUsGM4JojQo4rlG74nPHGe6R/8jevlbHnW8PBeR7I87w0prPcXV7
 Zf3xCxxlq6N8wouQPFck+TUNSQuiqlXQmmCz6Tgyq5Z6TqnVN9XH2znj35qmM6pl05GUHhLz2uP
 +74x0=
X-Gm-Gg: ASbGncuH/dWTn/bQabl1Ddg1Kw7aKPN7ki1gx+qbXwHUmioWgFEya25K3un9JWnMYVS
 LDIfoH5DuCKvZadv0Bj+7x79SZLbD+pyNveEkzlW+4UIqZ3vRk5MYgmojDXOFPLYqyuZhyHedgV
 oCw0b8AZnbnz1cHUksPF2Ubp0KgHTk4JB4A3WVecUlOZl4EREIjtUQQjGex+c7r23xNr0E32qsM
 S0FTgztiwEjtLGzknJ3EbmA2SCR6vHBrZ07p7JsHohTUC7n0WJnFcurA1H7LcjPRoUN6610F1BR
 YpaByLItOp0SQ7ySm+lMDAPmzwAfya6HGbgwOF1i/uMHTd/qJqA=
X-Received: by 2002:a17:902:db03:b0:240:a559:be6a with SMTP id
 d9443c01a7336-24246ffc07fmr168919745ad.34.1754343799945; 
 Mon, 04 Aug 2025 14:43:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMENcFBVOU5CPFNiVaukbmJxZDsOzIZHTpJidiDWnGmFiPem5d1xxZ1nYXWM9QrZ0SYd5T+A==
X-Received: by 2002:a17:902:db03:b0:240:a559:be6a with SMTP id
 d9443c01a7336-24246ffc07fmr168919345ad.34.1754343799505; 
 Mon, 04 Aug 2025 14:43:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8976cfdsm116217775ad.101.2025.08.04.14.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 14:43:19 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>, Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org (open list), Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maxime Ripard <mripard@kernel.org>,
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS), Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH RESEND 0/2] drm/gpuvm+msm: Handle in-place remaps
Date: Mon,  4 Aug 2025 14:43:14 -0700
Message-ID: <20250804214317.658704-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: viJwyj18947LClH0c5t5lIPKNxbOS8co
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=68912979 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=r9eiMqSCUvIwoLEqkV8A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: viJwyj18947LClH0c5t5lIPKNxbOS8co
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDEzMCBTYWx0ZWRfXyz3wuJXBtDwl
 LFTIGH4NslTK8+AiN8ELuyYIyl/n74uy4Tjw6qUVv8ZsVQA0MpWwuZGS9Nb3b1yXT1LhqFlf2n7
 j7tcO2hMaGhekFCtS4KigHmaKNYg/rV/wJmZTf6QAWjeFTrzkR8t2zR3DVvY3CVce06UnO8Bor5
 aML5XviD+0l6VvhxzATgjAyBScafBug6jDAMVkmexADkcUFd2D4i5h1CKEmWY7pWBBb6R1E6jg+
 fLjZ6spr0qARO79aaJswNjh1KlAZGhyb5kqijEdmPSIiEI3OC/s0AIeN/167caXvd3K8rftZ4gX
 ZqaTyWdhDl0b4s446h0z4BuZzEa5AKLbdKgwESAybDFDi/XT1ke97mVixSY3waWZnYZs14xxosj
 efGxQhrvvFwfsL4AzZUUvxP4VGjBs3jHwfSRQFcryTR5xqZy78gy2zQeK4FXNxe4zkWsGbED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_09,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=715 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040130
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

turnip+msm uses a DUMP flag on the gpuva to indicate VA ranges to dump
(ie. for devcoredump).  In most cases (internal BOs like shader
instructions) this is known at the time the BO is MAPd, and the DUMP
flag can be set at the same time as the BO is initially bound into the
VM.  But for descriptor buffers, this isn't known until VkBuffer is
bound to the already mapped VkDeviceMemory, requiring an atomic remap
to set the flag.

The problem is that drmvm turns this into discreet unmap and remap
steps.  So there is a window where the VA is not mapped, which can
race with cmdstream exec (SUBMIT).

This series attempts to avoid that by turning an exact-remap into a
remap op instead, where the driver can handle the special case since
it can see both the unmap and map steps at the same time.

Rob Clark (2):
  drm/gpuvm: Send in-place re-maps to the driver as remap
  drm/msm: Handle in-place remaps

 drivers/gpu/drm/drm_gpuvm.c            | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_vma.c      | 17 +++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  3 ++-
 3 files changed, 38 insertions(+), 3 deletions(-)

-- 
2.50.1

