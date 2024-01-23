Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A7C839D24
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 00:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E1B10F0E0;
	Tue, 23 Jan 2024 23:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2141110F0D1;
 Tue, 23 Jan 2024 23:20:31 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-50eabfac2b7so6206769e87.0; 
 Tue, 23 Jan 2024 15:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706051969; x=1706656769; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M5lsjQAMvmARbfng+ZC+oAy6Jm5m8MdlGzyMgcVRFUw=;
 b=OEsuBjlhk9oaxdzn+4hTchNIKFYRLkuibTX4JbQRC1r4GAkr9AS425KYs0aGXmzpau
 AzCJzSPCr09YBs+NohqcqgsUj+a9UIyvgDDyWT/rDhBnt/Cw4lR/h13Q6B8cpqNsWpm7
 c2euXx+evyBJLnKCPI7RgG02woyHyftjpOBFhgen0usXvc835/msyBDdpPkpgwtsqei9
 pCQHPR8xffOtGbns0I0TjtsWjENmcP3UzRkD71jpH6Tmm8MuhR8t37nCMASr7j+xSN7e
 8qIawec05a6+w085rxqy2nPj+PaZYImQGt2wTIrSi94E4Q+uZddt45azOd/bwAj9ZM5j
 T/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706051969; x=1706656769;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M5lsjQAMvmARbfng+ZC+oAy6Jm5m8MdlGzyMgcVRFUw=;
 b=lHM79iboxh2jwb7qq59ROzcK2pvq6J8YLNP7OYeRjdq5I7NPlZGoMZq8UXVtt9yECt
 oHNMkfTBwpqTByZCfkcEG2EvnewUFHeVw2kAEI5VbX9HZ28BcOC/MmwM1ZMJ/smEJuMG
 46b1N/ZwsyByxkLbYIGf8SA3YiLhRHgyrqoL5z7UVArp31feDNS0lGLDJBPs6hhizxAl
 A1pSNbe9DAWJl7UZHMNAtrPa2YrUyWSfrHPI1qEv+Joq7sfnqDVpphhzYyQ6jGXSjvWp
 QlkCuB0m0QBxUlBA41Gbwhzi0JdDTK9tO4pEoZHWvxnZ9aeqrNzossRYQJNWa2uDq9iO
 ZEbg==
X-Gm-Message-State: AOJu0Ywzb4nQ9dGM8vaeUE1PCJveZ+bjSE2DhDMOJCeuUpA5B+K5+g/N
 /YiTnl47AspVQOpzwNXUczrriW8AcBSFJqz7nWh4DHSpMm7+KygpOSq8kyrkJcUG6/+RPT1bMnT
 6uZOYs0Tg88piCdxQ6iB6Q1A1AFA=
X-Google-Smtp-Source: AGHT+IGmy9LMF8+huaUJrVNG3UM69DsTbGNL9dgDDYl1j0VON7S/Thj0pZyWpIbibwenLY1MV4W5JsIVYCYyGY4la/g=
X-Received: by 2002:a05:6512:114c:b0:50e:d71a:ebd0 with SMTP id
 m12-20020a056512114c00b0050ed71aebd0mr3518760lfg.40.1706051968883; Tue, 23
 Jan 2024 15:19:28 -0800 (PST)
MIME-Version: 1.0
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
 <20240117031212.1104034-2-nunes.erico@gmail.com>
 <CAKGbVbsydzXyKuhN8VyW9zYwuOMWzvz192WKKReHVX1XCnuXGQ@mail.gmail.com>
 <CAK4VdL2PnWTZ+M2eQqF22+VuF-YGKb_WjG=168BcuBDqD8+9kA@mail.gmail.com>
 <CAKGbVbvWAM64T+a6_VRL99araN_2dubu4vO=mqzCoC1p2m_X-g@mail.gmail.com>
In-Reply-To: <CAKGbVbvWAM64T+a6_VRL99araN_2dubu4vO=mqzCoC1p2m_X-g@mail.gmail.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Wed, 24 Jan 2024 00:19:16 +0100
Message-ID: <CAK4VdL3Tp33Wi5fmsh92XFWP8GE3TZMa473a=FeZajgnHn2mbA@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] drm/lima: fix devfreq refcount imbalance for job
 timeouts
To: Qiang Yu <yuq825@gmail.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, anarsoul@gmail.com,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 19, 2024 at 2:50=E2=80=AFAM Qiang Yu <yuq825@gmail.com> wrote:
>
> On Thu, Jan 18, 2024 at 7:14=E2=80=AFPM Erico Nunes <nunes.erico@gmail.co=
m> wrote:
> >
> > On Thu, Jan 18, 2024 at 2:36=E2=80=AFAM Qiang Yu <yuq825@gmail.com> wro=
te:
> > >
> > > So this is caused by same job trigger both done and timeout handling?
> > > I think a better way to solve this is to make sure only one handler
> > > (done or timeout) process the job instead of just making lima_pm_idle=
()
> > > unique.
> >
> > It's not very clear to me how to best ensure that, with the drm_sched
> > software timeout and the irq happening potentially at the same time.
> This could be done by stopping scheduler run more job and disable
> GP/PP interrupt. Then after sync irq, there should be no more new
> irq gets in when we handling timeout.
>
> > I think patch 4 in this series describes and covers the most common
> > case that this would be hit. So maybe now this patch could be dropped
> > in favour of just that one.
> Yes.

After dropping the patch while testing to send v2, I managed to
reproduce this issue again.
Looking at a trace it seems that this actually happened with the test workl=
oad:
lima_sched_timedout_job -> (fence by is not signaled and new fence
check is passed) -> irq happens preempting lima_sched_timedout_job,
fence is signaled and lima_pm_idle called once at
lima_sched_pipe_task_done -> lima_sched_timedout_job continues and
calls lima_pm_idle again

So I think we still need this patch to at least prevent the bug with
the current software timeout. If we move to the hardware watchdog
timeout later we might be able to remove it anyway, but that will
still require separate work and testing.

Erico
