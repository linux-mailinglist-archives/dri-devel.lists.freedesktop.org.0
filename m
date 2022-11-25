Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 643E8638839
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 12:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5A310E726;
	Fri, 25 Nov 2022 11:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80F710E726
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 11:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669374336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kvo3ByqVNYtl4Gj5V4V1EtKWGChjY02VeHw9i+vXN5I=;
 b=csK1oD8ghBjypxEqk++nWDE5MiAKqKiNp9Uhz6kz09LvFIcAeEpzHitBY9i7/rC3UVnSMA
 OCI5IgIMdDsaZp2xcjBF4vidgMoPLnZwG1JV6SIHtyOLiW1ABAQz83kqAYoAeftm5dzIV/
 R+mzyvBwrQJf5CBQwL/6z1gW9DLLP0c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-554-HUiDMznjMVyF7QbFc1D_Xw-1; Fri, 25 Nov 2022 06:05:33 -0500
X-MC-Unique: HUiDMznjMVyF7QbFc1D_Xw-1
Received: by mail-wm1-f69.google.com with SMTP id
 h4-20020a1c2104000000b003d01b66fe65so4046993wmh.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 03:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kvo3ByqVNYtl4Gj5V4V1EtKWGChjY02VeHw9i+vXN5I=;
 b=Kotfg2KTYVpzocFFPKCmF05u2RUhaT7yNRT3ENvOTNm8JXGw8CD+miS65jyOVzWFS3
 0AWE7C5rbSoRkbSNb9PFlSpyCk8H9tTWAd2sIZqvH7RrztzCCpmgfIHOLkP9/KRiLrLp
 xoIrFjqNB0wD6YOd3ha/6cwUw5LXOVzdX3bKp7F56jKdFQ1kOVedUmnIUSAFlt6tQS+s
 t47SnGkJ0MdL8akcaAMv+gpbsEdOtNXp0jCGMFgGMt706AD9OLQQjM7wGWAyz8XBXY1j
 NvDN+EPHgu9kZgHLnDP9LP9MsMl4nzydGiBo+4KzARz13aPiXy0aOKtIf+EugCtgNXfZ
 A+Cw==
X-Gm-Message-State: ANoB5pnRvfUJ9dTRZDKAN1fXXpvAiIxJv8gU9UqBARcrpLdl0msw5v2X
 svD5C08uGyM/3eMRrVL4+SRL7EI2WX5ukPmlf2BFASEufyx1zqGe9QpMl7KSvQ2wAzYhVcbS+pT
 bOkwaE7mzEwmWYglir+Djt4U2sHX1
X-Received: by 2002:adf:ce05:0:b0:241:ea29:fa06 with SMTP id
 p5-20020adfce05000000b00241ea29fa06mr8120164wrn.594.1669374332183; 
 Fri, 25 Nov 2022 03:05:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6wTdp2+VuVoE5mvN2PyA3RkmkpVRnCk9tCcFb4MGlJIpqCV6lnFcIqScH72xr3oR/swXwGWw==
X-Received: by 2002:adf:ce05:0:b0:241:ea29:fa06 with SMTP id
 p5-20020adfce05000000b00241ea29fa06mr8120136wrn.594.1669374331867; 
 Fri, 25 Nov 2022 03:05:31 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f13-20020a05600c4e8d00b003c6c182bef9sm11765978wmq.36.2022.11.25.03.05.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 03:05:30 -0800 (PST)
Message-ID: <0c5c0fa9-7223-2855-04e8-5ce264b873e6@redhat.com>
Date: Fri, 25 Nov 2022 12:05:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 13/24] drm/vc4: kms: Constify the HVS old/new state helpers
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-13-051a0bb60a16@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-13-051a0bb60a16@cerno.tech>
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
> The vc4_hvs_get_(old|new)_global_state functions don't modify the
> drm_atomic_state passed as an argument, so let's make it const.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

