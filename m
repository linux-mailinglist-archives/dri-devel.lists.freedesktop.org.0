Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 113A433185C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 21:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF6E6E877;
	Mon,  8 Mar 2021 20:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB836E877
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 20:22:56 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id i8so11388474iog.7
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Mar 2021 12:22:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jfi2aPqw0ChJqx8vxxHvr5nY7+u1FCowOmUR1NpI1Xk=;
 b=HayW6q9flzBkVRjEVms1uA8+Qaz5cOrCJ9H/vZZmv2TIAIH3/yUnFyawOJ0vxfGbac
 fNSv6BH3C0bf3cXx5UNO36jtdcCO9B5xZw7vymn5Fd5FOxiE3jQg1JMkmQMsKaZPs3E4
 nAKBqXuybblYsrafeRasO1qP7JyLk2EQsKitu/rUwJkkoBYhLbIrYl8dh2POK0pgONOD
 OjsS/HfuU8xegWAuKhKua6f98sjIf1Ew7NSvvg2gSF5Q8sYdox2AbGG+7bou7PBYgiAT
 6uKBad9tukt44rgAfAnEbUUp7VCaisk6gpOJg6y6Dqd5NwYgsP4HuQSiGQKZLUa+ZtrQ
 mqeQ==
X-Gm-Message-State: AOAM532WJHy6/C9+rCF2lsLzlDzOJ4HJZhhxPQMik7xxWpRSm1Zrrnof
 SZZ2ms8owKhvarv2NtHS7Q==
X-Google-Smtp-Source: ABdhPJxQfWFWuxQMzuNGDXRT8YnjCNfgHq5hSq5MQJMX+6MHhJRomQb5K0FHQNafxooMET8AsrT7Xg==
X-Received: by 2002:a05:6638:140e:: with SMTP id
 k14mr9938401jad.31.1615234975633; 
 Mon, 08 Mar 2021 12:22:55 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id i67sm6548510ioa.3.2021.03.08.12.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 12:22:55 -0800 (PST)
Received: (nullmailer pid 2899522 invoked by uid 1000);
 Mon, 08 Mar 2021 20:22:53 -0000
Date: Mon, 8 Mar 2021 13:22:53 -0700
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: bridge: Add Chipone ICN6211
 bindings
Message-ID: <20210308202253.GA2899425@robh.at.kernel.org>
References: <20210304092133.21717-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210304092133.21717-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Robert Foss <robert.foss@linaro.org>,
 linux-amarula@amarulasolutions.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 04 Mar 2021 14:51:32 +0530, Jagan Teki wrote:
> ICN6211 is MIPI-DSI to RGB Converter bridge from Chipone.
> 
> It has a flexible configuration of MIPI DSI signal input and
> produces RGB565, RGB666, RGB888 output format.
> 
> Add dt-bingings for it.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v4:
> - fixed Laurent comments
> - added regulators
> - replace reset with EN
> - fixed warnings pointed by Robert
> Changes for v3:
> - updated to new dt-bindings style
> 
>  .../display/bridge/chipone,icn6211.yaml       | 99 +++++++++++++++++++
>  MAINTAINERS                                   |  5 +
>  2 files changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
