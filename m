Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40085B2F589
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 12:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BDB10E0CD;
	Thu, 21 Aug 2025 10:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nt7DQmg0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EC410E0CD
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 10:43:33 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bFrc007146
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 10:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kiZdVlOBBo6Pgbbgd20Jib7efJ//o3XH891vVFgq7LE=; b=Nt7DQmg0d+IiVhI8
 aoKIua0TMwzmKrWurHqKrX74EpdPyDGV5g+3J7WyPbYUawMPbNhKhmUsp51A+tDi
 3N/zBSoQZxOWBFdj7T8tM4295sQQ2pwa+QZiv2IksNzJwB2iqYAWIYIKozz1lOAX
 VkCPARsdNNSjdQ1jwct5OhuHEEoVNePs5HnldZlfVUJj9Pt0NphuTKbgq5RBxilb
 Y0WlT8QWNy7lyt/YNwN8OUTbbPcoz6blZP7XTC6gCxo+gsaFGD+9hsEvo4n0xHb1
 ZuwuE0XwPooTKE693xoIoqLYo5UiupXM51fmEvkauMvQWSsPORTt7c00Nm2k1e6r
 a3Kwdg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52954s8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 10:43:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70d7c7e9709so23971576d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 03:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755773011; x=1756377811;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kiZdVlOBBo6Pgbbgd20Jib7efJ//o3XH891vVFgq7LE=;
 b=svzXOu1bGgL26KgP01nGXf0b84Mxfnqb7PZVRFlMcE/BzyQ/pBVnoTu7NSvR0Gb26V
 fj66WM81pEsewamsamDuXZ6LzwNaRBbttYJ/HvkqbzhYtP7yRU3hPFoU5VRYVGKMpGSO
 Ho7pktNN2U4xkNG8xwCIStnjWUa/HD+si18ngtFXYcAXoBcpo/UuGKbHj8pX9ewbUyOu
 OItQtrnDeWkS5tOJutSEgDbtTN5XQ/Y9ZbnZg7HyufLQVrdXScDEWejsf9cc0TW2IrqW
 gnmfigh3xpURABzQ2JHHAqXKFO62tDF1EEq6jXNkJl2Qhzx2WoXDlyYyj655sJyPcj3k
 GAjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPZauUVA5yIB6kRWVkh6HBhrY2oE1v3dPqv5ilYdsJRh+FCqk0ppl3yVFBXTWaDsBYE/ryPRN0U7c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcgD/0ainI04tiq6MwhVAdY6lTr9p/gBrIJjGox2adHMrIOyJd
 M+/Brg5iVyUqRpTEf8PKa5z41DSK9OFzqPP8IAbVM4wiBgn8BQtra49WVgzdk+5UfeuFlQwLHzl
 wGRxDt6707K0RAumx9Clza6csgIay3zu3vmyqvHkc/CGwK9r6OBupbiChJqF+oeot23FDtI4=
X-Gm-Gg: ASbGncvAP4PxGrSebgslmeSCMbvAWMDOIcVQR/eM4ZqP276NuKuPKBp3b9MRMxLJpta
 k5hMAZwICLNxz6yVannGgCDKiV5kdceyYC/1aS5HiQhijziqFk/4hCG4MvxnCDJuvtNWnW3u4k6
 DXq6zyFg31Ak0Tc1BOW3u4yOObB0P2/kna7bFgfRIWnIsaN7DEU8iEa3S4Olr/u00LepeH7alfR
 O1NmGg8P6WF0wiDwpvzVKSHudKSl8lryQd3g2pi5qdUjwnH8JTGS9bT1klSC9L0zHke5FBwjQeT
 2K+u7FtOwDichmj8GU4pVSrCIncxA+v3/9bQ2vl1GkiJBRxd2/b6btBKOda+v9ScS2z7hDcgPMX
 GCpVDjuj9B+0IQCsU0QoFRJwlj2tDNnABduloq5j2PYld2nit57iz
X-Received: by 2002:a05:6214:2482:b0:70d:84da:7bf6 with SMTP id
 6a1803df08f44-70d88fdee3amr16676336d6.35.1755773011132; 
 Thu, 21 Aug 2025 03:43:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEIb/BNkoBwI1UH7zDCawOAkuRUeT6HjaNqCMpBF16tkeSGer7aA/PKLuIo2jJRbIHcb+7KQ==
X-Received: by 2002:a05:6214:2482:b0:70d:84da:7bf6 with SMTP id
 6a1803df08f44-70d88fdee3amr16676146d6.35.1755773010672; 
 Thu, 21 Aug 2025 03:43:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3f3eb8sm2976726e87.122.2025.08.21.03.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 03:43:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>, Val Packett <val@packett.cool>
Cc: ankit.k.nautiyal@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20250706204446.8918-1-val@packett.cool>
References: <20250706204446.8918-1-val@packett.cool>
Subject: Re: [PATCH] drm/dp: drm_edp_backlight_set_level: do not always
 send 3-byte commands
Message-Id: <175577300839.1899572.13934617998352604161.b4-ty@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 13:43:28 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a6f854 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=A1DUZ2MENomNuKwj4w0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: tvxe2zTslG5dcRyHJLyaiPlRk4Cib8-2
X-Proofpoint-GUID: tvxe2zTslG5dcRyHJLyaiPlRk4Cib8-2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX5SU/1AS0f0VL
 gWnoBdMaIUsFeBsIGg2GCr8t/MOqmzyL5EmdPKcElPIWhHdU75K+SqSrziSQUv4UUH5OzpoLTdG
 9sSIiuHTEkyv1dfyXU7XiqO3p4w65vRDCSbWEzfk271jKiyjxn5sEMj4fU8zOz3AM+8X7e7cs2q
 FCi2VpXpx4ITcIwMY8nVqUFBb2EJjJ8PL+zQkJN4VPBhcRrcgm/mhHvgKaBG1gYq7BdpZG3Vsdq
 /xQ0zeON+wpwgyDlhgLeCAiKYV6ZrarKasLYjb+AyQ9gnWmmJ9DTSh15uWn4jxvm+KvPNXV2jbK
 uBvXlmnhbeuWYOfFdTgHsm61fLOFLKBNJesoIuM+4vzDDUIYJvHGg3EoEmwPkgVNOvcL8wbSC6H
 bZsYW4m/E/VDw8WSay6XQTxqx4kdMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Sun, 06 Jul 2025 17:42:24 -0300, Val Packett wrote:
> At least some panels using the LSB register are not happy with the
> unconditional increase of the command buffer to 3 bytes.
> 
> With the BOE NE14QDM in my Dell Latitude 7455, the recent patches for
> luminance based brightness have introduced a regression: the brightness
> range stopped being contiguous and became nonsensical (it probably was
> interpreting the last 2 bytes of the buffer and not the first 2).
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm/dp: drm_edp_backlight_set_level: do not always send 3-byte commands
      commit: 4aa8961b1b9c7498550b41168a91cf1558133dd3

Best regards,
-- 
With best wishes
Dmitry


