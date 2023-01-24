Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8A167950A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 11:19:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14C510E655;
	Tue, 24 Jan 2023 10:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4BA610E655
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 10:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674555586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kFBSJTYS4mqW+/Iyf7kFDqa/R8NrKMamooZaSYF4kgQ=;
 b=AAPnV7SzAyZdxurT0hvUkHkbjwDon80UpiRgUtA0UoPfmGeWo5ERioDFkF5HssB9Bx642v
 s/oYp+jqpoJoECgARUEGZjPYfSEy80/Vj3ay0j2qm0ylWa7KpNSJ6VVZWXzxv8M67UBoSX
 Q/nzjoa6mE2oWncJyPDKh27w+wncrWQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-240-yPqEHbtdOnubSXbCKxjW1w-1; Tue, 24 Jan 2023 05:19:42 -0500
X-MC-Unique: yPqEHbtdOnubSXbCKxjW1w-1
Received: by mail-wr1-f72.google.com with SMTP id
 bj7-20020a0560001e0700b002bfb3c6ec00so61065wrb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 02:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kFBSJTYS4mqW+/Iyf7kFDqa/R8NrKMamooZaSYF4kgQ=;
 b=6oeNxJ94MYIRe/e5F0dPz6wdOKmkcZrg0Bk28rUmGiDnNzEKw32cOwAW5GIdVL2JQr
 iQ1Q8uHOsy7OLKbtqD5EhVwmPrz206Nuv9t1ivdLfE22iLBa+bZ7gZ80RwEphVFQcqw6
 souUE2hxIZObC20MJLIIK15cc3sTcC22qcR08vd1ttSDA14/hqfM+TsHg2azWJjc69+o
 b6LNE+COUxWacsanj1qwxlkKhLKpE2Ly3xXZoL6m6wiU/Ld2D5BOe40qsxrNxxSJiLPn
 +YffpOoKrWmhy0LCl7kWVnBP0j2QYwzq29yChBBbGeVG/vcKViKMizfKKXEW1D3pSEY1
 qosw==
X-Gm-Message-State: AFqh2kp1W7QGC8PW85I2Tne6TI2Lv/+g9BTNlbt8kerBBF/wiD9kMxdR
 dNj3vn0Fl11SZvKn0p0VYP3oyK1EroNqX9OlaIrcfgp1Uo9RQdp8i0Jr8UC3OBBxG/a/Gq6TZ31
 upWwk4edFiIhbcWaCm7t3pIY942D8
X-Received: by 2002:a7b:cc07:0:b0:3da:fcb7:39e5 with SMTP id
 f7-20020a7bcc07000000b003dafcb739e5mr26060896wmh.23.1674555581426; 
 Tue, 24 Jan 2023 02:19:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtZPN2eXbvlA0Xl1oaGY+fOsSR+lOHUd9zrk8Yqc+wK6G/pQS/HwZZm+h4/Y3cFpXHaao14ug==
X-Received: by 2002:a7b:cc07:0:b0:3da:fcb7:39e5 with SMTP id
 f7-20020a7bcc07000000b003dafcb739e5mr26060878wmh.23.1674555581208; 
 Tue, 24 Jan 2023 02:19:41 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003daff80f16esm18009383wmg.27.2023.01.24.02.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 02:19:40 -0800 (PST)
Message-ID: <83af8935-7709-0a0d-3504-5e9dcba1cacd@redhat.com>
Date: Tue, 24 Jan 2023 11:19:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/3] drm/fb-helper: Use a per-driver FB deferred I/O
 handler
To: linux-kernel@vger.kernel.org
References: <20230121192418.2814955-1-javierm@redhat.com>
 <20230121192418.2814955-4-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230121192418.2814955-4-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/21/23 20:24, Javier Martinez Canillas wrote:
> The DRM fbdev emulation layer sets the struct fb_info .fbdefio field to
> a struct fb_deferred_io pointer, that is shared across all drivers that
> use the generic drm_fbdev_generic_setup() helper function.
> 

[...]

> 
> Fixes: d536540f304c ("drm/fb-helper: Add generic fbdev emulation .fb_probe function")
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
> 

Pushed this to drm-misc (drm-misc-fixes). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

