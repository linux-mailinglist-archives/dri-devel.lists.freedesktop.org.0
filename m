Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5933974D8ED
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 16:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4797F10E17D;
	Mon, 10 Jul 2023 14:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAAFD10E1B6;
 Mon, 10 Jul 2023 14:24:24 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-bd77424c886so5798658276.0; 
 Mon, 10 Jul 2023 07:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688999063; x=1691591063;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xfaw5NXpBN+ToDeNW38gue7dW1/lsMjnYJ8JVvMgX/M=;
 b=QzKFYEuEyJBmyVNrCTuM3xu2kiOzdJ733dpATnK2KIsTftxaxQrkFSHDoRvXkS62Q1
 ZzwxUIDQFUGUncjgMsGBUdc5tMOXaMH7dl8GnPzoL/6n9pZw09b0ZmaNjHrbLutDuZJh
 a/IGw3N3kW+LesbGXy/lgYCtStCtLi8WbADaDxdcgg/i72vh0e80Elo65bRMQQIf0Aii
 gN8CYJcj/oLYPQitrqhEbeCC8Dqly+59rFrVMMzcHkBCY8kPruGJfjOthtbaTFipQd0Y
 imjIM+aDF60N/+bSFzJQShrBYNXK2Y2WrWcLMYmFYY7kegF/rtNVJpKE8Vnnw/jKXqh9
 IERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688999063; x=1691591063;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xfaw5NXpBN+ToDeNW38gue7dW1/lsMjnYJ8JVvMgX/M=;
 b=UL7oZkKWH11lcEOi4Azyp3KFvAqjw3DD/PygLdC1sCje1lF8a8FAMHAPJJ/4WHR5hG
 nzhUxMxW2MAxf8uOq3S9aWkxHKitvXy1SX7GDdJCmININMxc5aaGJ95t6FxuFkA5cF3F
 kHb5croWvnHx7HgGv6CuObDGcrGIj9eT1mhkLLjPiCYOstfu0YKlFCowDfGngocdSqq2
 e3vR3jCV+FMJ4gTnaE6A2pNk2Ron8OiikSAiy89nnjFuBVXJLyuXhE9eHN1Gafdzrixr
 NSu0PgwJNuIvtUhya2xq2+vOdE8uR4P2dEE+cXH7VVHzE7Pt0ONJQnPG6WG9FGOTVaZC
 EcsA==
X-Gm-Message-State: ABy/qLZHVxcMziknhsHWuKBDQ+u2Xx40ZoP8L2vfhm4dM87zmkRy65K5
 0zNRudwhybOq1il96HtVO5LE0dOB563IMV/KQrQ=
X-Google-Smtp-Source: APBJJlFF/ZPZBeFTUlJJsVw6gvqSC+NnftxoKLaqOH3sDOKdvIyhB4DTRi4Sp3yg5NFbGfCt55R+jTwkG5L/EeefwtY=
X-Received: by 2002:a25:842:0:b0:bd7:6810:6646 with SMTP id
 63-20020a250842000000b00bd768106646mr12374371ybi.44.1688999063346; Mon, 10
 Jul 2023 07:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230710130113.14563-1-tzimmermann@suse.de>
 <20230710130113.14563-10-tzimmermann@suse.de>
In-Reply-To: <20230710130113.14563-10-tzimmermann@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Jul 2023 16:24:12 +0200
Message-ID: <CANiq72=9PoV3FOcXx9FdiSLePKXDG4BSY_5-jddBkqDL=ua3FA@mail.gmail.com>
Subject: Re: [PATCH 09/17] auxdisplay: Remove flag FBINFO_FLAG_DEFAULT from
 fbdev drivers
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org,
 Robin van der Gracht <robin@protonic.nl>, deller@gmx.de,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, linux-nvidia@lists.surfsouth.com,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-geode@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 10, 2023 at 3:01=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> The flag FBINFO_FLAG_DEFAULT is 0 and has no effect, as struct
> fbinfo.flags has been allocated to zero by framebuffer_alloc(). So do
> not set it.

`framebuffer_alloc()` does indeed use `kzalloc()`, but the docs do not
mention the zeroing. Should that guarantee be documented?

> Flags should signal differences from the default values. After cleaning
> up all occurences of FBINFO_FLAG_DEFAULT, the token can be removed.

occurences -> occurrences

can -> will maybe? Since the intention of the patch series is to
remove it (them) altogether).

Thanks!

Cheers,
Miguel
