Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8401CDD1C9
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 23:28:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B836611310E;
	Wed, 24 Dec 2025 22:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m06/rbe/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hMAalT/W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC3211310E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 22:28:52 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BOG2xmn3609962
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 22:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jnqeKfDVEUH7RrIR88HfljemBK9UZki/ZbbnLXfs5xc=; b=m06/rbe/crPqalbK
 uh4vnpL9CD8E7INXhMCw4HfEx8iYczBLZ93py29srR9424RkTc+Yu9HHa5Mv5Q0c
 JSg+FDnZDK2inaQF2y82dQKTugivRmJH7JuhEdR63Ahn1ukaBStAQTeG33HzdE2P
 RNokJsLXaMcP8Gh/s7kXdXpMJCyB8l9fOEV214oZRnhogtKif/jk+/PjAa1x9Fg4
 Crx9f1OSriZhrDc4tbC6E1ItXmY+N/XOQ801h/6D/fNYEaPQl/ovAgiV/xsK+hBw
 U+zwqTezlYH1FjuPxLrlVWoQ9cu6C8baUUbzV9ZT/yrBcaoMhk+sTuk9r/J1lU3T
 AkkfUA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8kburhm9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 22:28:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a32bf024cso64187936d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 14:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766615330; x=1767220130;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jnqeKfDVEUH7RrIR88HfljemBK9UZki/ZbbnLXfs5xc=;
 b=hMAalT/Wrw2bj8h4O5eRRTJARwi75afJWQcSpyGy7JlhrgarlsbhiXjNR4pMHp9GRo
 J/G4Mxg1n09RDcUtWWOyg8+d7TwqLPU2QYeKaAW3FeTFmT6CO/DZV0+kpHPOL4gG80tW
 HoqIr8p8aJ8NPC9K6HkAA6IPcIjwX1HLoyjZy31/Mq1mru6Lk+Zzv/Z232Dsbci13nWt
 jOPJ/mPOrf5nAnqOMSICprKp7jXH/ikNUdR1q/xzVJLyhqJxdRtNXL+O4LpGi/AfaxJw
 wcBI6Zdx6jKsJY3G5SFH4bxcLSo3O1ptVzX22/+niziskScurQIqDPefA93XGhltpsRu
 GvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766615330; x=1767220130;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jnqeKfDVEUH7RrIR88HfljemBK9UZki/ZbbnLXfs5xc=;
 b=Xf/xB9Dw7S0aG1ooZp/2krRWGfTtEOyKAxbRmnJGX4pPn8TtH2Ao+7WTw/lbDFy8ub
 ZTWdYI4zTvJjgk3MYBg4aH31SKLAorVy/df+AoWv6wSyKa/93bpPRIDXr4Q834aHezzk
 4lIuJznpNrANMPV7hdAkXxgbQZs843ruSWKaxNSeZC0/T5ToELY+NoWAh2sxnI21aGvZ
 43YfSPv5EWmxf4QILkRtrVV/jlfYbQHoRoI6IU1cDvEb5WacHACNcmZhDdyyYDZw1lv6
 uT74lFGzLh2YOnuZuFbI4YCgf7WeKvoeHD0fDNv18FhciNiMXRTq0fDp6aNLFxW0Jmkq
 /lgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAkBrnTrs+ozO4PpTCwrTYBv+C68S15ELSSRPC9lbkAoSE21vynX2sredbcVeUEAHvoM3CTsdmahE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZUM8KPuIlnWEEwUnnBaA7Yk+XyTHxtbbfARlErAbfzkyIK4Lp
 HCnIJxRKZuthx3F2PohUSz/C/tX+T4zEVUOjphSrA3U/RWMPR6InTtfsca3pEkToS4A7dycEAYN
 9Yzys0Ez/zFvWIKWVgAQjdGHZLJQafV+G5VthL3dBMn9RaYeqynkt193wlhnqz+XLkRghJOk=
