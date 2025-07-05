Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1227AFA145
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 21:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D15110E236;
	Sat,  5 Jul 2025 19:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGTqI4I6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9052410E236
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 19:06:42 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565FbLfP015355
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 19:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cvLOsbSuo6uvQ6cL1qSzqtB/pEVF/AJJTfRB1OmWrtI=; b=eGTqI4I6KeNNkR5p
 JPh3nAqWifmon5wVKoy9wQBrSMh/azaLlVVyp/ka/i4qjYeLVUIBX9d3AVIL2TbG
 iVvTDh5XG3dAzWhaav0oRhqy2/QIm32rkJ3dHIxH+DEAFYKWtHryYN8NZouKB71p
 rxfo+YwY4btKx0mhJRuBXpTSjv87dkrMyFl8kE9IBWx0mXefWzcr3voeIvzclPI0
 cSBhW6ItbTLTEkkfSgtaewl+cDQjr1SseW4M83aZm2waprl0YdppeRkSL8IScLk/
 FqhbIz804ML+8ByklArF2iYxwW9wB3/dMzeXDy2ULL8R6fyOjjeXEmr5j9rfK0Zf
 Ui+W/A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pveesscx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 19:06:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d44ff55c98so369260785a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 12:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751742401; x=1752347201;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cvLOsbSuo6uvQ6cL1qSzqtB/pEVF/AJJTfRB1OmWrtI=;
 b=dZ3l5pjNfqrpEcLUwwXIOZ6SGVU3VDVXsCDceXHgNY0pL57gd36kqTpSWbE7ZnKzOW
 xqPUtmikVnyP/51aGWk7xmy8co5gKZQn2UhwkNdFirseHslhZ2XFVJwqHwd0FzZ0m0pe
 Ss8z2ROam50cmToaNX/LIH5E6GtMy6pEQMBWwfEDWns3TgvqGQoljlAuqGP80xN9r2Vs
 ti2iR54EUB14zG4MjbZL5pMZIE3vOtflpQQt1oYoYgwTnuOMoLIO4AAmOHyIxAPBFGXT
 ADxzc1dgRaKeEB3DamzVc5oNZkFa9t27BBCSGYpFQSnMBcp1nmsYriAMWA6vqjmO1GV8
 eSGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/4mUS8tSXG9m5hM6lNLaSZDfGEVT6MUoGg9kQuyy3tMynQzjhe+8+4k0Vg5CWmz66F4uvX57HPJ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVueHH8pUFha6ln0eJUSB5Qsbksc3EQv8SjMy0j6pRHFtuEYUm
 ihMEOLBrccVFTMyOz4PJpb8RMcj1krkUCw9WUiFFLEf+9mvLhLIaQGtCdV0BIvfcJvmGwz7EM0U
 2Ogo4w5jSJdxh8+b4imYMJK4qF/WWpbZqyhVVpQV5Q075c8mxg97RF24ozfTHWJr9BHZElms=
X-Gm-Gg: ASbGncuBT8/knrhglQN+B8uu5tiSgU8+4cxjxwfElJzk9T6nHyJrsJcFXZ2K3BVtTE7
 YIzEGFlBBycGqgck84jAdvh9r5/3VbTKADdOGBG8KCff9/EBT4h43i4Z7SPrZcgd8dn+CaVNszJ
 hJ0wOCARemqw9GfIhU1LuXTKxAu/b25GsLbAaB8/xobJEjAuUmqgQNEUWvMS3XfUevmfRRCFXSA
 T/y/8AZE+k+Vk0CUX+YebuezZVn+v5Mj7QUR56o+aTB6W61AsozjNWX5WiOkH3yOF9Sm3PRX0zH
 /LqokQxY4eAPir6UXuVempq47aZ0ZKXBL9Cceb3hNV37h+kxxrsl0cf4zOfuB95eORhkuz+9Mqu
 65JHp373HTEx3OmvAUq9Rn52Hg4+ZRN7J2eY=
X-Received: by 2002:a05:620a:2a08:b0:7d5:c7dd:9582 with SMTP id
 af79cd13be357-7d5df13c47emr1024932985a.36.1751742400916; 
 Sat, 05 Jul 2025 12:06:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4p9Xquc9XnyhZpWG0dFh+/1C6iIFppdl5Nd3QUa6Y2/gtQoYWBQp/CmhE8Zy+5ZPjaZx8hA==
X-Received: by 2002:a05:620a:2a08:b0:7d5:c7dd:9582 with SMTP id
 af79cd13be357-7d5df13c47emr1024926085a.36.1751742400280; 
 Sat, 05 Jul 2025 12:06:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556384a8fdbsm662261e87.169.2025.07.05.12.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 12:06:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20250704-drm-bridge-kdoc-fix-v1-1-b08c67212851@collabora.com>
References: <20250704-drm-bridge-kdoc-fix-v1-1-b08c67212851@collabora.com>
Subject: Re: [PATCH] drm/bridge: Fix kdoc comment for
 DRM_BRIDGE_OP_HDMI_CEC_ADAPTER
Message-Id: <175174239915.1825705.12007643724816710087.b4-ty@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 22:06:39 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEyNiBTYWx0ZWRfX0hN5qOMoPY1O
 JXe34/mCOEmbEUL7Bjx1nz/dhUffX3VHwjPMtBGnvcnrjO99v2dKmYJiMhi2hiZw57HqtKgUOyz
 oTathzMfkUUKVGuhuoLl8PnlYh7OUR0THur7DEZQNNc4yL/vE+39ZwNPRwEkDTtKzmkkG5t25Rp
 CNI9lQhzUCaV502eNVrzztuDy4PNbnW7kLsIftuQNrgC1MvAXcVJiooTshfIo0wdbs5swxZeC8V
 YNXZ/Dl+QiCDtDE2fvBdfctItDBonXxYGheXeMwlsrR4wKhxrRRb10Xp4Ll1gxcHPEl9Y288nPl
 7tb8NEaCQ/I1pxBcuHbLivK5lGgvojTMXfdTPUGAMNIjAt0jdk21Hfl7cVkDMYwQS+LTpb2n8ok
 iKwzxxw1BbEogTQo9KQPwJkf0ksEPT7YVOVu9UH617N49iaYmipFcJ3ZNbLd3gyF/PZ7NCqB
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686977c1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=wdqdDu6gfy1NOTDC_OcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 4iuj2rkqNI-AoKv6AkjmI-CJQ0nP7KfN
X-Proofpoint-ORIG-GUID: 4iuj2rkqNI-AoKv6AkjmI-CJQ0nP7KfN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050126
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

On Fri, 04 Jul 2025 15:10:45 +0300, Cristian Ciocaltea wrote:
> Correct the kernel-doc comment for DRM_BRIDGE_OP_HDMI_CEC_ADAPTER member
> of enum drm_bridge_ops.  This seems to be just a copy-paste artifact
> from DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER above.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/bridge: Fix kdoc comment for DRM_BRIDGE_OP_HDMI_CEC_ADAPTER
      commit: b78287c54bd87924ee328d51336b44a74304d7cc

Best regards,
-- 
With best wishes
Dmitry


