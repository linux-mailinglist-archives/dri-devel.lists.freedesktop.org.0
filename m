Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA239497DED
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 12:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B7710E849;
	Mon, 24 Jan 2022 11:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4091E10EDA4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 11:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643023737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iCk2MqV068ik47++TkY622krHol54JciUgHuKaQzhoA=;
 b=K9NaK3jsssWUNBL2Ernpu++vVkSB1jlXtBgBqbqD4R4dMGNCF56VdJWn4TFGc3Zh1lbUui
 t6rTIaZMtbmx8rcAh5/S4e3cueYcybgOrk++DR19+IkJd3Ixf/ocqIKg5yuGDL2pm85jbd
 cEtwcaZxoDDeOQQQ7QQZtGbIhAFK2aU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-dEmS0zZtMtyRxIm4VrAqug-1; Mon, 24 Jan 2022 06:28:56 -0500
X-MC-Unique: dEmS0zZtMtyRxIm4VrAqug-1
Received: by mail-wr1-f72.google.com with SMTP id
 a6-20020adfbc46000000b001d7370ace6eso1748265wrh.9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 03:28:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iCk2MqV068ik47++TkY622krHol54JciUgHuKaQzhoA=;
 b=MZGDEoaPFMAhi/KWASBQsQE1vdDfwURIGjEWbihYzknQOH/4VkFpg9c43/+KD40i+N
 8c9S6GqbnUA/JXhFYyi1JHwEY5KwKPV/4BwVZpj/fKXSdYkAPVro6qmOjHMWFIFFCQd/
 dfZbm7N8HhFT4sX6c3yvh5XuZONjkyuySahsfVUkMIZ6ffOprEQk9RGtii+uKJlitzSr
 pkfh2mo9Xp+9DgKP0qAcosLHGAABCQdISB94pV2LLu17ZXiOxt2NUcD2IV0tQJ3YnoTm
 LRZw08RpKWUy977CJ9V8FnTVKD0BGO0USU+Jfige9q9q4LYc5C3jUaPTTm5jV6+euycQ
 XxvQ==
X-Gm-Message-State: AOAM533lWb15NqzyzgSKqkbzZfWiRqPS9pNyMFfyzJ6FeRWzZ7oP/Woo
 v0mCuUXiL8HQ6mPp1d1XW9TL2OxX4Tvz3SOwznYAsVqK2j4Dt6KtJepGzWDniC1/OMxP8/yM022
 JxE472tCUyxN5A5CGXFvhfq77/0Tu
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr13889239wrb.268.1643023734925; 
 Mon, 24 Jan 2022 03:28:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0+gCfn6OAv6eptFf7BhcWyYygRydFAGPWQjZmowvpEyj4P+Ozcyhp0AQ6GAk5Vk1kRhCA/w==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr13889227wrb.268.1643023734752; 
 Mon, 24 Jan 2022 03:28:54 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id w22sm248487wra.59.2022.01.24.03.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 03:28:54 -0800 (PST)
Message-ID: <66991d85-012c-855d-0799-35d85f92326f@redhat.com>
Date: Mon, 24 Jan 2022 12:28:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
To: Helge Deller <deller@gmx.de>, Gerd Hoffmann <kraxel@redhat.com>
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de> <YelyGDNDTn1Aq/hm@phenom.ffwll.local>
 <6c000477-002b-d125-b945-2c4831bad8a5@gmx.de>
 <20220121072006.ylw2hdl7jbkbwnre@sirius.home.kraxel.org>
 <64fd46cb-9746-3fd0-ec92-c64dba76875a@gmx.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <64fd46cb-9746-3fd0-ec92-c64dba76875a@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Sam Ravnborg <sam@ravnborg.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sven Schnelle <svens@stackframe.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Claudio Suarez <cssk@net-c.es>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[snip]

> 
> What about this proposal:
> a) adding a Kconfig option like:
>    CONFIG_FB_DRIVERS - enable if you need the fbdev drivers. For DRM-only this should be disabled.
> b) Add to every native fbdev driver a "depends on FB_DRIVERS" in the Kconfig files.
> c) That way we can use "#if defined(CONFIG_FB_DRIVERS).." to exclude code in fbcon which
>    isn't needed by DRM.
>

I proposed something similar in:

https://lore.kernel.org/lkml/20210827100027.1577561-1-javierm@redhat.com/t/

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

