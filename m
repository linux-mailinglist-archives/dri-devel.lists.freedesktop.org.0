Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD4D48AA30
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 10:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E667410EBDE;
	Tue, 11 Jan 2022 09:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A258810EBDE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641892279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BEY4b4g5DYT+cIJBREL/mouUq/7jCThhmlzvu53CyFU=;
 b=JUaR/bfVTQfmzvfoOQWq2AMregfF+EueomXnglbxhtfjSxHyeXgHRCuM30N99+Myrx5MUZ
 ZRJDgK+H6L1eaBWS/CxgXOQL6ieg1PQn4f7VY3PqKj1qglT+3e/NNogws4hH4EFBXPlH2Q
 4v7BAWs0ZH48mQ8gzIO9VAPeabs5V54=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-t_mGaTWfNDyl3IWu4VcYIw-1; Tue, 11 Jan 2022 04:11:14 -0500
X-MC-Unique: t_mGaTWfNDyl3IWu4VcYIw-1
Received: by mail-wm1-f70.google.com with SMTP id
 s190-20020a1ca9c7000000b00347c6c39d9aso1483230wme.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 01:11:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BEY4b4g5DYT+cIJBREL/mouUq/7jCThhmlzvu53CyFU=;
 b=HtO8YS2sLDAKQT8jkbwbRRaE0qHT2hHV554wPK1LbFCGNAwi4f//XChJBnaZOPn4/o
 qgSOj/rO3uGPfOzhpqgX51+gNzSOXu5pvgpCHJkFDobRKvwREaQeTqY+aQbD/bqM70qy
 Ny+PC86yEWSOzPKWjWVYrMQClrejErY9LtjHpdGk8I49Uicw8wnO1dV1uyykGiRupMkM
 1/yRJ3f3k3/Q5TU+o5WbWDffiV79sWPy+2P1gQVHXd3mg0nccw4OA9W9Bfowww44hAZ6
 xnO5vccWibiB2oZcMtsFzXKLFdvuqugrGCF8zNjVwdL0CA6FLZxiQgEfPwdqMbRQlzuc
 3Z9A==
X-Gm-Message-State: AOAM5320czSMq+9tqvS10E2SCHiZHlP/Vpf2NNhFgxXRHyI5LlUgcBS3
 S2nEvXK61Nl2+5gKW9JXbc4GiJnyrVvu3slWxq21j0pxG9lO5gONN6CFroUoWcLxJftSLLQtQH5
 bRR/bXbOmv/JxhDAOo+HBXdsetbOo
X-Received: by 2002:a7b:c341:: with SMTP id l1mr1625530wmj.60.1641892273633;
 Tue, 11 Jan 2022 01:11:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzo2U92/RGstwNQj9VAOnM/X4Ui1oVvHfIlVxa8zywDWfjs/4P0T5D6vLyWBOFQ7WAkNXu2iA==
X-Received: by 2002:a7b:c341:: with SMTP id l1mr1625504wmj.60.1641892273424;
 Tue, 11 Jan 2022 01:11:13 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id 5sm9945202wrb.77.2022.01.11.01.11.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 01:11:13 -0800 (PST)
Message-ID: <def83410-30fa-ff9a-ac8d-6b652e314a2e@redhat.com>
Date: Tue, 11 Jan 2022 10:11:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 1/2] drm/sprd: remove the selected DRM_KMS_CMA_HELPER
 in kconfig
To: Kevin Tang <kevin3.tang@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, mark.rutland@arm.com
References: <20211224141213.27612-1-kevin3.tang@gmail.com>
 <20211224141213.27612-2-kevin3.tang@gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20211224141213.27612-2-kevin3.tang@gmail.com>
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
Cc: devicetree@vger.kernel.org, zhang.lyra@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 orsonzhai@gmail.com, lukas.bulwahn@gmail.com, zou_wei@huawei.com,
 pony1.wu@gmail.com, dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Kevin,

On 12/24/21 15:12, Kevin Tang wrote:
> On linux-next, commit 43531edd53f0 ("drm/sprd: add Unisoc's drm kms master") adds the config DRM_SPRD,
> which selects DRM_KMS_CMA_HELPER.
> 

According to "The canonical patch format" section in [0], the body of the
explanation has to be line wrapped at 75 columns. But your sentences are
much longer than that.

[0]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#the-canonical-patch-format

> However, commit 09717af7d13d ("drm: Remove CONFIG_DRM_KMS_CMA_HELPER option") just removed the
> DRM_KMS_CMA_HELPER. So, the select DRM_KMS_CMA_HELPER refers to a non-existing kconfig symbol.
> 
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> ---

Other than that, the patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

