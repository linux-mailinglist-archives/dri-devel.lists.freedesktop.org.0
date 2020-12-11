Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 650632D6EC9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 04:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8473E6EC3A;
	Fri, 11 Dec 2020 03:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DB26EC3A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 03:41:17 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id o25so8376636oie.5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 19:41:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JF6a5cRyN74JfPIki4yBoZHOtyP3dbYKgJjhXEIt/Qc=;
 b=IMQSGAf2AJ3auMK6Pg6hY6xJRExS7QH/c2gL5EPz8Wd5T/7qk8C0gF+YiKOwl9leC3
 Q+xT9sE5vhn/4ZVdEnMG2n3fyp7F+kBAvzWTNA32hwAwrWInKAaastt+Uuy+Bsyo3VWO
 2UFK257x2BJiv/s70Hyn2qV0nxAmNwTS8nFpPjvKhOiGi5fjKRrYS04vPFm32hPG/IN1
 njrqgn1a7Ep3+ogOV8gwA1NshRY0PUAzBtRUFmrus/IGa25gfXriJEHCJGHyK1Y6NyOM
 PtlFyTtxHwjUkEeWeFqWNrzhPGGAZj6QfG5zlH1paX7cjbrco1VJfWYCRpXlhswMbBin
 /MZQ==
X-Gm-Message-State: AOAM532FR4H3qQJRauiTB+1eIqJPoiaakTxRBiRXGIXQ5IDI6JqavEnH
 UZX6pJ0Aj/9Yy7YE148zBA==
X-Google-Smtp-Source: ABdhPJyGbPgGdT7RVO4BHsUzlDrKOpsEQoXFt7a+VKXfIktLizdH955feW9AS7/DqIpm7zeXrKy01g==
X-Received: by 2002:aca:ddd6:: with SMTP id u205mr3560158oig.121.1607658077127; 
 Thu, 10 Dec 2020 19:41:17 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 43sm1572383otf.28.2020.12.10.19.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 19:41:16 -0800 (PST)
Received: (nullmailer pid 3595522 invoked by uid 1000);
 Fri, 11 Dec 2020 03:41:15 -0000
Date: Thu, 10 Dec 2020 21:41:15 -0600
From: Rob Herring <robh@kernel.org>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [PATCH v8, 2/6] dt-bindings: mediatek: add description for
 mt8183 display
Message-ID: <20201211034115.GA3595491@robh.at.kernel.org>
References: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607591262-21736-3-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607591262-21736-3-git-send-email-yongqiang.niu@mediatek.com>
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Dec 2020 17:07:38 +0800, Yongqiang Niu wrote:
> add description for mt8183 display
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
