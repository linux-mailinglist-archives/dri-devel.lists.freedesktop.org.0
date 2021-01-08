Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FD82EEB63
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 03:42:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79736E5BD;
	Fri,  8 Jan 2021 02:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55F16E5BD
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 02:42:13 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id u26so8358945iof.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 18:42:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wPiCz3MJAup9q9l5CzZP+3XdihV7IrCQNfuDIuI0X8I=;
 b=QCKGugtJyBxIpsoIkkmHY//ct9LYMZzi4s1LgwQsTmpgrzgdF3a5dqZA612S0mfnPG
 fO4UNyH9NGvEkCiZQQ1lKa/qrXi5mTbjfOeQ13/GNxmoIfXje9c/x1yPyPq46UFUd3eQ
 +KByymVtVAacKBAYGxWFPWUjtniQfaD7X5/llS5eb7MR5O9CoEZQoWaOtvg5DNH5iKob
 IdMdI85n43gkooeIxqDHYQdc+q4TQmdDDwWzclBRjWEPsK+lWJAs6cp6c8gXivuYDZNz
 yzymiqCTRaWZi5s94yjGUs8XNjDK+9f8Pqbr9vV3gIEqxBIkKKMMqQ91SOyJc1j6HlzZ
 x1Nw==
X-Gm-Message-State: AOAM532dMsh0Pf49QHBGPLCYYkW5kZbSASHHlXnjF3KTyzJWRueweDx2
 U89H8c7PzKNlhyYNzB/fxw==
X-Google-Smtp-Source: ABdhPJxQVjRZ0Wrjwd2ZJy8DocUyhqLv7WcP1cYZBrXrZQi4aW6pgorSpt9y84Tg2abze2DctZ3tyg==
X-Received: by 2002:a5e:dd0d:: with SMTP id t13mr3866409iop.132.1610073733311; 
 Thu, 07 Jan 2021 18:42:13 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id j15sm6072781ile.1.2021.01.07.18.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 18:42:12 -0800 (PST)
Received: (nullmailer pid 1769172 invoked by uid 1000);
 Fri, 08 Jan 2021 02:42:09 -0000
Date: Thu, 7 Jan 2021 19:42:09 -0700
From: Rob Herring <robh@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH] dt-bindings: bcm2835-vec: Add power-domains property
Message-ID: <20210108024209.GA1769120@robh.at.kernel.org>
References: <1608751473-12343-1-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1608751473-12343-1-git-send-email-stefan.wahren@i2se.com>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Dec 2020 20:24:33 +0100, Stefan Wahren wrote:
> Adding the missing property power-domains to the bcm2835-vec schema to fix
> the following dtbs_check issue:
> 
> vec@7e806000: 'power-domains' does not match any of the regexes: ...
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
