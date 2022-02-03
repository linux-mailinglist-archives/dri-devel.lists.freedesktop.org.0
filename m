Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EB04A892B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 17:59:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6645010E201;
	Thu,  3 Feb 2022 16:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE9E10E201
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 16:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643907558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=073CUWXsa6x12uRopKb1nhEM5DCHbKy+S03SIFesh+c=;
 b=ctVyqEg1C6pyCR6pQER2KHf+bRwnqOIL0bFd2SmEg9UsHEIp505AG/QUQTY8yW5mPQiCQg
 20iLXEwTYBYWjD5cnpxHrg2NmiV3Wf5DaPBBZl+fnlHFJ1uDWbo+slIlVeA2mLPuFj1HxM
 aqYkeuUt9iZrADT1PB4dYMvGxpRpgY0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-nA1QH1WoNgqVJ2e0_OO7Zw-1; Thu, 03 Feb 2022 11:59:09 -0500
X-MC-Unique: nA1QH1WoNgqVJ2e0_OO7Zw-1
Received: by mail-wr1-f72.google.com with SMTP id
 q4-20020adfbb84000000b001dd3cfddb2dso908238wrg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 08:59:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=073CUWXsa6x12uRopKb1nhEM5DCHbKy+S03SIFesh+c=;
 b=Igig2kS1Vf+o6svgz86iGjYVD2VDHEXiq/iqiDcF456KBS53bhFSSzK/g0lfYKG1XC
 dh2KYG9z3cLS5f1SlMQijtVDns5HJjtW2ZnA/7HoFYQkhYB835WOh5X7hjWwYeKfFIn1
 jf+4RFPYkrD79i9bi4o2Czf3XgchEC55GIK8GCWwAtw2YwwMCjC94d888c+3tZ8hreIt
 qqfsSn7Ldw+5yKrsWzPhyoO0F1PV6iZl0rvYw4EJ/IA02xgJc8QFYcfsmjrpopCZrfzv
 WWpeXVyQVmpuwsf4vN5K6cZbBYdoMhyegn4SKx5oPSLzhJXZWENHvGlUcCwe2/YO+N/u
 C3vg==
X-Gm-Message-State: AOAM533Jd26kmrZEkd3083Aa7o+fvtCq4km6gm7K3vOzPp/JHECmbFJZ
 QTEXsIto0Gc8XOfw8D8AQtRtfBXmoy/HzoNDNn4alYVbTKoEz1T+m8C8ovH3bAevvBJAk6uzdcw
 FhHCQL8izRFydkaRDh3WxEuMqnDgT
X-Received: by 2002:a05:600c:4606:: with SMTP id
 m6mr11066721wmo.158.1643907548662; 
 Thu, 03 Feb 2022 08:59:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJuKKrTrX1XU5VhdyMijqBEGK4BHiJCEtNoXpJxAAyjUDMX31cczwU+uul79GH6alDHm4TCQ==
X-Received: by 2002:a05:600c:4606:: with SMTP id
 m6mr11066709wmo.158.1643907548525; 
 Thu, 03 Feb 2022 08:59:08 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id a1sm21468162wrf.42.2022.02.03.08.59.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 08:59:08 -0800 (PST)
Message-ID: <e30b9c53-82da-bad8-a32f-c1aad7283f96@redhat.com>
Date: Thu, 3 Feb 2022 17:59:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/8] drm/ast: Remove AST_TX_ITE66121 constant
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 kuohsiang_chou@aspeedtech.com
References: <20220111120058.10510-1-tzimmermann@suse.de>
 <20220111120058.10510-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220111120058.10510-4-tzimmermann@suse.de>
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

On 1/11/22 13:00, Thomas Zimmermann wrote:
> The ITE66121 is an HDMI transmitter chip. There's no code for
> detecting or programming the chip within ast. Remove the enum
> constant.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

