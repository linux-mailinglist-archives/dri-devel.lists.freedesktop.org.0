Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BFA82B59B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 21:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5848910E9DB;
	Thu, 11 Jan 2024 20:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30A010E9E0;
 Thu, 11 Jan 2024 20:01:03 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e5f3b390fso9589165e9.2; 
 Thu, 11 Jan 2024 12:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705003262; x=1705608062; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HAL60ZiXYTrQWwc6XvTjBF7mU0s/R7MUfIaHS38evWw=;
 b=jSpPp9I39xbbLmxHplgac2HcUWnPid0guml5hGGxbkp/RnNh7lKpNswR2A2Njv/Zc5
 q6ABlamE7sWmGhZbdGzAyiiqmrQKLLJRg6xGA4THi9lcSPtNpSROTP841aPvfAlmLezy
 tR6qaA6mH2poe77hS0b9d9SGF7M8l7yEOhBZuTPrLknIGn8IzKAQCxtNiFTNPIf9qObf
 cQjYwQanpGsXXjp//gmTXjRry7rDHKBUDyQYjPUCxeA1S0uAUkHT8mFjhPr7QazP86S9
 yAxRL5jqT+WzUzYaYlWvenDucuochBUN6W60y+HThtbfLCAT8qMFtTWTr+wzPf7hWweG
 8LTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705003262; x=1705608062;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HAL60ZiXYTrQWwc6XvTjBF7mU0s/R7MUfIaHS38evWw=;
 b=UifxUqxPkaXkP45Wf3IWyXZhkHynz84YXGXJUEky2xiwnQN9BKtsJbCL3a7rj3mATM
 RwwV7zWEyb+SddgjQVprUBNaE94Z3vA0J3c4GBH4uBM7BsF/CUc8IaeL4dyfymlE7b1Y
 iHjz/KcnJEaoBQ5K1odHqSmmpWfy5JeT06Csifp84d1NDMYpfJCt2smtTrg7ETefEpxv
 pvHe/onKsHQMyyGjQ+01ZwI4RNE2M9Q0grb7fOaR6M0XmpQaGILTeSGO/sY/p6MR+It5
 xk9Vrs4sfpzMQt9UZlkld7O3s0GQmdBMsQWZHDlUtyq8PCMM+j0Kdfqw0cpCFjiVpBzJ
 LAWw==
X-Gm-Message-State: AOJu0YwIcKXtJDTn6Vs8BgTl+dwKb3EnhC2AHMk8okDVPCV9pK+ZDg9q
 c7UJSX9Qlf0sTyQo60KvoRUrGYamsA349LpfCpQ=
X-Google-Smtp-Source: AGHT+IEuD70YW9odmSJBW0ovp3CIEuHoCB7eupgpN0U69zefCCa6AEpsUHBsIEtkfYtc2dUZae2qy6ZzWQ5YfFTTiDA=
X-Received: by 2002:a05:600c:6548:b0:40e:52a7:ac58 with SMTP id
 dn8-20020a05600c654800b0040e52a7ac58mr243439wmb.65.1705003261872; Thu, 11 Jan
 2024 12:01:01 -0800 (PST)
MIME-Version: 1.0
References: <20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org>
 <20240109-update-llvm-links-v1-1-eb09b59db071@kernel.org>
 <6a655e9f-9878-4292-9d16-f988c4bdfc73@linux.dev>
 <20240111194001.GA3805856@dev-arch.thelio-3990X>
In-Reply-To: <20240111194001.GA3805856@dev-arch.thelio-3990X>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 11 Jan 2024 12:00:50 -0800
Message-ID: <CAADnVQKFv2DKE=Um=+kcEzSWYCp9USQT_VpTawzNY6eRaUdu5g@mail.gmail.com>
Subject: Re: [PATCH 1/3] selftests/bpf: Update LLVM Phabricator links
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: linux-efi <linux-efi@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 kvm@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>,
 Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Yonghong Song <yonghong.song@linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Mykola Lysenko <mykolal@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, linux-media@vger.kernel.org,
 Linux Power Management <linux-pm@vger.kernel.org>, bridge@lists.linux.dev,
 bpf <bpf@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Network Development <netdev@vger.kernel.org>, patches@lists.linux.dev,
 LSM List <linux-security-module@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.org,
 ppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 11, 2024 at 11:40=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> Hi Yonghong,
>
> On Wed, Jan 10, 2024 at 08:05:36PM -0800, Yonghong Song wrote:
> >
> > On 1/9/24 2:16 PM, Nathan Chancellor wrote:
> > > reviews.llvm.org was LLVM's Phabricator instances for code review. It
> > > has been abandoned in favor of GitHub pull requests. While the majori=
ty
> > > of links in the kernel sources still work because of the work Fangrui
> > > has done turning the dynamic Phabricator instance into a static archi=
ve,
> > > there are some issues with that work, so preemptively convert all the
> > > links in the kernel sources to point to the commit on GitHub.
> > >
> > > Most of the commits have the corresponding differential review link i=
n
> > > the commit message itself so there should not be any loss of fidelity=
 in
> > > the relevant information.
> > >
> > > Additionally, fix a typo in the xdpwall.c print ("LLMV" -> "LLVM") wh=
ile
> > > in the area.
> > >
> > > Link: https://discourse.llvm.org/t/update-on-github-pull-requests/715=
40/172
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> >
> > Ack with one nit below.
> >
> > Acked-by: Yonghong Song <yonghong.song@linux.dev>
>
> <snip>
>
> > > @@ -304,6 +304,6 @@ from running test_progs will look like:
> > >   .. code-block:: console
> > > -  test_xdpwall:FAIL:Does LLVM have https://reviews.llvm.org/D109073?=
 unexpected error: -4007
> > > +  test_xdpwall:FAIL:Does LLVM have https://github.com/llvm/llvm-proj=
ect/commit/ea72b0319d7b0f0c2fcf41d121afa5d031b319d5? unexpected error: -400=
7
> > > -__ https://reviews.llvm.org/D109073
> > > +__ https://github.com/llvm/llvm-project/commit/ea72b0319d7b0f0c2fcf4=
1d121afa5d031b319d
> >
> > To be consistent with other links, could you add the missing last alnum=
 '5' to the above link?
>
> Thanks a lot for catching this and providing an ack. Andrew, could you
> squash this update into selftests-bpf-update-llvm-phabricator-links.patch=
?

Please send a new patch.
We'd like to take all bpf patches through the bpf tree to avoid conflicts.
