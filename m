Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 605A85295E3
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 02:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9D810E6F8;
	Tue, 17 May 2022 00:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AAA10E6F8
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 00:11:37 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-edeb6c3642so22352387fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 17:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B59B15X2Y9707ITMe3Q0ZoBhueaMaEM8WsTZOA0UaUI=;
 b=V7d7mEGTws/xnaU7afz+BTZhdzG6Dq1NUEjg6/MAbRlvRVdXF+BTIMQleJ/zj17q5U
 oWvcNY/Wp53g8mZr/xCydE5lmP63VxOC/lrQTBtTCwAHh/E+oXmwjOLg1kk5t/05UJcc
 sFt3Pu3vbOcBOcmg16fSKCu5c/JD7Q+rNHs6V3+IX5FaBUmnBNLA377dKxMdHkYmA2lq
 5UjRx7pmXnD95uQxvCtLGW4NWdDXkhItnjZHlJVcOz9HoDpQxPcd3G+K33LUBGN+drq1
 P7GDCU4qPnEk0T/K7ef2MMdTM/3XZICdXW3WhBSJV6LWPM2pIy48Xf+6AtU8ZsvGj+5R
 9bDg==
X-Gm-Message-State: AOAM533F1RJSZk5uBTN2q9nkXYfMwdkEijAKx0t9sXQN3obh5CWvpZff
 1o7/702+jXoRHxc1FgOJcw==
X-Google-Smtp-Source: ABdhPJy/FjSWyr0EuO88WWVHdVeVWy8f5dNYYK1eSBYd+d8aSX7IHAyFLoKjHN5yea6VyPWiXSOdNg==
X-Received: by 2002:a05:6870:9a09:b0:e9:20a7:6cf6 with SMTP id
 fo9-20020a0568709a0900b000e920a76cf6mr16579934oab.122.1652746297033; 
 Mon, 16 May 2022 17:11:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x16-20020a056830245000b0060603221251sm4411822otr.33.2022.05.16.17.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 17:11:36 -0700 (PDT)
Received: (nullmailer pid 3620853 invoked by uid 1000);
 Tue, 17 May 2022 00:11:34 -0000
Date: Mon, 16 May 2022 19:11:34 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: leds: qcom-wled: fix number of addresses
Message-ID: <20220517001134.GA3620793-robh@kernel.org>
References: <20220505154702.422108-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505154702.422108-1-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, Pavel Machek <pavel@ucw.cz>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 05 May 2022 17:47:01 +0200, Krzysztof Kozlowski wrote:
> On PM660L, PMI8994 and PMI8998, the WLED has two address spaces.  This
> also fixes dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: leds@d800: reg: [[55296], [55552]] is too long
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/leds/backlight/qcom-wled.yaml    | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
