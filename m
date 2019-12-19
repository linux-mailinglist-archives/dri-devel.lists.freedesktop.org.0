Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F431271C7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 00:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B1F6EBA8;
	Thu, 19 Dec 2019 23:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C2E6EBA8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 23:47:51 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id h9so6787363otj.11
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 15:47:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=18UcAb5rbPMss22Ho10Y3g3P3ch3yNs8mlHDvPuR4oU=;
 b=oDmz2PgS9xTJ1Dw9we73XkfQS6KJUH99BvUborzo6QJRUXqR0YHW93aMGViok77qLs
 /1970frPCfNIq0AFpz/8pw1RKlHSDwa9vHv8uFyceKSmNzFlzIE8vKbA1k3vEZwAu/0R
 o9u9Ct35vragWlu4ijQkJ6nHQPh5JiYe4lY5W3P0uGBwKhTkVKYq0D+5wGHwkRESVFYs
 8xu0f6DUiGpL06Bz40A9zTBryL5/Fr/QrgASqsu4/MsvcbnBo+qANGIuQUJIieL37R3P
 suubtDUPTx7Or830eHCvSPnz02dMLCJ9Qb3OzWg72H7Fi3xTMrdymSgxtdFQwMviEPKj
 /tTA==
X-Gm-Message-State: APjAAAWdEPtZM/MkSVulxOSrU8yGPmnHYEkvn1piY/fqextPhUNMKgmi
 sCKoxlKjF1Lx+YjxTalg8A==
X-Google-Smtp-Source: APXvYqwn2zt/hEoslzgFitK7qNptvvyashP6FwXW1JD5npPwJGdehqnhGdzJkgQ1XfMc2/ZX5+wl9Q==
X-Received: by 2002:a9d:6b17:: with SMTP id g23mr11137126otp.265.1576799270756; 
 Thu, 19 Dec 2019 15:47:50 -0800 (PST)
Received: from localhost (ip-184-205-174-147.ftwttx.spcsdns.net.
 [184.205.174.147])
 by smtp.gmail.com with ESMTPSA id n22sm2712400otj.36.2019.12.19.15.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 15:47:50 -0800 (PST)
Date: Thu, 19 Dec 2019 17:47:47 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 01/12] dt-bindings: display: rockchip-lvds: Declare PX30
 compatible
Message-ID: <20191219234747.GA30229@bogus>
References: <20191213181051.25983-1-miquel.raynal@bootlin.com>
 <20191213181051.25983-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213181051.25983-2-miquel.raynal@bootlin.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-rockchip@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 13 Dec 2019 19:10:40 +0100, Miquel Raynal wrote:
> Document the PX30 LVDS compatible.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/display/rockchip/rockchip-lvds.txt       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
