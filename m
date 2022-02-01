Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3164C4A5DD8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 15:01:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1634910E3DF;
	Tue,  1 Feb 2022 14:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948CA10E3DF
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 14:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643724109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t0xhLey8NZwZfvq1aWQDBdLCgJjMsiCxuS9yKl0tV4E=;
 b=htPBBToLdzW2ECHBe8RKXN7vCK24k9NMaaQHwfYi1iYzpYljKlKUYjreA0TB6ZUTDMUPXj
 VlRiqxEs8N/rKetWB4kcOuNlbjWMFn3THF2DK25PpMr6SVC7xRmfg7ILSssIk7bIYymUjL
 CetMVlWoKsuiCyUwT7YHt6/b6pyJ2iA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-OfUIg7nJOIy2Vq1205H-dA-1; Tue, 01 Feb 2022 09:01:46 -0500
X-MC-Unique: OfUIg7nJOIy2Vq1205H-dA-1
Received: by mail-wm1-f71.google.com with SMTP id
 q127-20020a1ca785000000b00352a4860babso1017735wme.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 06:01:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t0xhLey8NZwZfvq1aWQDBdLCgJjMsiCxuS9yKl0tV4E=;
 b=E8rMGJyr52UmkPPb1KZBsZlKqEv0XuEOVaXnGJ6dhw8QuZwfjbVXW9CEDU59NqLvaD
 QofzgO3ka3WE8VsnFjz4slaIVRdRpt6BSlRwV9FAHHPsZH1DF/zzsoogmJH6/q7+U9EG
 uX865YYHpyhsbkvRhARKCcJBLTIhPHbwZ27bszObJtUzIfwQk4fQ7PDhHMmTbI1COdve
 OEqBXGATEMdlegk67aloysHmFV3dO7/LmT+7qaqSpEud2fscpKb3p0tscztgq4srnf/f
 SoQnt0G298X+UVHpCDv4GPm+DPhCmYuWWkKXhy/7JK0n7VKUE110jj6Si6hMrEKC6skp
 7H3Q==
X-Gm-Message-State: AOAM530iwlxHSfu8mb4xKPNLmf+OzdZATkqmbgQ73up1AarRMdbfkdIv
 SsAKZAy2BYxPChDi5n8Vi25JGTxDGrogl3gmm8Y5tIpGyrKKzMzaTdKuO3cLPyQ7vK2k1FPkXRS
 p3CPtWYrMtHMcm7IfODxAx+xV2Xlk
X-Received: by 2002:a1c:6a14:: with SMTP id f20mr1907017wmc.177.1643724105461; 
 Tue, 01 Feb 2022 06:01:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxiXh7XT/y9EhbXaaYFMW+Z8FLorkbaMP6N2gEv45FSVWMJcQUX+XJyy9OHO0UQo8Hz5UgkJg==
X-Received: by 2002:a1c:6a14:: with SMTP id f20mr1906977wmc.177.1643724105240; 
 Tue, 01 Feb 2022 06:01:45 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id v5sm2032210wmh.19.2022.02.01.06.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 06:01:44 -0800 (PST)
Message-ID: <3ebc8a81-a27f-9ab7-d247-5203f286eeb2@redhat.com>
Date: Tue, 1 Feb 2022 15:01:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/21] MAINTAINERS: Add entry for fbdev core
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-2-daniel.vetter@ffwll.ch>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220131210552.482606-2-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Claudio Suarez <cssk@net-c.es>, Gerd Hoffmann <kraxel@redhat.com>,
 Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sven Schnelle <svens@stackframe.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/31/22 22:05, Daniel Vetter wrote:
> Ever since Tomi extracted the core code in 2014 it's been defacto me
> maintaining this, with help from others from dri-devel and sometimes
> Linus (but those are mostly merge conflicts):
> 
> $ git shortlog -ns  drivers/video/fbdev/core/ | head -n5
>     35  Daniel Vetter
>     23  Linus Torvalds
>     10  Hans de Goede
>      9  Dave Airlie
>      6  Peter Rosin
> 
> I think ideally we'd also record that the various firmware fb drivers
> (efifb, vesafb, ...) are also maintained in drm-misc because for the
> past few years the patches have either been to fix handover issues
> with drm drivers, or caused handover issues with drm drivers. So any
> other tree just doesn't make sense. But also, there's plenty of
> outdated MAINTAINER entries for these with people and git trees that
> haven't been active in years, so maybe let's just leave them alone.
> And furthermore distros are now adopting simpledrm as the firmware fb
> driver, so hopefully the need to care about the fbdev firmware drivers
> will go down going forward.
> 
> Note that drm-misc is group maintained, I expect that to continue like
> we've done before, so no new expectations that patches all go through
> my hands. That would be silly. This also means I'm happy to put any
> other volunteer's name in the M: line, but otherwise git log says I'm
> the one who's stuck with this.
> 
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: DRI Development <dri-devel@lists.freedesktop.org>
> Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
> Cc: Claudio Suarez <cssk@net-c.es>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sven Schnelle <svens@stackframe.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

