Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5476F03E3
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 12:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF3510EB16;
	Thu, 27 Apr 2023 10:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D98810EB14
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 10:02:22 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-94ea38c90ccso243393466b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 03:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1682589740; x=1685181740;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bJVyqAiPJFIH4B69B7zTHbUFAX5S4q78Rmei58VUrjU=;
 b=fJBsHOqRC3MJMdP0vJKBBhSxTPPmxO//qwHXgIs31npi7DSfPdMWMizgQGN5kwZp4K
 sqzH3AsckMvZ8yxmEWT7O+5i0EbDDS2eGOS0xf5FxjU0z0NQ6bg+TdddzfnLXo+SMP6r
 U3XehI0ecdISRbco+tTevyzoG79BJAbT5kaSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682589740; x=1685181740;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bJVyqAiPJFIH4B69B7zTHbUFAX5S4q78Rmei58VUrjU=;
 b=E8uxwn5eSLjiQ7N8WWutZezTcOeeJEKb3i9mKhdpE8BIrYnm1ucLTVkgqA2ajCYSS2
 n5TA7X/oAWxTXRXzdSmzjWqPqFEAwIS2Bwx0JvPRfNjxDVpwLhTYTk6PZdWkylCsZeu2
 4N9fQdyJIHOOW9QUhwWiil2+FcEhk2giMbdvFG00x/GNU1F8ve5XhXlrdys0xbbb7Wle
 i/zghLlsIGBA9jQbeGyvRH5e17QlFHZxGy6vAQX5N0gq+aJzdhyMjZSiUHoMfvfiDJIN
 sluRCuxU8KYK/t8gPw5MtdoCXlpxRUONe7/9CP4P+vVZ6gxv1AbYaZULWELZLg2YRUcs
 xmzA==
X-Gm-Message-State: AC+VfDz+mMqAlSdk7BIC2Er+kgVLPbRnZXTW/74tjPnOmftpLOidxyRs
 jrT0w0M0pnNi1QeCaD1cLMlToA==
X-Google-Smtp-Source: ACHHUZ4wfGT2gLA45fUr7HIjr4IylkVyooZJqhuDIxtNF9qwYuZSxEhterCXPEAdZr7W0KuC+RnLWg==
X-Received: by 2002:a17:906:5352:b0:957:2c89:687c with SMTP id
 j18-20020a170906535200b009572c89687cmr874787ejo.6.1682589740415; 
 Thu, 27 Apr 2023 03:02:20 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 c15-20020a170906924f00b0094f507aa0e9sm9532686ejx.19.2023.04.27.03.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 03:02:19 -0700 (PDT)
Date: Thu, 27 Apr 2023 12:02:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Brandon Pollack <brpol@chromium.org>
Subject: Re: [PATCH] Documentation: vkms: clarify devres managed refernce
 cleanup
Message-ID: <ZEpIKnDwy/XNEnfY@phenom.ffwll.local>
References: <20230425080240.3582324-1-brpol@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425080240.3582324-1-brpol@chromium.org>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: tzimmermann@suse.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 25, 2023 at 08:02:40AM +0000, Brandon Pollack wrote:
> added documentation to drm_dev_unregister clarifying that devres managed
> devices allocated with devm_drm_dev_alloc do not require calls to
> drm_dev_put.
> 
> Signed-off-by: Brandon Pollack <brpol@chromium.org>
> 
> ---
> 
> This is my first patch to any tree.  I've tried my best to read as many
> kernel docs etc as possible (wip). This took me a moment to realize so I
> figured it was as good a candidate as any for a first patch (at the very
> least to make sure I have the whole patching process figured out).  I
> hope to make more janitorial changes as I continue to learn leading up
> to the work I hope to do.
> 
> We're hoping to add multiple display hotplug output support to VKMS for
> testing purposes.  Some work has been done already, but we'll be taking
> over moving forward.  Our intent is to remain involved and assist in
> maintaining these changes.
> 
> Looking forward to your comments/advice (now and henceforth!)

Looking good!

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Since you're @chromium.org I'm assuming that one of the cros committers
will push this to drm-misc-next. If not please holler.
-Daniel

> ---
>  drivers/gpu/drm/drm_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index cee0cc522ed9..12687dd9e1ac 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -969,7 +969,9 @@ EXPORT_SYMBOL(drm_dev_register);
>   *
>   * Unregister the DRM device from the system. This does the reverse of
>   * drm_dev_register() but does not deallocate the device. The caller must call
> - * drm_dev_put() to drop their final reference.
> + * drm_dev_put() to drop their final reference, unless it is managed with devres
> + * (as devices allocated with devm_drm_dev_alloc() are), in which case there is
> + * already an unwind action registered.
>   *
>   * A special form of unregistering for hotpluggable devices is drm_dev_unplug(),
>   * which can be called while there are still open users of @dev.
> -- 
> 2.40.0.634.g4ca3ef3211-goog
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
