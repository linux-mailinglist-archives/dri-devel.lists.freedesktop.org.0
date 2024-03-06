Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 369A887397D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 15:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5332511323F;
	Wed,  6 Mar 2024 14:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FEw6lnrY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB43311323F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 14:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709736176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nI16e0Px5mCnCB0ak7IH5fMzEGmp9xyhpg8P096W8A0=;
 b=FEw6lnrY6Yipx3lrfUaIM4JjA4rJ33RaXj6V8GEJjwoMATbSYprsW/5JFzRNvnYXt2jpbK
 ACJRIseaD0Qaf0z7Tcj7XF8IQzNy+xLbrjab3pdFfgJVB/u5pIjjC4Ew/xWc+NWlbn1rB/
 fCkFSi+pFi/+pPL5vH330sX67++w4eE=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-3RKPLYjSNLya9TtXklSeeA-1; Wed, 06 Mar 2024 09:42:55 -0500
X-MC-Unique: 3RKPLYjSNLya9TtXklSeeA-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-513332823cfso1944602e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 06:42:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709736173; x=1710340973;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nI16e0Px5mCnCB0ak7IH5fMzEGmp9xyhpg8P096W8A0=;
 b=gGPol0zPSTid3iEw0PXddU/PEhL4MHOR50ND9J/ePNqqme6gO7lDzC7kKbESYV6EsY
 sdP+V8zINbREuI1SNev0ynDsqNcKllu1gsyW2q+xVzl6frAlsqFA3UIjvpA79mpTqQ2w
 Zm4Q1eu9s3ZHovuSCxEA8CDOIwUh7Oa4rAvaZ2HTpAdR8WpDMucqZWoTqWyNF9Jgr/F6
 29ka5R+wanIh16OD7LdMz/YT659d35/3cCWcUJnNuqMt6KnonZlaDuoje1QO7e6ONa4j
 N2O2PLGDwGbRd1ZWW9bVzswld/Ai/ARdy0sgN0wBfe7415ONtFlj2n1lQkuSBHzIVGUs
 8XTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/3UOPo7IbkwzxOobdYplGTcxSPEgiu7jVMQQ1mqf3juHH7AaC9rgTANT9B/pNbwft400YxvA1eMukG6Qp/5mDSY3qMaGmuIrJLowGYAfU
X-Gm-Message-State: AOJu0YwNsatlzVTL5Fb0j8KEKd1zg31nobeJmR96qWl1ecgZyv+TRMsV
 uhIjZv0vNKDVkXbimXFC4L38t6DQX8wlRxKYKpM9rjrIfM2gbS4KTxPhr/6MmcGpMbqOiFns17E
 KzFvWyNpRL+GxZ7UqjgltIz4kb00rMfHO3kWF6N0o8G8FzRtNwrFOKyX1oxoAotSogu/Amkn2DQ
 ==
X-Received: by 2002:a05:6512:282b:b0:513:2de3:6274 with SMTP id
 cf43-20020a056512282b00b005132de36274mr4056465lfb.55.1709736173415; 
 Wed, 06 Mar 2024 06:42:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHKZnxXOZaF1o6ZUr1X0aoj/T1WzfkQ2C4TYfYmHMXOz5xD8NuMemYB9AfCfZUppfYcNQSoA==
X-Received: by 2002:a05:6512:282b:b0:513:2de3:6274 with SMTP id
 cf43-20020a056512282b00b005132de36274mr4056444lfb.55.1709736172855; 
 Wed, 06 Mar 2024 06:42:52 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o17-20020a05600c4fd100b00412d68dbf75sm14206235wmq.35.2024.03.06.06.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 06:42:52 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Douglas Anderson <dianders@chromium.org>, Daniel
 Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>, David Airlie
 <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "drm/udl: Add ARGB8888 as a format"
In-Reply-To: <20240306063721.1.I4a32475190334e1fa4eef4700ecd2787a43c94b5@changeid>
References: <20240306063721.1.I4a32475190334e1fa4eef4700ecd2787a43c94b5@changeid>
Date: Wed, 06 Mar 2024 15:42:51 +0100
Message-ID: <878r2vs9p0.fsf@minerva.mail-host-address-is-not-set>
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

Douglas Anderson <dianders@chromium.org> writes:

Hello Doug,

> This reverts commit 95bf25bb9ed5dedb7fb39f76489f7d6843ab0475.
>
> Apparently there was a previous discussion about emulation of formats
> and it was decided XRGB8888 was the only format to support for legacy
> userspace [1]. Remove ARGB8888. Userspace needs to be fixed to accept
> XRGB8888.
>
> [1] https://lore.kernel.org/r/60dc7697-d7a0-4bf4-a22e-32f1bbb792c2@suse.de
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

