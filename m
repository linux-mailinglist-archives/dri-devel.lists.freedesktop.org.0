Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D3B74E0FA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 00:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDDB10E17E;
	Mon, 10 Jul 2023 22:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C1B10E17E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 22:23:58 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3113da5260dso4946330f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 15:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20221208.gappssmtp.com; s=20221208; t=1689027837; x=1691619837;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k+uRSZaNW94drRfaP5L/VJThT+qbzWt+a4m0PC1+H4c=;
 b=BGJwtu/eYDeeRz6gd9DW/1dlrKmdKTY5LkPMrD8VqiQjMxN7JoO9VdAeSxsct2N1AA
 RHztHsO/Ag4ji7+SPc/aVGU+ioISxQDSctgi4qfPKB/qChuM1/SUco0pTqNmKQbWdbyo
 7fDfQpW7AE7IIJpAdBuwj+QuXBAiNXIjBDr73NztsSaHYezINnldgNhJBcd0qYW5vmEY
 +4G/hVixr3YySmX+NrwspZKpNocBFDbfCCAZadUYle20SqmBqPXX91t6M23ZcsnE/P09
 wEEBJYThW/kn39pNb0v7acrw5izKLcx3fgmiSgQ3Y9cAMSokLMrSpnv6a5acp4nvaACs
 GFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689027837; x=1691619837;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k+uRSZaNW94drRfaP5L/VJThT+qbzWt+a4m0PC1+H4c=;
 b=K6IwHc5gtu67lWi9leEVl+kzX3JjiWrwJF4RmZME+AdAWqFz1QN3rVX1cMVd/ZrZTT
 BGhuvdSghoQbt61XTfYDFrRGgFtUXzZEuBXrF+pzTptpp4bRKalUiFbIQBInQ4zO1ebx
 6P34h2x01xoiUwayDTggSPYvnRugzYYUtRoT1aa3ZKvrKIsGcDN+HFDoUiXEJiSn2O9J
 Xj3l1sImwiaEHslxGhJp5gkCXezn7+phuBSRxuKHtsT9RIC7Vs4t79p3SH2oqkE7/d72
 /w8Zolds8CGyWbxLALP9+DXLpdtCuyrO0WFTo/2XrGDtGxJj98UCbXJeWJk2syxoBeWp
 m/AQ==
X-Gm-Message-State: ABy/qLZemrO5BgYTXxLoF+5PvfV2+UIm6ueKHUO91OLABYEclSMYq1qh
 cO3YoU/k1LGwg/QmuSpBG8VpCIYSUNKepNV7p8eCCMXerq+5STiN8aE=
X-Google-Smtp-Source: APBJJlGWtw8f4A2ctcC8tl3oCSE31f33fxmAUGJnr4OHt+wZ4ekqgW0g26gHvys0bWgym34SFWrWokUD9oDJHrFTQP0=
X-Received: by 2002:a5d:614b:0:b0:314:7487:96a3 with SMTP id
 y11-20020a5d614b000000b00314748796a3mr10923400wrt.52.1689027836873; Mon, 10
 Jul 2023 15:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1681898595.git.petr.tesarik.ext@huawei.com>
 <20230426141520.0caf4386@meshulam.tesarici.cz>
 <2023042617-wobble-enlighten-9361@gregkh>
 <20230426144439.5674f8bc@meshulam.tesarici.cz>
 <20230509091635.27450bd9@meshulam.tesarici.cz>
 <2023050949-grueling-verify-a43b@gregkh>
In-Reply-To: <2023050949-grueling-verify-a43b@gregkh>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Mon, 10 Jul 2023 23:23:45 +0100
Message-ID: <CAHbf0-HY0-u4MwgU39b53hjOM+bWfGmOEYQuvHARjV+6j+O7Kg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Allow dynamic allocation of software IO TLB bounce
 buffers
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Kim Phillips <kim.phillips@amd.com>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 Borislav Petkov <bp@suse.de>, Won Chung <wonchung@google.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 =?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?= <petr@tesarici.cz>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 Hans de Goede <hdegoede@redhat.com>, Zhen Lei <thunder.leizhen@huawei.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Petr Tesarik <petr.tesarik.ext@huawei.com>, Ondrej Zary <linux@zary.sk>,
 Robin Murphy <robin.murphy@arm.com>, Muchun Song <muchun.song@linux.dev>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 open list <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Petr Tesarik <petrtesarik@huaweicloud.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

