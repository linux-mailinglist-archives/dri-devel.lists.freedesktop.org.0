Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3111633F72F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 18:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1356D6E198;
	Wed, 17 Mar 2021 17:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1234::107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3ED6E198
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 17:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=M1xeYmGKBJ6jj7ewaYpCNZMnUhqNoOaDnwmcpBB6Ipw=; b=eitn96kY7ksBTtF2NO8KNdOf65
 WmGjefSOr0x1ADE2l28kKACyXUPBJevfltnkJ36x99d74ggXuSqp+doZYpkGXQWjNwWMrTF8n3jrP
 eFntoWG8X8xNiQ8Bq9q0vq4NQlrWf29SMLUoKyqBYxq6bLGYbQUEfie3QPmOxl0sHBUUUnB6VpkEd
 5XSm8luLy5V43JVoJ+axOwM3Do0NKb7YuGluwnCppP7ziU0qlqgCEKctngZgKohVuDCVAdCYMO1zT
 w25BxMPRusIuB1Xh1HYcRBAtv2SIfskyI4lmFr4JtubN4F2peUM7cGDSLMkaSH6OIgsNO2GWcuB//
 JU4nI5oQ==;
Received: from [2601:1c0:6280:3f0::9757]
 by merlin.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMa69-001fXK-2i; Wed, 17 Mar 2021 17:36:45 +0000
Subject: Re: [PATCH] gpu: drm: Rudimentary typo fix in the file drm_drv.c
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20210317085210.3788782-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2296de34-e9d3-e520-34df-db6f520762ef@infradead.org>
Date: Wed, 17 Mar 2021 10:36:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317085210.3788782-1-unixbhaskar@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/17/21 1:52 AM, Bhaskar Chowdhury wrote:
> 
> s/refence-count/reference-count/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/gpu/drm/drm_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 20d22e41d7ce..2bfc724e8e41 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -203,7 +203,7 @@ static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
> 
>  /*
>   * Looks up the given minor-ID and returns the respective DRM-minor object. The
> - * refence-count of the underlying device is increased so you must release this
> + * reference-count of the underlying device is increased so you must release this
>   * object with drm_minor_release().
>   *
>   * As long as you hold this minor, it is guaranteed that the object and the
> --


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
