Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DFBB0FABE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 21:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E29610E008;
	Wed, 23 Jul 2025 19:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dY9FdImd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCFD810E008
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 19:08:56 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NGnwwc005629
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 19:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=mASOgsCi7NBq5T98FPC/x55U6eCvkphaYtG
 YjqMVya8=; b=dY9FdImdDR9/7eLvB5z/muueEDREJzyboWBxSOLntKGdkenKupL
 19gbBWE4IN96sEDEKmNnsOorRLY3yOZ+ScfhLcoIaJknbgmpeM6GhRtjl47DnT21
 0Pf8v6kEfnLz2upXp/AV9L84pvK+0z7fIakSAwmSpI4RrPdV7s/0xIpP3BIvNmdD
 bCGYaMDGJR+9X/p5PTONCcTrvic+qz0zipnngxozjzjntjyH/YAjujokB6OtqjNy
 8fiea5orKNWNkTp3mnlaJYDJBkiCe+Ev/Bzfuf0OLl4CeL0YkimmGhv88mHszUYQ
 aR7BOf9iBfUkoKvEd34q6MAiC+oZUcgcQ5g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1ucvcf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 19:08:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b2c37558eccso132825a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 12:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753297735; x=1753902535;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mASOgsCi7NBq5T98FPC/x55U6eCvkphaYtGYjqMVya8=;
 b=iVrfprJAB3z1sm4vBBJJWquptquEhNWvXftb32XVbPAYQ8DeFrcASCujvd8hxE6wuE
 93WJjY51kC7YqGMDhaiqSLl5suZRFkSW5vwhwKpLjpeHnG6WLnyk1ClfnrUa2FnQndmp
 32fzZ6Yuupu5e6ZV6Y9BMDvemf4wW5DkJVhHKlR/k+k9jBnujBiaKQvfimAMFfilY4i8
 aOYGqaqFSo1vBTj1maV7x+xlbYeMpfv6TKTApZPGxSw8TYgjmUoyOSfMPHa8QJnukQSa
 N9v9RlU7k+SucTr+mirwTHIaW4a+iBHd5aPFAUbhMa+vg/kORrTr/KXhgOJ0sVnqhPYl
 BYgw==
X-Gm-Message-State: AOJu0Ywgo+4shd98XCHuzzue68rOVeLqUjh1dBqDPNISpjeJwwDcWPLz
 kpVSgPEHJ+wnUJlIDLd7nJax1xWi74XjAweWJMj6YlVb4kPzDH9O8043uNBCy6BIQM/Pc9U/T0c
 CZxv/0cw3UVrLPGQRmw1qm1P/6SvjFWF4fCMTOoxwZpF1kQWWcW9Ucbf1NkMzcU+p6BlJgaqDC9
 rcsFU=
X-Gm-Gg: ASbGncvi6H0kKORk4pUHwekZECZc6s3JVWHp/8G+KffhU/IQA6n+lJPGDN6Lhch2Oyv
 i9Amj7fyq0Ev+09ZNW5pia5bfABp6OGu3qlhA/UYLJQONfTtobMlRCwL58QduxtTOGi7fBv6/wm
 gXKXPG6zU46fiyUn9o0ALeHIXWPWk/8Hcohw2j7oom1tGkIzmZGqpitU3cQ3V5kNNgC78f5sRBv
 l4QIzOu4eAJiP2LoZnoYYTVVbJvBIBOFf/Q6vSBFq0I5fqq6Og8CZF4+hYhhBvSDwJjKolRAELG
 r4wBg9xM/lIBFu+2e9NjNIxZU5w2527P3tV3TIMwLLEZEB810q4=
X-Received: by 2002:a17:903:1109:b0:235:c973:ba20 with SMTP id
 d9443c01a7336-23f9820283dmr69182815ad.49.1753297735443; 
 Wed, 23 Jul 2025 12:08:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhVi/6gfyiJ69GTvshRkz/NQIrNp1El4Pbp2UDbBc4h/tVujCiVC1TqjgOnUvKlvGS+Ua0kA==
X-Received: by 2002:a17:903:1109:b0:235:c973:ba20 with SMTP id
 d9443c01a7336-23f9820283dmr69182405ad.49.1753297735019; 
 Wed, 23 Jul 2025 12:08:55 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6ef9aesm101308975ad.211.2025.07.23.12.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 12:08:54 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org (open list),
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/2] drm/msm: Error path fixes
Date: Wed, 23 Jul 2025 12:08:48 -0700
Message-ID: <20250723190852.18394-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=68813348 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=eljiBBwz-SQjAQrFlygA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE2MiBTYWx0ZWRfX5jpiHKHZYyh/
 g2DJO8y3QPKeZ4do+CGJJkyuT6nYuj0xvgRXao4Zd8OPT8+ml8CKM5e4QoxncLppbEI9nP43BfM
 0A6o1FJMs3xx3gPUcSXnulvhj6bWRjwC7XFOpmBpHYohlpDynkEwKUmMru7C69EzmmDi+9PmqQP
 nXOqqBrdqHeFVvPvJaBdJSLAiBvR3FCUnxlMVijAM/rgLDgSFK4GUyuDpUVUVxTdtOmEbk45d1E
 jKJTU4tHc2D87AxA94i4YqoR59UKUjRvi/t1p4t32P9U4u9IkGMh1x5yC8O5MucLAy2q6ByLB0o
 8Ly6FO2NT1NLVIiuS6dX0F5/VOduYLuJXANVyoeAVeC62CdObD2rDitv5WeM6MOmBok6WQGE7rr
 gokY2xnlvEtFLxkkjkoFcT0++VINc+oyv2oyVk71qJlKWWzdN+TgtTQsEsP6Z7cutO1XHvFh
X-Proofpoint-ORIG-GUID: GcK9hrt64MXUx65yDhPD38H_N8nO_otu
X-Proofpoint-GUID: GcK9hrt64MXUx65yDhPD38H_N8nO_otu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=954 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230162
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

For reasons unknown to me, systemd-udev recently started limiting
max-files to 64k (at least in f42), which exposed some problematic
allocation related error paths.

Rob Clark (2):
  drm/msm: Fix refcnt underflow in error path
  drm/msm: Fix submit error path cleanup

 drivers/gpu/drm/msm/msm_gem.c        | 4 +++-
 drivers/gpu/drm/msm/msm_gem_submit.c | 9 +++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.50.1