I was hoping this might land for 6.5-rc1, is there a new version that
might apply against 6.5?

Cheers

Mike

On Tue, 9 May 2023 at 08:32, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, May 09, 2023 at 09:16:35AM +0200, Petr Tesa=C5=99=C3=ADk wrote:
> > On Wed, 26 Apr 2023 14:44:39 +0200
> > Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> wrote:
> >
> > > Hi Greg,
> > >
> > > On Wed, 26 Apr 2023 14:26:36 +0200
> > > Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> > >
> > > > On Wed, Apr 26, 2023 at 02:15:20PM +0200, Petr Tesa=C5=99=C3=ADk wr=
ote:
> > > > > Hi,
> > > > >
> > > > > On Wed, 19 Apr 2023 12:03:52 +0200
> > > > > Petr Tesarik <petrtesarik@huaweicloud.com> wrote:
> > > > >
> > > > > > From: Petr Tesarik <petr.tesarik.ext@huawei.com>
> > > > > >
> > > > > > The goal of my work is to provide more flexibility in the sizin=
g of
> > > > > > SWIOTLB.
> > > > > >
> > > > > > The software IO TLB was designed with these assumptions:
> > > > > >
> > > > > > 1. It would not be used much, especially on 64-bit systems.
> > > > > > 2. A small fixed memory area (64 MiB by default) is sufficient =
to
> > > > > >    handle the few cases which require a bounce buffer.
> > > > > > 3. 64 MiB is little enough that it has no impact on the rest of=
 the
> > > > > >    system.
> > > > > >
> > > > > > First, if SEV is active, all DMA must be done through shared
> > > > > > unencrypted pages, and SWIOTLB is used to make this happen with=
out
> > > > > > changing device drivers. The software IO TLB size is increased =
to
> > > > > > 6% of total memory in sev_setup_arch(), but that is more of an
> > > > > > approximation. The actual requirements may vary depending on th=
e
> > > > > > amount of I/O and which drivers are used. These factors may not=
 be
> > > > > > know at boot time, i.e. when SWIOTLB is allocated.
> > > > > >
> > > > > > Second, other colleagues have noticed that they can reliably ge=
t
> > > > > > rid of occasional OOM kills on an Arm embedded device by reduci=
ng
> > > > > > the SWIOTLB size. This can be achieved with a kernel parameter,=
 but
> > > > > > determining the right value puts additional burden on pre-relea=
se
> > > > > > testing, which could be avoided if SWIOTLB is allocated small a=
nd
> > > > > > grows only when necessary.
> > > > >
> > > > > Now that merging into 6.4 has begun, what about this patch series=
? I'm
> > > > > eager to get some feedback (positive or negative) and respin the =
next
> > > > > version.
> > > >
> > > > It's the merge window, we can't add new things that haven't been in
> > > > linux-next already.
> > >
> > > This is understood. I'm not asking for immediate inclusion.
> > >
> > > >   Please resubmit it after -rc1 is out.
> > >
> > > If you can believe that rebasing to -rc1 will be enough, then I will
> > > also try to believe I'm lucky. ;-)
> > >
> > > The kind of feedback I really want to get is e.g. about the extra
> > > per-device DMA-specific fields. If they cannot be added to struct
> > > device, then I'd rather start discussing an interim solution, because
> > > getting all existing DMA fields out of that struct will take a lot of
> > > time...
> >
> > All right, 6.4-rc1 is out now. The patch series still applies cleanly.
> >
> > Any comments what must be changed (if anything) to get it in?
>
> Try resending it, it's long out of my review queue...
>
> thanks,
>
> greg k-h
