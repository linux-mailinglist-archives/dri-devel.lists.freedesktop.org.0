Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 000375207ED
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 00:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02AFC10F3C2;
	Mon,  9 May 2022 22:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB54A10F389
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 22:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652136124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lgjdKnpaIuGtppXgqKDwYWP8kflvIPNtb2psK65xSsU=;
 b=iBFtnj9CdYq0q33GNBXhW1rdFfmmSbBpmTcS4lcgR97oIkquk6VlwTb+sFwK7fjfTjjF3E
 cmeJ9g1wVIIiqawwiPbe1SpWkdGXtT+tPO1rYbX5hznmkrQwJftR+KhaBWKxH0H4Op7qns
 LlFNZbqzqIQ8aUBvzsoONC2z12ixGAE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-VfdKzgpCOyqnLzB0XC6-7g-1; Mon, 09 May 2022 18:42:03 -0400
X-MC-Unique: VfdKzgpCOyqnLzB0XC6-7g-1
Received: by mail-wm1-f72.google.com with SMTP id
 k35-20020a05600c1ca300b003946a9764baso314040wms.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 15:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lgjdKnpaIuGtppXgqKDwYWP8kflvIPNtb2psK65xSsU=;
 b=zz3xFzeTC5MIGY0XKilBmbaUIrVI0Xm+9/jHFsJ2yWybsuZSlhN4MFSQCb/nzBWmVz
 Rsq+tIGj6SJLdTY4fmTseSERwQj+c7bma2QY3c1vYoUYpht64XY/0XY28u7L3i5vUXxl
 ON+wrXyW4A4PCi4Xx8F3VmLNKMjpQg5qQVpfw7VqWNXBWxeWS8GRd9WA1UpF04YxjQ+u
 +9aqK4xMdMSSC49aK3TZ+UDk0hseMFfbMxfQQPYSm94Fwa88jF3EOh2WNXqiQOfZyxK4
 nZoeWl9BMcb6VEPrqrz+uvvJTq1mzQZv2bTJZJ3ETcY7sH5N0TrCYjnCo+CBHvT8cbVH
 S6RQ==
X-Gm-Message-State: AOAM5313E9Of8b1rDXXjK3i4lr7PqWRSawh+zZMH0iMplrAVfitt6akq
 YRifW8pahwggSo9a25UzRW9HXQ4iyMZaf4B848ENsAW1NjozQz+aA/sNMwAao7+bHdiaR4UqtZ/
 mZ7mApk/IYA4CKKYZECmdMtyqy+SZ
X-Received: by 2002:a05:600c:354f:b0:394:6103:1f20 with SMTP id
 i15-20020a05600c354f00b0039461031f20mr24992874wmq.142.1652136122392; 
 Mon, 09 May 2022 15:42:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzVIwDY4oEfn5LRl5GWcfdV/H9LL3x4qAc/qBtEEHTssOX5nhYDfMqtzkeMfXiYM1aqTnsPA==
X-Received: by 2002:a05:600c:354f:b0:394:6103:1f20 with SMTP id
 i15-20020a05600c354f00b0039461031f20mr24992855wmq.142.1652136122132; 
 Mon, 09 May 2022 15:42:02 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h3-20020a5d6883000000b0020c5253d91asm12098734wru.102.2022.05.09.15.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 15:42:01 -0700 (PDT)
Message-ID: <1c36d431-d5c0-7278-c9e0-61867e9dc174@redhat.com>
Date: Tue, 10 May 2022 00:42:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220413.365977-1-javierm@redhat.com>
 <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
 <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
 <a339df59-9e00-c7cb-e33d-2ac626443639@intel.com>
 <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>
 <b5ab1c49-04e7-36c3-677d-2989b79e50ca@suse.de>
 <2bf27b09-0896-1849-254f-d5b19abdc892@redhat.com>
 <fc3e8a40-664f-07ae-7474-c0412a1ab1b5@intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <fc3e8a40-664f-07ae-7474-c0412a1ab1b5@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/10/22 00:22, Andrzej Hajda wrote:

[snip]

>>   static void drm_fbdev_fb_destroy(struct fb_info *info)
>>   {
>> +       if (info->cmap.len)
>> +               fb_dealloc_cmap(&info->cmap);
>> +
>>          drm_fbdev_release(info->par);
>> +       framebuffer_release(info);
> 
> I would put drm_fbdev_release at the beginning - it cancels workers 
> which could expect cmap to be still valid.
> 

Indeed, you are correct again. [0] is the final version of the patch I've
but don't have an i915 test machine to give it a try. I'll test tomorrow
on my test systems to verify that it doesn't cause any regressions since
with other DRM drivers.

I think that besides this patch, drivers shouldn't need to call to the
drm_fb_helper_fini() function directly. Since that would be called during
drm_fbdev_fb_destroy() anyways.

We should probably remove that call in all drivers and make this helper
function static and just private to drm_fb_helper functions.

Or am I missing something here ?

[0]:
From 5170cafcf2936da8f1c53231e3baa7d7a2b16c61 Mon Sep 17 00:00:00 2001
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Tue May 10 00:39:55 2022 +0200
Subject: [RFT PATCH] drm/fb-helper: Don't deallocate fb colormap and free fb info
 too early

Currently these are done in drm_fb_helper_fini() but this helper is called
by drivers in their .remove callback, which could lead to a use-after-free
if a process has opened the emulated fbdev node while a driver is removed.

For example, in i915 driver the call chain during remove is the following:

struct pci_driver i915_pci_driver = {
...
        .remove = i915_pci_remove,
...
};

i915_pci_remove
  i915_driver_remove
    intel_modeset_driver_remove_noirq
      intel_fbdev_fini
        intel_fbdev_destroy
          drm_fb_helper_fini
            framebuffer_release

Later the process will close the fbdev node file descriptor leading to the
mentioned use-after-free bug in drm_fbdev_fb_destroy(), due the following:

drm_fbdev_fb_destroy
  drm_fbdev_release(info->par); <-- info was already freed on .remove

To prevent that, let's move the framebuffer_release() call to the end of
the drm_fbdev_fb_destroy() function.

Also, the call to fb_dealloc_cmap() in drm_fb_helper_fini() is too early
and is more correct to do it in drm_fbdev_fb_destroy() as well. After a
call to drm_fbdev_release() has been made.

Reported-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d265a73313c9..7288fbd26bcc 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -627,12 +627,6 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 	cancel_work_sync(&fb_helper->resume_work);
 	cancel_work_sync(&fb_helper->damage_work);
 
-	info = fb_helper->fbdev;
-	if (info) {
-		if (info->cmap.len)
-			fb_dealloc_cmap(&info->cmap);
-		framebuffer_release(info);
-	}
 	fb_helper->fbdev = NULL;
 
 	mutex_lock(&kernel_fb_helper_lock);
@@ -2112,6 +2106,9 @@ static void drm_fbdev_release(struct drm_fb_helper *fb_helper)
 static void drm_fbdev_fb_destroy(struct fb_info *info)
 {
 	drm_fbdev_release(info->par);
+	if (info->cmap.len)
+		fb_dealloc_cmap(&info->cmap);
+	framebuffer_release(info);
 }
 
 static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
-- 
2.35.1

