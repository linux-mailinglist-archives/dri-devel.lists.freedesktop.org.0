Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C1F4E647E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 14:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D5A10E8C2;
	Thu, 24 Mar 2022 13:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822D710E8C2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 13:56:28 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 z9-20020a05683020c900b005b22bf41872so3316969otq.13
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 06:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3hu2/w4zk2LRja1m6kxbb1AV3tlPT/cRATwQnTQCk3g=;
 b=6H1P9d3ZWBcAb6CkWEIDwTwEmxXR9tKOf+d4hs4bxKGLSNy14ip3wtJ9g0mBF1ZWy8
 KakqmMij3GTMHJE9CNcG94O+xfNSbHuaIf2ZQ5ydiexv3VXddCdqA44lwfeRPkN75M2e
 v7d+L5G+emdEKeWgPeaA7HaeEA/KLZ20+OohuA+YzBK12GxIq9KDzPiz4gDQdUCz81Z8
 p79c8p3F//Cz20tq6d7CZ3nhDNxo6Gt9ygN+OXmSwRVGgMty7D7HAxkhEit+P2kNh0N1
 78z58nt2/g3LmDqQXZJ1Pp4LMUWA2WEighz+/Y/jAJvlqMkuyRgvW7K7Uq61J6Je6X9N
 DeuQ==
X-Gm-Message-State: AOAM531Nmm/f1zCkZDM0bjAjdh+B0oLDMxv8mhSHJ1nq39Y5d1I97qX8
 0T3nwGzjReTPbbx82dA2LQ==
X-Google-Smtp-Source: ABdhPJzA6saZCLeJ/O7iPhpz9VqLML3Yhcc/Zlf/qqvBPu2YEFRUzp5i2fzD5+VZxAbgM6rJADtQoA==
X-Received: by 2002:a9d:5a07:0:b0:5cd:afdb:b0da with SMTP id
 v7-20020a9d5a07000000b005cdafdbb0damr2127434oth.188.1648130187606; 
 Thu, 24 Mar 2022 06:56:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j145-20020acaeb97000000b002d9f37166c1sm1409446oih.17.2022.03.24.06.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 06:56:26 -0700 (PDT)
Received: (nullmailer pid 1960215 invoked by uid 1000);
 Thu, 24 Mar 2022 13:56:25 -0000
Date: Thu, 24 Mar 2022 08:56:25 -0500
From: Rob Herring <robh@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v11 7/7] drm/lsdc: add drm driver for loongson display
 controller
Message-ID: <Yjx4iSkddTNo7q7K@robh.at.kernel.org>
References: <20220321162916.1116541-1-15330273260@189.cn>
 <20220321162916.1116541-8-15330273260@189.cn>
 <Yjo2R5LQrRICr7dC@robh.at.kernel.org>
 <2aa26f44-38aa-4b3c-ccc3-0956a2ab5d77@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2aa26f44-38aa-4b3c-ccc3-0956a2ab5d77@189.cn>
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
Cc: devicetree@vger.kernel.org, Qing Zhang <zhangqing@loongson.cn>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, linux-kernel@vger.kernel.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 24, 2022 at 03:32:01PM +0800, Sui Jingfeng wrote:
> 
> On 2022/3/23 04:49, Rob Herring wrote:
> > > +	}
> > > +
> > > +	spin_lock_init(&li2c->reglock);
> > > +
> > > +	snprintf(compat, sizeof(compat), "lsdc,i2c-gpio-%d", index);
> > compatible values shouldn't have an index and you shouldn't need a
> > index in DT. You need to iterate over child nodes with matching
> > compatible.
> 
> Why compatible values shouldn't have an index, does devicetree
> specification prohibit this? [1]

Probably not explicitly, but that's fundamentally not how compatible 
works. 'compatible' defines WHAT the device is, not WHICH device and 
that is used for matching devices to drivers. Drivers work on multiple 
instances.

> The recommended format is "manufacturer,model", where manufacturer is a string describing the name
> of the manufacturer (such as a stock ticker symbol), and model specifies the model number. [1]

I don't see anything saying to put the instance in there, do you?

> 
> [1] https://www.devicetree.org/specifications/
> 
