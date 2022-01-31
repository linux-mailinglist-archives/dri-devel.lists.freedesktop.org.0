Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DA54A532A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 00:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10C810E43F;
	Mon, 31 Jan 2022 23:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B6210E43F
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 23:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643671502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sOB8RYRPIuXt9XuC1duDz579Ebb678cvofpXB4sR8RI=;
 b=Rn23NxkCQunRrrSeTd7hGJhkH7SXnGY7iwt7V0xNmey1Kv1ixB9n6z7ALW1ifSMQkz2dYB
 +P35ftGTE1L2Uu9bO7Yq9Z5QyCgAxlsZhrbavxod2JOyclu64ZvhSB5stg8exvLYCc/EjT
 UM4MKZW64+wja7opxherNr8cI1p5p9k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-OkuCcM2xNv-nbOKrsyU5Kw-1; Mon, 31 Jan 2022 18:25:00 -0500
X-MC-Unique: OkuCcM2xNv-nbOKrsyU5Kw-1
Received: by mail-wm1-f71.google.com with SMTP id
 f7-20020a1cc907000000b0034b63f314ccso276828wmb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 15:25:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sOB8RYRPIuXt9XuC1duDz579Ebb678cvofpXB4sR8RI=;
 b=fdQ1VCV3l/VptZi37tdQoH9g13Mjzt9iOM9aEmMrfsTX84OtfCrBvIU2Jfa3ulzAIt
 hOJ00cVvv4bzvzCzVoooCDInacjT8fGkVFwIn0z0GvU7d6Q+Lp1r4FMCUsd8PRscK+f7
 c75Iv8D56d8gqUzJgeZTLSAD13pdV5PUXg+LDh7M6jvEcukMfte+Mnsz9OyHXKbe78Pn
 +MeRAtdqTxG0hGaIwUYiNjnzpLcFDXUgz1Yy11Or5ivnDASMlwa/KgVht6i3VEh9xMm/
 3QgrPhUY++gVE4oj33ksleLomqAMW2bTKZdiwCL/xoJTqVIBrGbalFthbGx7HHMaV4Xn
 4lfw==
X-Gm-Message-State: AOAM530qLVRGo5lg3P7EG+rF1wz0wTsI4fXzP7NbjXWp0pxah/qX6bHK
 2ezS57jf+uuGUfyxIOFnMDS/k8f3mM0yh1bqkOh6/UFSUIAyIRCBVvTVi0WxFSNwfhYekkS8/8Z
 Xcd3OwLaHun/lquUmu8D/my5Zbc0w
X-Received: by 2002:a7b:c0d0:: with SMTP id s16mr20585928wmh.169.1643671499289; 
 Mon, 31 Jan 2022 15:24:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXct5Vi006IAsnWX7pGg6l9TgY49Hkt7Zu/EEEoWSUyfvrEDOXAziQ+K8kEvGmrE5W4zQmHQ==
X-Received: by 2002:a7b:c0d0:: with SMTP id s16mr20585920wmh.169.1643671499121; 
 Mon, 31 Jan 2022 15:24:59 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id f13sm577284wmq.29.2022.01.31.15.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 15:24:58 -0800 (PST)
Message-ID: <9e9808c0-5a92-b2c3-c1c5-158608f49e6b@redhat.com>
Date: Tue, 1 Feb 2022 00:24:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/4] MAINTAINERS: Add entry for Solomon SSD1307 OLED
 displays DRM driver
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220131201537.2325487-1-javierm@redhat.com>
 <YfhKrznFzRmDcZa6@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YfhKrznFzRmDcZa6@ravnborg.org>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sam,

Thanks a lot for your feedback.

On 1/31/22 21:46, Sam Ravnborg wrote:
> Hi Javier,
> 
> On Mon, Jan 31, 2022 at 09:15:37PM +0100, Javier Martinez Canillas wrote:
>> To make sure that tools like the get_maintainer.pl script will suggest
>> to Cc me if patches are posted for this driver.
>>
>> Also include the Device Tree binding for the old ssd1307fb fbdev driver
>> since the new DRM driver was made compatible with the existing binding.
> 
> To avoid any confusion add yourself as Maintainer in the
> solomon,ssd1307fb.yaml file too.
>

Agreed. You mentioned in another email though to diverge from the existing
DT binding for ssd1307fb. If we decide to keep the backward compatibility
then I'll add another patch to the set to list myself as a co-maintainer.
 
> With that done:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>

Thanks!
 
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

