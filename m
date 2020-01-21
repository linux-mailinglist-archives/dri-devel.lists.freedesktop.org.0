Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB06C1443D6
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 19:00:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE9388FD4;
	Tue, 21 Jan 2020 18:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D07788FD4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 18:00:51 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id p125so3405152oif.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 10:00:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QHRMSNRShRtBYrUTeMfWPqqYtpJg6IFNDf8AuiA+bOc=;
 b=hL6EeNioDU5y/JNwoeOCGePukp0NmXUkWy6xPRfja3lohQpql0fC06jo4nZc1/oeMc
 aluD/+QWMHIot/KBxn47WW5n7XCG2Iu9zaS1dfgPUqCmFiBSP3ye9r55rvQac1unXd3O
 7CXys3n2y6zxL0NCsNnVl9MbayBfm6wQWxCtrWM8DwuXhCzYFFDC9xgW1gNIdUXcT5fx
 zHWeWfpq+xpIyr5m6khvu71QGKGeRl476Cju4Z21i9gme5vqrh7TJzKfYldS6rBUYWK2
 UCqAYAmeBw+9Oz1VPMGRZ9g678xLpmAd2x+to/q+YgthPR4NKgDrvTukPNiqI5LdU3sa
 yQ0A==
X-Gm-Message-State: APjAAAWc3LBHrv6S5m6KD/H2MEGejKbtb0QcHXwNANUpmjhqFoWTpe1s
 JbB5BUeSVUNf6TiftQfwMA==
X-Google-Smtp-Source: APXvYqyzppaF7bza95PNQiTUkKlMxTicfaxYaeuVH01PjAK3i3op5l4C39g5wjarGMwofRV3547y0w==
X-Received: by 2002:aca:5fc6:: with SMTP id t189mr4028320oib.166.1579629650685; 
 Tue, 21 Jan 2020 10:00:50 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l13sm13748338otq.78.2020.01.21.10.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 10:00:49 -0800 (PST)
Received: (nullmailer pid 858 invoked by uid 1000);
 Tue, 21 Jan 2020 18:00:48 -0000
Date: Tue, 21 Jan 2020 12:00:48 -0600
From: Rob Herring <robh@kernel.org>
To: allen <allen.chen@ite.com.tw>
Subject: Re: [PATCH v6 3/4] dt-bindings: Add binding for IT6505.
Message-ID: <20200121180048.GA407@bogus>
References: <1579488364-13182-1-git-send-email-allen.chen@ite.com.tw>
 <1579488364-13182-4-git-send-email-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579488364-13182-4-git-send-email-allen.chen@ite.com.tw>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, David Airlie <airlied@linux.ie>,
 Allen Chen <allen.chen@ite.com.tw>, open list <linux-kernel@vger.kernel.org>,
 "open  list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Jan 2020 10:44:33 +0800, allen wrote:
> Add a DT binding documentation for IT6505.
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> ---
>  .../bindings/display/bridge/ite,it6505.yaml        | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/display/bridge/ite,it6505.example.dts:19.31-32 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:300: recipe for target 'Documentation/devicetree/bindings/display/bridge/ite,it6505.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/display/bridge/ite,it6505.example.dt.yaml] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1225618
Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
