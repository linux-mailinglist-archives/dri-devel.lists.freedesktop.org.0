Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B368AC6B5E
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 16:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE3110E62F;
	Wed, 28 May 2025 14:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jje2RgIY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EF110E626
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 14:08:52 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S6imJw022291
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 14:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fSFpanlCd3QG3PGIaRTOjidLhr0r0dGvANBn6D3rDi8=; b=jje2RgIY1ZeyWFUa
 feaj7Cca3/ucoKI9zamf1wnCy4L3sVgCYy18VV+z9DCo7Rmfenofk9ChKw5W237r
 B7XCI+I7fFDtQrfxRpvvtxR4tocjl0ZoWqMLBBLU7gLSNR4CROTOyJPfizsUTlB7
 /5pQzVh5zspcCju1K8yS7ypHTQUgdby0p0B+zcWyplnjqEHhto8f1LDaNbPwsMWR
 1fAcU5gxefhJJVnHuAZlNMbftFGBq3vzIn712DltgAwbhxEF1p31hRS99um1vjw9
 vZe0eClZh9dvTMCDOdaPHTR1CFBVRdrdvQIniEhVFokuouwLEH0FJfQpLrpiDQ46
 V5z6bg==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g92e3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 14:08:35 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3dd7e0c7195so25137995ab.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 07:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748441314; x=1749046114;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fSFpanlCd3QG3PGIaRTOjidLhr0r0dGvANBn6D3rDi8=;
 b=O8vN6x55lKJMYZRHtkZmxQJ3ggVh74vVL1Ii+pfvk9gYSwZ8rsKzu9C3yL2w18aUPA
 GoZteZZCbcKgwnu3tYGn0vgESLvurVlQ2N2r94LhJpJ9YzbnEyXCsVYzz+gLavvwHD3M
 Tx+I4XUbQk2XDMUz/DmWujKRtQku10falyiGej1hWGHL3bvh+HYEpDvQhr87h86+CvIb
 mXV/TK1KwGZtNjMy55/XNnujoYGnkQGWfj/nQ8Wl8N3Edd1ov0IHf800ICmzZYW9zFlX
 EfvoGPCCeSlMA/8W72pPlPdtJymNpnoATg2e6hRprJkv3lP5E3zcPHYjte0MYBmtSqK9
 wtcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZOoEOxecAwXeUMflYBYwWIDsdvSB7VDXTgYjSXNEzXJDbeOza2KTW28eaXS+2jfII7jhm6u+E0tU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXdXBpZVq/s8fzYvOTes3IjDS7GlQiAQBb753pP07lOKuUexrd
 LL1KbVRh4V9aNgZOSn6P1XAVXFnqSimGDDtdDKdBbFEF+J4eT+RahhLUuSYRviDXlxtT3NY+qBc
 9Pbha61JfpOQ3fNv5Xj2k4RC1hoZKLxwDJVGYMVBYL9SWvkJ5C1hwOXzVpdO6Bsswr9z3hVU=
X-Gm-Gg: ASbGncvgPFvhOU5gu+OICWI4dfAZyc4UjFDsneoj/8mJGVflpHPMChTWlfalrRTzSfW
 UlWvnEYaZHaY6F7D8/OBp/5Mpq9bC+1Qfm/dkHnZsg7wyBBdtx9O9CFsrYSkCZUaErLn3+H+J3V
 zDvOcglh7cWjg3+jjD+PmDOPGJuMj6edvWXR53Dj6i2pjtGIq5SRWf0VAshgAekD5DYkypJoHjD
 3BM4TZi3OKoHnAO42SUEDh8raNx135A68EaYLED0ogVUXixvHYAD/j9Z8tSyvv9npoRns/2rW6M
 9JcNBK0OncCUm8tFAVDiXTUOTwLrOH06ioSfcH5FzWY/N1Or8u6Rp/qKuvzOF1ZXJiTZqaFvKI7
 aFEpBn1qkwJYTWpEJwKv70EKU
X-Received: by 2002:a05:6e02:17c6:b0:3dc:8b57:b770 with SMTP id
 e9e14a558f8ab-3dc9b697450mr155527805ab.11.1748441314273; 
 Wed, 28 May 2025 07:08:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3/IrURGfZHuF1uVWj+6vn3B5a1R5Lj0MNa3HPhG6oLZTFAIcn0Koqx6e0QULRt+G7HCLk4g==
X-Received: by 2002:a05:6e02:17c6:b0:3dc:8b57:b770 with SMTP id
 e9e14a558f8ab-3dc9b697450mr155527385ab.11.1748441313824; 
 Wed, 28 May 2025 07:08:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32a79ee1ab5sm2604621fa.62.2025.05.28.07.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 07:08:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Heiko Stuebner <heiko@sntech.de>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250527225120.3361663-1-heiko@sntech.de>
References: <20250527225120.3361663-1-heiko@sntech.de>
Subject: Re: [PATCH] drm/bridge: analogix_dp: Fix clk-disable removal
Message-Id: <174844131284.307638.13863376143596559629.b4-ty@oss.qualcomm.com>
Date: Wed, 28 May 2025 17:08:32 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=683718f3 cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=XtzDPwPC1q_kEnb0TJMA:9 a=QEXdDO2ut3YA:10
 a=8vIIu0IPYQVSORyX1RVL:22
X-Proofpoint-ORIG-GUID: R8_lOgRIHL06Nw5omFAJ_bQY4uRli_Cy
X-Proofpoint-GUID: R8_lOgRIHL06Nw5omFAJ_bQY4uRli_Cy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEyNCBTYWx0ZWRfX60cvW45d3NMB
 JxJg9lL6SgiX35RGgAnTTIiSn3IhgMaUrOrho1f6xgq38sh0QMNARCgdqbupZDOGwBm5WHCvku3
 PEjujfN7o8nSsP0f4xKkvrUSaiZoWvHYWLUOlCn1Z9DvVJ0ADtG5zALvAIwM/G5yTzw+XEVDDss
 gvbgwePVqaOQljyypakxjKOIwGBt0P74HqhmgIcgKTry3wR6uhTm6qkUY2nbCNnBYxdAEU2NYeS
 yF4J7GBb3f1xV8034nsQiLaQdvWYw/oFzlFTSSOvhvqgrH3BIiFvD3JJ+qFZCodyTZNJA3zxolQ
 KahBrk/u130bJztdBlkyGx0UN6f8ovo+HBqCMVlG0bO6gQSSpK74/S3mUY03stXYKZR4sPD1j8B
 IoN3o34bhHd1y9aN3JCVzJ+NQs1vzGsNN3KbZf2pZY+kktOLwa7AYt3w0UJ/lMZWwFci8OAH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=863
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280124
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

On Wed, 28 May 2025 00:51:19 +0200, Heiko Stuebner wrote:
> Commit 6579a03e68ff ("drm/bridge: analogix_dp: Remove the unnecessary
> calls to clk_disable_unprepare() during probing") removed the mismatched
> clock_disable calls from analogix_dp_probe.
> 
> But that patch was created and sent before
> commit e5e9fa9f7aad ("drm/bridge: analogix_dp: Add support to get panel
> from the DP AUX bus") was merged, so couldn't know about this change.
> 
> [...]

Applied to drm-misc-next-fixes, thanks!

[1/1] drm/bridge: analogix_dp: Fix clk-disable removal
      commit: fd03f82a026cc03cb8051a8c6487c99f96c9029f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

