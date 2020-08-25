Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4047252329
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 23:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58956E0A1;
	Tue, 25 Aug 2020 21:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D466E0A1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 21:53:20 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id q14so90851ilm.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 14:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7S4jNrtiVeItNvIwFbgTvmiqNgQ9tXiglEZ3XO2eiQM=;
 b=Mnr2s2H62vqtyVtBZ6xJGP2WJiJU18+oD90UmSSpJ9S6tDhxE21/u+/kRCnhFf+tU0
 6gVW//aIE6Pw83bSUtB9b/8s8LRqT1amYQYcv1vsEAVaAR21oLih7IQ21SjxWQEOdHkB
 ZpDPKjxKQPLdnRbecf3m67Om3Ha3T6MbPS4uZo+oXgfIgLu5TKUZo8IEGm0Omfm/uKCs
 1Q99UpWMf4fUk3wUPU30ceiKG9E4+973MfIRkYVgNzUq5b6bvf2TYP0F/n9PzfPSkIUk
 MVcF1p/goTwsDX8ETPBET2/E+SVCr8IRMH7r9hvKqVVlkiK7bj0fQgqxtCc7EkpJt6uW
 ThTw==
X-Gm-Message-State: AOAM5330ROyAlAkZ1mcy8AiHwEyXu6o6v1K/tdnCdgrukh1zyppdeIPi
 Cisy+SKY0uPqGs/eadHMwg==
X-Google-Smtp-Source: ABdhPJwd6+sslgtyqmzuBjzuHXAz/dWhzSBO0h7xbItMhxxl6rpQd2N1rXAI/oFBnitw9IqV28R9gA==
X-Received: by 2002:a92:5f06:: with SMTP id t6mr10331000ilb.212.1598392400065; 
 Tue, 25 Aug 2020 14:53:20 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id p124sm47082iof.19.2020.08.25.14.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 14:53:19 -0700 (PDT)
Received: (nullmailer pid 1403867 invoked by uid 1000);
 Tue, 25 Aug 2020 21:53:18 -0000
Date: Tue, 25 Aug 2020 15:53:18 -0600
From: Rob Herring <robh@kernel.org>
To: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: add Innolux LS075AT011
Message-ID: <20200825215318.GA1403815@bogus>
References: <20200819101206.633253-1-lkundrak@v3.sk>
 <20200819101206.633253-2-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819101206.633253-2-lkundrak@v3.sk>
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
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Aug 2020 12:12:05 +0200, Lubomir Rintel wrote:
> Add the Innolux LS075AT011 7.5" (1200x900) color/reflective LCD panel to
> the panel-simple compatible list. This panel is used in the OLPC laptops.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
