Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B22F26F402F
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 11:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3B810E4CE;
	Tue,  2 May 2023 09:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF6F10E4CE
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 09:30:25 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-b9e61ad0caeso156419276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 02:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google; t=1683019824; x=1685611824;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tATDJ3YwN0YIFuJkuZXPFoYmDT3Hka4KTY7vGtll+HE=;
 b=T3DU+8fIpXH7t9tYeLnAWEXQvAUb9dY3sS+DJBJM7A4zHOTrz2W9fg+oTF7EvryXGV
 ihUyAsloKLOgp9s3eqaOxiRzzAfu3ilIu7sS5lcRXkUcz6OAepnSevgFBzP8YNIIp+z8
 U/XD0xHhRaj4ZhYy/CQMX/0ZSwJsWpDEJfWhw/r5FT/agH11xFCvRTpkNzlIhx43iCRE
 0vp0q3NVq8UGLvv2WFP4QAA+/ksvTutm15aFaVAmZCIp+MhXS3R6FtE0XRBS6XXqqNre
 wa1+ZfFWlmCiCnikziBlzdMrQgTjoQTLMclgrak5o+WpiwliL99WSZKT9DZrqf8atmrq
 L7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683019824; x=1685611824;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tATDJ3YwN0YIFuJkuZXPFoYmDT3Hka4KTY7vGtll+HE=;
 b=LbqLk7FAIXvRXBg6aIdtlkPMh/n2LIZOGI+VjLyt5wr4SXkHJ1kHi8UnOLosnY35OW
 yJjzvkcW+I35hwyTxJI8Hmt5RyVfW1Gtd+cAEJaU8BwJyAqjLv8i9mV3RNUn7H/A4J5y
 /SSYhoj4ZGVA1fm1j2B8ocYDE0Uxl1M65m5y7hsHQ8takUgcHrJ8kAw1H4tkL3WuOsPP
 cc2DARLCM55wQ2BGdcxy+cidKp8jnDiUzzERuiAxFrVDf9vvI9eFwyN52sa/3xiNohgL
 FsgV9bIAvL5n19hQdjzkVn4UxWW7J3mIKAZTDcA03Tgrx7Z+QolBQ6WyQq5n33k0naR1
 kgig==
X-Gm-Message-State: AC+VfDwipyEgg62TmrAGAa+EAWm4gbkNzKqi+KYvdUdSPfnT3NIf3p5T
 GdQNuQfujZt7tSuylTjpKKLEtmQibFJat6VPNC/1JA==
X-Google-Smtp-Source: ACHHUZ4k2Wr5BMfw4doAA5XEb2a7W22S3gh2sTrz81pNU+cjdiiPly442DUUXz5B4hvu3zJ3bFBu+400FhxHTwf7SjE=
X-Received: by 2002:a25:ab04:0:b0:b9a:39e5:2f4d with SMTP id
 u4-20020a25ab04000000b00b9a39e52f4dmr2114758ybi.2.1683019823822; Tue, 02 May
 2023 02:30:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230501185747.33519-1-andrealmeid@igalia.com>
 <CADnq5_NXj4W44F_etRQ7HWdVTnf5zARCM3Y_o3EiwWiHj8QMpA@mail.gmail.com>
 <6ab2ff76-4518-6fac-071e-5d0d5adc4fcd@igalia.com>
 <cb3d2590-a1f8-fe7e-0bba-638ee80719af@amd.com>
 <CAFF-SiV0=WNmRW-D9uYUuj68Zq0APxtGLya9KR6FfZ7v0Zf2RQ@mail.gmail.com>
