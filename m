Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8160690823
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 13:03:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033B610E9D7;
	Thu,  9 Feb 2023 12:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC56C10EA9E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 12:03:46 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id by3so214202wrb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 04:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/OAVNRfT0kn1U1GElPiFXbROqTcwgwT4Vi5ad6qircE=;
 b=g0WCE9KYWwydd3B5LWswXpCmM4fzesW7Dr+26IhRpkAG5Yal5nY7pojl+HQ5tvVE4/
 hMsunkaDwP3/e6Kl9KQ3mtz9xdZO3uLpXtTUNH9oDx9zs2fsTAsNnzr2UPpKRguMy19p
 wlEi9In20o0VolmjJR1ZmigYFs9z8yjF9wnfc4t3+H7HJL25Pv7N8uiGoxfuxqydryBt
 0Uf8PzLMYzkz1Vnz5yWosBRVwoii3TLddrZjoe4tYPHKVmRj3tclPsUu2Yy0/kem7pOt
 taUve/UzXe1KR5CRLsSFNpmC5eZF2Pv3per7ViTHD53CnaCvrgsKl6uWJ5aHtqgbcW+Q
 M/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/OAVNRfT0kn1U1GElPiFXbROqTcwgwT4Vi5ad6qircE=;
 b=JRF1vczqIb4ObaOPalr8Y1agIMfAFwUfjye/zX8o2snC/42T8MgWqjb5HQILk5skjM
 HgRwASexTsm+qQQq05p4o0SnR6ok2uqVhXUhlEHs6h+mGkFGN6O7e8HRGwU68gtRcP9q
 0FooK4EF5qmeP8YbgD6w0VAcgi07OzCYrP14fdyRuP/oakusMylOTsrHl4NOD9KLekCC
 1BMPFtt4GKnGrZgskKBAbkN1jA3FxM3EasotAlebl1xV8ta9aX5ddByA8n+/HcNuXglM
 0xmnHBGZJ66qfsLbouZUnAdSTftMExHZeWlKGwLgEBuYslpPShG7v5ryhJLt/pvCJbem
 PsGQ==
X-Gm-Message-State: AO0yUKWFttjV6O83SxzE0k6AuxnzWlSZUvudXndVRgRQF/5N1ss0MckK
 Fo6qlaxuiWJlE1k2+yz65cg=
X-Google-Smtp-Source: AK7set9K5pwa/Ac+OOyBZ0AahcdKjQSqUmLqNyAdttcl7uYMFsFIhurobWcp4Ws7dBP6hw58c8mlIA==
X-Received: by 2002:adf:dd45:0:b0:2c4:760:5cb5 with SMTP id
 u5-20020adfdd45000000b002c407605cb5mr3906208wrm.8.1675944225180; 
 Thu, 09 Feb 2023 04:03:45 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 f5-20020adff445000000b002c53f5b13f9sm326268wrp.0.2023.02.09.04.03.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 04:03:44 -0800 (PST)
Message-ID: <42f3a187-9a7b-2506-0fda-5c0c52b79f24@gmail.com>
Date: Thu, 9 Feb 2023 13:03:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] drm/debugfs: split registration into dev and minor
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>, daniel.vetter@ffwll.ch, 
 wambui.karugax@gmail.com, maxime@cerno.tech, mwen@igalia.com,
 mairacanal@riseup.net
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230209081838.45273-3-christian.koenig@amd.com>
 <9cac40bd-ce7f-ec39-ed5b-25a7ba34bc02@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <9cac40bd-ce7f-ec39-ed5b-25a7ba34bc02@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.02.23 um 12:12 schrieb Maíra Canal:
> On 2/9/23 05:18, Christian König wrote:
>> The different subsystems should probably only register their debugfs
>> files once.
>>
>> This temporary removes the common files from the render node directory.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/drm_atomic.c        |  4 ++--
>>   drivers/gpu/drm/drm_client.c        |  4 ++--
>>   drivers/gpu/drm/drm_crtc_internal.h |  2 +-
>>   drivers/gpu/drm/drm_debugfs.c       | 24 ++++++++++++------------
>>   drivers/gpu/drm/drm_drv.c           |  4 +++-
>>   drivers/gpu/drm/drm_framebuffer.c   |  4 ++--
>>   drivers/gpu/drm/drm_internal.h      |  5 +++--
>>   include/drm/drm_client.h            |  2 +-
>>   8 files changed, 26 insertions(+), 23 deletions(-)
>>
>
> [...]
>
>> diff --git a/drivers/gpu/drm/drm_internal.h 
>> b/drivers/gpu/drm/drm_internal.h
>> index 332fb65a935a..5ff7bf88f162 100644
>> --- a/drivers/gpu/drm/drm_internal.h
>> +++ b/drivers/gpu/drm/drm_internal.h
>> @@ -185,7 +185,8 @@ int drm_gem_dumb_destroy(struct drm_file *file, 
>> struct drm_device *dev,
>>   #if defined(CONFIG_DEBUG_FS)
>>   int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>>                struct dentry *root);
>> -void drm_debugfs_register(struct drm_minor *minor);
>> +void drm_debugfs_dev_register(struct drm_device *dev);
>> +void drm_debugfs_minor_register(struct drm_minor *minor);
>
> For this patch and the previous one, I believe you need to add the 
> functions
> to the #else path as well, otherwise it won't compile for 
> CONFIG_DEBUG_FS=n.

Oh, good point. Going to fix this.

Thanks,
Christian.

>
> Best Regards,
> - Maíra Canal
>
>>   void drm_debugfs_cleanup(struct drm_minor *minor);
>>   void drm_debugfs_late_register(struct drm_device *dev);
>>   void drm_debugfs_connector_add(struct drm_connector *connector);
>> @@ -261,4 +262,4 @@ int drm_syncobj_query_ioctl(struct drm_device 
>> *dev, void *data,
>>   /* drm_framebuffer.c */
>>   void drm_framebuffer_print_info(struct drm_printer *p, unsigned int 
>> indent,
>>                   const struct drm_framebuffer *fb);
>> -void drm_framebuffer_debugfs_init(struct drm_minor *minor);
>> +void drm_framebuffer_debugfs_init(struct drm_device *dev);
>> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
>> index 39482527a775..507d132cf494 100644
>> --- a/include/drm/drm_client.h
>> +++ b/include/drm/drm_client.h
>> @@ -200,6 +200,6 @@ int drm_client_modeset_dpms(struct drm_client_dev 
>> *client, int mode);
>>       drm_for_each_connector_iter(connector, iter) \
>>           if (connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
>>   -void drm_client_debugfs_init(struct drm_minor *minor);
>> +void drm_client_debugfs_init(struct drm_device *dev);
>>     #endif

