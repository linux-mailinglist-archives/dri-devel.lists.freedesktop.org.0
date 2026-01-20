Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957BFD3C2A0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 09:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B22310E58A;
	Tue, 20 Jan 2026 08:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctFTgEVT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q9mWp/z9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2CB910E58B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 08:54:31 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60K29GPG3176243
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 08:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7HMUMu9Xs8gZp/gVxkfk6gRF/DSoXm83P32AuKCorAA=; b=ctFTgEVTTC74aiUF
 YLPJL4HFtyUouO7B2I3Xe0jJCETEFxsFarBO+oEIHTySaGTNKv5wKaQA9gsuzYV4
 XiyifZIcR2xwPSSvwNEff0CoP7BI55qwqYDOhZ62w4AGR0b8KvlamJ2XEeGeqOD8
 63AUHl/KTwvtx+K+Kh2Ax7yU3T6ant7mYkKWowIKz507sXIJhMYHwkpeWjQIusKh
 hiLkMAODMkYxB1MGRsyENwOiUVONSGvysP5cY2CsVzDC7hWnlRqGllQ/pSDf39Pp
 qVOZIz3Hiw3SKqn4byCH0g4t7KtfyeVhbTpC2Zxj1BJadCnjkX9081d/478E2NWU
 1ciZAw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt0p2h3cb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 08:54:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88051c72070so121007886d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 00:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768899270; x=1769504070;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7HMUMu9Xs8gZp/gVxkfk6gRF/DSoXm83P32AuKCorAA=;
 b=Q9mWp/z93b2kWYKqL/D8vTRNiAPmA0aO0yLKpYagzf/vFwS6wFnIsl4IRtL+hyGR8C
 8C7VwPzFP991JfN8inMTgjBZTpzuPPamYCjhavTJ0Vx5Idvyso4PE7G3CYwdLCcq2ZFm
 G+sVstzNS50ityVOks+5yiw8HEo+Kid9Tf14qzM68ZspQTAx810DwqlvEld1wx3TS+VN
 GRNYcfm9Zp1G2kzuOwT4hNcE2Z7ZpMH2CDv4Ti2q3NZDeP9ULYjcLgOwzYluoOAgp97D
 6TxpMiGwBWZeZQBatHvf3t4IHyb7czBb2bjDA7BltT1Biq+pX3eqiDZdnRfeF0Eqiab6
 XsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768899270; x=1769504070;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7HMUMu9Xs8gZp/gVxkfk6gRF/DSoXm83P32AuKCorAA=;
 b=SuuY75ZR0bOf5HBulaLL0L1zhugQVDl1v+A5is+x0drwEX6939hWRfY7ch0pPy9IGV
 hf8nKkktL8C8D0QiLin7d34NxR0gR14c2SZRy6HTLFzoJGdUOs2ADHbvbqIJyd3R93eo
 uPFZVPBWqNptjVoosl3kYMCGloSforPRtGVnr363SzG7FeYmAPdWY1hxgUsoFL4+Wiu1
 YRi4IZ2ZwqkqrsKgSBydaiPX4tjl/KCse/8pjhgoH3Hn7VqMjW/m6hzKxdBji15By2Ed
 vxckpj0z/eDGBo3bO9PynoFCvbw5c9LyeDDvwGyFrwhnVn/J1Zb/OYJcZFuOGxKXmExF
 qKvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDq6nedd7yHfsCyonosVuQU5ihlH7TKDuHVsXzPapVcJuKDiQom1gAc1pcKyWKiqMN4Bz22RC/Wu0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVQu2OCOVd3Ka/35J4SAa4yndJRlZXaFVa69aevbj+Oc6ZJ5Uo
 sRO3b/dnoLa2gB+J8H2ExbVb1OSEDaiFMGgX0XFDseuRusWjcjkGkpBeRqu+i5k9vLslZDklCmw
 8xEnJsMNjf9SwIgHxymjlA9sfLPS9hghgQwso+4fTOJGZ9E9seT26ayf9ffZdrRPMVU58Mqo=
