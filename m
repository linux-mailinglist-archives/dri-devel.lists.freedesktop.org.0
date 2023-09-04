Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A06D87917D0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 15:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110D010E13E;
	Mon,  4 Sep 2023 13:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C7310E13E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 13:10:12 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-Gic4JNPUOiaYRvc4E6fUlw-1; Mon, 04 Sep 2023 09:10:10 -0400
X-MC-Unique: Gic4JNPUOiaYRvc4E6fUlw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-31ad607d383so677505f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 06:10:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693833009; x=1694437809;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N/mSHv5PMuG3bI81Fi8Qqn5MlLsevMB4uVfb4i+YDH0=;
 b=Lm5RH7i67CbXmyQGOWK1xEuiWeOGyJXHp4LHdzP4/LKob+3rMHltnDBc5VMoSi3U8m
 VMlqPdtMMyBUZI5lbhgPe3anYWDH55NZDvDo8hxDvJgELydsjkj3kjAd7VuhFUYq4GZB
 5sPbvccx3KUhLfXGrMNk2f24B1SQe4Wu4zzSlCSJsJHaIj34K8kMp7T75Uzz9/ZmuB+W
 MOT8Hjpuvktw0atia9Zcsx2Lmy9Bx2f/Hbu0ouyKLA3TEIsk+t4Gxqsuxf2vP2LqmWuE
 0oQJsuXmpJiUL62Z0nTAiJmGfCQt3pY1Ewx+ZncshX5MqmTCLwKm1N+c16nsxe/X3PZ4
 Ts7w==
X-Gm-Message-State: AOJu0Yw7AJuoIP+Fftt2VxMtiadugbcijbDXtcHTVJB8leJsxIaii/AN
 k16EWVFmxXApYR46H8lA7g4Zoj4biQ1xtohDko8rPQBE2fC48giINmEqt02HV5KvAIBnnAKCWcQ
 CQedCI3N4oZK4GLTAW33Y+4JezPgx
X-Received: by 2002:adf:ef8b:0:b0:30f:c5b1:23ef with SMTP id
 d11-20020adfef8b000000b0030fc5b123efmr7031995wro.41.1693833009063; 
 Mon, 04 Sep 2023 06:10:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9JbWJdgeGtQs+F3OoOwIvoZMV5mY5Ox6E+5wzrokFqlNDGFgExFwmjqyHm8xhQbFKERp1rA==
X-Received: by 2002:adf:ef8b:0:b0:30f:c5b1:23ef with SMTP id
 d11-20020adfef8b000000b0030fc5b123efmr7031980wro.41.1693833008804; 
 Mon, 04 Sep 2023 06:10:08 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r5-20020a5d4985000000b00319779ee691sm14461672wrq.28.2023.09.04.06.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 06:10:08 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org
Subject: Re: [PATCH 3/8] fbdev: Add Kconfig macro FB_IOMEM_HELPERS_DEFERRED
In-Reply-To: <20230828132131.29295-4-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-4-tzimmermann@suse.de>
Date: Mon, 04 Sep 2023 15:10:07 +0200
Message-ID: <87il8qcceo.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The new Kconfig macro FB_IOMEM_HELPERS_DEFERRED selects fbdev's
> helpers for device I/O memory and deferred I/O. Drivers should
> use it if they perform damage updates on device I/O memory.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

