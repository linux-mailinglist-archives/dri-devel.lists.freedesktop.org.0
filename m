Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1252A3D22CC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 13:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C446E57E;
	Thu, 22 Jul 2021 11:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15106E57E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 11:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NPm1xS0JtbQ4ke6GTJz38UVACHbpRJBA05EM/WvMpso=; b=tZcbbBtNa5WeNLjATZC/sKfN+O
 BHncc4a3Q9p4s9hXzRN/u26HMF3lcrB7BEhTYEG1upiZrbKkEA3s8X/U5aBNYVGFK5Rb8pWp4tI9q
 n177HfrOS6wDHjOOO6f48T+eiODmBA4lb4zIyVKBqEUL6FAOalfUDRe2J+KBRSqVwJAiKbzDfxcaE
 PpWZVVIU11mfa2+BSjKhLw9IT+k+sSf94Es6kzKK2gKMDpDkGAyUlKYIZoSViiPCNeQszNUHtgdrr
 d/H7FximsaGEiZ0mptVpxr9DXl0jyJvmJ53sgeUuB4XogbaE7prLMKTaMVxyc+MQHzILO5Bwm6aj5
 Api0mFoA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:58710
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1m6Wyo-0004DC-J8; Thu, 22 Jul 2021 13:35:06 +0200
Subject: Re: [PATCH 0/7] drm: Provide framebuffer dma-buf helpers
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, hdegoede@redhat.com, david@lechnology.com,
 airlied@redhat.com, sean@poorly.run
References: <20210716140801.1215-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <411152ed-f091-719d-4160-e42481ab95de@tronnes.org>
Date: Thu, 22 Jul 2021 13:35:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210716140801.1215-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 16.07.2021 16.07, skrev Thomas Zimmermann:
> Provide helpers that wrap dma_buf_{begin,end}_cpu_access() for all
> GEM BOs attached to a framebuffer. Convert drivers and remove ugly
> boilerplate code.
> 

Nice, for the series:

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>


> Thomas Zimmermann (7):
>   drm/gem: Provide drm_gem_fb_{begin,end}_cpu_access() helpers
>   drm/udl: Use framebuffer dma-buf helpers
>   drm/mipi-dbi: Use framebuffer dma-buf helpers
>   drm/gud: Use framebuffer dma-buf helpers
>   drm/gm12u320: Use framebuffer dma-buf helpers
>   drm/repaper: Use framebuffer dma-buf helpers
>   drm/st7586: Use framebuffer dma-buf helpers
> 
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 89 ++++++++++++++++++++
>  drivers/gpu/drm/drm_mipi_dbi.c               | 20 ++---
>  drivers/gpu/drm/gud/gud_pipe.c               | 13 ++-
>  drivers/gpu/drm/tiny/gm12u320.c              | 19 ++---
>  drivers/gpu/drm/tiny/repaper.c               | 18 +---
>  drivers/gpu/drm/tiny/st7586.c                | 18 ++--
>  drivers/gpu/drm/udl/udl_modeset.c            | 29 ++-----
>  include/drm/drm_gem_framebuffer_helper.h     |  6 ++
>  8 files changed, 130 insertions(+), 82 deletions(-)
> 
> --
> 2.32.0
> 
