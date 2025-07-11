Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1067BB01C28
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 14:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA6410EA3E;
	Fri, 11 Jul 2025 12:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EdP1CHO8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838E310EA3E
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 12:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752237448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PqIwptqxiUC60TiT5uC/Pz0i/1WN1WucKyvEWt+W+RY=;
 b=EdP1CHO823YyiwWnpkFjfNNn/10eImWKSXarjegXbH7TVdWNXGWxyuh2Kkqt4GBtq9JNsr
 Q+KSxg3PX3i53UdovnPSV6aZD4ijtXi0aar5EIke+5RJHWzCd8wEtTmFJvktVyAoliX2xs
 INDVsSqzSqPvhbZQ/gitUixQudD+Pso=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-DWZCCWfePCKrJ-sEC7iJHQ-1; Fri, 11 Jul 2025 08:33:18 -0400
X-MC-Unique: DWZCCWfePCKrJ-sEC7iJHQ-1
X-Mimecast-MFC-AGG-ID: DWZCCWfePCKrJ-sEC7iJHQ_1752237198
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-455d95e711cso2321005e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 05:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752237197; x=1752841997;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PqIwptqxiUC60TiT5uC/Pz0i/1WN1WucKyvEWt+W+RY=;
 b=rMcnIUuy2Q60n2CV20WpGMFxiTD4bEfplF7/ofgN7n/SuqEcZRPjahmSUIDRF/+B8C
 xnzcXMH71Q/72dX52D9T3Tmrmnzb7qfODluXkvaakyiHCvbAkKI+8kq8ttt08Zwx73Yi
 SlnVVz59DmkWFzR0es2ukO9n7mKqaBZbBlueWi0Uy9pyPODa5DGzS5pzZdf7YsNTR0jf
 sOxlYr9GBxgtayUvk0E2ooNpXo3IHNeLENvGKwsrCV4biEOX7ySusDaDgIAcKHpHuvHv
 Fy8glH35KJOFzWyS/rUbYem6zpiFjMoy3M2zYS6dDXA3FPoqdwOCJKMtXLi661ExnEGM
 9KtQ==
X-Gm-Message-State: AOJu0YyYirqb8UZh3BtuKzToV8thAnB/CRLQ6yN4OA5w3OMQ1hqV2Ov1
 mDV5+PWWABvRfnMNOYyVTgrciGTVq+Ns9ru3g/NYYC711j+T4PzEBrJVeLpFMuoPb4yfsXt3a5Z
 AoDPQ+3FLHoNvDc+jdsq9G0CGbfhS6BUQKuEz9JNDx02JVQuWSgSCjZDE0UjdLwvQVYNrzQ==
X-Gm-Gg: ASbGnctwwtQZhB+kRXJkOS6eWTxWtVIkiau6mx5vGObTWNi6Y9Mkwp022O48/kAd+xB
 rCPBlqA/qHbm5beJ17VfOYwo75tyduiJCQPDEF7of1lI3XqhZjp5SSl3VgQef7aRXb+qe59rFoQ
 UsriLEP8l8QdVMNXjV53jLYsLNUv7mQ+ew6j8y5VpY/aGomYhz9EcoZvvNR9QTMJxXp/vSPvVeh
 /Dv6xBu7OdWpDcxFtjjqe01adpkkmWJ/ba6K8vxK6sbx8xfvIsbuxKzv9j54B1AY+pSHInhDINy
 A31OuObyhaxdM3f25xvTC3EmzD/rETb7RGgoEfqLEfQReocsp2v7PNiUsqfAcYLozhy7U8Yc3wU
 /ZzGkQtdBdu9aCh0zlGJ56Q==
X-Received: by 2002:a05:600c:4ec7:b0:440:69f5:f179 with SMTP id
 5b1f17b1804b1-454e2dbc635mr31425255e9.7.1752237197441; 
 Fri, 11 Jul 2025 05:33:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRfXgAHe67BWrQNuo//Q/yq09yIIYiUoiFK0EYNqU5swVLKXIupVlt8pm6xyGcIZaT0nrXbg==
X-Received: by 2002:a05:600c:4ec7:b0:440:69f5:f179 with SMTP id
 5b1f17b1804b1-454e2dbc635mr31424945e9.7.1752237196911; 
 Fri, 11 Jul 2025 05:33:16 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d5133183sm85269225e9.40.2025.07.11.05.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 05:33:16 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 9/9] drm/vesadrm: Support DRM_FORMAT_C8
In-Reply-To: <20250617143649.143967-10-tzimmermann@suse.de>
References: <20250617143649.143967-1-tzimmermann@suse.de>
 <20250617143649.143967-10-tzimmermann@suse.de>
Date: Fri, 11 Jul 2025 14:33:15 +0200
Message-ID: <87ecumewl0.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z5pcW88ZSyae1g6gHzMa8ggXJJw_yKgfsm5BtKlrrZg_1752237198
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Add support for DRM_FORMAT_C8 to vesadrm. The new pixel-format
> description PIXEL_FORMAT_C8 describes the layout. Vesadrm's helpers
> vesadrm_fill_palette_lut() and vesadrm_load_palette_lut() set the
> hardware palette according to the CRTC's output format.
>
> The driver emulates XRGB8888 by converting the source buffer to
> RGB332 and using the resulting 256 colors as index into the hardware
> palette. The hardware palette converts back to RGB during scanout.
> This has no overhead compared to other format conversion, but allows
> common userspace, such as Wayland compositors, to operate on the
> display.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
  
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

