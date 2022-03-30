Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1F94EBC6F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 10:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89A910F702;
	Wed, 30 Mar 2022 08:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E8A10F6FE
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 08:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648628029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HQPuWgLoRoTp90wEQ9Xtp0ulgJk21eQMJQd8WGI02EQ=;
 b=aJaZVkgGkarjgoURertF2qMnmNKl8UAFFJwNrL90KaDpixg+iOo1EeM8M5X8/iV8/haO43
 SkiCLdkDhbuKd7G/L0xaOzJUJVKMKOHZGcZWGdWksB7hhG0k5RCXFbvoSdkSIAEcH8Nq16
 MLSiMGWo9OzZwAtYADugTg8TtvGyU5o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-LFEuO8VhM22k7BrIFTp4Fw-1; Wed, 30 Mar 2022 04:13:46 -0400
X-MC-Unique: LFEuO8VhM22k7BrIFTp4Fw-1
Received: by mail-wr1-f71.google.com with SMTP id
 a17-20020a5d6cb1000000b00203f85a2ed9so5682841wra.7
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 01:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HQPuWgLoRoTp90wEQ9Xtp0ulgJk21eQMJQd8WGI02EQ=;
 b=GeQ91pD2AL6aUGY9pChhz+cZCW77icplKWTJmhiTSh+/Ep6j0A3avL+hk8lZR1P/9z
 Txuau1wWTZviJIZ7jC5E6cVnFcbeXAXs0T6izHcKZpe7m04voQpwNQj9QDlzBvaUv+GO
 Q7RorBlXZzuPa2Rh7z9CqEyoX41YTrKJ5FfYN/32GyDh5mIZ55Qr+gzAH9mzV4J1dcqa
 NXKXWFEygqw/+OrK10QZhJUlCkAkXRzaULIqLOHKaEvbdnuM+7R7iru2dI+WFjk6n81w
 gDUIQKA2jqs7EYSG2rofGwa30wJgJN8LLdUiajhocdMZGVx312e8OIce6fHN+hyZk9GL
 0aCw==
X-Gm-Message-State: AOAM532+99fWQ0IQjDxcPJ1Mw99kC04ykwABxDOozLmGIj1THs0Z7yn9
 5C1k8PGW593ZFN1Gy/oq4jUN2EBKhUeC3fZfjtkhnq9xS4RoODlbH8M9QCtlLfFWznj9n0f+xUF
 Nz2fi7ZxvkBG85kMkJUWcmzb9UvTZ
X-Received: by 2002:a5d:4537:0:b0:204:b35:fa8 with SMTP id
 j23-20020a5d4537000000b002040b350fa8mr37726637wra.430.1648628024930; 
 Wed, 30 Mar 2022 01:13:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxs5fSgWNOPKYGwnRhe4T6+dD6Jt2RymGK5PayLMU+WMOudh4Res2ml2Ni65p4H/adISWs47Q==
X-Received: by 2002:a5d:4537:0:b0:204:b35:fa8 with SMTP id
 j23-20020a5d4537000000b002040b350fa8mr37726621wra.430.1648628024677; 
 Wed, 30 Mar 2022 01:13:44 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a5d5849000000b002058631cfacsm17578248wrf.61.2022.03.30.01.13.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 01:13:44 -0700 (PDT)
Message-ID: <6cc0f944-890c-db8c-3c61-377ce9238a1c@redhat.com>
Date: Wed, 30 Mar 2022 10:13:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/8] drm: Put related statements next to each other in
 Makefile
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220322192743.14414-2-tzimmermann@suse.de>
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

Hello Thomas,

On 3/22/22 20:27, Thomas Zimmermann wrote:
> Give the Makefile a bit more structure by putting rules for core,
> helpers, drivers, etc next to each other.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

This is a nice cleanup.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

