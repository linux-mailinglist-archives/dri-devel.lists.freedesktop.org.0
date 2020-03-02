Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D78417684F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 00:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B526E1F2;
	Mon,  2 Mar 2020 23:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E55356E1F2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 23:38:38 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id i1so1092351oie.8
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 15:38:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8XhrBfpdeYVeW1pNRFkev10cOhTus7KbN5tnNyTByWU=;
 b=Xw1ZxcnGavAkiwN31mWzpjm/m4wxbpr5U6zoW4K2Ubh8TM69Lt5VKsfkA7l2YbWYkv
 jDQ+djhS8SLz1Ay7rS6ASUbKTMf/QmEVoOm1JgAlJF0SXagV4/RM9qBLDQkREJqXqjZB
 MKhxHZmJsWJoqwg51YU6WvvQ5WZXT1cj/ZCHVo/qMefXalnOmTSckVmQmoxsvt1tBRGP
 4wGtkim16/3of3j4vnFMm3Dhtf/mB9pbi5jKY6ctEPBXXEGUV8tLDj8P7iXKx4JM7DmC
 fSa2MOiInzjOfRjJuoBQBc8K6cHgXhH1xaY8oFgGpQMpmgEub7VbEsT0kUCuRofi5p9r
 X1gg==
X-Gm-Message-State: ANhLgQ1u+BTbMktKUg7L6fpAe7bB2R3sMELkpOyQC9j+1j9plXvTN1gM
 GIHDQisIPWgv8VSF44nr5Q==
X-Google-Smtp-Source: ADFU+vuhlOl6on/xI93yhKRinPGhkp/CPia34CJHv4KuiNms9QQzJ4jdxXzYrkiqTRtqOQIlBZ9/wA==
X-Received: by 2002:a05:6808:64e:: with SMTP id
 z14mr582889oih.79.1583192318164; 
 Mon, 02 Mar 2020 15:38:38 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w15sm3156087oiw.43.2020.03.02.15.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 15:38:37 -0800 (PST)
Received: (nullmailer pid 17952 invoked by uid 1000);
 Mon, 02 Mar 2020 23:38:36 -0000
Date: Mon, 2 Mar 2020 17:38:36 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v11 2/6] dt-bindings: display: mediatek: control dpi pins
 mode to avoid leakage
Message-ID: <20200302233836.GB5639@bogus>
References: <20200228081441.88179-1-jitao.shi@mediatek.com>
 <20200228081441.88179-3-jitao.shi@mediatek.com>
 <20200302232903.GA4460@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302232903.GA4460@bogus>
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
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 02, 2020 at 05:29:03PM -0600, Rob Herring wrote:
> On Fri, 28 Feb 2020 16:14:37 +0800, Jitao Shi wrote:
> > Add property "pinctrl-names" to swap pin mode between gpio and dpi mode. Set
> > the dpi pins to gpio mode and output-low to avoid leakage current when dpi
> > disabled.
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,dpi.txt  | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> 
> Acked-by: Rob Herring <robh@kernel.org>

Sorry, not Acked. Wrong patch. On this one, please address my comments 
on v9.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
