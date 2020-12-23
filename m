Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FAF2E2ACA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E0089890;
	Fri, 25 Dec 2020 09:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B7D6E894
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 21:39:46 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id 11so174422pfu.4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 13:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XdnCKmMvXL/IFhJCMVS5L+iCGs5J9t20IcKtN3xxsJk=;
 b=oKdeGe/VQUEpgKcRl6aNqXkImPkxoKngyitT7qpOuJ+hVu2RPjR7OJkt8Od6lJNwCq
 F02G41hpLl2amg1aKsDLF8s+yMPT8auy7eMspYAyEGxIoFsDPHPFoTG4H2FKAzcAv6ce
 QejLDUpUHX7ZR1JyZZ+UtLynrWR9n9wInaiDTRLKW1r0dmLzT2kwZkRgKqdqaBoEziLe
 QPdI1XUvy2k8xa3HlebXhw9ivzVULkTe+NbvxXhneBrEMNs27KBGs57amCDRMVGA0ZRa
 tmiqpwSsdls9mK03JiqGFQWxwSC+XwME4V6yuEcsUF/4/Un4GHrtnA4jdzycHImZCRQa
 7qww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XdnCKmMvXL/IFhJCMVS5L+iCGs5J9t20IcKtN3xxsJk=;
 b=AB88dTDATbW1ybQ19ZRJZUTQLskhrGX0fqsI/gw+Aga/L9cI1ktR2Wua7YDJrRHMBi
 7qVO79kdvMoikzO9pk/x/ZtDwp2EL2HOx+JYku7ocU73lBPy6ZDSrvwVeINKFYjyi+r5
 A6SFbwbepcnbHjri4HlCoYsiq762RiJy/9hI3X6ZU2TtGthhiIyd58RsziC08LRTKCLG
 +ZF4BX4EZi0uYYhU9tZ+kFZmixwTkCjk5oqQZ1LK0utbYjXo+AeS4b3/yIkUFEfh/D6W
 6SGUwmFSIPHjUDW1bTjXwDEQN7CgF9KC6nZHfcrA31+S0/N6qIsMKQrzrbbByDdeKVhk
 aCJQ==
X-Gm-Message-State: AOAM531nqWR9MWV67fYvNVhOXE/GkjQqZzPQqdGWmZWI6lUWF5vx7KK/
 Bwr538MoMYDfT0YYRKp8WKM=
X-Google-Smtp-Source: ABdhPJwZKLfszClVLJbmLpMZS8gK1sY+RuEFh15RpcE8sa7j7fAgQtURAu8JquH9nBibGKP/wZv/Hg==
X-Received: by 2002:aa7:9312:0:b029:19d:fa90:3f42 with SMTP id
 18-20020aa793120000b029019dfa903f42mr25335437pfj.18.1608759585546; 
 Wed, 23 Dec 2020 13:39:45 -0800 (PST)
Received: from [10.230.29.27] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id b197sm19210996pfb.42.2020.12.23.13.39.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Dec 2020 13:39:44 -0800 (PST)
Subject: Re: [PATCH 0/4] drm/v3d: Minor improvements
To: Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
References: <1608755245-18069-1-git-send-email-stefan.wahren@i2se.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <2f9769da-f5b3-0c25-2f46-a0796da225ba@gmail.com>
Date: Wed, 23 Dec 2020 13:39:42 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1608755245-18069-1-git-send-email-stefan.wahren@i2se.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/23/2020 12:27 PM, Stefan Wahren wrote:
> This small series of v3d patches is a preparation for the upcoming bcm2711
> support. The bcm2711 support will be send separate, because it involves
> bigger changes.
> 
> I'm not sure that the schema conversion patch is sufficient.
> 
> Patch 2,3 are directly taken from Raspberry Pi 4 vendor tree.
> 
> Nicolas Saenz Julienne (1):
>   drm/v3d: Use platform_get_irq_optional() to get optional IRQs
> 
> Phil Elwell (2):
>   drm/v3d: Set dma_mask as well as coherent_dma_mask
>   drm/v3d: Don't clear MMU control bits on exception

You need to amend your Signed-off-by to all of those 3 patches that you
did not author.
-- 
Florian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
