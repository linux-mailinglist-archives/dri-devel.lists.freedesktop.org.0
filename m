Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49BA50B737
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 14:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89D610F6F6;
	Fri, 22 Apr 2022 12:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410D010F6E8
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 12:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650630367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GiJnuK5MK2gbET4isr9+5JELVuxzxjWJ5jlSr05wl0I=;
 b=SXeUh8kv5NRQU9Q+xlvHvAMhBjmMgRIHr+I4HfbskKohdWpbsIMRfs5scwYjH9N1/YrC3F
 4nE168K4ql3KmtUUBqxWgiF1RefYyvm9EDCLcXBe1OQpsM04fF+mtlnulWEqPig8bhh65/
 Tlz1PP/bmpTz/3/L3SRe2RBBwD8zEAM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-X3d6iLKKMPiZtNs0ezyYsQ-1; Fri, 22 Apr 2022 08:26:05 -0400
X-MC-Unique: X3d6iLKKMPiZtNs0ezyYsQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 w4-20020adfbac4000000b0020acba4b779so431928wrg.22
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 05:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GiJnuK5MK2gbET4isr9+5JELVuxzxjWJ5jlSr05wl0I=;
 b=gdkI9/IUqWnGBCqQLpVfFEeTlP1WvZvklWZU58APYONAtMwrofrFI+Z+igF3GUODSI
 d9OmvGyP8urM+4PVNJpd6KeADkoYr0NLyUMQh0v1H2t73Z8fuGZuCz9fnEUi5qbfkUqO
 lA74SOjtrFaFKGnDsy2w8lx5I349Q5h3xeaeI1K1PVfNOQ4OEV7JWR0feBAahKuGXduv
 4pYakWRTioi+PSvkb1EEaz6IOzf0klOZ+7zcKbGTYd0JKmED/3a8rA1s676xOC0tnnx1
 CNHBhcyvYyv+X2RjquAQUcqJuyJi1UyBObpw3yOH6Zrw+fMkG93O9A4NJFrMMbqAwWtt
 qRww==
X-Gm-Message-State: AOAM5337trNATdcxWNgMNRjsJ/kka+dVUonoXYZlQ8/0nSU3TMP+MPJ+
 9b0bSfDYEKtuI/DQDrS4iYO4jNSmpbvE427oQz4PEzZYVPkV5w2+nSV8D2TORw7IReOCsy8tXmS
 vPEJOPPYyesph7Sc7/UykfAwkAD5O
X-Received: by 2002:a05:600c:2307:b0:38e:bf05:677c with SMTP id
 7-20020a05600c230700b0038ebf05677cmr3974801wmo.44.1650630364812; 
 Fri, 22 Apr 2022 05:26:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJXJQ2tplSAlu26DYXWxSf61A0lExbyoX2UvF1svE+WUyRptXTAYeQePCTSRT3mWBUARmHxQ==
X-Received: by 2002:a05:600c:2307:b0:38e:bf05:677c with SMTP id
 7-20020a05600c230700b0038ebf05677cmr3974776wmo.44.1650630364553; 
 Fri, 22 Apr 2022 05:26:04 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a5d584b000000b0020a8d859e5fsm1738626wrf.10.2022.04.22.05.26.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 05:26:04 -0700 (PDT)
Message-ID: <96127412-f797-44e4-8b4e-b91cda84108b@redhat.com>
Date: Fri, 22 Apr 2022 14:26:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/3] drm/format-helper: Add RGB888-to-XRGB8888 conversion
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 tiwai@suse.com, tamara.schmitz@suse.com
References: <20220421181722.13936-1-tzimmermann@suse.de>
 <20220421181722.13936-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220421181722.13936-3-tzimmermann@suse.de>
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

On 4/21/22 20:17, Thomas Zimmermann wrote:
> Add a format helper that converts RGB888 to XRGB8888. Use this
> function in drm_fb_blit_toio(). Fixes simpledrm output for this
> combination of formats.
>

I think the examples you have in the cover letter are quite illustrative,
maybe I would mention an example in the commit description as well.

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[snip]

> +
> +static void drm_fb_rgb888_to_xrgb8888_toio(void __iomem *dst, unsigned int dst_pitch,
> +					   const void *vaddr, const struct drm_framebuffer *fb,
> +					   const struct drm_rect *clip)
> +{
> +	size_t linepixels = clip->x2 - clip->x1;

drm_rect_width(clip) instead ?

> +	size_t dst_len = linepixels * 4;
> +	unsigned int y, lines = clip->y2 - clip->y1;
and drm_rect_height(clip) ?

> +	void *dbuf;
> +
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

