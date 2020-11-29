Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C3C2C7B9D
	for <lists+dri-devel@lfdr.de>; Sun, 29 Nov 2020 23:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B086E02A;
	Sun, 29 Nov 2020 22:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56696E02A
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Nov 2020 22:12:59 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 0B7E620031;
 Sun, 29 Nov 2020 23:12:58 +0100 (CET)
Date: Sun, 29 Nov 2020 23:12:56 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 4/5] drm: panel: simple: Add BOE NV110WTM-N61
Message-ID: <20201129221256.GK1162850@ravnborg.org>
References: <20201109170018.v4.1.Icaa86f0a4ca45a9a7184da4bc63386b29792d613@changeid>
 <20201109170018.v4.4.I71b2118dfc00fd7b43b02d28e7b890081c2acfa2@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109170018.v4.4.I71b2118dfc00fd7b43b02d28e7b890081c2acfa2@changeid>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=cm27Pg_UAAAA:8 a=4xseQxl7JwUluFqpXLkA:9
 a=CjuIK1q_8ugA:10 a=xmb-EsYY8bH0VWELuYED:22
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Douglas,

On Mon, Nov 09, 2020 at 05:00:58PM -0800, Douglas Anderson wrote:
> Add support for the BOE NV110WTM-N61 panel.  The EDID lists two modes
> (one for 60 Hz refresh rate and one for 40 Hz), so we'll list both of
> them here.
> 
> Note that the panel datasheet requires 80 ms between HPD asserting and
> the backlight power being turned on.  We'll use the new timing
> constraints structure to do this cleanly.  This assumes that the
> backlight will be enabled _after_ the panel enable finishes.  This is
> how it works today and seems a sane assumption.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

I applied the binding patch (bindings before driver patch),
and added the missing flags while applying this patch.
All to drm-misc-next.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
