Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8A73F19B3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 14:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC776E8A2;
	Thu, 19 Aug 2021 12:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7F66E8A2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 12:49:14 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id t35so8337449oiw.9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 05:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=DoBMmwE1xMwHj39wis0T6SrS2LzAGaiwOQbXQYLmvlk=;
 b=jPkS+SiNkbtLgy7FyhcsisRkz+bpVZ4eTn2kSPgVoGgsBJyRLvskV4ZZW6W/9LsEMb
 72+NRfHACzb3ElCbbiFjmt5oY92Xd3Fysb3YYBfUi9K+U1oY/wRXxPcycUR000iv0Vrl
 0M19ePvvBfY3BGEM9gIce6qA2h5Kc4Bst22WdWRzWvECrESf44dYHt5rr2c970/NX+kP
 e7NdCIUxk9B6CXlqLEgRe+d0JB0gJkH4xGSAj/VZNMpQ6TyZbw/Rf4p3+BcaBTFf+0nL
 IRksfVWDb7Hreoi0erZ6ZlW9L9G4y204l4cJTztP3rJmgz+TxPrifqc0FlfyV7pSwWUQ
 mcXg==
X-Gm-Message-State: AOAM531zR1RN3iiNEnSoQsk86GlFcjAd7pYdEhbmuxR3c6OCj/rM4cY0
 4NI9c18Jm0awAefVLwKtXw==
X-Google-Smtp-Source: ABdhPJyXde09prDPCRyTxmwMcMN/kXtavHI6GGf6AlItNytnsf7Ai/IxKpXpnFJO7Re0+6S2irWP7w==
X-Received: by 2002:a05:6808:13c8:: with SMTP id
 d8mr2491242oiw.169.1629377354079; 
 Thu, 19 Aug 2021 05:49:14 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p64sm665192oib.4.2021.08.19.05.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 05:49:13 -0700 (PDT)
Received: (nullmailer pid 288213 invoked by uid 1000);
 Thu, 19 Aug 2021 12:49:09 -0000
From: Rob Herring <robh@kernel.org>
To: yangcong <yangcong5@huaqin.corp-partner.google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 daniel@ffwll.ch, airlied@linux.ie, devicetree@vger.kernel.org,
 thierry.reding@gmail.com, dianders@google.com, sam@ravnborg.org
In-Reply-To: <20210819092943.719433-3-yangcong5@huaqin.corp-partner.google.com>
References: <20210819092943.719433-1-yangcong5@huaqin.corp-partner.google.com>
 <20210819092943.719433-3-yangcong5@huaqin.corp-partner.google.com>
Subject: Re: [v1 2/2] dt-bindings: drm/panel: boe-tv101wum-nl6: Support
 enabling a 3.3V rail
Date: Thu, 19 Aug 2021 07:49:09 -0500
Message-Id: <1629377349.165324.288212.nullmailer@robh.at.kernel.org>
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

On Thu, 19 Aug 2021 17:29:43 +0800, yangcong wrote:
> The auo,b101uan08.3 panel (already supported by this driver) has
> a 3.3V rail that needs to be turned on. For previous users of
> this panel this voltage was directly output by pmic. On a new
> user (the not-yet-upstream sc7180-trogdor-mrbland board) we need
> to turn the 3.3V rail on.
> 
> Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
> ---
>  .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml   | 4 ++++
>  1 file changed, 4 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.example.dt.yaml: panel@0: 'pp3300-supply' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1518552

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

