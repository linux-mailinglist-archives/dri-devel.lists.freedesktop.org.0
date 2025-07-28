Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6502AB13EEF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 17:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1A110E037;
	Mon, 28 Jul 2025 15:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YnOzpmvy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD9510E037
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 15:41:55 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlOZX018340
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 15:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7j5Mg8G551vXb2fvdLo7IXqKWF8nW+MN9Ie++oA4Wlg=; b=YnOzpmvytC2WkhbU
 B4j4pPur5j4QeptVL9h/mLo87zj6Kz/4eoebTZqUgxuH+u54u6VZY6yFA/np6Xn6
 yLW5zevDTU6f7SLhPi2tmIZseQx38xmUDL/ZfK+TETxuEn4Pir7GcU59sa0wjz/q
 ojabnigeI09W/H9wPmlH3bJuG0n3lyVQAs7IR4voLjgpm5WA3Ichb6kygJora3cu
 zeljvGW9CQQjGCJeoaOPcecRF6gxpU7lE0uF+lxrPwvuPtUfjr/+T440VTBga3BO
 IUSeQasU4WL3kA9FeQmcv32hlzxUAKuSxdquvHv8cTuVVnSv6r86hkxm8x0izXIM
 ERT9DA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbkw1hp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 15:41:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-7073a5f61a6so29882286d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 08:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753717313; x=1754322113;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7j5Mg8G551vXb2fvdLo7IXqKWF8nW+MN9Ie++oA4Wlg=;
 b=IXjW0+lByPs9mYmJd9orQFsdjMbCTrt6TIzZxnUQgb+w10Q4A01gvIxPiueT97rx55
 gV0mG+8EQI+YC8Ku7pbOE844ggtAX7+nuisKlwlf00n0bzCEUs5aVRxCSfZhCg5JOLvn
 tONfoWAIbcF7lksySJu8CExO0BBtJq1WJLRHn+UItEwIE+IU97eLDv0HJAWI/lr5ms+J
 scSZ9k+t9mxVYhoxDieopPqaedEACt9PAV38ytfQpm8rMuVgghRg+QJTRL/t+GtBbXlh
 iBjsZX7KbM90iBp97uD4G9RvcES1bLetl8ya5ynskQaQA4kqNHeh81z/XuFdNtgJ8YCs
 4pHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXol4eK43ooiFx8yar5A82MgJO07li2qGdCgMivF1kHTpC6940zTy8f2hR27GjaY6ii2Xh2XOhMwEQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzs52qzrrGkgSUF/FmNGU+/cU1f9sxRKETeZGEzlb43Kze6JHv2
 CdxENQlzTudTmhQPGfGuyACy8MDamcqL++qYF784lts2DyZFW7TE8TpDN7M56ijuQq6fgiX6SYZ
 niFnA0wSmoRkmNiCIc3h+bye//f/kkkCeW42YAQrx/JeNtDsBATdKc9Cop5MrLB0whRXzrnA=
X-Gm-Gg: ASbGncv2czbTxhCW43rDkDJkDQ6YuQGCGtn9NXAaqM9cxkKqQlC23r5UQGvOznfrBKF
 1RYctsDL6YSwowqngdsbBA+ajrZqUmXjvL8L5z2cvXyRKcQNjPYaNerDdqiqxwmNk9dW43iA3JR
 fXw3qouQO1ZXRYmliyId+13lztCdu+9/oZXXlEgRNk+S0/TZk4UvB1+RRpg33ySQN4irP6maTlO
 08toxdOUm9urxzuwNVTZEQV14DSS7T8YMz6IM3q8+tfBBNKI+KZ6eaD30YAvzdIO0cwbWr2D+MZ
 EOCHHOLmtjqPMQJxsRvoy4VNAwaDX87CxCYXO2cZ5JZhEOy+Z4Rn4bHDh327Q2NCnwPP7dUFXqg
 bz3ZK1A9usxoa1gCgifFcgfAdiZCU4UFiEnjBSnpcMwYHiC8Qtmoz
