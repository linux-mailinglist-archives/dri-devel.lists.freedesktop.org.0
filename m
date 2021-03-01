Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D658C327A8D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 10:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC356E508;
	Mon,  1 Mar 2021 09:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE0F6E508
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 09:16:38 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id m1so13705274wml.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 01:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=BDZK3/Jecgbl6c72+BPODYFw86hxqlmJoWNM2d07L7Y=;
 b=Rz8I0GIzG042rZP2WgTjrTtpiq0U16qby1TWqVuM60+7lnV8bePMxqjIUoHfGaO8aU
 mhv79AsdRE6CRAlev7XrABetEDuP3EvcpUXud2XU3bQMCjHGTZi3wNG9ICWMvkOzmjAi
 jyWSdlmE7WbT3ksd77SHKhoZlUTlhuvuZOzZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=BDZK3/Jecgbl6c72+BPODYFw86hxqlmJoWNM2d07L7Y=;
 b=Tcy/5PUUoczyjXEBcSYXrTmkE4qrVkUq9ixairK4eNwaus8wNFvlhQiaIJUenj2xTx
 IhBlKAWYbDuqhKFyJO5ng8PwOPNO3XjltxwTgS+1Yg0Nmyhs9S9qgzlm6sEa9l/7u3X6
 mDNiK9KmXD8nYE5Ejs5MX927z9y5LlfIxcBdoOENRIcfTgcJhsUkG0jud4J8ihQMRryj
 uc5p9RJMozBVm0EQx0g+sAnAGNOpWfs5EOJL9KnfRjYRM0Mpec8Wb/Byf7xV+Fh649M1
 obH7h4XiFtzCp1v0WHdZMfgt7Oqvz93m2cDcuzNeAtEgY9BDm2T+NVVfbCsvr8MSdwcb
 vqaA==
X-Gm-Message-State: AOAM531dYmwrPsBG4g+RW0CMwHYgHpiUfFXKgrv3WDk+bhnnpKjhCSBe
 T6wqpZDeWzX1feNu6MuFy6rqCA==
X-Google-Smtp-Source: ABdhPJwPJdwI7s/qwnxVsg+l4wa8VRMCHlsOE0EJJlsqKHv5LAs9S/Q2QcEg9ul4uhhEMEihWEmLgA==
X-Received: by 2002:a05:600c:6d4:: with SMTP id
 b20mr5639876wmn.142.1614590196937; 
 Mon, 01 Mar 2021 01:16:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s124sm20885503wms.40.2021.03.01.01.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 01:16:36 -0800 (PST)
Date: Mon, 1 Mar 2021 10:16:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] drm: make drm_send_event_helper static
Message-ID: <YDyw8pmfBpDLP+gU@phenom.ffwll.local>
Mail-Followup-To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1614586790-130683-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1614586790-130683-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 01, 2021 at 04:19:50PM +0800, Jiapeng Chong wrote:
> Fix the following sparse warning:
> 
> drivers/gpu/drm/drm_file.c:789:6: warning: symbol
> 'drm_send_event_helper' was not declared. Should it be static?
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/drm_file.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 7efbccf..23d8ad4 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -786,8 +786,8 @@ void drm_event_cancel_free(struct drm_device *dev,
>   * The timestamp variant of dma_fence_signal is used when the caller
>   * sends a valid timestamp.
>   */
> -void drm_send_event_helper(struct drm_device *dev,
> -			   struct drm_pending_event *e, ktime_t timestamp)
> +static void drm_send_event_helper(struct drm_device *dev, struct drm_pending_event *e,
> +				   ktime_t timestamp)

For static inline functions we also remove the kerneldoc, there's not
really anything important in there. Can you pls do that and respin your
patch?

Thanks, Daniel

>  {
>  	assert_spin_locked(&dev->event_lock);
>  
> -- 
> 1.8.3.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
