Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BE346C1CE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 18:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6189DAB231;
	Tue,  7 Dec 2021 17:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADE8AB231
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 17:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638898339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Y9Pjga21aracwhJoyyvYrk6Lt9GN/KkUwQElqefsrU=;
 b=d9xjfdOf8IHDCo8xNS6P4crWOD6JZKwaG0kzbfIuA+vnTfbuAznepk7bLRgkjqQAgybc2U
 Uc7s2UNT7mpTXwShzhYc7GVYiemPjLkf4m2YotsQ1mXI6ZKU4S3z1CNcPd6CH1kuUNt0YY
 FVCNEabAASpjhdKcjkvD3SZTXqqSCE4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-vb8rBWnDMTKDuIs_RjLw_A-1; Tue, 07 Dec 2021 12:32:19 -0500
X-MC-Unique: vb8rBWnDMTKDuIs_RjLw_A-1
Received: by mail-wm1-f69.google.com with SMTP id
 l6-20020a05600c4f0600b0033321934a39so1660218wmq.9
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 09:32:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6Y9Pjga21aracwhJoyyvYrk6Lt9GN/KkUwQElqefsrU=;
 b=OAYFs5Bq2NTCLpLGuvtVNJ3ZUYKNEWZbjfYEioqcP08/zxwHNmx/QXYlBKYUWW6Ddu
 C0xzVwMAsSUKRPAa5ITKUmnJOElpQlv3kUEZo7FM4GYOGCDIERVHE1xnRrH0v+UxdXuA
 J0/OqLYjyclW2jucJz+m/oNZJ5CIAvl+P+oQvMQvfW8nu5zHtcwu+dX/3/mQuBsOqaoU
 PnIjRWPFw3DRXSjWgNkMTTikxHP0V1NFdNHtTo5n1OlDvchQCED6q+YIFgmdJcgwEjTo
 ARXPWcumV9EmXZKJhtpKqgzzEnGhgMEu4Mxwt4TxrlmaUFyiK9zrxR6dG0hTCeAwbqhb
 lspA==
X-Gm-Message-State: AOAM531c3vVLg791+if7XX+sawCXKwgrqz/q8MjV+WNHGZT0JUQ825bM
 0NHH/QD1524MN9jvy3ab3GJdQaxgJUFRMjKRkpqnOlDeVe4GT+2ZcJ0eFO69vtdMx9WIOxvphzW
 qPF0EQjlUL4zyN0Uh+o56wLY6aKeHuc39cSZx0tRpKL0B
X-Received: by 2002:a5d:47a9:: with SMTP id 9mr52950490wrb.42.1638898337333;
 Tue, 07 Dec 2021 09:32:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwS4WAmTgmumrIvWu+yX9HvqjuLp/srHLtI+V5J5dSkPaRSMHjOSblueIsPVT3q2xJTau7CrGgKuwVb0YRj6pc=
X-Received: by 2002:a5d:47a9:: with SMTP id 9mr52950450wrb.42.1638898337097;
 Tue, 07 Dec 2021 09:32:17 -0800 (PST)
MIME-Version: 1.0
References: <5dafba25-5424-3fe2-5046-ae1d4320f9c1@leemhuis.info>
 <20211206183721.6495-1-dmoulding@me.com>
 <6f62bd8c-3a2c-e553-898c-d42fb1583208@amd.com>
In-Reply-To: <6f62bd8c-3a2c-e553-898c-d42fb1583208@amd.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 7 Dec 2021 18:32:06 +0100
Message-ID: <CACO55tuw2pwqUnknvZmSiuEaMcjArsgzLy9NYBqZPE6f9zPXsA@mail.gmail.com>
Subject: Re: [Nouveau] Regression in 5.15 in nouveau
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: regressions@lists.linux.dev, nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dan Moulding <dmoulding@me.com>,
 regressions@leemhuis.info, Ben Skeggs <bskeggs@redhat.com>, sf@sfritsch.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 7, 2021 at 10:52 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 06.12.21 um 19:37 schrieb Dan Moulding:
> > On 04.12.21 17:40, Stefan Fritsch wrote:
> >> Hi,
> >>
> >> when updating from 5.14 to 5.15 on a system with NVIDIA GP108 [GeForce
> >> GT 1030] (NV138) and Ryzen 9 3900XT using kde/plasma on X (not wayland=
),
> >> there is a regression: There is now some annoying black flickering in
> >> some applications, for example thunderbird, firefox, or mpv. It mostly
> >> happens when scrolling or when playing video. Only the window of the
> >> application flickers, not the whole screen. But the flickering is not
> >> limited to the scrolled area: for example in firefox the url and
> >> bookmark bars flicker, too, not only the web site. I have bisected the
> >> issue to this commit:
> >>
> >> commit 3e1ad79bf66165bdb2baca3989f9227939241f11 (HEAD)
> > I have been experiencing this same issue since switching to 5.15. I
> > can confirm that reverting the above mentioned commit fixes the issue
> > for me. I'm on GP104 hardware (GeForce GTX 1070), also running KDE
> > Plasma on X.
>
> I'm still scratching my head what's going wrong here.
>
> Either we trigger some performance problem because we now wait twice for
> submissions or nouveau is doing something very nasty and not syncing
> it's memory accesses correctly.
>
> Attached is an only compile tested patch which might mitigate the first
> problem.
>
> But if it's the second then nouveau has a really nasty design issue here
> and somebody with more background on that driver design needs to take a
> look.
>

Ben mentioned a few times that fences might be busted but we all have
no idea what's actually wrong. So it might be that your change is
indeed triggering something which was always broken or something else.

> Please test if that patch changes anything.
>
> Thanks,
> Christian.
>
> >
> > Cheers,
> >
> > -- Dan
>

