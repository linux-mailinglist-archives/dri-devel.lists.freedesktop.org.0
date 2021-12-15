Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE12475422
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 09:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8170110E1D2;
	Wed, 15 Dec 2021 08:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD6610E1D2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 08:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639556087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JEAsI75enqLwhDhbjlYFhGRisu3oyU/HOhdF+s9OEjo=;
 b=BqtG0KQr6ess2GDJJF75rV1anNF9iVMOyiY3Upq9S6q5agLTI7Kx6lIU0YbR7U1JvVsV6a
 GhzpVLeLJADB0D/DWTexUVGjsF8gZ/lzJECjG7zEZw2PNyN1GmfMv+O89/dyBxXUJdGo+P
 WPR7BaDVrfkkvwlk1OEEwgNPfTig5ag=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-iMCOK1p1MIGZ6JswnSJvSQ-1; Wed, 15 Dec 2021 03:14:46 -0500
X-MC-Unique: iMCOK1p1MIGZ6JswnSJvSQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 v23-20020a05600c215700b0034566adb612so538669wml.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 00:14:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JEAsI75enqLwhDhbjlYFhGRisu3oyU/HOhdF+s9OEjo=;
 b=WVvk1+B+ffryCml97McInlGF4mkMYxx883M1dEbi3R3n+6gcbpN4H0RjdVy+0iuYD3
 bu86shamaveV56TWxHuDyk3yz92mLGL/U916Q5KcKjDrpk7ghSQky0pdYmXI9F8tWNA6
 pHUDUKB5GkUhHcU5Q+BF5djFnN1DAy8Nr7A5cJuCEGHipITbWdO3sTgiU7OjlmA2dS/X
 JiNk01cYS1sI9Ecb4/NyTcjPNkwcjv5MDPjN5trvfJjbyLlUOV9hVENEeBMx7ImyjimP
 wqJDRySt2jRkOFcOiFxHrzzHjVfFDwM3zFFjd8DXssegvteqvK7P+2n4f6k5jrjGvdzw
 4JWg==
X-Gm-Message-State: AOAM530eXcWIaAYJo2xvUICarKREFRzTAMbqe/ER42BxbBcwClTAHUXO
 GoAcFV5of/kDS0g1P3BpeAFKmtIkDQVcjd1VETvosdel0zT9kCehPoWgbCjnIeZEY3nLXyP6BSj
 /GUZQam0NVeUHlC00L5EZ/K9wvdTr
X-Received: by 2002:a1c:f20e:: with SMTP id s14mr3437790wmc.186.1639556084735; 
 Wed, 15 Dec 2021 00:14:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrlpcSf3TqSPYZqkCKxKSZcCNrQVNV34HIxCojMhmFMNV5KT+N5l7F3ybbnUjVuBan8yXg7w==
X-Received: by 2002:a1c:f20e:: with SMTP id s14mr3437778wmc.186.1639556084498; 
 Wed, 15 Dec 2021 00:14:44 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id f1sm1288434wrh.116.2021.12.15.00.14.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 00:14:44 -0800 (PST)
Message-ID: <99d6cd9f-3693-03ef-ae8f-07339515f5e5@redhat.com>
Date: Wed, 15 Dec 2021 09:14:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 59/60] drm/xen: Add support for the nomodeset kernel
 parameter
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20211215010008.2545520-1-javierm@redhat.com>
 <20211215010008.2545520-60-javierm@redhat.com>
 <c417c35e-fbff-cb88-6684-7757f218bdf3@epam.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <c417c35e-fbff-cb88-6684-7757f218bdf3@epam.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Oleksandr,

On 12/15/21 06:58, Oleksandr Andrushchenko wrote:
> Hi, Javier!
> 
> On 15.12.21 03:00, Javier Martinez Canillas wrote:
>> According to disable Documentation/admin-guide/kernel-parameters.txt, this
>> parameter can be used to disable kernel modesetting.
>>
>> DRM drivers will not perform display-mode changes or accelerated rendering
>> and only the systewm system framebuffer will be available if it was set-up.
> s/systewm system/system
>>

Thanks a lot for spotting this! I rewrote the commit message a couple of times
and didn't notice that ended with a sentence that was mangled.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

