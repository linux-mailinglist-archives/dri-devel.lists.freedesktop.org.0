Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DEA46935A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C347473E48;
	Mon,  6 Dec 2021 10:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40EDA7B923;
 Fri,  3 Dec 2021 19:09:25 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id p18so2729944plf.13;
 Fri, 03 Dec 2021 11:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IoBuVhCiR9BrSiQMh75XUsvklE4yOFaQXUkrNsUI+/Y=;
 b=o+MayrhIXhy6Tn8p5jFoe3c6UEGzOvhNMOZ3TtvQekj4JCNjdsawVl2u3l5SENbfof
 TNfIHy73jO38Cwwn82y0/O0BIKnFHjyLPXQJDzy7qycQOBmCsMlzDh1Q2DR/dDfUPV+T
 r18zoZXJa+kuffykx6WxpgSUqIrRhMh+5seYzmBeIdQgodapeD3BgFIao8z0z3xul5DI
 zzfBS7ojv+CsTNBmtiL+bcj2r2Be0KmQr05NMIrnRPld2usPWmwa7QKmH4TJixqKzBoT
 zvPWSf1nPvABpim+20Hg6l+G/t1o5CzzG1XTTa95NmXosfCoW+SB7in29LfUrsF96+Pj
 5kKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IoBuVhCiR9BrSiQMh75XUsvklE4yOFaQXUkrNsUI+/Y=;
 b=zfix/1jPHIPkjrmyrMRbfanjMQgwZf4HvJLFOEx8Crya8X9/IMYD+g1a9B7NUHZF8v
 62RTLbXHqFTfbkaKBsRs69XILSGXDoN5F6Vjnkjg/I3FMb1UjGw5vpEeIugbcGYJUAQi
 jz2GyT5PTCSPKz9bKfFu+SNGXIvfS7l30aotQ07IKGKViDNb+He8gSYb9+iiiX3HqAf7
 a9axpZ9xH5xFot2WPuv20OsUeFlsw1Ws0M+aGOJ39GVbRBn5lHgV0pEs1dUJy96h8zoD
 13fJRe7RTYXx+SeIbn4/1TcLDqQ9BZcSrs0svmmtf2kRUhUHZmXjM85a9EzcnwyQfa/G
 HC4g==
X-Gm-Message-State: AOAM5300ayAwCIrqAYgsOgRVyknyIlywgfHV0uD2SdltkAQ30YcDESK0
 ebp9z5vshY16/bwfYeC9xzguzs46F8V/j8InZE8=
X-Google-Smtp-Source: ABdhPJxZJvNEr3MwGMO10MxWXmKiW1dA8s8jvQruDvE9ccjiUSFfbFTenWOarBOh/3TPJbQ4+kPRDOmSReFhkMMc+GI=
X-Received: by 2002:a17:90a:17a5:: with SMTP id
 q34mr15942710pja.122.1638558564703; 
 Fri, 03 Dec 2021 11:09:24 -0800 (PST)
MIME-Version: 1.0
References: <20211202203400.1208663-1-kuba@kernel.org>
 <YanDM7hD9KucIRq6@kroah.com>
In-Reply-To: <YanDM7hD9KucIRq6@kroah.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 3 Dec 2021 11:09:13 -0800
Message-ID: <CAADnVQJXSksytrk5aLGQzgzaoGB9xFWqXWSTj0AmkEWiEs2jWg@mail.gmail.com>
Subject: Re: [PATCH bpf v2] treewide: add missing includes masked by cgroup ->
 bpf dependency
To: Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 06 Dec 2021 08:15:50 +0000
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 David Airlie <airlied@linux.ie>, Yonghong Song <yhs@fb.com>,
 Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrii Nakryiko <andrii@kernel.org>, a-govindraju@ti.com, ray.huang@amd.com,
 sbhatta@marvell.com, lorenzo.pieralisi@arm.com,
 Daniel Borkmann <daniel@iogearbox.net>, krzysztof.kozlowski@canonical.com,
 John Fastabend <john.fastabend@gmail.com>, hkelam@marvell.com,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Matthew Auld <matthew.auld@intel.com>, linux-pci@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Sunil Goutham <sgoutham@marvell.com>,
 thomas.hellstrom@linux.intel.com, pawell@cadence.com, tzimmermann@suse.de,
 mani@kernel.org, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 KP Singh <kpsingh@kernel.org>, rogerq@kernel.org,
 linux-samsung-soc@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 bhelgaas@google.com, sean@poorly.run,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 SeongJae Park <sj@kernel.org>, lima@lists.freedesktop.org,
 linux-mm <linux-mm@kvack.org>, jingoohan1@gmail.com,
 Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org,
 christian.koenig@amd.com, yuq825@gmail.com, bpf <bpf@vger.kernel.org>,
 colin.king@intel.com, freedreno@lists.freedesktop.org, gakula@marvell.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 2, 2021 at 11:11 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Dec 02, 2021 at 12:34:00PM -0800, Jakub Kicinski wrote:
> > cgroup.h (therefore swap.h, therefore half of the universe)
> > includes bpf.h which in turn includes module.h and slab.h.
> > Since we're about to get rid of that dependency we need
> > to clean things up.
> >
> > v2: drop the cpu.h include from cacheinfo.h, it's not necessary
> > and it makes riscv sensitive to ordering of include files.
> >
> > Link: https://lore.kernel.org/all/20211120035253.72074-1-kuba@kernel.or=
g/  # v1
> > Link: https://lore.kernel.org/all/20211120165528.197359-1-kuba@kernel.o=
rg/ # cacheinfo discussion
> > Acked-by: Krzysztof Wilczy=C5=84ski <kw@linux.com>
> > Acked-by: Peter Chen <peter.chen@kernel.org>
> > Acked-by: SeongJae Park <sj@kernel.org>
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> > Signed-off-by: Jakub Kicinski <kuba@kernel.org>
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I'm not sure how to test that it helps to reduce build deps,
but it builds and passes tests, so applied to bpf tree.
Jakub, you'll soon get it back via bpf tree PR :)
