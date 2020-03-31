Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AC919A0D5
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 23:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4486189A61;
	Tue, 31 Mar 2020 21:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1703789A61
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 21:30:48 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id o3so17814531ioh.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 14:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aiuZold3/szOntpIHNt+cxtF0FuegPX6DhcwFbkv7eE=;
 b=pzhFa31cAAmX/710zNaZKoAxHIwGejFekas/k1JGkwK4VhDq/82A0eXcNMIF6r3j51
 Ba27a3zdzJCtb/lGYAFEIMlBvpiHCW39HfXL9TAYdyUNJ7XC7s1LtLZewoSX3zWCKC1y
 c0TTOvrKuGtv30TRKqp1ThQvHcq43jpjIKBrMOmKbXFUA3/qkWFBhNv42qHzf1e7Q3pQ
 7q8uvGZI9A2Y58zQvhyHfNMc2R0C2Yu25NdTRerPLD7wZXidNX1gLHu642ihDlHpOJsL
 cul2O/MIPIxaikq+eaTQwMbmGEa+CEej8vgcCC7k9Kl6t+v2MSTv20cPN/f2ZGQc8LS9
 uOiA==
X-Gm-Message-State: ANhLgQ2i5JvI8PpnMuk868Kg3P2SOgOjT+oHCuj4vuVJGYGdxhPB4Rk+
 UJqpSjV8TGkuFUNgyHHcqA==
X-Google-Smtp-Source: ADFU+vuFyLeWV7L4V9baWHFqPFA5aoKrnkKsgccAwz1uR8hUkn4KXEkWgkr5NwyCG1JL2b06eyzmEw==
X-Received: by 2002:a6b:c9d2:: with SMTP id
 z201mr17573545iof.169.1585690247505; 
 Tue, 31 Mar 2020 14:30:47 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id z15sm30393ilf.0.2020.03.31.14.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 14:30:47 -0700 (PDT)
Received: (nullmailer pid 1921 invoked by uid 1000);
 Tue, 31 Mar 2020 21:30:45 -0000
Date: Tue, 31 Mar 2020 15:30:44 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: display: rockchip-vop: add
 additional properties
Message-ID: <20200331213044.GA1829@bogus>
References: <20200325103828.5422-1-jbx6244@gmail.com>
 <20200325103828.5422-2-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200325103828.5422-2-jbx6244@gmail.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 25 Mar 2020 11:38:28 +0100, Johan Jonker wrote:
> In the old txt situation we add/describe only properties that are used
> by the driver/hardware itself. With yaml it also filters things in a
> node that are used by other drivers like 'assigned-clocks' and
> 'assigned-clock-rates' for rk3399 and 'power-domains' for most
> Rockchip Socs in 'vop' nodes, so add them to 'rockchip-vop.yaml'.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../devicetree/bindings/display/rockchip/rockchip-vop.yaml    | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
