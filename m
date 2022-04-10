Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E43244FAB3B
	for <lists+dri-devel@lfdr.de>; Sun, 10 Apr 2022 02:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304E510E134;
	Sun, 10 Apr 2022 00:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C19910E134;
 Sun, 10 Apr 2022 00:51:42 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id k23so24172272ejd.3;
 Sat, 09 Apr 2022 17:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UumSOi3bVb4/q3h+ATEP8uiyPH1qa/l+xbjDc3aGRoY=;
 b=Wpfv8e/QtYVqq+ae3AXvVreoZ7ZF1txzYHecTrr6f56GfjQtarUN44NuJsrNRyb/pn
 yXdgDWBp+gdex/zmzOXSU+AORuclxUPOTszcK7G6DjWiDLLFThwtIzCB13ekoVvA0jTi
 F12b9sY+ZsI6QCdTC+pzifJnBCrldSU7l2fy/Cx2hsspibI6TSkqO0aJBsqW9KuRz40g
 QIc3LcQacL/TRM1to+DMqQl6wL6CCJNdp/f7PsLM+3gkznrfWcd5WsQptG2mtUyUK27a
 mRx7WK5dYQao28oCwkjSvy7fXVbvaeRGgOlW/V/GBKfTWIdtlRbhA1Kjd06Jxrhgr0iR
 ltKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UumSOi3bVb4/q3h+ATEP8uiyPH1qa/l+xbjDc3aGRoY=;
 b=Dpg8A10IJoDOVO2cJVKZllWScEBLqVnCqZsle76P29tzVVtVzA3pLynnaW8RtZ+9rf
 NOddEEFpspE450rAYf7y2EF5Gvs6AAelII7OszWiTgj2aMPKJXiuOmcjjmnYBkl17el3
 cp6szfDKoYdOVmReWGnODKFk+7Bhbv+q4y0zbJfGJCRdxMUwHksJi/EDYxYC+gvyClLt
 Nw2J6OrtKzPEr6kNPUWyKXWKGx3Weszlga1Pbd4BuVYvXPxSLpZh7c5iUkJM5dwk+AmP
 SUZLDIm0ciOgMsoc3D12KXpGMQDrUyWAEokwcQSyr2jygplYUqGMNQBuHxXQfb1JIVDw
 3jPw==
X-Gm-Message-State: AOAM533GIwL08ix5F1GQyv3WRyNSAnKaLRg5rniOiWjKyhMMjfM6fBSh
 ah9ID4lN81okOT7GlGn+LqPfkA925rp+g49RdRA=
X-Google-Smtp-Source: ABdhPJxQwID87p/D+o6yfKWz+g3H0+XBvfl8OCx5eFBQpBraG6rnAHk332AH/yFvoDWsBBhKeP5wO3o39UJkUr3VFG0=
X-Received: by 2002:a17:907:daa:b0:6e4:9b0d:3f1 with SMTP id
 go42-20020a1709070daa00b006e49b0d03f1mr23879729ejc.37.1649551900752; Sat, 09
 Apr 2022 17:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220408092803.3188-1-h0tc0d3@gmail.com>
 <4o2YD5id7zhK5g__CUK3Yf-6Dj459XQ0qsydW6wKHdco3YYtl78BqGUfXvQ9UO0AZoAsMPfhFB0jw1BFldiFDcbZXmGgsobuAoTMWmoDqmE=@emersion.fr>
 <CAP+8YyED70CSqVRaB7JgrAtK-yvBx5EsvrrdR7EpvOG2AVhskQ@mail.gmail.com>
 <QfKpxmkE_cy9wt5VJruw_TSdnl5KceKM8BxJGmZSBs-KiaRwIYfgc8h_-5h7Wmj6G-NtUJ3A88V5pzPvZuLlpkK-oRO5pSjeTxwHcZWlogs=@emersion.fr>
 <CAD5ugGD6QzCUqk7_EVwH9Cc6PQtx_VfjVRWzzP9uKR5tkGh1RQ@mail.gmail.com>
 <436116c9-6ce4-87cc-b1cd-f44b72fcfb35@amd.com>
In-Reply-To: <436116c9-6ce4-87cc-b1cd-f44b72fcfb35@amd.com>
From: Grigory Vasilyev <h0tc0d3@gmail.com>
Date: Sun, 10 Apr 2022 03:51:39 +0300
Message-ID: <CAD5ugGDrDrWWf1xMKTy=56H1AR8cyXMV41f1X8P=HVtYY6idDA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix NULL pointer dereference
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Sean Paul <seanpaul@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Christian K=C3=B6nig, Simon Ser In fact, the code looks strange, we return
the return code, but for some reason we also write false and 0. In my
opinion, the caller should do this.
Of course, you are right, but I look from the position that nothing
should fall in the user system. There may be strange errors that occur
periodically under certain conditions and do not affect developers.
Also, the user will not always be able to correctly write a bug report.

Regards, Grigory.

=D0=BF=D1=82, 8 =D0=B0=D0=BF=D1=80. 2022 =D0=B3. =D0=B2 17:30, Christian K=
=C3=B6nig <christian.koenig@amd.com>:
>
> Am 08.04.22 um 15:21 schrieb Grigory Vasilyev:
> > Simon Ser and Bas Nieuwenhuizen, do you understand that you are
> > proposing to make the code less safe in the future? In the future,
> > someone might rewrite the code and we'll get an error.
>
> Which is perfectly fine.
>
> See error handling is to handle userspace or hardware errors and *not*
> coding errors.
>
> Testing all pointers for NULL without any reason is not defensive, but
> rather the exactly opposite since it helps hiding real bugs.
>
> Regards,
> Christian.
>
> >
> > =D0=BF=D1=82, 8 =D0=B0=D0=BF=D1=80. 2022 =D0=B3. =D0=B2 14:48, Simon Se=
r <contact@emersion.fr>:
> >> On Friday, April 8th, 2022 at 13:28, Bas Nieuwenhuizen <bas@basnieuwen=
huizen.nl> wrote:
> >>
> >>> On Fri, Apr 8, 2022 at 12:01 PM Simon Ser contact@emersion.fr wrote:
> >>>
> >>>> Is amdgpu_display_get_fb_info ever called with NULL tiling_flags/tmz=
_surface?
> >>>> If not, there's no point in adding NULL checks.
> >>> It isn't called with NULL anywhere, the NULL checks that already exis=
t
> >>> seem redundant.
> >> Grigory, would be be willing to submit a v2 which removes the unnecess=
ary
> >> NULL checks?
>
