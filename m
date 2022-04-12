Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3B44FE7BD
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 20:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA94810E539;
	Tue, 12 Apr 2022 18:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B30D10E539
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 18:16:59 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id q189so19836580oia.9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 11:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B/dD6BxwqxnSz+VcY4c2wabU7PRBtQ+7ZYvEK2V/n/0=;
 b=WkWzSxMEQrZnTHuKb6h466q6k00krr0YEt7IKyQMoR07OyiRAR2OwVZzj+SGGdF3u6
 KJUCC6QA6JFVseAm/TfeSlRcHjfrnLZ81wkjOgaznb/FJE0GhLHAxliEt0VPdOQyNimV
 WEYij41zxLi5OCZHgZORpYMgMWYfAQEz1UAaMdu3MdRWNpJbcF2kfae8QBiBkKE8LHvK
 QiO7aY7Tvemht03gLc9zyqc2TEwPPFSWVhtJaZkCPZJZ/A6IeBfOFUAII7KoKiFtS/qf
 KKBqB2aR0xlvoSW7/YKK7XSC6Ud5I03aAGjdtJsiN/3RCwn9KkaemH9kPR8BfMJ5OHWY
 7krw==
X-Gm-Message-State: AOAM530qfRgZTPkraCs8NgJzbYgtZBsAmlU7hQdtZ0cLMbSuc7xM0b0Z
 eRAIzGVcDrX/jumBlch/qg==
X-Google-Smtp-Source: ABdhPJyWiCDJPCkWuVz9Fx0GQ1Bg4Kblx5fgblku4RjTzvAtN+tPP/TaP+yKykeEeMtxSKbgz9oFUw==
X-Received: by 2002:a05:6808:1592:b0:2f7:3095:b7fd with SMTP id
 t18-20020a056808159200b002f73095b7fdmr2485382oiw.190.1649787418243; 
 Tue, 12 Apr 2022 11:16:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x18-20020a056830245200b005ce01c28c77sm13599954otr.1.2022.04.12.11.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 11:16:57 -0700 (PDT)
Received: (nullmailer pid 566579 invoked by uid 1000);
 Tue, 12 Apr 2022 18:16:57 -0000
Date: Tue, 12 Apr 2022 13:16:57 -0500
From: Rob Herring <robh@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: display: ssd1307fb: Extend schema
 for SPI controllers
Message-ID: <YlXCGfA7DUbPPiXw@robh.at.kernel.org>
References: <20220411211243.11121-1-javierm@redhat.com>
 <20220411211243.11121-3-javierm@redhat.com>
 <CAMuHMdVuivPSRooR5CqTX6GQtxO6RQYwKUqfOK36zsiN8-v6kg@mail.gmail.com>
 <d37de4b1-55f7-ff4d-6230-6f0b6e65799c@redhat.com>
 <CAMuHMdV_4Gp2fqfCTeUigVxK=J4NF=SqJVd1hKAWpyuUv0Pnzw@mail.gmail.com>
 <c3287f86-636d-33dc-c763-1f28803704f5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3287f86-636d-33dc-c763-1f28803704f5@redhat.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 12, 2022 at 10:12:32AM +0200, Javier Martinez Canillas wrote:
> On 4/12/22 10:07, Geert Uytterhoeven wrote:
> > Hi Javier,
> 
> [snip]
> 
> >>
> >> Do you have any hints here on how I should enforce this in the schema ?
> >>
> >> Or if you think that a comment is enough, then I will add it in v3.
> > 
> > I don't know how to make it required for SPI, if possible at all.
> >
> 
> I see. Let's go with a comment then and we can later enforce it, if someone
> knows if is possible / how to do it.

It's not possible unless we annotate child nodes with something from the 
parent. '$nodename' is the one and only example of that. 

Really, this falls below the bar of what I'm concerned about checking. 
Ask me again when the conversions are all done (only ~2K to go :( ).

Rob
