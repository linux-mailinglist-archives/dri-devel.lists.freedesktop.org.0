Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE17B4B6BA4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 13:04:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE8810E453;
	Tue, 15 Feb 2022 12:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E392210E453;
 Tue, 15 Feb 2022 12:04:51 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id g145so17064385qke.3;
 Tue, 15 Feb 2022 04:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qbnM1QziU/XSffVJX+bwaVuJwYnLnX8GCs9DF4EaXsk=;
 b=GBMqnSHarXC8GjklagRkyGCCCF9Vo/+51OFuwdd5ApKg9dkW3pSkUxe1+Er9Afky6v
 Mh2HJsmInn/Y/1pqwHTcBVDt66gJ/n6NdvbagUwpaPDxAvKcWYOAGF9eJPUNFVcrRXtq
 xCSE7P90lHDA1hG1rhBhFZGiFUdEZBw1BFNdSm6I9ARqcXxZutmsu9NurMbQf2X083rl
 9+kUZoxTiRxt6xCjAn7+Jb0RJO2hrZ27eujcuFSoIqQOhf4xU+BWknVKr1J/HQwRZh/a
 e5YQ7kDjPYvpT1sVr1H0+hd9UeSzNdxElh2nZKmTnlIU4cYZGHUOmV3CekLD9/CDG7mk
 a3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qbnM1QziU/XSffVJX+bwaVuJwYnLnX8GCs9DF4EaXsk=;
 b=bWN8lO7/tclxLpJNMxk0nBIev/1LKMhR7Cgr/AvpZSJE4lfpoKu8xUHse4tGGZV9qO
 9rYYxalmHlDcH0rlRzbdDaKvrT3vfofJSiOKPT55mKFgZhNhocbdZ4qmVQCpN01merRU
 65ve6PxXwTSfzcvSTXfK9Lxze7uxYrQz5xq+aCD9aFyWqjYgqVLXCUsTD10tWD5nYg1z
 G7VxtQNFIAPOkRwlCmnQc4Q4JMZrLL2oE6Pq0n3Cv/tDuLtlm1PUtta3upBQdk15sN9P
 QXV3tja6CQRjcsUo3orNLOz21SwspwTg50cJa3wazEOBZ7e4tRC0VsmarsaEl9WW8w4Y
 ushw==
X-Gm-Message-State: AOAM532GT6N9c8qB5UKRn1YMeEier2vuG1+AtdXkx2G8Tl+vSoUbdjfE
 12uyzFMLMqYeDDvzaPHkc3Xvvv8sXKLR6DfoagjgCwtHyqBb/A==
X-Google-Smtp-Source: ABdhPJxFzThI9yJ6WQ5YwMfuHeghHCKy7MGmGIpj5Bk2cqTfQYGSL/bhIOpU56LzBlNjDXYJ7jFaFlTkyTg9FfzELMc=
X-Received: by 2002:a05:620a:4048:: with SMTP id
 i8mr1689174qko.482.1644926690999; 
 Tue, 15 Feb 2022 04:04:50 -0800 (PST)
MIME-Version: 1.0
References: <20220208084234.1684930-1-hsinyi@chromium.org>
In-Reply-To: <20220208084234.1684930-1-hsinyi@chromium.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 15 Feb 2022 12:04:39 +0000
Message-ID: <CACvgo53u01BK_D0ZssV+gCepjxSz23Nr5Dy1qXeaAoJuu6VCFQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v8 1/3] gpu: drm: separate panel orientation
 property creating and value setting
To: Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 LAKML <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Greetings everyone,

Padron for joining in so late o/

On Tue, 8 Feb 2022 at 08:42, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> drm_dev_register() sets connector->registration_state to
> DRM_CONNECTOR_REGISTERED and dev->registered to true. If
> drm_connector_set_panel_orientation() is first called after
> drm_dev_register(), it will fail several checks and results in following
> warning.
>
> Add a function to create panel orientation property and set default value
> to UNKNOWN, so drivers can call this function to init the property earlier
> , and let the panel set the real value later.
>

The warning illustrates a genuine race condition, where userspace will
read the old/invalid property value/state. So this patch masks away
the WARNING without addressing the actual issue.
Instead can we fix the respective drivers, so that no properties are
created after drm_dev_register()?

Longer version:
As we look into drm_dev_register() it's in charge of creating the
dev/sysfs nodes (et al). Note that connectors cannot disappear at
runtime.
For panel orientation, we are creating an immutable connector
properly, meaning that as soon as drm_dev_register() is called we must
ensure that the property is available (if applicable) and set to the
correct value.

For illustration, consider the following scenario:
 - DRM modules are loaded late - are not built-in and not part of
initrd (or there's no initrd)
 - kernel boots
 - plymouth/similar user-space component kicks in before the
driver/module is loaded
 - module gets loaded, drm_dev_register() kicks in populating /dev/dri/card0
 - plymouth opens the dev node and reads DRM_MODE_PANEL_ORIENTATION_UNKNOWN
 - module updates the orientation property

Thanks
Emil
