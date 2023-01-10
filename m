Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8DE664350
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 15:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B504D10E5CC;
	Tue, 10 Jan 2023 14:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F8310E5CC
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 14:32:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1F40661757
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 14:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4CDBC433D2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 14:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673361174;
 bh=0U45HmZgegjPkMDOmrkm9NMlqi4zLwodMY8zNt/kRWI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HkQgFQt0z+XlSwH4LSPB8dWMGXh2us7yZBYwK97ytvjaIIyJZXvb7GUZfsGzlkSCI
 w+9y/SE6GDMYce0NZFfl1+osJfMG2YYqvASbCGeBZNZ5HnjGWFN5gBH2plMKGLjXd+
 VWolFhlPjbQGAdXFRSEA5FWtTntla65POuvPxUXmGASxzjNNaSWiVo0iSOHCK34KAZ
 Y20BmdNoV7zEecAZZO6LHCAo7ZrndYnz/YJwrqFP8cSE7zF8ZuL5mAKmckeXxiMz/O
 ZC6x7qoerHJvae1FXSQAVdw1tpJ7wDbZiuIE2t/TCJJyL/Ksf6LcgWlTSr3VEEBfew
 0CNlLsdogUPfw==
Received: by mail-lf1-f41.google.com with SMTP id v25so18689486lfe.12
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 06:32:54 -0800 (PST)
X-Gm-Message-State: AFqh2kr0Kkc1fH0wWjYa8RMo2xnEpxjMuceAnnCuHm5EtBZUwEp83RPU
 ksqwf5hoxw9x+RlqJBwk2l+l9fTHTjvOSYKY1hQ=
X-Google-Smtp-Source: AMrXdXu6SHV+bJRSe9pB8EUBgBNaA/0cKm1zCebRcx57RXXlXO0ObqPFLAM1XRlK5LKNxQ2L6PsNtj6NR6LXqm5KLCY=
X-Received: by 2002:ac2:4a72:0:b0:4b6:f37c:c123 with SMTP id
 q18-20020ac24a72000000b004b6f37cc123mr4822738lfp.539.1673361172997; Tue, 10
 Jan 2023 06:32:52 -0800 (PST)
MIME-Version: 1.0
References: <20221221105402.6598-1-markuss.broks@gmail.com>
 <CAMj1kXGUC7dsSwVEUsAMeAoqDYtbqrM7SDOJTXbPfi-LrcSk9g@mail.gmail.com>
 <97639381-2558-4cf5-75b0-7f80f0393b16@gmail.com>
In-Reply-To: <97639381-2558-4cf5-75b0-7f80f0393b16@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 10 Jan 2023 15:32:41 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE-GMxemfDA=CLvLUZeN7fHv6Ds2L2a2swYea8Q9U+b8g@mail.gmail.com>
Message-ID: <CAMj1kXE-GMxemfDA=CLvLUZeN7fHv6Ds2L2a2swYea8Q9U+b8g@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add generic framebuffer support to EFI earlycon
 driver
To: Markuss Broks <markuss.broks@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Muchun Song <muchun.song@linux.dev>,
 "Paul E. McKenney" <paulmck@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-efi@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kim Phillips <kim.phillips@amd.com>,
 Will Deacon <will@kernel.org>, Jami Kettunen <jami.kettunen@protonmail.com>,
 linux-serial@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Borislav Petkov <bp@suse.de>, Jiri Slaby <jirislaby@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 23 Dec 2022 at 15:58, Markuss Broks <markuss.broks@gmail.com> wrote:
>
> Hi Ard,
>
> On 12/23/22 16:42, Ard Biesheuvel wrote:
> > (cc Andy)
> >
> >
> > On Wed, 21 Dec 2022 at 11:54, Markuss Broks <markuss.broks@gmail.com> wrote:
> >> Make the EFI earlycon driver be suitable for any linear framebuffers.
> >> This should be helpful for early porting of boards with no other means of
> >> output, like smartphones/tablets. There seems to be an issue with early_ioremap
> >> function on ARM32, but I am unable to find the exact cause. It appears the mappings
> >> returned by it are somehow incorrect, thus the driver is disabled on ARM.
> > The reason that this driver is disabled on ARM is because the struct
> > screen_info is not populated early enough, as it is retrieved from a
> > UEFI configuration table.
>
> I believe I must be hitting some other bug then, since my driver should
> not use `struct screen_info` when the arguments are specified manually
> (e.g. in device-tree or in kernel command line options), and it still is
> broken on ARM when they are.

Define 'broken'

> I got it to work on ARM when I moved the
> early console initialization later into the kernel booting process, but
> that mostly defeats the purpose of early console driver, I believe. I've
> been thinking that it could be some stuff not getting initialized early
> enough indeed, but I've got no clue what could it be.
>

This is likely due to the fact that the ARM init code sets up the PTE
bits for various memory types, and using them beforehand is likely to
result in problems.
