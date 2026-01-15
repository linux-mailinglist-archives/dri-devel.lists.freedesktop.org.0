Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7288CD289E0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 22:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECCE10E7C6;
	Thu, 15 Jan 2026 21:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wuj8sJK4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RofcvL77";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA82D10E7C1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:56 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFYFCZ2174565
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 W/kb6DjN+Kxg+2Dboyf3yHThguSDY0BOoE5Ljzy/mnE=; b=Wuj8sJK48O3yrePt
 UizqukN82n6mdH/IZFQyUDeSlTPjryOGTNCpcydP2U7RRtlknfaQUs3klMxVcxnF
 s8h2+fPitCpRCDic4qpydnK2191dpXZmJTD8qKFD8a0tNu+cS7MSgS7OXtOrRTNp
 JeSkD7k/92klvWffhLvml1WY/SmC1ARqKyiocECPB7jGTpT2hfVePnne2QjJ0aVT
 irAHhfaM0LuWbux18LJ/8y+qVp3ThCQmuL1fIzo0JsXmdByu3RxN7BYK4oz+crnh
 PUpKLiSGXHCN9YahEkwIJCDNYNmHd9MYjG5PizOPYP1KpCgvOENxjjVx795DBJwY
 4lO7NQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq1xh97mk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c6a69b7813so53670885a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 13:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768511155; x=1769115955;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W/kb6DjN+Kxg+2Dboyf3yHThguSDY0BOoE5Ljzy/mnE=;
 b=RofcvL778zBYlz62RJwRZrSX+2cDLUEq2n4L2CgTBkyvfn13WAYqqyZtgzvdWl59B4
 UoqlSMKe2uUmOcVhLOvu03Jgw/JJO95tYMif5m7744cDZouz33LnBJmlfmxM640Ozvb/
 bPNIL5gR7O2ndkIlnrH24VXOWYHhS3Q+qsdQ9of7kazYsPhD5zOM/YMmrvGmv//ivneg
 CO/g/KyJmgnK/dZnSJnFvegSFbz/PoQdLJzGEb2go1egspyEJlMAcK5p1vA4it61OfxS
 otFUbf08rWF6moUQVqT8AXIgM6YCSFjYAHUdoPeu2bFm78C9Hhs/7TlmCvbQ8VzsufCD
 BY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768511155; x=1769115955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W/kb6DjN+Kxg+2Dboyf3yHThguSDY0BOoE5Ljzy/mnE=;
 b=Bbo6+vjuZMb8wOwiO4qBsXM+3Jb0GN3bxDO5nwZKgN1HA6MvC3FxWyrYvCVc375Q0w
 3yeAFonqh8plQADH2GUKiq6w8plsiwJrLqettWprmbgkQ6bRKFTce5Pj78HSsTUfvMs8
 +abK2GgDDbttpn7wz/cCqxCoHNBMywYfMtm54pLzTSByorHhNFAor0tFK3scEnkG0M9X
 /ZjasinHbW/peMYzFd5oYin524d3HOzyO/ZjtQmYBmDs8JFjb1DkkreZJYo079FFj/Z2
 2WUyCDgcs93sJdjQavQBIzN0Kt1vOJK2nxw2QBkljDqdiasuk3H5tyGRZ5fxKZHj8vkg
 jkNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhpv9/5FPIylX8Tes+h2v5Mq8TXjgTMAvEONQzOyqDVr0ZUxo11Av5UpEGZHItywUKhTB1h0APWY0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJl7IeXWR+DVfpjl4cs1zz2/CzQmQmhzJj05BAV5wJ33vUCslA
 bWZvx1e8j17AKm8lgBQAwuwtp6YIMkpPNe7YRZUsbv1oRZlZbm+2asNAgiITKkgjOiDOQiyp3No
 6pQ9L2W93ykJ8jEoxQSVQWk+ikdQ/6OBOk5Ru7glhVn34HCjtGofYVQWqynLQVh31oeeOcvJiHA
 iUzKs=
X-Gm-Gg: AY/fxX4koyQFaUKraiPDlvzOOK+B80iygi5pjNKognregwY4aD3uKg1k6WKs+uOPquI
 BeIPPa3p+BCOlQ6t6f9ojvPDBgBWR/CuRRNyPjeQEDlXRM68rpzAhWcZ1+0CE/LQLGUoQDUmVDv
 B1d903Ltzzvkoh5PvbK3dDMelgRkGIhM3b0SrDmpuDWAoMZBK8mGvGYTtAja5v8vb9Cluki8pnF
 xXXjYiZWITuDwV5r+XgH+1BkyrdDR2WlX4/old5wfUMXKMwTlSvkUIOc0cuC7VDNi+R6Y8rUSjm
 3QoE5iWIx1tk4ZPvRRcwFIT+lL/Ze2w4CJsJuSBorJmRit95kPZp+wCBtK1wEiNnU5I8OXbry00
 bbstm2q8iIe99tI+IQjC/J+DO6HqyE6sIwxVZ40OKX/MwG78mb5Qp/LUvgpQxtSS9jiaGTQ3PA3
 wR5YMw+bklLph/SCFJie8NMLE=
