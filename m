Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525676E5C71
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 10:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5772B10E709;
	Tue, 18 Apr 2023 08:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FA410E709
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 08:48:17 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4ec8c2907c9so1992990e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 01:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681807695; x=1684399695;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DQTL6gqoekyUKEKfWJahiNXjj1p7JeMbW1pMbRbnCsI=;
 b=Wgny9GWkovXUcuzra15R9Ya8NrBk2HhG1yreAWsLLelZmC6KQTmWQGLFa19EQgHlAI
 y+5p7gteUZus9rYbZAkL3VwapJxpryZupHpMBpWkcGnnc0HjPukMpaX0Z8VGCRGTFY4m
 qNOKE2y4qeJVdHcoezQU2oo/1582oCCLm45uTxa0v4xSs/36V1OLt/oCoIKA/no/8oha
 FriZ837lR607GSF8NAxCXHKd5Z9RIhjuN9aYxi+VEyUVbZ7jlVFh6bZWnj8xQo5oiRq4
 IDC+ZzKC3Tf9KK/M0UcnGJV8LDPZu6jybiTKa50tsKDQzWLPIGN9qxptUduao2CxTGIl
 FdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681807695; x=1684399695;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DQTL6gqoekyUKEKfWJahiNXjj1p7JeMbW1pMbRbnCsI=;
 b=hwqH4oMsGM5Pz2RUAKYjSTZaRBsMY992UH24lr5aeLqqKPfkqR1JWwLdsJm+ThQPL1
 PcokmLhUtax1uUHtQlscCIl1gz7Dic2gW76PSBa01b1Cme3canZ8xnd1g/P8DauICmnD
 hqoCqgq/cN0ZZosnTgIUg2uEynp49kk9LQFJ8JTRwACc8EZCjZyi3dY+nNbPKMpu4vMC
 /Js/Ywyrqy4T9e6mmJUG6qOCtXCSK300ePsYFeTzGMGtfPTufbM4Ss1lvxk1Z0BdtJsc
 X/VP/L3caJxi3S6gq61zMT3P046doYWcRvdZutI2mWgLvlShBwRQiC7JGC4XchjOFQFQ
 XFNg==
X-Gm-Message-State: AAQBX9dHwmqVw3vfvUrAnayF1d58nn4ZuMR/wt+nNcs9amqaTiI0r83g
 sZe5okbIF9m61SQ7OoiSgszRxRGxbHI=
X-Google-Smtp-Source: AKy350a+YRhVtMEX2gDL2vy9uqCNxvNfQwxlBOxVZzqQkPi4tiThAj8JZwG9aqOHHyWcZCu3XTUdXw==
X-Received: by 2002:a19:f80a:0:b0:4ea:fa26:2378 with SMTP id
 a10-20020a19f80a000000b004eafa262378mr2670569lff.23.1681807695312; 
 Tue, 18 Apr 2023 01:48:15 -0700 (PDT)
Received: from [192.168.1.103] ([31.173.80.61])
 by smtp.gmail.com with ESMTPSA id
 v20-20020ac25594000000b004eacd90e0c7sm2313021lfg.81.2023.04.18.01.48.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 01:48:14 -0700 (PDT)
Subject: Re: [PATCH 1/2] gpu: Move ASPEED vendor ID definition to pci_ids.h
To: Patrick McLean <chutzpah@gentoo.org>, linux-kernel@vger.kernel.org
References: <20230418011720.3900090-1-chutzpah@gentoo.org>
 <20230418011720.3900090-2-chutzpah@gentoo.org>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <c33ce80f-611e-2841-d4bb-dbddd1b34053@gmail.com>
Date: Tue, 18 Apr 2023 11:48:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20230418011720.3900090-2-chutzpah@gentoo.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-ide@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/18/23 4:17 AM, Patrick McLean wrote:

> Currently the ASPEED PCI vendor ID is defined in drivers/gpu/drm/ast/ast_drv.c,
> move that to include/linux/pci_ids.h with all the rest of the PCI vendor ID
> definitions. Rename the definition to follow the format that the other
> definitions follow.
> 
> Signed-off-by: Patrick McLean <chutzpah@gentoo.org>
[...]
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index 45c3d62e616d..6634741aea80 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -815,6 +815,8 @@
>  #define PCI_VENDOR_ID_ASUSTEK		0x1043
>  #define PCI_DEVICE_ID_ASUSTEK_0675	0x0675
>  
> +#define PCI_VENDOR_ID_ASPEED		0x1a03
> +
>  #define PCI_VENDOR_ID_DPT		0x1044
>  #define PCI_DEVICE_ID_DPT		0xa400
>  

   The vendor IDs in this file are sorted numerically, not
alphabetically...

MBR, Sergey
