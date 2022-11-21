Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 562FF632777
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 16:11:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B261410E2EC;
	Mon, 21 Nov 2022 15:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97F710E2EC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 15:11:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 50B42612C4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 15:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EDC5C4314D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 15:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669043496;
 bh=o8vQ0S39k7Gj51hmVKNLSHiZmlt+sn5K6a5TuQg0XPY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Or6iQ7EmF30qrf38wid0/iaPYyBoIl7UU3TG4ChfoTwi8sNafEYFjU/d7Yz99mdQA
 GL+tIfN2uWB76P6YyLD4Nv52ky3IBHWPPj5nBvHDEN7SEAjrrz685Q4Io6OBPi6f1Q
 m9QLe0lKrq5XAkKIUmapYeDX+13VTGHHzwgJ7ISpCql/vCuUwpTsnSWCjM4GZYbUB1
 AmF363w/sAjobfOiu2EOp5STp5MwgdpSMD0Q8Rf82HCQCzyWFFXk1x4Y12+RZHK2AC
 UQExql9RQy+PAYBlV4riyuSMK8tNYMxpW4GmVfoiPDorsp+3mw2IbeGJaPoX90Lq6J
 3b9IBvb3S5Bag==
Received: by mail-yb1-f175.google.com with SMTP id y83so5809188yby.6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 07:11:36 -0800 (PST)
X-Gm-Message-State: ANoB5plcc00Mte1OCKIJgBCdHxpEqf+H0V0ETU97NzSNS7jFEK46QfMK
 cP+wr2SvgNdpgtepM1dwJUf/sZV3rWoYEOMJs2E=
X-Google-Smtp-Source: AA0mqf7cdecOiA15F+REOVFF5mHrpn7dsxpol5esLQE1lNOtTaM+cvW5Grl2jp9Q3ptMJevFZJmUphRiNCr9cWWEapI=
X-Received: by 2002:a25:b53:0:b0:6e7:3a0a:d9a with SMTP id
 80-20020a250b53000000b006e73a0a0d9amr8869401ybl.197.1669043494933; 
 Mon, 21 Nov 2022 07:11:34 -0800 (PST)
MIME-Version: 1.0
References: <20221119204435.97113-1-ogabbay@kernel.org>
 <CAPM=9twtQry6S=+Gy2NiUDzX8vrkqHgxCNm8o9UDK8oHtNUZSw@mail.gmail.com>
In-Reply-To: <CAPM=9twtQry6S=+Gy2NiUDzX8vrkqHgxCNm8o9UDK8oHtNUZSw@mail.gmail.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 21 Nov 2022 17:11:08 +0200
X-Gmail-Original-Message-ID: <CAFCwf13Vk8KebheQ6b0Dp0EXjyQEnkUk3mEXyrfDW0Opwfeqbg@mail.gmail.com>
Message-ID: <CAFCwf13Vk8KebheQ6b0Dp0EXjyQEnkUk3mEXyrfDW0Opwfeqbg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] new subsystem for compute accelerator devices
To: Dave Airlie <airlied@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Christopher Friedt <chrisfriedt@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Jiho Chu <jiho.chu@samsung.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 21, 2022 at 8:26 AM Dave Airlie <airlied@gmail.com> wrote:
>
> On Sun, 20 Nov 2022 at 06:44, Oded Gabbay <ogabbay@kernel.org> wrote:
> >
> > This is the fourth (and hopefully last) version of the patch-set to add the
> > new subsystem for compute accelerators. I removed the RFC headline as
> > I believe it is now ready for merging.
> >
> > Compare to v3, this patch-set contains one additional patch that adds
> > documentation regarding the accel subsystem. I hope it's good enough for
> > this stage. In addition, there were few very minor fixes according to
> > comments received on v3.
> >
> > The patches are in the following repo:
> > https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git/log/?h=accel_v4
> >
> > As in v3, The HEAD of that branch is a commit adding a dummy driver that
> > registers an accel device using the new framework. This can be served
> > as a simple reference.
> >
>
> FIx the nits Jeffery raised and the one I brought up and I think we
> should be good for this to be in a PR.
>
> Reviewed-by: Dave Airlie <airlied@redhat.com>
Sure, np.
Oded
