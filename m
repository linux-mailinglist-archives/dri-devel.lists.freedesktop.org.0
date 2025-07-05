Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7924BAFA141
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 21:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FD210E235;
	Sat,  5 Jul 2025 19:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M0wv6lhy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A29210E235
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 19:03:40 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565IZQl4024416
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 19:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8q4VDNuv+lTz++Hj4cg3JRc3
 ES3pigSZR5L1Dth8S6o=; b=M0wv6lhyLOk9KjH+anExLUf3YZ8VeCwUOwdR3Bo7
 zAXwWPDqWFqoXejvzsO2a/7VzSaFfLt3mCK5PMbXbeXGjuJJ8j7woXhZNoUGm2DX
 vuxdMY708L5HqtCOCp9WvF94Q67g5g0koMVlbLXGON+VlIPd0KIGOAB9MO9U2G6R
 bD45Tx7nKuOWo2xZ35x1qcdK1JLTe0B28huBT6ckn9WMUeaHU6FWxU3UMTyNln0X
 Xm9Skzw070r5eqrHycvlI0UHPU2J9Hzdb87Y4lG4N6APE+4UYDo183TlvZc73xVJ
 x71VwsW2JGJJW9ssdr1WZp2PKr+WPRngoDSPvMS5n0WlMA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4x9umu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 19:03:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d097fd7b32so395040385a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 12:03:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751742219; x=1752347019;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8q4VDNuv+lTz++Hj4cg3JRc3ES3pigSZR5L1Dth8S6o=;
 b=pvROqaaW6B2S58B/jeM53pS2Eum/M1XGBH33KKdfXsUmeYaay664OlO45K5MNU7cKl
 /UdsqDmZo6u449zVaYRWcaPjbnPDTo9s20shf+zEoT/SdqmYQGyACJW+JneJEPgEWwG5
 TTpmhg8OBsYFMcqKVPvi/kwt0AaLuYOb7TK6ipzDeczfSbJGIe/kzX++HERtC82vnfUA
 uOvA179mpGEXWwjkm/GfAUBGN4bug25aKMysh/71vjnNJj9Pp5r3crqAms4QjFxQxhwM
 v6LQUWpKfZ8/w63XlEqsodMr+iv80hysuw48sj/hoqrV1/2QTRT3XahzfFn9BOuwY+0D
 uDnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyGMQAwrvgfjgyg6qOBw2W/uJGFLqbYDY/tDSQ10WWBVvXEjy4Cu9343IOxfi57V3P5/ALS9omswU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yza0jkPpfiyeoz175SqIlgMNB+CBCdoItZUi8nPpVdTXHwJ/pDB
 VGFQUpl7/nBtaiOZ0BrIYuVNE3acqmhVpWPVtz3kT/0TsidQxo8cPtRz8NCW6LL8se71QFmYeZt
 3tzwS9UDq1P2pnp7TODZBdRKIibRruaXrfzYynj+A+YWGpnzh5mJt1WvYu5J345BPvrVQvRQ=
X-Gm-Gg: ASbGnct91ggjX8taBwEhoQq+QDsxXgMtyZjrNLU6P/1vVTqgpKzG07zNnwAldVSOrWJ
 sZA5ZlOSFNCMHtlIiZoKsqQINtBfmN7zcFK/gWIj1jIpuMv/6KEpyTthJeXSv3yNPgFriHMGRii
 HE1HN4L279f6Ts+izY2EB1LTP5JrKgn952aNtMkZIHLv+2jGUvxVIjVzB5EyMOHI5g7MScdC3jE
 8shWrAEWuOaeqHwE+IV+zH3LS6zAMr+Bf+eSGC2ykbGUMwYjE0U2hu/bv3tPZAoYdNq3GDWBRfI
 PvTF0PVL8/1KTmruJsUYFlMq3TilMxPUyxv/NmM3Rdpu61Blm1YD67dId1rPWDqv4i28aL2LoFD
 e5dhJym+2OcYV/bZ8beQPxum/RAK7epeHLbc=
X-Received: by 2002:a05:620a:bcd:b0:7d3:f0a0:ea5f with SMTP id
 af79cd13be357-7d5dcc7c62cmr1103491585a.22.1751742218981; 
 Sat, 05 Jul 2025 12:03:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF19XFlEGYAHUbGIEthO/IOLfFvQhB8cKUCELKspVjO4UwVcaSNb9XwZOa0x6gNmC/3nkfiog==
X-Received: by 2002:a05:620a:bcd:b0:7d3:f0a0:ea5f with SMTP id
 af79cd13be357-7d5dcc7c62cmr1103487285a.22.1751742218571; 
 Sat, 05 Jul 2025 12:03:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55638494f78sm678524e87.129.2025.07.05.12.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 12:03:37 -0700 (PDT)
Date: Sat, 5 Jul 2025 22:03:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: Fix kdoc comment for
 DRM_BRIDGE_OP_HDMI_CEC_ADAPTER
Message-ID: <z4lprt3wo65mhnkptlrw23pd6m7coamtvj244zjwvltpbe2htu@bigyhe6u6x2l>
References: <20250704-drm-bridge-kdoc-fix-v1-1-b08c67212851@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-drm-bridge-kdoc-fix-v1-1-b08c67212851@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEyNSBTYWx0ZWRfX/QDwXv+swcO+
 w9BNS1s93jMaxYagSs/GesaOiXYAZhm/bjaR39M7CjsbT4R+u9Og35LfaVV0OWtdyQhBOjOC2FC
 2jhEbyhbcXxMQl+zPCzzFM2QjELPdlspGb/yk+lW+/vY8g/TsR5tybeX/VEfmtnMl6D2HhnZ0b2
 9MxBKd0Jf/01TlDbblRnf90N/Tuk3C9hRdTRwJYUqL+XZyyQfd4LzMJrFl7XxLOMSfh30GODJzI
 wNYg9U7J1tkCLqyme6o8r8gKrY83lE48VDAiCYCgy3A30a69Alhh6DCiRVhhFOOi1SI8ElGiVTz
 sNnT1Mp6uM1iRbduHH5YZplglGAqXt26r1fyfWAGI8LymvqUfO/Q9Ucpo+veLbQHKYR4Z2Onaif
 6a2JfNc28U47hrtzGH8s+/XxskrmIqO4nhe1kIJ8Qg3OBDu9T8VdS+A1whQClCEMbTojuLiZ
X-Proofpoint-ORIG-GUID: Z1mSdJkeCSvDVh4XBz9vBEMaK-KEkEYd
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=6869770b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=wdqdDu6gfy1NOTDC_OcA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: Z1mSdJkeCSvDVh4XBz9vBEMaK-KEkEYd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=884 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050125
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

On Fri, Jul 04, 2025 at 03:10:45PM +0300, Cristian Ciocaltea wrote:
> Correct the kernel-doc comment for DRM_BRIDGE_OP_HDMI_CEC_ADAPTER member
> of enum drm_bridge_ops.  This seems to be just a copy-paste artifact
> from DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER above.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  include/drm/drm_bridge.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
