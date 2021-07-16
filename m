Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 520433CBB8E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 20:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8447C6E8B4;
	Fri, 16 Jul 2021 18:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1160C6E978
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 18:00:59 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id z11so11664405iow.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 11:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BQfg6bk1Rki9URomuLmaOYZJZmzHHE0q6T5kl0dqKzc=;
 b=s8Y0no7GKfOlOh356PkEWSP9bTykQQMY4/5KBo1d3pBBSqRz0w8CJeoM2O/97dcVII
 BFZ/uTasbOvcUlw73XBbxs9fhN38qg8nEqdSRCAn/5wzQDfmvoZxbTkvpsDCqSKxpeyo
 aVYwhqEMZUP1290O8FdPwPyhGuK0PvukTJYE1tezqRkCi2mZAoElQXmkb1YMF8HEqmP5
 jCAPbOt39xeUBrAXbGKzSp8oR5FsxLMpOY1x0W0k+WCmI/+ep0L9AN5DqYspcyGDjgcs
 9WDvuMvGySzN/bi27RwPk7ZQUWLwlABcAsVG47fhb/w6ftn+E+0K8jO1/ucjCrZBspy2
 sFwg==
X-Gm-Message-State: AOAM531ZjeNmTY04G0gfdvgNGz26MHPTzqJAh10Ac7wjcIshdgeGOs4Q
 sazJZbFyT17w7YIV03mmYA==
X-Google-Smtp-Source: ABdhPJxa2Fz8IfViDN38tLukY0ZzwaZsIaURYqO0PCSn2LSrQ1SuNn5oEzbxXaNpvO7fXpXb4YHFzQ==
X-Received: by 2002:a5e:a908:: with SMTP id c8mr8269101iod.116.1626458458501; 
 Fri, 16 Jul 2021 11:00:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id 204sm5475213ioc.50.2021.07.16.11.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 11:00:57 -0700 (PDT)
Received: (nullmailer pid 3684041 invoked by uid 1000);
 Fri, 16 Jul 2021 18:00:54 -0000
Date: Fri, 16 Jul 2021 12:00:54 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] dt-bindings: display: renesas,du: Make resets
 optional on R-Car H1
Message-ID: <20210716180054.GA3683980@robh.at.kernel.org>
References: <98575791b154d80347d5b78132c1d53f5315ee62.1626257936.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98575791b154d80347d5b78132c1d53f5315ee62.1626257936.git.geert+renesas@glider.be>
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 14 Jul 2021 12:19:36 +0200, Geert Uytterhoeven wrote:
> The "resets" property is not present on R-Car Gen1 SoCs.
> Supporting it would require migrating from renesas,cpg-clocks to
> renesas,cpg-mssr.
> 
> Reflect this in the DT bindings by removing the global "required:
> resets".  All SoCs that do have "resets" properties already have
> SoC-specific rules making it required.
> 
> Fixes: 99d66127fad25ebb ("dt-bindings: display: renesas,du: Convert binding to YAML")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> v2:
>   - Add Reviewed-by.
> ---
>  Documentation/devicetree/bindings/display/renesas,du.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Applied, thanks!
