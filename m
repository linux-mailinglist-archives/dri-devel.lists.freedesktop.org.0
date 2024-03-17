Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E892287DD45
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 14:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B80110EA82;
	Sun, 17 Mar 2024 13:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="W8cVglSx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376B610EA82
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 13:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710681602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bGVhRz5lNimAIwrUb1iGb99fEkx7qvbMYYAmyQTnrRc=;
 b=W8cVglSxtOAenDf3xJj/dEYfL72Sun3CDZWCrgV7UhJ/azoCamUgM7342f8E6rLBgl2MN/
 mOmP/Ikkig10GXC9sEnE913uLkpOpB+RaOZ0/knuqec4/cC8UGeolG2xazXe91k/ytzsn/
 btplGd4nc+pIx6nrCaJzUee6XLD7f6k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-MtGlak-CO_uvUNLd-Xy5hw-1; Sun, 17 Mar 2024 09:20:00 -0400
X-MC-Unique: MtGlak-CO_uvUNLd-Xy5hw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4140e6bbc87so1132615e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 06:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710681599; x=1711286399;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bGVhRz5lNimAIwrUb1iGb99fEkx7qvbMYYAmyQTnrRc=;
 b=vKkUhw2CFru+sm2CmYHWtxuUc8XJn89CN/JHOHK8KAvYI5M9FVdc96PdUaZAltJTjI
 n1O7leFt5fBfhMvaLtUScDXGpqbDlpXhYr3mknigGg2Mi2I3nOdDYH7wQ8l+2CtlwWEV
 2ip9Z5Hf2qfi42X/+nu2B1BMRKOhgA6ZocHDMCzBYiIoux3kduNIUQgqyM7rhZrRQkH+
 e70MiL44VGa3hOqEpymGXsW4yg51kcdAlWtxmiftZ0H08jxMtHsvWMJzPUiXvzApLZ1+
 7Sw2XZ5oEpLviFuMoy5YL/3ku0tQhprHJXdJ1/o82xUroVs5fHORU3pAMs+ozgf9Tdoj
 K3cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH47WnXKRRbKzGAYgDmOkUnbySNYxwsj9oQd1HmW9y/V69psfTFeCJrxUjR6Kh8sz+GbaeTiokU47RF7Gqxq6XXkTi7UezqJiphPMqbVc4
X-Gm-Message-State: AOJu0YyVlipz8FaPV508BXb3xnX7ll7lQApn5+Lr284ykP3o9p4iA2p/
 lZ0xWDf8P3RW4BkwGYjauh+Z+dB/T5Vr8T/shGnafQQf8aqwAaWADMR0oavJGqPIR999kIaDD5a
 V9WHsem3WG+JQ90IASTz8nexysRiNZJ+AENCc1p4dVM2Srw0/b2xNaLzozr+DnNIoPQ==
X-Received: by 2002:a05:600c:548c:b0:413:27d0:45f4 with SMTP id
 iv12-20020a05600c548c00b0041327d045f4mr7513163wmb.6.1710681598932; 
 Sun, 17 Mar 2024 06:19:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoJbLPQhurxakyY8FSDOFcA4PV8aHZ0hWGaEZpsyYD0QMoE2S/+U+mNJt3Vgk+p18B9gOXGg==
X-Received: by 2002:a05:600c:548c:b0:413:27d0:45f4 with SMTP id
 iv12-20020a05600c548c00b0041327d045f4mr7513151wmb.6.1710681598476; 
 Sun, 17 Mar 2024 06:19:58 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b00413f035d58esm11714773wmq.10.2024.03.17.06.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 06:19:58 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 03/43] fbdev/deferred-io: Clean up pageref on lastclose
In-Reply-To: <20240312154834.26178-4-tzimmermann@suse.de>
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-4-tzimmermann@suse.de>
Date: Sun, 17 Mar 2024 14:19:56 +0100
Message-ID: <874jd5gflv.fsf@minerva.mail-host-address-is-not-set>
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Clean up the pageref state as part of the lastclose helper. This
> only requirs to clear the page's mapping field. The pageref and

requires

> page can stay in place for the next opened instance of the frame-
> buffer file.
>
> With the change in the clean-up logic, here's no further need

there's

> to lookup pages during the lastclose cleanup. The code instead
> uses the existing pagerefs in its look-up table. It also avoids
> using smem_len, which some driver might not set correctly.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

