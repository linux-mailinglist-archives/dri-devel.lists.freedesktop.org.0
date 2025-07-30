Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133C3B16841
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 23:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBA810E6DD;
	Wed, 30 Jul 2025 21:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="exjKs0fn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C463110E6DD
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 21:22:30 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbBil001384
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 21:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sYBqhZDEPeIr5M58HlKZvA0dzkSwUa7YKvUm9mAj+So=; b=exjKs0fnqVaIjwp1
 nO+2maFssKm8yNfs4AmLbURXATlqXBPFpjBUFbVRqF7BTz5KgryfhJak+rUL5a8P
 kFFO77HZZEnFFG/U6tyP82B0Lw7dh3cPE1U6IvZQzu+yfpykMEpi12qvhI71BlIc
 ax33FcVizqf0DmWjelfT94XEb1pA6oqGx2QWIwNsNVxNMoAZvB9csfL5JkXklHS/
 +2OzBE6235dSjtNK7JqF0Fkx3VZAQZ9Ax4UrvfhN/XhEaF8xNJ3iNedfhI12JF9i
 Ya/OMITxbM6191GkMJ71s0/ZLuddBepjweHkkMWMKcSuUxGj7LgrqpvTCMC0l1AE
 iwxO9w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q865jau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 21:22:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70744318bdfso5198466d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 14:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753910549; x=1754515349;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sYBqhZDEPeIr5M58HlKZvA0dzkSwUa7YKvUm9mAj+So=;
 b=LVEi1ciu+B5srij0fNljY5W1jrPiDvWXmiuFd4XJFh6b1sjlMGY8Dam0zEsJIw9lPP
 DeRsayaI0O31txhH0slvPQVkuSghcR6AYc8EYRBKLIfNK1//YSvqSpOZEL20m7+U1WhA
 BDM/tNq5r9gMUXjGsuiSYWdnTMIAVpjQN05PBsDtOCSB9Mm0NApIqKzKdaH5vomLIt70
 C8z7rJaO4y/n3CAW1Huiy3MsmjPXV+EAS7cpOHGGRm05Dou4W2BMMR4Blxg/Y8dc3jTP
 EafrxLH472VCwcgeCRhI/Awld8Kc1n0VLNsQlRFW1tztfxsfEGJDk4BZvrBixEH8NZM8
 A4mw==
X-Gm-Message-State: AOJu0YwoU9LxxN0NjVPhyQkpJUf3uW8VizjYTaA+5o5GbAkqH50m7BhD
 F8pPHSbO7TIeUASSc0ZbGImoeHgxdOnH70FK27osRfIEZ3NnqVMDrxgQ3TnML/s9PakfWKhMSdE
 TQSU3DGl4BirYgPwDendHv5XYRK4DH4DDlXI2gelZ0uKtY52jPceVsMq1YFGwV7BTzURwLmk=
X-Gm-Gg: ASbGncuauNU6ZrLZK8PAX0pcvaIVtpYdZFM4PzLq95YrZ0EtB+IVTndbMwKF47/6VVv
 AmjpbMonrpKM6WkVw/pzgKWZGOHADSDo0TEl2VvHPHFVHl44uJfsSnRNyXRhbq937oKZyzpwsil
 3ZOzZTqIbYSpGtUTW4MyMNItwEThWmFuEUJcbd/REx+cvHdZ9UJ2mv6wZsdLzETMdj83bOdpqIw
 0gto9FirrOofKKtpdspm6BoDny8SpNQz3taVFD5J1dET1MWktmwn7fO3QEDID47q2cdJ3NWKGsh
 qWd6Q14FADOFAz3FTbcDMaTzMnPrjUIdn4cBHQdbnxHLA7/z9sGVLfwCqyOfoLoPCAF8TTPv86p
 33chdw76V8GgJRs+u5NT3J7nxVRFnxNWj5Iwgib6pCSkiyjwE3B7y
X-Received: by 2002:a05:6214:e4c:b0:707:885:758e with SMTP id
 6a1803df08f44-707671da01cmr58363276d6.24.1753910548969; 
 Wed, 30 Jul 2025 14:22:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5MV+8Iw3dWYCNnckYYEe/diduxsSrHtAVP0wYCv8aNY7TMFFQ0W7hSz7ssk9zenRhkQxqsg==
X-Received: by 2002:a05:6214:e4c:b0:707:885:758e with SMTP id
 6a1803df08f44-707671da01cmr58363066d6.24.1753910548547; 
 Wed, 30 Jul 2025 14:22:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b876097e2sm32369e87.66.2025.07.30.14.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 14:22:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Heidelberg <david@ixit.cz>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20250730055424.6718-1-clamor95@gmail.com>
References: <20250730055424.6718-1-clamor95@gmail.com>
Subject: Re: [PATCH v7 0/2 RESEND] drm: bridge: add ssd2825 RGB/DSI bridge
 support
Message-Id: <175391054743.2781548.8644345102818194567.b4-ty@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 00:22:27 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDE1NiBTYWx0ZWRfXwQF5PFQ5bVpX
 vJjvN/PvL5PFF7UsZzSDuniT5+andiMNUadOAr1vPiKYu64PF+ZbNT11k+aXYNCEYD5b0furfmD
 VYISgrBdPWiYLjDoob7eEhvCcrBElpHZfIfqWm/3j+fPbYl5JdUuN91ZRz15aq4AwQEJkb7Y1d+
 AwBDpfvRjXpTO4rgMDbrPORzAJbO3YnIlYDdcsjKAonWvc1jr2iaWU69n2JuItgYLChJ8ZqYVw3
 FmsKc3oUeIIC5nfmf/aJadz0kHQARY8pm1PKAEv9MqpL4u93bk/gpjFBLmpy0gyUzY8dSzuGWTZ
 zJ1pyXCElApZWVYL4CqRU6eM7nWutiZUjKDQngUiowKlH2P6zwpVhy4u/YVqTKZ9NpiyEucgcyJ
 O9BdednRVXoZGDieHXkEW/I4gjXY65NbWbCjN2gVTYw2aGp2CoPph+/0Gic4Y7PSVO2XaxRc
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=688a8d16 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=C_mFGjxryTuD8oKKfQ8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: UScSg_dtgMAql3fGxfyf1OFZkA6uehkp
X-Proofpoint-GUID: UScSg_dtgMAql3fGxfyf1OFZkA6uehkp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_06,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300156
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

On Wed, 30 Jul 2025 08:54:22 +0300, Svyatoslav Ryhel wrote:
> Solomon SSD2825 is a RGB to MIPI DSI bridge used in LG Optimus 4D P880
> and LG Optimus Vu P895
> 

Applied to drm-misc-next, thanks!

[1/2] dt-bindings: display: bridge: Document Solomon SSD2825
      commit: 784c99331c8d54a51d4f3e772c81f7fb82b7a1f8
[2/2] drm: bridge: Add support for Solomon SSD2825 RGB/DSI bridge
      commit: 55023abe6a2921a8916b623c24208e1971b88729

Best regards,
-- 
With best wishes
Dmitry


