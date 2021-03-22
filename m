Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B84344FF5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 20:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACEF06E5A3;
	Mon, 22 Mar 2021 19:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFAC6E5A3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 19:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=IX+l4b0PycGUaEzwE8452F1AGQg/n7mMU9I92wynpJY=; b=j2h2a9InCwhOa6GtayYJOF0BXP
 3enh0qjN4qsbQbGLRcr8WQL1AHTa6oHpFGf0oOraiZ7IYpj6zs+m2JcdBx/ezEyUklCQtbqAIEv4/
 Lzmzv/CMMK0SwvUmXgFWLK/03mlSMAQo80xKPqCdhnmd0Vw+xsqdOUPaik0+7Y0TKTqe1mIDSEBJP
 5fhknSorsrR7K/Y9nT6pcmYUh8G3kHVY3SSFewIAEigyR+URYnZXbDa+mqiMNlAydnrbgAuvJ3/b5
 NMr/oKFgRRS7ic+ouUP+tGgt481gOPfdGAIZI/mCrEQF5uswlvCrwBBmszh4d3ci6AowbfCA3FUNA
 JlMN0lpg==;
Received: from [2601:1c0:6280:3f0::3ba4]
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lOQLW-00CROz-2X; Mon, 22 Mar 2021 19:36:14 +0000
Subject: Re: [PATCH] video: mmp: Few typo fixes
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210322130210.3641181-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <30241dd5-dfd5-ec67-569b-1552bef58e95@infradead.org>
Date: Mon, 22 Mar 2021 12:36:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210322130210.3641181-1-unixbhaskar@gmail.com>
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

On 3/22/21 6:02 AM, Bhaskar Chowdhury wrote:
> 
> s/configed/configured/
> s/registed/registered/
> s/defintions/definitions/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  include/video/mmp_disp.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/video/mmp_disp.h b/include/video/mmp_disp.h
> index 77252cb46361..ea8b4331b7a1 100644
> --- a/include/video/mmp_disp.h
> +++ b/include/video/mmp_disp.h
> @@ -172,7 +172,7 @@ struct mmp_panel {
>  	/* use node to register to list */
>  	struct list_head node;
>  	const char *name;
> -	/* path name used to connect to proper path configed */
> +	/* path name used to connect to proper path configured */
>  	const char *plat_path_name;
>  	struct device *dev;
>  	int panel_type;
> @@ -291,7 +291,7 @@ static inline int mmp_overlay_set_addr(struct mmp_overlay *overlay,
>   * it defined a common interface that plat driver need to implement
>   */
>  struct mmp_path_info {
> -	/* driver data, set when registed*/
> +	/* driver data, set when registered*/
>  	const char *name;
>  	struct device *dev;
>  	int id;
> @@ -309,7 +309,7 @@ extern void mmp_unregister_path(struct mmp_path *path);
>  extern void mmp_register_panel(struct mmp_panel *panel);
>  extern void mmp_unregister_panel(struct mmp_panel *panel);
> 
> -/* defintions for platform data */
> +/* definitions for platform data */
>  /* interface for buffer driver */
>  struct mmp_buffer_driver_mach_info {
>  	const char	*name;
> --


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