X-Gm-Gg: AZuq6aJCgF80LAlToPLk5BOY9/DcaVwqgfb7KzWgh5TNtNNJzQTpUiNaxZif5IruiP7
 fjaZdIUdVojJeaCfgYzAIqyBbffJc4pTUkQl+OKP8jRYv/JkUdJV3qj07+wk0Ff9Q6We9fTZIIo
 ewnx8is5HipvftkZP/jth/FgzuszfcjiWS4pxf0XSm62w4G5NRija8tX+ADMh21sd3WT53bHrId
 ty7JQNbPHJK3UIf3iGFJVsc6vmvOhW1Fg4upMq4eCZU0ImyQwmAQ0AJbbS+5a735WSfPMtYTA3i
 Ht7hb/AIVfwxoNtCvO8K45nltH4E+azOPh7Ac8GwSptauWjdpiyfdmkULreOCpK9t900MEhhuqO
 hq5ZGTRl7q7dFw0d1tdVOQwBNgC2W+viHEjpMu1VKpSMGg+0UMwDrwZhEnnXslz0znxyB4nGqE+
 mAaq8JYraIjqCIeyMU15JKvtQ=
X-Received: by 2002:a05:6214:234d:b0:894:2cf7:7171 with SMTP id
 6a1803df08f44-8942dd14069mr196846376d6.28.1768899270127; 
 Tue, 20 Jan 2026 00:54:30 -0800 (PST)
X-Received: by 2002:a05:6214:234d:b0:894:2cf7:7171 with SMTP id
 6a1803df08f44-8942dd14069mr196846146d6.28.1768899269610; 
 Tue, 20 Jan 2026 00:54:29 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf34d4d8sm3941615e87.22.2026.01.20.00.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 00:54:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, kong.kongxinwei@hisilicon.com,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Yongbang Shi <shiyongbang@huawei.com>
Cc: liangjian010@huawei.com, chenjianmin@huawei.com, fengsheng5@huawei.com,
 libaihan@huawei.com, shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251210023759.3944834-1-shiyongbang@huawei.com>
References: <20251210023759.3944834-1-shiyongbang@huawei.com>
Subject: Re: [PATCH v10 drm-dp 0/4] Fix hibmc driver bugs
Message-Id: <176889926865.3489253.2560415097311507260.b4-ty@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 10:54:28 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: hzNR8sbFAcUWEZP_sZOx7ML0E5Bwhp5Y
X-Authority-Analysis: v=2.4 cv=drTWylg4 c=1 sm=1 tr=0 ts=696f42c7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=i0EeH86SAAAA:8 a=ORmnEIKVar_N-dGhR2UA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: hzNR8sbFAcUWEZP_sZOx7ML0E5Bwhp5Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA3MyBTYWx0ZWRfXw6FQNiYuFlyc
 J/bs92/XghnYR1O1QI1lDypyc44SSlEoitNJSGtJk5EirjwlcHdYnOKSydfEi8xAI+TxqqtO01O
 yrWyKhIrh/7FLhGi/4BaYoL99izzj4QdNVXBE4Qk5Z04npxVCvPvHXQiuosZcKJGwq5mvcdVHms
 NIXDt/oy7tQ23YLS5WkBr4daXoqsTMRLQhKqfOH+rgd9aKbVXnfb7uk/UkbVm5yh4r70YCB4TNm
 4rMDGE4b5bLhHKPO2i4nxGp91v2MCK094rWoLjVxI8PfM9mhI4txCBq2/j1TDQFe4o0aqWKQ8xp
 zSnTTiz2rE9zDMKoW5fgXYGkDWBd+86mV10kGZxIdQ0RebwkVabFilYQwaVD8R4j97CZdKAun93
 6rhSP03PcOgMRDdaFvOmvlDlkldX3NpJzr+ZzqNkRKHIIupgqOybJJ13JemIGisSbvMj7+k3i19
 kanWD0lpAVLrXHaeMAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200073
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

On Wed, 10 Dec 2025 10:37:55 +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> There are some bugfix for hibmc-drm driver.
> 

Applied to drm-misc-next, thanks!

[1/4] drm/hisilicon/hibmc: fix dp probabilistical detect errors after HPD irq
      commit: 3906e7a3b26d683868704fe262db443207f392fe
[2/4] drm/hisilicon/hibmc: add dp mode valid check
      commit: 607805abfb747b98f43aa57d6d9ba4caed4d106f
[3/4] drm/hisilicon/hibmc: fix no showing problem with loading hibmc manually
      commit: 0607052a6aee1e3d218a99fae70ba9f14b3b47ed
[4/4] drm/hisilicon/hibmc: Adding reset colorbar cfg in dp init.
      commit: 6dad7fa8581e96321ec8a6a4f8160762466f539a

Best regards,
-- 
With best wishes
Dmitry


