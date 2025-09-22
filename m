Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 867F2B8FE3D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 12:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A986810E400;
	Mon, 22 Sep 2025 10:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7Yzv5JW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B513D10E400
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 10:01:51 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M9BDLq029336
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 10:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XiYvYz09Ku6t3DKDC+/4pI6q
 fS4bj3bJjEj9wOzslhA=; b=M7Yzv5JW0kzo5jqhfuTrRAr2NwtyCdfXVTLVHncP
 tYI97i8LcDHQB5HgXes9kVdNM0fTPrfKEikVW5TvqhegrojVEAyu1/H2qs8MNc1Q
 VoGZZ2bvd/2C2225s7s7U2IXWuu/zxXLD83t1PfAVQ3Ex8YzYzw0wNK9XuifolUL
 qqRXE5YC0eTFuK2tGjUDYH6nA6ORf7KuA9VYoRVFUXn0VWb7pzvJvozCpd3h5gtV
 /REIvnhJ0oIMAcL7e/3p4yZFYBjUDllStnUmYL2t9DGEVn5PNJv3j6oZfV4pORIB
 3OJcgmPs9kjwgyNQzEhh7tJjyNTuVaYGLy7e3Tuz6HfQTA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kk05hf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 10:01:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-84e6256b06dso20750585a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 03:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758535309; x=1759140109;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XiYvYz09Ku6t3DKDC+/4pI6qfS4bj3bJjEj9wOzslhA=;
 b=hUG0BJoGqxCUHcVgdV7uKEzGCwegLJ1Ho9mCNqQruhd7qjmJMmvrmntic5JNmhvIHI
 pRPlJI7M2Bj4ctC+mxR7U40m5/MnRLHvFz8Ikz9FFuEA/zSMLgEZwF6GGXay/4ZsErNe
 IcS4rahkvRifl0rDph5Oxs0/kvAl/Rj+JItM0BV5qOOj0n+nDpBl4Vq4SKZ/soX4535y
 1AtRWkfrubTX+QbJo87wQUBDGClokw10gW8XM41Q5HQpVta9p3LEW25M2p2he5E1JrVd
 qzPSSmU0ukX+A3uOegOOw0mE12cT3rkMmVRVgawdrhCRng0WKU/CVeDhMbI3xwMWct1c
 Zb5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbGG1CaXbzADxRSCDYGYTgTUoEO0fCZa/aBr7KNWxNrhclQ6GOQLt4YRmU5pog8vt8+rmZQXr3e8Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6ejcldsXwmnE9LIUoJ+FwinGnAPWROmCmOEpipz50aaqG6H5f
 9Fzr7N8r2uQ8Dfy/CC4X/aR8DmNjYLAauZ6WmWjNlJtDe5VMO7KcqLS4eldsAqczWhIb2lkdRoZ
 s/6vyM0sR1haLUiG4DhU7LCVfAQzPoIsXqptQKwRTVEnB/J9lxubDbBu2io0Fd4J5rVR9Fio=
X-Gm-Gg: ASbGncs86u1DV05Amj2/2iB0an59iDvAAFRTKPa8rr83aLK2PLjlrdnOH+oKKqoAlCz
 gY44YWIQ2+ppw2mTv0edQvk5Tl2eMsoWBRb3RWXxMeO0aGmyu2acBbAnwfpbVgBrQFjmp+FFCW5
 ufjgQqsYXDPcTWGzuKOIbSRlwNI6JRv+OJT5hGSUGsBNDNsJqhOl4WIRouxZLJHHOekJQNmr4Qt
 i1HHb/sTsPJ53424nocjl647bCngyXrKV3E406wgLWS5YYQ8xvYloxSxwJ/ziDsaB0Rk58FSp/u
 WcVfV57ePuiyT4So9J2HCnqwc01ZhD7EPKO69ornwA9MRj8lwqDPAKIDkIRCL3cJmvG3lo3q4Xs
 GQdNXlbvtTXjQqd5WRiEt/s60MclAdVMTGIpEdo8OsRW37TxdTc3X
