Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D20B79EF68
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 18:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA63910E48E;
	Wed, 13 Sep 2023 16:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a02:c205:3004:2154::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0E710E4BE
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 16:52:12 +0000 (UTC)
Received: from [2a00:20:4004:4787:9869:7b20:a1ae:be54] (helo=akphone)
 by mail.andi.de1.cc with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <andreas@kemnade.info>)
 id 1qgT5y-003grq-Gl; Wed, 13 Sep 2023 18:52:06 +0200
Date: Wed, 13 Sep 2023 18:52:02 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [RFC PATCH] drm: omapdrm: dsi: add refsel also for omap4
Message-ID: <20230913185202.6e6c5341@akphone>
In-Reply-To: <48972ab0-e4ed-11b2-31fb-ad93695a4db1@ideasonboard.com>
References: <20230913065911.1551166-1-andreas@kemnade.info>
 <48972ab0-e4ed-11b2-31fb-ad93695a4db1@ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; aarch64-alpine-linux-musl)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: arnd@arndb.de, Tony Lindgren <tony@atomide.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, laurent.pinchart@ideasonboard.com,
 u.kleine-koenig@pengutronix.de, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Sep 2023 15:11:08 +0300
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> On 13/09/2023 09:59, Andreas Kemnade wrote:
> > Some 3.0 source has it set behind a if (omap4).
> > Maybe it is helpful maybe not, at least in the omap4460
> > trm these bits are marked as reserved.
> > But maybe some dsi video mode panel starts magically working.  
> 
> Sorry, what does this mean? That this fixes something, or you are
> just guessing?
> 
just diffing registers between good and bad. It does not fix anything,
just reducing the diff.

> I'm somewhat sure that the upstream driver used to work on omap4 sdp, 
> which has two DSI panels. But I can't even remember what omap4
> version it had.
> 
after we are using displays from gpu/drm/displays?

Regards
Andreas
