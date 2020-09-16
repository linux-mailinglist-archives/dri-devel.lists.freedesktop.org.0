Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 031DE26C18F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 12:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761766E9F7;
	Wed, 16 Sep 2020 10:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E8C6E9F7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 10:22:53 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kIUaR-0003U0-RP; Wed, 16 Sep 2020 12:22:51 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kIUaR-0001AW-In; Wed, 16 Sep 2020 12:22:51 +0200
Message-ID: <98ffb169b0b1588165697b8ecc4e43307331e1e7.camel@pengutronix.de>
Subject: Re: [PATCH v3 5/7] drm/imx: use drmm_simple_encoder_alloc()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 16 Sep 2020 12:22:51 +0200
In-Reply-To: <20200916090823.GX438822@phenom.ffwll.local>
References: <20200911135724.25833-1-p.zabel@pengutronix.de>
 <20200911135724.25833-5-p.zabel@pengutronix.de>
 <20200916090823.GX438822@phenom.ffwll.local>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Wed, 2020-09-16 at 11:08 +0200, Daniel Vetter wrote:
> On Fri, Sep 11, 2020 at 03:57:22PM +0200, Philipp Zabel wrote:
> > This allows to drop the custom drm_encoder_cleanup() actions.
> > 
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> > New in v3, example conversion of drm_simple_encoder_init() users.
> > 
> > This and the following patches depend on the drm/imx conversion to use managed
> > resources [1].
> > 
> > [1] https://lore.kernel.org/dri-devel/20200911133855.29801-3-p.zabel@pengutronix.de/T/#m335a28c5c26ab14bccc998d4dc0aed6850e9bc36
[...]
> Where does this apply to? Neither upstream nor linux-next seems to have
> the drmm_ conversion for imx already applied, and that's kinda the juicy
> part I'd like to look at a bit.

Oh, ok. I did (re)send the basic drmm_ conversion separately at [1],
mentioned above.

> The patches here are just mechanical conversion. Can you pls include
> the drmm_ conversion too (maybe even squash these patches here in, I
> think that would be more readable)?

I'll squash and resend as a single series.

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
