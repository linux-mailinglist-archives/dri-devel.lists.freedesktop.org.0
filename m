Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEBF881663
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 18:19:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37C910F300;
	Wed, 20 Mar 2024 17:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="KypfADzR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120A610F300
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 17:19:35 +0000 (UTC)
Message-ID: <d27297af-0c8b-4afb-807e-6728aa584422@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710955171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X0iT27oxr8K8N6Rdhvu48gTRgVT03iWvTcBeXmLBYZ4=;
 b=KypfADzR92Coav0tqPcSe9xYwCobcmTBm3AKGTpcyQnM8c4s5BAYQO5tsFVkcDdueE7rB3
 5vVpD+z72zTl7yJ8C+p1sXWroL6icfAxUfZ1kn79VPLdqQ434ODQVUCPZSd3++xexX9fQR
 bI4CjSvOdTI4WYAbiLD0uaOsMaWdo6I=
Date: Thu, 21 Mar 2024 01:19:21 +0800
MIME-Version: 1.0
Subject: Re: [v5, 04/13] drm/ast: Allocate instance of struct ast_i2c_chan with
 managed helpers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240320093738.6341-5-tzimmermann@suse.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240320093738.6341-5-tzimmermann@suse.de>
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
> Replace kzalloc() with drmm_kzalloc() and thereby put the release of
> the I2C instance into a separate action. Avoids explicit error roll-
> back in ast_i2c_chan_create(). No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>


Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>

-- 
Best regards,
Sui

