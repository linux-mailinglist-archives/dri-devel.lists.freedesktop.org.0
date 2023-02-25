Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 460406A2BF5
	for <lists+dri-devel@lfdr.de>; Sat, 25 Feb 2023 22:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371A310E158;
	Sat, 25 Feb 2023 21:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6690B10E158
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Feb 2023 21:51:51 +0000 (UTC)
Received: from [192.168.2.94] (unknown [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E4F886602FA1;
 Sat, 25 Feb 2023 21:51:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677361909;
 bh=NcrrHsYtYSHOqzQyTcRyADSjQ71K3Dy7UShnCp0HyYc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=f749W/mhEIbIMi2u0yybeoqTAxuRaia+z4oYfTVYHG1TaL7MEuJ2DBqrIUkwft4Ds
 MEP4IIaRZYsc93GMwvggRVtFRJQw09lEJc/0jiWmrBHojdUtL5v1dh/jEKlG/1xgOU
 N7k7IBHeiibzralvB8wmf+2gqq9/tq30szbPBFKzD44AbsqJb9gCrHAwK4yT38MrSS
 g2FHMrLaYZUwJuaTYbNyqheVisB7FXHLvjIPj7+fdqztlRpltVgIc5V+ec8cH8vZn0
 iVR8z5Et0dlufdEZyk32y0nSrFB99MzHTqNcHkEEv/UlGtiEkXdxsmSPLJI1PPM9hA
 QvR9Y24g8bc7g==
Message-ID: <eddfa36c-4553-d392-0047-313002c613d4@collabora.com>
Date: Sun, 26 Feb 2023 00:51:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/shmem-helper: Fix locking for
 drm_gem_shmem_get_pages_sgt()
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230205125124.2260-1-lina@asahilina.net>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230205125124.2260-1-lina@asahilina.net>
Content-Type: text/plain; charset=UTF-8
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
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/5/23 15:51, Asahi Lina wrote:
> -EXPORT_SYMBOL_GPL(drm_gem_shmem_get_pages_sgt);
> +EXPORT_SYMBOL(drm_gem_shmem_get_pages_sgt);

Note it was a GPL symbol. I expect that all drm-shmem exports should be GPL.

-- 
Best regards,
Dmitry

