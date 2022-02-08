Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE1B4AE531
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 00:06:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C964010E351;
	Tue,  8 Feb 2022 23:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5999610E351
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 23:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644361594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Hq44IoeTfJkZkwVY9Vl9iSJryds5VqEFOHSRWPT7XY=;
 b=QiUhzl8g5640Obe+GZgf0gNwBjbtgl8qFFwRmRNEgNQ6PeWIgE7zIavZ62MjPaOMc2b/aL
 tHnJE/6qy+uvgX8UwlXRTjGspIzauy2m2bXAflHuo8mImsdNyc3qgqbPcXu8Eik/5vH4Nz
 7lwHEdauqDWQUdfJ13FqmsRhDGdcv8w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-ioOVaqVuMqaVsqN9pdzCWQ-1; Tue, 08 Feb 2022 18:06:33 -0500
X-MC-Unique: ioOVaqVuMqaVsqN9pdzCWQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg16-20020a05600c3c9000b0034bea12c043so1725479wmb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 15:06:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9Hq44IoeTfJkZkwVY9Vl9iSJryds5VqEFOHSRWPT7XY=;
 b=Awtb77mNSLtz7tldMgqx1N96D5tsv+YIQRW6cHAZ0DcJhIEyM1fRB9R/9DjmWeWWon
 93tTy37lvfYk9yuVkhmDvjzZO+N4gzX7VzC8FfMf1h1sZzvZsj7Hbjl/jFdGy54cXgxZ
 xPMwZ6FpWTX/31hgvkdJHwuoMiT3+UvMMhsV3A9uAdjTfSrdozOzk8YvCXZhw4wmM+c3
 6cxTVh7NYsfLbt+svp3QlV0pWXVhpaDmcXmG0Ji7YXEMVz/PfHKrglxOHg3UhlsEjPSW
 7shmRUaLEwTIN0uY/EifT3X0x1uf5aM4Go5Rj/9zJH+MZDEP8ipdJyYrx7k9Fb3GRvwG
 k4sg==
X-Gm-Message-State: AOAM530hv2pFYft2FZz4uRFuE08rV6/PA6XBe7waB1qrN/ys4ybi5f4l
 ZNOP6Ez1d7clnQTlbVCHFIW47INFSY2wl/H3p7brHBmkSRc8J6yNGiwNIsVrpoDMB0VXC2JExLM
 VTMvWk0WiKBkgWKDuR/J/XVMgWc7h
X-Received: by 2002:a05:600c:1f06:: with SMTP id
 bd6mr188787wmb.98.1644361591938; 
 Tue, 08 Feb 2022 15:06:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmNuGMQwcN6QexrJL10FFKZYDdF5TN06r7ebrBGFi7sK9RD4aMR2dVzQHHgAbW45sC7ClvFg==
X-Received: by 2002:a05:600c:1f06:: with SMTP id
 bd6mr188768wmb.98.1644361591694; 
 Tue, 08 Feb 2022 15:06:31 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id l26sm2975339wmp.31.2022.02.08.15.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 15:06:31 -0800 (PST)
Message-ID: <4f5a94f9-404f-e803-1b61-41653c9de388@redhat.com>
Date: Wed, 9 Feb 2022 00:06:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 02/19] fbcon: Move fbcon_bmove(_rec) functions
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-3-daniel.vetter@ffwll.ch>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220208210824.2238981-3-daniel.vetter@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@intel.com>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/8/22 22:08, Daniel Vetter wrote:
> Avoids two forward declarations, and more importantly, matches what
> I've done in my fbcon scrolling restore patches - so I need this to
> avoid a bunch of conflicts in rebasing since we ended up merging
> Helge's series instead.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

