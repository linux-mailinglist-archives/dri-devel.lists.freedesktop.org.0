Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9944BB3BB91
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 14:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5388E10EBA8;
	Fri, 29 Aug 2025 12:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dHa/sty2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C2810EBA8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 12:44:35 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T85JEF011808
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 12:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OM5XRmALpbTNQitrR9ghy0nuO7Xiw48Vs7z2c0FwRTU=; b=dHa/sty2zDtjNNrT
 2+ydEmn71OEmzuuCbyEWn6xNDKNUn4iuWAzgLOO6iyPX23QBeg5FRsE2gq+ayGNe
 6IvLv/6LFYVaLqv6L/e2thkIQBDPTO0nc4x9qZPutMtEUzFwEGA5NYGwxnnrdyey
 xEHYE3eWd1vuJ1Jj5JHsAzUp9f5xsoq09DO2LgsOxOJCpf7qkjeIrA4MBWyz06cy
 /4VzI48MFZzw/ZG3mfQm98o1G45HVfgRyRi/UrkKSRj9h6k+cElWzhMR9Gw4mgky
 fukN5GFRQsm04u0wRIA5/BbVDwCfBvrbMhECYwnNWNsBxuS/BlUl3kA8mb9D1mse
 nZBhIQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615uu5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 12:44:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70ddadde46bso39776536d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 05:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756471474; x=1757076274;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OM5XRmALpbTNQitrR9ghy0nuO7Xiw48Vs7z2c0FwRTU=;
 b=H9HoWUyfixlIoYEZo1aD9sI4GrQphuVlqg7BX3wW5kJnb4VIYZjm2Q5S/7N/zi49Y/
 IrH/eS3dEqFoAfmwpIHYWN/05NBDQpH3TDG22vd2XsmlENb3uM85m77fyItwrjw7deKf
 FK10WqlmXJ/R2Ww9f/rVy4TLuFXyqpvCX9/M9lYbNUN5xM14PzRJDp165mag7hBCJ9JO
 iM74bC6beGzZtdpeYDSO5Ghe1DkzD/MSBBbAkf0V8RVQD8PbigV/3AjzRKghicglTDXb
 jTA4mXha39RoWRECguljjPd+8XWYrfbwjmlk/Yune69z10+tYoZVHKEXRHse26OQBJX2
 ccwA==
X-Gm-Message-State: AOJu0YwagPZmu6IiIviy4ObYCA2LNd3Rvx2lDktCxRh5WD2KDQLKV7vV
 t7C/L4B44xOslxyNyeDd2pcD2b//2Kkya38ecVK33HDf7EKQZ7Jrg4jIeL6FH6rnVQfIZGnSIaw
 LPb+bMUleVAIVuMNq0lh/Y0jZcCaQuKkfoKuAK79+fn39A3/Sw2cvwT11q1bhnDbCqW3yRFn2WS
 tA79Asew==
X-Gm-Gg: ASbGncuz9Gi6Nr1URmvEIyn2ousIq8ep0atqSDDCvYlX7YqDiuw8TxY5nUrDM5at3SD
 fnj2TfvFqikPFMjyvF544dhRio2YaMkX3h62By4qM0LQugDW+7Wf3sQiiJll6D+OOMQ+XAxwdBM
 U+jkycm5zXQKmGERsXXh65jY/+dCI1V8NhTz80n4nz+/MYK1vk4xYjtYidrHM06PopLrkSruTXG
 Ni8wZ2tWUC3I9CiDdOPza9Ok9fVJeLF9Rre0bnX+o1wElOWJW0i9bZb3SmJ8RBfnZF/me8tQtW7
 RGDSygrEDNi2SQrQkeZHojJmvg4aQZzwvK8JsX4UslgdQv+8377GxphhHkDCtX//j/IfZrvpAhO
 300Vf/RY5p7t4OsryBXpfN2QI/lASdXrvimIvLMyKYsUbKfNRP+6G
X-Received: by 2002:a05:6214:2345:b0:70d:f7ce:fe5b with SMTP id
 6a1803df08f44-70df7cf02d3mr57827566d6.57.1756471473831; 
 Fri, 29 Aug 2025 05:44:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqiiEbiwWzc97h8HM8qB+w+Kb+eEqt8tEqiEr6/iDIqeknHui3+C0lMnaDZ/UaSsYiDc+Mqw==
X-Received: by 2002:a05:6214:2345:b0:70d:f7ce:fe5b with SMTP id
 6a1803df08f44-70df7cf02d3mr57827156d6.57.1756471473250; 
 Fri, 29 Aug 2025 05:44:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f67a50435sm593782e87.152.2025.08.29.05.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 05:44:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250827-adv7511-infoframes-v1-1-f89b9690f89c@oss.qualcomm.com>
References: <20250827-adv7511-infoframes-v1-1-f89b9690f89c@oss.qualcomm.com>
Subject: Re: [PATCH] drm/bridge: adv7511: provide SPD and HDMI infoframes
Message-Id: <175647147213.828962.3232012241776711078.b4-ty@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 15:44:32 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfXzDKTx5D1qDTl
 K4PahjTAQ8GQbtaOcOP2MpGr3h0kBJFFutaTurUZL433Q1QCAgPA6S3pOrpSgV+IUj0KMIDrM5Q
 n34UY6TZ4wIJBEjSihRAeC4XTBUlEG+hFA164dyf0aEHg4Y6YJ/11USokp0GgOxMMX5lBfU3ymz
 xNNFoIYamRgR+mAd4xE8UUNAJlo1z0n1oMQYAYO3P9EKqndiZZ4SypqaYQedQaPZD9Mf1gU228+
 GMotCFE35c/vhcQ0DUvcRDAo943RjenNofZjKnUdrYng2vB9AmyOh1Ym8UVqdM05GWGv+ZMLSdP
 kWRTSeMM6o+v51kRavqNlGw+fYtfSo3LAa/sBdSTfJqRi9cRREpe5kD5Ms0eKdFBEtqk2buvOMI
 UuOY2jRH
X-Proofpoint-GUID: ulZhUBjR_N9ItLxe0czsqXuvLJU7fZhj
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68b1a0b2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=CDa_aIuWbD5CBshxjBkA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: ulZhUBjR_N9ItLxe0czsqXuvLJU7fZhj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034
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

On Wed, 27 Aug 2025 16:29:04 +0300, Dmitry Baryshkov wrote:
> ADV75xx hardware supports sending SPD InfoFrame over the HDMI link. Also
> it provides support for two generic (Spare) InfoFrames. Use those
> capabilities to be able to send SPD and HDMI Vendor-Specific Infoframes.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/bridge: adv7511: provide SPD and HDMI infoframes
      commit: f4028ef65dc4fe9010bcc017597fe0fea6479097

Best regards,
-- 
With best wishes
Dmitry


