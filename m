Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D3B956F72
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 17:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE9C10E2EE;
	Mon, 19 Aug 2024 15:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="g7nZgRWw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAB910E2EE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 15:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724083144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+lBBukJN6JiKBp75v/VlDPyHSmNFKIveb2GLDvy/Rr8=;
 b=g7nZgRWwLW9yGBbnvneopedzsuOWMd1pSJLf7gyRz9Qj/mxNZxRafktZi/tmMNSyZuP6BW
 Urqg6dqHVqRVdmTPvgSPwcYVcuw7OgIH3BA+mUfMfi3DVZWghGDOT3pA3hqRWkkMVPn8K8
 ZXsdzIaJYBzz7WMKgnv3FfHaYOLDqb4=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-4c_73D3cPQ61cElC-LoxpA-1; Mon, 19 Aug 2024 11:59:03 -0400
X-MC-Unique: 4c_73D3cPQ61cElC-LoxpA-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-201e24bd4d9so46098455ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 08:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724083142; x=1724687942;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+lBBukJN6JiKBp75v/VlDPyHSmNFKIveb2GLDvy/Rr8=;
 b=IXzjuEe2fVwkNXJ7o+oE48M66AVAQ8GiU4iKj0JjtukkQvuwggWlOskaMVA5VkW0cz
 BvkCniN6au/ZnIItRsCdxXmdaQV4iBQX8kOTQgBnMXckmVNAAfH1aiDQ387kXUipFl/5
 wFbmg8Xd7hK32S3lOOX33e4uWM4BZMxl57DldNyTzIKLuEU71gHj+ZQefIH2p/WBESnC
 dc1DWPkIV4kwZlLvk8C9q1eEhFF1ALKFWOljgIZ+fRlh8z+cTyxKJ8pYNWN6hli5Q9Dh
 s04iH0wnW1LY++NyPDgL4ImwBBB7cBsP8orslTRjgz3+uae2Lv2Jc6q0NvxJHCeHW0tf
 oPIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUAo8cBme4iKG70KSrKLXrlY8ZJII0rSlmY47UaB7Z8W2ge3hRc8ahnz7z+MzpgTFmtA3lJr5nVWbQrzMck5riv58sLDRfbvAdpKp13OX0
X-Gm-Message-State: AOJu0Yy0GkTOjQL1R+lskuCqAyWWo58UteEy6fhY9hE0NvLAHTTWA9PZ
 jvweuUJJ2TlE7Qi3n/uyo8u4jEJc9inR7I4yw6lSmS+sFfWAMjaDHHaTIrEwN7GQ1erLn/CMKUR
 BoyYYWB+6NxKMtmY/vAsdqJNvaFQ4E9VMAIhzv6DfRs1jeGtfcLbrgVyzwjEXUC405g==
X-Received: by 2002:a17:902:ea10:b0:1fd:a7a7:20b7 with SMTP id
 d9443c01a7336-202195eb41fmr96419745ad.30.1724083142371; 
 Mon, 19 Aug 2024 08:59:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH//CoKy62gMwxSVl4ocYAobc0CKDnBpRj2m0lVJBGbDwWstmLXSyJQhOGDJbjskItoR3YtOA==
X-Received: by 2002:a17:902:ea10:b0:1fd:a7a7:20b7 with SMTP id
 d9443c01a7336-202195eb41fmr96419535ad.30.1724083142023; 
 Mon, 19 Aug 2024 08:59:02 -0700 (PDT)
Received: from localhost ([181.120.144.238]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f037560bsm64074435ad.148.2024.08.19.08.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 08:59:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, David Airlie
 <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Daniel
 Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH] drm/virtio: Use XRGB8888 also for big endian systems
In-Reply-To: <20240816131310.1008205-1-jfalempe@redhat.com>
References: <20240816131310.1008205-1-jfalempe@redhat.com>
Date: Mon, 19 Aug 2024 17:58:58 +0200
Message-ID: <874j7gld19.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jocelyn Falempe <jfalempe@redhat.com> writes:

Helo Jocelyn,

AFAICT your patch is doing two things:

> Mesa doesn't support BGRX8888, that means most wayland compositors
> doesn't work on big endian guests.
>

1) Dropping the BGR{A,X}8888 support.

> Also the colors are inverted when testing a s390x VM on a s390x host.
> So I fixed the DRM_FORMAT -> VIRTIO_GPU_FORMAT on big endian guests.
> It may break big-endian guest on little-endian host, but then the
> fix should be in qemu, because we don't know the host endianess in
> the guest VM.
>

2) Fix the format translation to take into account the guest endianess.

Maybe is better to split the changes in two separate patches ?

> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---

The patch makes sense to me though from your explanations.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

