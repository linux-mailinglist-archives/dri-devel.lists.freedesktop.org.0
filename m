Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5258A1757A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 02:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2C110E031;
	Tue, 21 Jan 2025 01:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="V4vpkKHa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE67410E031;
 Tue, 21 Jan 2025 01:15:08 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id C6B4932415B;
 Tue, 21 Jan 2025 01:15:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1737422107; bh=hM2fgf0olfRkEwK6dyP6s2sEQFyODgPiSs8QRRD7534=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=V4vpkKHaKnd/oT3woE4w9DgLXF4+huS+pPTtoaJN8WKYhvFvJNO/hOKpFb5qf+Mcq
 B9mZ/JBkX0lvoa14cb6y8pu7cAKpKgb6/xIBVGwR7eg9TYVBY0tyxWO3mdw8Xehi6n
 oBbqZD9x+KsJhBHhf2XNfU2U52vLsKind42IraqoJ1axkivBuxXkMvvSXETZIXB6R9
 Xmpe6yP2hUO+GzfFxUmVhjW1DS96UXqEC7whcQP+60tekUELi7bl6KjGGYjtzBXe7F
 kwXQPnR7w1DTscc7pfYOxG0/gYE9XbTl3NhRp2j0biPhIzoiUE4lhclCZZCxrDgVLm
 A7jr0ZpSnPB3w==
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-aaf57c2e0beso1020153366b.3; 
 Mon, 20 Jan 2025 17:15:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUtv1kVJLbF95mJXkJCGAbY9YNVr69h3r0EPXCAe5SND+CJSKtn2twd6cSrJ+iaqQOfmABsI5/RV4q+@lists.freedesktop.org,
 AJvYcCWCGMDnLHQJyXzpjV4JpnDih2/KsOEYkhaqB9fwAjVCnnpvqy4tGw1OcuRavJKyPOBXlwzYLSnD@lists.freedesktop.org,
 AJvYcCWchc8o6dPqD42Pf7h006gaS9e3iF/9m/ztpqsi3CWuLn5JDCH7zp7yW7MqNG7MOLXNehbYxqJPuw7E@lists.freedesktop.org,
 AJvYcCXaZa7ERIWFgyIkvVYRve0725RvdK37Mga6DAlEgw9gaHB/QD1o5SuT33xHaI0nIgGMEFJF0cPJJ1Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKt67vdd14gmvfRjGzhgKQUJhdEJIyS3GIPfDyJr4O9QW6Ncw3
 /nQ9D2KohDL2S64RtViPicfIw6JS6fmvoEcR5FJ3LalWOLjntbuBpHwAMaKr3mqkDOo+AwAf2Eb
 dT3C2BWIZYaMsb2UMf1pGw5B9NQo=
X-Google-Smtp-Source: AGHT+IHMrdZmZYN6AneS0M7yk0oJgsGbOhYYMwHUnQJVRQueCtdy9Lh5FdsaXzAZ1DBLPn5H6+vQ6quf6I5I7PDV7ek=
X-Received: by 2002:a17:907:1c19:b0:aa6:acd6:b30d with SMTP id
 a640c23a62f3a-ab38b4c63f2mr1366856566b.48.1737422107129; Mon, 20 Jan 2025
 17:15:07 -0800 (PST)
MIME-Version: 1.0
References: <20241128153707.1294347-1-raag.jadav@intel.com>
 <20241128153707.1294347-3-raag.jadav@intel.com>
In-Reply-To: <20241128153707.1294347-3-raag.jadav@intel.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Tue, 21 Jan 2025 02:14:56 +0100
X-Gmail-Original-Message-ID: <CAFZQkGy3R0TMY5CARPQZF70fdKGLX8GQjV_YQAHzEXsiuNHj+w@mail.gmail.com>
X-Gm-Features: AbW1kvYyDEzcmVwbdo9c6XA4vihWY2IEO2N6qS2J1gV67gtMuD21gh51qrRQ3Dk
Message-ID: <CAFZQkGy3R0TMY5CARPQZF70fdKGLX8GQjV_YQAHzEXsiuNHj+w@mail.gmail.com>
Subject: Re: [PATCH v10 2/4] drm/doc: Document device wedged event
To: Raag Jadav <raag.jadav@intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com, 
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com, 
 andriy.shevchenko@linux.intel.com, lina@asahilina.net, 
 michal.wajdeczko@intel.com, christian.koenig@amd.com, 
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com, 
 alexander.deucher@amd.com, andrealmeid@igalia.com, 
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> +It is the responsibility of the consumer to make sure that the device or
> +its resources are not in use by any process before attempting recovery.
I'm not convinced this is actually doable in practice, outside of
killing all apps that aren't the one trying to recover the GPU.
Is this just about not crashing those processes if they don't handle
GPU hotunplugs well, about leaks, or something else?

> +With IOCTLs blocked and device already 'wedged', all device memory should
> +be unmapped and file descriptors should be closed to prevent leaks.
Afaiu from a userspace POV, a rebind is just like a GPU hotunplug +
hotplug with matching "remove" and "add" udev events. As long as the
application cleans up resources related to the device when it receives
the event, there should be no leaks with a normal hotunplug... Is this
different enough that we can't have the same expectations?
