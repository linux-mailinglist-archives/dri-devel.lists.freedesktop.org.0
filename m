Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9588D52462B
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 08:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3302310F02C;
	Thu, 12 May 2022 06:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B666610F018
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 06:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652338436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m9qrallTCJWWrD1tmfcAYPYM1KeQaHZcmgYv8BoSEF0=;
 b=E+cb7wifLlN70FGYH43v1pQx4iEseTbRqUgopiuWcrvzcEuEqp3dWjihwDlJogNg8MX2PR
 XHzHtgg85SHT+uNLDW6Q4f1uOobWnHckH3XNofNpA4dO0funOBcIUlTTIGExpP3vtTCYHU
 4XiP7+cKgqkYOKLP8BjRmcbTGfsYpxo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-in-TOhzaN5-EWK6tWFbhdQ-1; Thu, 12 May 2022 02:53:55 -0400
X-MC-Unique: in-TOhzaN5-EWK6tWFbhdQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 n26-20020a1c721a000000b003941ea1ced7so1293906wmc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 23:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m9qrallTCJWWrD1tmfcAYPYM1KeQaHZcmgYv8BoSEF0=;
 b=6VL4cS/oPwgDRkN6HDfarTG0l5P7FRvVT/xqJZNitj19uiOEU1mQkDPYeFMjCPVIjE
 fEnWRjcSVt9CLAjP6Ur4ki9x8rlKZmumnDVPEKBRzClfTJgXgPpLsZXb9Um3OqtAafx/
 J1eH8aq7JHSkbbTFBdyTsZ266UslsGawsaWkbHbvRGELUmlbGjKMM9fevAA2M7+x9lVx
 +fJWFSPmBQX1tGr7ghdXQ7cV1GbteGO5TJd1/vsbNV8N7vSXqTHh1BFFeLp+4OBCnXjY
 /ZS26f9az6OJzUU/qA4zkB+LLys/W15dWk8QVmxBRCBeUr3qxdOWJR1IaWN9SwazFfpO
 cm7A==
X-Gm-Message-State: AOAM531bHPIstRyzp0pzEma2zf64YUJedYvPqd+zMiqoSJp8y0JyzAC9
 0iAOA1/5qCYnMK/H089gogPiQF+oFr4BWLVgqxPP8UdzOyzRRbhraG69jrhRcYnyk+jwMIiz3Bl
 CUQBPEjgTcr5WuDYGW7f/6G/5XEOl
X-Received: by 2002:a7b:c156:0:b0:395:b669:5c83 with SMTP id
 z22-20020a7bc156000000b00395b6695c83mr7053683wmi.141.1652338434248; 
 Wed, 11 May 2022 23:53:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyXJf4J232MvrKUWbwaiPp3FGyyip+AF1RPM/uoHxObgWZHdaCGStWwSfjgtB8rwzUcpS15w==
X-Received: by 2002:a7b:c156:0:b0:395:b669:5c83 with SMTP id
 z22-20020a7bc156000000b00395b6695c83mr7053662wmi.141.1652338434040; 
 Wed, 11 May 2022 23:53:54 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i6-20020a05600c480600b003942a244f40sm1640432wmo.25.2022.05.11.23.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 23:53:53 -0700 (PDT)
Message-ID: <a38b92c1-50d9-52df-43b4-a7576531419e@redhat.com>
Date: Thu, 12 May 2022 08:53:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/amdgpu: Add 'modeset' module parameter
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>, Lyude Paul <lyude@redhat.com>
References: <20220511181935.810735-1-lyude@redhat.com>
 <CADnq5_OWH-Bat3OyCmHz6hTE++7hPLXqqMgg2=Nk6HB_Qk61JA@mail.gmail.com>
 <beb6cbd2-445f-c864-3283-ebdacaed37ac@amd.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <beb6cbd2-445f-c864-3283-ebdacaed37ac@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Solomon Chiu <solomon.chiu@amd.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/12/22 08:17, Christian König wrote:
> Am 11.05.22 um 20:36 schrieb Alex Deucher:
>> On Wed, May 11, 2022 at 2:20 PM Lyude Paul <lyude@redhat.com> wrote:
>>> Many DRM drivers feature a 'modeset' argument, which can be used to
>>> enable/disable the entire driver (as opposed to passing nomodeset to the
>>> kernel, which would disable modesetting globally and make it difficult to
>>> load amdgpu afterwards). Apparently amdgpu is actually missing this
>>> however, so let's add it!
>> You can already do that by passing modprobe.blacklist=amdgpu on the
>> kernel command line.  I don't think we need another option to do that.
> 
> Yeah, this already came up multiple times and so far we have always 
> rejected it.
> 
> Stuffing that into drivers is not a good approach I think. If we want to 
> prevent some device from exposing it's display functionalities we should 
> rather push that into the drm layer.
>

Absolutely agree on this. I think what we want is a drm.modeset parameter
that would have more precedence than "nomodeset". Because the latter is a
built-in parameter and so it can't be disabled at runtime using sysfs.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

