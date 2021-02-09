Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C61315680
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 20:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D1C6E131;
	Tue,  9 Feb 2021 19:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC4D6E131
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 19:08:52 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id x10so2974325oor.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 11:08:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6b5y2jfonq8mD3bhapQvrVV6hIqyDO03kDayMwI1f7o=;
 b=d34uiWX38RkoSMvBF56TjOa2QwKkpARPEvOhxVD3zgooBbdizbl9Ds6PYlgRmLPnaD
 mE1K0t40fxeZl9bPy7CYbFjR8LLSANekrpfb+LAbd7blT1260kn8Ze5LxwKPyQwXIAOO
 TMqQo/o+W4uMjK/MknOc3usGk0444NvO9TFt98WDgm8UDAgq6LP5BjhbinyXR5GOJlDf
 aUnThr0YM0GWXoOa3rOy2SQb2ZWfBCHpC6kfbyGBVTiDlU6ei8q/kCmAGWkVI+jA1zVB
 lelpLh9UhtGjRfYTDc4EqHLRlwAPHLEhouTUBaGs4pkKphSSwnwBWc2wLnXr6StBavou
 jpiw==
X-Gm-Message-State: AOAM533rFeFpg7xQdyUA7/D5/1Z6eTxRcatG9oN4xfMGTF90utYz6/zJ
 cOssMEQV2LyvN7umAAwzAA==
X-Google-Smtp-Source: ABdhPJzEb+6TOW87AfnKdxzZ9Ldho7rHViFKpHVw9B1UL+E21N3MUSbFop1cbCOjs26U1Y0Df5Qfxg==
X-Received: by 2002:a4a:dc99:: with SMTP id g25mr11403336oou.14.1612897731815; 
 Tue, 09 Feb 2021 11:08:51 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w10sm738842ote.29.2021.02.09.11.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 11:08:49 -0800 (PST)
Received: (nullmailer pid 4168444 invoked by uid 1000);
 Tue, 09 Feb 2021 19:08:48 -0000
Date: Tue, 9 Feb 2021 13:08:48 -0600
From: Rob Herring <robh@kernel.org>
To: Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: Re: [PATCH] dt-bindings: mxsfb: Add interconnect bindings for LCDIF
 path
Message-ID: <20210209190848.GA4168414@robh.at.kernel.org>
References: <20210127114901.26259-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210127114901.26259-1-martin.kepplinger@puri.sm>
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
Cc: devicetree@vger.kernel.org, kernel@puri.sm, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, kernel@pengutronix.de, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Jan 2021 12:49:01 +0100, Martin Kepplinger wrote:
> Add optional interconnect properties for the dram path requests.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
