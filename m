Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C41411A8EED
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 01:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C546E5C8;
	Tue, 14 Apr 2020 23:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEA26E5C8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 23:11:01 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id o25so11947187oic.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 16:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VwlQ6VCZgV5ka7iVLQq2H1q/L90kjoFQN48DbNs7kyk=;
 b=nHGMR3cKnOClTVY5ehbxaU6rGcraZEruNoob3GbJpAC0lu+9sskd2jWtlM1OTjP989
 KQIU33dHLdBNA4umEzeOhmwpY2aGZzozY9KKL/njmTnd+1s4Vk8EnoLdJHj5dEzGzzTl
 8617a0MwWguIFyb9U9xA0v2Nohndrn8LZKSAJj/wOM1w7i849EcH2eU2B+olQa5YLQc7
 445ECljo8gPnO120dJ2cTzk4pI6fM7+fALP8gRvrjHl9a0oOnbe7WkcvYFZtYPUoBo83
 IHmMKOeQ4qMBZkbRxa+z7HLXUxuOvLa2VoG/dHc9lCpFHjakjt5/eUtdhJoBxTqW7jqm
 os0g==
X-Gm-Message-State: AGi0PuYUE4nWOJC5CzH+1ehQ2H5JP8zoIEd1t89hXlp7uz0OgelfNoL7
 Q7OzjqGO7MIvOtOYrr4Y6g==
X-Google-Smtp-Source: APiQypKCV80Py52kn0+PiM6nVbpJK4+Z+kN+SUuLi9kw5wkrmmpi+wDUYzmHfcVYyrFztmgZUUOjTA==
X-Received: by 2002:a05:6808:3a9:: with SMTP id
 n9mr16580256oie.124.1586905860910; 
 Tue, 14 Apr 2020 16:11:00 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j186sm1188168oia.31.2020.04.14.16.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 16:11:00 -0700 (PDT)
Received: (nullmailer pid 5848 invoked by uid 1000);
 Tue, 14 Apr 2020 23:10:59 -0000
Date: Tue, 14 Apr 2020 18:10:59 -0500
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH/RFC 5/6] dt-bindings: display: sun8i-a83t-dw-hdmi:
 Reference dw-hdmi YAML schema
Message-ID: <20200414231059.GA5789@bogus>
References: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405233935.27599-6-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200405233935.27599-6-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Mark Yao <mark.yao@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  6 Apr 2020 02:39:34 +0300, Laurent Pinchart wrote:
> Replace the reference to the DWC HDMI text DT binding with a reference
> to the YAML equivalent.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
