Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A10748889
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 17:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A40110E17A;
	Wed,  5 Jul 2023 15:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E1E10E17A;
 Wed,  5 Jul 2023 15:54:35 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8ceso83431965e9.0; 
 Wed, 05 Jul 2023 08:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688572473; x=1691164473;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6CZyzkzUMz1fXOQ881Ov7Y8cjX9OK+wAcM/N2Fl/7tk=;
 b=kpM+idAhMrvaBCu3Jtyd7+ErrWLoeJDtMOQaFwhQp23JjMJSxNpiF1Lbk3Jc8/DtTW
 O59rBXU+xgMzhOLHzH+i0EDlbz+zcEhI5mOAZxNq2en000xXCuE2yf9FHZtanNCKmja1
 TOwJftcnxSCl446i40J3UYq369wwjI1xX2uzErTlNzA8fV4DHRr2HHPoyU1UiTjz4545
 8EiwXG0XfUersmCjwJVPo8zr/L9gW3Y4yzphuldGbLw3PWc6FGrUSdH77t0PrziVNkla
 YaoXri8GlT17+Ql6BNF9VUritkFICJUFa5yZpj0ZanK40JTZQPRvIDt+xe+OgRGsetZi
 7FMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688572473; x=1691164473;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6CZyzkzUMz1fXOQ881Ov7Y8cjX9OK+wAcM/N2Fl/7tk=;
 b=YgUjNfj4QKxtJkQ7hIQY7ASq11IW7CyM18DJEmer4srPxcVnqjxRE0p6Uu70JvF8wK
 sO+BIdfAw2ZA+H6DpBhOkWkASQJMAxKpi9vVugAanqnFsAnBiF5EDvsBVpAQm2y5hVbw
 Wmo5nrfjUudlftn3n4Yorb/X/8DKB9fm/btQM+9r3JORVr5rcgk5qbd0usz6jjHVnWr7
 uSKvUKO9laimU0u4NJEiWrweWJ/gmehaGfJiTLY2QG9cE17lh1R6egwjB327i3acEoOR
 BlLZNpA4dh2fMd+TM0p2wIcQJ4GkYJvW7x562jvTRSfWOYllwbbnNl5zkT23IAaLQFAl
 h4QA==
X-Gm-Message-State: AC+VfDwY63qL6mUSDKOy/U9guO3B1lsbWSwcnKrd/07WHjAyVn+a9jQC
 zXCu5VapU70L5l4JVQIXZy91WAMlPRq3MDfh/v4=
X-Google-Smtp-Source: ACHHUZ51AikI0ltda0xwrPKgoViozpgiEIbk+gOp/vo8TXgdd+WFbbHp/gUy/0NYhbIg0aXGMaMdMNMvUMACRwo68Mc=
X-Received: by 2002:a05:600c:24d:b0:3f7:f884:7be3 with SMTP id
 13-20020a05600c024d00b003f7f8847be3mr13750491wmj.4.1688572472427; Wed, 05 Jul
 2023 08:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <CA+hFU4z1pc=KUVVqyqfXEceUqMXQgh-qUnuB=1nkPELghvQO7w@mail.gmail.com>
 <CADnq5_MNVdtdcWKSz6dgmsjg+kEu8p5FVE+fkw_5BaXeG3QGow@mail.gmail.com>
 <afab1f5a-e581-3416-e2c2-238ea120655b@mailbox.org>
 <CAAxE2A5C96k5ua+r938VA_+w7gHHNTdF3n8LwDb98W0Bf9wCVA@mail.gmail.com>
 <7c1e6df5-1ad4-be3c-b95d-92dc62a8c537@mailbox.org>
 <CAAxE2A7RGDY4eRC85CsqfszNzyKvMU2MX1wa+3HZ1hgNeAw3cQ@mail.gmail.com>
 <cb0b6b51-3a94-481b-26a1-89ff398d7835@mailbox.org>
 <CAAxE2A7tNCWkL_M2YcE=RN+nqqcokgBR4hcD2sR3fGAY2t4uLg@mail.gmail.com>
 <2f993fe4-8e95-4a67-c2f1-6adc2c431834@mailbox.org>
In-Reply-To: <2f993fe4-8e95-4a67-c2f1-6adc2c431834@mailbox.org>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Wed, 5 Jul 2023 11:53:56 -0400
Message-ID: <CAAxE2A7s2ANMGkFizMJda4nzQO1Wi+oxkST0xZ2KgBM6wYXA5w@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] drm/doc: Document DRM device reset expectations
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, kernel-dev@igalia.com,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 5, 2023 at 3:32=E2=80=AFAM Michel D=C3=A4nzer <michel.daenzer@m=
ailbox.org> wrote:
>
> On 7/5/23 08:30, Marek Ol=C5=A1=C3=A1k wrote:
> > On Tue, Jul 4, 2023, 03:55 Michel D=C3=A4nzer <michel.daenzer@mailbox.o=
rg> wrote:
> >     On 7/4/23 04:34, Marek Ol=C5=A1=C3=A1k wrote:
> >     > On Mon, Jul 3, 2023, 03:12 Michel D=C3=A4nzer <michel.daenzer@mai=
lbox.org > wrote:
> >     >     On 6/30/23 22:32, Marek Ol=C5=A1=C3=A1k wrote:
> >     >     > On Fri, Jun 30, 2023 at 11:11=E2=80=AFAM Michel D=C3=A4nzer=
 <michel.daenzer@mailbox.org> wrote:
