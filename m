Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD477241485
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 03:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D87B89DF9;
	Tue, 11 Aug 2020 01:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936AA89DB8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 01:21:11 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Mon, 10 Aug 2020 18:21:09 -0700
Received: from [0.0.0.0] (oddjob.vmware.com [10.253.4.32])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 071E940A41;
 Mon, 10 Aug 2020 18:21:08 -0700 (PDT)
Subject: Re: [PATCH] drm/vmwgfx: fix spelling mistake "Cant" -> "Can't"
To: Colin King <colin.king@canonical.com>, VMware Graphics
 <linux-graphics-maintainer@vmware.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
References: <20200810100401.61209-1-colin.king@canonical.com>
From: Roland Scheidegger <sroland@vmware.com>
Message-ID: <d4859590-75fb-2d5b-a76c-58c4f6e799c3@vmware.com>
Date: Tue, 11 Aug 2020 03:21:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200810100401.61209-1-colin.king@canonical.com>
Content-Language: de-DE
Received-SPF: None (EX13-EDG-OU-002.vmware.com: sroland@vmware.com does not
 designate permitted sender hosts)
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks, I've put the fix in the vmwgfx-next branch.

Roland

Am 10.08.20 um 12:04 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a DRM_ERROR message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index bbce45d142aa..471836672312 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -186,7 +186,7 @@ void vmw_kms_cursor_snoop(struct vmw_surface *srf,
>  		/* TODO handle none page aligned offsets */
>  		/* TODO handle more dst & src != 0 */
>  		/* TODO handle more then one copy */
> -		DRM_ERROR("Cant snoop dma request for cursor!\n");
> +		DRM_ERROR("Can't snoop dma request for cursor!\n");
>  		DRM_ERROR("(%u, %u, %u) (%u, %u, %u) (%ux%ux%u) %u %u\n",
>  			  box->srcx, box->srcy, box->srcz,
>  			  box->x, box->y, box->z,
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
