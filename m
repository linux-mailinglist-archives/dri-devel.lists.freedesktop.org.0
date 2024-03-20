Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F4288169A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 18:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35E010F5C5;
	Wed, 20 Mar 2024 17:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="wfa7dLIw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com
 [95.215.58.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D6610FE86
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 17:32:55 +0000 (UTC)
Message-ID: <39eeaa47-28af-462d-aa4d-4fddb3d47b4a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710955974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ijsTiikvVmODDQQKISUL7wZ+nolr9qkC5txqXutdtaA=;
 b=wfa7dLIwwLCh02AU4infF0x+SVTDfRRE4c45mchARhBefoVOjGTw6HHGm/U55GaDrqHssp
 8cSUGj/lXxDtF33OvwzTHJrsFflEWW4EwMUNPA/6/SNPricKKekXcVTJqHKympmERaiBEm
 PbJlanpK+B2jFPYqYmFygK6IOCbR0DM=
Date: Thu, 21 Mar 2024 01:32:46 +0800
MIME-Version: 1.0
Subject: Re: [v5,06/13] drm/ast: Rename struct ast_i2c_chan to struct ast_ddc
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240320093738.6341-7-tzimmermann@suse.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240320093738.6341-7-tzimmermann@suse.de>
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
> The struct struct ast_i2c_chan represents the Display Data Channel
> (DDC); I2C is the underlying bus. Rename the structure, the variables
> and the helper ast_i2c_create() to ddc-like terms. No functional
> changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>


Personally, I think _i2c_ is better name than _ddc_. Because It seems that
the Display Data Channel is comes from VESA standard, while aspeed I2C can
be used to configure the external display bridges(encoder). So _i2c_ is a
*abstract* name, and can be utilized to do something else beyond the DDC
itself.


Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>

-- 
Best regards,
Sui

