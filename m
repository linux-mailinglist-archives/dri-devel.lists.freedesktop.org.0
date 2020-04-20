Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7161B0739
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 13:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AABC6E51D;
	Mon, 20 Apr 2020 11:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934556E512
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 11:18:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id 177A92A0C7C
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Rule for bridge yaml dt binding maintainers?
Date: Mon, 20 Apr 2020 14:19:24 +0300
Message-ID: <87d082jtfn.fsf@collabora.com>
MIME-Version: 1.0
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 kernel@collabora.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

I got confused while doing the txt -> yaml conversion at [1] and 
it's still not clear to me who should be added in the 
"maintainers" field.  Clearly not the maintainers as returned by 
get_maintainer.pl. :)

Rob mentioned that "owners" should be manintainers but I also have 
trouble picking the persons who should be owners / yaml 
maintainers.

Looking at the completed bridge conversions in the latest 
linux-next, I couldn't find a rule and the majority of bindings 
are still txt: 

$ find ./devicetree/bindings/display/bridge/ -name *txt | wc -l
23
$ find ./devicetree/bindings/display/bridge/ -name *yaml | wc -l
5

So my questions are:
1. Is there a general rule for assigning yaml file 
owners/maintainers?

2. Is this vagueness specific to the bridge dt bindings only?

3. Who should step up and maintain these bindings? Original/new 
authors, SoC, bridge, DRM maintainers etc.?

It would be useful to have a rule to make it easier to do these 
conversions. We (Collabora) are considering doing the conversion 
work.

Thank you,
Adrian

[1] https://patchwork.kernel.org/patch/11493009/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
