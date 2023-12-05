Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FE4805CAD
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 18:58:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53BB10E5E2;
	Tue,  5 Dec 2023 17:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC0910E5E9
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 17:58:45 +0000 (UTC)
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2DFF5660715D;
 Tue,  5 Dec 2023 17:58:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701799123;
 bh=4K1nG0XcLJCaqmXjT00pOtA2M+BKj18KQH6LnXZWdi4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kNeoQvdoOS3DwcND2QZyfuEIZsgZyU5iZ15cm4yY/NVzUTn+Vl3WFhBEyfMrRP+ll
 E/TlLTyM7BcYLGTRiNX/sN/0nh1S3MT0Ph/7eVCl96LVANv9h4wDH4qNcellEzTLsd
 LL2OTdZcCh3Lmz90qR8qOZBYlOJ2pdSwmi7czM69qCblgHSzrA6IHwcrHdGXi4buYM
 RD2ICfN+PGZbpeL0LnkmTMuwyZnS4ZA+a7ZLAQVroahHgUDxPecy7cLs8r5C/5PmcC
 RmwHlTNtC+b8kBViwPC25X9IstWWgGdHQceVBM5FBqn1K6c+SeMI6G7Gc0qcyE+NQw
 2fcz4jmWaOTHA==
Message-ID: <136041c8-bbc8-49b6-a3ff-7236e79afa5c@collabora.com>
Date: Tue, 5 Dec 2023 14:58:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/10] drm: ci: mediatek: Set IGT_FORCE_DRIVER for
 mt8173
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>, airlied@gmail.com,
 daniel@ffwll.ch
References: <20231129121841.253223-1-vignesh.raman@collabora.com>
 <20231129121841.253223-7-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231129121841.253223-7-vignesh.raman@collabora.com>
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
Cc: daniels@collabora.com, emma@anholt.net, gustavo.padovan@collabora.com,
 linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 david.heidelberg@collabora.com, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thanks for your patch.

On 29/11/2023 09:18, Vignesh Raman wrote:
> Expected driver for mt8173 is "mediatek" and for mt8183
> it is "panfrost". Set IGT_FORCE_DRIVER to 'mediatek' as
> the expected driver for mt8173.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v5:
>    - Added a new patch in the series to set IGT_FORCE_DRIVER to 'mediatek' for mt8173
> 
> v6:
>    - Use GPU_VERSION instead of CI_JOB_NAME to check if it is mt8173
> 
> ---
>   drivers/gpu/drm/ci/igt_runner.sh | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
> index c6cf963592c5..70a0f84021a1 100755
> --- a/drivers/gpu/drm/ci/igt_runner.sh
> +++ b/drivers/gpu/drm/ci/igt_runner.sh
> @@ -30,6 +30,10 @@ case "$DRIVER_NAME" in
>           ;;
>   esac
>   
> +if [ "$GPU_VERSION" = "mt8173" ]; then
> +    export IGT_FORCE_DRIVER=${DRIVER_NAME}
> +fi

Just a nit, could you add this in the first case statement? Just to 
avoid confusing about double assignment? -> but feel free to ignore this 
comment.

With or without this:

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> +
>   if [ -e "/install/xfails/$DRIVER_NAME-$GPU_VERSION-skips.txt" ]; then
>       IGT_SKIPS="--skips /install/xfails/$DRIVER_NAME-$GPU_VERSION-skips.txt"
>   fi
