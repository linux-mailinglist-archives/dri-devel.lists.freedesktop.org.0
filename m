Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 555012D2EE5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 16:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8916E959;
	Tue,  8 Dec 2020 15:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F5F6E959
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 15:59:17 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kmfOW-0008Si-H9; Tue, 08 Dec 2020 16:59:16 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kmfOW-0000TK-8H; Tue, 08 Dec 2020 16:59:16 +0100
Message-ID: <4dbb86ffa92f7e1ab0a628a5ab09b91a265e64fc.camel@pengutronix.de>
Subject: Re: [PATCH v4 00/19] drm: managed encoder/plane/crtc allocation
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Date: Tue, 08 Dec 2020 16:59:16 +0100
In-Reply-To: <20201208155451.8421-1-p.zabel@pengutronix.de>
References: <20201208155451.8421-1-p.zabel@pengutronix.de>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-12-08 at 16:54 +0100, Philipp Zabel wrote:
> Hi,
> 
> this is an update of the drmm_(simple_)encoder_alloc(),
> drmm_universal_plane_alloc(), and drmm_crtc_alloc_with_plane()
> functions in v3 [1] together with the imx-drm managed allocation
> conversion from [2] as an example usage.
> a bit.
  ^^^^^^
this is a left-over of ", reordered an squashed a bit." before I decided
to move it into the list of changes below.

> 
> Changes since v3:
[...]
>  - Reorder and squash the imx-drm managed allocation conversion patches
>    to use the new functions directly.

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
