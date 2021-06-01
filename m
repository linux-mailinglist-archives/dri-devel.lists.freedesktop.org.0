Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E3D397446
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 15:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D027C6EA68;
	Tue,  1 Jun 2021 13:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E190F6EA66;
 Tue,  1 Jun 2021 13:32:14 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id c3so15474431oic.8;
 Tue, 01 Jun 2021 06:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=sUvFSbu0LjfUEV8j0+FO3g9Nw0MVO+tbGa4afn92YVM=;
 b=qSxPH3ljbT+F6C0Gz09txV+eN0FsJo/2kr4zpxkvePSq1s9yQerEphfWCKkv2h87Uc
 zN/3eV3nXyGAlUXX9n9tIfb1pdu9CBABxCVPfw4t+3ICHTFiKlOseouCiwUMfAb+/7Xf
 QKtEOgganhKCNkd3RqKypfp218JoeJrl/YHN7uNJqfle1e61C++SHlOJmnfcR3TxfcEl
 wh9MdM3+ohaPjsRAVGBDmwWuURQm6u+KvcnBBYWhdyzajxwWiUYPYMrC5pd/iQnFhvdB
 YfVPzPilFNbzHsA0yptj/CBkGnhA6/vwFzzmmx2rYw9XmijrpbxX8VSO4yd11Z4n5qcE
 hQfQ==
X-Gm-Message-State: AOAM531ZzZnp8uTiQvcOSvbZimHhEvNnsK1NNd0cRpnFdaxlHs6SoCNR
 HaCjWsbrZvBUzuzcTFvG7Q==
X-Google-Smtp-Source: ABdhPJxIQ4UNHJiSMIQurjA4OqwlMFcM1ZeS8iht1dzB0oheLg8yrxOc5sZ0cAHYtcMx3as29NSRpA==
X-Received: by 2002:a05:6808:4cf:: with SMTP id
 a15mr3193906oie.78.1622554334167; 
 Tue, 01 Jun 2021 06:32:14 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m66sm3438918oia.28.2021.06.01.06.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 06:32:13 -0700 (PDT)
Received: (nullmailer pid 242371 invoked by uid 1000);
 Tue, 01 Jun 2021 13:32:10 -0000
From: Rob Herring <robh@kernel.org>
To: Rajeev Nandan <rajeevny@codeaurora.org>
In-Reply-To: <1622468035-8453-2-git-send-email-rajeevny@codeaurora.org>
References: <1622468035-8453-1-git-send-email-rajeevny@codeaurora.org>
 <1622468035-8453-2-git-send-email-rajeevny@codeaurora.org>
Subject: Re: [v1 1/3] dt-bindings: msm/dsi: Add yaml schema for 7nm DSI PHY
Date: Tue, 01 Jun 2021 08:32:10 -0500
Message-Id: <1622554330.075037.242370.nullmailer@robh.at.kernel.org>
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
Cc: sean@poorly.run, mkrishn@codeaurora.org, jonathan@marek.ca,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, kalyan_t@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 31 May 2021 19:03:53 +0530, Rajeev Nandan wrote:
> Add YAML schema for the device tree bindings for MSM 7nm DSI PHY driver.
> 
> Cc: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
>  .../bindings/display/msm/dsi-phy-7nm.yaml          | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/display/msm/dsi-phy-common.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.example.dts:19:18: fatal error: dt-bindings/clock/qcom,dispcc-sc7280.h: No such file or directory
   19 |         #include <dt-bindings/clock/qcom,dispcc-sc7280.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1485686

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

