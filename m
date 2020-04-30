Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACA31BFD0B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 16:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11636E90C;
	Thu, 30 Apr 2020 14:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com
 [209.85.161.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605D86E90C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 14:10:12 +0000 (UTC)
Received: by mail-oo1-f68.google.com with SMTP id i9so1306627ool.5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 07:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6aiOkcIgJAWhCqfCs33Rhe1wkSnQyKwXVAe/pUh2Rrw=;
 b=iwZs2898/0B3LckfyXXdEXXECu1OsV+SCqzXxxAHKMT2kqXuqfHysINmYAUi/UUJ8E
 /HdUxP+rGKdnaNQ4uCV2ZIgUFskJa4FleKhA41ee+h8zGAo2c+7h39bkjBPi+I16H4WA
 mhGunnTpVAB7z6tzlpzdsGH3UpjG4S2ojEenzSezsC5GXsF5Dv1oB7M+px3cXt1s0DXo
 9xPmPw9SzceNXieNwwggn2BelttYD60f1aYbZnevOaM51/uWWxktNi3RVpv8J/Fv9ErD
 c80iNpZsFWNxZUSKobF1FtsMDyMsFRk/LilPTLQI/A13Ezb7A0R8MVksC4Bxf9sGUc0E
 VbiQ==
X-Gm-Message-State: AGi0PuZX2VSbsoBVEcOdvS4sRVusVi2Sj0bRsj7Tay1Ol+4CxxAZG41U
 L0y/lX//5sLMo49niZBxpA==
X-Google-Smtp-Source: APiQypIlZrdNDKXt4h5JYSoYrTTeKI8v+e+CVvcep7L1dYna5MbvAQ/q4ekiXc5lL7JJyjUKWiE5Xg==
X-Received: by 2002:a4a:390b:: with SMTP id m11mr2952624ooa.2.1588255811640;
 Thu, 30 Apr 2020 07:10:11 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m16sm1304134oou.44.2020.04.30.07.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 07:10:10 -0700 (PDT)
Received: (nullmailer pid 4677 invoked by uid 1000);
 Thu, 30 Apr 2020 14:10:10 -0000
Date: Thu, 30 Apr 2020 09:10:10 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 1/6] of_graph: add of_graph_get_local_port()
Message-ID: <20200430141010.GA4602@bogus>
References: <20200418170703.1583-1-digetx@gmail.com>
 <20200418170703.1583-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200418170703.1583-2-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 18 Apr 2020 20:06:58 +0300, Dmitry Osipenko wrote:
> In some case, like a DRM display code for example, it's useful to silently
> check whether port node exists at all in a device-tree before proceeding
> with parsing the graph.
> 
> This patch adds of_graph_get_local_port() which returns pointer to a local
> port node, or NULL if graph isn't specified in a device-tree for a given
> device node.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/of/property.c    | 32 +++++++++++++++++++++++---------
>  include/linux/of_graph.h |  7 +++++++
>  2 files changed, 30 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
