Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A11D5776F0
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 17:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2BA8F1EF;
	Sun, 17 Jul 2022 15:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355AD90BF4
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658070622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wU80W9mDke9J2L90OUEZdJ3keN1isK782ZcW+QlgehE=;
 b=cBjMwvK9s8mMZSsd4p9fmHdDvam67UbrzfV98byp+iOw29HrcyEbyOaMEWTSkGlKSbefME
 FL+Bhgho8jG1qsmznAyLuiOci75lHKR3duElywlgry2RvS99WR2YeQ3lG3kjMwd78yo0My
 wp3USVrnNOGHKvOzD1TVClhfsnWAg1A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-RZapTsaxPAKo6IJ88bOWhA-1; Sun, 17 Jul 2022 11:10:20 -0400
X-MC-Unique: RZapTsaxPAKo6IJ88bOWhA-1
Received: by mail-wm1-f70.google.com with SMTP id
 n18-20020a05600c501200b003a050cc39a0so4418052wmr.7
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 08:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wU80W9mDke9J2L90OUEZdJ3keN1isK782ZcW+QlgehE=;
 b=0bm3V0ntmQ8QiF8bRtyazLC96xbZDya0ZGnqLELqPPpXWvswzxkPNOrJgBVBVOxuEv
 B2hwLu+ZvGFLhFTXQ5RJdNl/BR9UGFbldYhDO073HVy9qW/OhLkDD16KzfoUGpwPEx/N
 jXEc1Cql8EPYOmcwXzfRxowUzdK0EkCFyTF9kZCgMtUI88jDUks1hIZ7EPCP+IPsw67D
 p8Iv8cIGwVY7x2S8+RD49KzpgzDaPkIj5Zwgqin319KXfKRabJ51thDk8O3N9bwfvoEJ
 OZlnlWSzlpwyE88DHWm3aU0U8lhn1SNHKihSqV2ZcfWTaNMAFYLW+bv3/cVz++9J3azx
 fvoQ==
X-Gm-Message-State: AJIora+xNFvG3R9gmAowvLq/zEz+QaJkRb1l3NhAIHdvG6EtfpZ2gNfK
 8h92hp8u5psRvWtNnAAYqsdh+6BIMKuOvD8Hpat/t7Ryym6/gHPJcB9ei8Ak+ezy90vDSs2RTur
 02V5jVa59KqtWZzQ5f++WoKwKlssQ
X-Received: by 2002:a1c:545c:0:b0:3a2:e395:21fc with SMTP id
 p28-20020a1c545c000000b003a2e39521fcmr27962751wmi.125.1658070619733; 
 Sun, 17 Jul 2022 08:10:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1twRXDHw4kKpyeYKj5HIqEUXchWv+j1awli8D4wivgVZehZGorfx3btEiASa9uffai69CaDIA==
X-Received: by 2002:a1c:545c:0:b0:3a2:e395:21fc with SMTP id
 p28-20020a1c545c000000b003a2e39521fcmr27962736wmi.125.1658070619509; 
 Sun, 17 Jul 2022 08:10:19 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m23-20020a05600c3b1700b003a2e278510csm16661838wms.15.2022.07.17.08.10.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jul 2022 08:10:19 -0700 (PDT)
Message-ID: <ca88a4ce-2293-44ef-834c-a4f4c3b536ca@redhat.com>
Date: Sun, 17 Jul 2022 17:10:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 02/11] drm: Rename CONFIG_DRM_LEGACY to CONFIG_DRM_DRI1
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <20220716181750.3874838-3-sam@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220716181750.3874838-3-sam@ravnborg.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/16/22 20:17, Sam Ravnborg wrote:
> The rename is done to make it more obvious what is DRI1 drivers
> and what is other type of legacy.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

