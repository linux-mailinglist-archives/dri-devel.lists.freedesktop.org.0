Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40634D2DF8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 12:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6D310E4AC;
	Wed,  9 Mar 2022 11:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353F310E4F8
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 11:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646825401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HnlUMIzNyqkqH+xHxo42IHozaUvb7gIZp8zyXlaq0wo=;
 b=Z6RblIDg/7iTsGpP+vTAEg4v6sh275OHZlChLoMDeGh6uwWvT7yOZ229oWxg6QyZosVpw5
 zLE+oVH9C/LC6dLn4nC2w5Gp51otJo+dH1EX8ofF8HYRR5VLAeUeB9x5wZVtDX8AmsJnee
 uBTuO7H5Wse8p92dS9G1dmyFTxN+wXc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-YOnyiDZhPaOZRez_hVflfg-1; Wed, 09 Mar 2022 06:29:58 -0500
X-MC-Unique: YOnyiDZhPaOZRez_hVflfg-1
Received: by mail-wr1-f69.google.com with SMTP id
 w17-20020adfec51000000b001f068bc3342so663441wrn.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 03:29:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HnlUMIzNyqkqH+xHxo42IHozaUvb7gIZp8zyXlaq0wo=;
 b=dMBMjt4PMgdGKuHqa+k8p3hp/XD3I47bCBE3plIw189JM8h+oJHyj6f925sxkNa/pm
 teEU+SqUgA0Z0XQl6tOULG/TkqXMVEI2zaVK3iZe8/IHTdVJ93IKZgfaXlUkHokV7CLn
 nEzYcO6JY2dErItRvEselZuFVjlnkhUdUmbU1dCe20imHxHkhrPGbwS+8S1XZgAsPA8i
 1gsH6JCCKTDyjeuZDe1rOis+R7KNlqdWlfDDEd2+LmiUPUaENNjG/VIDjYNs70aQIOA5
 d9QscvAAj1wFPhaQgJSf5k3riciudXq6vaDn3lRH3tRYK2FYeVAGYFMo/CgUazhrUUxq
 bL4w==
X-Gm-Message-State: AOAM5305mZHaoVVnzJKrp6Br/XHSNsavq7oBm7ITvM3VYkuYU1m4WIzV
 cemt2YWRtQRtltwC+gOlryde8q1ROaX/3/8S1xoIlZOKWFwVK01Cu1YRpb6mpPRrB3mdsSb6jtl
 RHyfSONVPgbypYYNVBp51d46WDK2u
X-Received: by 2002:a05:6000:1a87:b0:203:7089:a985 with SMTP id
 f7-20020a0560001a8700b002037089a985mr4916350wry.487.1646825396680; 
 Wed, 09 Mar 2022 03:29:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBmRvb7LqphR27TvNl9xg2A5igntxMD1AB4+Q0/ZWq2SZv47J3rQA6ziMwODlncZSqtS4y/w==
X-Received: by 2002:a05:6000:1a87:b0:203:7089:a985 with SMTP id
 f7-20020a0560001a8700b002037089a985mr4916337wry.487.1646825396478; 
 Wed, 09 Mar 2022 03:29:56 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a05600c501400b0038995ede299sm1432746wmr.17.2022.03.09.03.29.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 03:29:55 -0800 (PST)
Message-ID: <ff826df9-119b-563e-c666-c979dcd97f17@redhat.com>
Date: Wed, 9 Mar 2022 12:29:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 9/9] drm/virtio: Implement dumb_create_fbdev with GEM
 SHMEM helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <20220303205839.28484-10-tzimmermann@suse.de>
 <b1af16e7-a20f-5499-6234-c5090349305f@redhat.com>
 <971ff2e6-adda-17ee-d002-5b32403d344f@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <971ff2e6-adda-17ee-d002-5b32403d344f@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/9/22 09:52, Thomas Zimmermann wrote:

[snip]

>>> +struct drm_gem_object *virtio_gpu_create_object_fbdev(struct drm_device *dev,
>>> +						      size_t size)
>>> +{
>>> +	return ERR_PTR(-ENOSYS);
>>> +}
>>
>> As mentioned, I believe this should be ERR_PTR(-ENOTSUPP) instead.
> 
> I've been wondering about this as well. I finally went with the rules at 
> [1].  All the variants of ENOTOP/ENOTSUPP seem to be for specific use 
> cases, such as a certain feature is not implemented be a specific 
> interface (e.g., sockets for EOPNOTSUPP).  ENOSYS is the only general 
> error that indicates that an entire interface is missing. Even though 
> checkpatch.pl warns that it's only for system calls.
> 
> Best regards
> Thomas
> 
> [1] https://www.cs.helsinki.fi/linux/linux-kernel/2002-30/1135.html
>

Thanks for the link. It would be good to have an authoritative guideline
about this in the kernel documentation (and make checkpatch.pl aware).

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

