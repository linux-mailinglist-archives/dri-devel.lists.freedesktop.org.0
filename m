Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5BB197F2F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 17:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34D06E133;
	Mon, 30 Mar 2020 15:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8C86E133
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 15:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585580477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0iFtMMVk+tb6U/PyI9tjiDlyodFumA5zrSQk7l45iI8=;
 b=I4VIyBy8WbOI1LnBRzfm0XYa6/bdT+gS+pN3ggJBnNk49CQTBEKGD+wImXxZUQT56kMGYb
 8ErndkSTnOUCBWaQ+Q0I9HtlcvCEItetzpNyVKJmpN6pmo6i9vkIZTIs+o4RbF7iro+NaQ
 V2A8vraqTajg3PqxOjn+M+BLF5mnhjo=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-PRY2w7LMMT2jg85mzjQqbQ-1; Mon, 30 Mar 2020 11:01:16 -0400
X-MC-Unique: PRY2w7LMMT2jg85mzjQqbQ-1
Received: by mail-qt1-f200.google.com with SMTP id z5so15113016qtd.4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 08:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=0iFtMMVk+tb6U/PyI9tjiDlyodFumA5zrSQk7l45iI8=;
 b=XBWmqNJakMB79CFSHH56gNST/Pf+TELqvSvr7D+GSNtDBL8t9jXTkc2nW+95yYDnml
 jYBiU6B4EKveCKsFycS5BWzb/0eGdztAKaREb99nxxdb9wbeAJhSvBCCdC2h0VjzfBc9
 zG9pnr7C6l8tKGniDVAsDtS1RVzV2WDTseeTuC4DhjxqKIzs6UvIje7t7i6o6k+US0OY
 O5c3vpHeO9KkippecPWifbNcSpkNaX9uJrf/XRw1S6bQGZAd4lHDiVca4XBNYu7N83VF
 aFs+zsG6jpW+zmPkaP2hKy6QWr9ErDHmTkuOJQUHO7ejNFjXRxeZj+/c/e0YCIFn8e22
 V7VA==
X-Gm-Message-State: ANhLgQ0B/+Hwdw5GMYOldC8WVXT6SjopKSKAwJEoVZiyD7iV0TAVrMdB
 +H0HljLbdp12vVuZi+fnLVpJP1wwKAy0APXCTiMhlxvn9JrvE/jiJCv5v0DjI14HLtwqqaqUk4I
 ORsC+pyqBybm4lUz6+uMSuQepsi+p
X-Received: by 2002:ac8:18fb:: with SMTP id o56mr327866qtk.97.1585580476037;
 Mon, 30 Mar 2020 08:01:16 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuTpVM2tJABFPtbiMJiS9kXNBBQcSzMcjXH43xG9HbBknWMUpzBtSbDG9CZTTwaHjsgiFAYAQ==
X-Received: by 2002:ac8:18fb:: with SMTP id o56mr327759qtk.97.1585580475230;
 Mon, 30 Mar 2020 08:01:15 -0700 (PDT)
Received: from Ruby.lyude.net (static-173-76-190-23.bstnma.ftas.verizon.net.
 [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id w13sm10982240qtn.81.2020.03.30.08.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 08:01:14 -0700 (PDT)
Message-ID: <ed9c46fd0274eabd79cc3219ae9b031d32d7b386.camel@redhat.com>
Subject: Re: [PATCH v1 5/6] drm/dp_mst: add kernel-doc for
 drm_dp_mst_port.fec_capable
From: Lyude Paul <lyude@redhat.com>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Date: Mon, 30 Mar 2020 11:01:12 -0400
In-Reply-To: <20200328132025.19910-6-sam@ravnborg.org>
References: <20200328132025.19910-1-sam@ravnborg.org>
 <20200328132025.19910-6-sam@ravnborg.org>
Organization: Red Hat
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

On Sat, 2020-03-28 at 14:20 +0100, Sam Ravnborg wrote:
> Fix kernel-doc warnings for drm_dp_mst_port.fec_capable.
> This fixed the following warning:
> drm_dp_mst_helper.h:162: warning: Function parameter or member 'fec_capable'
> not described in 'drm_dp_mst_port'
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Francis <David.Francis@amd.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Mikita Lipski <mikita.lipski@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  include/drm/drm_dp_mst_helper.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/drm/drm_dp_mst_helper.h
> b/include/drm/drm_dp_mst_helper.h
> index bf5e65d2303e..d93e628ebc84 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -157,6 +157,10 @@ struct drm_dp_mst_port {
>  	 */
>  	bool has_audio;
>  
> +	/**
> +	 * @fec_capable: bool indicating if FEC can be supported
> +	 * up to that point in the MST network.

s/network/topology, but I can just fix that locally and push this in just a
moment. Thanks!

Reviewed-by: Lyude Paul <lyude@redhat.com>

> +	 */
>  	bool fec_capable;
>  };
>  
-- 
Cheers,
	Lyude Paul (she/her)
	Associate Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
