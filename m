Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E599D0F71C
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 17:33:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DED10E0DA;
	Sun, 11 Jan 2026 16:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fZqW9mr1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iYHfuax9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E78710E0DA
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 16:33:51 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60BCQjfg1910415
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 16:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ibYGGgzayM0EILjISWp39hVy
 IE0nPFe0+icI8L05HBk=; b=fZqW9mr1upaRxSab+dwo70HgD1aTNd+HNiW1vzGY
 N1e4LHQH/Pb25Dz9n8KNAejt4lg8a0IzCOlSZWy2r+8wognBnDulnmwLpuTlcFKJ
 S1jtbNA/aAulcAd9FXG36w8Fjc0E11JQRHXucrKzPYziD2l1QpnqGl3DK4ssgWsj
 yt5oCIy+YNFbpXLdDMPXVZTq4OunkCix2lih6VGSGkPEKF9m1VQSU7Lx405C5vHO
 l76JNSitlQUh5ciokJJ2rPBlCQlaXMAlEQIvpXrQUScYV5X0ukucyLcWknEPTJ7V
 TID9xyOzdit1kCmWPOUL3AL05LrBLNQcB81Sp+ymoduU0w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkf57aeem-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 16:33:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b259f0da04so1546921185a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 08:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768149230; x=1768754030;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ibYGGgzayM0EILjISWp39hVyIE0nPFe0+icI8L05HBk=;
 b=iYHfuax9fRYrkttAPebZpjkZvgBsAhTp8LVatRX+ohCpXPDiz3TzYzqs+MjHzVlEnX
 EGZWuPWHcS9u0pnolTmqZ9aZp5xnYZG1bVxl3IYF3tTXjRDrBIt5UDpcywCVBbs8Lr1U
 aClsFVBiC5mCurTABdOU78PZwblqMILVl5X1JogB4uejPa3UgPn05oy0BBJi+fJxkCY/
 /ukmxVqTRFDQ6WjLIPELezpzL4dpl2IZd8WJ4X6uSDSsop9rcf/QAQ5iB1vfD2Kei045
 0g9jaMd0DDmHDW8tWyHrpeEtHylxJ2VjlyYAeQ2rW3fvRD39EYx/HcrE/yVj5uIJHoBq
 AEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768149230; x=1768754030;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ibYGGgzayM0EILjISWp39hVyIE0nPFe0+icI8L05HBk=;
 b=bTgsWTNP+vVfd2FKBu4VmuqYVpRGaHbJeQuC4Cz8XOb24Fu7ZEW9au1DjUhdaNpC7a
 b4ZPXUqYlkcW+dcW34Ls5pSEzHf3J1HdwqzmURhxY2zKX8FUibeyK12s3kHiuWuf2xEZ
 A+pr6r35xBbdEYdXCxA/5nVdZIRQz/mvY4Sdn5Ulh9MzPFj6MBRCHPoUHFyUyvYkNCDR
 OeBjcmeJoUad+tB5hc1atUkX6FH+yNI+Nh2znE14vNEF5oM6EPa5Ts4zi8w2YSKospZj
 uNE9BsQ8b/yfFx3Vj19kaeZn6T3TjQHIV0JpdJqVeltGcCq7UdWuR3DJgV9FXzCwXia4
 IJPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1qH4GmWxgLbzccFnAIg+tyibC2t2YWElqfz1igm0YPQFE3yiAO4xq552MYoCML/Vj6Ivp1Rb+HwA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyt97ym+cwxS3j7WFhStjQmMu0paVS7CLXe7ia/9kyixjTDf3mW
 HSpoV0BadQQlG34PFEfZaXMbWZTVQmRaNW6xtQ/S9hqdPqzpRD11Y3xD7WXtgZ245uX8HKvv3PQ
 txXIQApOaxuNIi44n4/j/m97CwLmo4ELBdkzqjia/omFYQLWpB5poAUkZJHLC3RAikslwbHE=
