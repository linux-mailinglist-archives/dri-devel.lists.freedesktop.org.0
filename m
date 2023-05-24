Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1603B70F383
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 11:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5E810E653;
	Wed, 24 May 2023 09:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B7010E64F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 09:53:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AB6DB62E1A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 09:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A22C4339B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 09:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684921979;
 bh=mLGpWzT52d86xWOjEslRdlb2EFnQAC+zl60iEvvybzk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dRVoidHqVfZv6tgmo1gYFHnl2YkGkeNXjoErV8EFy4q0C/EK/6gpOXd7lD4P+GMJT
 J+A/BN1UhvB1huuR9n2fh0X930VD7JGUAbFAz9TNElAT3E74pEzIKD5M1EEWdomD3n
 HpXXe2n5aO0Sop/J56al7nM88cFXsuWzFZhyF83+dbo7lT8cR6Mo/dkZ6DQoLyGCYB
 oM8JZDPF9+2MZoghYvog55gS0cUfSDX3TNFXLT0/FxuysmXZtaqnhEI1+xT0MFqo3v
 TCA8Pgh1OSxLx/1qm7LLg9bFqA9h1/y+K0XYZBU+7Eq5dqCoeqH2til1L8Su3Y37Sd
 r42zV5ndO0rvA==
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-561bb2be5f8so9988097b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 02:52:59 -0700 (PDT)
X-Gm-Message-State: AC+VfDzNj+bEHxq2/j/e815PdFHmhVXiL3HKe4WBc9O6Cl1isa9NnBUh
 8wVsDaX7IAFDGdgAYGlzbo1hkHpi7TP1GalebXI=
X-Google-Smtp-Source: ACHHUZ4jLGfZkaZEI6q1SbWo+1PQK1ngrXApvgv6CGWp5vqM+e0KpXdsLp2DKAkhU/2+wcK0dAD0ELrvT0jDvBQb+tA=
X-Received: by 2002:a0d:e689:0:b0:561:e7e0:a1a8 with SMTP id
 p131-20020a0de689000000b00561e7e0a1a8mr20774779ywe.36.1684921978178; Wed, 24
 May 2023 02:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230524074847.866711-1-stanislaw.gruszka@linux.intel.com>
 <CAFCwf11x5xJmCsX_hXeHC3Vhjd2-JMRJJWNbdO4_p_3CsUbSmQ@mail.gmail.com>
 <20230524082952.GA867611@linux.intel.com>
In-Reply-To: <20230524082952.GA867611@linux.intel.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Wed, 24 May 2023 12:52:31 +0300
X-Gmail-Original-Message-ID: <CAFCwf122SRcESw0Pe57k239b67_Bj=HykPPiM5c7MN-m4_AXzw@mail.gmail.com>
Message-ID: <CAFCwf122SRcESw0Pe57k239b67_Bj=HykPPiM5c7MN-m4_AXzw@mail.gmail.com>
Subject: Re: [PATCH 0/5] accel/ivpu: Add debugfs support
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 11:29=E2=80=AFAM Stanislaw Gruszka
<stanislaw.gruszka@linux.intel.com> wrote:
>
> Hi
>
> On Wed, May 24, 2023 at 10:55:08AM +0300, Oded Gabbay wrote:
> > On Wed, May 24, 2023 at 10:49=E2=80=AFAM Stanislaw Gruszka
> > <stanislaw.gruszka@linux.intel.com> wrote:
> > >
> > > Add debugfs support for ivpu driver, most importantly firmware loging
> > > and tracing.
> > Hi,
> > Without looking at the code I have 2 comments/questions:
> >
> > 1. Please add an ABI documentation in Documentation/ABI/testing/ or
> > Documentation/ABI/stable (if you are feeling courageous). You can see
> > for example habana's file at
> > Documentation/ABI/testing/debugfs-driver-habanalabs
>
> We do not promise any ABI compatibility for debugfs for ivpu,
> we can add, remove or modify at any time. Hence make no sense to add
> documentation files to Documentation/ABI/ for us.
ok, I understand that documenting debugfs is not the norm in drm, so
I'm not going to change that policy.

>
> > 2. Is this synced with Christian's upcoming changes to the debugfs
> > infra in drm ? If not, I might suggest to sync with that and wait
> > until those patches are merged because they change the layout of
> > debugfs nodes.
>
> Is not synced. We can wait before Christian changes get in, what
> hopefully will happen soon. But if not, ivpu debugfs can be modified
> along with the changes. I can assist with that.
I just thought you will prefer to do that, as it will change the
layout and then you need to change your s/w stack, but it's up to you
ofc.
Thanks,
Oded

>
> Regards
> Stanislaw
>
