Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 368293D22E7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 13:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EDAE6E4AB;
	Thu, 22 Jul 2021 11:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107BB6E4AB
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 11:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H2GxAufCVDJeVkkQNzy0Z7SIJvesgH5xWPS2ImeU+D0=; b=ZcEJrUl0D8MlPDvkfL3JiKOPko
 y/uAGRmXKmQRTrhoFitgIzKlVseT8W1mmkEcEkM9zX9ff45Th7w8m4pZ5fbvMTruMGSSwjJxVAj3f
 prO9SyrUsED9JEQM3p1pu8C7uP0dAiW6AAkW315EdXgkzSAP7fZvrTv6hRiKPFqRe0wtOEDuvjCno
 4uB/09lvwI5EvCTdPZfRgY1Tkb3kwqLnIcyxj9qjQKEpoz4JMDCA9ySEVv/ktZNJyCV/1XquZbivh
 GX6TpM5dXP7jpZfbRL/XcxwcQQ0Q7sUr7NbREejMoXGzx3Uqx9h7lNgZFdnq74O+4Ad3MXM9OShOc
 sEt3aBfA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:64209
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1m6XCU-0001L9-1d; Thu, 22 Jul 2021 13:49:14 +0200
Subject: Re: [PATCH 4/5] drm/gud: Map framebuffer BOs with drm_gem_fb_vmap()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com
References: <20210715180133.3675-1-tzimmermann@suse.de>
 <20210715180133.3675-5-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <9c72aa9d-c5d4-e53f-3690-9be9a8d6a726@tronnes.org>
Date: Thu, 22 Jul 2021 13:49:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210715180133.3675-5-tzimmermann@suse.de>
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



Den 15.07.2021 20.01, skrev Thomas Zimmermann:
> Abstract the framebuffer details by mapping its BOs with a call
> to drm_gem_fb_vmap(). Unmap with drm_gem_fb_vunmap().
> 
> The call to drm_gem_fb_vmap() ensures that all BOs are mapped
> correctly. Gud still only supports single-plane formats.
> 
> No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Acked-by: Noralf Trønnes <noralf@tronnes.org>
