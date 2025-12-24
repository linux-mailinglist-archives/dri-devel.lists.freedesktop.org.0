Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57709CDB10C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 02:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25BF10E2F9;
	Wed, 24 Dec 2025 01:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RNJTJHk5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GpmhwR6K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431BB10E2F9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:16:43 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNKXix81206461
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hIYfzloB5XYJ1ib4p1y5YsNL
 85srUlDRSrKOIPLlKB8=; b=RNJTJHk5tauijjxO+gygLu9Nv1A0nXDBjEPuY0Jx
 an2LiMqzjC1GAeGa52/XAWg8pYU204hlAyCzC570p5Bxh1IirTqTmEj13Oi56PXm
 AuUVZ5Sg4FfMV6ka5+oKs7h6vidSsaY5nOo4OPdMAOfjKipfDBXNzWT+sYrBqkJo
 xDuS+9hxAjfaz04l4dZsRP3W+DOPRojzLSFd0T8/4GesorfuWKioNOvAVB90iUaN
 RKjdvGkNibClGM3EB6tUV8Whur7TCSR+KX1jcnJ78LYEQY5PjK0Dcyeb59bzEmj1
 aSwsDA8sJ9F38HrstwCYAKblzi7i/OM+YqF1cb8zWO1I5w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r0hn6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:16:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-880501dcc67so207651476d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 17:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766539002; x=1767143802;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hIYfzloB5XYJ1ib4p1y5YsNL85srUlDRSrKOIPLlKB8=;
 b=GpmhwR6K4t7NfFPqh/i9zd3QBjH93Ni0uX/m8BSbJTyLmHuE5Qw0ETYcdEqS9MorJa
 UiFwmr2ZjfbfQuAEOO5qYa6/I4knO625K3tiHj2Mt3klVLy3sqK+CtDSZdwgyIwclkVp
 5X4W5Ls0ZUeYTsCcZuJNGh14JHhUG1Txw0kHlHeKffsPPuVT7NlhqWgAnctrsXuh6VdA
 hKCg+Do4QkMRl2gsXZnHXwU0CwRkzVJAG9K/C42XsDw79vHmHGlOJpuUu5MFGiP7zPI3
 s3ndmyXf2Ia8jZ5tQBCqKHz2jfBeJ6xm4aisUlr3D6zSR+BmrHJdBdORUsVlJsppaw22
 ZsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766539002; x=1767143802;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hIYfzloB5XYJ1ib4p1y5YsNL85srUlDRSrKOIPLlKB8=;
 b=FscbpbrRQIc+i/n5Y/WRXeFqU+AaLr5Dk1THePp6loIkXamUcDPD4wgS+pDEJpTABL
 PR+1NfUVKDmtAEYn7OgsajkfdUAk7wPUCueK7CHsjbG642Xt/PmytfVLXAyn+46iE63X
 ZZsuaH/dpBjiq7iqQVpn8v4psrFrCCnjP1LIUS1OX3EOf487WD2EcSjYZIb1NkYJcRW3
 r+ZBGV7xywFaYUWjCbBvzxd3NgsjmHkPMe1STcko5JWoLTFOgRnAwBwhCaPza2MX6vQL
 rMjwB4rJ3AeOqcxCtptgIXoQplp9CT79Ti5TPf6OxQvGU81sf0cWaplkAArbDiKA+TDZ
 tQew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPUydTwu9b6kCptKr57jqTAdxNayd0GxeA88oPsp7kyEzo1FTwYqGX2RjHcAUe+u1me9gt7/5/YOk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjE4sh0BWg1nbjjqrRoxoRJ+lCNfPMoBsvXu4IraHZm3sey5Ef
 3U552chkXj73l2mGOzfsTv+apvNEsnwdjn3GV7CbP5aqZTQ9JXMA1LO7PqBaWCjNgRw4r6FSzAp
 LvSjPnVZIupiSWt8ZLMa7oJg2iZ2FfvoTn6bKtUjRFVuRT8t9c8YmhxZ6xExCE6fKpASwgBY=
