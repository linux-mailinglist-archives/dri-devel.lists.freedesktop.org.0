Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF1F1B13C2
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 19:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C846E22F;
	Mon, 20 Apr 2020 17:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9216E7EC
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 17:59:16 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7C4A98040D;
 Mon, 20 Apr 2020 19:59:11 +0200 (CEST)
Date: Mon, 20 Apr 2020 19:59:09 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Subject: Re: Rule for bridge yaml dt binding maintainers?
Message-ID: <20200420175909.GA5810@ravnborg.org>
References: <87d082jtfn.fsf@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87d082jtfn.fsf@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=kKKJSc-euidS1K_z5cIA:9 a=CjuIK1q_8ugA:10
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adrian

On Mon, Apr 20, 2020 at 02:19:24PM +0300, Adrian Ratiu wrote:
> Hello,
> 
> I got confused while doing the txt -> yaml conversion at [1] and it's still
> not clear to me who should be added in the "maintainers" field.  Clearly not
> the maintainers as returned by get_maintainer.pl. :)
> 
> Rob mentioned that "owners" should be manintainers but I also have trouble
> picking the persons who should be owners / yaml maintainers.
> 
> Looking at the completed bridge conversions in the latest linux-next, I
> couldn't find a rule and the majority of bindings are still txt:
> 
> $ find ./devicetree/bindings/display/bridge/ -name *txt | wc -l
> 23
> $ find ./devicetree/bindings/display/bridge/ -name *yaml | wc -l
> 5
> 
> So my questions are:
> 1. Is there a general rule for assigning yaml file owners/maintainers?
> 
> 2. Is this vagueness specific to the bridge dt bindings only?
> 
> 3. Who should step up and maintain these bindings? Original/new authors,
> SoC, bridge, DRM maintainers etc.?
> 
> It would be useful to have a rule to make it easier to do these conversions.
> We (Collabora) are considering doing the conversion work.

For the panel conversion I did recently it was simple:
1) If listed in MAINTAINERS - use this info
2) Otherwise use the person(s) that authored the original .txt file.
   Using git log --follow foo.txt
3) In a few cases I may have decided otherwise, but the above covers the
   majority.

I would also be great if you or someone else could:
- teach get_maintainers about .yaml file listed maintainers
- teach checkpatch that it is OK to convert .txt to .yaml
- teach checkpatch about some simple yaml validation (maybe)

I am looking forward to the day we have more .yaml files
than .txt files in Documentation/devicetree/binding/*

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
