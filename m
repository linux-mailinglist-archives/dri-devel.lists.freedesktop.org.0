Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FC94A8916
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 17:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A74010E821;
	Thu,  3 Feb 2022 16:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C884A10E81D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 16:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643907180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p7tjO1CxiK8pIXUHVy6R/m/jepycRXOssrbmMnXSOzs=;
 b=b5b52db5n7NJcrKP8UVGggXDUT3iIlAJksvf+QHjDjQChbhZgv64t3/kSipu6I5VrR1cSl
 FbWtIyBLcy45DTWN0k+UDeyBrI+QfGg0JJI3PNNieehRQE0OR0kX70R01tZHa+QVlsGm0U
 6FPWWyBBCgETkyI4lha4RFa7sx8jJT4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-0cMlpDiEN268sonbZawg7w-1; Thu, 03 Feb 2022 11:52:57 -0500
X-MC-Unique: 0cMlpDiEN268sonbZawg7w-1
Received: by mail-wm1-f72.google.com with SMTP id
 189-20020a1c02c6000000b0035399bb7e85so4124585wmc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 08:52:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p7tjO1CxiK8pIXUHVy6R/m/jepycRXOssrbmMnXSOzs=;
 b=aMawuQ99HkT9b7L3ut99MgPHcrWjyOZfGjVGnqJQQtDVhjknGKBBUvXhQ+QaU9oaYC
 /Bkfi4QUy27MwUwzbn9ds2G1yVRVfNY+P5OHBfDvTs9hvokLsPCPCExUwvx+dV3MmYeM
 0vEv/QczstDhxediHyyN9jEOuKGb76ovHW0kyYc9zP0bI+pm9tYx4xMwMwRMGyrtNvEc
 dOyU+qqa3cbehDh4xLqQali7cQYsWLDqQdJkaK/sSjrsVUQJ8P8YuowSYF2rcJG9c+Dd
 le+a3KYal6pRVmIuM2SZ4jEcbnLFCRSoQAgjPTCYp2yx5DCbJorU14A0qI2DWP7lqIRM
 dFfQ==
X-Gm-Message-State: AOAM532DJy9ws2dUJtPyFmmaqQbTEdJxGRtiWjwwwY8e9XnH5Y5FoJh7
 /jMo51iifbj9kYeJkZVHP/F43B0d1QKveuDI91VK5Im9XIX/I7QT2ATQKzidWDvwBRmBpkbXMyw
 BZz82b9pSUzRmFWHmcFLYnUBiLlim
X-Received: by 2002:a05:600c:4ca8:: with SMTP id
 g40mr11351884wmp.55.1643907176228; 
 Thu, 03 Feb 2022 08:52:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVBJC0GaRqCQsJNCEUU4okycP2w1zyRqmUR6iN4Wn5vl0SCh9ouZalGgjChzFlQ09w6LWZJg==
X-Received: by 2002:a05:600c:4ca8:: with SMTP id
 g40mr11351874wmp.55.1643907176046; 
 Thu, 03 Feb 2022 08:52:56 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id r3sm6520122wrt.102.2022.02.03.08.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 08:52:55 -0800 (PST)
Message-ID: <f85f2f1f-d660-ae93-833a-f93f937fbd8b@redhat.com>
Date: Thu, 3 Feb 2022 17:52:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/8] drm/ast: Fail if connector initialization fails
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 kuohsiang_chou@aspeedtech.com
References: <20220111120058.10510-1-tzimmermann@suse.de>
 <20220111120058.10510-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220111120058.10510-2-tzimmermann@suse.de>
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
Cc: jenmin_yuan@aspeedtech.com, tommy_huang@aspeedtech.com,
 dri-devel@lists.freedesktop.org, arc_sung@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 1/11/22 13:00, Thomas Zimmermann wrote:
> Update the connector code to fail if the connector could not be
> initialized. The current code just ignored the error and failed
> later when the connector was supposed to be used.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

