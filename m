Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 707E2B56DD0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 03:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E77410E280;
	Mon, 15 Sep 2025 01:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9vpjLUS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223BC10E280
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:22:08 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EMa1Na011305
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eAPS3mv1/cupyBVCM8O2L+PZ
 b+74Gk1BkD4WB5VbJmQ=; b=n9vpjLUSeLW60sf6PRJPoFV/qcRDX6p3g5GPM/0u
 M9khqpntj3gFRsPmgHEm4eO3L+Hara2g0SEES74h6OOR2QeRu1JisNhUlvJaGJoa
 +DHI9zBFEKxdA+iwW7U8vPdwM/EIULhj6uNd8eSPuznwOQkwZ/SPojT3fLSmDBjN
 T3yDodYwEyx0dLhSKcsXGIgCZ9F9cK/IhkJr7Puo5mxh0dgUGy6fAPMAErkLLOAS
 K9TASU2Vk+lRI4HAtTScnrfLIi1FAxVfxgysEJAtsxb8ZJK0Gb5Ah3mTz3Pz7UTc
 PIFgHisePjeDsU9XP9iARxcwa/zNbHZTf32qLP0f72qPYA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951chb08b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:22:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b49666c8b8so77509501cf.3
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 18:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757899326; x=1758504126;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eAPS3mv1/cupyBVCM8O2L+PZb+74Gk1BkD4WB5VbJmQ=;
 b=lhigQNvqHi0phpadwnKjdKaTDdTUOUCGcziVlBePL9FEBHGdt4YLtYKEMIr8YpWUow
 Wa/jq9caIqhXQKGjHLKl3GNNV19jCnl0CFfvvHnqFjnNb+Cxdr4hZ/cwMTOX8qYiyyK1
 952pDO24gBpAUXcbWGYaanFqSAjmqJNAMo9CAUqaR5ijxaYeN3aA7AQud5tpj2izHVrq
 eRBpfD+Urv7l6kFvh16Tlqd4XsNPOnLMzc+DLcK9iQrtMgOlTS202R7vWds9KePsUTkR
 2s8Nw++Jt2YV6CM8offJsAUkGslq2PZ2AvG/tZ9za750fgE+2yl1JB+zoiHsA9XMYZeq
 DgPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRM1RkJSxntvfnv3/pfArM4qavPtqhq9uwy/1YUxPH7uFD1FuTncLzR60Ro1hPbK1xprTWtoUzSYU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3RT4BuN3vushgAFom8SUB2k3cqLmuhpzKGfuW7WjvPmdUWVlH
 GhB2PU7uj/h9E2WCnu2e2tuQtFmYXg/TZ3zvJIegtxnTxb8Uilp5RGOiDXypV5whXCztuJKQcSr
 bmqA/Yc5if6NuG8Xpf58P4AH5eLwjRIpAtULOfu+hnavWbnTHGLYOuLWiHzRBzCRxfbkUK0o=
X-Gm-Gg: ASbGncv5IDHeu4F94QGoH/bi+B+soleV8Sb9fjevSPAfMIzLpIDnZYcW7UuFpmte9mM
 G37ngrk0NfzvzY9Sjujk7kQi8+r6zFHp4aAzkYx6QD5bdqijAx04n22Y2vEKT+9uSuSlfG8XahX
 s6jAcFObMC8AnNk4CRK/1kti3S/4z5CJG05DJswkQoHlXV3yYO8ieKJK3N6XrAYiasfL3b6RE/b
 um68GCtWzlBufaLQCZG5uuvEQAELTj4K59c4IDVUPsQzVv3ZfQSGDTJG+BCCw2Oqn1FDIMAGy+D
 nppo8bFAE691Hej8TFSqHOBvx8pN2+LF18FfSQiCFexIo3cw/SZ68AtvE7SOa0ZZgaIeOzdC8kV
 68z1guh8D8HSPa+tx8GERUQWq6bIOCSPV468dyIyBNnRwXPpFJ20l
X-Received: by 2002:a05:622a:286:b0:4b6:23d0:c89a with SMTP id
 d75a77b69052e-4b77d0db1b4mr132581941cf.37.1757899326166; 
 Sun, 14 Sep 2025 18:22:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQSyYeAgSEmgcNJTTqp0vPaZyCuNNzRtT1WBhvlsaTwF6ipWsBzX++GOjSFqPhPAIn7RL3Eg==
X-Received: by 2002:a05:622a:286:b0:4b6:23d0:c89a with SMTP id
 d75a77b69052e-4b77d0db1b4mr132581581cf.37.1757899325711; 
 Sun, 14 Sep 2025 18:22:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34f1a820665sm23743431fa.33.2025.09.14.18.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Sep 2025 18:22:03 -0700 (PDT)
Date: Mon, 15 Sep 2025 04:22:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Molly Sophia <mollysophia379@gmail.com>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [PATCH v6 1/3] drm: panel: nt36672a: Make some command sequences
 optional
Message-ID: <v26z3jsjr3kijnfkbu3qdixzxckx6xshyxlx3ro52y4cfmbc4n@vmunmuquye5g>
References: <20250913-nt35596s-v6-0-b5deb05e04af@ixit.cz>
 <20250913-nt35596s-v6-1-b5deb05e04af@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250913-nt35596s-v6-1-b5deb05e04af@ixit.cz>
X-Authority-Analysis: v=2.4 cv=eeo9f6EH c=1 sm=1 tr=0 ts=68c76a3f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=AaDDvXmx8HBLlr6wuooA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: UkqpAmDtLgen1XnNxbyjvxJarr1JR-mL
X-Proofpoint-GUID: UkqpAmDtLgen1XnNxbyjvxJarr1JR-mL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzNiBTYWx0ZWRfX2v1Bs/kdXh17
 ViTb0D+rSyIv7SItmCzjIOlMiFmKUWm/G0GJrDXzrL7OBR7IAKlnw0N5Tyb9lUip9EQFURlTOJC
 fuRLC0Dy983ZaDMJXZehE+FJ1KCASfJsHALPRxkKmH3NUcXgvQ3BOP5iVnaLKc4nma5KGVLSKpb
 H26nTtKiU1nwR4oU6p8BfCj/ZvNn7l+rmpYBp/8C/KEk1SyrEv8hcvM+Ugm9on4XD9xBa+9ALNF
 e//U7sqwn3OgWoo37xyYLmir9qCWWSpKnY7vzdvRXR2zFys6hGcFrZXVuC4ULqSmjDLuSBQCPlJ
 ldu7hMmzoGUgRLwzbXvt6Aiv024iTChvu+pYwYmPhEjzyRAXTzFrQfFwwomIfZsxp2tbgVH+3Q6
 CxCkRj/l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130036
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

On Sat, Sep 13, 2025 at 09:19:47PM +0200, David Heidelberg via B4 Relay wrote:
> From: Molly Sophia <mollysophia379@gmail.com>
> 
> Preparation for the follow-up nt35596s support, where not all sequences
> are provided.
> 
> Signed-off-by: Molly Sophia <mollysophia379@gmail.com>
> Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 27 ++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