X-Received: by 2002:a05:6214:2488:b0:707:4fef:468b with SMTP id
 6a1803df08f44-7074fef495cmr26841476d6.25.1753717312949; 
 Mon, 28 Jul 2025 08:41:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOAm27xnvjCoTPX1PfqanlpxIU/37UU2TzXPWd1qLty3Pje9we8zuKNFPEu4lW3V9WCb1jGA==
X-Received: by 2002:a05:6214:2488:b0:707:4fef:468b with SMTP id
 6a1803df08f44-7074fef495cmr26840746d6.25.1753717312155; 
 Mon, 28 Jul 2025 08:41:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b633ae411sm1315965e87.203.2025.07.28.08.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 08:41:51 -0700 (PDT)
Date: Mon, 28 Jul 2025 18:41:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Kevin Tang <kevin.tang@unisoc.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/12] drm: of: try binding port parent node instead of
 the port itself
Message-ID: <szwbsymzms672t65u5z6hqxeyfx5t7ikqwxswwdnkqs24loc23@4riccvgkxke3>
References: <20250719-ums9230-drm-v1-0-e4344a05eb3d@abscue.de>
 <20250719-ums9230-drm-v1-3-e4344a05eb3d@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250719-ums9230-drm-v1-3-e4344a05eb3d@abscue.de>
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=68879a42 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Wb1JkmetP80A:10 a=Ih1c1VdhKniI8WpLwA0A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDExNCBTYWx0ZWRfX6Pr7J8DTko/N
 y7mSzFibB5UgjOw9ZTQzQlVFU9HX4sI4XEbI5j2ZqzKOPS7xT2efvoyJfZ3geYHofkpcXm4jIci
 rYWmXUbtKpDX2PecHMvN31VXZuSZSBm+fSqmcb+VMRqZy3Woyi1+slnaexmDTdYWJb8UapZpmGe
 5Jr7J4sadqBfCcv4bCyqcIQEB5cwQdnkLiaymXwOVKPx4S/evMQdBmAwNv5KEIJHwmTzNexam6K
 K5gVkYjhc449c7Edvr4f9Ke61YS5A/4qwRBC3gwy53puLp1swRXTgcUHHIFltM/rigVVwv4fBae
 BGwRXOG13C6w2gntxqXSym2lzopekp2CaKyGg2Yb89oIfYj+ko8BVkIxdcItEAmAjhqiCMrsvRG
 JDv0Q6CS6MpKKIR0hDxpkaNUXodMrULXiL+T1vV+DMd0D402lUu+6KCESq/aT55VTP4fCh4P
X-Proofpoint-ORIG-GUID: fPPbOCpqMCdla_cFIovoNWoWbE_Qb0YQ
X-Proofpoint-GUID: fPPbOCpqMCdla_cFIovoNWoWbE_Qb0YQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280114
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

On Sat, Jul 19, 2025 at 02:09:39PM +0200, Otto Pflüger wrote:
> The drm_of_component_probe function is intended to bind all devices in
> an OF graph given a set of ports linked using the "ports" property on a
> main device node. This means that it should also bind the components
> providing these ports, not just the components of other ports connected
> to them. In order to do this, it calls drm_of_component_match_add with
> a pointer to each port node after checking that its parent node is a
> device.
> 
> However, when given a pointer to the port node, the compare_of callback
> does not match it with a device node and thus fails to detect that the
> node belongs to a component. Fix this by passing a pointer to the parent
> node here too.
> 
> Currently only the Unisoc platform driver relies on this feature, which
> was previously broken and is fixed by this change. On other platforms,
> the "ports" property points to ports that are not part of a component,
> i.e. the components only have indirect connections to the main node.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>

Missing Fixes tag.

> ---
>  drivers/gpu/drm/drm_of.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index d0183dea770308e77f05da364ffe087d53f3be36..b972facc2ec3fe40a4e10b5d7178b5ac8c0158d5 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -132,7 +132,7 @@ int drm_of_component_probe(struct device *dev,
>  
>  		if (of_device_is_available(port->parent))
>  			drm_of_component_match_add(dev, &match, compare_of,
> -						   port);
> +						   port->parent);
>  
>  		of_node_put(port);
>  	}
> 
> -- 
> 2.50.0

-- 
With best wishes
Dmitry
