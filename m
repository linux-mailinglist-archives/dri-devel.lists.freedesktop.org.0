Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEBF625710
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 10:42:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9294D10E11A;
	Fri, 11 Nov 2022 09:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2598410E7D9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 09:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668159765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UxbA0lbRcnNSHNC4p6nrgubCZPFh7F5q2151xPoT2H8=;
 b=Z/l+VfVmAbXEL38Nae6f1QpaANMrCNWq5YI2eRVjhjSDRu4EKTdfyzCMfBXwGzNrKAcNUl
 6h3NTBf+h0+ygPuQi4UO9B/NrZfxGBkaBBm2E8QmY4zZmjZzbCS2lhkxNrENnnA4xULkwY
 KXi79FBc9Awxv9YQqYd41nC5MqhspmQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-491-FCDksQKPOMClKXjldejLsA-1; Fri, 11 Nov 2022 04:42:43 -0500
X-MC-Unique: FCDksQKPOMClKXjldejLsA-1
Received: by mail-wm1-f71.google.com with SMTP id
 1-20020a05600c028100b003cf7833293cso4167520wmk.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 01:42:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UxbA0lbRcnNSHNC4p6nrgubCZPFh7F5q2151xPoT2H8=;
 b=R5erSFBLn14hdgT1Eh3dSsak8pfRYJKssFVPYJ7QM0rfSY7gxBxuGPgmZhOHJZ00zz
 P6cfsM4E2nsJ3m+XKCN1uiBAz8yL1bt0IKmTZNDwKAiIf/GzxSkVzIO5tTIXj/TIpOcV
 w8pABETpq+V5YXjFHoqSDy/rC3Uv9TQToODxI7udiJ3yRZRHdhv3lPSMyoRodxx4kDPs
 YvsAmJ/cfMuZZW/XeGfQS+TicoFrGkA2T8j2h0mA5bwdNVvDahT/3f6UL7TtgYHAldE8
 AP4ZBaeRVSdO9O9Ua8Ee0SDTLpWk7E5UquCJK84B08onxR94OW4LrJw6F5RLQO55uhnY
 ezLA==
X-Gm-Message-State: ANoB5pnra00O9L+nMe6extUc8ER9Rwvz3uEk+orcVrd5W6aDFyScc7Br
 /6TZQCloyLpgVebVVAIwSRWlbdv+1b3kv8ZKbXc+8tAIemfxjITNaIidKFRCB8Keh4l+FjuMbRr
 kOlt7ZDtZzpfsF+IiR2uzTRhmXlLG
X-Received: by 2002:adf:f210:0:b0:236:63fa:c792 with SMTP id
 p16-20020adff210000000b0023663fac792mr732414wro.476.1668159762523; 
 Fri, 11 Nov 2022 01:42:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5V7QI8/LMvTiTwHK5Kz3y2ZLNLe9qwbmLqWyIAmtlZPTWVFV2ZHifyIyKwGFP/WQxJjjCjlQ==
X-Received: by 2002:adf:f210:0:b0:236:63fa:c792 with SMTP id
 p16-20020adff210000000b0023663fac792mr732406wro.476.1668159762338; 
 Fri, 11 Nov 2022 01:42:42 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b003cf57329221sm8555745wms.14.2022.11.11.01.42.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 01:42:42 -0800 (PST)
Message-ID: <712ce623-6b44-8514-822f-91ab980240d3@redhat.com>
Date: Fri, 11 Nov 2022 10:42:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/2] fbdev: Add support for the nomodeset kernel parameter
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch
References: <20221107104916.18733-1-tzimmermann@suse.de>
 <20221107104916.18733-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221107104916.18733-3-tzimmermann@suse.de>
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

On 11/7/22 11:49, Thomas Zimmermann wrote:
> Support the kernel's nomodeset parameter for all PCI-based fbdev
> drivers that use aperture helpers to remove other, hardware-agnostic
> graphics drivers.
> 
> The parameter is a simple way of using the firmware-provided scanout
> buffer if the hardware's native driver is broken. The same effect
> could be achieved with per-driver options, but the importance of the
> graphics output for many users makes a single, unified approach
> worthwhile.
> 
> With nomodeset specified, the fbdev driver module will not load. This
> unifies behavior with similar DRM drivers. In DRM helpers, modules
> first check the nomodeset parameter before registering the PCI
> driver. As fbdev has no such module helpers, we have to modify each
> driver individually.
> 
> The name 'nomodeset' is slightly misleading, but has been chosen for
> historical reasons. Several drivers implemented it before it became a
> general option for DRM. So keeping the existing name was preferred over
> introducing a new one.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Agreed that makes sense to have this in fbdev as well for consistency.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

