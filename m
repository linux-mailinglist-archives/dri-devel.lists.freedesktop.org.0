Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3847AFE87C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 13:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE1E110E7BF;
	Wed,  9 Jul 2025 11:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="or7h3Pz9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7594F10E7B9
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 11:59:41 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-60c5b7cae8bso8870849a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 04:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1752062380; x=1752667180; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VwaoJLiJYF12OSK8rGI95sJddGwuByNYIOGTk/ksVzQ=;
 b=or7h3Pz9z4S5wVBbSyd6QecH1qfiBzU+YtEkWhcHmk5VQgeQYnW7dJJJdT+El52l+x
 4z9Wfq3QjJ1OJaJgrIKDymf9rWTs5ZswyWerEQDaOkl4pWXfoCb9k5wih1Q339kZlKPQ
 KCOFDsRArSfnon9nDiIcaszxlngh79mgsPAOvzRLh/h3xjExxD7WqtJTWO9sHtelVpor
 WI7OEqUsl089rodAAYwuefWSvNGLKewHLarftu7DWWLJhwD7UOHpfLqSspC9kExlbuVW
 QnvBSl/6znnDAqIPRDqbICGT/1r1APJO9pBEN4l4BetmyP3zdC5khieIZEByaR1a9S6v
 ifMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752062380; x=1752667180;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VwaoJLiJYF12OSK8rGI95sJddGwuByNYIOGTk/ksVzQ=;
 b=IjkAgoYZAqn0hMvu8I7AOf+3IjmUlnx+5+szF+lsfd5AogQikt9bREiNoW/szzbcja
 bAQSqPwfxMDBZ5agdWOeVitd7lXzklMdEyl5ECD67VmTpr2Wim2I8pgxHpgwOU1SfS+8
 qjvjAjnMCn84z5kCjDxJepEaMM7Mdeo4nXRVxl1lAaqdT9z5jHrtRUILplwuJXQaFkMF
 4S5g15+vKXcmf5ba0YSyvMwodoHJCK3Z2exWcc5vMX1NgKQOfX6xqMYmKbl2HBHr6ys6
 MMaAm0kItvLrDt05yIENYFxmJW5uKs3I8DbuuF0fhbpZolCeYv07b31zd78IK1SjQtbl
 mqtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQcG3O5wOvrnd28EajdNZD+lAz6tgC/Wif6v7tbe0fSkeE6w3A695ZMoKay43SgzgdZcDWcYmVCQQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBjcV7ofF8JHkA3/KffI2otGww7GKo0Jh4HONAF+pY/Gd0ueRp
 EQzJdJvU7x7ceCnct0SFk28VO021sZXpNGf8uIjPsnam2TX5cqprWT4J8MhUzeU5x0g=
X-Gm-Gg: ASbGncsYu4KLYOwI0NQoArlNivWcsbbFkU53B5847z4uGRvPKWiERQhUCSUK0jL7oZG
 kts3Gk48aHYvhL+VX+KQeKIS9Pkmb6JvEJIy1PYAfeRkV3uwdtF70Dx6bGg8pLR/ZXqvrfNqM7V
 hQ8THuusYCQ0xj0BgpEmvO0TkxRVAnXO3wxTx3BB3rZXIVetOscS1XWvJmKsUi7mfuhMWqyVjLb
 PqQqj60FiKFZ5MlAUcHC5A/52A7bUi2JGBo8JfRbGMKUVuaJxEt9ESYqu1sDQtzzH4YWDepkH0h
 ds53WYL9jXB7F1sZRIxGcfahoKZuTzmgRsum24lDWVsZp7m3Zheu0xhOALVYZOMc1BCvZrdCwEp
 KvbxI6tSVhWP2729JbFW4W5b/IjeyvBdi4LmKpYcx/A==
X-Google-Smtp-Source: AGHT+IF5M43gbb1VPZRgUmXUN6Xh1tAveUbZcs0w5aMrTx9Nx/yzR4T2sKl+aY7FPc+zZ1BgthqpOg==
X-Received: by 2002:a17:907:9708:b0:ae3:5f74:11fd with SMTP id
 a640c23a62f3a-ae6cf5e8e9bmr206052066b.23.1752062379715; 
 Wed, 09 Jul 2025 04:59:39 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl.
 [144.178.202.139]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6d7fc3584sm76721666b.62.2025.07.09.04.59.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 04:59:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Jul 2025 13:59:38 +0200
Message-Id: <DB7IA132RX61.200FUO5T7L3I8@fairphone.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Javier Martinez Canillas"
 <javierm@redhat.com>, "Helge Deller" <deller@gmx.de>,
 <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] drm/sysfb: simpledrm: Add support for
 interconnect paths
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-3-f69b86cd3d7d@fairphone.com>
 <ypjcqiyfzjobg4zsm5sowjtu6ctvzgd4bvt3wpbqbb7o7f3rcm@q454aob3wwth>
In-Reply-To: <ypjcqiyfzjobg4zsm5sowjtu6ctvzgd4bvt3wpbqbb7o7f3rcm@q454aob3wwth>
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

Hi Dmitry,

On Sun Jul 6, 2025 at 1:14 PM CEST, Dmitry Baryshkov wrote:
> On Mon, Jun 23, 2025 at 08:44:47AM +0200, Luca Weiss wrote:
>> Some devices might require keeping an interconnect path alive so that
>> the framebuffer continues working. Add support for that by setting the
>> bandwidth requirements appropriately for all provided interconnect
>> paths.
>>=20
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  drivers/gpu/drm/sysfb/simpledrm.c | 83 ++++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 83 insertions(+)
>
> If simpledrm is being replaced by a proper DRM driver (thus removing
> those extra votes), will it prevent ICC device from reaching the sync
> state?

How can I try this out? On Milos I don't have MDSS yet but I can add an
interconnect path on another device to try it.

Are there some prints I can enable, or check sysfs/debugfs to see if it
reached sync state?

I only recall seeing sync_state pending warnings in some instances, but
never that it's synced.

Regards
Luca
