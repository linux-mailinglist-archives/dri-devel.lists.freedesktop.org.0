Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B298788FBFC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 10:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B327E10F4E0;
	Thu, 28 Mar 2024 09:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="P0F0v/OV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639C810F4EC
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 09:49:22 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a450bedffdfso82641166b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 02:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1711619360; x=1712224160; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s2FlcFMwv9/mxZZUbTMV8sm8mZF2ziq8g+DEQybJDFU=;
 b=P0F0v/OVLOHICvTBbGGXy3KQR4+/V+BD7o9J2PKrKW9oKrTnmcJgatlky7vMkukVuo
 c8KE0VSs6egwQgdI45LCureLIU173Vb1der1cgcEIMtP8IxHiU81eK7UChPL7V9XnwJr
 V8ylQSYo1Oe2BsQkjYciWVu30oQ8kZ1/anSJN4eyjbM3qs5JYQ8xh2bplR3znzIhRQeq
 YtqnqfStWpTWMJpLgksJcfB4mvayXGNKN49Hn3UL05h3Dd71BiPtWzAaGvFMCJuZgnCJ
 jeKMv1+7upvxjFBFQYSiIszULO/uuUR+dIMWjUgTpwUjXxfjAPWVnRCtlZAuZDWzDrwL
 Ygew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711619360; x=1712224160;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=s2FlcFMwv9/mxZZUbTMV8sm8mZF2ziq8g+DEQybJDFU=;
 b=INmUNV0t7UKCXpkMWbRlHYEncIeFs7VrTYJFOoR7xQk3kmtOc6LSdY5o2dcE4/z84O
 bg3USQt15OX8xk98Gx5bPjO0L64YiAHlt7b58n6O9Ds2YJtCtn0/33DTsOafUL3jUl+3
 7DN6CiEU3BX/nyfDvFuaoqubb7mv9DiXjw6HNIW+g0iD/8iEL1yXwvnduceJwnEZWvRI
 wngKwaFbEfPCnXbTaCLeopj4Y300KrbgdgtY1tCzoBl2iKifsEPXqjHRTT/WnrgKRP5u
 9m/F1//H2IBYulGH81DnQ0wVhLp4HXvXreGxvKEhkAx5FSkxmCUgXztA6TCokSeIEL+0
 9y9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn2BKs+tGCL05zKB+7PBjkmSsc1/BhkoemGYRC8DQ/nKvJcSDVhvwzYOAaGNmL1Xaw5p33Dz48k3r8y37ixaB4uwiYsvxljMeuhjLSyEle
X-Gm-Message-State: AOJu0YxbsFNMM+jHf/CJtUUliYq7xpF5A2fWGsROiutWFHEgKp58C2V4
 DjB4A6v72Im+2kil2MP5Cuq6exd/ppAFSxOPpExKVrrhuHFdrSeEHw5G7ZRzsAo=
X-Google-Smtp-Source: AGHT+IHQj43uF1oRw2agLwmax83BUP4TUUSTe802FM7CxRtHEbgYpfc/GypNFhLDLarI2m22J/4eHg==
X-Received: by 2002:a17:906:26db:b0:a46:8c40:7a3a with SMTP id
 u27-20020a17090626db00b00a468c407a3amr1170962ejc.26.1711619360465; 
 Thu, 28 Mar 2024 02:49:20 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 cd1-20020a170906b34100b00a4a396ba54asm555999ejb.93.2024.03.28.02.49.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Mar 2024 02:49:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Mar 2024 10:49:19 +0100
Message-Id: <D05AFAI1G7CY.3EURGL4VGKHB@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: dp-controller: document
 SM8250 compatible
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Rob Clark"
 <robdclark@gmail.com>, "Abhinav Kumar" <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, "Sean Paul" <sean@poorly.run>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Kuogee Hsieh" <quic_khsieh@quicinc.com>, "Krishna Manikandan"
 <quic_mkrishn@quicinc.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@linaro.org>
X-Mailer: aerc 0.15.2
References: <20240328-sm6350-dp-v1-0-215ca2b81c35@fairphone.com>
 <20240328-sm6350-dp-v1-1-215ca2b81c35@fairphone.com>
In-Reply-To: <20240328-sm6350-dp-v1-1-215ca2b81c35@fairphone.com>
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

Stupid typo in subject, should of course be SM6350, not SM8250.

On Thu Mar 28, 2024 at 10:42 AM CET, Luca Weiss wrote:
> Add the compatible string for the DisplayPort controller on SM6350 which
> is compatible with the one on SM8350.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.=
yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index ae53cbfb2193..97993feda193 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -29,6 +29,7 @@ properties:
>            - qcom,sm8650-dp
>        - items:
>            - enum:
> +              - qcom,sm6350-dp
>                - qcom,sm8150-dp
>                - qcom,sm8250-dp
>                - qcom,sm8450-dp

