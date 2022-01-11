Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 491A248AE79
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 14:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FACA10F5E0;
	Tue, 11 Jan 2022 13:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D17210F5E0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 13:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kXn2iUtT0728ErrypbedGfMRU6aQOhc1XiA+nirqvxU=; b=N89LcMuzfUqwA2vgTt3lslvZ/i
 CiM6OALusbNobb2lHUbpmjboriClZowO59PwAawT+ZmIO73MRiGBZEhGkC8YWPwew7fWhVvNFmJiv
 yHmnfpqd9+g93jj/lu10kvmhDAGmxQ8iN4H7xlrCII1xyU8NNO/avT7efycWTAWCxDwQzTYe33oVi
 3R9XoZIhBRRISL7jFfrGVRhM8uUf+bMa+BAQDKssQgIjHCuoELXzKoAJRjsTld0asPGdqm48GHpCi
 uXhWld/njoRbTdnffjimvrUBfcGzEc1ZcR2TpfX+oXL/OAdkrBVrv27f8VyHzVkKvRXJGuU77ofjo
 tTNPRPaQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:54476
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1n7HGX-0005yg-IB; Tue, 11 Jan 2022 14:32:45 +0100
Message-ID: <ce029d3b-6f68-b08b-9866-1ef4284a29ac@tronnes.org>
Date: Tue, 11 Jan 2022 14:32:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] drm/mipi-dbi: Fix source-buffer address in
 mipi_dbi_buf_copy
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220111132634.18302-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220111132634.18302-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 11.01.2022 14.26, skrev Thomas Zimmermann:
> Set the source-buffer address after mapping the buffer into the
> kernel's address space. Makes MIPI DBI helpers work again.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: c47160d8edcd ("drm/mipi-dbi: Remove dependency on GEM CMA helper library")
> Reported-by: Noralf Trønnes <noralf@tronnes.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> ---

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
