Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 861D41D02A2
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 00:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910876EA61;
	Tue, 12 May 2020 22:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9CC6EA61
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 22:58:15 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id z17so11930657oto.4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 15:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cBiUIrWE+UaIH5tajkgyIKVaNp7k7WAC/qZUFSsrV2E=;
 b=aW8LztL3vNT7a/6/a5tskCzvdRU7pNpUaT/lgv3GRACUlm2J2Fb9jL61akJ3bGKmP+
 LhVQdMwpGDZTaXAKUYOPjdjrX1GNssZlzh97VEU3GPM1b3tu9P/YKkXnLFYFE020ncE3
 ZuCG6AR92XG5KTxYU10DMv1zDiAEdY7Z1Sc3nvZKLSj1raejyVwsE9Rw6e/HoBRsXQGD
 yd7lhP7v7+Lxt58iV0KmOr6DQEClogv2Zp189fFQ+LzemUUoNB+1jdiPmlbfa+FEdV4U
 epDTCgu2GKjays4IMIIQReZCYk+7XBB4eSN5+q5Oqsj6ACPSrQLZJxqLR224JTPuDSLT
 gjaQ==
X-Gm-Message-State: AGi0PuZCzvttkwZOCUpB7FiReALoMcMn+2ZTU14UN7wKhLVcG2rBX3xZ
 fQYV28ShOnd7jU//ln+MQQ==
X-Google-Smtp-Source: APiQypL7PdOIK7Is7Nz5WrJlgO2HUyJLl2vgiulZfCULhki8ejQCn9T9ykjPsFKJznmjeuGro1Uq+g==
X-Received: by 2002:a05:6830:22f8:: with SMTP id
 t24mr18122890otc.148.1589324294619; 
 Tue, 12 May 2020 15:58:14 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w62sm5632505oia.32.2020.05.12.15.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 15:58:13 -0700 (PDT)
Received: (nullmailer pid 32342 invoked by uid 1000);
 Tue, 12 May 2020 22:58:12 -0000
Date: Tue, 12 May 2020 17:58:12 -0500
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH] docs: dt: fix broken links due to txt->yaml renames
Message-ID: <20200512225812.GA28862@bogus>
References: <967df5c3303b478b76199d4379fe40f5094f3f9b.1588584538.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <967df5c3303b478b76199d4379fe40f5094f3f9b.1588584538.git.mchehab+huawei@kernel.org>
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
Cc: alsa-devel@alsa-project.org, Olivier Moysan <olivier.moysan@st.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rockchip@lists.infradead.org,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Jyri Sarha <jsarha@ti.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 04, 2020 at 11:30:20AM +0200, Mauro Carvalho Chehab wrote:
> There are some new broken doc links due to yaml renames
> at DT. Developers should really run:
> 
> 	./scripts/documentation-file-ref-check
> 
> in order to solve those issues while submitting patches.
> This tool can even fix most of the issues with:
> 
> 	./scripts/documentation-file-ref-check --fix
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
> 
> PS.: This patch is against today's linux-next.

That's not a base anyone can apply this patch against.

> 
> 
>  .../devicetree/bindings/display/bridge/sii902x.txt          | 2 +-
>  .../devicetree/bindings/display/rockchip/rockchip-drm.yaml  | 2 +-
>  .../devicetree/bindings/net/mediatek-bluetooth.txt          | 2 +-
>  .../devicetree/bindings/sound/audio-graph-card.txt          | 2 +-
>  .../devicetree/bindings/sound/st,sti-asoc-card.txt          | 2 +-
>  Documentation/mips/ingenic-tcu.rst                          | 2 +-
>  MAINTAINERS                                                 | 6 +++---
>  7 files changed, 9 insertions(+), 9 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
