Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D9C8816A1
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 18:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8F710F934;
	Wed, 20 Mar 2024 17:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="XSfE+/yQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C1310F934
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 17:35:54 +0000 (UTC)
Message-ID: <8d74e77e-0dec-4e8d-96ee-cf2db0413dec@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710956152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=te8I14HnI/j6N5UrAuCZ21PgojOaIOz/FECM3iJK/OQ=;
 b=XSfE+/yQ0yxdIYjceHj2uiXNGuRPBRsg7iYwWjVJ4V504CIZEVw8Utl+4rO2dFHwx2lTY3
 +vcv867E2G6RKAuBBG0FhwRVzRfwIauAicaHxBStTOI/U4ChmKd8R+BFSUk495JqLioXy+
 Ni0qr6IqePqCtRtdno6JRedmqa0hNws=
Date: Thu, 21 Mar 2024 01:35:49 +0800
MIME-Version: 1.0
Subject: Re: [v5,08/13] drm/ast: Store AST device in struct ast_ddc
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240320093738.6341-9-tzimmermann@suse.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240320093738.6341-9-tzimmermann@suse.de>
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
> The DDC code needs the AST device. Store a pointer in struct ast_ddc
> and avoid internal upcasts. Improves type safety within the DDC code.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>


Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>

-- 
Best regards,
Sui

