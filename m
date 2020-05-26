Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E37E31E2995
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 20:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D946E239;
	Tue, 26 May 2020 18:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D95E6E239
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 18:04:21 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id p20so9634947iop.11
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 11:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ClJL8gB+/7Ulq3yj2f4VaDBjcjvT7VkWGg/z9gQ4pgg=;
 b=ACKwTLLLAz+plEjCUh+OnJQ4DkWdFiOGysIBjXz8lJmHFoAsjpaa7/M1iJL59cKeSv
 mh2cX/6kuixaNjwNWfu0/EhRvYvh/s8uSwdoC2m3fLT1rhYVeyN+QS4ecf+Lf2WiIUXE
 MfzV6zocyup45CGfPx7KnqByeWgJqch1mwmM+D0b0bQxTCYh0spEw6NAK8O2DplPVfAf
 edQlWi3AAuazKSBGCyGYVfjlSl2ERw/vf9Kgkuiv0I2ivioDsocsfm1U2LSP4NzOMbdD
 SqZFy13UrtckJSrZAfrqNzzjCJbyAphh/7KxsjgDXchtZ+k7j6g8PYfySquF638ZHp2k
 BWgw==
X-Gm-Message-State: AOAM533pTY1wvzqezIIhTI4ojGHoDu3vVt/UBmymol2dn+0ma6/YPpU0
 saZnACYV82RXwCNKjB4YyQ==
X-Google-Smtp-Source: ABdhPJzcu2nCj6F92lx7P/df1l59GGQNg9IGF9YDymeeq6DRFL67TpPCdRsq+oEeB/mS2xXLEmpasQ==
X-Received: by 2002:a05:6602:2c8f:: with SMTP id
 i15mr11103155iow.45.1590516260900; 
 Tue, 26 May 2020 11:04:20 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id z13sm319397ilh.82.2020.05.26.11.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 11:04:19 -0700 (PDT)
Received: (nullmailer pid 80209 invoked by uid 1000);
 Tue, 26 May 2020 18:04:18 -0000
Date: Tue, 26 May 2020 12:04:18 -0600
From: Rob Herring <robh@kernel.org>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v11 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter DT schema
Message-ID: <20200526180418.GA80145@bogus>
References: <cover.1589511894.git.xji@analogixsemi.com>
 <393386c0a18753cb4b3f695348fe506a192ea82a.1589511894.git.xji@analogixsemi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <393386c0a18753cb4b3f695348fe506a192ea82a.1589511894.git.xji@analogixsemi.com>
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 15 May 2020 13:49:20 +0800, Xin Ji wrote:
> anx7625: MIPI to DP transmitter DT schema
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  .../bindings/display/bridge/analogix,anx7625.yaml  | 95 ++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
