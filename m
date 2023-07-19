Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B9F759F3A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 22:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0E710E504;
	Wed, 19 Jul 2023 20:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1D310E504
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 20:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689797029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XOM+wVNXILroEPxWjZwTznoH+LNSt31Zm8n0YzaUK5g=;
 b=hVCIj1AqeSGVYzM+FMrJ7EeX6FGwUnewATVn+Ft+iZitPRVqyBdP6G2dGRNJNeyG+VYmng
 xebzs6LMkQtxgaJx2C7obXMGhUfM+yAPQkh93A+6cwkBXjUZCcIz7yw5Xarw30QxRhXgMQ
 G5zAupgsl31eeb8BhpNP8JPgvU50z4w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-_DuQ2Vo5NuKu20E1DVijAQ-1; Wed, 19 Jul 2023 16:03:46 -0400
X-MC-Unique: _DuQ2Vo5NuKu20E1DVijAQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-314275b653eso12846f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 13:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689797024; x=1690401824;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XOM+wVNXILroEPxWjZwTznoH+LNSt31Zm8n0YzaUK5g=;
 b=Re4W/Vz2CMj5vElXPzp0q7RI6z7fGQyFKd3ISGMltzcZ4Q2MwnieIk/3/n/2qoHnGH
 mhuEk391+MapgXtJl4gA62HoIAdvyrUWtdUAYoqeb21KQWbObisGvLy5PkbHdjborZBu
 cXx85pExXnlUSWaOI4QLYoYj3KYjc6A9lkEloASoKqacykZ/2ra4AY49SMoh1UZTyoyx
 FoYcG6mVcNIY2FIRM0NdVAVjWcObyDMeHJy7hOwqKUOrF49GZyCnYOui+UxuilocRX9W
 vUTiNajluufK2f6bPvstoWeurfO3XCZ2g6k9H+1w0g/21SXzHFKtwctDv4Kid6l8H7Y5
 jA0Q==
X-Gm-Message-State: ABy/qLa+UgafOHWCv+aGyBNDbnwduv3hNgjwsxtMd30ePdi3J+vZp4Qq
 I1QwhemDfd8sFZL/eN8X7qDsbHTGb+p2noFRx6f2B/v4sCgtSdfrcZp3GIbGQqB92JRCH2NKjhz
 ZKzzeiSKQJAvzEAuLwtmholJoUw5v
X-Received: by 2002:adf:db0c:0:b0:313:f0d7:a46 with SMTP id
 s12-20020adfdb0c000000b00313f0d70a46mr789089wri.3.1689797024472; 
 Wed, 19 Jul 2023 13:03:44 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGzzDZoz+M1nWmzfGQ9tUM7klp05pIpgXPL8g9e6TDjrSUcrsAGwbAAePLAglpY5MtIGYFYpg==
X-Received: by 2002:adf:db0c:0:b0:313:f0d7:a46 with SMTP id
 s12-20020adfdb0c000000b00313f0d70a46mr789073wri.3.1689797024169; 
 Wed, 19 Jul 2023 13:03:44 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f13-20020a1c6a0d000000b003fbdbd0a7desm2373198wmc.27.2023.07.19.13.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 13:03:43 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
Subject: Re: [PATCH 08/11] drm/vc4: tests: mock: Use a kunit action to
 unregister DRM device
In-Reply-To: <20230710-kms-kunit-actions-rework-v1-8-722c58d72c72@kernel.org>
References: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
 <20230710-kms-kunit-actions-rework-v1-8-722c58d72c72@kernel.org>
Date: Wed, 19 Jul 2023 22:03:43 +0200
Message-ID: <87cz0nhdnk.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

> The *_mock_device functions allocate a DRM device that needs to be
> released using drm_dev_unregister.
>
> Now that we have a kunit release action API, we can switch to it and
> don't require any kind of garbage collection from the caller.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

