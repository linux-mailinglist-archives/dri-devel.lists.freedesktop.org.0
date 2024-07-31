Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4F1942D40
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 13:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A480810E3FD;
	Wed, 31 Jul 2024 11:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Uz3DFZPL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com
 [95.215.58.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECB710E3FD
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 11:29:12 +0000 (UTC)
Message-ID: <b9e8fc7a-c05f-42a2-9e6f-57366540161f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1722425350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1aLLYvUknzdfF3trH7e68gkaa95sYqSFU6MJSWDtmYo=;
 b=Uz3DFZPLhI3q0gTiakc7siz9HUfIS2oyVoKCDk5LPQPs0PUA0As/V+4hGnb6FkWHe/4Ja8
 bg4uzZwgu8ftEUDHUP5GjvVJUPM+XesJ4LDKlrahTxXELYEUTa7tUM3EHSsjRSWvHb8ulo
 vLfTLsHlSTnZsRUcY8ZNHF3Qc0EshuY=
Date: Wed, 31 Jul 2024 19:29:01 +0800
MIME-Version: 1.0
Subject: Re: drm/mgag200: Fix VBLANK interrupt handling
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20240731071004.519566-1-tzimmermann@suse.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240731071004.519566-1-tzimmermann@suse.de>
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


On 2024/7/31 15:09, Thomas Zimmermann wrote:
> Fix support for VBLANK interrupts on G200ER, G200EV and G200SE, which
> use a slightly different implementation than the others. The original
> commits forgot to update the custom helpers when adding interrupt
> handling for VBLANK events.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>


LGTM,


Acked-by: sui.jingfeng@linux.dev

-- 
Best regards,
Sui

