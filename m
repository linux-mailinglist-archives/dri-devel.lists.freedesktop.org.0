Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D65233EFD9
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 12:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F4C89E35;
	Wed, 17 Mar 2021 11:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B66589E35
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 11:54:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9A7164F2A;
 Wed, 17 Mar 2021 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615982083;
 bh=GmQ75fNkKGyxDuMPQluIYApqwkIGssLIIUJlFc8URIY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=klF22XywXZ2p74BuS1cZYk4rx2lVXTSjaF4UPvdf0ZdDLHERXZmE3VUbgDFhgwNJM
 sqr3daV6+ZCq0pp6nayVGecVQ9oP3Ev3KK3EgvOOafkBWl7/JWzDD4CeJ1txqTZLS0
 drGFXYFy72N0i6WHCTgzOCoZJeCv1cXq1QZ+ZM6BgniNoGrnKKx2faHRJact0l2cnd
 hTd90NwD/0LfxJOjBJpIbl2EOCrEO7S3HtcHqaYF0P/Su3shLKEMl/NGVtfCTK565y
 itUMTsETJ2UOqOlTOy0+yC8O0ywXGW/sCznXy+yq7ftMdjS5TcsTP81cdaTOPUyPuj
 q35SZ15wOoKwA==
Subject: Re: [PATCH] omapdrm/dss/dsi.c:modify 'u32'->'int'
To: ChunyouTang <tangchunyou@163.com>
References: <20210317094852.424-1-tangchunyou@163.com>
From: Tomi Valkeinen <tomba@kernel.org>
Message-ID: <93f05e6c-21ad-5b4b-3406-14229ea4feef@kernel.org>
Date: Wed, 17 Mar 2021 13:54:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210317094852.424-1-tangchunyou@163.com>
Content-Language: en-US
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sebastian.reichel@collabora.com,
 laurent.pinchart@ideasonboard.com, tangchunyou@yulong.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 17/03/2021 11:48, ChunyouTang wrote:
> From: tangchunyou <tangchunyou@yulong.com>
> 
> 1.the type of mipi_dsi_create_packet id int
> 2.u32 can not < 0
> 
> Signed-off-by: tangchunyou <tangchunyou@yulong.com>
> ---
>   drivers/gpu/drm/omapdrm/dss/dsi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 8e11612..11c502d 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -2149,7 +2149,7 @@ static int dsi_vc_send_short(struct dsi_data *dsi, int vc,
>   			     const struct mipi_dsi_msg *msg)
>   {
>   	struct mipi_dsi_packet pkt;
> -	u32 r;
> +	int r;
>   
>   	r = mipi_dsi_create_packet(&pkt, msg);
>   	if (r < 0)
> 

I have already applies a similar patch "drm/omap: dsi: fix unsigned 
expression compared with zero".

  Tomi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
