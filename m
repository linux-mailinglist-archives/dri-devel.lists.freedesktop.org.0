Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF601652F4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 00:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674006E883;
	Wed, 19 Feb 2020 23:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B466E883
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 23:12:20 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id q84so25628574oic.4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 15:12:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CLPRmzON2R02+/ZY31sqBcy//1vfhbocYVY0OJmPA7Q=;
 b=RsaRjE91uTjlFVnRajA1rKBciu+7asImASOv0kADqrmKLpJDd561hNeEgNEiI4AUjG
 p26cHJS96+JDUBZwAdQrYajdZqd0328mCH4Zs/u/DbuhOx4xiTRKAXPtc/6dvO3l955t
 gtpQ5c3glzOFxv9djiWsDpTzLI7UWYY+peBxoHNmx3/h6CA360EhJ7Qc8ktCRrps4pCn
 aVqYpvk1Kcz4KsojGt7+5nGMpcENFJkenlWtrseRn0Yygp0yEhRmvuO7eSESDcTm1jV0
 N8QQiVaNdbfZ0kmAPC1hl3F6NcWs+12oslkjNqVJgz+KLrKmNXP4xvNJjfcfN1FXekVy
 EwqQ==
X-Gm-Message-State: APjAAAVNfqYDIgzsGDyRpZ5ZmcYgbjWqWyG40pd5t2cknfxU4QaNfsqE
 jehozMS54y6g3I220OXH1Q==
X-Google-Smtp-Source: APXvYqyH6dHK8cr/NZ+DC/49bIcKPOlYG+691fjOnLj0uJTTKRot/Tcf71eVud11ZtmHjyKBDuPNUA==
X-Received: by 2002:a54:4418:: with SMTP id k24mr77122oiw.46.1582153940062;
 Wed, 19 Feb 2020 15:12:20 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h15sm420269otq.67.2020.02.19.15.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 15:12:19 -0800 (PST)
Received: (nullmailer pid 17648 invoked by uid 1000);
 Wed, 19 Feb 2020 23:12:18 -0000
Date: Wed, 19 Feb 2020 17:12:18 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/4] dt-bindings: panel: lvds: Add properties for clock
 and data polarities
Message-ID: <20200219231218.GA24409@bogus>
References: <cover.b12a054012ce067fa2094894147f953ab816d8d0.1581682983.git-series.maxime@cerno.tech>
 <620a740cec4186177ce346b092d4ba451e1420dc.1581682983.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <620a740cec4186177ce346b092d4ba451e1420dc.1581682983.git-series.maxime@cerno.tech>
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
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 01:24:39PM +0100, Maxime Ripard wrote:
> Some LVDS encoders can support multiple polarities on the data and
> clock lanes, and similarly some panels require a given polarity on
> their inputs. Add a property on the panel to configure the encoder
> properly.

If the panel requires a specific setting, then that can be implied by 
the panel's compatible. Does Boris' format constraint solving series 
help here?

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
