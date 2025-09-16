Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E098AB59F24
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 19:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5145810E0E1;
	Tue, 16 Sep 2025 17:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ex4ZCxD3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954BF10E0E1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 17:21:00 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GGLpbK000875
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 17:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eYDAH/UC6QbLLCFUlW+XxkzrsSdsC66+V/mf+G5BEVw=; b=Ex4ZCxD30wWB7GzL
 FQ/vVgusQwIiEjdQ+JfMBg5zaAu3tkm5FC9lMFqq1DVgRfqKILJna3DjEgUOAufT
 i6ONB75PyNV4KwWj8vEZ0J4ehD1MaP+Z/BrPiwz+TTuZofCBKmKNbc51dSNkSgiq
 Cmx30VJz8i9ODAxr0Y1iuPJh/9Bf5HpnTLafVMb81cyHuhQQ+El8W8TbERx0k4cc
 4YAPJww7vJWYbeR7LM+Sbabkx4v8n27eCeogVzBcK9k/2ToBimUb4saSFoE5Xw6X
 fs2YstGMX6O/0/9JkG3tP7Hyg5Hr1BHiVAadVYyuK373MHaqsNiB5yfOg0lHFoqI
 5fdiug==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497bb5r7mu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 17:20:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-7248ed9f932so70065246d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758043259; x=1758648059;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eYDAH/UC6QbLLCFUlW+XxkzrsSdsC66+V/mf+G5BEVw=;
 b=RVs6r/ysdY2zXJN/pyWkl1dj2YBWE0Qnk3Y/DZFMRyEGwaeviaHED6g8tFr7s+XWYg
 KNuprpeae8rS/kdtWnN5x4uILhT0tpT54ocLaTXJgBkVcdcSGZAEra+ALyCprIXFye6C
 8nb3nxdbfIlAyGRpnFkHyTU96PHzzcx+CHnVmBDzJH40tyGwAEtY1kwyufEvV83esYyE
 O/ezZDtOPCDWylcaYpY4+1ca5aMEV1tLCHa9kK8UjwS6k1XNLtsMP3wsA4XdvLV1/1JP
 uPENbjPnC5UOKppSTmXqIGP4CLLin3Jle4Lls/f2TZYfZPll2BF4B3jvw7RdisKr4t+J
 fIxQ==
X-Gm-Message-State: AOJu0YxpguzJB30iQMJMAM4vmoZU7L9AhRQEMxTYjfJFXMdIuPnPSgn7
 DqwWWJycpozjgzQ7fIN01XsNPqQHW8PWlOAdU8ewqbDryuQiHdiDKe5iUIsj8qlDLtGJfuEB3gs
 eFn3ELOuUNdEs+dKtjj7TfMsSKhYX3aq+k6SY4HPpNmZ85khopMDBSl9zvUkBgstiBFK67hQ=
X-Gm-Gg: ASbGnct3FZc6ko1lZpPdyJLB6wlEtkw2nsjPudRen2hrkPDA4fyOZme72D7w1/g4g3p
 7JEwrwCpwMQJCDfZSazEFU1H2im8cfU+4eMqvC2UB7IasRcwqNnXqSd6l6JxPze7mGS0JUCzTi4
 +9nmYI2oySw01pZYuW8h9HRduSh0xqgcj04hbaU4ipwV8ZsEdwGEw/ZJ+RlAHGzE0+35ctOFBSs
 NtmJcOqk4PYkaYkGWSDiWFtZ50hhFwGoQcs6V7pJQkkWCjc1O+Rsb09JJK+klQFrHpTImd9yoT2
 4qAmHM0TzHOnJCu4MGu6mNzBU/OjOV24pUyCaPF662u4WFLpfVc5cfNC0u/lRx0x0u5ndbFXNaH
 WNAwKZbMS+fGy3EkVcNYM9d21axq/zOfQmZUabnJqoSWAoeg3otA8
X-Received: by 2002:a05:6214:2621:b0:78d:b474:8e3d with SMTP id
 6a1803df08f44-78db47490aamr29805476d6.16.1758043258741; 
 Tue, 16 Sep 2025 10:20:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwsDWIhpv5sfJLJ/QUxmfP6fT3Tp5F5w97C0xbz2hC7rFv+42ijmLAhsNS7nYcVWrSQnONyw==
X-Received: by 2002:a05:6214:2621:b0:78d:b474:8e3d with SMTP id
 6a1803df08f44-78db47490aamr29804886d6.16.1758043258120; 
 Tue, 16 Sep 2025 10:20:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5c3b5fbdsm4458001e87.30.2025.09.16.10.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 10:20:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250821-drm-client-tests-v1-1-49e7212c744a@oss.qualcomm.com>
References: <20250821-drm-client-tests-v1-1-49e7212c744a@oss.qualcomm.com>
Subject: Re: [PATCH] drm/tests: make sure drm_client_modeset tests are enabled
Message-Id: <175804325706.600017.10635464864043567835.b4-ty@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 20:20:57 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: HVPZvIAw5lC0qeK31OCw1m6orc1BIFmS
X-Proofpoint-ORIG-GUID: HVPZvIAw5lC0qeK31OCw1m6orc1BIFmS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDE1MiBTYWx0ZWRfX0OJXHfx6cfgY
 A6AAD6JSDlwRKQLC9/aM7WitaforR72XfsDvdVKL/NGdnmKve8YacaUGZPy6te6be5mMa4aXLVZ
 ykqDF4gB/7itVOjjAro5yYxYBWaj/iib/C977uc5JTKHfOyN1kgC7pnMzhB8zCRUAaYL+37qEvO
 ycMUwo6WMip8608QbKSFTpZz4juQObiygcgRbS93EiNFgFjRs3kWd/RI6H13RSjm8D/QtcCraEp
 wgYXD9NSmX3sI0KU++ehjLAGO39hdfOBqHl/xYDM0ighRB/lhsSxX9IS6KnXayDZjRX9hR7pn4W
 qD2BoM4T3Z1VLZHhZ+8Q4FEt3+hcRKgbums4mbK94zktPxEHmY5KZaAzGOrowNUO8Ru/6vtrM+z
 ytGvHEis
X-Authority-Analysis: v=2.4 cv=ZfMdNtVA c=1 sm=1 tr=0 ts=68c99c7b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=sYf7BZEc2M3GbN3TUwQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160152
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

On Thu, 21 Aug 2025 14:25:06 +0300, Dmitry Baryshkov wrote:
> Default config for UML (x86_64) doesn't include any driver which
> supports DRM_CLIENT_SELECTION, which makes drm_client_modeset disabled
> (and correspondingly tests for that module are not executed too).
> 
> Enable DRM_VKMS and DRM_FBDEV_EMULATION in order to be able to run DRM
> client modesetting tests.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm/tests: make sure drm_client_modeset tests are enabled
      commit: 4db6e24f565b60a05c762554c05d37f780fe4406

Best regards,
-- 
With best wishes
Dmitry


