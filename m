Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 670385B385F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 14:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52D810E084;
	Fri,  9 Sep 2022 12:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B319910E084
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 12:59:09 +0000 (UTC)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14E21DD;
 Fri,  9 Sep 2022 14:59:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1662728348;
 bh=xFRSY8tVoameCWzacI7aRsh6R639BWApE28Feq41gbM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Bd0xFClhil6KZxVzPRmJc1X51xuvyUPf6rAshbJsJkcV2RZzPeuady8UPOEGDIJO1
 fM54hVUOcn9h8uMNhPwvVKAJuwUb29XQ2/2M0ABOQn2axv0syoch5qRplIEhd3m+Hh
 aIe4+TwTFrclWk6HhMaIxYLY07al0Updjn05HsP8=
Message-ID: <9c8ff7af-7456-0fa4-ea9d-0182472a18b1@ideasonboard.com>
Date: Fri, 9 Sep 2022 15:59:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/tidss: fix repeated words in comments
Content-Language: en-US
To: Jilin Yuan <yuanjilin@cdjrlc.com>, jyri.sarha@iki.fi, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220824130450.41703-1-yuanjilin@cdjrlc.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220824130450.41703-1-yuanjilin@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/08/2022 16:04, Jilin Yuan wrote:
>   Delete the redundant word 'to'.
> 
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
> ---
>   drivers/gpu/drm/tidss/tidss_kms.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
> index 666e527a0acf..7de3a5ffe5bc 100644
> --- a/drivers/gpu/drm/tidss/tidss_kms.c
> +++ b/drivers/gpu/drm/tidss/tidss_kms.c
> @@ -71,7 +71,7 @@ static int tidss_atomic_check(struct drm_device *ddev,
>   	 * changes. This is needed for updating the plane positions in
>   	 * tidss_crtc_position_planes() which is called from
>   	 * crtc_atomic_enable() and crtc_atomic_flush(). We have an
> -	 * extra flag to to mark x,y-position changes and together
> +	 * extra flag to mark x,y-position changes and together
>   	 * with zpos_changed the condition recognizes all the above
>   	 * cases.
>   	 */

Thanks, applying to drm-misc.

  Tomi
