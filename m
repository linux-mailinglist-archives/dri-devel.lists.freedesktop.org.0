Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B156274E58
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 03:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF156E0EA;
	Wed, 23 Sep 2020 01:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21F26E0EA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 01:28:40 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id r9so21993728ioa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 18:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GvvIo3jDY0VYkefQndKzNnYYk/UrLw7GL4P6C4Xiiqs=;
 b=fYxUai2DkSgeRkc6s4hwm6beAUDdYj9rhQwWjMlQVpEmqrZkM6srjPUgdl04jcwBQ8
 RlUSm8f/Uvr+sYhYm8tnQOv+to/bg4WlssGl18OUca3ubK4jG0SFSF2sPCNd4Ln2oAlc
 /PtA580O7GbF/Y4BAMrEH+SVJH4A4KT+v8DrnENAvxEzBYgBUtBN39oiUhmqT3xCL1gn
 ssQr0kXWV7PoP9mqFzEi6P4uGA8CRZQKQHhMZ8kalGxmzp3FFcCoEyNBOCmNGWhbAIQY
 UX7Y7BurDhmeVbX2+2eGRCagxu6z0j9iTA/+0X+aol7JT+HkSVLnn6BQH2JXGtUkT4kf
 4CaQ==
X-Gm-Message-State: AOAM533Bl3x66Moh/Gj17L91UPgUYPE5lsMdc5RbDajd6Pvm6cskWhwE
 CqEt4gS7KI6mdVqiHJGMdw==
X-Google-Smtp-Source: ABdhPJz5+rMpCYmHiY5Qrgls04pxpbzB3K5fYJBD9AXk28cIf/T7aHCIGDKW4YFqW+qS0OrsiGCiiw==
X-Received: by 2002:a6b:7112:: with SMTP id q18mr5543907iog.79.1600824520112; 
 Tue, 22 Sep 2020 18:28:40 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id y3sm2326804ilh.76.2020.09.22.18.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 18:28:39 -0700 (PDT)
Received: (nullmailer pid 3656746 invoked by uid 1000);
 Wed, 23 Sep 2020 01:28:38 -0000
Date: Tue, 22 Sep 2020 19:28:38 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: display: panel-simple-dsi: add TDO
 TL070WSH30 DSI panel bindings
Message-ID: <20200923012838.GA3656693@bogus>
References: <20200915121912.4347-1-narmstrong@baylibre.com>
 <20200915121912.4347-4-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915121912.4347-4-narmstrong@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 linux-amlogic@lists.infradead.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Sep 2020 14:19:11 +0200, Neil Armstrong wrote:
> This add the bindings for the 1024x600 TFT LCD TL070WSH30 DSI panel to panel-simple-dsi.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
