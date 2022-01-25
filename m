Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C319B49B53E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 14:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8885510E32B;
	Tue, 25 Jan 2022 13:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7ACE10E32B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 13:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643118074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yaxR451unEN0VqDa1LZ9sTihcGWyaF1DYfUc0HCmDjg=;
 b=hKFrZ1byM25hcGXqrULCsi++79aFyv721AFyhqF7B9AZ9e2lVLpF9WGNXZmZ5rzTgBwSrm
 q/vAQDtdFTizf7FOCBNIFdComVDrbROhWYKv5pirNYH/5BhJG/s9b0Simx9HtlaGHRPG4B
 0EhAMzJbd2aUaNNYswhxkcvT/aZJxj8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-5UmdkT4xOyGXfgi2eBgmTQ-1; Tue, 25 Jan 2022 08:41:07 -0500
X-MC-Unique: 5UmdkT4xOyGXfgi2eBgmTQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 c16-20020a1c9a10000000b0034dd409329eso1489976wme.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 05:41:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yaxR451unEN0VqDa1LZ9sTihcGWyaF1DYfUc0HCmDjg=;
 b=5jHAQSWhm92S1lcocWwJE+gAl7AnwhOmJP4Pgww7uZzCgAW+7zku9M3rD3ds0IcYb1
 ngEozkJ1Ca5YS3czERaa2kKKclsmihjIaWMqQ0v4wp3c7coIe8w1Ub5lx08wxtOUpVUY
 9bkm3D1Y+VUm3NWZpwgHjTEcjJp2tbV5R/YJN/FZWJCz3X4BmQLdr28xBC8LmoPQXc7x
 wfMkjkyjDXMx/fuNM7WRPmmzUQ0RQJjdY74pka+5P8wacMGyZB47kJb/HNcxIpD7+9HV
 ntFGx4exzCmaGlgnb1bo6ixeW8W/Psr/gvKXJmDxwhSEXX23w+u5dv4Gh/uXmfGNrlSF
 EhgA==
X-Gm-Message-State: AOAM533Z+mI2ZgvT6XqoYpsG1QvC1ZKxG0+iyiuwtUNDVoSBbN96tdse
 q5oEwIjpKZ6B5a25usl74tFZH6MafsFUlEcpYybeq/nm/vgnYH/O/jqYUCyl+qsVcSOWlxWcn4B
 UMkO7iAn4zVUpSnXjyZdr9scdJQFB
X-Received: by 2002:a5d:50ce:: with SMTP id f14mr17789780wrt.276.1643118066184; 
 Tue, 25 Jan 2022 05:41:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJVtjlhwtvlhUHqUCDybStr89WT6KBO170dmA+WW0xrnh32qxT1qxswdISyu4AeKaldFygFw==
X-Received: by 2002:a5d:50ce:: with SMTP id f14mr17789762wrt.276.1643118065983; 
 Tue, 25 Jan 2022 05:41:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id k12sm16609328wrd.98.2022.01.25.05.41.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 05:41:05 -0800 (PST)
Message-ID: <6b016dc8-85f5-b859-b918-bd9c492b5ac3@redhat.com>
Date: Tue, 25 Jan 2022 14:41:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/5] drm/simpledrm: Request memory region in driver
To: Thomas Zimmermann <tzimmermann@suse.de>, zackr@vmware.com,
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de, hdegoede@redhat.com
References: <20220125091222.21457-1-tzimmermann@suse.de>
 <20220125091222.21457-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20220125091222.21457-4-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thanks for the fix.

On 25/01/2022 10:12, Thomas Zimmermann wrote:
> Requesting the framebuffer memory in simpledrm marks the memory
> range as busy. This used to be done by the firmware sysfb code,
> but the driver is the correct place.
> 
> v2:
> 	* use I/O memory if request_mem_region() fails (Jocelyn)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

-- 

Jocelyn Falempe

