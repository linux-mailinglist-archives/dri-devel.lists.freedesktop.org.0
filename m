Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC92269955
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 00:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F8A6E819;
	Mon, 14 Sep 2020 22:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AF96E819
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 22:59:05 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id g7so1923805iov.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 15:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LCh2smZwgKVHCxnQ9DcuXiZIOWVUKlrP/EzDl1tNmTM=;
 b=bwPrUmb0PXnNissHgiFIf3Prewn7fjskwPdHJ3GcTxf0NcTvujqh5e9tOIpkO9/MV8
 Rl5tQN6rc5MsKEVdk7IBbnXWkKTh+IgUf9Yn9K2NfLagZejwHHyJJ+5vM3aA5Kg6CvE7
 aQHWqZe3sUltVa/WTFPQ9oWvsp4BbhusBJL3bzrYCH7zLseeWAmL87GqqGBvDCrZEZvw
 0dsfkqAZcnkM3FAgbgjXc/9EpM9xjOSKeGWTtXMfifnvcmpiCcYWHIGlyW8UDXLrSEU9
 KfRu7dDK0BvZZedXpQvUWkNsEZw3bAUViu9Ltjzd1LK5WvAEgVGWrq/cUjCkMg1hPJsL
 PBcw==
X-Gm-Message-State: AOAM533T2vSpcYKBwrAcTWdw//FFXaDteYs9aPu9rajA9JNGHfwM4H/M
 rrPhtMOlskidQkISyIEJvw==
X-Google-Smtp-Source: ABdhPJwg9SXVtlfD7QKMD3JxTDGoE5iHv83Jvob/8jF4NnmwXRVyMr0Wg3gJ9u9qA/pV61mBnJaPcw==
X-Received: by 2002:a5d:984f:: with SMTP id p15mr13234469ios.70.1600124345336; 
 Mon, 14 Sep 2020 15:59:05 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id z72sm6739578iof.29.2020.09.14.15.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 15:59:04 -0700 (PDT)
Received: (nullmailer pid 429138 invoked by uid 1000);
 Mon, 14 Sep 2020 22:59:02 -0000
Date: Mon, 14 Sep 2020 16:59:02 -0600
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 2/3] dt-bindings: display: simple: Add YTC700TLAG-05-201C
Message-ID: <20200914225902.GA429086@bogus>
References: <20200904180821.302194-1-jagan@amarulasolutions.com>
 <20200904180821.302194-2-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904180821.302194-2-jagan@amarulasolutions.com>
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
 linux-amarula@amarulasolutions.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 04 Sep 2020 23:38:20 +0530, Jagan Teki wrote:
> Add dt-bindings for YTC700TLAG-05-201C 7" TFT LCD panel from
> Yes Optoelectronics Co.,Ltd.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
