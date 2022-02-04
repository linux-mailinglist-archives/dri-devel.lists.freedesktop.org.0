Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E20804A9ABF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 15:12:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F2110E464;
	Fri,  4 Feb 2022 14:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AB110E464
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 14:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643983941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KItnbBDoQWGxAStE9x/Omo/R1q/taazm8Gbl7PqYOjc=;
 b=Iu+McOYBk1NKxVrMiAES6qF0s6asngAZKoj9ef/3UuDd3UJPnaTIt+mBgNoj3LCip8vdez
 JQSql+ucyWioZWW/QMBh7ziitMNpyJ9zuJHyzYsaA6S2OQCymBs7MEVjyUUoCLBnClyOGD
 4EFiIPUNLxG8sXXHmE6DgjrAdGIYOAM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-_Q6iepGIPp23lk55XYl_1Q-1; Fri, 04 Feb 2022 09:12:20 -0500
X-MC-Unique: _Q6iepGIPp23lk55XYl_1Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 j18-20020a05600c1c1200b0034aeea95dacso7613739wms.8
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 06:12:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KItnbBDoQWGxAStE9x/Omo/R1q/taazm8Gbl7PqYOjc=;
 b=BOaR8l7/eziPpYoiIy3EecridRZc5rDw8/OsE+wxhwY7EyTwAH58oYOskYB6mtl6Cx
 Hyld/IvNLXYnINRl9+8Jxq8ybMOadvSgPqm4zvHe8v3Xwm4//ZGlJYuYxOxj4vGsrRBT
 LLKs+UUS2hru2u1ZenisT2IhqXwqA3Vf03Ex4hAeAWIpdsDZalTq4Lcqgmgb+Y3v16IQ
 2ZyMWrEFUJxwHDQX7FS6t2jobIAcmfWT3/fHEgJCFIIbEhgE92KzPuPra8gcS5sSsAU/
 PIWJqKHVp0m9LHCfG8YWowkW/ylwAhh1yWAG6b+5FKifkgG/qAQkNUQXcHkZB6jWvElh
 dMQw==
X-Gm-Message-State: AOAM532xRpsSSe/IuBSIMGChjCzasD5a0UgeaRVcNdb7vJXS1oUf26B7
 giwMiRAJbnsXrtMAqnT5DLFuhCDTCaxjSrcUAD+Ezv4MWTqzDLJZ+YWb4oI3Qa1hfRaWlHkKrmo
 4IOYWvfh2Jzv0mRn942B5ljBiQEiU
X-Received: by 2002:a05:600c:1d8b:: with SMTP id
 p11mr2385839wms.115.1643983939111; 
 Fri, 04 Feb 2022 06:12:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztIKbYGGYYsqOYvoXlouVCeffwnsLMQlwE5LqaJBGhLKzE5ulVDx77gLhM4YlpnNr0MzeTyg==
X-Received: by 2002:a05:600c:1d8b:: with SMTP id
 p11mr2385818wms.115.1643983938849; 
 Fri, 04 Feb 2022 06:12:18 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id m12sm2480308wrp.61.2022.02.04.06.12.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 06:12:18 -0800 (PST)
Message-ID: <5892749f-0bb0-68f5-c3d2-8ceedfc6b162@redhat.com>
Date: Fri, 4 Feb 2022 15:12:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/4] MAINTAINERS: Add entry for Solomon SSD130X OLED
 displays DRM driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220204134347.1187749-1-javierm@redhat.com>
 <20220204134347.1187749-4-javierm@redhat.com>
 <Yf0wzOP/kaubDAhP@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Yf0wzOP/kaubDAhP@smile.fi.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Andy,

On 2/4/22 14:57, Andy Shevchenko wrote:
> On Fri, Feb 04, 2022 at 02:43:46PM +0100, Javier Martinez Canillas wrote:
>> To make sure that tools like the get_maintainer.pl script will suggest
>> to Cc me if patches are posted for this driver.
>>
>> Also include the Device Tree binding for the old ssd1307fb fbdev driver
>> since the new DRM driver was made compatible with the existing binding.
> 
> ...
> 
>>  drivers/gpu/drm/drm_format_helper.c | 2 +-
> 
> Nothing about this in the commit message...
> 
> Stray change?
> 

Sigh, I'm not sure how added that change. Just ignore it, I'll fix it
on v3 or when applying if there isn't another revision of this series.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

