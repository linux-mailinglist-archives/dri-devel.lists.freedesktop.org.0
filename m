Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4C1626420
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 23:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F58F10E04D;
	Fri, 11 Nov 2022 22:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B5F10E04D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 22:04:06 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id k2so15581139ejr.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 14:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OZjjq/Y666UuQv+BQeivaEu2qR4Yd6nR9XcmCK1OHP8=;
 b=CJRrTjFyFrIxf1yiyysj959UgTMrhlihOUBpd/t7Fu/2JkEEVa4T+KTNDsBKUUjV9N
 kY5QVTH2xnjcFmgN56CiiL0p1AD1DfbHLXkzkMB+4+zIIfclmUqz8h8z42rMiX+KvmhE
 TMZ2Wa44ksGC4Z+C/Dph5Fxczn/G6xJ41hN/nW33B5lBJOvBBJ46IYYhgF4Y0XuVR+JF
 Wf39LIezDmf1wshIfHh3dXjffGXNFyo+JLDhtFRQ2+pnazb+YKcPs8+lrAV1VFF12mEV
 bG7UV4XtjvNCati6qL3O5Aufk8+wqurZKUZdcfSphY2XW1XIQZEwJ2SBuJyv8nqD0pce
 jdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OZjjq/Y666UuQv+BQeivaEu2qR4Yd6nR9XcmCK1OHP8=;
 b=Ec6lhawq7ID+X2UFcJiVARbHh50WFNfOw1N26YGB/DUkuQzpbm1CqcbX+BzOfvzDg5
 56FXzFDlFl1HKLXrvqDrBZfW1NuHJQvoRHE5xsfteB5vj4zXVYyGPusw0KPVKDlQfwSX
 MjQHvHuFp9e4Bu8aewsZxEn8Le3vWufd0aAtyg2JsjGXO7nPxqm8zRqO0A8Cm6oyAREc
 YJhzGD6UH/ZZCfUxXfbAGHzaAlu6U23nQP4bdmTlP6Dn3/QdHy23VOXpYjYD5EQdvYiD
 akUV23vx6SQ13mCR0rwLG5vxYnFQtYf3fhGX1tCzP6BM4LO0zGqBwHJB9RO+N/UOFroh
 4kbQ==
X-Gm-Message-State: ANoB5pk1Yl5LmL1q3gwZjvWjC/in7YE0bXyjude4hdC3RSOLdapGTHPf
 TX/PhE52aw6rhvF95ZMcSPPA/o0DvAJy4Y/kFkg=
X-Google-Smtp-Source: AA0mqf7boUZCG6l/FLFLHrLLcWtLXCito8vLVSUMq3WJmYrAdm9zVTs15avreptgXVQkuL0yrySnY5u6ZYWW9BMZcIw=
X-Received: by 2002:a17:906:a14:b0:7ad:90dc:eaf2 with SMTP id
 w20-20020a1709060a1400b007ad90dceaf2mr3495432ejf.526.1668204244513; Fri, 11
 Nov 2022 14:04:04 -0800 (PST)
MIME-Version: 1.0
References: <20221106210225.2065371-1-ogabbay@kernel.org>
In-Reply-To: <20221106210225.2065371-1-ogabbay@kernel.org>
From: Christopher Friedt <chrisfriedt@gmail.com>
Date: Fri, 11 Nov 2022 17:03:52 -0500
Message-ID: <CAF4BF-Qo_3ZE+hwF2e-gfrQHXpZU+uyyxaOf29YLcp7wh_eCFg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/3] new subsystem for compute accelerator devices
To: Oded Gabbay <ogabbay@kernel.org>
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
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, cfriedt@meta.com,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Jiho Chu <jiho.chu@samsung.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Oded,

On Sun, Nov 6, 2022 at 4:03 PM Oded Gabbay <ogabbay@kernel.org> wrote:
> The patches are in the following repo:
> https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git/log/?h=accel_v3
>
> As in v2, The HEAD of that branch is a commit adding a dummy driver that
> registers an accel device using the new framework. This can be served
> as a simple reference. I have checked inserting and removing the dummy driver,
> and opening and closing /dev/accel/accel0 and nothing got broken :)
>
> v1 cover letter:
> https://lkml.org/lkml/2022/10/22/544
>
> v2 cover letter:
> https://lore.kernel.org/lkml/20221102203405.1797491-1-ogabbay@kernel.org/T/

I was in the room at Plumbers when a lot of this was discussed (in
2022 and also 2019), but I haven't really had an opportunity to
provide feedback until now. In general, I think it's great and thanks
for pushing it forward and getting feedback.

The v1 cover letter mentioned RAS (reliability, availability,
serviceability) and Dave also mentioned it here [1]. There was a
suggestion to use Netlink. It's an area that I'm fairly interested in
because I do a lot of development on the firmware side (and
specifically, with Zephyr).

Personally, I think Netlink could be one option for serializing and
deserializing RAS information but it would be helpful for that
interface to be somewhat flexible, like a void * and length, and to
provide userspace the capability of querying which RAS formats are
supported.

For example, AntMicro used OpenAMP + rpmsg in their NVMe accelerator,
and gave a talk on it at ZDS and Plumbers this year [2][3].

In Zephyr, the LGPL license for Netlink might be a non-starter
(although I'm no lawyer). However, Zephyr does already support
OpenAMP, protobufs, json, and will soon support Thrift.

Some companies might prefer to use Netlink. Others might prefer to use
ASN.1. Some companies might prefer to use key-value pairs and limit
the parameters and messages to uint32s. Some might handle all of the
RAS details in-kernel, while others might want the kernel to act more
like a transport to firmware.

Companies already producing accelerators may have a particular
preference for serialization / deserialization in their own
datacenters.

With that, it would be helpful to be able to query RAS capabilities via ioctl.

#define ACCEL_CAP_RAS_KEY_VAL_32 BIT(0)
#define ACCEL_CAP_RAS_NETLINK BIT(1)
#define ACCEL_CAP_RAS_JSON BIT(2)
#define ACCEL_CAP_RAS_PROTOBUF BIT(3)
#define ACCEL_CAP_RAS_GRPC BIT(4)
#define ACCEL_CAP_RAS_THRIFT BIT(5)
#define ACCEL_CAP_RAS_JSON BIT(6)
#define ACCEL_CAP_RAS_ASN1 BIT(7)

or something along those lines. Anyway, just putting the idea out there.

I'm sure there are a lot of opinions on this topic and that there are
a lot of implications of using this or that serialization format.
Obviously there can be security implications as well.

Apologies if I've already missed some of this discussion.

Cheers,

C

[1] https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html
[2] https://zephyr2022.sched.com/event/10CFD/open-source-nvme-ai-accelerator-platform-with-zephyr-karol-gugala-antmicro
[3] https://lpc.events/event/16/contributions/1245/