X-Gm-Gg: AY/fxX5DxTbSd4mJVHeNsHhs3zMTexsaqgtsNSQ4J7MRBDYc8TYgEc5j1ybZR7rbj5b
 ZUyvc20JiBbZkvzf879D58A5Ypi40gSssrcsndONcpUziDiO8IXOuS4E4PTwcCFoxKOn/kGkon5
 SpyYszek2jK5WiyAL3YqmgISQ4XYJdCN/pFaIWjjGzMxN7FwMdw3H/cy4Jz26VJdvW/YflflxNC
 q6SIsyJ1rFJPV7Bt2NZWVicmuK3oL26IMb3mpAlcQtVYYUJsdBexkK/HM8kQTPW+dtpNSBif2KB
 8nBOSXhzHNAm2luNbFkN4wm5sIo85b0/V4f90g5r3UF5flJoWfIoaGT0ZCH5PLJi0bP6Pd6luRP
 e0uVBrZ0kZqWuj6BmzoQZuWK8HM49ebRfcKyGoUxDnW5BSnNkBZpstc9damY6HMl89I6V2uDO9F
 bJjzn5KuMInYax/SNRSWAy288=
X-Received: by 2002:a05:6214:5f86:b0:88a:4694:5924 with SMTP id
 6a1803df08f44-88d858c3de5mr254876876d6.19.1766539001744; 
 Tue, 23 Dec 2025 17:16:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6wwUzQAGBjYRfb/Vr4wAgSSornw3FOOyMvBh+bgPXVJiqpeYGFgx7DytKRzOeX48KTEzAqQ==
X-Received: by 2002:a05:6214:5f86:b0:88a:4694:5924 with SMTP id
 6a1803df08f44-88d858c3de5mr254876516d6.19.1766539001221; 
 Tue, 23 Dec 2025 17:16:41 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18628422sm4502543e87.101.2025.12.23.17.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 17:16:38 -0800 (PST)
Date: Wed, 24 Dec 2025 03:16:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 11/11] drm/panel: Add panel driver for Samsung ANA6707
 DDIC
Message-ID: <s7rhdqcctatkmd4pn2kcjty7rbbwztlgzzduuqrhrvkvgfzxet@j37kjskze4px>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-11-82a87465d163@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-drm-panels-sony-v2-11-82a87465d163@somainline.org>
X-Proofpoint-ORIG-GUID: _9K1wgOA-dF7PP9XIXP4ebImRYYwhzlG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwOSBTYWx0ZWRfX0An/bodJFFVF
 3NYMPiI9rWQIwop2c9NkDZI7nYDufb7Xoo7JylvFG7AGjehDsbwUzkMKMjDV4E5S0nLl1WMT9wC
 sr/F4A9EiRY4ze5n5jwFQLN2kH6lPo5En0LDbJrFa8t5pe4pBzFHKB64Sg5MOUfiHqXd5co8KxY
 PfnOAuVgXxVreS7bJE2vv2ea93TJuhG9SB7X8HJc+Tr0POoaf2jJ5qwcFcm4+/B2x+0zYWhyok1
 paV7dTAEsLvjhKUfQ5X6sUxyXrUv9NXGTSg5fuVOURq83uzad5cLGqRCoLAyuOPtFS8Y53+BYlB
 IXH/TZ401YA2X3ho3KC0MaZIG0l+Job4W7RbJAiJ9d61stPjf3udSJ/DLOTNA9KNzJ9Wux0XIUS
 AAsJAXoL7MZWMkAVUy8JuZKzpzfWg41ai+nJlVmEZrR/+4JtqDqEgceTz4etZDZnsXKVWBLJWxK
 ZozuSWqxb5Cu/QH6T6A==
X-Proofpoint-GUID: _9K1wgOA-dF7PP9XIXP4ebImRYYwhzlG
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694b3efa cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8 a=in43iuMr0HE-7OTW55AA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240009
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

On Mon, Dec 22, 2025 at 12:32:17AM +0100, Marijn Suijten wrote:
> The ANA6707 Display-Driver-IC is paired with the amb650yl01 panel in the
> Sony Xperia 1 III, Sony Xperia 1 IV and Sony Xperia V smartphones.  It
> uses Display Stream Compression 1.1 and requires dual DSI interfaces to
> satisfy the bandwidth requirements to run at 1644x3840 at 120Hz.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/gpu/drm/panel/Kconfig                 |  16 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-samsung-ana6707.c | 461 ++++++++++++++++++++++++++
>  4 files changed, 479 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
