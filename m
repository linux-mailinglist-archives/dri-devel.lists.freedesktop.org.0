Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F714F92DF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 12:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C287910F093;
	Fri,  8 Apr 2022 10:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B8510F093
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 10:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649413591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5oOyycln+SiSeQpg9NpgCor5XvP2dHzkAPXgOp2Vma4=;
 b=frJc4YSalAwrVEScRsn6fy/NveUN2vDd4W1B5wsbESdSKKYQ/zG397aAaqpWuo/fWT131z
 z1K3QXLa1AbAUrimQGt1DSx5t206nLDhlAfmBVVGADgtVsbVu9LZXOXKuWAi7UlAPi3Lrl
 fdrgcDWN5TtLyRKiihgPa0f9JbKrDs8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-ESU3uMX9O_ODCCVY1e7IBQ-1; Fri, 08 Apr 2022 06:26:26 -0400
X-MC-Unique: ESU3uMX9O_ODCCVY1e7IBQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 l24-20020a056402231800b00410f19a3103so4406775eda.5
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 03:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5oOyycln+SiSeQpg9NpgCor5XvP2dHzkAPXgOp2Vma4=;
 b=FMphZpTVYBxAzYLDNj/emwm6KKhC7ACj2S5rYN23ttqZOhEe+J/Kr0nADXUzFaYf7/
 nFjTUPhblgrv2la/8Ga0jI8EOgJ8kiu/hAD9H3LT6Jt8oe7s6CNODp45Ek1+MYHbyo1u
 5Ai1bPxNrIMRB7/nhgSNNVTbYShXJqauZEnDgWLLwNvL9//gWsF0UE8UJnVX/TMYizFO
 tuORkiUmk9N7H8fhm+vh7ohi6GIVxMpnhNy2t+bQ+nDHKlkT9W7o6QVURtezO2xD9y21
 LcMFR6XaxSU4G6iHqeX4l82kZbKrKMROq9jqRwYQro545XI0O/iRLynaHL2VnKGQ/YR/
 cn1w==
X-Gm-Message-State: AOAM531lvZrBe4/ruFd6yw7O5xan6w6pYfd6lVD7Su35EsNLc5JBlvDE
 4lqOt3wk/8BX2iQdF3SxvxZWAOoEPzOdUjeugZPYc+qttIpiE9trpIPbinAOmh04eMPJwrT4Wxo
 ZGWPnFJVV/5HE3bCaGHKdjaL62Oib
X-Received: by 2002:a17:906:69d1:b0:6ce:7201:ec26 with SMTP id
 g17-20020a17090669d100b006ce7201ec26mr17498306ejs.105.1649413585519; 
 Fri, 08 Apr 2022 03:26:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYYmjthq8B8DKiTecVzxrWItvd2a0qodmD1OQ04r78Zq1nPc/CJAj1gWGs2gkUosBUvivDgg==
X-Received: by 2002:a17:906:69d1:b0:6ce:7201:ec26 with SMTP id
 g17-20020a17090669d100b006ce7201ec26mr17498289ejs.105.1649413585366; 
 Fri, 08 Apr 2022 03:26:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a170907970f00b006e0466dcc42sm8536959ejc.134.2022.04.08.03.26.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 03:26:24 -0700 (PDT)
Message-ID: <ca6eead3-13e7-2973-657d-48798c6cf89f@redhat.com>
Date: Fri, 8 Apr 2022 12:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
To: Simon Ser <contact@emersion.fr>
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
 <dP36CeeNjDVKgcJzbBAdkNM0HzB3N5Uzd6cgBcmrb5mA6xzWs9AKMmRdMKG2y6c1geMhZ1i8hONKQmxYYHN-ZhRLGT_TXz5IhtqnJSWBD9Q=@emersion.fr>
 <0e1cffc1-e8b6-dc58-56ff-53f911f33e60@redhat.com>
 <CADnq5_OGtERRYUPLskgjVD4eLbb2PxKdzcr+xmR2mRMAK73Log@mail.gmail.com>
 <Yk/tOG+iga/wj/Gt@phenom.ffwll.local>
 <acd0c8b6-b045-bab7-dc92-ea166b22c1c6@redhat.com>
 <dc3754a4-3f74-95bb-adae-56000a3756f5@redhat.com>
 <AQ3YD3wm6m_Knso5FAW-CKcokQqjDweExgrnV-f84VGkcOk8B0UcaooLiNqFMsHLOnhVnsnxC9kJMh_gY7z6rHlFaIx1OAZxSUfrOnd2jtY=@emersion.fr>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <AQ3YD3wm6m_Knso5FAW-CKcokQqjDweExgrnV-f84VGkcOk8B0UcaooLiNqFMsHLOnhVnsnxC9kJMh_gY7z6rHlFaIx1OAZxSUfrOnd2jtY=@emersion.fr>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Martin Roukala <martin.roukala@mupuf.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/8/22 12:16, Simon Ser wrote:
> Would it be an option to only support the KMS prop for Good devices,
> and continue using the suboptimal existing sysfs API for Bad devices?
> 
> (I'm just throwing ideas around to see what sticks, feel free to ignore.)

Currently suid-root or pkexec helpers are used to deal with the
/sys/class/backlight requires root rights issue. I really want to
be able to disable these helpers at build time in e.g. GNOME once
the new properties are supported in GNOME.  So that distros with
a new enough kernel can reduce their attack surface this way.

Regards,

Hans


