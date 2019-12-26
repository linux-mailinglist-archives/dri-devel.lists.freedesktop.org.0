Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E304512AF8C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2019 00:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82AA089D7D;
	Thu, 26 Dec 2019 23:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078E089D7D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2019 23:11:22 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id z193so24379272iof.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2019 15:11:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iYgfCFDWP9Pmlfyghxs7WFYI9NQtivbPrXUsgSAT1Uw=;
 b=HPNXLOZtdqM+jcEEF5Qw3t7K9Q1dNWN89gxOdo0tGnCY20uam/M86CQbNM4DKmRGgm
 vYifYeu1egeGDp83rDhu5G3ihE7243NpWuBhkb9HPWpsrAGa2Modq0me5VB7bVLIhiHI
 xSGSR93b/AENieO9Y6iDBre8JHvTMDsyvCTqJPZqDwav6QfaqIvSojP2IRi3nrUISCAu
 N8/7YI6BVFeHSyJn0mKnFEpa86pLaZxrtQ/nYpSb3tzaQAdmpmVQmRjzS0TVi4ZVCMG6
 zrAude9TfbE9yA4uD4XrhrSScul4ykgZ/+tcY8dAMUfnl62TynEsEp7HARLLGTk3+5nk
 4Pww==
X-Gm-Message-State: APjAAAWemi5ivA2PECRXAz+rnvr2rV7eGZ/5AoAPfG1QdhVVzrZsy0JZ
 bB4gUenvTW42el5bzYC4sVGT1GI=
X-Google-Smtp-Source: APXvYqxbOeaFzx0StvAHdq538fpCIHc4NpKp3GRzDKEyzS40STfSyUmgMsX15xFCYFlJqc3NclJbxg==
X-Received: by 2002:a6b:6f06:: with SMTP id k6mr33492727ioc.204.1577401882429; 
 Thu, 26 Dec 2019 15:11:22 -0800 (PST)
Received: from localhost ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id u29sm12647753ill.62.2019.12.26.15.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2019 15:11:21 -0800 (PST)
Date: Thu, 26 Dec 2019 16:11:20 -0700
From: Rob Herring <robh@kernel.org>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v5 3/5] dt-bindings: display: ti, j721e-dss: Add dt-schema
 yaml binding
Message-ID: <20191226231120.GA11462@bogus>
References: <cover.1576857145.git.jsarha@ti.com>
 <e05570c9c5c0a22f5aaa36dd2503fe918b1f941e.1576857145.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e05570c9c5c0a22f5aaa36dd2503fe918b1f941e.1576857145.git.jsarha@ti.com>
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
Cc: devicetree@vger.kernel.org, yamonkar@cadence.com, praneeth@ti.com,
 dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com, robh+dt@kernel.org,
 tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com, sjakhade@cadence.com,
 sam@ravnborg.org, maxime@cerno.tech
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 20 Dec 2019 17:55:11 +0200, Jyri Sarha wrote:
> Add dt-schema yaml bindig for J721E DSS, J721E version TI Keystone
> Display SubSystem.
> 
> Version history:
> 
> v2: no change
> 
> v3: - reg-names: "wp" -> "wb"
>     - Add ports node
>     - Add includes to dts example
>     - reindent dts example
> 
> v4: - Add descriptions to reg, clocks, and interrups properties
>     - Remove minItems when its value is the same as maxItems value
> 
> v5: - itemize reg, clocks and interrupts properties' descriptions
>     - there is no "vp" reg-name, only "wb" for write back
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  .../bindings/display/ti/ti,j721e-dss.yaml     | 208 ++++++++++++++++++
>  1 file changed, 208 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
