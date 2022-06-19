Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 538A9550B2E
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jun 2022 16:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47FF610E13F;
	Sun, 19 Jun 2022 14:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131E010E13F
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 14:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655648827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xoLgRCYGtVkzjW93PvWX07m9n9Jojzja1sjm0GTmypQ=;
 b=Xzj7JBj7YimnXd6c5yGr63zUfUaUsi1f/OeZsRlhOIrp7OzqFTpyPJL/8UEnnn4HUBooLA
 Zoe0c1cfSalJJauYhUU4Vu1X88mOM+ksLTA2Bzg/j9FX3C4bJ9SHbO2TTOT91lDFRXFI9e
 NcWhwIsTAmMcOXcQ3jxktij3LMjqYr0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-XIh889mwPASLFJRCnyMTGw-1; Sun, 19 Jun 2022 10:27:06 -0400
X-MC-Unique: XIh889mwPASLFJRCnyMTGw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r83-20020a1c4456000000b0039c8f5804c4so5488911wma.3
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 07:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xoLgRCYGtVkzjW93PvWX07m9n9Jojzja1sjm0GTmypQ=;
 b=yyqmx3Q6qjp+7wLkznzkdzmcWz+A75Qz3wVWFWqM5QzXrgoXyjVCbIlAVda5zIa9iK
 +OrRnhhBFth86UWg7VKQsoHL2hQ1sKs4ZA37j0EJIlKPSOAnCkc72caKmtz4MK77Vzz7
 i2qpJICSCafdky+y55P8xiwFL/pSg1PIv4FsROVB4aHS/eoGY59oRFs138mTPQgDgvPI
 VmtmMF5w+jn0G4V9i+Kq9H9TJuikiB+4AzDpPirxDB1WP6zabmOoIPBgak2T+9XQwd7r
 zOq/vMVm/LRXDNwLb9yPVEvV9f998blpLl99F0xouUJiHfqKuAs3Zz/PkMRLmUAZZ8JW
 pR/A==
X-Gm-Message-State: AJIora/Mwe4tZbGu8n9UBEypyxYj3Bz/y7P1t/uBiJ6/PKTuqvSb/LUA
 87H47gDkOiYiLORbZTg05s2yTHVeLXuvBUh4L0XAshLNM8vIns+YtwAFTnsVpU9M9nOBLDw2Nmc
 C7F5Hk5EfZmxnpVVadjYXj3L2Y/gv
X-Received: by 2002:adf:e710:0:b0:21b:8af6:d5bc with SMTP id
 c16-20020adfe710000000b0021b8af6d5bcmr3398574wrm.278.1655648824917; 
 Sun, 19 Jun 2022 07:27:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t+As4JLV5NWMWt6DAKnOmE88ii8QUGPm1hNF6tWX65VasbcejQXyzs16QNo8EyGTHvs+0MXg==
X-Received: by 2002:adf:e710:0:b0:21b:8af6:d5bc with SMTP id
 c16-20020adfe710000000b0021b8af6d5bcmr3398559wrm.278.1655648824649; 
 Sun, 19 Jun 2022 07:27:04 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d9-20020a056000114900b0021b8dd05f45sm1186901wrx.55.2022.06.19.07.27.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 07:27:04 -0700 (PDT)
Message-ID: <5eabd169-b8a0-fb8f-d70b-4495d3790f05@redhat.com>
Date: Sun, 19 Jun 2022 16:27:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [DRM/hisilicon/hibmc] kernel robot reports build errors,
 patch(es) available but not merged
To: Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <9a0ed0bb-34c7-bacb-16a8-fdb158535ab2@infradead.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <9a0ed0bb-34c7-bacb-16a8-fdb158535ab2@infradead.org>
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, John Stultz <jstultz@google.com>,
 Tian Tao <tiantao6@hisilicon.com>, RongrongZou <zourongrong@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Randy,

On 6/19/22 00:49, Randy Dunlap wrote:
> 
> kernel robot reports today:
> 
> * riscv64-linux-ld: ttm_bo_vm.c:undefined reference to `vmf_insert_pfn_prot'
>   https://lore.kernel.org/lkml/202206190651.smtms3Ay-lkp@intel.com/T/#u
> 
> * ttm_bo_vm.c:undefined reference to `vmf_insert_pfn_prot'
>   https://lore.kernel.org/lkml/202206190523.0Ar6yQF7-lkp@intel.com/T/#u
> 
> 
> and earlier:
> 
> * ld.lld: error: undefined symbol: vmf_insert_pfn_prot
> https://lore.kernel.org/lkml/202203281125.Jp08egXu-lkp@intel.com/
> 
> * ttm_bo_vm.c:undefined reference to `vmf_insert_pfn_prot'
> https://lore.kernel.org/lkml/202204081648.gV63Gt0t-lkp@intel.com/
> 
> 
> I sent a patch for this on 2022-04-08 and again on 2022-05-30 (UTC).
> 
> https://lore.kernel.org/all/20220409030504.16089-1-rdunlap@infradead.org/
> https://lore.kernel.org/all/20220531025557.29593-1-rdunlap@infradead.org/
> 
> Neither one has been applied or even had a comment.  :(
> 

Sorry that these fell into the cracks. Thanks for the patch, I think the
change is correct but gave some comments about the Fixes: tag and commit
description. There's no need to resend though, I can do it when pushing.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