X-Received: by 2002:a05:620a:4141:b0:8b2:e1fa:6eab with SMTP id
 af79cd13be357-8c6a6948174mr99297585a.62.1768511154692; 
 Thu, 15 Jan 2026 13:05:54 -0800 (PST)
X-Received: by 2002:a05:620a:4141:b0:8b2:e1fa:6eab with SMTP id
 af79cd13be357-8c6a6948174mr99293685a.62.1768511154209; 
 Thu, 15 Jan 2026 13:05:54 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 13:05:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 00/12] drm/msm/dpu: rework format handling code
Date: Thu, 15 Jan 2026 23:05:51 +0200
Message-ID: <176851027323.3933285.2288254082530063722.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
References: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BuBsKbTM-eriV9qPk83qr_fEsrBXg0ex
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfXwMKXSbPKk5vI
 xvCUCGLt+9DpCZ0pdQbDrW/HrRp4cOYLjgVXHN9k341s+BY0WL7s7fuV2fJra0N4RbwaMOmm/PX
 dsF3Ccz7pFtMiUvbz2Tx4fY0uUnVwmVocMmDSSnTpn6M8KjuplEn26U9bIhWkIa616eVLGGs/1l
 /wwvUU9N6yqYwGEo/MoCrDY60bqIRTXWY482thEtwJguoRtgY/SwM0QuHzU2O0F9kIin4yGc3IZ
 J7AqXMkhs4XDpO4RewIwSA0bzA2W6vMYCHFYLOaBzzv4WERghMfqpNwVAwEN+BQCsFMmawspYcR
 DsMndxCWbJi6ijim4b6ycESGfxgqCR+AjfVUT/6Jw3B3Qc/gjOo4wCxtg8tOLEoN9jbe8QBMREQ
 v3eqc5O8X0UDO1/GgR+Hg1nyjBhpTw+6eU2i5fNiUOHL/uP04DEDO6rI2FbJT78pr5+buMrh/5Z
 TJlFR+1uBqbK0n1FzXA==
X-Authority-Analysis: v=2.4 cv=TdWbdBQh c=1 sm=1 tr=0 ts=696956b3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=uKya-R1R7wZuNpulkw4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: BuBsKbTM-eriV9qPk83qr_fEsrBXg0ex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165
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

On Fri, 14 Nov 2025 05:43:27 +0200, Dmitry Baryshkov wrote:
> - Rework mdp_format.c in order to make format table manageable
> - Rework layout population for UBWC formats in DPU driver
> 
> 

Applied to msm-next, thanks!

[01/12] drm/msm/disp: set num_planes to 1 for interleaved YUV formats
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6421e1c5075b
[02/12] drm/msm/disp: set num_planes and fetch_mode in INTERLEAVED_RGB_FMT
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4066b57678b0
[03/12] drm/msm/disp: set num_planes, fetch_mode and tile_height in INTERLEAVED_RGB_FMT_TILED
        https://gitlab.freedesktop.org/lumag/msm/-/commit/adcd6dfea82e
[04/12] drm/msm/disp: simplify RGB{,A,X} formats definitions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8549e95a4b54
[05/12] drm/msm/disp: simplify tiled RGB{,A,X} formats definitions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2bd6ae0edf76
[06/12] drm/msm/disp: pull in common YUV format parameters
        https://gitlab.freedesktop.org/lumag/msm/-/commit/72ca4e9d0410
[07/12] drm/msm/disp: pull in common tiled YUV format parameters
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a4378e4bb138
[08/12] drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3705de1965df
[09/12] drm/msm/dpu: simplify _dpu_format_populate_plane_sizes_*
        https://gitlab.freedesktop.org/lumag/msm/-/commit/72f20360d4cc
[10/12] drm/msm/dpu: drop redundant num_planes assignment in _dpu_format_populate_plane_sizes*()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d4db3a06c5ba
[11/12] drm/msm/dpu: rewrite _dpu_format_populate_plane_sizes_ubwc()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ada4a19ed21c
[12/12] drm/msm/dpu: use standard functions in _dpu_format_populate_plane_sizes_ubwc()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2f3ff6ab8f5c

Best regards,
-- 
With best wishes
Dmitry


