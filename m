Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8037F3AD41F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 23:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956806EAAE;
	Fri, 18 Jun 2021 21:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3021F6EAB0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 21:06:39 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id u11so11987945oiv.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 14:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w7lyGyrFAML0Yig1eUfs9PBn3aotrCMVHhnAEEshvHs=;
 b=VBs490xJ8qt8EvizIRLtJZU9n6V9cB+cJr/wA9Im/mQPGYPdkPF+Ckvmipwm2BuOww
 sPnlCJwkA+Y56nxoOunUNaqVimhZiNxk+eH2uRqGzLdtyQaE+nJMK0r75gQjlTvHO9mu
 q5Mfr8X2/6xRc0R7aD9iB9GTxtusJALiz1d3B8DnPJ0pdjrOSBaEw6wfF+eYrPI0Zzsx
 kmB4O5SmpQXm+UDyrl8VzzYA8cm81l70MQZvqNF33IW1jAnDaxl2sza4CYlG6VYbw8H6
 3i94PGwU+Usb7B3n1gX+oyVRnIyXdl5ARULK7PRRSJHsvAwuh4cWIJMsNsoH43Tz5Mc9
 Zc4g==
X-Gm-Message-State: AOAM530EsQOW5F0j0Ni3logvIcJ9icyxH+yWIGaCGdj1scdHmu2vfYJI
 h/aoyQWkCwGUbqDDEd1YMQ==
X-Google-Smtp-Source: ABdhPJy9BVM8JnW1fklyNIsJf+HjmUAJv6l+X1dfrWJd5kHxG8MZpWxMuP+Z3rmPjas11wLLEtoWDg==
X-Received: by 2002:aca:fc91:: with SMTP id a139mr15981093oii.12.1624050398597; 
 Fri, 18 Jun 2021 14:06:38 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id 129sm2063231ooq.34.2021.06.18.14.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 14:06:37 -0700 (PDT)
Received: (nullmailer pid 2874290 invoked by uid 1000);
 Fri, 18 Jun 2021 21:06:32 -0000
Date: Fri, 18 Jun 2021 15:06:32 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v1 2/4] dt-bindings: vendor-prefixes: Add an entry for
 SKOV A/S
Message-ID: <20210618210632.GA2874235@robh.at.kernel.org>
References: <20210609121050.18715-1-o.rempel@pengutronix.de>
 <20210609121050.18715-3-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609121050.18715-3-o.rempel@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 soc@kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 09 Jun 2021 14:10:48 +0200, Oleksij Rempel wrote:
> Add "skov" entry for the SKOV A/S: https://www.skov.com/en/
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
