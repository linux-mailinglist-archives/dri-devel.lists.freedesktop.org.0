Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8594E4DC4CD
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 12:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB4A10EB0C;
	Thu, 17 Mar 2022 11:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216E710EB0C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 11:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647516284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S4VprwGw6dYDLbDGYJbvBp7kiHOiEm3c/qxk/CMwxqE=;
 b=Jj5Ow0UuEU45gjaVVxbOX6qP4XioJNJJpCdTwhBw1HEyidzSZZ2nhJmwZZiSEjZMVzxBwZ
 PXHK3+IwVoWOnLN4X48xfELconswOJXJVmOqEIXUAPTUU7zDoCIvU5Mk+peUkvA4QkRu63
 vDwq0SMRHYIBkvbbyj4FAbKj82jcjAU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-hdIfl8hJP8-6XytQ7liFkg-1; Thu, 17 Mar 2022 07:24:43 -0400
X-MC-Unique: hdIfl8hJP8-6XytQ7liFkg-1
Received: by mail-wr1-f72.google.com with SMTP id
 x15-20020a5d6b4f000000b001ee6c0aa287so1447784wrw.9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 04:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S4VprwGw6dYDLbDGYJbvBp7kiHOiEm3c/qxk/CMwxqE=;
 b=3CxEei+9mUL+guz3Mz/fitVEU3A0VlEswaRmrdwsWZYgp9pope53QpKOVybq8TL58P
 E/aubb+WifanejysDJramhbIixOtHD62+WgnCsxIW0jOvKG/HxEJHbt1M1TNTCZPeD3K
 23QrgRJYebm0z75FaF21lpW8ndY9KVnUg9nDGEsHV57oPT8jHZafYLOB4WgnnOlI5zLW
 MdRDNoh787I1e/Yjx89NpjF7a+hZAKt/mkKx2RVXNQane3dlw+3yJlYFwHKCtuiHPY8u
 vbpZX33ZrczklIbeEe60wQjBgl6yagXMUJ9Tizbpu7ppSemoE9ksM2UNh9AGiOBgDOlm
 9gSg==
X-Gm-Message-State: AOAM532QNi89lR0etmXkcaCcCadHkc1LIbdHu5+zCx3DcRa3x1tV98+7
 nVh0cqKDEHLJUcugBfFh+L78yGqkqnWX/GWw8Umz5Qp0Tc0Gf7YqReotb4+tX66oKehKYxgct3u
 WgySV372w9N6cqPf7i1GcgtFZ4JpJ
X-Received: by 2002:adf:db4b:0:b0:203:e76f:fc45 with SMTP id
 f11-20020adfdb4b000000b00203e76ffc45mr3006194wrj.549.1647516281816; 
 Thu, 17 Mar 2022 04:24:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOnU89ml+JaUcjGLfEaRj6DaQa6v2k32g/K6zymxVfaTNS+J88razRZqhQ3phLwUFbxXGjAA==
X-Received: by 2002:adf:db4b:0:b0:203:e76f:fc45 with SMTP id
 f11-20020adfdb4b000000b00203e76ffc45mr3006175wrj.549.1647516281539; 
 Thu, 17 Mar 2022 04:24:41 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a05600c4ecd00b0038a0165f2fbsm4650406wmq.17.2022.03.17.04.24.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 04:24:41 -0700 (PDT)
Message-ID: <a84b3c59-7458-78a4-4909-0424cd76af3a@redhat.com>
Date: Thu, 17 Mar 2022 12:24:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] fbdev: defio: fix the pagelist corruption
To: Chuansheng Liu <chuansheng.liu@intel.com>, jayalk@intworks.biz,
 daniel@ffwll.ch, deller@gmx.de
References: <20220317054602.28846-1-chuansheng.liu@intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220317054602.28846-1-chuansheng.liu@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Chuansheng,

On 3/17/22 06:46, Chuansheng Liu wrote:
> Easily hit the below list corruption:
> ==
> list_add corruption. prev->next should be next (ffffffffc0ceb090), but
> was ffffec604507edc8. (prev=ffffec604507edc8).
> WARNING: CPU: 65 PID: 3959 at lib/list_debug.c:26
> __list_add_valid+0x53/0x80
> CPU: 65 PID: 3959 Comm: fbdev Tainted: G     U
> RIP: 0010:__list_add_valid+0x53/0x80
> Call Trace:
>  <TASK>
>  fb_deferred_io_mkwrite+0xea/0x150
>  do_page_mkwrite+0x57/0xc0
>  do_wp_page+0x278/0x2f0
>  __handle_mm_fault+0xdc2/0x1590
>  handle_mm_fault+0xdd/0x2c0
>  do_user_addr_fault+0x1d3/0x650
>  exc_page_fault+0x77/0x180
>  ? asm_exc_page_fault+0x8/0x30
>  asm_exc_page_fault+0x1e/0x30
> RIP: 0033:0x7fd98fc8fad1
> ==
> 
> Figure out the race happens when one process is adding &page->lru into
> the pagelist tail in fb_deferred_io_mkwrite(), another process is
> re-initializing the same &page->lru in fb_deferred_io_fault(), which is
> not protected by the lock.
> 
> This fix is to init all the page lists one time during initialization,
> it not only fixes the list corruption, but also avoids INIT_LIST_HEAD()
> redundantly.
> 
> Fixes: 105a940416fc ("fbdev/defio: Early-out if page is already
> enlisted")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
> ---

This makes sense to me. If you address Geert comment and post a v2,
feel free to add:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

