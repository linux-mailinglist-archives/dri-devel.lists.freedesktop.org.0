Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C436685C36
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 01:35:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D9510E3AA;
	Wed,  1 Feb 2023 00:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF5710E3AA
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 00:35:03 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 6AB7732008FB;
 Tue, 31 Jan 2023 19:35:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 31 Jan 2023 19:35:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1675211701; x=
 1675298101; bh=6MWxM3NVBSIwoPIaF8/5p5q5VQs7dtC6/W4ECHYjNBc=; b=L
 YKyW5Bx87owntRJPge/GgvS0EjTilGbjxqN7ZNgM84sLDcP1x6CW3gcLhE0oNZGe
 PkMo9tDxZFk9Wov1/O92Ni/IYAHaamCZgdUcwKAQbk2cB4a5y/S23mcx2UqmEkOd
 CnV+JtxZKl301X4k/mzl0G1lnqoB8/0WRgfI38K5Dz7zvUbpgh5H7tF1ExQB/rUL
 TT2CuH8c5Iz0qT8MdL6I8yk7lOP8b8Gae9fD3IEltJvbI//4/Ov9tpTRqaycecta
 nG9doczDjkALHYmFq2IQKYws6l+03QrDVqsM1m03UnnjXQrPlcHhRJLvAysy0uMZ
 RWb3jaYqo/1aHzqPWpKnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1675211701; x=
 1675298101; bh=6MWxM3NVBSIwoPIaF8/5p5q5VQs7dtC6/W4ECHYjNBc=; b=b
 8DWnKdbz+te6QUHesrZ3rCPts6153lwvAwtIiBr2oqUipgl241H4hyQx7w0MGEqQ
 vUQCsDnAZReW7WsqfyiLz41zy8scUFUNmpcxd/I5cL1IfJo0fQuk9950OkmhRUJy
 9zifoP/0Q1rZdKkUOPZmFVh3jDAGwwkkoUgUNEkejNw7zQ6Z8PjeqUbfqBN5KMax
 do7lAgCdAE5omirwqDLGlCoeFwV8LMtCwkHdaQ1gsT4ldhsbgp9YDKVteZjVXhRc
 fAcdqHA8QLbL6stWihfpZ44cAYt98w9TFKKsh9lLq2o7/9PwTSJk6Q2voWCKwbpW
 QbD0YnLfr1sVW7tpQhRHg==
X-ME-Sender: <xms:tbPZY7_3s9ozch2ixRr7zqIwpb775o7rD_ejitgyk80w3XO9xqDQtw>
 <xme:tbPZY3syQB3X2p4aDXI6uUASE3jX1d7BDudyVKY5D2mRE4la-AEIhXFxLJjP2qM9r
 cvaN6E9mZou5vtkBQg>
X-ME-Received: <xmr:tbPZY5BYdEzji1praZZcb7EpiZvp22D20qkex_HdOixnLkRsiKiFRhTv9gAOUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefhedgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpedfmgdf
 ofgrrgiiucfoohhmsggrshgrfigrlhgrucdlggfofigrrhgvmddfuceomhgrrgiimhesfh
 grshhtmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpeetfffhgedvvdfguedtteeh
 ffejlefhgfdufeduueejvdevheevuefhtefhtdejffenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrggriihmsehfrghsthhmrghilhdrtgho
 mh
X-ME-Proxy: <xmx:tbPZY3eBvt78tUaFNB1OBrgF8-a55E0OoJasmiLB6qcjgTGY9fDNmA>
 <xmx:tbPZYwPOZcfWJ4KRhSS4XmoS2Mr7jj_eT6Z-E2QMwLf91X4L-KY7VA>
 <xmx:tbPZY5kFGmO3eI1xYtKV6y5ILS1hhtVWLvpQ1zRa5x3EoL_10VlOkg>
 <xmx:tbPZY1olmqshuDrQNoRnUhHhplXwImv50960Y4m8fSsZSlFVwNOLCQ>