X-Gm-Gg: AY/fxX4V1zteZ7HuAuJcPYIEmRZ1S5jIJprJ2JNVrsr38Kb6XQ2Dd89yYiYc9uOAng2
 CR3wnJxPTJBo7sIXFiFAqhj3p6K4FbLt5O2q/dRbwaWOm+ykvl5qGF19XQ86YJaZBJTgEGkUvuA
 RbvmdUE+CYXa4c/MxDinbU7W2syweJMgTMQzH+y07WH/L43yOd7zuxZ1XZJG8GexYOSbRoQlgWJ
 Wopl2cijAGa13S6sGZcRFMcw53u67LYaIzvthmw7Hn0LDDMxoDWK0q+zK7PEM/Y3fQ0rOCLaYW0
 3LWvjq04+F4QRU1H6+Pdj3izcPYYYj+QhOsmO7LYxShLC5En5E4NjI6N8NLO8+Qm0Xs8AXNc4Xj
 sFXi/0nYbLC80T4xc35i7k8Bu3kCZv0xM8cn8yg6dA5gJak2YPxtlFDJWdMalPfv2WFsg9eso4P
 6oG033L51AvRSY7To5aGPWVhY=
X-Received: by 2002:a05:620a:7101:b0:891:3606:7f3a with SMTP id
 af79cd13be357-8c3893ef6c5mr2090904985a.45.1768149229644; 
 Sun, 11 Jan 2026 08:33:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEToHbpw+hr9+qEQN+K1qNqx7ZI5hGq0H31dvEGIql4teJfxCRYmFrdPOB81H7r1US8UTWlnw==
X-Received: by 2002:a05:620a:7101:b0:891:3606:7f3a with SMTP id
 af79cd13be357-8c3893ef6c5mr2090902085a.45.1768149229120; 
 Sun, 11 Jan 2026 08:33:49 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382f071d472sm32599991fa.38.2026.01.11.08.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 08:33:48 -0800 (PST)
Date: Sun, 11 Jan 2026 18:33:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/bridge: simple: add the Algoltek AG6311
 DP-to-HDMI bridge
Message-ID: <jzs5fz26hdu6os6sir5rdfy2ehh5dx3zyghgsdmosynktpz7wk@sqyj5o7eqfog>
References: <20260111085726.634091-2-val@packett.cool>
 <20260111085726.634091-5-val@packett.cool>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111085726.634091-5-val@packett.cool>
X-Authority-Analysis: v=2.4 cv=K/sv3iWI c=1 sm=1 tr=0 ts=6963d0ee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=01oj8vA2L9dAJ6JolygA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE1MyBTYWx0ZWRfX1QzmpQz2lzfb
 JimlKIJHAuYEW+L8W+HSfzxi0OCyYgzpcd4SFQTzB+5ZEH+PaLTldVoqWbMQfFd+kNxUaRjBsbR
 fFYsrtFdGh3cj/wZ6CsLf96Fy6Sp4iQztNBPyXx/N1IX5CroikVbzaBZlhoWLXciD3OSChweq3K
 ZCiw1pPdCu/Fbvg5Sy9x7EjqJ0uOuMfQgc3dc2Qgn203JTC28O08JKo/yrKGedG9oLjh/gQPVJX
 mQgfhUPsVnlhF8MpVkU7msWoynIiqaUcL4TjSnptKzneb4R8b7G7WTowgUSeLT2V5LAk3Jx7wPA
 F16EsGd7mXN66FzNiBboQ+sTVePxknQmBqnBxLjSyPLHksdcwwr9W+DeB0Tpvh9cagHpr/yiAWc
 F+by3kF/wvdRWPoU+45sgBrJU0POD+oZVtANjPhLZxGqbQD0l5KVYV9+2ckYUZd5t7cJLGYJe59
 BQLTuI2bBL12taFW7qA==
X-Proofpoint-GUID: pkYEHsfwjwWO__UVyWWmKOxtdwMkgjRy
X-Proofpoint-ORIG-GUID: pkYEHsfwjwWO__UVyWWmKOxtdwMkgjRy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110153
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

On Sun, Jan 11, 2026 at 05:35:11AM -0300, Val Packett wrote:
> The Algoltek AG6311 is a transparent DisplayPort to HDMI bridge.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
