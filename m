Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E584E5287
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 13:53:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C269210E6C9;
	Wed, 23 Mar 2022 12:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2E310E6C9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 12:53:10 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 i11-20020a9d4a8b000000b005cda3b9754aso982599otf.12
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 05:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NuW/5LjLTYnCe1iEVLuiQEgZKBilhYbTzhjTvpjmYV8=;
 b=mdhEQ/nLKZywRNRp11kmPQuSV1111zj5cJhX4GQT1kCHiD4BpP4qyrjpqc7PQfvg6y
 dVklsL5XRyeiap7pQtSkw6+t53kJThr1dKQZHcZ4TKp2xIoJUxzuGH6fHsybZreZhxu2
 JVsi4XN0HYx2/Zsd5XOPDZcjjiv7/HZrWVfP0c/4C4OxQD7G0XGYtQMekwfY7JoSxN+i
 1tqP/C3CeOKWeFA1mZqDaFkMlrCddDNCcCJzntaG+6CW/Ibybo83lOjuC7cYR8UHGDwP
 tyWQadtAKaaixoun/OwXyg/fpT17M7R2kQVwQygUwjR+iX/WOxZSKonUmMwKPHQew7Wa
 0bEA==
X-Gm-Message-State: AOAM531eIrA4LF47dEwAMy1Rkg6R6abnfx3uwZmnQ26s1P9AfSkWJHBK
 jtbNQMTeKPk2zQfKBrEe8Q==
X-Google-Smtp-Source: ABdhPJxBqvzQfjrGlAOysJzMPqRkTSzE0/WIGGYcR37p7UXxuOVZQTdDAxfHMh5kUojrSrUi6QncEg==
X-Received: by 2002:a05:6830:2010:b0:5b2:38da:6c24 with SMTP id
 e16-20020a056830201000b005b238da6c24mr11651996otp.158.1648039989736; 
 Wed, 23 Mar 2022 05:53:09 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 p4-20020a056870a54400b000da07609a6dsm8601476oal.22.2022.03.23.05.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 05:53:08 -0700 (PDT)
Received: (nullmailer pid 3908190 invoked by uid 1000);
 Wed, 23 Mar 2022 12:53:07 -0000
Date: Wed, 23 Mar 2022 07:53:07 -0500
From: Rob Herring <robh@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v11 2/7] MIPS: Loongson64: dts: introduce ls3A4000
 evaluation board
Message-ID: <YjsYM0M24VhkCHwG@robh.at.kernel.org>
References: <20220321162916.1116541-1-15330273260@189.cn>
 <20220321162916.1116541-3-15330273260@189.cn>
 <2644866a-8db2-923e-4227-2aa6d8e375fe@flygoat.com>
 <2c671752-6684-f87b-7b2d-90568d36adde@189.cn>
 <005099b5-33ed-4cb7-f8e4-10e1de780311@flygoat.com>
 <abe784ce-eb9e-0143-dbc3-d415bbedbb81@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abe784ce-eb9e-0143-dbc3-d415bbedbb81@189.cn>
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
Cc: Qing Zhang <zhangqing@loongson.cn>, David Airlie <airlied@linux.ie>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 devicetree@vger.kernel.org, suijingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 23, 2022 at 09:53:14AM +0800, Sui Jingfeng wrote:
> 
> On 2022/3/23 00:06, Jiaxun Yang wrote:
> > 
> > 
> > 在 2022/3/22 13:38, Sui Jingfeng 写道:
> > > 
> > > On 2022/3/22 21:05, Jiaxun Yang wrote:
> > > > 
> > > > 
> > > > 在 2022/3/21 16:29, Sui Jingfeng 写道:
> > > > > From: suijingfeng <suijingfeng@loongson.cn>
> > > > > 
> > > > > The board name is LS3A4000_7A1000_EVB_BOARD_V1.4, it consist of 1.8Ghz
> > > > > mips64r5 4-core CPU and LS7A1000 bridge chip. It has PCIe
> > > > > GEN2 x8 slot,
> > > > > therefore can play with discrete graphics card.
> > > > 
> > > > Hi Jingfeng,
> > > > 
> > > > As we've discussed before if you are going to introduce new dts
> > > > then you *MUST*
> > > > include it in makefile and wire it up in code.
> > > > 
> > > > A dts file doing nothing lying in the tree is just suspicious.
> > > > 
> > > > Thanks.
> > > > - Jiaxun
> > > > 
> > > Hi, Jiaxun,
> > > 
> > > I know what you means, but it is the kernel side developer's job.
> > > I am just a naive graphic driver developer,I can not care so much.
> > > Below is my private patch which can be used to built specific dts
> > > into the linux kernel, therefore make the verification easier.
> > Hi Jingfeng,
> > 
> > In kernel world we take care all the stuff we touched ourself :-)
> > 
> > If you are not confident with them please drop those DTS from the
> > patchset
> > besides the generic one. I can do the rest for you after getting this
> > set merged.
> > 
> > Thanks.
> > - Jiaxun
> > 
> Hi, Jiaxun
> 
> Build all dts into vmlinuz will make the vmlinuz bigger and bigger.
> How does the kernel get the dtb is another big issue, either from built-in
> dtb or pass from the firmware(pmon and uefi etc). This should be
> solved with another patch carefully. Providing board specific dts
> helps to code review, it helps reviewers understand that there are
> variant boards and have to be express with different OF graph.

Built-in DTBs are for legacy bootloaders that don't understand DT. I 
would not expect a new platform to need this.

> 
> Now, there are about 6 dts under arch/mips/boot/dts/loongson/,
> Suppose loongson have 1000+ different board, do you want built all
> of them into vmlinuz?

The point was to add the .dts to Makefile so it builds, not so it is 
built-in. How are you testing those build with dtc and dtschema if not 
added to kbuild?

Rob
