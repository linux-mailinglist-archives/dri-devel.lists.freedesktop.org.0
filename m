Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC97CB5215C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 21:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FC110E16E;
	Wed, 10 Sep 2025 19:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mWhsjeUI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECDC10E16E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 19:46:48 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AJ5sk3023987
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 19:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PpSH4cB6sYP2RTo+n4KKNJOi8FnpNbuj7itluUrIaUs=; b=mWhsjeUItIp0k0en
 Zkmqtlr8D1Csozjmsj0ub9VyuKwG2nsLpFIRoOa/iSlyAYubLasdHdkTUed9Jrbl
 bQA6c8todY8M7n6GOyw8gI5TMAnB5+VaygehzhNZJDvmSHKunG/lJgV5iPgySH/1
 a66cQiKagtBBm4MjQkFxwxy6GnODV3ZT7uQoqiqIuP2ytdYmafsGQ4yoDh6W4dEP
 2TIeiz9UD/UfI1fdhFCNIZjIO+6nl5p2eDqMuggRJgsHD8pezNxQCLQ+Fttc3Wxw
 GRF3kon5SOliEhUSE4RjaYGRGXEYDylolz9BaHQeLiM5wiLdfeCdBivtwZdD0Cku
 UyhL7w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h0372-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 19:46:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b548745115so28845301cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 12:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757533606; x=1758138406;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PpSH4cB6sYP2RTo+n4KKNJOi8FnpNbuj7itluUrIaUs=;
 b=WexxLmTI0MsaqsC/ysl/6+Mg7/83LTZSooJDTOrjIgO87lt4/XTkDZbrYRDPDEcXp6
 ODBlEmayrlg24uv3J2qwMyoMO/Cz47uED2CoJ/ANowxTWIDfQlLKuGtJ7m5iHiOQvjIt
 2zijvp1oRPhgKEE4hIBEcHVlySxCi7RGtaMaGKzyWBrKEEYdVgxdwXEI/0hRd8BNzX9g
 70kErnGQNalygfEW2o+hqI9UN11QfQ9ncQdaVufXw6ipGd/uX4T+Rd8dIGqwypo/fbct
 h/aM5aIhOpixi/C6W+DDjnQBOo9efHOSUTQPxuXwhU2g3xKoJjayh2Wr7tBNCufKbXGA
 KXyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzSmakOI+O9y7ViZfmTCO20MWxAzNz+sgc0aTFXmrKHb4ciN3bqDhwtdPOnq7HC2t0WNRzWphB7OU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzALHHrW4dV3Yhdb9XumKCsEgSqGyJvUGpvhj0xo7kTZKmvXi30
 Jngx4srOIHqS0IyxLn6mrnOgu6QtwwRRWdUw1SKS9gri+cpUIr14bGjWr7hKSRu8EseP12Xcf8O
 XHOf1xtRDHgLX6qu02WP30Ma7fFlokJHS5WwIpplS4XsRi9QIxmWIJ4sPZb8w4Vx/m0U5BRc=
X-Gm-Gg: ASbGncvsCMvsGL545eKNUZlfShcBSrHgqI4dg3q2JQXjCNw5bHQP1ra46YMk20xyUJN
 D4G8+sz0Y15/k3d+ne1zk1aOm71mc1zeQ1Uo6H9kYy0AAI4UkOB7NXCl3Gd9yrUOHL5bI/fQUHL
 k4+b2sXvPTCKGTaveV1BDTFl5W4X3rh+FmiUPAXdTFOl3sEjr1WWwu814IombC7i8HCr/lKLxvh
 ltNUiC6nySZDAxRG4Z8S4mT+QqN/8PEox8B5DNgxWF4vvUfmke9riryf1cEpHjObnjbQwRsHc1H
 4ZT+J4C8mXgJUuUGpfAPptxgYbsqbVeyo9O83zlnIF2Z1XG13u1hwoP7j7zpd8cOi+uDOV7Lmcb
 nqCGn1vBujCBEzlR0ObVJHe989GeycBaDlRMMVNt1OszXYAIFutZn
X-Received: by 2002:a05:622a:130d:b0:4b5:6f48:e55a with SMTP id
 d75a77b69052e-4b6346f39e1mr12762181cf.12.1757533606178; 
 Wed, 10 Sep 2025 12:46:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtJNlip6unYyAFEHPH8m7ysv5kXijpQm5w+h7Po8npKifdCR5iLzClbPTHw8tWnlyExjczeg==
X-Received: by 2002:a05:622a:130d:b0:4b5:6f48:e55a with SMTP id
 d75a77b69052e-4b6346f39e1mr12761961cf.12.1757533605755; 
 Wed, 10 Sep 2025 12:46:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56db8911645sm55335e87.9.2025.09.10.12.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 12:46:44 -0700 (PDT)
Date: Wed, 10 Sep 2025 22:46:43 +0300
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
Subject: Re: [PATCH v3 1/3] drm/panel: visionox-rm69299: Fix clock frequency
 for SHIFT6mq
Message-ID: <iarovbkt5vpzxpkxyvf4d2pwfa2i737vxridggqwfoxmvljyzp@mnhr4sgadfrq>
References: <20250910-shift6mq-panel-v3-0-a7729911afb9@sigxcpu.org>
 <20250910-shift6mq-panel-v3-1-a7729911afb9@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250910-shift6mq-panel-v3-1-a7729911afb9@sigxcpu.org>
X-Proofpoint-ORIG-GUID: zMQDcXMUrvaLR-o9R9QWA31Hw5HAALtC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfX8ljrWgrTiWee
 KYnRJaCRPhRbBZ78dGQ3NEXlc4/+KHlJS+394rl4LV610YpE2NCbt9aYrsZtWCs4nZ8CPe1A518
 p/odxN7nGpE7piMHnPNhz2KfZkloBaA0uXPlbliSMpUin8Ss0fZ868rF2VnDBvMfpbRpUmiQrR9
 EB01pYn1U1ADSZMJ9+JqOPSu80p1uT0g2dMtZJetI9ctrmuoI3vlioMVX86/88XHnP47ZRAunn2
 AiWLPsHqQzzQrj6LJhOCmZuH/WtyZIDZWC0+v2lslAVkJIYJiD+NW6mAJbIsfQcAC89mgETGyUm
 97ZZ2jozifY73aXHdGowtZaGzOmIwaSwUeyhstgvPny3JG+2VJd97aEL931hslOF2bC4WH/je0X
 5gvodY8j
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c1d5a7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=ze386MxoAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=v4Hecdos7qkWo24Wf8QA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=dawVfQjAaf238kedN5IG:22 a=iBZjaW-pnkserzjvUTHh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zMQDcXMUrvaLR-o9R9QWA31Hw5HAALtC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177
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

On Wed, Sep 10, 2025 at 06:39:56PM +0200, Guido Günther wrote:
> Make the clock frequency match what the sdm845 downstream kernel
> uses. Otherwise the panel stays black.
> 
> Fixes: 783334f366b18 ("drm/panel: visionox-rm69299: support the variant found in the SHIFT6mq")
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-visionox-rm69299.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