In-Reply-To: <CAFF-SiV0=WNmRW-D9uYUuj68Zq0APxtGLya9KR6FfZ7v0Zf2RQ@mail.gmail.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Tue, 2 May 2023 11:30:05 +0200
Message-ID: <CAP+8YyEkp7PuFZEy0_zVUsJem8dCjWpuznJ4Ysaa2JoXs7iGVQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Add AMDGPU_INFO_GUILTY_APP ioctl
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
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
Cc: "Pelloux-Prayer, Pierre-Eric" <pierre-eric.pelloux-prayer@amd.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 michel.daenzer@mailbox.org, linux-kernel@vger.kernel.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, kernel-dev@igalia.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 2, 2023 at 11:12=E2=80=AFAM Timur Krist=C3=B3f <timur.kristof@g=
mail.com> wrote:
>
> Hi Christian,
>
> Christian K=C3=B6nig <christian.koenig@amd.com> ezt =C3=ADrta (id=C5=91po=
nt: 2023. m=C3=A1j. 2., Ke 9:59):
>>
>> Am 02.05.23 um 03:26 schrieb Andr=C3=A9 Almeida:
>> > Em 01/05/2023 16:24, Alex Deucher escreveu:
>> >> On Mon, May 1, 2023 at 2:58=E2=80=AFPM Andr=C3=A9 Almeida <andrealmei=
d@igalia.com>
>> >> wrote:
>> >>>
>> >>> I know that devcoredump is also used for this kind of information,
>> >>> but I believe
>> >>> that using an IOCTL is better for interfacing Mesa + Linux rather
>> >>> than parsing
>> >>> a file that its contents are subjected to be changed.
>> >>
>> >> Can you elaborate a bit on that?  Isn't the whole point of devcoredum=
p
>> >> to store this sort of information?
>> >>
>> >
>> > I think that devcoredump is something that you could use to submit to
>> > a bug report as it is, and then people can read/parse as they want,
>> > not as an interface to be read by Mesa... I'm not sure that it's
>> > something that I would call an API. But I might be wrong, if you know
>> > something that uses that as an API please share.
>> >
>> > Anyway, relying on that for Mesa would mean that we would need to
>> > ensure stability for the file content and format, making it less
>> > flexible to modify in the future and probe to bugs, while the IOCTL is
>> > well defined and extensible. Maybe the dump from Mesa + devcoredump
>> > could be complementary information to a bug report.
>>
>> Neither using an IOCTL nor devcoredump is a good approach for this since
>> the values read from the hw register are completely unreliable. They
>> could not be available because of GFXOFF or they could be overwritten or
>> not even updated by the CP in the first place because of a hang etc....
>>
>> If you want to track progress inside an IB what you do instead is to
>> insert intermediate fence write commands into the IB. E.g. something
>> like write value X to location Y when this executes.
>>
>> This way you can not only track how far the IB processed, but also in
>> which stages of processing we where when the hang occurred. E.g. End of
>> Pipe, End of Shaders, specific shader stages etc...
>
>
> Currently our biggest challenge in the userspace driver is debugging "ran=
dom" GPU hangs. We have many dozens of bug reports from users which are lik=
e: "play the game for X hours and it will eventually hang the GPU". With th=
e currently available tools, it is impossible for us to tackle these issues=
. Andr=C3=A9's proposal would be a step in improving this situation.
>
> We already do something like what you suggest, but there are multiple pro=
blems with that approach:
>
> 1. we can only submit 1 command buffer at a time because we won't know wh=
ich IB hanged
> 2. we can't use chaining because we don't know where in the IB it hanged
> 3. it needs userspace to insert (a lot of) extra commands such as extra s=
ynchronization and memory writes
> 4. It doesn't work when GPU recovery is enabled because the information i=
s already gone when we detect the hang
>
> Consequences:
>
> A. It has a huge perf impact, so we can't enable it always
> B. Thanks to the extra synchronization, some issues can't be reproduced w=
hen this kind of debugging is enabled
> C. We have to ask users to disable GPU recovery to collect logs for us

I think the problem is that the hang debugging in radv combines too
many things. The information here can be gotten easily by adding a
breadcrumb at the start of the cmdbuffer to store the IB address (or
even just cmdbuffer CPU pointer) in the trace buffer. That should be
approximately zero overhead and would give us the same info as this.

I tried to remove (1/2) at some point because with a breadcrumb like
the above I don't think it is necessary, but I think Samuel was
against it at the time? As for all the other synchronization that is
for figuring out which part of the IB hung (e.g. without barriers the
IB processing might have moved past the hanging shader already), and I
don't think this kernel mechanism changes that.

So if we want to make this low overhead we can do this already without
new kernel support, we just need to rework radv a bit.

>
> In my opinion, the correct solution to those problems would be if the ker=
nel could give userspace the necessary information about a GPU hang before =
a GPU reset. To avoid the massive peformance cost, it would be best if we c=
ould know which IB hung and what were the commands being executed when it h=
ung (perhaps pointers to the VA of the commands), along with which shaders =
were in flight (perhaps pointers to the VA of the shader binaries).
>
> If such an interface could be created, that would mean we could easily qu=
ery this information and create useful logs of GPU hangs without much users=
pace overhead and without requiring the user to disable GPU resets etc.
>
> If it's not possible to do this, we'd appreciate some suggestions on how =
to properly solve this without the massive performance cost and without req=
uiring the user to disable GPU recovery.
>
> Side note, it is also extremely difficult to even determine whether the p=
roblem is in userspace or the kernel. While kernel developers usually dismi=
ss all GPU hangs as userspace problems, we've seen many issues where the pr=
oblem was in the kernel (eg. bugs where wrong voltages were set, etc.) - an=
y idea for tackling those kind of issues is also welcome.
>
> Thanks & best regards,
> Timur
