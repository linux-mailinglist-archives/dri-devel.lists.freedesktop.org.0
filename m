Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E553B16F914
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE176E1B4;
	Wed, 26 Feb 2020 08:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 582446E21F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 19:53:04 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id A376F810E;
 Tue, 25 Feb 2020 19:53:46 +0000 (UTC)
Date: Tue, 25 Feb 2020 11:52:58 -0800
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] drm/omap: Fix drm_handle_vblank() handling for command
 mode panels
Message-ID: <20200225195258.GI37466@atomide.com>
References: <20200225183733.50875-1-tony@atomide.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225183733.50875-1-tony@atomide.com>
X-Mailman-Approved-At: Wed, 26 Feb 2020 08:08:26 +0000
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
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Merlijn Wajer <merlijn@wizzup.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, ruleh <ruleh@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Tony Lindgren <tony@atomide.com> [200225 18:38]:
> Only lightly tested so far, please test. Also, I'm not sure if we
> should get the id from somewhere for drm_handle_vblank() instead of
> just using 0?

Also looks like we can now get WARN_ON(omap_crtc->pending)
in omap_crtc_arm_event(), so obviously some changes are
needed.

Regards,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
