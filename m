Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6FF2B3803
	for <lists+dri-devel@lfdr.de>; Sun, 15 Nov 2020 19:49:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D782C6E9AA;
	Sun, 15 Nov 2020 18:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A716E9AA
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 18:49:16 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7EBC580530;
 Sun, 15 Nov 2020 19:49:14 +0100 (CET)
Date: Sun, 15 Nov 2020 19:49:13 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: fix oops in drm_atomic_set_crtc_for_connector
Message-ID: <20201115184913.GA4065005@ravnborg.org>
References: <20201115153139.24369-1-chris@chris-wilson.co.uk>
 <7xhyNYrWtzUIt3HNrWfi9iScW0k475RZiKNfF5TbPs@cp4-web-031.plabs.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7xhyNYrWtzUIt3HNrWfi9iScW0k475RZiKNfF5TbPs@cp4-web-031.plabs.ch>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=taGs_qngAAAA:8 a=7gkXJVJtAAAA:8
 a=nKBB6AqIt_l30pqmk_AA:9 a=CjuIK1q_8ugA:10 a=jX-eoxYwploA:10
 a=DM_PlaNYpjARcMQr2apF:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 15, 2020 at 03:39:07PM +0000, Simon Ser wrote:
> crtc can be NULL. connector, extracted from conn_state, can't.
> 
> Fixes: e3aae683e861 ("drm: convert drm_atomic_uapi.c to new debug helpers")
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
