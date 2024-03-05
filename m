Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2FE871A56
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 11:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A53810F15C;
	Tue,  5 Mar 2024 10:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="I3Ey0mzU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAF010F15C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 10:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709633682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bZreK67FpZILAeD49/V7f1eq0sfqv4ispNo3CtdsGzk=;
 b=I3Ey0mzUZVWSSvwz0ufZ0S8HZGwiMemrG44lVIWDkMAJ20qXTjC3DoyrSBfjep6nC6raRd
 4xR6SNH4AkfOoKCsLZtm58X46iL2ENvMRuVcoayt8nu86w4nhyalxauQ5qBWM5HSbnJv0y
 tl1xzbsvzcCjASnAgtE6cxTq0wKEg2I=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-WzSHp1YbNGyILZdcy54jQw-1; Tue, 05 Mar 2024 05:14:39 -0500
X-MC-Unique: WzSHp1YbNGyILZdcy54jQw-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-5131796a4b7so5224066e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 02:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709633677; x=1710238477;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bZreK67FpZILAeD49/V7f1eq0sfqv4ispNo3CtdsGzk=;
 b=M1qkjg4cZFFuxWF1hTQneQnfos3fhr3K6nqfhPYCLuxbn8vU1NkaUf9vQUjcm7cKsg
 a0HT14TTlDNPoDFh1C2UeAw3cQFsPdENvLNmY3h1/xBYIgUIjBkucd1r6q571rMc4VHS
 T0WpEqTMoWhKsRtAmBzx01l82EwWzhgF/oqFBeK4kG0kCFEOapnQFlsSTjXAoYSkMlJu
 xLMFdbCwBAajAL6yJD6Sqb8Tfc6WbJBdLeaJKhOTjxDrqfHheGrUjWYKSCNbWMD3SC3b
 1sWp5Txga2NzsFabssxcqD0EU5e8aJNzLMVXJC/lJma7HNCR68824rLHUukNJPi/UaqT
 V60w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+xXPnVpceZIdhw5RM68h3XhSlk7Y2bP+rJQus61Uc3Bd85FNGz86Xar8jAGlxq8Ta4jeq1k7fOZ7p44aSWVJrEZIOUY/WS9XrYGQ4VDLx
X-Gm-Message-State: AOJu0Yw46LHgG0ccpDOVWtQ+TZKcsfT5ohXWX8ffrA9g9gZHXVZhn5cu
 nyMFYCc9LZj5vFJyCBqpLUXi2ArBrwDxUJrBV7J8Zgj4cH9T5BwcXymt75YJI7vpzmRmn3A8fkW
 nEf0njCR4X1Rz1Uqq8ZXct2YWT6ilAhzHtrCFYX53a6BU6ncgiNiiKrFWCz42pJ0i1w==
X-Received: by 2002:a19:a405:0:b0:513:4bf6:9710 with SMTP id
 q5-20020a19a405000000b005134bf69710mr940992lfc.26.1709633677487; 
 Tue, 05 Mar 2024 02:14:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGK7AzSAVkRPe1TYpP1NDx4pLfScxk4rOzERyIg+Ds+MY3KzPk22v/8TjCM4JUUhHs/40ihrg==
X-Received: by 2002:a19:a405:0:b0:513:4bf6:9710 with SMTP id
 q5-20020a19a405000000b005134bf69710mr940959lfc.26.1709633676969; 
 Tue, 05 Mar 2024 02:14:36 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s6-20020a05600c45c600b004129e8af6absm17375630wmo.33.2024.03.05.02.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 02:14:36 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, Rob
 Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Hamza
 Mahfooz <hamza.mahfooz@amd.com>, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [RESEND v3 2/2] drm: Add CONFIG_DRM_WERROR
In-Reply-To: <afe5ed943414f7ec3044c1547503b9941686a867.1709629403.git.jani.nikula@intel.com>
References: <cover.1709629403.git.jani.nikula@intel.com>
 <afe5ed943414f7ec3044c1547503b9941686a867.1709629403.git.jani.nikula@intel.com>
Date: Tue, 05 Mar 2024 11:14:35 +0100
Message-ID: <87bk7trnn8.fsf@minerva.mail-host-address-is-not-set>
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

Jani Nikula <jani.nikula@intel.com> writes:

Hello Jani,

> Add kconfig to enable -Werror subsystem wide. This is useful for
> development and CI to keep the subsystem warning free, while avoiding
> issues outside of the subsystem that kernel wide CONFIG_WERROR=y might
> hit.
>
> v2: Don't depend on COMPILE_TEST
>
> Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com> # v1
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

