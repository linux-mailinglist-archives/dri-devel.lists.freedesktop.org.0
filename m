Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE16063AD7C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 17:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B46588DA9;
	Mon, 28 Nov 2022 16:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815BE88DA9;
 Mon, 28 Nov 2022 16:18:12 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id r76so12080478oie.13;
 Mon, 28 Nov 2022 08:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dUmDKm1BpvIA6b7fg9TAsV7I3v/dDsa2Ew5AZiuOYPE=;
 b=nhYgjDRaG8GIB07OWuhluoflnp2AgXdKFYUlqJTAkGKb7OBUwRf5JaXc99kv5rIjzB
 XibHDK5QistPDLVZdQUldDUKgNxEvSutDoZZqK0kKp7RV07NZMTEQPbQe1wQb3y9Hel1
 uL4o2thCCSgT17Vzp9QYA69pu/F2Q7rxd5HwKCcfIlVzMr7rsGnLk+i1rSeVPSGwF438
 49ZNUQN/7ffCQId7bVcCc2XPQXdJjdUpK527oC86VDrn1zeybvep0YYkblwvbRrfKCB5
 M2uireOApJqO6XIh6W1pk41FKOl9rEZVTIjfHHDDJ4SklUmvb6N7GNl4dxCXDg8/hiob
 MzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dUmDKm1BpvIA6b7fg9TAsV7I3v/dDsa2Ew5AZiuOYPE=;
 b=Zq4SQYEaGp2PeZfxOmENiGOLwAWoxC5FY39zO4yiFqbF8KS2Xk3Xamr+/PsEMpyExG
 LAn2+CItF8eXT2oAfOlEeaqP9ThKg/I0sQCV/wzAzvvwpVJcIpEHrw5eGGAw/HfwfTn5
 qjHjyLZz3ukTM+zaIfvyFsUWN1c+Ytx2F4OI/sNnj8jIX/AlbZVAZPICvaz7w807gDTp
 MOzJjglCKuMr/yh6ksVUTKvUHys11lcuqEuhXbaK8GNmvAhDXjhvXjicl0znMYia/wrq
 KhQTJ9d5LVFIUCHrDPSQ0B1bYffOY3xFwhKnY8NU/M+OlZj7bQmuwyxA4ZrSt6vfvDZL
 jOLA==
X-Gm-Message-State: ANoB5plGo4jyUXXPNYu1RXP0U+LAhimZmSHYAA46Lm3+HjLtsGyYts6g
 vqd/llVFBmUNd5ijfuVliqkPzOH+83TaXHu08lc=
X-Google-Smtp-Source: AA0mqf43Ny6wktI/b9zIB2jtXO0sK5QhF8mG/bYbdBhNFrS7Wia5GSy7m9AunvQEeQE5S237dX5kciTIzTmPiM/Pgtk=
X-Received: by 2002:a05:6808:9b8:b0:34f:97ea:14d with SMTP id
 e24-20020a05680809b800b0034f97ea014dmr15155644oig.96.1669652292076; Mon, 28
 Nov 2022 08:18:12 -0800 (PST)
MIME-Version: 1.0
References: <Y4Mz0glMNwDPaFPO@itl-email>
In-Reply-To: <Y4Mz0glMNwDPaFPO@itl-email>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Nov 2022 11:18:00 -0500
Message-ID: <CADnq5_NfupG-DzNDJfntg+uSWH2m_8mLfj=ddkMdnNYNRhXWUw@mail.gmail.com>
Subject: Re: AMD GPU problems under Xen
To: Demi Marie Obenour <demi@invisiblethingslab.com>
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
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 28, 2022 at 2:18 AM Demi Marie Obenour
<demi@invisiblethingslab.com> wrote:
>
> Dear Christian:
>
> What is the status of the AMDGPU work for Xen dom0?  That was mentioned in
> https://lore.kernel.org/dri-devel/b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com/
> and there have been bug reports to Qubes OS about problems with AMDGPU
> under Xen (such as https://github.com/QubesOS/qubes-issues/issues/7648).

I would say it's a work in progress.  It depends what GPU  you have
and what type of xen setup you are using (PV vs PVH, etc.).  In
general, your best bet currently is dGPU add in boards because they
are largely self contained.  APUs and platforms with integrated dGPUs
are a bit more complicated as they tend to have more platform
dependencies like ACPI tables and methods in order for the driver to
be able to initialize the hardware properly.  Additionally, GPUs map a
lot of system memory so bounce buffers aren't really viable.  You'll
really need IOMMU,

Alex

> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)
> Invisible Things Lab
