Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78046A75BCC
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 20:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A496B10E34A;
	Sun, 30 Mar 2025 18:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ChsTTnog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0067C10E34A
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:45:17 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UDeYaV010356
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kA3fRtGt5PPqHVCStX9+/pCX
 flRsMU5SNq9nmFLbDI4=; b=ChsTTnogQRQejWn/CbuwVzBEPChx70AQE/gxo7dP
 nt54sVfZlT8TRd5iGpXRSydbZiL8PTOsms63+iQEmKMF9y1BUAWuBt1NmSfsz0t8
 CzqkqUJ7dAcqTiruzC7ANcyNLumCnbf8f3qGQ+hCSFyNF+Z2/FGkseUT8kXjBPri
 KaC4zmNNCfeoEwmmJYHwaXaatPM4aX+nVyXNDpg5ueAk9ycW+pTpyQeDMl/eaIpg
 qCew8SvpZFncjhs0tdLs8zvGoFj+DfNhFeN3/YwRhbSGRu2MVFeRcb1/0Bq0oTkv
 zQ2T3sJWqE1CiJf0VfQQrKARXHFd44soWS22G1wCw53YOw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa1ntjdn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:45:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5750ca8b2so631147085a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 11:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743360316; x=1743965116;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kA3fRtGt5PPqHVCStX9+/pCXflRsMU5SNq9nmFLbDI4=;
 b=AwcBCi8RaLwAnaBN6gqYHO1V7N6jyGXKohMZUi2lX1TldkdqJQYxrv9jWlFjyBeFQ2
 WHYED1yx+zBOOHdsWs94x2prhxQTjZsO671N1dc3ZqhmNio790PTdBHZOZCaHAMJkS31
 zRBh+yz+VYqMaP25of79PaHD9ssPIKokvtWTOODutfUaJdbI77fZFeb5vD1N5gtQdFQb
 aILQZbOoL10KhWMA7tfDjjSfEkhdlzpfHY+UqhajIU2laVDXmTyo9tsfGsYZMHzX+wFL
 QaEEssyPWt8ImFBalYP8DVwM9sCJWbG/RF1jIknaYfDgMW/B9B68kdqGNKVW6vov4KLZ
 pStA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgO2dYNxrAsP/iGh2XnkbK21Nz74EcvWZqDx3xVN0blP/S/yGvSOkC13JTy4bzXnDmwp3w25vaAJo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxObn0jBlcAXtlgGEC0IXZVXVlSYC37clykGXqfPhzuaqi3UFvw
 /EhcuWK6uLITfXmwHloPjymFX4PQitTKvW8rF0ZwaU6UtWOlKg5WzXadvV/R3skMpLE0lPiVobi
 YEphBgWjhNhn+3qMzkOq7EPrND10ZZHwgVPNfjk9rM7c5TctBv/Hm9bkOcEHnOA+3jNE=
X-Gm-Gg: ASbGncsMrxFCzj9PQqLIvZqgFYUqSuBqWGD3AE2XO7EqersMABjUVhxllQ4ZOqJgtwj
 UfL/y1z0Ib/AY8bKAMbyuElK++gCHTZFKDp6eyc/HyflOgcpXSEAbzWC+fXzFgXcvevFBKs+4Ob
 SFZK9u+iGYh3irUSaMdmou8Eu1M17JPWrW6y+z9gjINAKOUJQp/k1ljFHNfsPmGKQns0Kuhbh68
 Lv2vOjpu+Zp1smuXMhTFEhK1zhlxGaGFFiqO+uWyiYE819gZdlqLhg2tuo6GYmJKobJyUGTkIzp
 nU9q/knLjvlNiyDqfrhEW0xZ/uwHkxzTXlOCCzq39nuxXfimlBQYBWoUyj8DAX+qYUYGsuippoG
 wp8c=
X-Received: by 2002:a05:620a:31a9:b0:7c5:5692:ee95 with SMTP id
 af79cd13be357-7c69089247cmr1008621285a.51.1743360316101; 
 Sun, 30 Mar 2025 11:45:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsCtO1cvYPGTteGUDG+A9n/YJSr7VDFr/0cxL/97Y6BO6mO67qDhJxto0uZ0GzsNsZ73dipA==
X-Received: by 2002:a05:620a:31a9:b0:7c5:5692:ee95 with SMTP id
 af79cd13be357-7c69089247cmr1008617585a.51.1743360315788; 
 Sun, 30 Mar 2025 11:45:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2aa8bc1sm11767311fa.2.2025.03.30.11.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 11:45:13 -0700 (PDT)
Date: Sun, 30 Mar 2025 21:45:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] drm/bridge: it6505: modify DP link training work
Message-ID: <zhk4d26sj6xs6yhlgqpwcxysggk7un2a3ylwedj2ahjdjttoua@4sxrq7jdxfz2>
References: <20250326-fix-link-training-v2-0-756c8306f500@ite.com.tw>
 <20250326-fix-link-training-v2-4-756c8306f500@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-fix-link-training-v2-4-756c8306f500@ite.com.tw>
X-Proofpoint-ORIG-GUID: 0V1BkusKx5LpOfa0mSuYdy7MiDmgjf03
X-Proofpoint-GUID: 0V1BkusKx5LpOfa0mSuYdy7MiDmgjf03
X-Authority-Analysis: v=2.4 cv=MPlgmNZl c=1 sm=1 tr=0 ts=67e9913d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=Ns9eNvu6AAAA:8 a=EUspDBNiAAAA:8 a=37l_GJn86sCRY8oQ1kwA:9
 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=948 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300130
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

On Wed, Mar 26, 2025 at 01:34:16PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> The DP link training work include auto training and after
> auto training failed "AUTO_TRAIN_RETRY" times, it switch to
> step training mode.
> 
> It will more efficiency that finish link auto training,
> include retry, and step training in a work, rather than
> re-schedule train work when each training fail.
> 
> Drop auto_train_retry from it6505 structure,
> and it6505_dump() is remove from link trainig work,
> it takes too much time to read all register area,
> and is not necessary.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 40 ++++++++++++++-----------------------
>  1 file changed, 15 insertions(+), 25 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
