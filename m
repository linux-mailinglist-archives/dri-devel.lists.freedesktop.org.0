Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2DF4AE5B3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 00:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C655310E405;
	Tue,  8 Feb 2022 23:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE9D10E405
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 23:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644364767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1B+HhoEdav6Cob3bPb/BF6nu8D/2OQMn0TX9fIjaHGQ=;
 b=ic2wNtBUam2bz3I4ll/IUk94uFAfcHQdZaWPQd7Hg+vh4iRcpSU//sYaSmkxWOpXWX8Dqf
 jJ7dLcG3zHG9eU3zRy9SURbxI+vMn7Ud03/0m+klpZoeBEFWgFVh6Px2etZcYHvuf8dK01
 lp69zuxLHkDb/xBdiBYGlXxCzxoJS08=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-9kru8jL3MpeA-EILUKn1iA-1; Tue, 08 Feb 2022 18:59:25 -0500
X-MC-Unique: 9kru8jL3MpeA-EILUKn1iA-1
Received: by mail-wr1-f69.google.com with SMTP id
 y10-20020adfc7ca000000b001e30ed3a496so293050wrg.15
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 15:59:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1B+HhoEdav6Cob3bPb/BF6nu8D/2OQMn0TX9fIjaHGQ=;
 b=14SyUeMInY5e8Db1Ll9EO7bDtcrFpL2ER+oJ4bzc7XpDyhAxdClJfMnELQusWUZsRv
 TFtU6smVuwF0/F2BzLgbV1XNjLBVxD/LzZzOJUr1ohcdgio9+dnN9S6Y9zOUxK1RAChO
 t8Wn8KvIYesMNhhC0XZdemA6FfY9DCWj2POifKMywyg8ubIf+Y6AicGjJ4vz9wsFQa3s
 dfrrpJv9v/QAY7XEFLFG/FIjgQZ8Xi6laocUjLADVE33DKdEnqGITAwF7+Lt1F0e96qc
 BlbKPbB6gFKf10Cecm+ee6GlyZN9UkVDstgsSWvnK08Q1S34v0NkDJB0KF2eIWTaP1hP
 tp8Q==
X-Gm-Message-State: AOAM531TzrVeNqigZjJGOyxsE/unjBT1sKGZaGd+gg569WEin344ShVn
 VEFgYvRDhauakr18fqAxlJzsa5HPA+38z4H/P68rV80+MEV3aQIUpx3J9b4jniqxsNiSyIRHIOG
 0FPIw1DtlPZ+woCgofp6sAFI7M+oN
X-Received: by 2002:a1c:4c19:: with SMTP id z25mr302715wmf.105.1644364764702; 
 Tue, 08 Feb 2022 15:59:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyxrdx5PAN39E9zDPgBt3t7VCZ+YkAG7VKuS1GxY71C3wn6MOzwm1KHjgao+aMLB+p3UZbTg==
X-Received: by 2002:a1c:4c19:: with SMTP id z25mr302707wmf.105.1644364764502; 
 Tue, 08 Feb 2022 15:59:24 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id l24sm3859205wms.24.2022.02.08.15.59.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 15:59:24 -0800 (PST)
Message-ID: <c58f7b96-8d8c-030e-9fd2-358e259127e4@redhat.com>
Date: Wed, 9 Feb 2022 00:59:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 06/19] fbcon: Use delayed work for cursor
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-7-daniel.vetter@ffwll.ch>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220208210824.2238981-7-daniel.vetter@ffwll.ch>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Claudio Suarez <cssk@net-c.es>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Daniel,

On 2/8/22 22:08, Daniel Vetter wrote:
> Allows us to delete a bunch of hand-rolled stuff. Also to simplify the
> code we initialize the cursor_work completely when we allocate the
> fbcon_ops structure, instead of trying to cope with console
> re-initialization.
> 

Maybe also make it more explicit in the commit message that the delayed
work is replacing a timer that was used before for the cursor ?

> The motiviation here is that fbcon code stops using the fb_info.queue,

motivation

[snip]

>     /*
>      *    This is the interface between the low-level console driver and the
> @@ -68,7 +68,7 @@ struct fbcon_ops {
>  	int  (*update_start)(struct fb_info *info);
>  	int  (*rotate_font)(struct fb_info *info, struct vc_data *vc);
>  	struct fb_var_screeninfo var;  /* copy of the current fb_var_screeninfo */
> -	struct timer_list cursor_timer; /* Cursor timer */
> +	struct delayed_work cursor_work; /* Cursor timer */

A delayed_work uses a timer underneath but I wonder if the comment also
needs to be updated since technically isn't a timer anymore but deferred
work that gets re-scheduled each time on fb_flashcursor().

The patch looks good to me and makes the logic much simpler than before.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

