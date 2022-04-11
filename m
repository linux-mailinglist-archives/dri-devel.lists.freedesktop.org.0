Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE934FC2CB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 18:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2958310EB61;
	Mon, 11 Apr 2022 16:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE8810EB43;
 Mon, 11 Apr 2022 16:56:17 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id t21so16435876oie.11;
 Mon, 11 Apr 2022 09:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bWmf6CDqr26YDLjUPI/Ua6LDwENvM3MIxEgVyjhCpgg=;
 b=k2DlkRXJYG4p4wihUGI4UKqqXqfv8i44QXBjh7hHRtj2/dZJUFDSTJAclth5skGEHi
 RZPGo0ownYQOeEaBRXxJiVY/387Xae3rKE0RO9W/4OGC/lDiYh7bfY0l8Ki3F6Ziz9Yc
 06cdxYCtMBUvruBXHRJBvHihulEayextGjMFywVrurCxbtkZQyWCRENCWH05CkdY/p9v
 2BP5LZrqZe74Y17GCaCZWeYnMtzhQ4v2jMlVuvbuaPg0dXTqCKLUkZwDs29VOoDVf1NF
 LsLbyuFGvRsJRA9HwoL9787H/0KL8+9TP7jvH+dxO/AyGP/WhT2Skho9QXd1WKOKz3lM
 ji0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bWmf6CDqr26YDLjUPI/Ua6LDwENvM3MIxEgVyjhCpgg=;
 b=ZhejKL3heE07jib7HVOz3A8mGbmElcAKwYkfb9S/NI9wwyeXv3sAPGjrB+hlTR4uuJ
 iqS2VjLd2z7XkVe7Jp5ooZaMlN0nbkWthdYRtO2TWUAbrRakIXppdimAZ5chD6knyLAT
 ajyQ2jfMJ0AnaBq3oZViI9jFt3mgRPkHPb/A2Lj4uzGQPFBEvkk5G1P+vgdyzJcMQTNu
 1AUDVXfxgdMbVMGEY95a975TegmN2OkKgEybJbnBDBtfa9lbdtCH7U8S86kf5HLnhe01
 N7phi74JxQg8p+YOEEhvpm1OdDiYJH94Hr3HWl1/HWdV2+EQk7Rne1XuyAOSP7C+R1eQ
 Fcww==
X-Gm-Message-State: AOAM533E+xMSMg1ZWW0N/ThsIH1QeeWc0yfzUTFLOSgqROwWQ/AZAhFa
 X+n4gesR9Y3+hHAzfxJagBDqoekpENDRt+gtPPN3UN4ubwM=
X-Google-Smtp-Source: ABdhPJxHLJyJe1kCKnbIFAfGbINbnNZD0RT30rGO9AHKmB1Pau2Fk/vb5qUoMn7E4BXK78/nQ1fkO2pbKw2n4xWtxWk=
X-Received: by 2002:a05:6808:1486:b0:2f9:e821:51d9 with SMTP id
 e6-20020a056808148600b002f9e82151d9mr27378oiw.253.1649696176476; Mon, 11 Apr
 2022 09:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220409171131.1599090-1-trix@redhat.com>
In-Reply-To: <20220409171131.1599090-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Apr 2022 12:56:05 -0400
Message-ID: <CADnq5_MqU8tinywKJ5_G-HwNNF2k=Q4k7C6Gh5hdtnpve08RJA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: remove r600_blit_shaders.[c|h]
To: Tom Rix <trix@redhat.com>
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 9, 2022 at 1:11 PM Tom Rix <trix@redhat.com> wrote:
>
> The only use of the global variables in r600_blit_shaders.c
> were in the old drivers/gpu/drm/radeon/r600_blit.c
> This file was removed in
> commit 8333f607a631 ("drm/radeon: remove UMS support")
>
> So remove the r600_blit_shaders.[c|h] files
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied.  Thanks!

Alex
