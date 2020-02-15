Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8A415FDCC
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2020 10:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16AC06E8A5;
	Sat, 15 Feb 2020 09:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2C76E8A5
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2020 09:19:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbrezillon) with ESMTPSA id 480A2290B60
Date: Sat, 15 Feb 2020 10:19:36 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/atomic-helper: fix kerneldoc
Message-ID: <20200215101936.0ca2c4d1@collabora.com>
In-Reply-To: <20200214081340.2772853-1-daniel.vetter@ffwll.ch>
References: <20200214081340.2772853-1-daniel.vetter@ffwll.ch>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Feb 2020 09:13:40 +0100
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> Just a tiny copypasta mistake.
> 
> Fixes: 751465913f04 ("drm/bridge: Add a drm_bridge_state object")
> Cc: Boris Brezillon <boris.brezillon@collabora.com>

Acked-by: Boris Brezillon <boris.brezillon@collabora.com>

> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 33141d2cdad4..8fce6a115dfe 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -635,7 +635,6 @@ EXPORT_SYMBOL(__drm_atomic_helper_bridge_reset);
>   * drm_atomic_helper_bridge_reset() - Allocate and initialize a bridge state
>   *				      to its default
>   * @bridge: the bridge this state refers to
> - * @state: bridge state to initialize
>   *
>   * Allocates the bridge state and initializes it to default values. This helper
>   * is meant to be used as a bridge &drm_bridge_funcs.atomic_reset hook for

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
