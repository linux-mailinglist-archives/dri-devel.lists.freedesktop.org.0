Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC454C4DBF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 19:30:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F81410E827;
	Fri, 25 Feb 2022 18:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6355B10E827
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 18:30:52 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 y15-20020a4a650f000000b0031c19e9fe9dso7343227ooc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 10:30:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nO46MVOxeBfrtpgtlpU0KanUna9yJ6hZKlTky8BlctQ=;
 b=CmJemh+NGl8pUA/GOwMKkFpkq1zqHMv3IiNy5wxMlp5aFN+pAVd/7/CM7MNFjHmXT1
 I8nBdHfpsxkRdXy628F168qWfeUhLmVplhkp9T/kyFQuZ5dw8JKBM9L9+G/DZP20YZGr
 R6gqxnhAVOeY0ogRW6iRS/K++EfxJ04Ev5D8Q18Yp1wakYfN6NR0vcOdvycMhXWU1UDH
 t3yVSTPDnroDw80xGIdzladibeOpPPc+ZY8S44OJgcAJknoehIfk+EB4b4u5Xx9LSOWI
 Hco+UZUWQ0/0ABywftYoZsFdvAS+tlnrvSvYcLqD50VnoVwimLKgXgwL1siLCdreP1F9
 Tsqg==
X-Gm-Message-State: AOAM530BHXaBmnWsBLPQHOhl3YvRKkYO/YqmyriCf/qxTtKX+2nGfkUG
 TRbIBMDLpMSEv+HRkajNmg==
X-Google-Smtp-Source: ABdhPJwze7ScTwIWh5otCQGWo8AuNWqBADfUNufKuQfg4u37IUgUudm8gG9CpH7NlIUPHuoaXkQGjg==
X-Received: by 2002:a05:6870:3048:b0:c4:7dc0:d758 with SMTP id
 u8-20020a056870304800b000c47dc0d758mr1983376oau.299.1645813851685; 
 Fri, 25 Feb 2022 10:30:51 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 bx10-20020a0568081b0a00b002d70da1ac54sm1765902oib.19.2022.02.25.10.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 10:30:51 -0800 (PST)
Received: (nullmailer pid 1208822 invoked by uid 1000);
 Fri, 25 Feb 2022 18:30:48 -0000
Date: Fri, 25 Feb 2022 12:30:48 -0600
From: Rob Herring <robh@kernel.org>
To: Rex Nie <rexnie3@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: display: simple: Add InnoLux
 n140hca-eac panel
Message-ID: <YhkgWH1Q1T3vA7BG@robh.at.kernel.org>
References: <20220218102815.1634561-1-rexnie3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220218102815.1634561-1-rexnie3@gmail.com>
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
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 hsinyi@chromium.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 18 Feb 2022 18:28:15 +0800, Rex Nie wrote:
> Add support for InnoLux n140hca-eac display panel. It is a 14" eDP panel
> with 1920x1080 display resolution.
> 
> Signed-off-by: Rex Nie <rexnie3@gmail.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
