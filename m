Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B126387C9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 11:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BA310E002;
	Fri, 25 Nov 2022 10:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0327F10E002
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 10:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669373192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AhtxmsEdvR+vP3o5ErpJAl9TfXKJOalFPCGhKeyHyZg=;
 b=iWq6VWvVjCE2g3p4Gwn14T2OW0RbnrhuSB8UETuBGX/uigQus5OV7Hfmx+W9o3rJVRlkUQ
 lFSHTle3oHg+d4hqQwBLqi8fVrKru7XF1kRY46K2Drko5X67yvljNov03EwZTww1gKyz6h
 L2aCdzFpd4ZfDwPm/1U8x9i3Q//3AmY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-149-pIPJ_ULWN_y3xvCuV_PSCQ-1; Fri, 25 Nov 2022 05:46:28 -0500
X-MC-Unique: pIPJ_ULWN_y3xvCuV_PSCQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 206-20020a1c02d7000000b003d02dc20735so2276893wmc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 02:46:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AhtxmsEdvR+vP3o5ErpJAl9TfXKJOalFPCGhKeyHyZg=;
 b=vXslGijciUffJql5NDE7a4sHiLJF1z6K4RHXSdEuTro1pl0PPMKyV/81LW/jF5cxGZ
 L1LiC0eKPhoGtEOStupQx5JjAiUTlMKOZTPqFZeip2nwqwZhAExrrO94ETKkiAiPSWWt
 HhZYN6OcQSZTCPYjQetJgQa72o1Yi2klvGf49vENjTWKKKtRLMKUqrpx+qto4GM01cz5
 Y9WtYu8Urc1ucnzzvCjmP5VYFCHuO09lVEAuEru0vSb58LzYPacAK/E2xBXOJku3Dbjg
 Z6hZ57s/dILg5zXXQ8QEe+XSK/rUO0XFxIIkmQSLk8OGhCYK/49Zv+5Bgn+sUwjk7mYW
 4DNg==
X-Gm-Message-State: ANoB5pmUAANEwy44XmnjBCmgRhe7JANdFT6NpzGsEkECOsyncqMbl65D
 k9YSjM4tkW5amveIxDv+u8x47febuaPHZY5LKFbAgbandE+ixARK1fsfOzno2DfjmDmI4pABd3f
 wJtOdzUD85YdDTL1d+qwNdrqE8r0X
X-Received: by 2002:adf:e305:0:b0:236:6089:cc5e with SMTP id
 b5-20020adfe305000000b002366089cc5emr13952909wrj.118.1669373187604; 
 Fri, 25 Nov 2022 02:46:27 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4KaINgjKp/2wkkwi92QDcPVCibVYhE6To5a67U+PrJPM+QNYF8tla3vcgJY0rGOjh5rJYqvg==
X-Received: by 2002:adf:e305:0:b0:236:6089:cc5e with SMTP id
 b5-20020adfe305000000b002366089cc5emr13952885wrj.118.1669373187352; 
 Fri, 25 Nov 2022 02:46:27 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 cc18-20020a5d5c12000000b002238ea5750csm4218998wrb.72.2022.11.25.02.46.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 02:46:26 -0800 (PST)
Message-ID: <4aad755a-a0b3-cdab-694f-750c8903e5df@redhat.com>
Date: Fri, 25 Nov 2022 11:46:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 06/24] drm/tests: kunit: Allow for a custom device struct
 to be allocated
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-6-051a0bb60a16@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-6-051a0bb60a16@cerno.tech>
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
Cc: David Gow <davidgow@google.com>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/23/22 16:25, Maxime Ripard wrote:
> The current helper to allocate a DRM device doesn't allow for any
> subclassing by drivers, which is going to be troublesome as we work on
> getting some kunit testing on atomic modesetting code.
> 
> Let's use a similar pattern to the other allocation helpers by providing
> the structure size and offset as arguments.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

