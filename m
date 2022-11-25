Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4666388F0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 12:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE0110E73C;
	Fri, 25 Nov 2022 11:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E25510E73C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 11:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669376497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FOhIdeO2viHCtBqTf2iYEwnXDI6Ezk/3Vbjgspkc6Ig=;
 b=fQ8FSKLMo/9FzX66VsUZH9cl6JmjvCHo88SLd68S5BTUFfFCHvRtIfMJIGzPl7DXh4CAe5
 h44L02BwaxAIN8/xdlozGK71V0kWQuN4uiQ7SB5aP9lBZ1aN/fmXy9TDk414P3bPJ5POWx
 6eN5FraJVuDgJq+iCE8JWvOJZ8gGVAc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-400-pS9AjFm2Ni-WTCk2AzDFXg-1; Fri, 25 Nov 2022 06:41:26 -0500
X-MC-Unique: pS9AjFm2Ni-WTCk2AzDFXg-1
Received: by mail-wr1-f69.google.com with SMTP id
 v14-20020adf8b4e000000b0024174021277so803901wra.13
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 03:41:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FOhIdeO2viHCtBqTf2iYEwnXDI6Ezk/3Vbjgspkc6Ig=;
 b=hDr3vu9RUj2EOFYwqc28ttKz9abtpxmfEnYdAJKf3Q/+dXkZ2dgnoOUWB4TMf3NNVt
 s0d3ol5itCUf48QxdVh/UMbsVEzgznU0r9Y3AvIGSgw0NTviTFOqVUzxo/DKjNsxI6qr
 gbz4q2MmOv8uX7vj2FXUh67pKaNQU08y4rIcNRHuLz+AkAxi0GzlnSJ8d4Pnx6XvOpHY
 hHC0+Ge4nc/er+4lTQh2n1B4RlOlC9OyDPD1IidB4kCuhw206oVWFbnmDWI3D6iDugQP
 /E2YHwGHA9UJ10Ezg3yo5XeOT9TTkjPuVQw28y2Nf0E+iJ4bQ+NHKn+AAryIvqMUQcvt
 e9mg==
X-Gm-Message-State: ANoB5pk4QXZn+etX+CocC4SBLdLE85qtKEf5cwNca8RVs4/cAJyIublL
 wFlUeGrYJ8jYbpXDSjPyUstB8ovCgwEPgW1ts1/Btf7nrOiY3QnBVkr0phE3/XcMR5M2wPp+sm4
 7Ak+LBwWEaELa8cHS1PQ6IBQJJVnT
X-Received: by 2002:adf:e34d:0:b0:241:ee4a:2301 with SMTP id
 n13-20020adfe34d000000b00241ee4a2301mr7222681wrj.429.1669376485539; 
 Fri, 25 Nov 2022 03:41:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7XK7j/pUPAtmTo6t54sJnnyf1J8fqURJI79qjd/c5yPhwa217razm52j8W7b414NZu8YvG6w==
X-Received: by 2002:adf:e34d:0:b0:241:ee4a:2301 with SMTP id
 n13-20020adfe34d000000b00241ee4a2301mr7222654wrj.429.1669376485339; 
 Fri, 25 Nov 2022 03:41:25 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 he6-20020a05600c540600b003cf4ec90938sm4846070wmb.21.2022.11.25.03.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 03:41:24 -0800 (PST)
Message-ID: <a39d6b1f-a496-d293-8f27-c17d30d6c0b5@redhat.com>
Date: Fri, 25 Nov 2022 12:41:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 21/24] drm/vc4: hvs: Provide a function to initialize the
 HVS structure
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-21-051a0bb60a16@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-21-051a0bb60a16@cerno.tech>
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

On 11/23/22 16:26, Maxime Ripard wrote:
> We'll need to initialize the HVS structure without a backing device to
> create a mock we'll use for testing.
> 
> Split the structure initialization part into a separate function.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

