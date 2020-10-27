Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 524B829A8A1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 11:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234A16EB59;
	Tue, 27 Oct 2020 10:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C92D6EB59
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 10:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603793053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wolut7a1c2zX7C+Xumd0b7oYYiNOd60jt9NVhVqZ7rs=;
 b=O12bbf040PUx7F7F9zlqAcfP+Y+ONMKDuF2NGoKnmAonAQCgZRKXVYV9H0r5k27NQJCKqo
 i9/xLQD0VZhCzNtCrBOxxP2EjEH3bwHGIne3yVQxtrKBhZWxikP0roTyS0J/CXLtwzudGj
 KOuqkBTwNb820byzb5qfTd9iPMTq0Ow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-V2zOweY_Oku_7mkWHoK9QQ-1; Tue, 27 Oct 2020 06:04:06 -0400
X-MC-Unique: V2zOweY_Oku_7mkWHoK9QQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C649564085;
 Tue, 27 Oct 2020 10:04:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D56DD5C1BB;
 Tue, 27 Oct 2020 10:04:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B769C9D0D; Tue, 27 Oct 2020 11:04:01 +0100 (CET)
Date: Tue, 27 Oct 2020 11:04:01 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v3 25/32] drm: kernel-doc: add description for a new
 function parameter
Message-ID: <20201027100401.j5zmjzk7jwwwq5cn@sirius.home.kraxel.org>
References: <cover.1603791716.git.mchehab+huawei@kernel.org>
 <9366f48e6e9c3ec2f31a3e68452a2b23a1089fce.1603791716.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9366f48e6e9c3ec2f31a3e68452a2b23a1089fce.1603791716.git.mchehab+huawei@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 10:51:29AM +0100, Mauro Carvalho Chehab wrote:
> As reported by "make htmldocs":
> 
> 	./drivers/gpu/drm/drm_prime.c:808: warning: Function parameter or member 'dev' not described in 'drm_prime_pages_to_sg'
> 
> Add a description for the new parameter.
> 
> Fixes: 707d561f77b5 ("drm: allow limiting the scatter list size.")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

> ---
>  drivers/gpu/drm/drm_prime.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index d6808f678db5..9f955f2010c2 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -794,6 +794,7 @@ static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
>  
>  /**
>   * drm_prime_pages_to_sg - converts a page array into an sg list
> + * @dev: DRM device
>   * @pages: pointer to the array of page pointers to convert
>   * @nr_pages: length of the page vector
>   *
> -- 
> 2.26.2
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
