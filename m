Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1315467AEDE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 10:53:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3BF10E758;
	Wed, 25 Jan 2023 09:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE3810E760
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 09:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674640377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c6cPchqoXvC7fz4HOb1ChIaitTq8x3iNoLBlJaQ4TwQ=;
 b=Y8D9ZDaU2VeKcDBmNH3Y+iRlnmdJE0VM2bO32BAMlhJtiUGIg/H9SL/yMx87THnHrztOJV
 soXzOlA34baq59iAfmSrjgjrpGsO8Uwrru8MSaIaQ/hMi2XF4gZpsVUTjSOo6uURhAyu6v
 fBDhccpYdXXyGZlJOvODYd2fuEpyAVA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-232-eq0nlCbfPCyjXtuZnhiT-A-1; Wed, 25 Jan 2023 04:52:51 -0500
X-MC-Unique: eq0nlCbfPCyjXtuZnhiT-A-1
Received: by mail-wr1-f69.google.com with SMTP id
 v15-20020adfe4cf000000b002bf9413bc50so2255801wrm.16
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 01:52:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c6cPchqoXvC7fz4HOb1ChIaitTq8x3iNoLBlJaQ4TwQ=;
 b=cym/+CTCCRT7+9GYpg3Ei0AeLuFQ5kBkHirjDJHobTDDSEEzfVUyGHWb1prdP3/mjb
 Z0FANnAuGpchQBsWcOr7fgGqG3GZ13oZTJputEVfCe4Wi5ecmAZttOMzK/A0NJVf1SKw
 Kt7bBKkZskPKS2oZq9vGf1YYf50Go8yBEoVGhlCNRH3B5gFTvVG/JAy/Akm6fnp/GmFY
 t295jYDJMi8fbaajKmyU2iyRaWzAFygANUBRnLYN2EnZ0QZbX8VRuCVHyRKI/DS1SIDs
 rHGlWM/dBGtIcCVdGgHmq7jybJT4BL6Caox5QqEIOlaRzPtoZbPmbd7u791XBJ1eIbHn
 MDlg==
X-Gm-Message-State: AFqh2kpC0oizv7Bv/ddWErGFkJG8NCwH5ueY0zYfx+QoHr3dM/P5JypR
 A4dkT9qzkzh26Koi1Kmjl3v5SDWs3b0tJmFkd+tsdimHfWhqdIS89P52BrGXfZTyqd2JJObzklr
 wPYPNfGraNOG3rlteErmd7Q94dJbM
X-Received: by 2002:adf:df10:0:b0:2bb:e891:1829 with SMTP id
 y16-20020adfdf10000000b002bbe8911829mr26349577wrl.4.1674640370486; 
 Wed, 25 Jan 2023 01:52:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuvmq2QmH2lib1EOjSoV1HyQPmQn7B/0nRysa3FFY81sXz4YqkvR1qkRuVsXj3rXTMZ7umf1Q==
X-Received: by 2002:adf:df10:0:b0:2bb:e891:1829 with SMTP id
 y16-20020adfdf10000000b002bbe8911829mr26349557wrl.4.1674640370241; 
 Wed, 25 Jan 2023 01:52:50 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q14-20020adff78e000000b002be07cbefb2sm4747862wrp.18.2023.01.25.01.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 01:52:49 -0800 (PST)
Message-ID: <8e5bb4ed-11fb-272d-4d70-f25252a0c5c5@redhat.com>
Date: Wed, 25 Jan 2023 10:52:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 09/10] drm/fbdev-generic: Inline clean-up helpers into
 drm_fbdev_fb_destroy()
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-10-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-10-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/23 14:40, Thomas Zimmermann wrote:
> The fbdev framebuffer cleanup in drm_fbdev_fb_destroy() calls
> drm_fbdev_release() and drm_fbdev_cleanup(). Inline both into the
> caller. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

