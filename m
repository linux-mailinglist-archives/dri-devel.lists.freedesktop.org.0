Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C757369AC5A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1187310EFC7;
	Fri, 17 Feb 2023 13:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F0A10EFC7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676640326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CG7ZMZKNyVWBzGYC2Xevqr6HzBkWsSMFFjsTKV/i3/A=;
 b=SCmWI4GbSJXAxzYggHxi6yj0rWWcHCNuXzg7NxGBsPhncesVseiwYbbcinFd34Cer8AcEG
 H//C31hNMqW9czzyJUuxquT++D0UoPq9IAHJ+dIHZnmKzyNzqjrRI4Ho1DMTHW2fTH38hg
 2Q+e6iW4hwEAOfmS3FUwvf0fa24G+M8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-119-x5IgoyLNPHqVmfFcSAA1aA-1; Fri, 17 Feb 2023 08:25:23 -0500
X-MC-Unique: x5IgoyLNPHqVmfFcSAA1aA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l32-20020a05600c1d2000b003e0107732f4so728729wms.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 05:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CG7ZMZKNyVWBzGYC2Xevqr6HzBkWsSMFFjsTKV/i3/A=;
 b=huO5JePEjstbEzIbP+tAzXienglk1wWgn/IVegTLFZMI28mVFpspEocehO+3eOO8/D
 rm1WLOHGx7kTt+DpB25GTm6vNd19e9cbIkRSy/uqkmIr9ncz4yYKsRwncCYqb2WMTOHs
 Q4bshHCLthkxCjCxXcgrZWJoN8ETJTtV+5V1oErvWBzvqIV4DFG3aZh8wmH9iQcjzA2x
 LWiHdfKpIrIYlnnx1+gVGPbJXS8b3UDWa4zkk40diGLlGd1ymeXkfxPV6o25LfSb1vyU
 zXqwUN+0iq05HFFdbJrj/2LUbSp7XR/6l676gXvAmWv0+SGTeXhztOLtMFsxlgHlWceo
 vz+Q==
X-Gm-Message-State: AO0yUKV3vjdDHyHU0HMfb3MRl3vzrgoht7zbPwqNx9QuCTp89j0OycyJ
 1O5MxONw5Q6xEbk/ZuW1J26SpvMlrQTHAtzWSTRO9hERdPrLRCodfO6lX7UJSz0KpTWYbCZAcMQ
 kALSDlRj0161o77T0hN70EXq8vsPT
X-Received: by 2002:a05:600c:46d2:b0:3dd:37a5:dc90 with SMTP id
 q18-20020a05600c46d200b003dd37a5dc90mr583169wmo.32.1676640321942; 
 Fri, 17 Feb 2023 05:25:21 -0800 (PST)
X-Google-Smtp-Source: AK7set99mCRkOnVV+9I9v6u1+WrknUvb4w/V8Mn9m6aAenKxBVR6lfdblL8f0q4CNfJt9ugKeuILRQ==
X-Received: by 2002:a05:600c:46d2:b0:3dd:37a5:dc90 with SMTP id
 q18-20020a05600c46d200b003dd37a5dc90mr583156wmo.32.1676640321571; 
 Fri, 17 Feb 2023 05:25:21 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y25-20020a1c4b19000000b003dc4480df80sm1526696wma.34.2023.02.17.05.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 05:25:21 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jyri.sarha@iki.fi, tomba@kernel.org
Subject: Re: [PATCH 2/6] drm/ast: Implement struct
 drm_plane_helper_funcs.atomic_enable
In-Reply-To: <20230209154107.30680-3-tzimmermann@suse.de>
References: <20230209154107.30680-1-tzimmermann@suse.de>
 <20230209154107.30680-3-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 14:25:20 +0100
Message-ID: <87o7psifun.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Enable the primary plane for ast hardware via atomic_enable. Atomic
> helpers invoke this callback only when the plane becomes active.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

