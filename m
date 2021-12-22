Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C57447D6EF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 19:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CE610E25C;
	Wed, 22 Dec 2021 18:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC21710E25C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 18:36:33 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id 131so3216940qkk.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 10:36:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wDzO3Ad6lSocQgHWVJpmiNVxeeGd17gp3zvJdJeX/e4=;
 b=eDaza5lkau8kGZJI9vF+1vL78Gt6AguFvk9mbGz2GU8Pyg0Xi5MpCH82irAcccbjAD
 lAn3LBsjk+Clmox0nprVJ9cU54Pog2QCGbxL/5cpjhxO2sbBy2ieZMxT6SFn7qGNWz0K
 izsxjzUC6XGBV8NLWmGnSIPtDAW6Nfp7TMk0bZc8rMmEVZiQUgKs9ZO6dOBiqg5ckLHL
 hPsarwdpF6AoM3x730Dl0SiSWyhZa0IB5k/eUxYsjHzE5V2HXcFkBzjoHFZ+sAXwkbSf
 1QOENWIDolR6yQcNHIM89ic0KgSWcYsGGsYEV516W/YPEwlHQAWQa/XmhP6mHhHmYc22
 jCCA==
X-Gm-Message-State: AOAM5325EZIWixulvG0bJsBcNfvsmDM+TZQdV3mkpUnikhV+/MKs/nwM
 SRVPl0nQoV6xhvHbEz1uwg==
X-Google-Smtp-Source: ABdhPJyxpmkjjBfT4ceoTMEnWifcuMUn6R8s3AWzbnMnABxL7BM8/d1xSlbRPS7YeMdTafAGlXwpJA==
X-Received: by 2002:a37:315:: with SMTP id 21mr2935974qkd.52.1640198193055;
 Wed, 22 Dec 2021 10:36:33 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id d5sm2363866qte.27.2021.12.22.10.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 10:36:32 -0800 (PST)
Received: (nullmailer pid 2477388 invoked by uid 1000);
 Wed, 22 Dec 2021 18:36:31 -0000
Date: Wed, 22 Dec 2021 14:36:31 -0400
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: novatek,nt36672a: Fix unevaluated
 properties warning
Message-ID: <YcNwL7lgncq7balH@robh.at.kernel.org>
References: <20211221125125.1194554-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221125125.1194554-1-robh@kernel.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Dec 2021 08:51:26 -0400, Rob Herring wrote:
> With 'unevaluatedProperties' support enabled, the novatek,nt36672a
> binding has a new warning:
> 
> Documentation/devicetree/bindings/display/panel/novatek,nt36672a.example.dt.yaml: panel@0: Unevaluated properties are not allowed ('vddi0-supply', '#address-cells', '#size-cells' were unexpected)
> 
> Based on dts files, 'vddi0-supply' does appear to be the correct name.
> Drop '#address-cells' and '#size-cells' which aren't needed.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/panel/novatek,nt36672a.yaml   | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Applied, thanks!
