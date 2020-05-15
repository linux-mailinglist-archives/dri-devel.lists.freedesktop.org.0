Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9B61D43F4
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 05:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D916E3DB;
	Fri, 15 May 2020 03:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462AF6E3DB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 03:16:33 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id 19so998267oiy.8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 20:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0StfnlWCTTFp92r27GLv48pH80mCOZ4IKYTbMwwyGtI=;
 b=o9F7B1ztNo5BPNgyuSQo2zCJEDh7fxEVOjhgRhNjQNLXDs4jo1unybzKaS2sfhEiHx
 ZwAfLvnFh+pJOyWV9OKhrwQbSSV69hjPTbC8gq3GKMvoHeMd0uS7w2Tnnfa+FLrh5C2x
 w555b7WMVHXQ0IwI93lQig9vPQTq1VL59gykz2qfXm7bybbeHqhKWXYce0loFRNVBcqK
 lEWbmzO2jJpbNJbBe2SjvXTtrS+GPERgU8uxNFSrSb1HL6NR8GeVGiuKTJ1ie9OY5mz6
 1bZv4X8Qqz42Dozw0J4RelCk63TCdVHHRIYM77UfyXbMK2sD5wZ0hFgYO1cKf4kMw71b
 Xm9A==
X-Gm-Message-State: AOAM5329Q4K3r7bd1y9zgFTJfe2lqfQpmNG9BenXzUM7htwwRxq77YVA
 WD+bJg4nixfYx5JbJhmHdw==
X-Google-Smtp-Source: ABdhPJyhFa2AewumsZDuk0U0TtsUF18nHvq+KZ9DfYIxW3gYTjTsJyd5oCQlaERXn3mGQPDIIlQDig==
X-Received: by 2002:aca:f454:: with SMTP id s81mr695553oih.138.1589512592606; 
 Thu, 14 May 2020 20:16:32 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h189sm313661oif.10.2020.05.14.20.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 20:16:32 -0700 (PDT)
Received: (nullmailer pid 3447 invoked by uid 1000);
 Fri, 15 May 2020 03:16:31 -0000
Date: Thu, 14 May 2020 22:16:31 -0500
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v3 19/20] dt-bindings: mali-midgard: Allow dma-coherent
Message-ID: <20200515031631.GA3388@bogus>
References: <20200513103016.130417-1-andre.przywara@arm.com>
 <20200513103016.130417-20-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513103016.130417-20-andre.przywara@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Sudeep Holla <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 May 2020 11:30:15 +0100, Andre Przywara wrote:
> Add the boolean dma-coherent property to the list of allowed properties,
> since some boards (Arm Juno) integrate the GPU this way.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
