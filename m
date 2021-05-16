Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB29381BDC
	for <lists+dri-devel@lfdr.de>; Sun, 16 May 2021 02:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDA86E466;
	Sun, 16 May 2021 00:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D766E466
 for <dri-devel@lists.freedesktop.org>; Sun, 16 May 2021 00:47:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F7122BA;
 Sun, 16 May 2021 02:47:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1621126028;
 bh=y22OiUo17yK6rBbpTsXssLO5LCnk1ST6vy0PnB1LKD8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZeSMu0OvIK8jxZGzpZ+rjT13jkw7jrqm4QC6pnK6ujtG487lPmWIwQqbjxf2J7YRk
 TV6esioPA6BQJs5GvfXvv6xx8n4//tSJsJYcvjikWlR9X/GWA5Ytey/KvAuORnzA7x
 68zSgjUywgSOJ+0nhJKBjr7Qbcr3OWhvMONnEJXc=
Date: Sun, 16 May 2021 03:46:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] dt-bindings: display: bridge: lvds-codec: Fix spacing
Message-ID: <YKBrgk/jJ3pLgkNj@pendragon.ideasonboard.com>
References: <20210515203932.366799-1-marex@denx.de>
 <YKBBlWXXK8LUc8ac@pendragon.ideasonboard.com>
 <b2d1119e-f875-6775-3813-7d342d66c465@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b2d1119e-f875-6775-3813-7d342d66c465@denx.de>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, ch@denx.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Sun, May 16, 2021 at 01:49:11AM +0200, Marek Vasut wrote:
> On 5/15/21 11:48 PM, Laurent Pinchart wrote:
> > Hi Marek,
> 
> Hi,
> 
> > Thank you for the patch.
> > 
> > On Sat, May 15, 2021 at 10:39:32PM +0200, Marek Vasut wrote:
> >> Add missing spaces to make the diagrams readable, no functional change.
> > 
> > Looks better indeed. The patch view looks bad though, because of the
> > tabs. Maybe you could replace them with spaces, while at it ?
> 
> It is all spaces, where do you see tabs ?

Right after "Slot", "Clock" and "DATA[0123]". You're not touching those
lines, but having tabs there messes up the formatting of the patch
itself (the resulting bindings file looks good).

By the way, the subject line doesn't match the patch, you're modifying
panel/lvds.yaml, not bridge/lvds-codec.yaml.

-- 
Regards,

Laurent Pinchart
