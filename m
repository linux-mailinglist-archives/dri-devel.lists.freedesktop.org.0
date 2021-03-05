Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 767B832F6AB
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 00:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83266E442;
	Fri,  5 Mar 2021 23:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C3E6E442
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 23:37:30 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id h10so3500814otm.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 15:37:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=avIgaCjZx7xZP5xD7lCoiVIwwMsR+J1WotAliURSl0o=;
 b=tnzo9GIM5a64QuhdePP8EcSfVJNpEEZSMZ+YYW8GSxvXVLJBLJAmPaCKeDFCfQ/K8v
 hwNHLo0BZAh77eZpAgo03Up9EvDTDPD1U+wHK4hjJ7OULsZtkgBuBsaAUvOl9Z3j1cEk
 wh+Y42j8OyIWy4HF+ZPbTp8gX2vRQx7ZZrfI282ljcQKJAOAhbTa4krkhXLnHP99JpAg
 P6wVrfIShqi306qHA8sj4+whobSew6Ti8ccEI2l04aMvdIb8+B7ahy/44MS694pZWnU5
 znnzXD1L4O9R8NV4TYws7xZb+XknLrGfFhMismKqQHtcBeHgeusWC7vaQ76r8szlRhDE
 rUFw==
X-Gm-Message-State: AOAM533lPIkzFA7OZmm5aFEtO/WM41fMXI9jzsd2WMxqi7Gv37+V4NCv
 z0El6DKGDtQUOJzetHSijg==
X-Google-Smtp-Source: ABdhPJxovQ8qpv7JyGxgqOTDP3NnTNV7W7I55n/ucnyD7O2E6RtW5mx/WJ8qNayfgPWDymD8DWh2uA==
X-Received: by 2002:a9d:7e8d:: with SMTP id m13mr2818607otp.54.1614987450202; 
 Fri, 05 Mar 2021 15:37:30 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z13sm973264oth.48.2021.03.05.15.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 15:37:28 -0800 (PST)
Received: (nullmailer pid 850673 invoked by uid 1000);
 Fri, 05 Mar 2021 23:37:26 -0000
Date: Fri, 5 Mar 2021 17:37:26 -0600
From: Rob Herring <robh@kernel.org>
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: Add STARRY 2081101QFH032011-53G
Message-ID: <20210305233726.GA850643@robh.at.kernel.org>
References: <20210222153454.20198-1-xiazhengqiao@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210222153454.20198-1-xiazhengqiao@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org, jitao.shi@mediatek.com, drinkcat@google.com,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 pihsun@chromium.org, marcheu@chromium.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 Feb 2021 23:34:54 +0800, Zhengqiao Xia wrote:
> Add dt-bindings for 10.1" TFT LCD module called STARRY 2081101
> QFH032011-53G.
> 
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
> ---
>  .../display/panel/innolux,himax8279d.yaml     | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,himax8279d.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
