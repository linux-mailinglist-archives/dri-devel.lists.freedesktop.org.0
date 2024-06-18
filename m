Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BA890C4BC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 10:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C45810E20F;
	Tue, 18 Jun 2024 08:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jClH3d1Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D35110E20F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 08:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718698243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Um1eLXbNm7/kO9kxYoAyA7cpz6u+PzGiTgv0zhQ+dT4=;
 b=jClH3d1QY2BX5ddQusg1zbUXtAJq2wOGL+jHAmJdDRYVblw38s/OY4MDHIRGlNudRvDGPF
 Mf9Fj7Bsua4n/o5jEjVIYI458rNXFhOh+kxLEjdFWoZMxww9rq91/jPMMMiAAezDNcOScG
 65ieZSIBmBgrWA9ZGPgpPw1nEwdATWY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-H2G0CfTROiC-W-E5g2hqXw-1; Tue, 18 Jun 2024 04:10:42 -0400
X-MC-Unique: H2G0CfTROiC-W-E5g2hqXw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4246e5fd996so5739505e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 01:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718698241; x=1719303041;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Um1eLXbNm7/kO9kxYoAyA7cpz6u+PzGiTgv0zhQ+dT4=;
 b=lERKYkqOPvJD7rSsvzC3agg521Zg+An6njRsY5FQqRNnl2ptSArYJV4DjAeOgMUvzS
 q/x8H81m/VaGC6P1OBB0uHI7CNlt0j1ElXkyL59sQXVBPh6X78oOrKu4/jKTiFui+EEx
 2xnKZhQxWH6qzGYFncUqODgauvAc02x3U4uoleAku0eqQRsvRpaT2ZkSiW7f7A+vwAYd
 +W/A+otrwXXoYfytRgqxY/aERXZlsFOPu7W7F66X3+BtyzZjn3Z+IBkHbVXRato4lGyo
 tbZ4jhqvMpGLs/n17IgdsLe7sNyPJPjoa5EBsIEvGkmnjJqj06hQ2d0FEKGuFpDXleee
 XYXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+an7dXwlnUyVcqD511P1z/R/HE9M+oe0bx0lzZ8q6Bvgbj/l6ypDXYLxAVyaqYsoZ+F0gOaE0+Qnp3sdBrGGxDVzHFWx7JlEZe/eAx8iM
X-Gm-Message-State: AOJu0YxtE1hRj1WeRmZHVpf5UDGPgVcKbXz3HUhQl6gLA4rqgDaG+2DR
 FwuF1O/3UmAgl/j5LtnJDTvbv29hE6bT2AJfyf6vIBGbI8x/qFqIljqwUaEqFrE5e9vf0dHOEkE
 d7Z5p09XwJsWiSGKoQJGCx2NqQcWy7HpaegmWlusf7Sw7DB6CUkLjV98cJxRRryqtgA==
X-Received: by 2002:a05:600c:63c7:b0:421:7e88:805 with SMTP id
 5b1f17b1804b1-42304854f53mr106111455e9.35.1718698241432; 
 Tue, 18 Jun 2024 01:10:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGujlRvR3wLYaDhL+bjHS0YMSIKJQPeHPyGKXuWssS+5GLM1BTKQbjeA6ZgLAn4CXaK4hTlzg==
X-Received: by 2002:a05:600c:63c7:b0:421:7e88:805 with SMTP id
 5b1f17b1804b1-42304854f53mr106111215e9.35.1718698240907; 
 Tue, 18 Jun 2024 01:10:40 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3607509c8b7sm13517206f8f.26.2024.06.18.01.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 01:10:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie
 <airlied@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/tidss: Add drm_panic support
In-Reply-To: <1d914332-9300-4dee-8d33-0a806cb22aa4@ti.com>
References: <20240615085326.1726262-1-javierm@redhat.com>
 <1d914332-9300-4dee-8d33-0a806cb22aa4@ti.com>
Date: Tue, 18 Jun 2024 10:10:39 +0200
Message-ID: <878qz27jsw.fsf@minerva.mail-host-address-is-not-set>
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

Aradhya Bhatia <a-bhatia1@ti.com> writes:

> Hi Javier,
>
> I tested the patch, and it was good to see the panic screen on SK-AM62.
> Thanks for adding this feature in tidss. =)
>
> On 15/06/24 14:23, Javier Martinez Canillas wrote:
>> Add support for the drm_panic module, which displays a pretty user
>> friendly message on the screen when a Linux kernel panic occurs.
>> 
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Reviewed-by: Aradhya Bhatia <a-bhatia1@ti.com>
>

Thanks Jocelyn and Aradhya for the review and test! I've pushed this
patch to drm-misc (drm-misc-next).

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

