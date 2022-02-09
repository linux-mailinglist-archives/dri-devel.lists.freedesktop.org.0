Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A124AF8B5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 18:48:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4242510E2DB;
	Wed,  9 Feb 2022 17:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B56010E2DB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 17:48:49 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 q145-20020a4a3397000000b002e85c7234b1so3308999ooq.8
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 09:48:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9Q2I/VP+XFwXy/Za9m82QJTmUqxQOQNrGnI8flFPCzE=;
 b=AXjeFXzscSkAvOKeGU6msJj7aB/TYiNHMwPOUtYHYPyFOMWk91/Ku/Kcr8wWPbPeuX
 6eoVlnFn3eLf9gfjgojEL8PQ50eX2rdKCVQDoqeBEuC+z97WVFmAd4v3/5JjdPzj/4lq
 XCBxVdsiWQM0iEWUWgsnYZSNNNb62M5+TY8DBDBgQrF+29ozEnIt3doBn2DtbhEigwe3
 TZJ2ZDqvG9/tu5arPzr6gBy5ZRCG0J3uENicLYgABHO7XbzbS57aMFDPtcaABzD+VHP4
 JJzH1drkOYGvuDNADPWhMBNkXF19KesxIur1s+GcR0tLY6c8Zddnu8jv/vvNnv7T6l/C
 JORA==
X-Gm-Message-State: AOAM533HeIEGaulpyRq4ter5bZDk742ktubz8fleP+IkARV5dJKAvIkv
 EUe8GIoA3t6L/bXBqyvjew==
X-Google-Smtp-Source: ABdhPJxLVUkyLr5K9Jth1KPAM7TMJsJ9wGQtyn4evi3+a6WwLPinzkeFbOB9l+rfCrvEzu15f2MLgg==
X-Received: by 2002:a05:6870:6296:: with SMTP id
 s22mr1124414oan.338.1644428928376; 
 Wed, 09 Feb 2022 09:48:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r41sm6103687oap.2.2022.02.09.09.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:48:47 -0800 (PST)
Received: (nullmailer pid 581562 invoked by uid 1000);
 Wed, 09 Feb 2022 17:48:46 -0000
Date: Wed, 9 Feb 2022 11:48:46 -0600
From: Rob Herring <robh@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v5 1/5] dt-bindings: gpu: mali-bifrost: describe clocks
 for the rk356x gpu
Message-ID: <YgP+ftqvBcpLg6im@robh.at.kernel.org>
References: <20220209085110.3588035-1-michael.riesch@wolfvision.net>
 <1644420908.380944.391811.nullmailer@robh.at.kernel.org>
 <01b78d95-fdf3-060a-831d-dae2abbc7109@wolfvision.net>
 <3297396.uCXnvZdJcx@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3297396.uCXnvZdJcx@diego>
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
Cc: devicetree@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alex Bee <knaerzche@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, Liang Chen <cl@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 09, 2022 at 05:28:05PM +0100, Heiko Stübner wrote:
> Hi Michael,
> 
> Am Mittwoch, 9. Februar 2022, 16:46:28 CET schrieb Michael Riesch:
> > Hi Rob,
> > 
> > On 2/9/22 16:35, Rob Herring wrote:
> > > On Wed, 09 Feb 2022 09:51:06 +0100, Michael Riesch wrote:
> > >> From: Alex Bee <knaerzche@gmail.com>
> > >>
> > >> The Bifrost GPU in Rockchip RK356x SoCs has a core and a bus clock.
> > >> Reflect this in the SoC specific part of the binding.
> > >>
> > >> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> > >> [move the changes to the SoC section]
> > >> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> > >> ---
> > >>  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml | 15 +++++++++++++++
> > >>  1 file changed, 15 insertions(+)
> > >>
> > > 
> > > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > > 
> > > yamllint warnings/errors:
> > > ./Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml:173:12: [warning] wrong indentation: expected 12 but found 11 (indentation)
> > 
> > D'oh! Sorry for the stupid mistake, I found that yamllint was indeed
> > missing.
> > 
> > Lines 173 and 174 need an extra space. In the case that a v6 is required
> > I'll fix this. But of course I wouldn't say no if this could be fixed
> > when the patch is applied :-)
> 
> My guess is, Rob's bot filters out the easy wrongs, so I'm not sure if he
> actually looks at these in person.

I do because there are sometimes false positives. It's not a free 
testing service. (Well, it might be free beer for you, but that's 
because I'm buying. :) ) For just indentation I will still review them 
(eventually).

> So doing a v6 might actually be better for a Review :-)

Resending just moves you to the back of the line (usually). 

Rob
