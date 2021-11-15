Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EBA44FF3B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 08:31:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705DB6E43C;
	Mon, 15 Nov 2021 07:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0124.hostedemail.com
 [216.40.44.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C1F6E439
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 07:31:38 +0000 (UTC)
Received: from omf02.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 50F488384376;
 Mon, 15 Nov 2021 07:31:37 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf02.hostedemail.com (Postfix) with ESMTPA id 07A75B000181; 
 Mon, 15 Nov 2021 07:31:33 +0000 (UTC)
Message-ID: <cfcae256344c5b83398944d5609e76d983ccbc1b.camel@perches.com>
Subject: Re: [PATCH] drm/amd/amdgpu: remove useless break after return
From: Joe Perches <joe@perches.com>
To: Bernard Zhao <bernard@vivo.com>, Alex Deucher
 <alexander.deucher@amd.com>,  Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Thomas
 Zimmermann <tzimmermann@suse.de>, Evan Quan <evan.quan@amd.com>, Sakari
 Ailus <sakari.ailus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Sun, 14 Nov 2021 23:31:34 -0800
In-Reply-To: <20211115071429.7314-1-bernard@vivo.com>
References: <20211115071429.7314-1-bernard@vivo.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 07A75B000181
X-Stat-Signature: rxw7ub9mqfb8pxrhxqznk9h8sctub7mm
X-Spam-Status: No, score=0.10
X-Rspamd-Server: rspamout02
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/BMX1pM41Hx9u3dc67UGKg+oEXxIeNQNY=
X-HE-Tag: 1636961493-426773
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

On Sun, 2021-11-14 at 23:14 -0800, Bernard Zhao wrote:
> This change is to remove useless break after return.
[]
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
[]
> @@ -2092,22 +2092,18 @@ static int dce_v8_0_pick_dig_encoder(struct drm_encoder *encoder)
>  			return 1;
>  		else
>  			return 0;
> -		break;
>  	case ENCODER_OBJECT_ID_INTERNAL_UNIPHY1:
>  		if (dig->linkb)
>  			return 3;
>  		else
>  			return 2;
> -		break;
>  	case ENCODER_OBJECT_ID_INTERNAL_UNIPHY2:
>  		if (dig->linkb)
>  			return 5;
>  		else
>  			return 4;
> -		break;
>  	case ENCODER_OBJECT_ID_INTERNAL_UNIPHY3:
>  		return 6;
> -		break;
>  	default:
>  		DRM_ERROR("invalid encoder_id: 0x%x\n", amdgpu_encoder->encoder_id);
>  		return 0;

Perhaps rewrite to make the sequential numbering more obvious.
---
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index b200b9e722d97..7307524b706b4 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -2088,26 +2088,13 @@ static int dce_v8_0_pick_dig_encoder(struct drm_encoder *encoder)
 
 	switch (amdgpu_encoder->encoder_id) {
 	case ENCODER_OBJECT_ID_INTERNAL_UNIPHY:
-		if (dig->linkb)
-			return 1;
-		else
-			return 0;
-		break;
+		return !dig->linkb ? 0 : 1;
 	case ENCODER_OBJECT_ID_INTERNAL_UNIPHY1:
-		if (dig->linkb)
-			return 3;
-		else
-			return 2;
-		break;
+		return !dig->linkb ? 2 : 3;
 	case ENCODER_OBJECT_ID_INTERNAL_UNIPHY2:
-		if (dig->linkb)
-			return 5;
-		else
-			return 4;
-		break;
+		return !dig->linkb ? 4 : 5;
 	case ENCODER_OBJECT_ID_INTERNAL_UNIPHY3:
 		return 6;
-		break;
 	default:
 		DRM_ERROR("invalid encoder_id: 0x%x\n", amdgpu_encoder->encoder_id);
 		return 0;


