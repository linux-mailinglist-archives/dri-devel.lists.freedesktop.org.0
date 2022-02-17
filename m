Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 641FE4BA569
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 17:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5588910EEE0;
	Thu, 17 Feb 2022 16:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBAF10EEE6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 16:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645114126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gSNgd3NBGbRAvzenwNOV64Cro6VkQJQZh0aw1ZkF1FE=;
 b=ePB5hR4zKxbWMkypNnuUyXRHmeU6DfgNCZunCPqUd7hELECdAe/OSLfnsSGe77VtdR3C2p
 VbCpTNiGihmvgY9Gj919gZ66/MwxCpuxnKzJnfYP1aYuTGuHbhNyNkN+c1CpeWNsnZcdq+
 CNSAX4GRuvtXAhejtfluh6I9Sw7IL8w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-L4lOXpDIO8qMUfpiXWRAYQ-1; Thu, 17 Feb 2022 11:08:43 -0500
X-MC-Unique: L4lOXpDIO8qMUfpiXWRAYQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 7-20020a1c1907000000b003471d9bbe8dso2856508wmz.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 08:08:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gSNgd3NBGbRAvzenwNOV64Cro6VkQJQZh0aw1ZkF1FE=;
 b=iamzoHZR8KYu9Tu9kGVT3t1qnXePGnQ9hc8onO8RqPD8uV08I1DvVptG3fyGi0kmSy
 B66XfPN1jAIufScXvgNGqP2GXKvhBG+i/BJyTolF8Hnuf5jGdccqL66prNq0Co+QFa0R
 0PJ2PtB9lJf4s+oycCCwpC+VM1ELXYRJfHhmZAm3hQQe1fTC+rp+PTbJxR0RARvO617Y
 tGJVrM4fCtVIVb1RMMG5L+Qsk+xoB8I3Qq+TgJpStdYgkwWUAM3IJgpmhC1/Wm0I0uGJ
 EytpzrrTFEcqx94zyk3bUNxB2qyFgSMVCvJPMv4bJy7qHTJeSteKwZXXkVdZ0ydQTLnt
 /bYA==
X-Gm-Message-State: AOAM530KGtkaAK1ByT4fUbAZEub0FmLIefLot+7WZ24lRTo6tMbAGkZw
 96i+ZFSKPOwfSvS2w6PGsZG3hW17nOnlO721XVw4roosz5XhOz/5//jeM6redb8TYp3/6hYides
 UbAjIu85jLm6Vfjvw57v+18Sau5Z/
X-Received: by 2002:a05:6000:1e0d:b0:1e4:bb5d:4bd6 with SMTP id
 bj13-20020a0560001e0d00b001e4bb5d4bd6mr2868044wrb.676.1645114122152; 
 Thu, 17 Feb 2022 08:08:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuOX71Bm+a3U694aMeonYXmbzpYbesURVx6Ao74lAO2BkgvAS7ptVUjWBc12GZE1mcGMfkrQ==
X-Received: by 2002:a05:6000:1e0d:b0:1e4:bb5d:4bd6 with SMTP id
 bj13-20020a0560001e0d00b001e4bb5d4bd6mr2868029wrb.676.1645114121892; 
 Thu, 17 Feb 2022 08:08:41 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id y6sm16500763wrd.30.2022.02.17.08.08.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 08:08:41 -0800 (PST)
Message-ID: <683360bc-29d0-4426-03f3-cdec04c89b5b@redhat.com>
Date: Thu, 17 Feb 2022 17:08:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/vc4: hdmi: Unregister codec device on unbind
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20220127111452.222002-1-maxime@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220127111452.222002-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Maxime,

On 1/27/22 12:14, Maxime Ripard wrote:
> On bind we will register the HDMI codec device but we don't unregister
> it on unbind, leading to a device leakage. Unregister our device at
> unbind.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

