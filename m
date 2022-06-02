Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F90153C12D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 00:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B01112838;
	Thu,  2 Jun 2022 22:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB79112838
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 22:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654210766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vtC3/HRoHB3wvoKqlgfwWmQAUyakQjajXqU9GRPpbI8=;
 b=XZ3UTGEN1X6vb3NKuUKfdWSGz4vCCfo6jImNa/BOs/usi9Bun9eJG6Mws9cOCeQHOJBvsW
 jEhgH8EJwnnRmwUGwYT1JOtSdqNKHowJhqbRw6Qvl2qzGwPA0uWw9LSTVaLIesZAolTwRa
 nb2qdhkIXTk8m+LwnZWGpADU/KaR83A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-cTq6xF6cMTSnEOYNhFkFpQ-1; Thu, 02 Jun 2022 18:59:25 -0400
X-MC-Unique: cTq6xF6cMTSnEOYNhFkFpQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 j40-20020a05600c1c2800b003972dbb1066so5822754wms.4
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 15:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vtC3/HRoHB3wvoKqlgfwWmQAUyakQjajXqU9GRPpbI8=;
 b=T4J5N9V0+dFwV5jA3CsFekp60RsPIQL3xuQYBXdQ/ZQGG+vvQPFkacweZLycA1rI/c
 gdXvN386DChdssyaYAX0t3kl5euSm7qQFfN2EQ9abRhQISlEf5msOuxtCFjhmupMSRRq
 eqzFSsVEF0u7OV/0YXQLN/b/AA13QweIwQhnFvyi0ry3QsLFZ2bDGVZhk3wmKQGsMjiF
 Xi2ecvklsdTvs16xRh/AbSXu6MaXKVknii52yJR9GcriRWGDJS0LM++BsUw48AQYUzP8
 Orq4jPu5JNZHNpBcYSYipj4M3BhbGqKz7tVHSECRLuvCX28i1PkQGiHE92YvPV9zaZgJ
 NKvA==
X-Gm-Message-State: AOAM533Dls5jxGWIkNp+4PZN0Thlx54IbYi3UleiPugkp0UgmlY622A9
 EIChiR8naIfYY6Sc8URHBoa79ZtrsvxiozpKLaxW3zsDOUCnQ0NAREu1DfNxeUb4Pv2mUWGUpOS
 Nwq4sY9ZuyJqfiSlIC0lmGNb7uT8J
X-Received: by 2002:adf:f6d2:0:b0:211:f0bf:3d14 with SMTP id
 y18-20020adff6d2000000b00211f0bf3d14mr5614286wrp.264.1654210763874; 
 Thu, 02 Jun 2022 15:59:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKYdxQ6DSZ5lIk0yCb5r+1V1zpn+ZtWuF/mSEGqRZpplstmUUWsmoOJ05Vk6poEXASLfJruQ==
X-Received: by 2002:adf:f6d2:0:b0:211:f0bf:3d14 with SMTP id
 y18-20020adff6d2000000b00211f0bf3d14mr5614261wrp.264.1654210763679; 
 Thu, 02 Jun 2022 15:59:23 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l9-20020a7bc349000000b0039746638d6esm6535821wmj.33.2022.06.02.15.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 15:59:23 -0700 (PDT)
Message-ID: <8c000696-256b-e99d-0cf7-7cd28602c6a9@redhat.com>
Date: Fri, 3 Jun 2022 00:59:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 2/6] drm/v3d: Get rid of pm code
To: Peter Robinson <pbrobinson@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 bcm-kernel-feedback-list@broadcom.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 maxime@cerno.tech, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20220601110249.569540-1-pbrobinson@gmail.com>
 <20220601110249.569540-3-pbrobinson@gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220601110249.569540-3-pbrobinson@gmail.com>
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
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/1/22 13:02, Peter Robinson wrote:
> Runtime PM doesn't seem to work correctly on this driver. On top of
> that, commit 8b6864e3e138 ("drm/v3d/v3d_drv: Remove unused static
> variable 'v3d_v3d_pm_ops'") hints that it most likely never did as the
> driver's PM ops were not hooked-up.
> 
> So, in order to support regular operation with V3D on BCM2711 (Raspberry
> Pi 4), get rid of the PM code. PM will be reinstated once we figure out
> the underlying issues.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---

This makes sense to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