X-Gm-Gg: AY/fxX6hQYcQHy+nt3EuYBIg8HtQq9GLdvKMEkWTiJE+NYr8obPDAAwjq3NQdNEksVg
 RrAmu31UctgIwj94qFM7HasD94u8vpF0o76+f2eMdL3B9H+Iv8C6t4lccJnKHQmIlWzhBHnMYCf
 XnNwD0Pm1F62js8TqDJIhvRSnZ7aLR3wCW4bG0AUHcqEi6R4+bwPWHLG8/Rv/Nwto7vmqQBvZLC
 MCHWRay/+vi8BlSNe2RzJNJffiFxfe040i66VtrxRuPT6rlafnYECva3ZD4BIMKPiZnf+HOBOAt
 qeGDErP4LWHg3Ln7UNsw71aUzpGbzrYT+KfeySayyGKeGqZZZdwU/p3KoRkFTvoKd6I8X29WK8k
 ncXm2Lw/bYh0P1+xa6VVi6ahDyrnWoc6t4d/1s/uTGEMxIDHmN4HVL/8SMQPZn/yFyiDl/0dKCu
 wJgkX8Bw1Z5Lhp6TfbmIAOSJ4=
X-Received: by 2002:a05:6214:1cc6:b0:88a:52a1:2576 with SMTP id
 6a1803df08f44-88d816677e6mr313884146d6.1.1766615329951; 
 Wed, 24 Dec 2025 14:28:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDjHfHLudL34DV3f8CJ7r61XAAinJKO1G9J6E+GUx3WmZ4f3SX+neuLfUYgLL/zzuLkHENnQ==
X-Received: by 2002:a05:6214:1cc6:b0:88a:52a1:2576 with SMTP id
 6a1803df08f44-88d816677e6mr313883876d6.1.1766615329428; 
 Wed, 24 Dec 2025 14:28:49 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185dd1e9sm5197038e87.23.2025.12.24.14.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 14:28:48 -0800 (PST)
Date: Thu, 25 Dec 2025 00:28:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Andy Yan <andyshrk@163.com>, neil.armstrong@linaro.org,
 andrzej.hajda@intel.com, mripard@kernel.org, jernej.skrabec@gmail.com,
 jonas@kwiboo.se, Laurent.pinchart@ideasonboard.com,
 maarten.lankhorst@linux.intel.com, rfoss@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de, knaerzche@gmail.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v8 1/2] drm/rockchip: inno-hdmi: Convert to drm bridge
Message-ID: <h7iqdiolwb5hkqdkbirqjeytxu7h25p6aptspgdvndbv2husd6@mb6vroredden>
References: <20251016083843.76675-1-andyshrk@163.com>
 <20251016083843.76675-2-andyshrk@163.com> <8913609.MhkbZ0Pkbq@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8913609.MhkbZ0Pkbq@phil>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDIwMiBTYWx0ZWRfX+qpdG55WwZN4
 O4x2vRmyQUP7eGujNDQWNhYP9is2zPrrYnjRuCUwIMKyoPmQ4xF3TwI51m462vkj1lgVqbJ9rZn
 ztPjD/9wIhBLbFvtRAiob9CybyHDtTXHYDN5ngH4FClHWiGilvwDP8MP8EVA64blxaC3mBUXw8F
 f5aJAGMLzTwTRzuAdR++7Z6un1gB9yxCLIuFN/ozc+taPhXyC9ktsmKA3QcUn+nJ/MiIU6le7U9
 8iBoO2+z3Xxn0dxPmb9FFoiad87AJhnOVxoThv+pIIkP3ESbUJWhH3/BLfGBGrG2Fto2W1tzHsL
 mzet5c+kPB18gFdoEtoTkNBvLjoIG9pBb9sCmFOoWwnRl8S2iVnxx1c6enZPHpReSgiveDjjOov
 c+19/pTkkuYpjcfXLqSEBEqzEjqtAhlDjGRWcNHiao3YrkVt7gQDHpznX/EZtvyiZSfyiaDlH7d
 P1wOCMl1LScfdeVVyTg==
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=694c6923 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=Kmzl1NW6Bz_df4YWhFgA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: QKVgiaMF6xsIOcP5UboIgxuup4p9mUz9
X-Proofpoint-GUID: QKVgiaMF6xsIOcP5UboIgxuup4p9mUz9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240202
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

On Mon, Oct 20, 2025 at 02:45:34PM +0200, Heiko Stuebner wrote:
> Am Donnerstag, 16. Oktober 2025, 10:38:31 Mitteleuropäische Sommerzeit schrieb Andy Yan:
> > From: Andy Yan <andy.yan@rock-chips.com>
> > 
> > Convert it to drm bridge driver, it will be convenient for us to
> > migrate the connector part to the display driver later.
> > 
> > Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> 
> But of course I would be really happy if someone with more experience
> on general bridges could also take a look.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
