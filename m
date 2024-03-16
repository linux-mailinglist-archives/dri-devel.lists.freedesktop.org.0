Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB40887D964
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 10:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC02F10E507;
	Sat, 16 Mar 2024 09:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="CjPp58Eb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com
 [91.218.175.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F209410E507
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 09:16:29 +0000 (UTC)
Message-ID: <3484b67d-4d11-4711-b7c4-a8499e93e396@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710580586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WMjTZnhQDws3BLVhB83JyEShAmgRVpm9MoovOa4l4gM=;
 b=CjPp58EbHjJvWTQKqHqAkqznh77SBI+QHhijnRL3LZ6CK+nPdFu/EqrbiNx0Xc2mx97WzJ
 o0+SVmkKP0Bp/3I9m0MyGzWXvKBvQzs0srR8f+Md0dH6hdp9nCGsUD2mmca0zxRl9gTWZg
 rUKmenkcQWYx1WUo5BC8YQw4Z0pUH2M=
Date: Sat, 16 Mar 2024 17:16:04 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v10 9/9] drm/ast: Add drm_panic support
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, javierm@redhat.com,
 bluescreen_avenger@verizon.net, noralf@tronnes.org
Cc: gpiccoli@igalia.com
References: <20240315151317.857684-1-jfalempe@redhat.com>
 <20240315151317.857684-10-jfalempe@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240315151317.857684-10-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,


On 2024/3/15 23:11, Jocelyn Falempe wrote:
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


Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>


-- 
Best regards,
Sui

