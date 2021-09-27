Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB2F4198C4
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 18:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BA889E38;
	Mon, 27 Sep 2021 16:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF6889F2A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 16:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=tVUt3TAV0cnSNDb1U3rYMT5oXqvjnjjFc0XzMOKFYYI=; b=gII3j0/LnQ57thWtaj4Qowv/MD
 XCcmnYumJ0AwHGR/BrEE5AQEzRmynfA6/MtavGCa8P5dEixsCzGvHo4DCpj1QNe8v2DRUrIxgZfwk
 0EqLs5V+N6bQfydb8Y0r05ZoNKn05irWXteoolS1TJxSZhMSFheYHgbyUo4d/rX6ToJrxT5H/hycV
 yDtR7SqjuHhjTafOwUilTlZAQZMRF4Owf0fLctcqPxR/IjMyiP4CqRFh24y2EX0Y2mvEm8Gjsu4kX
 wBeWMzhiPkSNpMXdtTmBF+Tya7Q0LUGe1JGltQULMohC/iaXbTgX/IQ+LaLSo3SE06YBm7NqsHHAP
 NihbyjSQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUtKm-003LWM-BC; Mon, 27 Sep 2021 16:18:28 +0000
Subject: Re: [PATCH] drm/edid: Fix drm_edid_encode_panel_id() kerneldoc warning
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20210927074104.1.Ibf22f2a0b75287a5d636c0570c11498648bf61c6@changeid>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <dce21497-0c59-db81-8720-2549661105e1@infradead.org>
Date: Mon, 27 Sep 2021 09:18:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210927074104.1.Ibf22f2a0b75287a5d636c0570c11498648bf61c6@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/27/21 7:41 AM, Douglas Anderson wrote:
> Due to a simple typo (apparently I can't count. It goes 0, 1, 2 and
> not 0, 2, 3) we were getting a kernel doc warning that looked like
> this:
> 
> include/drm/drm_edid.h:530: warning:
>    Function parameter or member 'vend_chr_1' not described in 'drm_edid_encode_panel_id'
> include/drm/drm_edid.h:530: warning:
>    Excess function parameter 'vend_chr_3' description in 'drm_edid_encode_panel_id'
> 
> Fix it.
> 
> Fixes: 7d1be0a09fa6 ("drm/edid: Fix EDID quirk compile error on older compilers")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> 
>   include/drm/drm_edid.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 4d17cd04fff7..18f6c700f6d0 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -511,8 +511,8 @@ static inline u8 drm_eld_get_conn_type(const uint8_t *eld)
>   /**
>    * drm_edid_encode_panel_id - Encode an ID for matching against drm_edid_get_panel_id()
>    * @vend_chr_0: First character of the vendor string.
> - * @vend_chr_2: Second character of the vendor string.
> - * @vend_chr_3: Third character of the vendor string.
> + * @vend_chr_1: Second character of the vendor string.
> + * @vend_chr_2: Third character of the vendor string.
>    * @product_id: The 16-bit product ID.
>    *
>    * This is a macro so that it can be calculated at compile time and used
> 


-- 
~Randy
