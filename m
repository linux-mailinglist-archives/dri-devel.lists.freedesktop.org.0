Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02672A1050D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 12:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB6810E13C;
	Tue, 14 Jan 2025 11:10:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nURctGN1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF8F10E16D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 11:10:29 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53f757134cdso5334349e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 03:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736852968; x=1737457768; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lSEEVDHkJF+59l08MDf/HdvOaR7SqGhIx6AtZQIytfk=;
 b=nURctGN1dT+Q82TkfjNxJf52oy1TEIKQajEIifENsy5Cwc8ecWI3e0g74F2iA1Sa/C
 kQ4qJF+dEclyHvl55GovtdalS18GN6daols6XVWpRsgQ9s6aWnhwYuYXUVfvloWVykel
 NR74ZKtgbzaVrHyEhctPjypvZS5JA0XM8a3t/bD8RBdiiTj+V+2nCgEozzp7Osi4z6Aa
 PHbpv5n27fRCO0NytYaRyaYh29PRIAYcZ2ciBpFnsnsmZCfb415aVYs0XQDCw660Ngfa
 34y5/On75y5wOkLieZ+LVnrBeZoPTqa3Jkkq5oeOW9fQJKuUMQJ/TAtZDjCkxKltpMix
 i4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736852968; x=1737457768;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lSEEVDHkJF+59l08MDf/HdvOaR7SqGhIx6AtZQIytfk=;
 b=GSFKXVmxLS5J2Tt9OfESEEcEJ2Bp8Mjc95+Rn2ISLZEJuzTxHCJbXBHmWFpeJWdY/O
 hpnVS6jUYVUMTCol1JtTq/LhCqzs8hVYLpju5mlBVjALbwScnHIEWBW4Y1Fpp0kH7zke
 hasWmcCgtvD2UGiv+GuzoovZJsL+mw8nBsveOGrAkZDGO2jlqo8jluSfIol261L9rIR6
 H5W9ZJP4iwxRC0hsvPxZUz3G9GtTmGtAK7bbxcDGAZ8LRYA+Dat8D5WueaVkVhPJAxgK
 PWhT5g4a0hP6wfm5+h8QeRn2z7gFEi5d0JcEGwzklRd13bRy6RPjXwhykFF3Sxy4ziYC
 aPag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK4vdc2o4FshN95MC4/KMvEMypPkFtw0Z5KCz4OgBA47mCPPOrDDMwNX8hEzDuzZ8MoBwGHf4AtoM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3Sc+HyiblvRaeBE+/D/YmUjOBOQI3XGs/5ZbirrFaitytw4W8
 nODOP6c9aW0ehOYv0Di8F1ayzyDO+fvF/9TgrmFLlXOzpjY657TIzK0gqfr42sI=
X-Gm-Gg: ASbGncu0n9ZwN3Hj5SmYvq2pF6mzzmMsXM7nz98ArkbgvYorc8UPIFcnh1JV84+lzqH
 ZyVV7HLvSh1eiGN31K4Ohru5xi+0YPDfOHRTIgyI0PQ6M9C3wrCuo+JOZB8thrdeONGW/zkMh6e
 9nmx81qUW/VM+lR9Yl76z8op1Pu5ugFFcJSPOUhPpUDFqExxEHjFTrjpVH51B6KH699VASpEbEN
 ypsfOYDJ9YPO5d+r3OZoMeEFpCTfDpvLIOYgmYp4dWxVzUWpskdip1silLsR1auHvz5x7ULnGlh
 r+pbe7ek73b8QxczxK8LUqLr7wgdIiYLUeY3
X-Google-Smtp-Source: AGHT+IGsHdnrR/PD2l0aAbVi6WVa0Zza137alj0eWph9uI3wb2zRUaR8X1MT+Wuu41m9TUTAYoQAtw==
X-Received: by 2002:a05:6512:4024:b0:540:3566:5760 with SMTP id
 2adb3069b0e04-542847f9ea2mr7548782e87.35.1736852967850; 
 Tue, 14 Jan 2025 03:09:27 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be49943sm1652662e87.25.2025.01.14.03.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 03:09:27 -0800 (PST)
Date: Tue, 14 Jan 2025 13:09:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yongxing Mou <quic_yongmou@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 3/4] dt-bindings: display/msm: Document MDSS on QCS8300
Message-ID: <rx5jyaehsgdw5cluyjtrn5yvxnd2uemdde5jbvq2dq3dirr2ak@hkegxop7tiew>
References: <20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com>
 <20250113-mdssdt_qcs8300-v3-3-6c8e93459600@quicinc.com>
 <lyv4bopv3zw62qll5cjjx46ejdjjmssvhabdxj2uq23mcmwqpb@lld6hynsiwfe>
 <CAA8EJppUEB-c5LbWN5dJoRh+6+nNFH3G9h_uwbuTo=B8kp_9oA@mail.gmail.com>
 <bda8dd18-3bed-427a-bd19-9cb011256c93@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bda8dd18-3bed-427a-bd19-9cb011256c93@kernel.org>
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

On Tue, Jan 14, 2025 at 11:11:23AM +0100, Krzysztof Kozlowski wrote:
> On 14/01/2025 11:00, Dmitry Baryshkov wrote:
> > On Tue, 14 Jan 2025 at 09:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On Mon, Jan 13, 2025 at 04:03:10PM +0800, Yongxing Mou wrote:
> >>> +patternProperties:
> >>> +  "^display-controller@[0-9a-f]+$":
> >>> +    type: object
> >>> +    additionalProperties: true
> >>> +
> >>> +    properties:
> >>> +      compatible:
> >>> +        items:
> >>> +          - const: qcom,qcs8300-dpu
> >>> +          - const: qcom,sa8775p-dpu
> >>> +
> >>> +  "^displayport-controller@[0-9a-f]+$":
> >>> +    type: object
> >>> +    additionalProperties: true
> >>> +
> >>> +    properties:
> >>> +      compatible:
> >>> +        items:
> >>> +          - const: qcom,qcs8300-dp
> >>> +          - const: qcom,sm8650-dp
> >>
> >> Parts of qcs8300 display are compatible with sa8775p, other parts with
> >> sm8650. That's odd or even not correct. Assuming it is actually correct,
> >> it deserves explanation in commit msg.
> > 
> > It seems to be correct. These are two different IP blocks with
> > different modifications. QCS8300's DP configuration matches the SM8650
> > ([1]), though the DPU is the same as the one on the SA8775P platform.
> > 
> > [1] https://lore.kernel.org/dri-devel/411626da-7563-48fb-ac7c-94f06e73e4b8@quicinc.com/
> 
> That's the driver, so you claim that qcs8300, which is a sa8775p, is not
> compatible with sa8775p because of current driver code? You see the
> contradiction? sa8775p is not compatible with sa8775p because of current
> driver patch?

I think you are slightly confused with different similar QCS SKUs here.
QCS9100 is sa8775p. QCS8300 is a lighter version of it.

> 
> I don't think it is correct, but let's repeat: if you think otherwise,
> this should be explain in commit msg.
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
