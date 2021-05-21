Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D14A38C8FB
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 16:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCA96F880;
	Fri, 21 May 2021 14:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F576F87F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 14:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mzxTAoQKZErI0PSlV6Tx+3ILAHO7jFNRjBMhpv39Rlg=; b=bILOGlhtsDznJmhl3TFXvnvplE
 Ixe5T9HBrMiDZAMMx686k9FpKn1MoqOli+IjA8R8W5lHgPq/6V5gQAy0cvXVppCuGncYVYXrfJ1iA
 mDTQj4RQ0x2cVmKxxqif50mnzTNJd1YW5eYwJwKp0Ls9DwseAh9+YEu/yXcVzyi/ZHKjxENmXmIsj
 jJua4+BnHtIVIU6l/fRg8ZFtLHYf2pkbwZwOlWiMbiYsR03CkDUc5iDBh+KZW/j2/rKY1cGCxELJy
 qUoNtLvmohAEWOPP9E7yLiBxq7gf6X4HjlOOtsTm5+Jf46IQdc8hXtE1zPrKNoHY/NCKNzIbW8tjL
 fJseoIJg==;
Received: from [2a01:799:95f:4600:cca0:57ac:c55d:a485] (port=50828)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lk5q6-0005ru-3Q; Fri, 21 May 2021 16:09:22 +0200
Subject: Re: [PATCH 11/11] drm/tiny: drm_gem_simple_display_pipe_prepare_fb is
 the default
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-11-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <0b2b3fd7-7740-4c4e-78a5-142a6e9892ea@tronnes.org>
Date: Fri, 21 May 2021 16:09:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210521090959.1663703-11-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 21 May 2021 14:11:28 +0000
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
Cc: linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 David Lechner <david@lechnology.com>, Emma Anholt <emma@anholt.net>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Joel Stanley <joel@jms.id.au>, Thomas Zimmermann <tzimmermann@suse.de>,
 xen-devel@lists.xenproject.org, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-aspeed@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 21.05.2021 11.09, skrev Daniel Vetter:
> Goes through all the drivers and deletes the default hook since it's
> the default now.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Noralf Trønnes <noralf@tronnes.org>
