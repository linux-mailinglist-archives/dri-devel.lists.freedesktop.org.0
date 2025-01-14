Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A16FA10386
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 11:00:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0506610E00A;
	Tue, 14 Jan 2025 10:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XS/jC6bZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FA210E00A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 10:00:54 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e4930eca0d4so7675901276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 02:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736848853; x=1737453653; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zWOy0FR11Ww9vPXXYRtiZR0MXnoxIhe7Rlp3oaSMe0o=;
 b=XS/jC6bZL+M37kcJ7KVqPu3GeoOVKHZR3l7Oh3gsRUpePQJvHV4Zj9w8GrSWLEpBSe
 tJHQq/xn1bIwWGHn54io7p/2SkWOZGgeAdgCnQ/2ZxCYHVCFBvXpNPzs88oZmKZgx+J8
 oy73Tam/UFYow9hSJ3Dk/c2hymCsU0kaVGOC+lwKevgQTuv2Zc+Fz19pKJxJerAhxVzx
 YQmx8WjY4//f9xiyZnNrH4HrkkVcRweFPwGBfEt+otXQ0aerT/+XlZxBmqVM9tuSeJu3
 RqehHNF9/b4MXI/L8ZmdtpsFdzGDBGNN7hOP8cu08zjYW6l6mvk9xwgt6iTo8wcH/S8s
 DQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736848853; x=1737453653;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zWOy0FR11Ww9vPXXYRtiZR0MXnoxIhe7Rlp3oaSMe0o=;
 b=AEZrq6Qch5/LCPYqrxAkI6zmG8y6o/uO4TGwNfKR0JEkKJyKzQwu5HBlQkBxn5HTZf
 vho9rZ19CbQ+LzGBHUicrVTAeS7gKhd19guxONfmLjFkQ76uTCWidAB8d0bXhMmFxzyR
 C7HDj/55k2tAqxwOhytuzx6NXTG1OtRKkz/Tef4+RtILYKyltZtVuqXcjH5Q2eBZyGwM
 OPRXpGh5qxYz6py4+IXe2VqHREsJK4dXocPU5lydjE7SGhmZIDCzh5YjRIhO3CNK+w81
 kQc0UdbXgj8SwsEsUEi/wFp0C9y/AhgLKl7+LcDfEGgD20bG6pmaD4zMdD+l/E+ZM/Gy
 sAAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWCSqY2lLclC9AEnN1KabnbiXxodFJHG2v/KylpYKrVSirZlNSiRDJuita86S4xYnShNVGicSxBOU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXvaIM1zt5G8lbWWCgrzK1+waKmu23WMoLAZeblkECxZEb54ci
 iRetmapXHcptXld9SwQ45pvGDMOZm8Wk3QxXTVQHa9Y/w9N9IzL1bkc8c9p8fukv48yF68JKwR7
 ctTyPOkplkIsf74mr+GTdehshe2tUJMEO7BSXRA==
X-Gm-Gg: ASbGncsI4vsWNoa6uZchRPBTlyigVMPzIv5GhU2lE48eUKE59OHEorHLBuw3C10WKgD
 wB9oYb+YLKridf0UP0zZJlQWL93UySs6Z71vdD0twYYqutMA8sisZitokyLWzccrYN4RERA==
X-Google-Smtp-Source: AGHT+IF4wP/wzyfnOnwOTA26chuSzZpOuq04s/LPV2Ds23nxlvigRRrAhav3w7FnByCkwW8F4IVHPh28usUdiKj24SY=
X-Received: by 2002:a25:1ec4:0:b0:e38:a031:bbd3 with SMTP id
 3f1490d57ef6-e54ee212481mr14127208276.39.1736848853117; Tue, 14 Jan 2025
 02:00:53 -0800 (PST)
MIME-Version: 1.0
References: <20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com>
 <20250113-mdssdt_qcs8300-v3-3-6c8e93459600@quicinc.com>
 <lyv4bopv3zw62qll5cjjx46ejdjjmssvhabdxj2uq23mcmwqpb@lld6hynsiwfe>
In-Reply-To: <lyv4bopv3zw62qll5cjjx46ejdjjmssvhabdxj2uq23mcmwqpb@lld6hynsiwfe>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Jan 2025 12:00:42 +0200
X-Gm-Features: AbW1kvbmJDFUCdKe5fDxImchUIrbs_EWdal_GJUHhskaFb5gnzYKEg5u3ybPka8
Message-ID: <CAA8EJppUEB-c5LbWN5dJoRh+6+nNFH3G9h_uwbuTo=B8kp_9oA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: display/msm: Document MDSS on QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yongxing Mou <quic_yongmou@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 14 Jan 2025 at 09:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Jan 13, 2025 at 04:03:10PM +0800, Yongxing Mou wrote:
> > +patternProperties:
> > +  "^display-controller@[0-9a-f]+$":
> > +    type: object
> > +    additionalProperties: true
> > +
> > +    properties:
> > +      compatible:
> > +        items:
> > +          - const: qcom,qcs8300-dpu
> > +          - const: qcom,sa8775p-dpu
> > +
> > +  "^displayport-controller@[0-9a-f]+$":
> > +    type: object
> > +    additionalProperties: true
> > +
> > +    properties:
> > +      compatible:
> > +        items:
> > +          - const: qcom,qcs8300-dp
> > +          - const: qcom,sm8650-dp
>
> Parts of qcs8300 display are compatible with sa8775p, other parts with
> sm8650. That's odd or even not correct. Assuming it is actually correct,
> it deserves explanation in commit msg.

It seems to be correct. These are two different IP blocks with
different modifications. QCS8300's DP configuration matches the SM8650
([1]), though the DPU is the same as the one on the SA8775P platform.

[1] https://lore.kernel.org/dri-devel/411626da-7563-48fb-ac7c-94f06e73e4b8@quicinc.com/


-- 
With best wishes
Dmitry
