Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF87D39E9D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 07:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E950910E36B;
	Mon, 19 Jan 2026 06:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+du7hDn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KjwWVs0G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400F710E36B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 06:36:23 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J1dKaw4133869
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 06:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tATD7wOoM3Z8pbmvBPDfQvzN
 dL2yaPTze8xkJNTHRvA=; b=M+du7hDnJhAUq2JBMskNYy5zri+Du2kSKrGD1Img
 py5Ljp//IITKwObyVru7l4Q/UzrJ/0ex64BlLGiwuQP8X3K9b05Y8bz0296ssp0y
 IS+xXbM+ySI+boLokiSydkaGCNYtJ98kOW0dy+2whsjnglTJIRIHn7o1LD6/WMu3
 JjdUzthDaH9zmwU/fwjvu+Y9oQQxRTg0zhHixPbeTbSV0s/hysHLBNCYU9o8+seJ
 aouJvDb9zmjIiWB+mp0hDiXYAUQiHrtjFHnKBpYm0qi6nfrub69OgaKrUzLEccaI
 lcB7tXgPjFjOKcESkk/AEBz4wzyoXTaSGG2d0g3LlwsZlA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsb4yrnj6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 06:36:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8bb9f029f31so1220018285a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 22:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768804580; x=1769409380;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tATD7wOoM3Z8pbmvBPDfQvzNdL2yaPTze8xkJNTHRvA=;
 b=KjwWVs0GMl8TBOQGPconthygOo0GcKYgc7xTy6vzfHDW3fGgN29bO+w63GyoY78QVM
 oNTrZizuwAx6X4LofUMgsl2ov9Ho/Y+Yydsa+oamozsgNmM++UK3ttL59RzHBEsmOaaz
 H07+TG9CHkt/Ii22Ke7QXZytbEdoi6fQ4fDNFPWpxeEO640DSeiDYHGffnJ4hUl5L8gW
 tVLumaXHnn24HZZplNguKdHHeT25oboJh6ddZ7phLLec8Or+okNUwAMmyNxs/GHy5tdw
 yQu6GTZ7iIyvEo5+m9FbdEnI4vhet/liKu7LeZrxGPYyh7HAR7aqrxPM5PkkyyjrQQGJ
 JIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768804580; x=1769409380;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tATD7wOoM3Z8pbmvBPDfQvzNdL2yaPTze8xkJNTHRvA=;
 b=dHRMwzpI4IxAHn8CXOeRVaLd6X/g+sj5Z4/y8+2oPIJHoD5Ev/PEwxbNmtbHhcO648
 RhWtGEc1Ap1NtxfiOV2ORd5Izfy9sSrmOt5gcngylYlzs00Tfkt+f8KHFtUHIMRg595d
 9S8UfykKDXjQ+t9ztQlFrLoservmmTKKkxM73rvySImHZ5sYDOkEVOpWPm4b+nhmWOSL
 iHO+Y8nUDRxOZYTiDQqnBprY3iLfyBcRE1viUfvaj2orB04W+l6gqv5dBq9iN5hp3i1K
 M2XF9rrPD+hTH+tgh481SKrDu2Vzb/euJh4qBX15BO8NzPnGLCGEB2TTDIfH17oTMnza
 YdWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/Jvu50A1X5nwnGAxtY1Fexlwv/hEm+fgSVDkVLofIIoDNd/9mIrBzcKpQMaHZAgYwrqcuCul4LYU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiGVnPaZkVNypnmrYqAv86JHHu7ux2cXtePQ/7oTxIt8DDY8iz
 urirAMXLSYsHDi3UnIu+PrzrRv2yzzv9vMKePBVHbNTYmVOyR7bgxJjNl+Lh7XCpIDRX/0zxFUs
 42MeRWbA0pgVrqKEzrlxFPtcXFc8JXr4emaD3HoCurfGhVUHI2TYUnKNV01zLybA4O0I8Ids=
