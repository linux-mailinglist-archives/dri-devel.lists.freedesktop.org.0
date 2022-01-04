Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D8D484887
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 20:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2854C10E250;
	Tue,  4 Jan 2022 19:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8483210E234
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 19:26:20 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 35-20020a9d08a6000000b00579cd5e605eso48582401otf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 11:26:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YKrA0VG5088QppXxlOYC79pk7hClbKGMriiqTjf+5V0=;
 b=m7DhgBE9CevKB8Y0jIFOvng2UW6WF+4+dt2OQ6gssu3BV9DNurrYLJKAA+q3kypZCE
 VnbCyHM8daLDVLRuj03AEjOkaFCigyiX2uKHs+YCMCufDJ0AKcPcL3/BZeoPPaXFexAs
 NBNXfleMbd3aR5aIvlA4OnrYAP7KkiVtOLxuN4/UzoFQl0Ye1fz68zvHI+UcFgGX8ZYs
 mgv+D4HwJHXfjq8Q4lHWpZSWCICZDTJsyXAqQ+ej7DV+/mJV6iMApklDDVMBK0EXgJBZ
 J70RPYMOIwbXiHtjIZqLSB2MokURHgYUE7Be6dbb7qWMTmgjpUMSfYb04JUZubNBT1Pq
 Ofcg==
X-Gm-Message-State: AOAM530goa/kqjoZmZrtjWItg0mlTjs5DpwnY7okgO+Hnv7oyIY2aVlq
 lGNPGZf+REVBl9Wn/tpypw==
X-Google-Smtp-Source: ABdhPJxCXU9/2UnfSX6FTnORjLMwzO5dNGz4FBXb+4cI/iN163LD8/6FZ+ptpnnF6UXfyvHIEKWbJg==
X-Received: by 2002:a9d:bf7:: with SMTP id 110mr37296906oth.94.1641324379789; 
 Tue, 04 Jan 2022 11:26:19 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j99sm7957678otj.15.2022.01.04.11.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 11:26:19 -0800 (PST)
Received: (nullmailer pid 1261017 invoked by uid 1000);
 Tue, 04 Jan 2022 19:26:18 -0000
Date: Tue, 4 Jan 2022 13:26:18 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: st,stm32-dsi: Fix panel node name
 in example
Message-ID: <YdSfWqj34Ragg+Yj@robh.at.kernel.org>
References: <20211221125145.1195234-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221125145.1195234-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Dec 2021 08:51:45 -0400, Rob Herring wrote:
> With 'unevaluatedProperties' support enabled, the st,stm32-dsi binding
> has a new warning:
> 
> Documentation/devicetree/bindings/display/st,stm32-dsi.example.dt.yaml: dsi@5a000000: Unevaluated properties are not allowed ('panel-dsi@0' was unexpected)
> 
> The documented child node name is 'panel', so update the example.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/st,stm32-dsi.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Applied, thanks!
