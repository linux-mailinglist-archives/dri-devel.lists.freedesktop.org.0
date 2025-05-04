Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D766DAA87B2
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 18:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3024A10E0DB;
	Sun,  4 May 2025 16:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0bQyENw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CE810E0C2
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 16:13:39 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544EDxbi001085
 for <dri-devel@lists.freedesktop.org>; Sun, 4 May 2025 16:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vfA7GtnSYSKUo7p5wgEOmrBapgaTIQDubiWjfuODSw0=; b=G0bQyENwGIhr0PVK
 ug3iJeV0Ooe8RkgrDJY8XiTfO+EmvDmYKm/xaClavI87LG9by3tiU7sE5gBwL4bQ
 u2YAfNjznGHiXMfTre2Onw3P/J2YHg2uL2TvS75dKYAiFms4lVZKorf6NixiUqLY
 4D3Amd7+FV7adT58Rb5w0J86GN8RJgg/FP6/1f3j38Q6C/aqZQeXT5wQpN0ufY9b
 hjUJpxzgzVwRSegiBytj72kJ+87BKLaqZ6RxNuT9s/YdVhd8GLeh5Vvi+oM45HEM
 c0R7IzAQ6sbEUgjBzfupiXKa89b0U1hDRuWJZtEoMe/FZxQLQSOqmn0Y9NmX79B6
 /v/imQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep29rx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 16:13:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5e2a31f75so372294185a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 09:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746375217; x=1746980017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vfA7GtnSYSKUo7p5wgEOmrBapgaTIQDubiWjfuODSw0=;
 b=evsFv39WuzLRgCkwjIZTretyZxwlP+xpC0n1BlMrxG/Zvujyd2d/pxbIV8+MR8SleD
 40QOXVnphpSLQayN7WsrDxjTUxBRmjXLaRhrKC4xzQX7/dNVQ0VGEHAqHPo0WSv+iGM3
 mJ8et15lCm6eQi94Fh2qIV31Cwdj5VqcZtDUpq5k6ivW00k2Uff6n51Re3VRVxA3GuKt
 OH3K8ZLDS8iS5hRrY7+SKK1isltRnFWDaj3WkInGwx5ONBLddspwb2NZl6KbcuQOk+qh
 e9Y2bgbCwkkAsDpeW+JxdhF1JFKgMVKol1bgpfF/5jHNidBv++UA6g86a2Rt4r528XKZ
 aLPw==
X-Gm-Message-State: AOJu0YykbrZySSUgDcZw1xMrEkErSxNHHPUkCXGK99INqeTxzELO0QBz
 R5UZjLFgEtcB2fF7cXdXlo/UjF6UVr7exTzWONYVoWHop0z0S8fu/RDud+Rbohp9kpeXQcFrMQe
 NRaA0UNax2xDHggX/wpocZJRNNzq26zre9pgAuzKNcFJmDAGG5FarajJ6KlAoRKYiUdI=
X-Gm-Gg: ASbGncsuuRvwMZJA9ELWrvNFlp0Sds3LmNgf9c59NRgpBaKJ4WqDze8PlM1RpDXajOQ
 95uzBbC/s9rJdgGsADBa1gyQsS8IznQgfCnhrCh1jaW+dycgldNQyXEOeT0csc3/jpqJ6a/hAoV
 YZfyAlqfhnoShIDHwOF+z6NFTJVZItlJqkDnqKr6EE+4Ob0C8bXgcxE/emQUe6r7RSNhQ1UxXQz
 ps81g8wHtOYZLLfiKn8Vj0vx0bpciITNoW1dyVy9aB9VxKK9C35MmuMW/y8+yWptu8lyKONfRLe
 NY+AbHq8GHG+PkKi90a6jc9iNICQ3ncT3t/Iw/lciN5QsrZZ0mryJfQ0fcQjHt7OUgshNedhgQ+
 Wryd7BpN3DrWoouHekI67W/ly
X-Received: by 2002:a05:620a:414e:b0:7c7:a524:9fe9 with SMTP id
 af79cd13be357-7cae3aa3a7cmr721243585a.27.1746375217723; 
 Sun, 04 May 2025 09:13:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeiOTVT2ymuT82iRFejLq29xysyG8uAckrB2qV1iZnT3Z31gVfU5M2H+L7Io6knC2h1rUhaA==
X-Received: by 2002:a05:620a:414e:b0:7c7:a524:9fe9 with SMTP id
 af79cd13be357-7cae3aa3a7cmr721238785a.27.1746375217366; 
 Sun, 04 May 2025 09:13:37 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:13:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 0/3] drm/display: hdmi: provide common code to get
 Audio Clock Recovery params
Date: Sun,  4 May 2025 19:13:21 +0300
Message-Id: <174637445761.1385605.12669862804792916978.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
References: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=68179232 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=OVqkDxUf0f5yx8408MQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: NBD3Uji00C4LOaKb2uQgd2bNmOU8LJZd
X-Proofpoint-GUID: NBD3Uji00C4LOaKb2uQgd2bNmOU8LJZd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX5yrElNK7qWZJ
 oSLh+4gzabl3WSwofjANal1f0gZ35jomM0gEsUYMKWRg9EMsA9/Vxy9LiAZZJ49CtXEMoqTN5sn
 2EFM6AL7h2VjtHTj8brYRWnLyvnmFKuGjpq18DnS8wUSCTBsDbxbj6mE4ZkTygnKO/a99ZJHSZp
 wJ99v005nvSUb7t/O7XWPuKbDB6S3WCQZ9lwZFIMCP5ukUY9AoSqSQJgBnVzM/Vbh/Ve68oPXx+
 SPI0xhIL2az2i7qyyTsI4ZZNLtyayi8JvBVdzxK9Vj7YOt7p/pIRSQ80v9pKSDY0tZF3hz3e+xW
 h3sY9DcU+PJIYB3oSgs/Y8UVH9Eql+BJ6T+fuvJRprkUqApfwhMlbF70KRvjgoWOENhOURDXBN5
 eVKP4/aeLxO5hX5T7K8sobugMYmtyqLZzra4i+Kf1j6P6Eo1O46PJoczYzC0b3LE+5qcgm2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=978 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040152
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


On Tue, 08 Apr 2025 16:54:24 +0300, Dmitry Baryshkov wrote:
> HDMI standards define a recommended set of values to be used for Audio
> Clock Regeneration. Nevertheless, each HDMI driver dealing with audio
> implements its own way to determine those values. Implement a common
> helper and use it for MSM HDMI (tested), VC4 and DW-HDMI (compile-tested
> only) drivers.
> 
> Note, this helper simply implements the database for these values (HDMI
> Section 7.2). The question of selecting supported formats and rates
> should be handled by sound/soc/codecs/hdmi-codec.c (pretty much like it
> is handled by sound/pci/hda/patch_hdmi.c).
> 
> [...]

Applied, thanks!

[2/3] drm/msm/hdmi: move msm_hdmi_audio_update() out of msm_hdmi_set_timings()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1735917ac44a
[3/3] drm/msm/hdmi: use new helper for ACR tables
      https://gitlab.freedesktop.org/lumag/msm/-/commit/88321e3529f1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