Feedback-ID: i1b1946fb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Jan 2023 19:35:01 -0500 (EST)
Message-ID: <ab3706b1-9068-5105-8552-789fabda0057@fastmail.com>
Date: Tue, 31 Jan 2023 16:34:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/8] drm/vmwgfx: Rename dummy to is_iomem
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230131033542.953249-1-zack@kde.org>
 <20230131033542.953249-7-zack@kde.org>
From: "\"Maaz Mombasawala (VMware)" <maazm@fastmail.com>
In-Reply-To: <20230131033542.953249-7-zack@kde.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com, banackm@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/30/23 19:35, Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
> 
> Rename dummy to is_iomem because that's what it is even if we're not
> activelly using it. Makes the code easier to read.
> 
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index 1082218a1cfc..e83286e08837 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -153,9 +153,9 @@ static void vmw_cursor_update_mob(struct vmw_private *dev_priv,
>  	SVGAGBCursorHeader *header;
>  	SVGAGBAlphaCursorHeader *alpha_header;
>  	const u32 image_size = width * height * sizeof(*image);
> -	bool dummy;
> +	bool is_iomem;
>  
> -	header = ttm_kmap_obj_virtual(&vps->cursor.map, &dummy);
> +	header = ttm_kmap_obj_virtual(&vps->cursor.map, &is_iomem);
>  	alpha_header = &header->header.alphaHeader;
>  
>  	memset(header, 0, sizeof(*header));
> @@ -185,13 +185,13 @@ static u32 vmw_du_cursor_mob_size(u32 w, u32 h)
>   */
>  static u32 *vmw_du_cursor_plane_acquire_image(struct vmw_plane_state *vps)
>  {
> -	bool dummy;
> +	bool is_iomem;
>  	if (vps->surf) {
>  		if (vps->surf_mapped)
>  			return vmw_bo_map_and_cache(vps->surf->res.backup);
>  		return vps->surf->snooper.image;
>  	} else if (vps->bo)
> -		return ttm_kmap_obj_virtual(&vps->bo->map, &dummy);
> +		return ttm_kmap_obj_virtual(&vps->bo->map, &is_iomem);
>  	return NULL;
>  }
>  
> @@ -364,7 +364,7 @@ void vmw_kms_cursor_snoop(struct vmw_surface *srf,
>  	SVGA3dCopyBox *box;
>  	unsigned box_count;
>  	void *virtual;
> -	bool dummy;
> +	bool is_iomem;
>  	struct vmw_dma_cmd {
>  		SVGA3dCmdHeader header;
>  		SVGA3dCmdSurfaceDMA dma;
> @@ -424,7 +424,7 @@ void vmw_kms_cursor_snoop(struct vmw_surface *srf,
>  	if (unlikely(ret != 0))
>  		goto err_unreserve;
>  
> -	virtual = ttm_kmap_obj_virtual(&map, &dummy);
> +	virtual = ttm_kmap_obj_virtual(&map, &is_iomem);
>  
>  	if (box->w == VMW_CURSOR_SNOOP_WIDTH && cmd->dma.guest.pitch == image_pitch) {
>  		memcpy(srf->snooper.image, virtual,
> @@ -658,14 +658,14 @@ vmw_du_cursor_plane_cleanup_fb(struct drm_plane *plane,
>  {
>  	struct vmw_cursor_plane *vcp = vmw_plane_to_vcp(plane);
>  	struct vmw_plane_state *vps = vmw_plane_state_to_vps(old_state);
> -	bool dummy;
> +	bool is_iomem;
>  
>  	if (vps->surf_mapped) {
>  		vmw_bo_unmap(vps->surf->res.backup);
>  		vps->surf_mapped = false;
>  	}
>  
> -	if (vps->bo && ttm_kmap_obj_virtual(&vps->bo->map, &dummy)) {
> +	if (vps->bo && ttm_kmap_obj_virtual(&vps->bo->map, &is_iomem)) {
>  		const int ret = ttm_bo_reserve(&vps->bo->base, true, false, NULL);
>  
>  		if (likely(ret == 0)) {


LGTM!

Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
-- 
Maaz Mombasawala (VMware) <maazm@fastmail.com>

