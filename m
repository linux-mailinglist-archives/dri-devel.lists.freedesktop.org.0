Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A42805600
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 14:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE4A89E36;
	Tue,  5 Dec 2023 13:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com
 [IPv6:2001:41d0:203:375::aa])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE3810E2AF
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 13:32:52 +0000 (UTC)
Message-ID: <1b1ed7af-00d8-440a-82b9-6244b3f027f1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1701783169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=owuXQ7w4mb8N2y2kvDejIbUj02qBvhL8RNBhO9ba/Ag=;
 b=gp+G++DoI7mZKaxgYGQlDpc131Ty/XUPEn5z1WzGLq7AdqJTxkW/3pICrnv4C0kwNKli1J
 VbHNdkdEZmEtRViDCSkzxZYFaTXzZrSMhB2zqy32bxcYfSguHmJzsYljIHlmN3yH48AEbT
 CEPlFnh+cxxI5mGD2F8o9t/qkCpnjeI=
Date: Tue, 5 Dec 2023 21:32:42 +0800
MIME-Version: 1.0
Subject: Re: [2/5] drm/atomic: Remove inexistent reference
To: Maxime Ripard <mripard@kernel.org>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20231204121707.3647961-2-mripard@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20231204121707.3647961-2-mripard@kernel.org>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/12/4 20:17, Maxime Ripard wrote:
> The num_connectors field documentation mentions a connector_states field
> that has never been part of this structure.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>


> ---
>   include/drm/drm_atomic.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 2a08030fcd75..13cecdc1257d 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -413,7 +413,7 @@ struct drm_atomic_state {
>   	struct __drm_crtcs_state *crtcs;
>   
>   	/**
> -	 * @num_connector: size of the @connectors and @connector_states arrays
> +	 * @num_connector: size of the @connectors array
>   	 */
>   	int num_connector;
>   
