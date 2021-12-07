Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4F746C4B3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 21:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133F76EA6C;
	Tue,  7 Dec 2021 20:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BF26EA6C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 20:33:09 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 w15-20020a4a9d0f000000b002c5cfa80e84so114310ooj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 12:33:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xA0nPE6R9nK4ea4eTkYln2f/j9/KE4TsDRpF5BuqXeU=;
 b=xso9Bu3GR93AKlMKNPjk8DvBacMqSFGJEvNBpQFoSeSVxcVfvMvWdSiyt/4rT8TTci
 S8dgqvAl8wN6VC9HGBUPzJeN50qQDQGWwbLZ4atv+HxlBupdMwllnihOwufFC0xUh6Sp
 KkILse3CUK1WpZXpC89C+vDfRYxGq7RuC+jRs6ZnJykzNUHgCJJ6sFB4ApTfG1fZAtby
 D31G13S8pjZ/2BDsLAfwe3BCI+KO/mV0hhiRWd9xIb6MxrBnpmYNFX0VkeImElRA5dA1
 ejENnpmcOQIPt2pg1L5qnWA+RwRghjxdR+lUeRCoLNgAcTpUpABuN4EnuAoraWU66Nyr
 ArgA==
X-Gm-Message-State: AOAM532dvD6hHQzPN29jE5Eo3iCajXFq8Up0ZcOFaKkW2+wYJuNEAxrY
 92dqLCsy8jf5LXdfctc9YQ==
X-Google-Smtp-Source: ABdhPJwWWcfkVKcf53vjPAef3PQc1CO1KAF2Iyz9J/Jc878jOTzCjyP94u7dHBwv0jMkcX90NFycCQ==
X-Received: by 2002:a4a:3744:: with SMTP id r65mr28060318oor.11.1638909189142; 
 Tue, 07 Dec 2021 12:33:09 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l39sm140462otv.63.2021.12.07.12.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 12:33:08 -0800 (PST)
Received: (nullmailer pid 781697 invoked by uid 1000);
 Tue, 07 Dec 2021 20:33:07 -0000
Date: Tue, 7 Dec 2021 14:33:07 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/3] dt-bindings: display: simple: Add Team Source
 Display TST043015CMHX panel
Message-ID: <Ya/FA4U+oJ1aejeo@robh.at.kernel.org>
References: <20211127031909.283383-1-marex@denx.de>
 <20211127031909.283383-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211127031909.283383-2-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 27 Nov 2021 04:19:08 +0100, Marek Vasut wrote:
> Add Team Source Display TST043015CMHX 4.3" 480x272 DPI panel
> compatible string.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
