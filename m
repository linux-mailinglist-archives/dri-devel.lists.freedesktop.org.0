Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D613497E46
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 12:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E082310E669;
	Mon, 24 Jan 2022 11:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C5D10E669
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 11:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643025027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SnozPUrejpB8IY9KHbWAe0uFCpl2C3OVRF4UKq2Q7OA=;
 b=dvCAHkI356POfHW+B8c3F65OPSLOPVmKTaZGlF1g/GjgwTFAkn1JqhabKIGhE2x7UHy6rz
 I8YTdGGz6PzyDv6o4MsrOfc5SjmI9A3W8YR0uD6tJskV0HkORUMTfU8hE+INcAClo71pRS
 oBjzP9UjQFaJTMwqraatVc4pX6GrR6I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-d6aUxfsjO_a6gfnXFqLhsw-1; Mon, 24 Jan 2022 06:50:24 -0500
X-MC-Unique: d6aUxfsjO_a6gfnXFqLhsw-1
Received: by mail-wr1-f72.google.com with SMTP id
 t13-20020adfa2cd000000b001d09443ee4fso1768158wra.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 03:50:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SnozPUrejpB8IY9KHbWAe0uFCpl2C3OVRF4UKq2Q7OA=;
 b=LeQTTy6RdaJMfYBjBCYrfhm9/DXsFFtHGlf8bSrkeNwjMfl7dQZmiTscTOVecm7b2n
 MD0RDKm5OYDuOAmms/xwQUaAkN+3CIalPgVBFF1yqkEwDM8Fvl4zxG9ttdq0yzK3vdcw
 KvUiu0H2F4xeEkI0tT6XnL1peMTI/5Dab1JUYHNArIl0QOQ3huwGlBompGLGXmMNwMEO
 aJh7QcLoySnPHK9D+HuPMyNfQ6oXxYMqk/NFgPS5aQzZ6oy7/FTeM5WH20OW3z0v3Jai
 DWjA9/YW8vibfFZobWSrQ8/XKNrnM+1vJ8B2fPmzX3TmSp37PSmeoYfnfyV+HVZ30b+j
 zltQ==
X-Gm-Message-State: AOAM531W1i/GJ4R8I1JZYf1F40kgGXi6w9nlYJXgttIXZrLhIdArfVku
 aWKG4v191AEz2wxhPYcy3toYdZ60gUjKUlEMiSjtkQQYzZ+iZh6H/v+KsYRG/wwB++yExWIfGgY
 FafLstAOKgqV+9Ka4BkOtOa2g7pcE
X-Received: by 2002:a5d:588d:: with SMTP id n13mr14154332wrf.153.1643025022929; 
 Mon, 24 Jan 2022 03:50:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwc+T8f2EA0pQatiSUAYWsweg14f3Fap55QqOPYFQTgJZjANOOALIERHOvplEdlRysuwhZ5oQ==
X-Received: by 2002:a5d:588d:: with SMTP id n13mr14154313wrf.153.1643025022753; 
 Mon, 24 Jan 2022 03:50:22 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o12sm6904445wry.115.2022.01.24.03.50.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 03:50:22 -0800 (PST)
Message-ID: <2fc200bb-4b40-7833-31c9-90a78512b601@redhat.com>
Date: Mon, 24 Jan 2022 12:50:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
To: Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de> <YelyGDNDTn1Aq/hm@phenom.ffwll.local>
 <6c000477-002b-d125-b945-2c4831bad8a5@gmx.de>
 <20220121072006.ylw2hdl7jbkbwnre@sirius.home.kraxel.org>
 <64fd46cb-9746-3fd0-ec92-c64dba76875a@gmx.de>
 <d23800b4-503c-a6e2-2c51-2c07a736dffc@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <d23800b4-503c-a6e2-2c51-2c07a736dffc@suse.de>
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sven Schnelle <svens@stackframe.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Pavel Machek <pavel@ucw.cz>, Daniel Vetter <daniel.vetter@intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/22 12:33, Thomas Zimmermann wrote:

[snip]

>> Thoughts?
> 
> I can't say I approve keeping fbdev alive, but...
> 
> With fbdev emulation, every DRM driver is an fbdev driver too. So 
> CONFIG_FB_DRIVER is somewhat misleading. Better add an option like 
> CONFIG_FBCON_HW_SCROLLING and have it selected by the fbdev drivers that 
> absolutely need HW acceleration. That option would then protect the rsp 
> code.
>

Agreed that this option would be better and allow distros
to disable the code that was reverted.
 
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

