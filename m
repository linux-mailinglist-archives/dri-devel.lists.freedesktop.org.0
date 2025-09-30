Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 436F7BAE764
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 21:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388AA10E28D;
	Tue, 30 Sep 2025 19:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UI9gjTBo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B0910E28D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 19:36:00 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UCEuW5015464
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 19:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lvj2v58WhaULcHhKfkj48JWEN5u/Hdq652Y2OxF3nx8=; b=UI9gjTBoXPG5FqK1
 i9EZzEPIBe4cEDqnrdysIx8PJIqOevx3NoJXnRjIohzIMMjafGjLtNHMiLg2OvlX
 ObpiXVh4VE0LWHyv8MoHsBIjRg0HQUmyq/8WNkm/g1XOpnRadVt3vOwQzhhby6GX
 1NzgDujWs3kbAf2Qujma3/qNDL+F2J+ewQ+Jj4tF/z4LrsE3wwUPr9gp3ygQxrAw
 bv5RiBOk+ykEygkPA5yiaOpanR4I5pQPeycLkrYvSOLCDRuNTeNf34pqtSkiRQMA
 bZuN53R8YM7jKqSzZHHAtKkPz+8YRflLot4cgYN0DfSBad/6LsCznUoSGrGK3bDb
 uB/Tug==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr28fd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 19:36:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e0e7caf22eso76145971cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 12:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759260959; x=1759865759;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lvj2v58WhaULcHhKfkj48JWEN5u/Hdq652Y2OxF3nx8=;
 b=j9E0Xre8ZuJxB5+LYS8RxMIlXV/mjvTtHTZ5lfA/PicuIqlbfJDOgDpn/gbO8bTEYo
 D+6mVsRjLxFdVEtSKAvKv/tsvdonelDEpb5tNqDwIR9YazoaNJEdcf7frk7sl/cTCJHp
 NrjkjLWunR3XehcOqtqeraVwTPkajVtSHKVUrhyAvQdct8ycwkNaTDvfYhNB3nTWJmwZ
 jJv4qyIwsgIaeZ0Njh1BZ5CkEI5K0gHDxO2TVDQngoxX1D7ElrlkZOENmrVgBs4qqw1M
 87pSlljq3Zvg54ccL4vgdgUPwANlIn9jwNAowAflrSOdOPJPfL2YIg1Gay49Q+afwdO9
 P3qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsO0KMvNmJdkDIjCQE/5qbtL+486+wPM6ctjJrxGiGueGLDJ4j58GAShuBJP1uq4LtBx8L8ZdGqcc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvV14c4mo0HSauRnvOllf0F/H/NDYNH0aeNQR3bd5/tKjhQm12
 3tmveGTY/eTXa5zqTbkpMBKBtUzweed53i8IDduAwgBRhKjDYNM4bYXddHDgXgIgD3O3QgfUXjg
 3ZU3p7oLsrW4zefxhe53NmDFB/axncF5eiPGhTsK9+v3u/OXaRcXvl+4d535IzHQQQjwfbzxg1T
 Xp/tVLEg==
X-Gm-Gg: ASbGnctLXNMaXTHTqSrLbjQsbu9tZbu9XQxgO13JGc0V+eOB+1KDqppNsJTFfvH69cE
 0xLbjojASSybTFw1gWmcEXcBj3U0euQKt8JE9r6YuIxjS7SSckmjO36KX23pr3HB7K7DSV4AAZW
 rr8O31IUK7Xa5XgamLs7RCWq5cDsxnUVUpQ12CS2fkhAeR+Sl+FA/trj633zj2Q60soCeVZ+BbL
 AclN/kjS86jypPRDPQUVfo0MpZeSPM0yAY3oKvWVKHkcuvMH13O2y0c+6b0kTyO+Tn2GSfefQit
 ofIPKmoLL1p5jjuz3g3QRZ6zqydUntSUjL/H1HkoPJsGSdlk7fXveqOP8vDfYn7/X8SeSBFjNsn
 rNELDQYuBlgXNgpIp7Esqor61IFZzcsBmoVzqeFE7N4b/wNKFSbXeUxMT4A==
X-Received: by 2002:ac8:5810:0:b0:4e0:76b7:35d5 with SMTP id
 d75a77b69052e-4e41c733499mr10629211cf.33.1759260958627; 
 Tue, 30 Sep 2025 12:35:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkNxeFgWyXeWrWIAptA6yK8icuvlqTlnU99wi9RboNE56Zpsc59WiRM39V19vXyZGsqKMtwg==
X-Received: by 2002:ac8:5810:0:b0:4e0:76b7:35d5 with SMTP id
 d75a77b69052e-4e41c733499mr10628561cf.33.1759260957894; 
 Tue, 30 Sep 2025 12:35:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58737e32f5csm2282387e87.0.2025.09.30.12.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 12:35:56 -0700 (PDT)
Date: Tue, 30 Sep 2025 22:35:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 7/8] gpu/drm: panel: add Samsung LTL106HL02 MIPI DSI
 panel driver
Message-ID: <rcx3hpufjmrpzp6tgl75qq5rmk3bcxa6dahl2egpgubu75bpa7@bouekp54w2gh>
References: <20250929142455.24883-1-clamor95@gmail.com>
 <20250929142455.24883-8-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250929142455.24883-8-clamor95@gmail.com>
X-Proofpoint-GUID: 2CBvrfyKdMpPbrBG8FM0LGeq-2E0xaTl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX6TgRNQIa5Fie
 y+wV9A5sZxH2Bgb50Jo7Nu7XUaAnn/TdCKf2vHVhJzzCWGtO1+U7vVAkxQProaw25Znc3PCK+br
 18vZ4vzUgL4avB58opyYCWD4sCN1NGBk+lFhXu+vdsTeimp8qsbgGS7XGWDuVp5OTnpgNxFmYp6
 X30nZRRPo/rC1x79BU/AfYWK8zXaQjrlZwy9Lwx9ab/Ej7PT/uBpSzrMPEC35uiyrtij1mJMgI+
 D7WCRgmxb9OhlcD6g+OhXILrkO/7/8x6cqfzpAj37y1XbXm95FKs4xwIIxZKJP/reSzspVOUcUE
 slP7p7nqcEdmgR42thKgGka664UsJ5NzNQB6qCJ+Ok7g7tjKzWkKHsSeX6izX96Li99NNFhCSs1
 N+R5uVAvttq3cZo3l5g0BzZLQ5OYKQ==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68dc3120 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=sfOm8-O8AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=r3kgLuTu-6ezLa8AVuoA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: 2CBvrfyKdMpPbrBG8FM0LGeq-2E0xaTl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017
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

On Mon, Sep 29, 2025 at 05:24:53PM +0300, Svyatoslav Ryhel wrote:
> From: Anton Bambura <jenneron@protonmail.com>
> 
> LTL106HL02 is a color active matrix TFT (Thin Film Transistor) liquid
> crystal display (LCD) that uses amorphous silicon TFT as switching
> devices. This model is composed of a TFT LCD panel, a driver circuit and a
> backlight unit. The resolution of a 10.6" contains 1920 x 1080 pixels and
> can display up to 16,8M color with wide viewing angle.
> 
> Signed-off-by: Jonas Schwöbel <jonasschwoebel@yahoo.de>
> Signed-off-by: Anton Bambura <jenneron@protonmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |  13 ++
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-samsung-ltl106hl02.c  | 179 ++++++++++++++++++
>  3 files changed, 193 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
