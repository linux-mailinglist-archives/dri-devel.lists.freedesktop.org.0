Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 070DCB584DF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 20:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CE310E534;
	Mon, 15 Sep 2025 18:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GlbzvvFC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F2D10E534
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 18:44:23 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FDo28L008243
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 18:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 H7zlZEbDvwrZ2WwVeg2HwNFd1B9kfu+h5gfiJZPAmHY=; b=GlbzvvFC0GOZbHNO
 YZK7RX+ZjCnBqRouBf8va5ruvETi68OI9EeYRlVq9iPIHaj44lsbyKCq3ig1Zc6W
 GNRINIjxjHOALjPa+RX9n/6tdrk8IIxnMDULOxE2Pj5UiiwkyRRLNd/gXCbMVSW9
 eAMNLqCUw5p0f1CYKC/GmedluhV005zaPKI+AX4VhAh+B8NVPGpF9FkMU7JfaDSn
 WHWtPgjDVQTMDositpa0l/2k4CepzcIwuL/MB7PR17huVF/9nG3WdfRiigSIv5W5
 r/pNAVl2PAqqC4cE2tKfdX1Nv2nTE/9vReCem72L2+EsQqWZK1qzVgvroiimkSuy
 b6243Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495eqpw080-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 18:44:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b4980c96c3so158047711cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:44:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757961862; x=1758566662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H7zlZEbDvwrZ2WwVeg2HwNFd1B9kfu+h5gfiJZPAmHY=;
 b=ORD9iL8dITW2UphRSX7rEoTmxyc8FZ3vaGebqHMr+TIePjQY8YMNTckY2n0sQj8g3W
 rTFtzRWEIlPIINfAv2BP8YfcOzLFPI25UGPrZoFo7jFeLiHYXY2oPPrThwjkS/lLWNMH
 r1UDmeXGnRzOfDMhmPDOZdqQoZBZHdBawwPaiTeM0IWmmypHBzOTiDz2W89ocsIMxW9H
 EfuF0531D+7BDT4LWyw9tUPEqrrRhtCH9PmKG/0pJ91F3lTDnhovlnsATskBi+PTTdeW
 KUJGuT2cs8NIxlthNq59+UtKZ19smlOtHixMfvAx4+rb6vYvL1g3NQFk819NnlJngSF7
 pTOg==
X-Gm-Message-State: AOJu0Yz0QFM53XDIHyA8IiuTip0BdwiS577a9QZzFgkAhaT8DaqhvdfN
 entIXlDOLMwm5PYyLUKgUzTsGVL+po805Ov4r72mhvJniFI+ngPxv/YEalZH5OQUpOh1VSQC0Nv
 RidnNMzWQUC8a2vLfrjUgtNpb8XIICphu/Ci+PsVz2XOKgKyXpSEP2o1EH3qAXUBUfzPeloc=
X-Gm-Gg: ASbGncvwFGa9ESrAv7/xDRZn0HFyZpATTRgHKeVV5oZ/J5SfNWvBaQQdw2U3NOT4XQ0
 kZtXceR5qJF3jHYZXJa29w1tDRNhPU6MMe8CLwQluvlILkNVQOvqA99QFRkWATgDVmsK/Z9BWxs
 UcjWZrVCvb2/taKlUKxE5TUUmUrXS8DqWSeA3w5pnQsrK1CWXacfkPtA9LvRcpLSn4ruDdB8lJj
 dbyfB2vvH6L7C4UeQuRMRZrxFB83zTuHt7xqsjeescFFtIYPfF6vM3QCe8SYkfptdDmsltSUh4x
 xjTFQyB0/rlT/1ysluNEHPp3NLkmnKGcJgUGxIQ3f4vD0TrzWbW+2+A2ne41I2n1w4lMibqCGms
 iJefgT8uP0JfbHYwfU9X540idTnI7FyTtTaFPBznaA13qnEH7AnmW
X-Received: by 2002:ac8:5cc5:0:b0:4b3:3b2:2b4b with SMTP id
 d75a77b69052e-4b77ce7b7afmr184749621cf.0.1757961861874; 
 Mon, 15 Sep 2025 11:44:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTnOK0+T1KMMZsImJnTzdi1RZ8Wv8HmrxbQ+LPLk7FEY999LaEahSW76CR6UmwK3rVGc8FaA==
X-Received: by 2002:ac8:5cc5:0:b0:4b3:3b2:2b4b with SMTP id
 d75a77b69052e-4b77ce7b7afmr184749161cf.0.1757961861251; 
 Mon, 15 Sep 2025 11:44:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e6460d741sm3824271e87.101.2025.09.15.11.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 11:44:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH RESEND v7] drm/vc4: hdmi: switch to generic CEC helpers
Date: Mon, 15 Sep 2025 21:44:17 +0300
Message-ID: <175796184948.521303.17608117947720640916.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250705-drm-hdmi-connector-cec-v7-1-d14fa0c31b74@oss.qualcomm.com>
References: <20250705-drm-hdmi-connector-cec-v7-1-d14fa0c31b74@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SLSdxDEQnA3rj8TZ1inS-In4nTK1CNr9
X-Proofpoint-ORIG-GUID: SLSdxDEQnA3rj8TZ1inS-In4nTK1CNr9
X-Authority-Analysis: v=2.4 cv=XJIwSRhE c=1 sm=1 tr=0 ts=68c85e87 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=jF_5xbMhzLRUUPPL_nwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDE4NiBTYWx0ZWRfX4M3RiblxQVHk
 rrEAPEwnf2Hil6rTzPhtGDBRz/eKdP1hGrl3KxZ/dEK1wCQfIWLwxrDcnArmQH4PGFveK4Vx0LG
 YJsxg2q9z/9YeS2TS9D88v4bQWP4/isfoP8Xfrv56nnYeYMhVAnGc6e9SCvhr0nhb7p0bz43INE
 j0jb55lwiqxY6w/FC39NXv6BiGclvYhepEIVWb/KcZ/pBk5lQPxFNOYx/RB6mJKoyOGew4eFeF5
 WB2loMrICGLgU8rHyPKAkBfR4MIEjBw+E4893ZRjmOG+B5DRJWNoP1JP1kUczhDI99onhyfWK3T
 D8RXmEPhLXH1OS0dpO9JJKED6JsowuymIgh1GuuTFMynewYAk5SNjIb6OXcKwfksg2ygvVjxx6p
 qYVcL7I7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_07,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130186
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

On Sat, 05 Jul 2025 13:05:13 +0300, Dmitry Baryshkov wrote:
> Switch VC4 driver to using CEC helpers code, simplifying hotplug and
> registration / cleanup. The existing vc4_hdmi_cec_release() is kept for
> now.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/vc4: hdmi: switch to generic CEC helpers
      commit: cf207ea2c39d2809eb6e579279178dfdc89fa906

Best regards,
-- 
With best wishes
Dmitry

