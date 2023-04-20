Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A026E8E9A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 11:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5F210E077;
	Thu, 20 Apr 2023 09:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48B310E077
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 09:51:39 +0000 (UTC)
Received: from francesco-nb.int.toradex.com (31-10-206-125.static.upc.ch
 [31.10.206.125])
 by mail11.truemail.it (Postfix) with ESMTPA id 36C8021540;
 Thu, 20 Apr 2023 11:51:33 +0200 (CEST)
Date: Thu, 20 Apr 2023 11:51:29 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1 6/6] drm/bridge: tc358768: Add
 atomic_get_input_bus_fmts() implementation
Message-ID: <ZEELIaSFhZkyofh9@francesco-nb.int.toradex.com>
References: <20230330095941.428122-1-francesco@dolcini.it>
 <20230330095941.428122-7-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330095941.428122-7-francesco@dolcini.it>
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
Cc: Francesco Dolcini <francesco@dolcini.it>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello all,

On Thu, Mar 30, 2023 at 11:59:41AM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add atomic_get_input_bus_fmts() implementation, tc358768 has a parallel
> RGB input interface with the actual bus format depending on the amount
> of parallel input data lines.
> 
> Without this change when the tc358768 is used with less than 24bit the
> color mapping is completely wrong.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Just a gently ping on this specific patch.

Other patches on this series received some comments that should be
addressed, however at the moment on that I am quite stuck.

On the other hand this patch is completely independent.

I do also have queued multiple fixes on the same driver that I
would need to send and would love to avoid conflicts between my own
patches.

How would you suggest to move forward? Can someone have a look at this
patch and if deemed fine can someone just pick it up?

Francesco

