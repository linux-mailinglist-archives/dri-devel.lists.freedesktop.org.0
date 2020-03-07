Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E3B17CF99
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 19:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B7189CBA;
	Sat,  7 Mar 2020 18:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0239A89CBA
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2020 18:31:05 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C66CC80587;
 Sat,  7 Mar 2020 19:31:03 +0100 (CET)
Date: Sat, 7 Mar 2020 19:31:02 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH] Revert "drm/panel: simple: Add support for Sharp
 LQ150X1LG11 panels"
Message-ID: <20200307183102.GA20996@ravnborg.org>
References: <20200304172552.GA4587@ravnborg.org>
 <20200305130536.26011-1-peda@axentia.se>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305130536.26011-1-peda@axentia.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
 a=7gkXJVJtAAAA:8 a=APy4spIJVMKogf-06l0A:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Peter.


On Thu, Mar 05, 2020 at 01:07:07PM +0000, Peter Rosin wrote:
> This reverts commit 0f9cdd743f7f8d470fff51b11250f02fc554cf1b.
> 
> The interface of the panel is LVDS, not parallel.
> The color depth is RGB888, not RGB565.
> The panel has additional features, making it not so simple.
> The only user (upstream) of this panel is appropriately using panel-lvds.
> 
> Suggested-by: Thierry Reding <thierry.reding@gmail.com>
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Peter Rosin <peda@axentia.se>

Thanks, applied to drm-misc-next and pushed out.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
