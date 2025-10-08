Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CF6BC65FB
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 20:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D20710E8A5;
	Wed,  8 Oct 2025 18:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R2GoJ7F3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630D010E8A5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 18:57:15 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5Hgr012818
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 18:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=p0aFc3N38iuPS4vCQK31JPdb
 4dpa2Mqsozy5bXu0/V4=; b=R2GoJ7F3SYGrVEq4uMK+ZL8vTobBrxcZfv/eO4ww
 6b7LbBTBAph8LzAQ47y9uDcOpdAvKlORHFG+BNBzsKIok6yKOJ+nriAgDhL5nkdM
 ZfR9b4ch6DG1XQNwrnFwuki9zTO43j5YJyasu40KJGGjBrYj3cCBSd0rYUKwqdxR
 OEEApb7RPdUkJU9DsdKLF3LyDhWUCKlmOrEzQK76gEMQAfZ4aEc6kQ2M5TxJaEJw
 tAKesKlZ3bsbj/FHFk/S587AlueDtiRWsj+E29TzK4ts6SmhBOx/3vK5S1EAu9Vf
 YLHkFDvzP5zXLroFfnllR55+PDQB+9SMOY4Zi8DcFiM+RA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4j0a1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 18:57:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e1015c48c8so33711571cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 11:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759949833; x=1760554633;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p0aFc3N38iuPS4vCQK31JPdb4dpa2Mqsozy5bXu0/V4=;
 b=JeAhgpAjD9d78bmOrdCvj1ZFxkUU4OnCzNhFmf0rxCdxNmFeF2ZgYGZWq1Lzra8tJu
 z+3w4KzEhc/Z5+uQ7MQrX05lFR7ks2ckjy342zgtubygEA/9OUcMNIQL8xjH427OeqAB
 8n+glmbOyRb/uPbHDWLiHB5U8JgtKbvPvRvM6BfIFWw0nKZa8KsQpx8ABA795RTQDs6V
 GqJhziHIUXfMVlm6EFgX8HWsIamiPhkrLhxS/o/IiyhByfDtDgZrTqUJP5WsNjDTloQk
 hUyal5UrCOSS7q8pSTLcm+FVq/N0sbi84ZzMSDneDLsW65mEqXSYCbRn1Md5laattHAF
 t4Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6C2u/K3YdL+ADY0r+ZTltGQ9IGqpRFrJ17nRdLJkIM0e2tqRgjqx8CAeDcAXGuflPqGyiDtPkoJI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJICD8bsR/oAjLehY6ne3XYeBB0zYM8shMUa+JKNdGeck7IUeK
 8eUyXy6NQHYgmcRJEQp3v/r0j+rq+rQH1rYfiEh59/TrohSkHcTyPagvsxLzsm2RBfHubLwlxxZ
 5CteHXXkL+vYFvwecmwnFdcbkaJfm1ZfwHPLjI0A3g9k4pLFemKrXW5xV7rTOdjUvsX9GBNc=
X-Gm-Gg: ASbGncvDXG1/HzbLyix5Rga31+aawnRAiNNNbTERqXO5FqLFIL61Be8fZBHG56ZpzBV
 7XcPR+KDRRxGKJk7LTT/emg1Q+Z/jhnnZb1etaP3vngtk3DPy1PBsVnUdqx6tNHuUuOreE472+d
 DFLePqIJxdkzG5WBb1BRX3gwL0Lav/eUO98mPrLZWIQjbgXvmgZvmGomG/vNhMwOcZ1MqkqUgaY
 RDpTLMQt+CMhbpPBFsMt9P2TMMkUo8tX+DompRdYKLN0eeLAZdfhpWfnThiP1rWAfnUB9rFYd5D
 CLe2IyT2aThNTgxIx/kwZZJFX/N7WnbWAs3ZLdzmrOVuCSpP8UmxmPVVbfhUXrmLNL/i/A4acKV
 vB66pBavJ6Z5mHoQEAT6xO75XxD64wJzpWZ8qEBk5PMF9+tKRAnrfAHWZ0w==
X-Received: by 2002:a05:622a:190f:b0:4d5:eedd:688d with SMTP id
 d75a77b69052e-4e6de8a86efmr125502811cf.30.1759949833114; 
 Wed, 08 Oct 2025 11:57:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtgnvDZEe3R26wa60RX9Q/fh5xcAmGuy8cV2NOzK3jPw+TTeGR+oVDeRwF6NVJ0ITQRNBStA==
X-Received: by 2002:a05:622a:190f:b0:4d5:eedd:688d with SMTP id
 d75a77b69052e-4e6de8a86efmr125501911cf.30.1759949831413; 
 Wed, 08 Oct 2025 11:57:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5907ac0d417sm263816e87.34.2025.10.08.11.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 11:57:10 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:57:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC
 with panel
Message-ID: <7askbazrkbny5jlw6cpxcpjyw5nyiozmksoyj5b5momcc7w5hn@r3x6kddatf3u>
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-1-21eca1d5c289@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-s6e3fc2x01-v2-1-21eca1d5c289@ixit.cz>
X-Proofpoint-GUID: 0Ds6oUTaDodKSUGnEK5HImGllYbodyMn
X-Proofpoint-ORIG-GUID: 0Ds6oUTaDodKSUGnEK5HImGllYbodyMn
X-Authority-Analysis: v=2.4 cv=f91FxeyM c=1 sm=1 tr=0 ts=68e6b40a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pqhIxt2ABfSOU_N1PyUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXyxdywpkr98QP
 bWDWPVgtIWsU/5CJuKJTmf6Z+RsOnOo+mUmpWiK6H41ln/FcHzcGXQ0hHW+eyY7CEjwAqVOyfIp
 6lDmaXLCywZniO9OVQS2fx5bl7yKmR6HN6qkjHS+DghQeB8gdcOZLWwoSOmRWniELKXlDda6DfQ
 lEo6nmsMfFHgb3486XKyCMuT4pcIPTfoyc3A9jc7Gk6nHKimSWcFulhSVoWhAhhwA/SDXofL159
 nPZeW3PJ90MIW/8oGg6hn1ePEdjMXhmisRcT1y25I7b4KDU3pyahd5G5BiP0JdBtxbeyx3eig/u
 4CqmsCcxNDf7mOJ+Jnuo17G4kJJo7SRkhxfxpr5nb7IN6Sw8cCiQg4a1J46pyeTVSf3b4NgHb0A
 7TfqbigbcNo/zptoVjQGu1YWoQvO+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On Wed, Oct 08, 2025 at 04:05:28PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.
> 
> Samsung AMS641RW is 6.41 inch, 1080x2340 pixels, 19.5:9 ratio panel
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/display/panel/samsung,s6e3fc2x01.yaml | 78 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 83 insertions(+)
> 

Please also describe, why it's not enough to use defined compatible,
samsung,s6e3fc2x01. Why do we need a separate schema and can't use the
panel-simple-dsi.yaml

-- 
With best wishes
Dmitry
