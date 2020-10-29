Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8865C29F7F0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 23:28:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2C46E919;
	Thu, 29 Oct 2020 22:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77896E919
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 22:27:58 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id E7D5720022;
 Thu, 29 Oct 2020 23:27:56 +0100 (CET)
Date: Thu, 29 Oct 2020 23:27:55 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH v10 4/6] drm/kmb: Add support for KeemBay Display
Message-ID: <20201029222755.GD904738@ravnborg.org>
References: <1604006877-20092-1-git-send-email-anitha.chrisanthus@intel.com>
 <1604006877-20092-5-git-send-email-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604006877-20092-5-git-send-email-anitha.chrisanthus@intel.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=AZfkTz24TO3VrqK0lmgA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: edmund.j.dea@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Anitha,

On Thu, Oct 29, 2020 at 02:27:55PM -0700, Anitha Chrisanthus wrote:
> This is a basic KMS atomic modesetting display driver for KeemBay family of
> SOCs. Driver has no 2D or 3D graphics. It calls into the ADV bridge
> driver at the connector level.
> 
> Single CRTC with LCD controller->mipi DSI->ADV bridge
> 
> Only 1080p resolution and single plane is supported at this time.
> 

> v10: call drm_crtc_arm_vblank_event in atomic_flush (Daniel V)
>      moved global vars to kmb_private and added locks (Daniel V)
>      changes in driver to accommodate changes in DT to separate DSI
>      entries (Sam R)
>      review changes to separate mipi DSI (Sam R)

Anitha and I have had some private forth and back here and
this looks now much better than what was first submitted.

We could do more but this is IMO good enough to hit drm-misc-next
and then we can work on any remaining issues in-tree.
I would love that at least one other to take a look before we run ahead
and apply it.

	Sam

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
