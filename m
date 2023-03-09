Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0056B22D2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F3E10E7E7;
	Thu,  9 Mar 2023 11:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613C110E7E7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=a+Zt9OltAkkNGKt9MD83wZG9X8YtxH2RptqjLLcw5oZU/W8sm+5MBUtiI8M+iY1pY0Fl2I
 Sn0BnnOS2FC6euh29XHZ/0CIzRAn1eVKgpbLd4a+jBPFvJOMbOebhmGJKxP83IRnyTSEuz
 5C3FfGsWhNylJDNNbzB8yc1p1cNF29o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-CEQ3QOImPJe08Iy9YvND0w-1; Thu, 09 Mar 2023 06:26:12 -0500
X-MC-Unique: CEQ3QOImPJe08Iy9YvND0w-1
Received: by mail-wm1-f71.google.com with SMTP id
 c7-20020a7bc847000000b003e00be23a70so2259723wml.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 03:26:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361171;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=z90TI6kbQq00EkqNdImkfRSy6KnNJ/nN+sGsss/Pl62zOtvXs7fX+cHQB3IVurhk+e
 QUP1iOtZ2kFm63XN2XRglULu8Rj9UJFz/YxmUQ91KTcoq9QiqNbcwHApqFkbJ4Wt18I+
 23joTWU2gimONMbvUWipluNmHPkgEaBiy6nLjLRVXB+H/gd3qKze3pjhphD/WJAvw6bx
 YkNzottF7eqfdGorN8mAb3UkMaRkL0tx4zPmERUi8p7EaAjqJm35UzdRr4bsUx39zL8U
 J8WC5Kf6/+pVtDsu3TLYxAfyVOth4rU3gfdtlqzS9Fjgr/PUFtH8cGupRxWUldeqNeW5
 D72w==
X-Gm-Message-State: AO0yUKWuFLC5QEPg0mwMrf9JajOFtMLrZ3S6FgtTsRH8me4KUbCvgJiM
 euia8KK4bivwRPFdaYGU6ku+o2D6nHTyyl6HvcyOxFYI6ORe/ioUAFUHcP9aSn1d2NK/938ZXOt
 y/oCgkDPIAEopFZpVycs7QUfv0ZB4
X-Received: by 2002:a05:600c:310f:b0:3ea:edd7:1f24 with SMTP id
 g15-20020a05600c310f00b003eaedd71f24mr19249561wmo.39.1678361171516; 
 Thu, 09 Mar 2023 03:26:11 -0800 (PST)
X-Google-Smtp-Source: AK7set8P+TR8QVeZTPkvZUtmOPITmpd/ysZXzZ/aUrzjfnJhfAoMKaclBZMuBRrY3afv4leM7oxMzQ==
X-Received: by 2002:a05:600c:310f:b0:3ea:edd7:1f24 with SMTP id
 g15-20020a05600c310f00b003eaedd71f24mr19249536wmo.39.1678361171233; 
 Thu, 09 Mar 2023 03:26:11 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bi18-20020a05600c3d9200b003eae73f0fc1sm2297965wmb.18.2023.03.09.03.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:26:11 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, andrew@aj.id.au, laurentiu.palcu@oss.nxp.com,
 l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 p.zabel@pengutronix.de, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, alain.volmat@foss.st.com,
 yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, jernej.skrabec@gmail.com,
 samuel@sholland.org, jyri.sarha@iki.fi, tomba@kernel.org,
 linus.walleij@linaro.org, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 14/22] drm/sti: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-15-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-15-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:26:10 +0100
Message-ID: <87sfee6u99.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

