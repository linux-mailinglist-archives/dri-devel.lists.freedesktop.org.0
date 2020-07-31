Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3BB234CB7
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 23:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36B289C25;
	Fri, 31 Jul 2020 21:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9728589C25
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 21:13:12 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id e64so32991797iof.12
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 14:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BC4DgRY9TG1oWX1U1WKTSv2Wn5LtvSbokQfUo59gzXU=;
 b=hdUz+9jkA2DZmmGs2QymrIkrT41skoV9r3Nr/x/SAC4QiBCGhO7ZksNplyYXSu2kHB
 Q+zEZqPQU97r657JqR2k01mwxfCAMIgI5BXOik3uezwa3lH7oSE3RbiX5PGjjmYUgQ+X
 R3VZs7JeiGTt2Z46DCjCDRZ+tJC6kdWUMS0g/nuRqmhNdChOru2ThJzyGL013u5ReaEz
 3MrY8RwwuYUK5YuUzrA2Gqh20m7aopcDuBFs3XJAe00vPVvriHdEE79OpfIJjM0QaoAr
 p3Qvz1bmCS4lBzwh/61ZZrv5x+MaeDg5GAodCGPiYcTv0UXKRtPuuDD4mKgV5h6fZqd4
 i+KQ==
X-Gm-Message-State: AOAM533XHcTiZkBD/IMlXrKVMvekG3Z+y37x9P1hyS0XoTx9ho3o1uAv
 WayL5AsFov2gGzDSiBmfIQ==
X-Google-Smtp-Source: ABdhPJwVUm05hxCDesrq8eoGLM93f3+fIyi6L+QzneYi8BpnHy405llmvB5hxnYF+vqcdh7VYyNiMg==
X-Received: by 2002:a05:6638:2164:: with SMTP id
 p4mr6989520jak.57.1596229992022; 
 Fri, 31 Jul 2020 14:13:12 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id f27sm5715789ill.75.2020.07.31.14.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 14:13:11 -0700 (PDT)
Received: (nullmailer pid 799601 invoked by uid 1000);
 Fri, 31 Jul 2020 21:13:10 -0000
Date: Fri, 31 Jul 2020 15:13:10 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/3] dt-bindings: Add DT bindings for Chefree
 CH101OLHLWH-002
Message-ID: <20200731211310.GA799522@bogus>
References: <20200728201242.4336-1-marex@denx.de>
 <20200728201242.4336-2-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728201242.4336-2-marex@denx.de>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Jul 2020 22:12:41 +0200, Marek Vasut wrote:
> Add DT bindings for Chefree CH101OLHLWH-002 10.1" 1280x800 LCD.
> This panel is connected via LVDS.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> To: dri-devel@lists.freedesktop.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
