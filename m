Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBB44B2719
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 14:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B4B10EC24;
	Fri, 11 Feb 2022 13:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CD010EC24
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 13:30:46 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id h7so11342278iof.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 05:30:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yXYDTPVyzNL3HdggD9t7igGwyc5OPXWVE0t2GHzk0/Y=;
 b=tME9rDshyL5RFqVXOFGn6RU3SveUZoAzTWkl443c1LVH/c7rOoetn4pKGzqr9w/5pQ
 3wOIwfKwEruTZ4nfSjKcqLF3V9VKGwqQ0LPHNV+XNTuisAyv6MynBufA8LorOq6NeFWV
 IKcbm8JGBjE9Tyuu+NWhRMaLUtOVxfpvU3j7uFVVhJlOrZSG4VvrNqv9yBdbwAHkhOSP
 j5rToxN2TH+7C3L2DlmoA8S9lI9JkReWDC5ZU3VslegyLGY50aVLgIaqoiVXaIRhQ02Z
 yAbTYYsgbe98cLrJeirK5P0NjDdwU1LOPsV2Lc9jTeeBc6emvFGBMn/ABUhO/SodX6rY
 Bc/Q==
X-Gm-Message-State: AOAM531+3lUehRhMQYtYQai7blJQvMgsGe9fyFTOLvP+6Uz6E7ZNBLsX
 9eJRK8fZO1fCbj7m2vzgbQ==
X-Google-Smtp-Source: ABdhPJz0I90OIyzyeltUDleVrE7USdaTR5yvb//9XL91SKkbLY5srdLk2U1GTdfIJKY/EPJVn7xunQ==
X-Received: by 2002:a05:6638:d0c:: with SMTP id
 q12mr835349jaj.310.1644586245902; 
 Fri, 11 Feb 2022 05:30:45 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.139.71])
 by smtp.gmail.com with ESMTPSA id h3sm13445127ioe.19.2022.02.11.05.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 05:30:45 -0800 (PST)
Received: (nullmailer pid 259753 invoked by uid 1000);
 Fri, 11 Feb 2022 13:30:41 -0000
Date: Fri, 11 Feb 2022 07:30:41 -0600
From: Rob Herring <robh@kernel.org>
To: quentin.schulz@theobroma-systems.com
Subject: Re: [PATCH 3/3] dt-bindings: ltk050h3146w: add compatible for
 LTK050H3148W-CTA6 variant
Message-ID: <YgZlASpL4uurqroZ@robh.at.kernel.org>
References: <20220131164723.714836-1-quentin.schulz@theobroma-systems.com>
 <20220131164723.714836-3-quentin.schulz@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131164723.714836-3-quentin.schulz@theobroma-systems.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Quentin Schulz <foss+kernel@0leil.net>,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 31 Jan 2022 17:47:23 +0100, quentin.schulz@theobroma-systems.com wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> The LTK050H3148W-CTA6 is a 5.0" 720x1280 DSI display, whose driving
> controller is a Himax HX8394-F, slightly different from LTK050H3146W by
> its init sequence, mode details and mode flags.
> 
> Cc: Quentin Schulz <foss+kernel@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>  .../devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml  | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
