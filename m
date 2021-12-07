Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F09446B684
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 09:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084006E222;
	Tue,  7 Dec 2021 08:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C48F6E222
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 08:59:25 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id 30so6512897uag.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 00:59:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lzwgy7wXN8Jjydn3ji6mL/biJ5JYjvPjWPkziik7m2Q=;
 b=SKu2TfhDIoIjkmjrE33D55zsRwF/PWZZ50HFREVkq25Hnv2oCFdWHnrj4ubEkvPDn6
 o1SH8IIYT0QOk49eXJHB8rYRVMgA1Xo2at9xm473366uCbhABB589UfEz0T6pkCxQFES
 U7ZaRqjyg7VTxma4YrkwioKTP/Qdc84qD4SDgdjKGHwUi19zjf1YY4bjUqSVLe6uUNF/
 8Jq0PyEmmUeDJGwbFg3jF+7wGbuB/UehVmi64oowp49pELWLrj6jsaletZUsdFxbl7yu
 4KAIHjtuFSZID7XLKjET2rqLhdY+LafrqUhXNnKQ9XI/gUkaYOQ9t9nwAGE4MkIAPqoi
 j7lg==
X-Gm-Message-State: AOAM531tuzhJv+t7vEHZSyec5xY0VWdM1HZMKGBQuikCd50s6yMewQ/Q
 /Tcc/KLQuR2rqhW3SpjTRRleY7F+9Jxayg==
X-Google-Smtp-Source: ABdhPJzISjsW9u/8TTkqRKMfMb3lhj4hTo50gM039Ss5GZI4hiZVFaDQ3XGt0waFVCpxQIC00Zkudg==
X-Received: by 2002:a67:af0a:: with SMTP id v10mr43380282vsl.35.1638867564381; 
 Tue, 07 Dec 2021 00:59:24 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com.
 [209.85.221.177])
 by smtp.gmail.com with ESMTPSA id n10sm5647603uaj.20.2021.12.07.00.59.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 00:59:24 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id f7so8771242vkf.10
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 00:59:23 -0800 (PST)
X-Received: by 2002:a05:6122:104f:: with SMTP id
 z15mr51606124vkn.39.1638867563566; 
 Tue, 07 Dec 2021 00:59:23 -0800 (PST)
MIME-Version: 1.0
References: <8a27c986-4767-bd29-2073-6c4ffed49bba@jetfuse.net>
In-Reply-To: <8a27c986-4767-bd29-2073-6c4ffed49bba@jetfuse.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Dec 2021 09:59:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUep8xc3Ay5o6=KWsF8Hp7fUKdgPuW-_WOr1=KAxkou2Q@mail.gmail.com>
Message-ID: <CAMuHMdUep8xc3Ay5o6=KWsF8Hp7fUKdgPuW-_WOr1=KAxkou2Q@mail.gmail.com>
Subject: Re: [Bug Report] Desktop monitor sleep regression
To: Brandon Nielsen <nielsenb@jetfuse.net>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>, Peter Jones <pjones@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add CCs

On Tue, Dec 7, 2021 at 7:37 AM Brandon Nielsen <nielsenb@jetfuse.net> wrote:
> Monitors no longer sleep properly on my system (dual monitor connected
> via DP->DVI, amdgpu, x86_64). The monitors slept properly on 5.14, but
> stopped during the 5.15 series. I have also filed this bug on the kernel
> bugzilla[0] and downstream[1].
>
> I have performed a bisect, first "bad" commit to master is
> 55285e21f04517939480966164a33898c34b2af2[1], the same change made it
> into the 5.15 branch as e3b39825ed0813f787cb3ebdc5ecaa5131623647. I have
> verified the issue exists in latest master
> (a51e3ac43ddbad891c2b1a4f3aa52371d6939570).
>
>
> Steps to reproduce:
>
>    1. Boot system (Fedora Workstation 35 in this case)
>    2. Log in
>    3. Lock screen (after a few seconds, monitors will enter power save
> "sleep" state with backlight off)
>    4. Wait (usually no more than 30 seconds, sometimes up to a few minutes)
>    5. Observe monitor leaving "sleep" state (backlight comes back on),
> but nothing is displayed
>
>
> [0] - https://bugzilla.kernel.org/show_bug.cgi?id=215203
> [1] - https://bugzilla.redhat.com/show_bug.cgi?id=2028613
