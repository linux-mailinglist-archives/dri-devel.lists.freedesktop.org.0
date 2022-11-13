Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 144B3627021
	for <lists+dri-devel@lfdr.de>; Sun, 13 Nov 2022 16:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B8210E070;
	Sun, 13 Nov 2022 15:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273C410E070
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 15:05:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6F75CB80C91
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 15:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFCCBC4314B
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 15:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668351948;
 bh=JZYZkvOzwHauWn7NPk94KVzI+xuZbvY7xNa3vWZqcTY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ht67YbC0+NKcw7pvSLBppZ5KtTa70JZZ9GkqaDWoUzEZ0RgtJ7i1ND33JmKOv0M/e
 cwlZ+PK74tNTMENBhN5A1TCiDOR5rWwfat0fRDM/evdiSIvnhLpZOp6xuthGoZqH27
 z4xS+NawYISjLJGVMsI1zmdsXiz8KrlKvTWuWf8si396Zf3k/oTD8DhncF7PhXgv/N
 CATLxaK5v6EcjzlsSUlj+k5YGmB0nkK5afZafmqjBly1iv91hEu8whz0g+NMo8A9Wc
 EaMjldPJIWuskV5D1jEQlKn9ToymQMO3tjzG3uabDZWN413InDsRAOi1Vgv7lfeFpk
 tOvtTtcBsQHyQ==
Received: by mail-yb1-f180.google.com with SMTP id b131so10136408yba.11
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 07:05:48 -0800 (PST)
X-Gm-Message-State: ANoB5pk8ktgsMGTbxi/MGND700+pIhCZvofhuSSM1KqcyaDUAXC6F22v
 V+cVgLrCWCU46pcw+3HBUXuSKd+CTsEHS1qBrJQ=
X-Google-Smtp-Source: AA0mqf7fFjG5yqktGJvQQkKH+rMMhMyOkIsHqbAQZkDpy1F1y6SqmlUMzkIPTmxOYQZFPHngI/sIYwr7HccFuUnpZiU=
X-Received: by 2002:a5b:b8d:0:b0:6d4:d047:5d2f with SMTP id
 l13-20020a5b0b8d000000b006d4d0475d2fmr9081375ybq.443.1668351947433; Sun, 13
 Nov 2022 07:05:47 -0800 (PST)
MIME-Version: 1.0
References: <20221106210225.2065371-1-ogabbay@kernel.org>
 <CAF4BF-Qo_3ZE+hwF2e-gfrQHXpZU+uyyxaOf29YLcp7wh_eCFg@mail.gmail.com>
In-Reply-To: <CAF4BF-Qo_3ZE+hwF2e-gfrQHXpZU+uyyxaOf29YLcp7wh_eCFg@mail.gmail.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Sun, 13 Nov 2022 17:05:21 +0200
X-Gmail-Original-Message-ID: <CAFCwf10oi_g-jJU0CPYA7-s7+Nb3vGfcEZEc3ngxf77FdXH+FA@mail.gmail.com>
Message-ID: <CAFCwf10oi_g-jJU0CPYA7-s7+Nb3vGfcEZEc3ngxf77FdXH+FA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/3] new subsystem for compute accelerator devices
To: Christopher Friedt <chrisfriedt@gmail.com>
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
Cc: antonio.j.hasbun.marin@intel.com, dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, cfriedt@meta.com,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Jiho Chu <jiho.chu@samsung.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 12, 2022 at 12:04 AM Christopher Friedt
<chrisfriedt@gmail.com> wrote:
>
> Hi Oded,
>
> On Sun, Nov 6, 2022 at 4:03 PM Oded Gabbay <ogabbay@kernel.org> wrote:
> > The patches are in the following repo:
> > https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git/log/?h=accel_v3
> >
> > As in v2, The HEAD of that branch is a commit adding a dummy driver that
> > registers an accel device using the new framework. This can be served
> > as a simple reference. I have checked inserting and removing the dummy driver,
> > and opening and closing /dev/accel/accel0 and nothing got broken :)
> >
> > v1 cover letter:
> > https://lkml.org/lkml/2022/10/22/544
> >
> > v2 cover letter:
> > https://lore.kernel.org/lkml/20221102203405.1797491-1-ogabbay@kernel.org/T/
>
> I was in the room at Plumbers when a lot of this was discussed (in
> 2022 and also 2019), but I haven't really had an opportunity to
> provide feedback until now. In general, I think it's great and thanks
> for pushing it forward and getting feedback.
>
> The v1 cover letter mentioned RAS (reliability, availability,
> serviceability) and Dave also mentioned it here [1]. There was a
> suggestion to use Netlink. It's an area that I'm fairly interested in
> because I do a lot of development on the firmware side (and
> specifically, with Zephyr).
>
> Personally, I think Netlink could be one option for serializing and
> deserializing RAS information but it would be helpful for that
> interface to be somewhat flexible, like a void * and length, and to
> provide userspace the capability of querying which RAS formats are
> supported.
>
> For example, AntMicro used OpenAMP + rpmsg in their NVMe accelerator,
> and gave a talk on it at ZDS and Plumbers this year [2][3].
>
> In Zephyr, the LGPL license for Netlink might be a non-starter
> (although I'm no lawyer). However, Zephyr does already support
> OpenAMP, protobufs, json, and will soon support Thrift.
>
> Some companies might prefer to use Netlink. Others might prefer to use
> ASN.1. Some companies might prefer to use key-value pairs and limit
> the parameters and messages to uint32s. Some might handle all of the
> RAS details in-kernel, while others might want the kernel to act more
> like a transport to firmware.
>
> Companies already producing accelerators may have a particular
> preference for serialization / deserialization in their own
> datacenters.
>
> With that, it would be helpful to be able to query RAS capabilities via ioctl.
>
> #define ACCEL_CAP_RAS_KEY_VAL_32 BIT(0)
> #define ACCEL_CAP_RAS_NETLINK BIT(1)
> #define ACCEL_CAP_RAS_JSON BIT(2)
> #define ACCEL_CAP_RAS_PROTOBUF BIT(3)
> #define ACCEL_CAP_RAS_GRPC BIT(4)
> #define ACCEL_CAP_RAS_THRIFT BIT(5)
> #define ACCEL_CAP_RAS_JSON BIT(6)
> #define ACCEL_CAP_RAS_ASN1 BIT(7)
>
> or something along those lines. Anyway, just putting the idea out there.
>
> I'm sure there are a lot of opinions on this topic and that there are
> a lot of implications of using this or that serialization format.
> Obviously there can be security implications as well.
>
> Apologies if I've already missed some of this discussion.
>
> Cheers,
>
> C
>
> [1] https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html
> [2] https://zephyr2022.sched.com/event/10CFD/open-source-nvme-ai-accelerator-platform-with-zephyr-karol-gugala-antmicro
> [3] https://lpc.events/event/16/contributions/1245/

Hi Christopher,
Thanks for all this information.
At this stage, I'm mainly trying to gather information on RAS current
status in the OCP (Open Compute Project) and Linux kernel, so your
email was on point :)
It seems to me that this topic is broader than just accelerators or
GPUs, because there are other device types that are implementing some
kind of RAS (e.g. NIC).
My gut feeling is that the end solution would be some kind of generic
kernel driver/framework that will expose RAS to userspace for any
device type, but it's too early to tell.
I'll update once I have the full picture.

Thanks,
Oded
