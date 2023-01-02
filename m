Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 077C165B6CE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 20:00:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824DD10E37F;
	Mon,  2 Jan 2023 19:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com
 (mailrelay2-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:401::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E756510E37F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 19:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=EQk+1kOAMVr8RWq04biVbUG5x442199Y9So5U/pNTxw=;
 b=rQQD8bxuv8Pgr1oC96farSkjWukdP6oP9yQypSyjEo4DUIPdhl62ZjNYyaLd5ZxDra3UUKoJKM8Ac
 YAJsgen/5rQJ9Fq5U64E+/mmNoYz6GvwiEPg4EwUMezMddKjkd1GfHyz0bqSYf10WraLdOn9IaTBvK
 6TFSQoF5eOZXo5J/L5qRx/A83Lizm18nFeb1S4zGpk8HWr1h95/fkQ1FlMueALOpM4o2VSDGupPfo1
 n+Q6Mr3b7HjBjj7+vSXShi3Zcel92+eUXgyNbPZTd6BelRZUj0sPlf2oQqy6KX4fg1VcSPv+oxgkFW
 IGH+vxRlSD0mxg8bZBl8dFT/Kz6nuBg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=EQk+1kOAMVr8RWq04biVbUG5x442199Y9So5U/pNTxw=;
 b=K46vGaMogCk+vHo9VPQrAC0tZwR/vCA7/M7h/PYk3t9cxj8G1WhbgPTZ/XaOwNIJlfu7ehEWGqpgJ
 n9b3McnBQ==
X-HalOne-ID: be9e8061-8acf-11ed-a2ca-93f0a866dfbb
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2 (Halon) with ESMTPSA
 id be9e8061-8acf-11ed-a2ca-93f0a866dfbb;
 Mon, 02 Jan 2023 19:00:39 +0000 (UTC)
Date: Mon, 2 Jan 2023 20:00:37 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 00/14] drm/panel: Make panel drivers use existing DSI
 write macros
Message-ID: <Y7Mp1diWRWgiHsw0@ravnborg.org>
References: <20221228014757.3170486-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228014757.3170486-1-javierm@redhat.com>
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
Cc: Ondrej Jirman <megous@megous.com>, Purism Kernel Team <kernel@puri.sm>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier.

On Wed, Dec 28, 2022 at 02:47:43AM +0100, Javier Martinez Canillas wrote:
> Hello,
> 
> This series contains cleanups for DRM panel drivers that define their own
> DSI write macros instead of using what's already in <drm/drm_mipi_dsi.h>.
> 
> The changes are quite trivial but I've only tested this with allmodconfig
> and `make M=drivers/gpu/drm/panel/` so please review and testing would be
> highly appreciated.

Nice cleanup - I like it.
In most of the patches there is some trivial indent that should be
fixed, I think I noted it everywhere.

Sorry - but no testing.

The last patch is buggy - see the comment.
I suggest to land patch 1 now (with the fix), this makes it easier for
others to test on top of drm-misc-next.

	Sam


> 
> Best regards,
> Javier
> 
> 
> Javier Martinez Canillas (14):
>   drm/mipi-dsi: Add a mipi_dsi_dcs_write_seq() macro
>   drm/panel-asus-z00t-tm5p5-n35596: Drop custom DSI write macros
>   drm/panel-sitronix-st7703: Drop custom DSI write macros
>   drm/panel-leadtek-ltk050h3146w: Drop custom DSI write macro
>   drm/panel-elida-kd35t133: Drop custom DSI write macro
>   drm/panel-boe-bf060y8m-aj0: Drop custom DSI write macro
>   drm/panel-novatek-nt35950: Drop custom DSI write macro
>   drm/panel-jdi-fhd-r63452: Drop custom DSI write macros
>   drm/panel-samsung-s6e88a0-ams452ef01: Drop custom DSI write macro
>   drm/panel-samsung-sofef00: Drop custom DSI write macro
>   drm/panel-sharp-ls060t1sx01: Drop custom DSI write macro
>   drm/panel-mantix-mlaf057we51: Drop custom DSI write macro
>   drm/panel-sony-tulip-truly-nt35521: Drop custom DSI write macro
>   drm/panel-xinpeng-xpp055c272: Drop custom DSI write macro
> 
>  .../drm/panel/panel-asus-z00t-tm5p5-n35596.c  |  96 ++---
>  .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    |  28 +-
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c  |  34 +-
>  drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c  |  50 +--
>  .../drm/panel/panel-leadtek-ltk050h3146w.c    |  64 ++--
>  .../gpu/drm/panel/panel-mantix-mlaf057we51.c  |  24 +-
>  drivers/gpu/drm/panel/panel-novatek-nt35950.c |  14 +-
>  .../panel/panel-samsung-s6e88a0-ams452ef01.c  |  24 +-
>  drivers/gpu/drm/panel/panel-samsung-sofef00.c |  24 +-
>  .../gpu/drm/panel/panel-sharp-ls060t1sx01.c   |  19 +-
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c |  83 ++---
>  .../panel/panel-sony-tulip-truly-nt35521.c    | 348 +++++++++---------
>  .../gpu/drm/panel/panel-xinpeng-xpp055c272.c  |  44 +--
>  include/drm/drm_mipi_dsi.h                    |  16 +
>  14 files changed, 374 insertions(+), 494 deletions(-)
> 
> -- 
> 2.38.1
