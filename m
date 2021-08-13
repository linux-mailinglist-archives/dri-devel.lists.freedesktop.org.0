Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB0B3EBDAB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 22:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C1D6E8DD;
	Fri, 13 Aug 2021 20:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315EE6E8DD
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 20:55:19 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id u10so17802602oiw.4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 13:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7BO2ChIUuNpq3WeTk0/EByYq5NnLR/krREfPVXHnjWs=;
 b=EEIr7sKyMfHAcnkMNbfEyUczx72yns+nfrGJVQMHqr2XSEO3tR6Sy54BD0wurPqQ1H
 H6cKYUlT1e+lUaTW/sWVDRVg0Nqzmc3u+TNUfkS2WI6Yemrbhf9PMEViI/pSr9FF8D+G
 GVmw7vvNIXFU79RDAyk+3FfhDpMLuJ5KQwglUS/JkhFUrmawmlw2dvAn6smDf3PSCoqx
 To0ig1bs0N7p0ma0dk9iTQBeogXUDGv34xldTDb1GUMYMUVR42w6ZoNBMiMGUuWzd0wP
 62LOJOD4aY4Q6Fod3Ppf5BxGLdO3PfrcaH4BTqaErPfPp1vHGrTmp+UlJqzD0Hip+9Zb
 bRLw==
X-Gm-Message-State: AOAM531WY4bzL4KPWHAfzAqr2PX/J5auRXlf1QKapF11xYyaCKFJmbDJ
 NLI83sJ9SAfh80LOB2KaFQ==
X-Google-Smtp-Source: ABdhPJzneb8YgUnhnQwPss2jCeHxOJcbK7td+ujVZXi3MHUQPfw/T/R3qMeWlG2j5d5ErA2Mpsy6cQ==
X-Received: by 2002:a05:6808:8c7:: with SMTP id
 k7mr3725650oij.53.1628888118504; 
 Fri, 13 Aug 2021 13:55:18 -0700 (PDT)
Received: from robh.at.kernel.org
 (2603-8080-2a06-ed00-a2a6-2d62-395f-9378.res6.spectrum.com.
 [2603:8080:2a06:ed00:a2a6:2d62:395f:9378])
 by smtp.gmail.com with ESMTPSA id m9sm481841ooe.32.2021.08.13.13.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 13:55:17 -0700 (PDT)
Received: (nullmailer pid 4016157 invoked by uid 1000);
 Fri, 13 Aug 2021 20:55:16 -0000
Date: Fri, 13 Aug 2021 15:55:16 -0500
From: Rob Herring <robh@kernel.org>
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Stephan Gerhold <stephan@gerhold.net>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: Add Sony Tulip Truly
 NT35521 panel support
Message-ID: <YRbcNJHLkvmoG+TM@robh.at.kernel.org>
References: <20210809051008.6172-1-shawn.guo@linaro.org>
 <20210809051008.6172-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809051008.6172-2-shawn.guo@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 09 Aug 2021 13:10:07 +0800, Shawn Guo wrote:
> The Sony Tulip Truly NT35521 is a 5.24" 1280x720 DSI panel, which can
> be found on Sony Xperia M4 Aqua phone.  The backlight is managed
> through DSI link.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  .../panel/sony,tulip-truly-nt35521.yaml       | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
