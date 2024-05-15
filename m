Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA3D8C6B9E
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 19:41:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C8610E4C9;
	Wed, 15 May 2024 17:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="eVwvTXCZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com
 [91.218.175.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905A310E4C9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 17:41:45 +0000 (UTC)
Message-ID: <1ec33c2d-d987-4de4-bef3-51234c9fa053@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715794903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iDqmE0rlC8Io/4JVPkgYsXswBJP/Souk/8/sy2UZHvM=;
 b=eVwvTXCZAH2fRTGUUZrvxySAYx7owa7kUXcjvKbwdT6gwIwU885Z15iQR3ufbrxcJuBNPW
 tviMmAsH+++AlksgpzW4Asp7R0Z45OmV1uS25EP49z8PQAn1l0kLKlIYOIRuFTE8IlzFlU
 JutZQ662pbcI9WhQaBnm3lkT6nPEhUw=
Date: Thu, 16 May 2024 01:41:18 +0800
MIME-Version: 1.0
Subject: Re: [07/11] drm/loongson/7a2000: convert to struct drm_edid
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <b8c477279a6ae1b44df72bee230180e277087fae.1715691257.git.jani.nikula@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <b8c477279a6ae1b44df72bee230180e277087fae.1715691257.git.jani.nikula@intel.com>
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

Hi, Jani

I love your patch, thanks.


On 2024/5/14 20:55, Jani Nikula wrote:
> Prefer the struct drm_edid based functions for reading the EDID and
> updating the connector.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---


Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>

-- 
Best regards,
Sui

