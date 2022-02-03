Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C98B4A81B7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1A710EC75;
	Thu,  3 Feb 2022 09:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDEC10EC55
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 09:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643881677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hjgnEpEE0dTmZwXz2gxlzjkuy41yhqxoQIIOLs4X+HE=;
 b=R/Xeapin+Ub9ihjGq9DQEXq1KIE7vbFWfEkDS6RvxCnY0x71ZZHo9Gw9cKCAbSjAonqMl1
 2qZwHUplR0mxaRMN9UnSNJ1h7+EMaclnZexP83ZuJPV8TcdziSyFYPQ/8xB4TTZXCmClrA
 Fvfz8wT4eXeOK9Z8WfAmXZkbhh6qTZQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-SuwHltfBPXimcQG9mUUKTA-1; Thu, 03 Feb 2022 04:47:50 -0500
X-MC-Unique: SuwHltfBPXimcQG9mUUKTA-1
Received: by mail-wr1-f71.google.com with SMTP id
 c10-20020adfa30a000000b001d79c73b64bso460132wrb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 01:47:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hjgnEpEE0dTmZwXz2gxlzjkuy41yhqxoQIIOLs4X+HE=;
 b=xljLB8KGg4hbkQpbtsuVMxKBqxVc4dgVZqOfexwVNBnnjnVcJZkYTNq12E3/eODe3/
 IKlfCRgxpSC7vH4QsD+OhkNzu+dFQTAmBH9gAgNqvmr3yFjD+hyMYLEz+ydUjtD2QASy
 8F9IlweJ+ot/L1iNhqTjvRPXnGnYMsKpfAy/DtEcuOdfXhGW9RC7rKct1GF/w/7qXgji
 LZkCEZMxDm457Ctclr34aDAPas0RpGmK4SXsLhCitwHIZq/ZLXfKweAifTpxaQEHBT5W
 aqJUAmLtWkJb07zi5LT4Lb10ZlhPoeRczpVRI1yuRGtnqUIKLOp/HUYIenK1Oow+Jqbu
 uHmg==
X-Gm-Message-State: AOAM533xPxOBagf/HoOkXW+oVQMR1mXCWvQ0XD52ru5O0N07mAyzDVbI
 hbi4is/jj3SRgtKglP3p3ex6ntKAyW3bSwHYmxjQD2wGATnSckTH2ciGKpMZnPRVrA5++kKOt7l
 azAt2CH1JO0D0A+fAkvL4Mw+ccWUz
X-Received: by 2002:a7b:c402:: with SMTP id k2mr9761471wmi.188.1643881669565; 
 Thu, 03 Feb 2022 01:47:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaUfryK6pc4G3M26ebTBTIZ99iWaBHiX3S28isFB1vN0SxVEoPiYKaKvdfaOaq8Bbqd+AFQw==
X-Received: by 2002:a7b:c402:: with SMTP id k2mr9761455wmi.188.1643881669377; 
 Thu, 03 Feb 2022 01:47:49 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id i3sm6713908wmd.30.2022.02.03.01.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 01:47:49 -0800 (PST)
Message-ID: <3b540a6c-c006-e431-ac63-23e08d1e3546@redhat.com>
Date: Thu, 3 Feb 2022 10:47:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/3] drm/panel: Ensure DT compatibles have SPI device
 IDs
To: Mark Brown <broonie@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220202152352.20342-1-broonie@kernel.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220202152352.20342-1-broonie@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Mark,

On 2/2/22 16:23, Mark Brown wrote:
> Currently autoloading for SPI devices does not use the DT ID table, it uses
> SPI modalises. Supporting OF modalises is going to be difficult if not
> impractical, an attempt was made but has been reverted, so this series
> adds SPI IDs where they aren't provided for a given modalias.
> 

Yes, that's only possible if all the SPI drivers are fixed first to make
sure that all have a proper OF device ID table and will report a modalias
if we change the core to report a OF modalias uevent.

And we also need to fix all the Device Trees to have a proper compatible
string "foo,bar" instead of just using "bar" and assume that the SPI core
will report a MODALIAS="spi:bar" even for OF.

I was able to change this for I2C after commit af503716ac14 ("i2c: core:
report OF style module alias for devices registered via OF)" but it was
a considerable amount of effort.

For the whole series:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

