Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B832321ABB2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 01:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826236EB50;
	Thu,  9 Jul 2020 23:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBCC6EB50
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 23:35:28 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id r12so3550711ilh.4
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 16:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i3ZcByxD5sOUYO6BTypFXW0gx63ZZKNk26gPN7JuiwM=;
 b=KlYZr+OZpx95b8eyR79MuEd2zIkQtmR6Pib86I6K/6nDDHXM90yahCIwKLoOcHgFxK
 iWfbeTgCzsyApTNsd991FhhPBTVpoeFP7ILASZXtmamrqq1/u/f/wLt8lmjmXMl+DO32
 /0p6GvdlF77PODfpvDsXgr4qoY/xJyigHMqYbb2X/BIwF7dBA9BEC+2DKEJEoJyEx8Tg
 WNjA/JgHL2klDOwt0vu5zLh99Lsgtmaz1ZDLWalNjYqeYicffnYBiO2FfYbIhAXEXVSE
 pW5RMzp9cPSH4SVARwz6fOlYtl6cC279rEA6GHJj7g/uZxzkdt9obYtnJEQbnuJKH1ie
 ThNw==
X-Gm-Message-State: AOAM5319YmZ/JGJZyvKyKedCjeNX8gKojygPfit/1vWTVBDPu29LoKXH
 cj3B2oBHkIBmRhycIoMSEQ==
X-Google-Smtp-Source: ABdhPJxq31uOZ27XEzh3iNJeV1tgVEOymKY4HNIG5EXUF7FCriA+2zULBD6JRgXW/bW+3AZ5LRef8A==
X-Received: by 2002:a92:4b08:: with SMTP id m8mr46961305ilg.150.1594337727391; 
 Thu, 09 Jul 2020 16:35:27 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id b2sm2596006ilf.0.2020.07.09.16.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 16:35:27 -0700 (PDT)
Received: (nullmailer pid 1110597 invoked by uid 1000);
 Thu, 09 Jul 2020 23:35:25 -0000
Date: Thu, 9 Jul 2020 17:35:25 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: convert innolux, p079zca to
 DT Schema
Message-ID: <20200709233525.GA1110544@bogus>
References: <20200704102806.735713-1-sam@ravnborg.org>
 <20200704102806.735713-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200704102806.735713-2-sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Zhong <zyw@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 04 Jul 2020 12:28:04 +0200, Sam Ravnborg wrote:
> As the binding matches panel-simple-dsi, added the compatible to the
> panel-simple-dsi list.
> With this change enable-gpios is now optional.
> 
> v2:
>   - It is a DSI panel, add it to panel-simple-dsi (Rob)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Chris Zhong <zyw@rock-chips.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/innolux,p079zca.txt         | 22 -------------------
>  .../display/panel/panel-simple-dsi.yaml       |  2 ++
>  2 files changed, 2 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
