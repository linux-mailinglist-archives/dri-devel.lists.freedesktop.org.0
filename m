Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A731645D3F8
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 05:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB85F6E077;
	Thu, 25 Nov 2021 04:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16446E077
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 04:42:02 +0000 (UTC)
Received: from relay11.mail.gandi.net (unknown [217.70.178.231])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 11DAEC8C5E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 04:37:21 +0000 (UTC)
Received: (Authenticated sender: n@nfraprado.net)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id CAF8F100004;
 Thu, 25 Nov 2021 04:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nfraprado.net;
 s=gm1; t=1637815017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L8q64XXOFZpbTrNQRxS5rpEL7WQXoS6MIRJ43Rp/Dng=;
 b=oqOygH6Pimpjc3hLA6PAEws7GUdXIgFMBHJ9lVLL201dhM3qRx0vgN0iSbYCWhmtLhJdxx
 +hWgrUbzy8VcSzrACfvvq62v/879SL8itFgdTw3nI5f4JMGTlpQgcpp0nppAqa0VVQqOII
 0tTNyG0aeGbEFtWPYEK8Hh/IbMUNlZizoaTUYjqH8LN9P1nOKORiQ8SBNFayPC6PmFeoRr
 ORZQEogfF9MQlwi7zgKXbFa68Ju2a/kPnGKq3hiuXsfV5Pv6jdBjZu005TfE1tNT/chbvZ
 Uq/nlAQ7E0yhxswdWFbKHcw7cdtoSPvZh1NWSH6IeGfCNvpoxikASqdqeLe09w==
Date: Wed, 24 Nov 2021 23:36:49 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <n@nfraprado.net>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v3 1/9] drm: vkms: Replace the deprecated
 drm_mode_config_init
Message-ID: <20211125043649.io5aavusrfzb2e73@notapiano>
References: <20211122194400.30836-1-igormtorrente@gmail.com>
 <20211122194400.30836-2-igormtorrente@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211122194400.30836-2-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 leandro.ribeiro@collabora.com, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Igor,

just some nits on the commit message.

On Mon, Nov 22, 2021 at 04:43:52PM -0300, Igor Torrente wrote:
> The `drm_mode_config_init` was deprecated since c3b790e commit, and it's

When referring to other commits, it's best to write it as 'commit <12-digit-SHA>
("description")' [1]. Also, imperative mood works best, so my suggestion would
be:

`drm_mode_config_init` is deprecated since commit c3b790ea07a1 ("drm: Manage
drm_mode_config_init with drmm_") in favor of `drmm_mode_config_init`. Update
the former to the latter.

Thanks,
Nícolas

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

> being replaced by the `drmm_mode_config_init`.
> 
> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> ---
> V2: Change the code style(Thomas Zimmermann).
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 0ffe5f0e33f7..ee4d96dabe19 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -140,8 +140,12 @@ static const struct drm_mode_config_helper_funcs vkms_mode_config_helpers = {
>  static int vkms_modeset_init(struct vkms_device *vkmsdev)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
> +	int ret;
> +
> +	ret = drmm_mode_config_init(dev);
> +	if (ret < 0)
> +		return ret;
>  
> -	drm_mode_config_init(dev);
>  	dev->mode_config.funcs = &vkms_mode_funcs;
>  	dev->mode_config.min_width = XRES_MIN;
>  	dev->mode_config.min_height = YRES_MIN;
> -- 
> 2.30.2
> 
