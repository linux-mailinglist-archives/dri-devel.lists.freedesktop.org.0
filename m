Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 625F4B57F09
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 16:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D94610E4CC;
	Mon, 15 Sep 2025 14:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HhGMIiAK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCB610E4CC
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 14:33:04 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FE3lAS014092
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 14:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cCiPLFsgRo2egphdxmb1qzOQ
 5mme8yx2hExKNMNoSQE=; b=HhGMIiAKuz/F2/+8ITmQfIeolCgGFrHLten91PgH
 l4DBKNbJ0h6Ud7usSUwjs2iLHeWuPm+1OlcAtLQaUuAcTDr+TxU1A5Gg9nTVV7Ea
 S3aynEudRJFGuHFX6Ecded+KObji5Il6HG9I1ORtA5mEP6VFiGa4c4lwShLOVXgN
 jmImbcBG2bxsrFIWHOq4XgfScJ4D9xq9afhPeWgcwVRA1MSparaYEu6CPqOS41O1
 qSoPEFg/7QV4QshJ2G7DbqqUqTf/Eykdzf4w4EKa4VIF9T+c+XJU7Ry5f6szyfle
 Hayss9GLQh6BT5L9m7ru1lv2qf1dJW3I9HL+OnLH/kAUgw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr5h1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 14:33:02 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-54a1ea646e9so1038332e0c.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 07:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757946782; x=1758551582;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cCiPLFsgRo2egphdxmb1qzOQ5mme8yx2hExKNMNoSQE=;
 b=MYx0iPVRO+TgwBB1pbTsxMKDzezj8bAa1ClcdI9+04caN2QNxnu6ptc/w9J2XP9IX9
 RCgWbgXRYhixcb6pMgK5r6E27eGFMeIkyZh6Xbw0U7Y1JKVNsU+tcDs4jhL2uDaSZ+gJ
 nf4dGvii8z6wDyMWI0JGWBq5+3y40iBXk8Ds9oCi8FACH2g2I1epf+IkObiBLWbgfCol
 srejxtBLAmvh6cBf5HUVQX+otBmpYWE29pPptZPkml+yQMNkx/vcVchlUGFBjUCqhBwM
 PFOM/mCtOpQiZ0FzR73LQwaSyvNroskbrsM1PEfbra6rTqazRjgUh0+TpGSxSfgNHi6n
 E5Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlIBDPsenYJ9uFrZJrcBRbkkeB1FBhfCAf8TsCEPPExwy4kMSU06gNN4GGO1uuAV027ynDB4leqIw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxsGd7IbDpI8uid3rrzhlvk4UaxfsH96kQ9Ci5c8nT0z8qqGe0
 GqvKM/mdtiVDnkUN+C+feP/LxeTkTZEzlVi9K+fW6rczfYZfKxc9bnGxORRm/JfgNtwHvP8vpuX
 GEjhkDoqt9EwSUSAQvv8/KHEN8EaVcRAskZBlbIiHEpj8qhQOtnSy57gxOddVLwfUGKo0rYU=
X-Gm-Gg: ASbGncuTlxJYzVQpsldEclmUh13s+dbZAx+8kL6rJl5SFbR0EooIEPKiOcTgzHIOEQb
 JxceVotXiCnGM7CdLYqjurGdPyiRWQVKcgjjG3bh+yqRzaDqZf092h9j5tC4y2is0nbDAySYxlS
 mPqtF70GCVA7cVNhnPAGccSaySdSr/4jr2fLEq4ZYB8GyTUNoo6he0JZmsTo6gAxBZ2Pn62LGY/
 S6TmJQz8w3mvb9m/LX9Z/9UnvBEMCqI11zR2bEFuA3GkU43BQAfrSYXTptfhBvmdLIoXqQtMtm3
 hO+5JmaNQubo5YYTkot/ECmqdK5U6jlLhHLlmFepvOjE0KHwswlNYU7oQ9EHkIBq/pCbrt+elsm
 +zEjmrzATe+z7x6ZQomErKMdgnWUEtih3k+5unjK1InMjXrmQTooB
X-Received: by 2002:a05:6122:2019:b0:530:7bd4:1761 with SMTP id
 71dfb90a1353d-54a16cc2ea8mr3544704e0c.11.1757946781589; 
 Mon, 15 Sep 2025 07:33:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuIXd3AXZPQsg6yrUQ/6TEB2uZ3QxUx6thouxmHnQ+pG1W7Rw+xHTFcjX/dtsAxhwpzcsAcA==
X-Received: by 2002:a05:6122:2019:b0:530:7bd4:1761 with SMTP id
 71dfb90a1353d-54a16cc2ea8mr3544660e0c.11.1757946780789; 
 Mon, 15 Sep 2025 07:33:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5c3b62b3sm3659056e87.5.2025.09.15.07.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 07:32:59 -0700 (PDT)
Date: Mon, 15 Sep 2025 17:32:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: display: simple: Add innolux,
 n133hse-ea1 and nlt, nl12880bc20-spwg-24
Message-ID: <bd6y7ckgp6nmnotyfibedhgyzemne7mz7ghcfwf3h4k6xdqpbd@i3zl3uellpex>
References: <20250912185159.1118209-1-Frank.Li@nxp.com>
 <ufmwjrlnaq6tucfpqishzvdpgsxartxgohjrgyr4eccahb5jrc@5ausrm3osivb>
 <aMghlBUIu0z2HqPw@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMghlBUIu0z2HqPw@lizhi-Precision-Tower-5810>
X-Proofpoint-ORIG-GUID: 24M5ki_ondcr1qCcRIMpw5-jwyDn16Jk
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c8239e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=8WGclHcmlfbBJmt5TOwA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfX9yBZgNkPsDZh
 dzD30jV1cCMtLRjrfUSXLsJg9LAHSZ9EY3ULMPmkXxJL/niFAZ9ZIOEzuVPEpZ3dHt8of/U0V2R
 iMmCXLtCFepzBN4Y7YsxT3IW0MVZfMKx4oIKBhuHOBAUW1ncLGNH5wQM/Gi01S1Czt9DCbFyGwx
 qgS/cy8+ho32w150isHCSFMOvT66kRm0VL80gVRyWQKhdCHOXlsFYiTdcg9RkAUlhg1ezKMbFhn
 VOMQUuO9Q5/0JN2Yqj7rVxHwzeuaX1x5OjeM/Pe6VoTZVmqXqRr6XbnooTk/KR+TQc05naMVZw6
 KvSCqFfQlakSbFMIS39HSgTQXol9II6B4YEI6d8ZJjDG0046TqgtIYOasEdkV4XgD95PWImqMyP
 BioEKaxH
X-Proofpoint-GUID: 24M5ki_ondcr1qCcRIMpw5-jwyDn16Jk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000
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

On Mon, Sep 15, 2025 at 10:24:20AM -0400, Frank Li wrote:
> On Mon, Sep 15, 2025 at 04:00:22AM +0300, Dmitry Baryshkov wrote:
> > On Fri, Sep 12, 2025 at 02:51:59PM -0400, Frank Li wrote:
> > > Add innolux,n133hse-ea1 13.3" TFT LCD panel and nlt,nl12880bc20-spwg-24
> > > 12.1" WXGA (1280 x 800) LVDS TFT LCD panel.
> > >
> >
> > And no driver bits?
> 
> This patches just try to fix CHECK_DTBS Warnings for existed old platform.
> I have not these platforms to do test. It is not necessary to have one
> linux driver when add binding doc.

Please explain this in the commit message.


-- 
With best wishes
Dmitry
