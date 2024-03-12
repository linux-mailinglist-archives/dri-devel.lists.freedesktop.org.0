Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AFC879774
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 16:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A286710F1E3;
	Tue, 12 Mar 2024 15:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="JI8aFJKz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com
 [95.215.58.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B99810F1E3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 15:23:58 +0000 (UTC)
Message-ID: <74c81a47-7d1d-4e04-9e78-c8fdd1992552@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710257035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JQUifa7PlXoTqHYyPMtXp/tPQ6qdpDrvSwtzOakPZBE=;
 b=JI8aFJKzhiNpR8zCzw9OMSXUEHaIBTYTTt5itUNil7pVZqg16mPGcuWrcO0wzOfghesKCd
 YJBQdmNdSnqk6SHTEAoJLnyieiOQRLO22Mnft+Xz/W5N0voBVB7bG9uUJkNyy3UGDGv/wV
 B0VLp8t87LkJg79Qo+gUBWnBL2jmGPY=
Date: Tue, 12 Mar 2024 23:23:39 +0800
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


If Thomas not objects,


Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>

