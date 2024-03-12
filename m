Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A12DF879961
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 17:50:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDE8112F1F;
	Tue, 12 Mar 2024 16:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="aPvaxrAC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDA7112F1F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 16:50:55 +0000 (UTC)
Message-ID: <158d9d0f-d7d7-4216-adc6-75e8a0a761db@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710262252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r5Q/A4wgGuesdFZSjUgWnNPiephUBWxeJiayj5OxsQo=;
 b=aPvaxrACKcQfm2+w2IPqXcBfOvr2uekrnIOPHibMZ4GfzYYqeSiQHfrgC5OUAHKBnjJiWg
 3Yd2BfZEf+D1FWpw48ObQ1Ej18Fk+fJFnsPTOyqUypyHc0moCTl5YzA7f4dDwzbWZhlJBc
 qAB0dk11mJ1wL9nKOpS89bEFAd7i9Rg=
Date: Wed, 13 Mar 2024 00:50:44 +0800
MIME-Version: 1.0
Subject: Re: [v9,9/9] drm/ast: Add drm_panic support
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, javierm@redhat.com,
 bluescreen_avenger@verizon.net, noralf@tronnes.org
Cc: gpiccoli@igalia.com
References: <20240307091936.576689-10-jfalempe@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240307091936.576689-10-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2024/3/7 17:14, Jocelyn Falempe wrote:
> Add support for the drm_panic module, which displays a message to
> the screen when a kernel panic occurs.
>
> v7
>   * Use drm_for_each_primary_visible_plane()
>
> v8:
>   * Replace get_scanout_buffer() logic with drm_panic_set_buffer()
>     (Thomas Zimmermann)
> v9:
>   * Revert to using get_scanout_buffer() (Sima)
>   * move get_scanout_buffer() to plane helper functions
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>


I have done very limited test with ast2600, basically works by trigger via debugfs interface as the cover-letter said.
so,

Tested-by: Sui Jingfeng <sui.jingfeng@linux.dev>

