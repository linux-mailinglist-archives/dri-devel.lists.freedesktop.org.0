Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A9AB5215E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 21:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C192A10E9CE;
	Wed, 10 Sep 2025 19:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oAWVem7L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DE810E9CE
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 19:47:11 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgNl7013144
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 19:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5XSyilMow2vsdCL5NWrpdmYD5R/cfL4yovE1XWW+4Bw=; b=oAWVem7LqKomNZNd
 9Gzb1TpJYmZvI6vdbrVFFukkowNwwd7gzUigmzgefFIFFvWHIzxbut7u0EzIL2DK
 V5ICK+qYJkBN4kp0XK7WwYd7J68A6o7TRq7PTvSMyFzi/greCpt/XumiokjXEX2Z
 elzyPYRW7IvEIAb3qt18vYYEwmmPXEPdx+guGr8jo6HKWamA+ghy9FiZWSejQbyS
 aGNqZ3pKPNHyo+/rEips7AsBYaT9gGRXnOQlEGxE0o5JplN7YceTpF6l2Y38WF1V
 IxsqYXZ6bCouuaxfzNbawrXQwOHjucBanCppde3YsLD1Irtef1gXjnFCfyBbjqjG
 tdAHBQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8ad2aq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 19:47:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b60d5eca3aso950731cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 12:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757533629; x=1758138429;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5XSyilMow2vsdCL5NWrpdmYD5R/cfL4yovE1XWW+4Bw=;
 b=HQfDUl5uE1UjqMlSnvRkfvLe9pciJvQY7KrddLrLvhmLlZqAOKLHdiQ9xT9JcDqBYR
 k+28/1mGC9a1QeRflGLRMLRMWEn0yV+mOaAzD7earHpAU/luj/lMbrzcZweD1Dr7TXoy
 UZIdD6A76iKrhkB9lQN3DKSp0Pqsh77R7uEUThKoTqQBbBOOE6bTScX4paAQCITJjTaQ
 ufOJ+kfzI+5CIOSsunKH2pUUds4aHJeBcRfwfrlrQ6QgfLsjcqta2FsvSpa2hdE2/dIf
 CnJNgD8gUOA/syVs6SR8CmlcCZ4OtRhmg/qmKgopDNy8/1X8vsrSoWcJoonFe3QuW9BM
 DCrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKKDBVL2p06zz09bo2CbpghQTw0x6/xBWqce1Y5e5OfcWcNAZHSsboud7xfmFgN6oDwX1sUt040Po=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxhHcq8ZmyJQPh/2pzsLKnribjpY3vUEbrVMztuDHdZI50rFA1
 82dmesircgkPTGiiDngB0CHGcA/PcPcZEHK4fvL+Rsq4/VuvPEPbtJ448KbLm/Q07gY8hEIZXdo
 WO2BATCMHPFXAm/IVoCY55mFDFjydHOW5ErJeIC0L2KZu+UrYD7shMYWwbevV7DFT9vHejLE=
X-Gm-Gg: ASbGncuhZPbmLFwev1WcucU7wm/TJb14V60zdGeqWgzmqIWfzoniehj2GqMKSLPtp60
 ARkJtjF/0hROyaW9GpUboLbaMwVNhGK6cCSBUJTpkv4ZMFUYdrAYmG1H3qGcxM24VewX5Xvib7y
 iczQ8FxZ7I8Ty+n9w3L1MCh1qjjvRpxijMJ3p3GWhoHuncVZnwqgZZzQpt962JdaQ0QKSlU8g3y
 Fhdiqsr5cdS66CKUdmFyr/853+9viS1VLEKx86zwdACxFOwLjpXPOviRlFyJgKCBuTXOaiHkGrW
 Oo7uk6ywwnqfTwDdPQrx3rvou95uCgH9a7/VI6JQ3Bn1YaaoJ12tG2FPhgcxU1pQbRpCPO+iqIC
 /KFVpwvVDgY2gEA/iSxdP/K40s5JrqGJb/H+lQX4WUN+345+XEs27
X-Received: by 2002:ac8:5f14:0:b0:4b3:50b0:d7f with SMTP id
 d75a77b69052e-4b5f8464d8amr166081181cf.61.1757533629362; 
 Wed, 10 Sep 2025 12:47:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8wquYMa19XEyPw/QfhleXZDPv465xQ6dUWPMr0z2Sj2aWYLvr2qI9QQ8LGJkWNi7M4zEUYw==
X-Received: by 2002:ac8:5f14:0:b0:4b3:50b0:d7f with SMTP id
 d75a77b69052e-4b5f8464d8amr166080581cf.61.1757533628861; 
 Wed, 10 Sep 2025 12:47:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50d3354sm44101601fa.68.2025.09.10.12.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 12:47:06 -0700 (PDT)
Date: Wed, 10 Sep 2025 22:47:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Kaehlcke <mka@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] drm/panel: visionox-rm69299: Add backlight support
Message-ID: <e2xzrkocmv5qtiuquccdmph3j56iezzerslyi4csazcwgmtjkp@ft2h667uhccz>
References: <20250910-shift6mq-panel-v3-0-a7729911afb9@sigxcpu.org>
 <20250910-shift6mq-panel-v3-3-a7729911afb9@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250910-shift6mq-panel-v3-3-a7729911afb9@sigxcpu.org>
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c1d5be cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=ze386MxoAAAA:8 a=EUspDBNiAAAA:8
 a=UV-YmP5_J7MdQozCVrMA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22 a=iBZjaW-pnkserzjvUTHh:22
X-Proofpoint-GUID: kwI43ktKMByjHQg4R3xgF5Wt3JdC-5vL
X-Proofpoint-ORIG-GUID: kwI43ktKMByjHQg4R3xgF5Wt3JdC-5vL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX1FW7M49TPHcy
 EFoKaoQ9mMUMjq6Kwh2J15mCcSJ1uFpMgadNnD6oE92/ZUS5DK7tcEuMLJs0/n6nu3WNQySlp6l
 j3KO7fBIWaKIAbB6fYdbuqfQQB9LlaC3hCGkAlb1Q4V6fzgZQ6WM4RMm4N4Nx9Tk+hyFsHCoYU2
 6kI1u9D8OhAhyqx6yKHDdoSM8J1DJJFGQAqsW9oDkD04mDW674OYkUuj+llq6wE9DmBzmD0zkBG
 P6cDFU+fl7HrUdi1TmrMCWysLdbIVEBQj1AU+7lZwlDC0k2gMwxr+ON0h6T9P+7Zopoe2NxIZso
 6lehCy9GRzpUk/k1BuNBAchdTTap23WqlLCqSh/hZrPoH4p7APVtxh5iGwiCaYN2dsiVlJ7aKsE
 7+RjhGVe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

On Wed, Sep 10, 2025 at 06:39:58PM +0200, Guido Günther wrote:
> The shift6mq's variant supports controlling the backlight via DSI
> commands. Use that if a max_brightness is set in the device specific
> data.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  drivers/gpu/drm/panel/panel-visionox-rm69299.c | 67 ++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
