Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EA919EDF4
	for <lists+dri-devel@lfdr.de>; Sun,  5 Apr 2020 22:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B016789090;
	Sun,  5 Apr 2020 20:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74D289090
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Apr 2020 20:38:09 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id B40DD80462;
 Sun,  5 Apr 2020 22:38:00 +0200 (CEST)
Date: Sun, 5 Apr 2020 22:37:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v1 6/6] drm/bridge: fix kernel-doc warning in panel.c
Message-ID: <20200405203758.GA5692@ravnborg.org>
References: <20200328132025.19910-1-sam@ravnborg.org>
 <20200328132025.19910-7-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200328132025.19910-7-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=P1BnusSwAAAA:8 a=QX4gbG5DAAAA:8 a=7CQSdrXTAAAA:8 a=hD80L64hAAAA:8
 a=IpJZQVW2AAAA:8 a=RwHePtW7AAAA:8 a=Ihe5oWDGoVQizsw6XHcA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=D0XLA9XvdZm18NrgonBM:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=IawgGOuG5U0WyFbmm1f5:22 a=FqraQwd7dyEg5dwJgZJs:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Mikita Lipski <mikita.lipski@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 David Francis <David.Francis@amd.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Nirmoy Das <nirmoy.das@amd.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 James Qian Wang <james.qian.wang@arm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 28, 2020 at 02:20:25PM +0100, Sam Ravnborg wrote:
> Add missing documentation to fix following warning:
> panel.c:303: warning: Function parameter or member 'bridge' not described in 'drm_panel_bridge_connector'
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/bridge/panel.c | 1 +
>  1 file changed, 1 insertion(+)

Committed to drm-misc-next

> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 8461ee8304ba..e933f1c47f5d 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -311,6 +311,7 @@ EXPORT_SYMBOL(devm_drm_panel_bridge_add_typed);
>  
>  /**
>   * drm_panel_bridge_connector - return the connector for the panel bridge
> + * @bridge: The drm_bridge.
>   *
>   * drm_panel_bridge creates the connector.
>   * This function gives external access to the connector.
> -- 
> 2.20.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
