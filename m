Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8140B1B248
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 12:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C735310E266;
	Tue,  5 Aug 2025 10:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N73F0IH7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBC510E266
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 10:51:32 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575AV80I011183
 for <dri-devel@lists.freedesktop.org>; Tue, 5 Aug 2025 10:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7+1XHQJSTgHTnFQCSkGI1i+CMvEJfW/p/UsKbi6qO8c=; b=N73F0IH7QlOB5EGS
 eaUeZaY6WkFObaV8RxVFydPfxG3QBDFuGMOpzLHuZZB/aPg13DA4H+3Sn7nZnp9h
 nH+JQRSqQGLF2CAnrAE+dS3lsbBquguLImZ+DOU52bGo1zOGg74eDhQA1gEnTkIO
 v3ncigJYO3Z4jBEb1Yi6hrooo0/J6GJyOsN0zgbMQD7YUU72V7dd097gDBp05u3d
 e28Yd1zKkVrj4I06vIO2FJt7oFwfxmRiJvxY/UV6lNEGpN0WvDykJ++yRiuMW1Kx
 o6pOjj+ZZt3JZfy9RrRiuZSEGjKKrfyoNd3Uao/gFmkyx8LNoCOnu4/UL5wr1FqV
 yQ4DkA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48avvub6ms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 10:51:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e69dbe33faso513594685a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 03:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754391091; x=1754995891;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7+1XHQJSTgHTnFQCSkGI1i+CMvEJfW/p/UsKbi6qO8c=;
 b=hXcJ7h8kZ49YZeeq6246f190Mm+YwszZtIxxJ0nj5bZtrKZ6CHJPvmoc9mDA+LWPun
 NQi/evWdH5BUJgYJM6kQO169tUs+Zc9AXxrumlLYbs1/iY443I3U8K57b+8aXyZkEs5V
 folQ8Jr1zyBc/lVu/k/S9pU4GsVB7iTnT7drfMvjFAx9cMutFtW6sdSbsfed6iszG9Se
 uuGDSNYvHxq9xqTI9mKHjWJlK9c1uGQcLSpMzrACUeeMmQZp5EnUOVpWbdMnEGdJtbO2
 AHHtiXtj+hb7n95hxx32JnNYBBYC+oJYNbvusU3nzqAyjZVB2dWKmUxDTW2ZJp6XqezS
 l7MQ==
X-Gm-Message-State: AOJu0YzCjiUHNUUBYxZqitudE57yxK6xKOLtUsq+RQRc1jc+RAiUyuLt
 2N/VJCkLeesxHnoMhl8YMGjGFRKpCcxznKhU+a/1NJfxhYdjIGliXIE1gvsCtDaXqCqZnvHSEB3
 MnULfpIzUirPtIv3gzpL6SqNd4sJCPE8/f25lr51Xsv1GP6zCBDDi+tbtciUYhGW3KAAB9kU=
X-Gm-Gg: ASbGncvGcnYIGXmmcplfsevx1H9f8M2f07tKpClMDpVDbVBIlL7OGJsWmp4o8DjNmwk
 ieZeR87ULero6NyVc3yGWUHDuXUrJHVyrlRYcPj9ta8VSCDJaRcpCgp/i0TLN9ofQWgM/vwK/I5
 RmPCBObbDTeQ6pyIz0jXqf7o2rF41FzXZU6aU7cTmzxcQ28OBU7j+Q9X3pi7VzOotTCiPosLnMb
 gQOrVyfWie4qI+Jd+E+u4+GdSl/RXtIrHzgihARr1TJ1SrXJKbR8ZlSrVlWWW00xStRTXCyUAM8
 BlxAMp7LXZUwWi9sOnpzuSogB7XTsL/hVLvJ/Wvj1mkt5CommdqR82/pQs+3Ob1iA8PgMuAJvjy
 pjYhEU9bZfHnFZyGRp22qzOmIXGu+eCaMfywlss4GCsGR5ei/P95Y
X-Received: by 2002:a05:6214:20cb:b0:6fa:a4ed:cce5 with SMTP id
 6a1803df08f44-7093633e31amr166353646d6.44.1754391091008; 
 Tue, 05 Aug 2025 03:51:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp46qB81Yj6DBW6PfmcGZLSvWO4X9UnsMWKv37gM+2eUxLFUWLz66W/1ruvmDLQpLgFriCew==
X-Received: by 2002:a05:6214:20cb:b0:6fa:a4ed:cce5 with SMTP id
 6a1803df08f44-7093633e31amr166353266d6.44.1754391090599; 
 Tue, 05 Aug 2025 03:51:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c98c2asm1966116e87.77.2025.08.05.03.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 03:51:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>
In-Reply-To: <20250801-drm-hdmi-cec-docs-v1-1-be63e6008d0e@oss.qualcomm.com>
References: <20250801-drm-hdmi-cec-docs-v1-1-be63e6008d0e@oss.qualcomm.com>
Subject: Re: [PATCH] drm/bridge: document HDMI CEC callbacks
Message-Id: <175439108947.3454735.4407593124485023962.b4-ty@oss.qualcomm.com>
Date: Tue, 05 Aug 2025 13:51:29 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA3OCBTYWx0ZWRfX+GLe8Wzm50SL
 HFwkls9ybuNGGh5vgzLfGV6NKFS9M3bh6NE3iLubY46VimXFQzHzGTmA/nKXlaoLoSWOEwr7xt9
 OtUPYQb3sCF57GZRBrtBSChudHHZjLUCaer8sCsKaJa4Oi78wVz/AF4e83HT1Wv113LEWGfuf+X
 mfDqxnDJOAT89F/6x2pb0l+lw9q3wdqMYlvLieq5sW10wHbbhRQkyACMxmKYa0ivhFsAGPl8zPX
 DMEdvsTASF4NhgxkEONDTJ+YdGwHqkyo+D6AazchTPNJ0SCVHAv5CUiMBYmMb/Vbpcy5yP8LxvF
 1k/uclyhzypUXS4m47jo4QViHaE6QRiVfkCbqRSA1kYabSwS9EXXlWqS6gLS7RP1l1wxS6/gl+E
 j2Fnuhe2XnRbfHY9yFIH/WNPjI7H2uJVOFlRRKvWh4gRyPTgE8LLD/Cv0t2sXVxjVAYUglX5
X-Proofpoint-GUID: KYzRgB_mGrV-opu11VKsOeMNsZdChwbP
X-Authority-Analysis: v=2.4 cv=OYKYDgTY c=1 sm=1 tr=0 ts=6891e233 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=8pPcKAIJdAIFnR10lwcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: KYzRgB_mGrV-opu11VKsOeMNsZdChwbP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050078
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

On Fri, 01 Aug 2025 13:46:41 +0300, Dmitry Baryshkov wrote:
> Provide documentation for the drm_bridge callbacks related to the
> DRM_BRIDGE_OP_HDMI_CEC_ADAPTER flag.
> 
> 

Applied to drm-misc-next-fixes, thanks!

[1/1] drm/bridge: document HDMI CEC callbacks
      commit: eec8e8c048caa826ecbde7bf40f0ac2d11eef99d

Best regards,
-- 
With best wishes
Dmitry


