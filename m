Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF5F5BF6E6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 09:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21ADA10E207;
	Wed, 21 Sep 2022 07:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287FD10E207
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 07:01:50 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id k10so7667825lfm.4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 00:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=1QL0CFphpa83RgCH/2JlHwO3au2oWpkZ2fPFgCGnjOc=;
 b=KAZEjvpg4g3daMXmcu3qg47mnxKlqaSfXVmskQZgCXz2x9t9/6yVCt4XgtUR7ju3k7
 pHCNGz5rnqc+9JiK6yxn/P3z/ROBByrXfjt//78y/ZL5gdrkkPnrAKyHcPzNczZSCMvP
 mIK4qaI/gYATNjWM8YVGttLVpPj14MjV8Ri5oNDfoFxaBoA9zP9uDfjKiX52bjo7l8s6
 VhyT0//BHYWAvnPH8kkM00cFx61FifuU2buCNBsiRlv5+IN6OJetflIfygApUXkKKRGU
 +SUEaAESyhzXO71rFH8J2vkqiY/qfzyfxCqU7MTQghE0EwKeLsmB6yTq9ysItki1T73L
 MvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=1QL0CFphpa83RgCH/2JlHwO3au2oWpkZ2fPFgCGnjOc=;
 b=ZjqMWMPgTx1eqvkLWipAwV/XuUtEeREUuymiChqZt/C9OKYHnXSWg5Tu5JK0hC2e5V
 Q0aAmEZ9t0kRkie6uDHGT5hgDEo8abrGQ8O0mA2d8FnX884mPOT0MnQ3B1utMKyVWR0t
 KJA/6ODKqPItsBFko1TpmdAS2rMRMkMYUK43vabJzGgplbkPQhamc1sWz6rbnb06eCcq
 /HBPsH37F37lz8v7TZoMl/P6sNyk81GSY4u7niCqDhF4c/X+sawnTPULdiXZkfluOQLH
 ounR6XmCTbHX5VonRKJqNxGEe5YMECsqsKRgeECiuRWQm8c7Y7qd64fj+48Adf7eXqS8
 H2AA==
X-Gm-Message-State: ACrzQf1lNH5DUyA200S0w1R6xRAYpg6WHAL5qQ6a+i2En6LIFxsbgVkk
 cvJZ9722tJ/114Hhn8XOzWIj4JG8hSYo+A==
X-Google-Smtp-Source: AMsMyM4dVp6sdbuzr3mFJn+IpomFBs7OZPX8e+/6Km/Cj0w8XZZ8qr5FPUeXcg/zxiTMuLRHZ6ZhPQ==
X-Received: by 2002:a05:6512:31c8:b0:49c:db9d:bb97 with SMTP id
 j8-20020a05651231c800b0049cdb9dbb97mr9281084lfe.12.1663743708470; 
 Wed, 21 Sep 2022 00:01:48 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 k1-20020ac257c1000000b004947555dbc2sm311198lfo.100.2022.09.21.00.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 00:01:47 -0700 (PDT)
Date: Wed, 21 Sep 2022 09:01:46 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH V2 2/3] dt-bindings: display: panel: Add NewVision
 NV3051D bindings
Message-ID: <20220921070146.bqtb7p2xyry3jwaw@krzk-bin>
References: <20220920145905.20595-1-macroalpha82@gmail.com>
 <20220920145905.20595-3-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220920145905.20595-3-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 krzysztof.kozlowski+dt@linaro.org, airlied@linux.ie, robh+dt@kernel.org,
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 20 Sep 2022 09:59:04 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add documentation for the NewVision NV3051D panel bindings.
> Note that for the two expected consumers of this panel binding
> the underlying LCD model is unknown. Name "anbernic,rg353p-panel"
> is used because the hardware itself is known as "anbernic,rg353p".
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../display/panel/newvision,nv3051d.yaml      | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.example.dtb: panel@0: compatible: ['anbernic,rg353p-panel'] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
