Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2296B22FD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A55110E7F0;
	Thu,  9 Mar 2023 11:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B9710E7F0
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=Y0w9WY0anRnaOp5s5PVvSnqnK0gUmSfQDPj5w7KRjHBA9isrVwZCevt0G13wpgMz5zKWs5
 u+hrjU8ksyk/DJxBACl24ZHXKRoZltK9pOdOjn3sn/zpPvvhNsdYIwAXpYnd41d/Vy6yBa
 xTqWMM3TgbGklMK0X2X4eODs1ytlQJk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-402-NunqkXTxOF-yT9-PAaGztw-1; Thu, 09 Mar 2023 06:28:43 -0500
X-MC-Unique: NunqkXTxOF-yT9-PAaGztw-1
Received: by mail-wm1-f69.google.com with SMTP id
 m31-20020a05600c3b1f00b003e9de8c95easo547549wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 03:28:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361322;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=afA9Pj7B75HlWLceqRyEZy/GRi+OotqbkPNIOLAXy0MKC0tl3ROm+3bmSgPz4mslpk
 Bz9mnUTvpkc2veLFFwcBklNH2h4kqOqQK+FnRuQlJCNG0+ndkgbibxuAP94W4K4cjw8A
 XG/m9od5F3uwlPAOSoop9G8GQHE0zQWoQRPj2fEly4WAif+NfPrtXlYviGb5wPqBop0l
 kUhd9gk4vcnFzC8dNMe/vfm5LX7OpdtRrkMfGdlVBR8Nhsd+ZPe/PoFQgJcc73/pRuw5
 zcyFksFTF7uBQO8TNSSoWGBkXtB6EcJXYL/I2um/TQZ4NCo3R2bHPh9Wsy0vXhhTYC5n
 PtBQ==
X-Gm-Message-State: AO0yUKVr9yKwE647sS7AoBFs2CQ5UMIeNsI+0A8/4J93pVEK7OukZJBd
 H2ndQ9/ruAnjCL7097uQuGsBN/LHFdOiseAxM1j37WHl+uPZMKb9s2J7ftddkbexFkBLm3vuvWm
 waNBcJFa3NME60CvKB423FsovLCQ/
X-Received: by 2002:adf:fb51:0:b0:2ce:7219:42b8 with SMTP id
 c17-20020adffb51000000b002ce721942b8mr7244760wrs.32.1678361322366; 
 Thu, 09 Mar 2023 03:28:42 -0800 (PST)
X-Google-Smtp-Source: AK7set8Mn2JIY54bbfAArMm1jwHLD5d38GNHioh3xaVKkpiDjrBseSSAAHghi7SxByPhaXqMV5nmpg==
X-Received: by 2002:adf:fb51:0:b0:2ce:7219:42b8 with SMTP id
 c17-20020adffb51000000b002ce721942b8mr7244719wrs.32.1678361322054; 
 Thu, 09 Mar 2023 03:28:42 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c22-20020a7bc856000000b003dc4a47605fsm2372395wml.8.2023.03.09.03.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:28:41 -0800 (PST)
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
Subject: Re: [PATCH 21/22] drm/vc4: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-22-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-22-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:28:41 +0100
Message-ID: <878rg66u52.fsf@minerva.mail-host-address-is-not-set>
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

