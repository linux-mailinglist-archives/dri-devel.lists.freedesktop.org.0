Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F56C40D9C8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 14:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F266ED8E;
	Thu, 16 Sep 2021 12:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDC36ED8E;
 Thu, 16 Sep 2021 12:22:02 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id h29so6442945ila.2;
 Thu, 16 Sep 2021 05:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=EVQqC8AW3pOLfAZpC/J13w/nd9TcW2QmXYLcYpULoW0=;
 b=UEfPcJ7BtlqcVv5cTG92IAXhz9b3dAMVUXyOyTktEjFsiaXla2C2oOex5EI5C0wVQU
 1Xg9Clw7APGklqbhC0bZZjUIviGEHJixLxPzZ7lk9Cp2Y0lLnaiqzyUqeYKPGbXnRy1a
 KeruHjTZHctqqWkElrYiTfy2pBaxWGNtTNCLdORoBPYaahsanmPJNhjlodHngTn5xap0
 BCU17p6BX/ZarP68jSIDQMLII9TeQGHRS5TcP8I1wt6hk0N0xRWZz1YfnnbCwObS/n06
 QS2m3S04aflvIupZy+Ayctq5PLu9IeoFL9ZZfS4cHm+XFNvF7p5aW2bI85AhM3gUWxXj
 bVoQ==
X-Gm-Message-State: AOAM5310QUm4te2edUzHR2UEsqA9ptgGvIMdnbaWh3OKmb91FA5+PR7Q
 5bsRLPC97azEeqtscM9Y4g==
X-Google-Smtp-Source: ABdhPJwf4LTJaVVOvBti2mp++cV6RVQejghzfyjFl1WK2fdLYY06RrcvFWCtsVFoXJlhrSb+x0UeIQ==
X-Received: by 2002:a92:c98b:: with SMTP id y11mr3665064iln.205.1631794921982; 
 Thu, 16 Sep 2021 05:22:01 -0700 (PDT)
Received: from robh.at.kernel.org (96-84-70-89-static.hfc.comcastbusiness.net.
 [96.84.70.89])
 by smtp.gmail.com with ESMTPSA id i14sm1737953ilc.51.2021.09.16.05.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 05:22:00 -0700 (PDT)
Received: (nullmailer pid 1119418 invoked by uid 1000);
 Thu, 16 Sep 2021 12:21:53 -0000
From: Rob Herring <robh@kernel.org>
To: Sean Paul <sean@poorly.run>
Cc: swboyd@chromium.org, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 intel-gfx@lists.freedesktop.org, Kuogee Hsieh <khsieh@codeaurora.org>,
 Sean Paul <seanpaul@chromium.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, freedreno@lists.freedesktop.org
In-Reply-To: <20210915203834.1439-13-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run>
 <20210915203834.1439-13-sean@poorly.run>
Subject: Re: [PATCH v2 12/13] dt-bindings: msm/dp: Add bindings for HDCP
 registers
Date: Thu, 16 Sep 2021 07:21:53 -0500
Message-Id: <1631794913.488685.1119417.nullmailer@robh.at.kernel.org>
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

On Wed, 15 Sep 2021 16:38:31 -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch adds the bindings for the MSM DisplayPort HDCP registers
> which are required to write the HDCP key into the display controller as
> well as the registers to enable HDCP authentication/key
> exchange/encryption.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-13-sean@poorly.run #v1
> 
> Changes in v2:
> -Drop register range names (Stephen)
> -Fix yaml errors (Rob)
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml     | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dp-controller.example.dt.yaml: example-0: displayport-controller@ae90000:reg:0: [0, 183042048, 0, 5120] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dp-controller.example.dt.yaml: example-0: displayport-controller@ae90000:reg:1: [0, 183308288, 0, 372] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dp-controller.example.dt.yaml: example-0: displayport-controller@ae90000:reg:2: [0, 183373824, 0, 44] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1528559

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