X-Received: by 2002:a05:6214:2129:b0:77e:dd3e:a0c9 with SMTP id
 6a1803df08f44-79911fe849emr152956956d6.14.1758535309210; 
 Mon, 22 Sep 2025 03:01:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3dwdmnAT8Ej8kna6zU+1gThqQvOHecwhWI8VJSZtuu94b0HchIuEq9o+Du143hQaVFqG97w==
X-Received: by 2002:a05:6214:2129:b0:77e:dd3e:a0c9 with SMTP id
 6a1803df08f44-79911fe849emr152956006d6.14.1758535308504; 
 Mon, 22 Sep 2025 03:01:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-361a1e077d0sm29027191fa.9.2025.09.22.03.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 03:01:47 -0700 (PDT)
Date: Mon, 22 Sep 2025 13:01:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 4/7] drm/rockchip: cdn-dp: Support handle lane info
 without extcon
Message-ID: <gcgiszrrpqkoi3mhajn4i72awbffqv6mayahmnyswoitxxmrgd@nr2z4cpurbwq>
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-5-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922012039.323-5-kernel@airkyi.com>
X-Proofpoint-GUID: lAVHyO8DuzkYOdA80AjSHxzdKqC4h3dj
X-Proofpoint-ORIG-GUID: lAVHyO8DuzkYOdA80AjSHxzdKqC4h3dj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX9IIx11Z8jB1e
 puNzyA+3xgOIDe98Q1Blv1YypNHNvB0gPwuWg8AxiHv4r+RFHzsLmAwMBP1CIvdzemh9ulOdogu
 wZk2zfn4ZHcFULDJ7fFDY87ZmUvq3LSmt9grn3O+8O5NImnX5wamAjgCyIg9Ili3JXRmlX4qjaY
 TpLoerZVTUPEoQwHQbyoQDdsJqXT47P9zVevLumqWQWHdO9gQCxIjYWpO0+k1Y+PwL1l1gitBjo
 kJdb3doJBFKfuFJfYcZgAjZF4NzmL/4mT/Gy2+XvQT2wUroRIhZusnJXOHFfIbfiAqKyXnerwh+
 pWIsvRYE3jKwQYdNEgB9yqfRRFmUeIOGP3YN9Fo5IvOU1PusMdzAb/BBctpauK7aOiusExcGh4D
 jhMvIdSo
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d11e8e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=k09sBhBf5rVv_DnywOQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089
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

On Mon, Sep 22, 2025 at 09:20:36AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> This patch add support for get PHY lane info without help of extcon.
> 
> There is no extcon needed if the Type-C controller is present. In this
> case, the lane info can be get from PHY instead of extcon.
> 
> The extcon device should still be supported if Type-C controller is
> not present.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> Changes in v4:
> - Remove cdn_dp_hpd_notify().
> 
> (no changes since v3)
> 
> Changes in v2:
> - Ignore duplicate HPD events.
> 
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> @@ -1120,14 +1129,14 @@ static int cdn_dp_probe(struct platform_device *pdev)
>  		    PTR_ERR(phy) == -EPROBE_DEFER)
>  			return -EPROBE_DEFER;
>  
> -		if (IS_ERR(extcon) || IS_ERR(phy))
> +		if (IS_ERR(phy) || PTR_ERR(extcon) != -ENODEV)
>  			continue;

This will break the case when the extcon is present. It should be
(IS_ERR(extcon) && PTR_ERR(extcon) != -ENODEV)

>  
>  		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
>  		if (!port)
>  			return -ENOMEM;
>  
> -		port->extcon = extcon;
> +		port->extcon = IS_ERR(extcon) ? NULL : extcon;
>  		port->phy = phy;
>  		port->dp = dp;
>  		port->id = i;
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
