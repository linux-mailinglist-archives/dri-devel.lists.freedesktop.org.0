Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A90254D2FCA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 14:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739F410EA61;
	Wed,  9 Mar 2022 13:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A524110EA5B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 13:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646831785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9L4wXSzrzpGMIVEQW9rtUhalBtem2aX0icrd1WDGeA0=;
 b=TkP7KNWluANN8eo7El/ggpBqaotJA48FRSHZmko3g6GOdHCgSMV736ezgKTyOnocJ5UOCs
 5JjCpqvfvPfx57wQ3zYo2w1hgYXNxKXbCKdNcIrsq397ppfHI3fH38/CQv/dQdnnIfx8Qz
 fPdwgZjwK2+1j0o3/sOeA9SpUEx3tFw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-0_jCCRjoPoqJYY4OuQNcRQ-1; Wed, 09 Mar 2022 08:16:24 -0500
X-MC-Unique: 0_jCCRjoPoqJYY4OuQNcRQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 h11-20020a5d430b000000b001f01a35a86fso751355wrq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 05:16:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9L4wXSzrzpGMIVEQW9rtUhalBtem2aX0icrd1WDGeA0=;
 b=g4V8k1HGPf19x3D1kWYcFHYmTEsGsFn6NeIYGwKF7AdAl6TBmPtQEH/Fr2/YWaLQBs
 5XRTskaKkhikOzMD4Z9qce0qJdBvMK+fob7Eh4k7IP8IqfLYSM/9Maw7n0nG9RSxX2iG
 dNt8sYIMVVl6SpR6ypBdRqj6yiBkVHmalfi4KaF3rS/UopzkZNfSFM8CBF5jBUUN6Nzq
 zBrlYX7hzChSiDHPxkzXsKkcaBzV4Op188v/ufWgvjBbphjH7vepqkG06nH+Zzu6FK4E
 2uj0YiR6Xqj8mtGFWAhKh5WDI7/mhnyqxyRtKa7e0zj4fTv0lIoo+vV63cR9orAiFzvv
 IwCw==
X-Gm-Message-State: AOAM530/tYqKR00joOl2UJrvkA1dAbISRpEKdAOu1LyrKZFDBwH6ZSU9
 J09CT0WcdnhorzSkJylzEKS2R5FTVS3yZMVJQ37sS9YRSx4HYjRVR2F+jNQGhb0xz3+Cs807Fym
 MCo3AhyW6i2ldmB3UfsnWC2nTPWsj
X-Received: by 2002:a1c:a4c6:0:b0:389:7269:5044 with SMTP id
 n189-20020a1ca4c6000000b0038972695044mr3162292wme.129.1646831782862; 
 Wed, 09 Mar 2022 05:16:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLVGtK4mTCwqDFDUxuBL3MHtSqW+jHIdMFxcBe9+YpVz8cxRLKpK8ygkT8GVaau+FzvEgBlw==
X-Received: by 2002:a1c:a4c6:0:b0:389:7269:5044 with SMTP id
 n189-20020a1ca4c6000000b0038972695044mr3162281wme.129.1646831782620; 
 Wed, 09 Mar 2022 05:16:22 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 t184-20020a1c46c1000000b003814de297fcsm4964440wma.16.2022.03.09.05.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 05:16:19 -0800 (PST)
Message-ID: <d9d8b17a-26a2-3c34-7308-539d5b08454f@redhat.com>
Date: Wed, 9 Mar 2022 14:16:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 RFC 07/10] drm/gem-fb-helper: Use actual bpp for size
 calculations
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>
References: <cover.1646683502.git.geert@linux-m68k.org>
 <842ab0a286ff743b625277e655d9bef505b630c1.1646683502.git.geert@linux-m68k.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <842ab0a286ff743b625277e655d9bef505b630c1.1646683502.git.geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/7/22 21:52, Geert Uytterhoeven wrote:
> The AFBC helpers derive the number of bits per pixel from the deprecated
> drm_format_info.cpp[] field, which does not take into account block
> sizes.
> 
> Fix this by using the actual number of bits per pixel instead.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> RFC, as this code path was untested.
>

Looks good to me but haven't tested either.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

