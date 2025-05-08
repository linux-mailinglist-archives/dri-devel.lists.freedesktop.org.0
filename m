Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFA8AAF1E5
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 06:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C5A10E1F2;
	Thu,  8 May 2025 04:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIr0Em04";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856A310E0B7
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 04:03:23 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5481HZfX000764
 for <dri-devel@lists.freedesktop.org>; Thu, 8 May 2025 04:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WFGwx5PZ+G/9BxcVBebd00iL
 tXeXpkwlaZ/P+6/sls8=; b=lIr0Em04WtZl73eIUNkTUGI0JaqxYlvgs/JLqJlF
 OJhiYw3N9NXkePvJM+V/qosXsoViXifU83bw3AIlcsfYzv5h/XR6V+aA7ckOnLPJ
 qjcHtdVMCZsAsHltv5hCpRvjIxk1Yv1gzW9ILZQFAEAKq1QsnZjzrkt7xEIaLDOR
 5tGH9wJ7jz+Dpb/dKf4PhG1HRWcaQJDlCdxvWZLaHEb17IEB8I294Ub8XbDcJ61t
 6Cp/7TkAlYnHUxjg30Rnv3OCFnKGgHKHrQLSbZEagbeooCm3GylYAawzhQmMH0rv
 Iikx67Uy8lFxRjAJf1kWRMw9YvzAD95kbXTTKfGs53omiw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9epda63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 04:03:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c790dc38b4so124824385a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 21:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746677001; x=1747281801;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WFGwx5PZ+G/9BxcVBebd00iLtXeXpkwlaZ/P+6/sls8=;
 b=vSdAuscENjmjEbIpYyHDQF7clvzherhzbPDaTLy4GziDHvopwy3m6ByZFPVdwNxpP7
 bhqSe1/01p3wADMQgD+qFwH+q0y/oF7X4nJFw8nG1+ePktqWxXygfg+k1VxUV21iCNsO
 DezNVFoVY5JyqYdmlmgyBOVFQpua211WLSRV9D1XZ2hAA3Y4kUQ8DP0yFExWCjWXgsCx
 p/tWMe3BR/9An+6fKYRYi0UoHU+UzqczePJ1tjifgPUk6QeA5kwoFPM3gEb8yG1wHP4H
 TPFYMQy7RqiDjdBz1XrzM4od38+bNXXEQGgpxd//lmK2Qcni3zSCZMvhhAmjMxjIl0XB
 wWXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVINLUOanIlV8rBfB0CaIZx2lWSB65kggT5jaY11vO4/yHQRgCzAbUdXoXK0pqX225c0HUm8Lx+0d0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6K3lChczt+wRrevqdmFq7hilgpsYtXD/KybphwKh/iA+L2VB0
 BoshiNp/xSvcA3zqEP5UAmq9dAYknNzkkn0d0XoIbxC0PBbr/FEgI2kXjJUZ1hcTC4/Iknyyavh
 ktxdaVdHBApMB27YK3LkG5X6S42q1HQzyVLNdctf7nKwgcabsuAIRgbWEdi7T3AqyujY=
X-Gm-Gg: ASbGncst/iyjFxX1XoxswOJSFxiMcVQUpHOaUL2b9t7fjSrfZM/1xqYvEIcK2nIGgFY
 axKWjm3EwTyTpInu3TMse6dMQf7/odhkeeWeuYpcAebOtwcLdd+3mO89S+G83g+D4CYsqQjfFuJ
 tvDGFQPVqhdlOt3nVoQ4LmNQD/LvApnADh18xGcmo4fEt17b3eSgBsiKimno7pzdorA7KEGFFcd
 VCNvckAY8QL/BZJhqaS3whKxrzaawaK5EydFLY2RR9Fl2KQEMwvWbxDcPlUSfqdvGmhcZhzdpBw
 t4qqf/k1Jd7LBlZ51YFuz0BdpipLjZLZ3mS25A2zPbK48aYY+JT5wnfuigX/+Oi+nOoE5cuIR6o
 =
X-Received: by 2002:a05:620a:8002:b0:7c7:b570:e2b1 with SMTP id
 af79cd13be357-7ccf995e1a1mr366750885a.7.1746677001642; 
 Wed, 07 May 2025 21:03:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCvb8VK0sMuvhaF34y+RLN/zFk90fkQ04v2q+mJ14cJV9oLuze4zWQomR2mbFMyLbVM3zhmg==
X-Received: by 2002:a05:620a:8002:b0:7c7:b570:e2b1 with SMTP id
 af79cd13be357-7ccf995e1a1mr366745985a.7.1746677001155; 
 Wed, 07 May 2025 21:03:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32028b38ef2sm23996481fa.23.2025.05.07.21.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 21:03:20 -0700 (PDT)
Date: Thu, 8 May 2025 07:03:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display/msm: hdmi: Fix constraints on
 additional 'port' properties
Message-ID: <fvrvrcqilnhma774kkojytlgwglsvgaxgukm2fc3gennaii4jz@dufjv3obqc7b>
References: <20250507215912.2748964-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507215912.2748964-1-robh@kernel.org>
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=681c2d0a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LCLtBpLZ_J7SsqHOqrgA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: v3hdZw-EVM73mGYAoWd5aQ9-ENvW-zCL
X-Proofpoint-GUID: v3hdZw-EVM73mGYAoWd5aQ9-ENvW-zCL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDAzMiBTYWx0ZWRfX90RMUAKrsV8I
 flZBHOBVC942SGnwrcExf3ZDr3LcpKouHBLOxue5yBLH4N2b3lpgyNUmrxRbLIHvII17QL8eIPN
 jS+8UPovGA7s8jgnycCbjg/rnkRFJZkz+SoCEdJIBCdtiV9CK5eGMnjzMtuvF9VrvS/pPf1Jkfb
 7t4YMvGIfuqdSfq6QxA9d0fsZmW+osMzyUaTJG+x7SgD4b5DSH44N2dDt0wU4pbW93byYsXTM58
 FL8m+ELTu6AVnIej0wkiKWEUL0dA4SCNtrAXjQxKSuNPk4AKeGGHWDQ4faZDHh162dV6rxVUxF2
 anKV76+L6edl8wZgS/C6ZQM7xsOhKCdb2O7HbO94gYegDZHEn0QQL43EXq0TEARSTtf1J7si/nA
 sUEGprIs9f0RWBYqPMJhBuJLtBk/qCw0KZf3tquCDhuQeQD9mXkKL6NjbT1hW2uJoYnPT9H1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_01,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080032
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

On Wed, May 07, 2025 at 04:59:12PM -0500, Rob Herring (Arm) wrote:
> The MSM HDMI port nodes are missing any restrictions on additional
> properties. The $ref should be to "/properties/port" rather than
> "/$defs/port-base" as there are not additional properties in the nodes
> to define.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/msm/hdmi.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I've verified, it applies on top of msm-next and produces no errors. I
don't see a meaningful error in the bot's message (Rob, is there a
chance to fix the bot?).

> 
> diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> index d4a2033afea8..099274d35680 100644
> --- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> @@ -89,12 +89,12 @@ properties:
>      $ref: /schemas/graph.yaml#/properties/ports
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/$defs/port-base
> +        $ref: /schemas/graph.yaml#/properties/port
>          description: |
>            Input endpoints of the controller.
>  
>        port@1:
> -        $ref: /schemas/graph.yaml#/$defs/port-base
> +        $ref: /schemas/graph.yaml#/properties/port
>          description: |
>            Output endpoints of the controller.
>  
> -- 
> 2.47.2
> 

-- 
With best wishes
Dmitry