X-Gm-Gg: AY/fxX4xNuTqgHvRPmNa5OyrCC2CE3YKq8TCP10+BJb374ScnE/+ag3XpoFBpOIqNjy
 L2a+B1Um1dkP0s5dNf4rkAQL2RQB7C8em3TsaMMyNRvUnvWMgI+PnBCgGE+iPe06LDVOMweJavI
 xJ/NULRxuQv4SkJMDvuTetI8QdK0SnOUPwbzXkY0z8d7YvpnDZPJ5uV4ZuN3lfgctwhz48h+ZBD
 C5bLXc4utrzZqk9NOB5rmg1+f2l/EnENF/Oahb36koNZsE7swa/QGZ6fQzaKwEqZbE+OZ5OCQBj
 LBTitgjiqce+udT/2e7f0ZnJz88Gktzydw0Rnk6LolYScYs0sFmi01Op+QOm0xlUboKcyoJ3exC
 h5/VOVDwYes5oagE+5jJtcHgZaD6BFAbhYVXI5hb51WUWA60HTRjQJmL6y8W6xZT1wlFJoBg23B
 aw3srsRp8I/JPq9QiozZe4ne0=
X-Received: by 2002:a05:620a:c4b:b0:8c6:a608:5abc with SMTP id
 af79cd13be357-8c6a670532dmr1413551985a.28.1768804580376; 
 Sun, 18 Jan 2026 22:36:20 -0800 (PST)
X-Received: by 2002:a05:620a:c4b:b0:8c6:a608:5abc with SMTP id
 af79cd13be357-8c6a670532dmr1413548885a.28.1768804579771; 
 Sun, 18 Jan 2026 22:36:19 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf39c046sm3072685e87.71.2026.01.18.22.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 22:36:19 -0800 (PST)
Date: Mon, 19 Jan 2026 08:36:17 +0200
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
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: display: bridge: simple: document the
 Algoltek AG6311 DP-to-HDMI bridge
Message-ID: <h2vft6wwp7765i7rxtsr2yddnx52a52nv5acfg3l2mm5vmjbz4@d3aossnwdkjf>
References: <20260111085726.634091-2-val@packett.cool>
 <20260111085726.634091-4-val@packett.cool>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111085726.634091-4-val@packett.cool>
X-Authority-Analysis: v=2.4 cv=SNhPlevH c=1 sm=1 tr=0 ts=696dd0e5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pCw0iXYVZR7UqAz3H7UA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA1MiBTYWx0ZWRfX/kwxHjhhLHXh
 I3ioZQORL+IyygwK2kZl3YIl17raRQAk8OrWjuYhFyRYwFL9k8HE7/vCYK7l1gU3zs2pvXsXqxQ
 JKPDR2h0bv6K4uwD9SBgHgXWhO+qYlus/LqdUeYYQGSOoCZuMyAlz9GWfrTNIcH21BNjYZM6Kdr
 LTvvZYxba3JxTiJbiKOFt9gi8s7NTaazdmPaIDicGg0bA7k+gn/Cb4inI0QcWFGELjT3kbdmq1f
 XARH90isLRwpychZ40xn8hMJGjKhU9079g3DHRloHmEt+i2gWZR/5pNZbq1TC3WI2usyBEcr5e6
 SVkM1emHaWyqD1+tcAeQ+dirztlS5jS6MivV+1vRaBbJmS+YF4TCemtDTlRANF5+ZOG/ZDLCucz
 g61LnbQTEw+9Gc7blHk4reL+kBepwjrPbP67ganfKVmXHPsmOEvdPIS/YrjN+DBNJlNWGqktpAN
 2U4hUxVF622UixMqtZw==
X-Proofpoint-ORIG-GUID: F7bUdfoQh1daBF56NZifDBDEBuca4SWT
X-Proofpoint-GUID: F7bUdfoQh1daBF56NZifDBDEBuca4SWT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190052
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

On Sun, Jan 11, 2026 at 05:35:10AM -0300, Val Packett wrote:
> The Algoltek AG6311 is a transparent DisplayPort to HDMI bridge.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
> index 20c7e0a77802..e6808419f625 100644
> --- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
> @@ -27,6 +27,7 @@ properties:
>            - const: adi,adv7123
>        - enum:
>            - adi,adv7123
> +          - algoltek,ag6311

I tried to pick this up and got an immediate error from checkpatch:

-:22: WARNING:UNDOCUMENTED_DT_STRING: DT compatible string vendor "algoltek" appears un-documented -- check ./Documentation/devicetree/bindings/vendor-prefixes.yaml
#22: FILE: drivers/gpu/drm/bridge/simple-bridge.c:264:
+               .compatible = "algoltek,ag6311",


>            - asl-tek,cs5263
>            - dumb-vga-dac
>            - parade,ps185hdm
> -- 
> 2.51.2
> 

-- 
With best wishes
Dmitry
