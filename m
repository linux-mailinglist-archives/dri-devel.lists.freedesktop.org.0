Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFA42144E6
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jul 2020 12:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B87E6E418;
	Sat,  4 Jul 2020 10:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24FC6E409
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 10:34:15 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id F077920030;
 Sat,  4 Jul 2020 12:34:09 +0200 (CEST)
Date: Sat, 4 Jul 2020 12:34:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 0/3] dt-bindings: display: convert panel bindings to
 DT Schema
Message-ID: <20200704103408.GA735964@ravnborg.org>
References: <20200704102806.735713-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200704102806.735713-1-sam@ravnborg.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=KES7fKIIVwMXKWEOJbMA:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Chris Zhong <zyw@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 04, 2020 at 12:28:03PM +0200, Sam Ravnborg wrote:
> This patch-set convert 3 of the remaining panel bindings to yaml.
> 
> This is a follow-up on v2 that converted a lot of panel bindings:
> https://lore.kernel.org/dri-devel/20200408195109.32692-1-sam@ravnborg.org/
> All was applied except for the reaming three patches included here.
> 
> One binding is a DSI binding so just added to panel-simple-dsi.
> The other two bindings addressed review feedback from Rob.
> 
> Sebastian Reichel has a pending patch to address the remaining
> panel binding in display/panel/
> 
> All bindings pass dt-binding-check.
> Based on top of drm-misc-next.
> 
> 	Sam
> 
> 
> Sam Ravnborg (3):
>       dt-bindings: display: convert innolux,p079zca to DT Schema
>       dt-bindings: display: convert samsung,s6e8aa0 to DT Schema
>       dt-bindings: display: convert sharp,lq101r1sx01 to DT Schema

git format-patch adds a space after the ',' - in the subject.
This is often a good idea, but not for binding files.
Will fix when I apply - if I do not forget that is..

Any setttings so I can prevent this in the future?

	Sam

> 
>  .../bindings/display/panel/innolux,p079zca.txt     |  22 -----
>  .../bindings/display/panel/panel-simple-dsi.yaml   |   2 +
>  .../bindings/display/panel/samsung,s6e8aa0.txt     |  56 ------------
>  .../bindings/display/panel/samsung,s6e8aa0.yaml    | 100 +++++++++++++++++++++
>  .../bindings/display/panel/sharp,lq101r1sx01.txt   |  49 ----------
>  .../bindings/display/panel/sharp,lq101r1sx01.yaml  |  87 ++++++++++++++++++
>  6 files changed, 189 insertions(+), 127 deletions(-)
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
