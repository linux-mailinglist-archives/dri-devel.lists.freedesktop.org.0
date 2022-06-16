Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 068E154E87E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 19:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A174112E76;
	Thu, 16 Jun 2022 17:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CEF112E76
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 17:15:03 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id c189so2148718iof.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 10:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wsz4Wv9OOV7UVprXOZZGgHXUiNROQ+LQtSUQCCdiHiY=;
 b=KWYbhPgJyjBhjy60JvIfhsW3WSyZonH6DXTsT0iAyevTWWldMFS6LbNXGjMnnDmYh/
 r1JCXRgzv1qr+hGa7fsDrndp7VMrEZnRE/1R6ERrbLvlOF67XA11KVh+Fv7Oh9+wnKZ1
 z3sZlzbZjqIlTkGMf0fvyQsCjoWAFavncuH3DOYZLa/JmkZ1uwAqQGCLp1il3sj9d0rr
 0yLTUKkbQHlUbyXbg9tlDOmTH3W5h4+/b+cSJ0/7C8q2UMuO/67gN14YmEG0CdvMO5Gy
 Doz/Bj74XTYLKufUMOJB7+8kKOrlLeo/9Oju60RvtCu6awZ0JpLu7aXqA3GIAQ0WsUx5
 fGkQ==
X-Gm-Message-State: AJIora8PLdK3T6YFN+XTU5Llbu7VeitkcJ+BIO8i8O8aSHsfXGpZha1P
 m9vUiVGSo+csisfCjLiV+iXlPvfE2Q==
X-Google-Smtp-Source: AGRyM1uuYTX2p7W3F/DM+dxbOiXkzdq0efjOmqM7mjJohPWXpC/0l78Fg02V+GP1iIxVyeBgYcmVZw==
X-Received: by 2002:a05:6638:1342:b0:331:e382:b0af with SMTP id
 u2-20020a056638134200b00331e382b0afmr3409052jad.32.1655399702631; 
 Thu, 16 Jun 2022 10:15:02 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 i21-20020a02ca15000000b0032b3a7817b3sm1091325jak.119.2022.06.16.10.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 10:15:02 -0700 (PDT)
Received: (nullmailer pid 3665201 invoked by uid 1000);
 Thu, 16 Jun 2022 17:15:00 -0000
Date: Thu, 16 Jun 2022 11:15:00 -0600
From: Rob Herring <robh@kernel.org>
To: Bastian Krause <bst@pengutronix.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: add Ampire
 AM-800600P5TMQW-TB8H panel
Message-ID: <20220616171500.GA3665131-robh@kernel.org>
References: <20220610111511.1421067-1-bst@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610111511.1421067-1-bst@pengutronix.de>
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
 dri-devel@lists.freedesktop.org, Yannick Fertre <yannick.fertre@st.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 kernel@pengutronix.de, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Jun 2022 13:15:10 +0200, Bastian Krause wrote:
> Add Ampire AM-800600P5TMQW-TB8H 8" TFT LCD panel compatible string.
> 
> Signed-off-by: Bastian Krause <bst@pengutronix.de>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