> >     >     >> On 6/30/23 16:59, Alex Deucher wrote:
> >     >     >>> On Fri, Jun 30, 2023 at 10:49=E2=80=AFAM Sebastian Wick
> >     >     >>> <sebastian.wick@redhat.com <mailto:sebastian.wick@redhat.=
com> wrote:
> >     >     >>>> On Tue, Jun 27, 2023 at 3:23=E2=80=AFPM Andr=C3=A9 Almei=
da <andrealmeid@igalia.com> wrote:
> >     >     >>>>>
> >     >     >>>>> +Robustness
> >     >     >>>>> +----------
> >     >     >>>>> +
> >     >     >>>>> +The only way to try to keep an application working aft=
er a reset is if it
> >     >     >>>>> +complies with the robustness aspects of the graphical =
API that it is using.
> >     >     >>>>> +
> >     >     >>>>> +Graphical APIs provide ways to applications to deal wi=
th device resets. However,
> >     >     >>>>> +there is no guarantee that the app will use such featu=
res correctly, and the
> >     >     >>>>> +UMD can implement policies to close the app if it is a=
 repeating offender,
> >     >     >>>>> +likely in a broken loop. This is done to ensure that i=
t does not keep blocking
> >     >     >>>>> +the user interface from being correctly displayed. Thi=
s should be done even if
> >     >     >>>>> +the app is correct but happens to trigger some bug in =
the hardware/driver.
> >     >     >>>>
> >     >     >>>> I still don't think it's good to let the kernel arbitrar=
ily kill
> >     >     >>>> processes that it thinks are not well-behaved based on s=
ome heuristics
> >     >     >>>> and policy.
> >     >     >>>>
> >     >     >>>> Can't this be outsourced to user space? Expose the infor=
mation about
> >     >     >>>> processes causing a device and let e.g. systemd deal wit=
h coming up
> >     >     >>>> with a policy and with killing stuff.
> >     >     >>>
> >     >     >>> I don't think it's the kernel doing the killing, it would=
 be the UMD.
> >     >     >>> E.g., if the app is guilty and doesn't support robustness=
 the UMD can
> >     >     >>> just call exit().
> >     >     >>
> >     >     >> It would be safer to just ignore API calls[0], similarly t=
o what is done until the application destroys the context with robustness. =
Calling exit() likely results in losing any unsaved work, whereas at least =
some applications might otherwise allow saving the work by other means.
> >     >     >
> >     >     > That's a terrible idea. Ignoring API calls would be identic=
al to a freeze. You might as well disable GPU recovery because the result w=
ould be the same.
> >     >
> >     >     No GPU recovery would affect everything using the GPU, wherea=
s this affects only non-robust applications.
> >     >
> >     > which is currently the majority.
> >
> >     Not sure where you're going with this. Applications need to use rob=
ustness to be able to recover from a GPU hang, and the GPU needs to be rese=
t for that. So disabling GPU reset is not the same as what we're discussing=
 here.
> >
> >
> >     >     > - non-robust contexts: call exit(1) immediately, which is t=
he best way to recover
> >     >
> >     >     That's not the UMD's call to make.
> >     >
> >     > That's absolutely the UMD's call to make because that's mandated =
by the hw and API design
> >
> >     Can you point us to a spec which mandates that the process must be =
killed in this case?
> >
> >
> >     > and only driver devs know this, which this thread is a proof of. =
The default behavior is to skip all command submission if a non-robust cont=
ext is lost, which looks like a freeze. That's required to prevent infinite=
 hangs from the same context and can be caused by the side effects of the G=
PU reset itself, not by the cause of the previous hang. The only way out of=
 that is killing the process.
> >
> >     The UMD killing the process is not the only way out of that, and do=
ing so is overreach on its part. The UMD is but one out of many components =
in a process, not the main one or a special one. It doesn't get to decide w=
hen the process must die, certainly not under circumstances where it must b=
e able to continue while ignoring API calls (that's required for robustness=
).
> >
> >
> > You're mixing things up. Robust apps don't any special action from a UM=
D. Only non-robust apps need to be killed for proper recovery with the only=
 other alternative being not updating the window/screen,
>
> I'm saying they don't "need" to be killed, since the UMD must be able to =
keep going while ignoring API calls (or it couldn't support robustness). It=
's a choice, one which is not for the UMD to make.
>
>
> > Also it's already used and required by our customers on Android because=
 killing a process returns the user to the desktop screen and can generate =
a crash dump instead of keeping the app output frozen, and they agree that =
this is the best user experience given the circumstances.
>
> Then some appropriate Android component needs to make that call. The UMD =
is not it.

We can change it once Android and Linux have a better way to handle
non-robust apps. Until then, generating a core dump after a GPU crash
produces the best outcome for users and developers.

Marek
