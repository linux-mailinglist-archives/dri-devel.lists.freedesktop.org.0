Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7527CAA7E6D
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 06:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BCE10E2A9;
	Sat,  3 May 2025 04:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QB7sVZsf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E3710E2A9
 for <dri-devel@lists.freedesktop.org>; Sat,  3 May 2025 04:34:13 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5433RiEi030272
 for <dri-devel@lists.freedesktop.org>; Sat, 3 May 2025 04:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=FRHnCwMP8vhcj5PnuVB1xzbC
 QCSf4DjArkeySLBpK0A=; b=QB7sVZsfQTCgW3AICbnLx87aYv6sTr5FIegbs5lW
 Qor3n68tLChW0btMz5wxZFXZbQ/lOtgVBaJXnex1MgAJbMfeoKCQo1MFyTXUHNom
 p8wOybQmaGK9toHAfwMI7tQ8ZesmvgsEJ2+eFfU3gQPAbsXih8B2dEyAIypFFrIf
 6xCUr1vxX/WAbLUDC0TgOFRFmjFIsU2a40K9t3z0afV94ngXC9awXkZkr2UYIrdp
 RK/ez6kVg62kPzYlxbxyP/mOGgHkNite9MFW8YgEJKsTn27E7qdcRV9cR9GExF8s
 4uHmelGi0/oCyrqaLcYLwRM7o5pxrEui+asCvYEPByv/sA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9kbg67w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 04:34:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f2af3128b0so49482496d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 21:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746246851; x=1746851651;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FRHnCwMP8vhcj5PnuVB1xzbCQCSf4DjArkeySLBpK0A=;
 b=OURx6TH+stz4Rj6cZhuB/jM+JX1k0OFoM3aqZad8A3gYMs5xgx+Jrrl4yYBOiSnLja
 k6+cZpSFcy5oymDV4uyQu/B+Ava/GmZwwXB7rrpf6B/fuVYG2cY59H27lERAHGyXsL/W
 KRaxiNI2EXVaQVvjqzecE8OBeKW0RLRofWMDh8yje2WUnInimE2c+rWA0Vw7tkBzLf6T
 ET0VjOp/CfqjSpqrGVymMnwPL8cOdK3TnmN4yv2+xM8LFWKHsO7V3Oi+rcrkJkmhM4zL
 SHdGur8CC3IEdSBPkN2x6rOaMft+eHJPTklNjHDcV1guysGtos5qVqmRoBo0DtvcxyOo
 mgZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHqjCkw0yc/yV08DwXGxlaoO4CJaa9Ka5pZUhrkK5HAAU5ArM/mFFZy9FkVCJ6prwa3JNXz3oGRgU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHTIQIuMCDIp/ezzQ6KL06ZMHDPcwSLe2Ai5cByJp4D6QtUNGI
 MMNWKjkXL/5jH0UTtC6yhFaRlhkMzDDm87Nh4+wzI/E83t7nayQnemrR6r6DHN3rV6RLviww9Y2
 ENKhMBJ0xpUKtKIdEZ8wsTEuXti8i+kyPUxxdd6GEkpkEuKduCET7BICPqjD1Ue+AacU=
X-Gm-Gg: ASbGnct+ozMDCzZUhK+O0I8WlIRKpsthRqi8X8/ObFKmLykFu5WwTqP6xBTRV3ltBNK
 VG5drcZOUhXN3K2nES9Gt30pePLAjAc3YxfjZiVWaUlM8sZxWouF534FRKebJOrUzchJ+AMlkTx
 4HiciGaWQxS7u5HGoNUVGhMQ+A8KHQfp0Rf4CXdBsCuJ7YasCmi0Yuz68gOM46D0gXmpLc38xxB
 IrYR29jUKHZ+kDUgFbUUjhcpzwMkdKMnMIxVznNIvahk5VtjTHlXLzjCbZM5BzaNnxpcrynmSNk
 QTse9uNntgmllglHYcxvLNxE4tzv+aN5HP5czMm6I4VyW+9v45+9PWX/7gYGID8i6NPxF4hS2tA
 =
X-Received: by 2002:a05:6214:b6e:b0:6f4:d60d:dd29 with SMTP id
 6a1803df08f44-6f5157301d3mr92485376d6.5.1746246851599; 
 Fri, 02 May 2025 21:34:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdtTMunWJIdNzuGE3JjLa6Bo7EoaBJJr0Rr3GrubyAqm13CmOAIBUkvnjIlDM/WcwlSPlOkg==
X-Received: by 2002:a05:6214:b6e:b0:6f4:d60d:dd29 with SMTP id
 6a1803df08f44-6f5157301d3mr92485046d6.5.1746246851197; 
 Fri, 02 May 2025 21:34:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee6ccsm637203e87.122.2025.05.02.21.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 21:34:10 -0700 (PDT)
Date: Sat, 3 May 2025 07:34:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Lyude Paul <lyude@redhat.com>, Andy Yan <andy.yan@rock-chips.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Vitalii Mordan <mordan@ispras.ru>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: cdns-mhdp8546: unlock on error in
 cdns_mhdp_atomic_enable()
Message-ID: <f7w562h4ulorcxsnukbgdcizeg3g6yfhlst2o3467wihqnkdn5@qaw3kiicavqy>
References: <aBHZBjiOVkI_8Shg@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBHZBjiOVkI_8Shg@stanley.mountain>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDAzNSBTYWx0ZWRfX5OZSf7cY/UpI
 N6X59TlAPYGIG5mgLvROghFuRtLawUJlMgpip/hhdHvkhbmUkZZGbJ1l2zlN4PW3lQHY2W7Ycjc
 39UKGx6q4Ix2v74i0YR0s6Ceh3P7++tBzcBLaFyBcEBX53yunBUQypKkJIfc376lJewiqMgThnK
 jJ3GdxFR7v7Vg+ZfI4m8/fiaoI0uoDjRwl2AG2GkgE7PKX4seDN4jxIR0R3YMAkdETLGikIrugu
 lUneS1HpZwA/5W+GmBaxlR+WPlsYrgbza2xib3gj/DnCChDMP1qfijQJyVDeL5pOe2udBZYh8Co
 IUVGA78NilpTiLHYqNQ4zeqO6i3UovlPhKJw1AR9jNCRBRENfWyL/tERAbOVsUf7b0edM4Q6//A
 0re0lt4UoQcuRoG7zgWzZ8SiqiFyagKc83NATpPrbnL5H2Ym9xDfk3ej43SesWz+IWt2LEvQ
X-Proofpoint-GUID: Kobrbjtuh_ZpfhCC3kwBcetOHzHzha_q
X-Authority-Analysis: v=2.4 cv=FugF/3rq c=1 sm=1 tr=0 ts=68159cc4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=7MWD5bQIOqUMkJ40eKAA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Kobrbjtuh_ZpfhCC3kwBcetOHzHzha_q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030035
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

On Wed, Apr 30, 2025 at 11:02:14AM +0300, Dan Carpenter wrote:
> Unlock and reschedule if drm_mode_duplicate() fails.  In real life, the
> drm_mode_duplicate() function does a small allocation and those never
> fail in current kernels.  So this doesn't really affect runtime but
> the missing unlock triggers a static checker warning.
> 
> Fixes: 935a92a1c400 ("drm: bridge: cdns-mhdp8546: Fix possible null pointer dereference")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
