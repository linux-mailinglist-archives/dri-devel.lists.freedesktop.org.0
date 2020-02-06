Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E96154E7A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 23:00:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04BB66F567;
	Thu,  6 Feb 2020 22:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16536F567
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 22:00:16 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id w21so8540pgl.9
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 14:00:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RE/0U9HMaaH2hc20ud5C4lxm6MqO7eGkAYTEiyXyOb0=;
 b=ab/Yk0TEa6cngx41Xvsme2m3K7bVI12yTdHUsCqg8SOXEgwMMoMSZhk1LvP2G8VA58
 QE4evbcdcDUmf63Vy3FDowqGIE+zj2HUWQGaVToWW4jlPBNChdHG3p4nNgcN+rE58Wo/
 64yiHF0wakQktCWhdE4hC1iv3+cgWzjOp7yPdoVJPV60X3MIzil0PNzad5Bc+G7U/JWD
 GpXWwnp0IPqB2wJHE5D0Ou3NWtSFZXajcNvd7uJNzk1kiyW3LqkZ2TEfjtgE2EDeKOYi
 JzWXn9GBbhQkGTyMezzgVtDVNGyN50XH4ZnTaLz1UtSuZiguDJs73m+AIKHldK5uLKeh
 lfCw==
X-Gm-Message-State: APjAAAUQRWK1QOb3Afx4LTdS38HjzfG5v4q0Xc9K3Wl2D7pOpCUoAm0F
 gtmZfqvjai6YKVALZP580g==
X-Google-Smtp-Source: APXvYqzKAZlOtZ6zTxVdNseR3XTrwfkuVpvDHj6Wjm4UEWVA+8HSlBMS//56y3E0jNlK1vsVxbxfCw==
X-Received: by 2002:a05:6a00:5b:: with SMTP id
 i27mr6395683pfk.112.1581026416197; 
 Thu, 06 Feb 2020 14:00:16 -0800 (PST)
Received: from rob-hp-laptop (63-158-47-182.dia.static.qwest.net.
 [63.158.47.182])
 by smtp.gmail.com with ESMTPSA id h62sm287723pfg.95.2020.02.06.14.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 14:00:15 -0800 (PST)
Received: (nullmailer pid 24167 invoked by uid 1000);
 Thu, 06 Feb 2020 22:00:14 -0000
Date: Thu, 6 Feb 2020 15:00:14 -0700
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: one file of all simple DSI panels
Message-ID: <20200206220014.GA24061@bogus>
References: <20200206133344.724-1-benjamin.gaignard@st.com>
 <20200206133344.724-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200206133344.724-2-benjamin.gaignard@st.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>, airlied@linux.ie,
 philippe.cornu@st.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yannick Fertre <yannick.fertre@st.com>,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 6 Feb 2020 14:33:42 +0100, Benjamin Gaignard wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> To complement panel-simple.yaml, create panel-simple-dsi.yaml.
> panel-simple-dsi-yaml are for all simple DSP panels with a single
> power-supply and optional backlight / enable GPIO.
> 
> Migrate panasonic,vvx10f034n00 over to the new file.
> 
> The objectives with one file for all the simple DSI panels are:
>     - Make it simpler to add bindings for simple DSI panels
>     - Keep the number of bindings file lower
>     - Keep the binding documentation for simple DSI panels more consistent
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Yannick Fertre <yannick.fertre@st.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> ---
> version 4:
> - remove orisetech,otm8009a and raydium,rm68200 compatibles
> - remove reset-gpios optional property
> 
> version 3:
> - add orisetech,otm8009a and raydium,rm68200 compatibles
> - add reset-gpios optional property
> - fix indentation on compatible enumeration
> 
>  .../display/panel/panasonic,vvx10f034n00.txt       | 20 -------
>  .../bindings/display/panel/panel-simple-dsi.yaml   | 67 ++++++++++++++++++++++
>  2 files changed, 67 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
