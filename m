Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B44C4A8A75
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 18:43:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E1810E96B;
	Thu,  3 Feb 2022 17:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8BF10E96B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 17:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643910226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OxABhuavx6RzP1ZLGgayyCmci7hjTDXuU4dFb+xxOQY=;
 b=HK4pawbXt9idns2XtMm84Maej5rb0Ubm0Rjx/Zi9nrrGPjjOaduFbKwTAP5iaTuB35UO12
 TjhNTV82DH+HhHcfHgl2CtDd2mscri8JrnR35CjnYaMd2EwoZqfhr+vHKbo28mSVpYv5vB
 85I76amyIFUWtR1yj2b/mm38fH/sdK8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-MXA1NRUQPG-m069PRyheag-1; Thu, 03 Feb 2022 12:43:43 -0500
X-MC-Unique: MXA1NRUQPG-m069PRyheag-1
Received: by mail-wr1-f72.google.com with SMTP id
 w7-20020adfbac7000000b001d6f75e4faeso960420wrg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 09:43:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OxABhuavx6RzP1ZLGgayyCmci7hjTDXuU4dFb+xxOQY=;
 b=YX/euiKALEKrpX2YL8QcS4U3mB5e339fO8P49psXeZ0PyiidH9/CHL9DuDVPJSafyP
 EYmcrtxhuKPmkcpdWoWTBhxyn+TNIWga6/LUvgApBducCaJOxJE/rHCAKlB0z2Tjna3A
 JBtCaQvK9wIkUvJNnWhOthkEXZMmeQ+oAKSFJhmr85hSPfySTQAJk0HqHVVlHEC1YqKd
 5+VitYW+LohWxKWjAKkJV0z4kO5AT+2YX4Bct7D1EzEitl74Huf9XkPFe5DIoDm1TQKS
 UApMQPLt2bx0RAiiKCa1O7nN62tKRr1XAq8ZWc54sBX2A2W1EMBp2qP7Xqbfy0038lFb
 oH5Q==
X-Gm-Message-State: AOAM532PvwfHPBMBcZZhrqJMc9K+bPS/r/yt9dp1uEDkbgorS8/rhwM6
 LOza+rcCcVarS108C3LDPP1SFLC81ns6kgfJOrJxYXLYF0qIQRN2Xec31Kv6u/8KlS5U/Q3NncL
 rhBHqVkhA/iYWXIcQBKsJeg80ePv4
X-Received: by 2002:a05:6000:144e:: with SMTP id
 v14mr2319496wrx.60.1643910222759; 
 Thu, 03 Feb 2022 09:43:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQ2lUvB1xvqothXFNOCkkUDc11kcEhyshzOh7buG4lTblv9zlq8o9CrYi1TSMCip5QYLiqsQ==
X-Received: by 2002:a05:6000:144e:: with SMTP id
 v14mr2319477wrx.60.1643910222551; 
 Thu, 03 Feb 2022 09:43:42 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id h6sm8173905wmq.26.2022.02.03.09.43.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 09:43:42 -0800 (PST)
Message-ID: <152111de-54d6-1574-ba7d-5f95fe9c97a6@redhat.com>
Date: Thu, 3 Feb 2022 18:43:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 6/8] drm/ast: Initialize encoder and connector for VGA in
 helper function
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 kuohsiang_chou@aspeedtech.com
References: <20220111120058.10510-1-tzimmermann@suse.de>
 <20220111120058.10510-7-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220111120058.10510-7-tzimmermann@suse.de>
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
Cc: jenmin_yuan@aspeedtech.com, tommy_huang@aspeedtech.com,
 dri-devel@lists.freedesktop.org, arc_sung@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/11/22 13:00, Thomas Zimmermann wrote:
> Move encoder and connector initialization into a single helper and
> put all related mode-setting structures into a single place. Done in
> preparation of moving transmitter code into separate helpers. No
> functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

[snip]

> -	encoder->possible_crtcs = 1;

[snip]

> +	encoder->possible_crtcs = drm_crtc_mask(crtc);

This is a somewhat unrelated change. It's OK because is fairly simple
but I would probably still do the cleanups as separate patches.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

