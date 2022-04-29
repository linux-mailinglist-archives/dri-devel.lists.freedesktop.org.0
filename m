Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8739B51432F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 09:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450C510FCC5;
	Fri, 29 Apr 2022 07:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B049910FCC5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 07:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651216889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KhufJyVKGuqE38/lC9MCkIJ+lznHw0RTCwOxniA4aiU=;
 b=bPfw/uPcSRlpZ4pWXmmKoCOWeY7wJ9DjOm3HrZ4n8k96FZa5Z8G6ndY0juDOahTs3YNAQV
 ThxDXQD95ghtB4EN1q65CfG3/c3up5jJExsXW8wQkI+f4GNywEGI3zrLBOo1dhnbiBnwNp
 0pBRnEY/Vp3VvaCw2bKtLUFZUbuj3+g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-Ar1U6ekqN2WYZO6prqUi2Q-1; Fri, 29 Apr 2022 03:21:28 -0400
X-MC-Unique: Ar1U6ekqN2WYZO6prqUi2Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 125-20020a1c0283000000b003928cd3853aso5410622wmc.9
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 00:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KhufJyVKGuqE38/lC9MCkIJ+lznHw0RTCwOxniA4aiU=;
 b=C76I9sxGzW6kFgBSCdO/HMQKdCaLFot8yApRbnoZ1eM40JzHlgNOu01UVPfakcSqU2
 kgDjU/jClMYc1jvN73LqKHsmC3d8E5FDmy+jmXTMmzEvst2MON3RRi0LhGJjFyJC1tpT
 mXuuuErDdFEMnOTnj2OmsLL0Z6mAtSeuG8J9Y8owuSvqtHk7mo5G/gRk3xfEZwgSzXie
 VfS4qJi0zmc3wLNmYC0+vvPfepopUKvxbc+cbghUfKDZDbP7VwTo/G+J7oc+8FkWt8nl
 b7XuPyjYsJpHswaM3xp8lvj6Mo5u4jdXzi9alLR8jwyQCeF2qVsLPmfIF6fQrLlys/tx
 2PSw==
X-Gm-Message-State: AOAM5316pIx9Dj1F99p2+iSyKX978fzbBpGxTl4ZyiUrchJWL3mOWq4L
 miC5iUnbG//E0tXm+YJ0ZCEhRFNp6YWGViXdboW7lZeXfX/d/UEmCaAPuIhFvjzmyod9czYbnhz
 nD8hkkHJvhanHDXLHZk0vgqyu9Mzn
X-Received: by 2002:a05:6000:178a:b0:20a:b841:e245 with SMTP id
 e10-20020a056000178a00b0020ab841e245mr28718381wrg.480.1651216887013; 
 Fri, 29 Apr 2022 00:21:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPIPWeMcZ7+EpP1llYZtueltVMigG+lBk12vAwzoZab7JmQCjpZ7LD1dreGefOAYkwb4N7lA==
X-Received: by 2002:a05:6000:178a:b0:20a:b841:e245 with SMTP id
 e10-20020a056000178a00b0020ab841e245mr28718361wrg.480.1651216886766; 
 Fri, 29 Apr 2022 00:21:26 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a05600c1c8e00b00393e9293064sm6276797wms.35.2022.04.29.00.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 00:21:26 -0700 (PDT)
Message-ID: <ac24d81e-f6c5-0763-909a-c15d223f1ea9@redhat.com>
Date: Fri, 29 Apr 2022 09:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 4/5] fbdev: Rename pagelist to pagereflist for deferred
 I/O
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch, deller@gmx.de,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com
References: <20220426120359.17437-1-tzimmermann@suse.de>
 <20220426120359.17437-5-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220426120359.17437-5-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 4/26/22 14:03, Thomas Zimmermann wrote:
> Rename various instances of pagelist to pagereflist. The list now
> stores pageref structures, so the new name is more appropriate.
> 
> In their write-back helpers, several fbdev drivers refer to the
> pageref list in struct fb_deferred_io instead of using the one
> supplied as argument to the function. Convert them over to the
> supplied one. It's the same instance, so no change of behavior
> occurs.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>

I thougt the convention was to have Suggested-by before your S-o-B.

The patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

