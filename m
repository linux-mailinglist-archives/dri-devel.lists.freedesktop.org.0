Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9E988164F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 18:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEBB10FE71;
	Wed, 20 Mar 2024 17:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="EJeeunRL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com
 [91.218.175.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CC010FE77
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 17:16:19 +0000 (UTC)
Message-ID: <2b3edcb9-5e26-4558-9367-a7c532044914@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710954976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=do/h4qy5CdcE4AMZtEG+42EfMfnC1yQtFfD8xhWZfds=;
 b=EJeeunRL9JZt6Uy972W9yLXtVzIvcT3cALUVqVRkRi8tAVzm/bUU7A/PpNE4cus6Dbng/B
 nNyBkVsCb3JxJ/0BwTFg3d+wEoWxqabGDwDEgagh4s28DZLmzF9yzSeaCErUqE98uGRdUu
 YqlqSzpxDIJsKVyS9LofR+hI2k+nxZs=
Date: Thu, 21 Mar 2024 01:16:06 +0800
MIME-Version: 1.0
Subject: Re: [v5,01/13] drm/ast: Include <linux/of.h> where necessary
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240320093738.6341-2-tzimmermann@suse.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240320093738.6341-2-tzimmermann@suse.de>
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


On 2024/3/20 17:34, Thomas Zimmermann wrote:
> Include <linux/of.h> to get of_property_read_u32() in the source
> files that need it. Avoids the proxy include via <linux/i2c.h>.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>


Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>

-- 
Best regards,
Sui

