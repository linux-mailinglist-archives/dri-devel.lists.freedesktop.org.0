Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0801537693E
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 19:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7B46EE11;
	Fri,  7 May 2021 17:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A036EE05;
 Fri,  7 May 2021 17:04:52 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id x19so13714377lfa.2;
 Fri, 07 May 2021 10:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=As0+QF4TLvCwMjWlGqhQacwhIi2kfiM2nw4uGB7p4N8=;
 b=XaS8GacFeLZ9LdipAnAd9lmHMU5Bram4sJAXmI5tjXjuePToDyszeoER9rBD1jP5FD
 G/iFhdBDQYXfUfAdNRXVue+92PkBxExlxzlSXIbYo5gqqtqGDsjTtDaFXVQqCrSIAbbV
 f3NeLSg8WA1QDhql50+sz3vsfJEUQNRZsEEIfJKcSV6tjmaovZZhN60fod42kmSrf9Au
 LqzSdMGedlwI88yfdk95tBQIGuo5dRYgbseIbv7i0Ndt+EbBOBQEgnzKpzHzY5BV6NYP
 WttdkufC4r8Fn7J9E+XuKfSdQBYuu8smQs6s5t4/CuGKQyuOjhmqLJa9g5rtp8UaDJrJ
 JeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=As0+QF4TLvCwMjWlGqhQacwhIi2kfiM2nw4uGB7p4N8=;
 b=GszySFYBcB2GuLNoxrJVi2fLcl/rreR5v6TdvIPKdp36YATpOuL0+uAq7Fm7VWw1AX
 9XBg3veaDP3U/bVDUnEsyPiy3pgCBQpQefP50PTsNRVZ4vd9Jsd6DCveuUmrOfCWzFdB
 8H+GujplXlI1i9nzUFwPyaAm+Q7yUsFdXk9mmJA698qtO0i+Pop+aglgPoTT7bnJG4A3
 DKkuvkIH++K8o8c2hqNoV7je75MdsQR02gku6V/97/vUCqKiDctD7paKE8QcM6yEMhJq
 +YijnLFzuyVskSaKkgJDoZm3bk+pQhevlQP6BhelUCQWgxD+BCj5CuUkqux09pMFPNCt
 UEkw==
X-Gm-Message-State: AOAM530Wiyh+SsWG68PE3i/K+y6hMi81djGGrnqRrY2qagdH3ccWbSay
 ryASsXRFSG2Duj+1CLSsA/6cUYs57v6+GhS7lLI=
X-Google-Smtp-Source: ABdhPJyNW4Va1Nx97/p0bkdWKZm1kMh8BbHdHom7nIdyBuEQj8avc+yZs0hyZEoSNPZlzEZ4Hw9AXU9VHivTMhxw+dc=
X-Received: by 2002:a19:5508:: with SMTP id n8mr7115859lfe.542.1620407091091; 
 Fri, 07 May 2021 10:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAOWid-c4Nk717xUah19B=z=2DtztbtU=_4=fQdfhqpfNJYN2gw@mail.gmail.com>
 <CAKMK7uFEhyJChERFQ_DYFU4UCA2Ox4wTkds3+GeyURH5xNMTCA@mail.gmail.com>
 <CAOWid-fL0=OM2XiOH+NFgn_e2L4Yx8sXA-+HicUb9bzhP0t8Bw@mail.gmail.com>
 <YJUBer3wWKSAeXe7@phenom.ffwll.local>
 <CAOWid-dmRsZUjF3cJ8+mx5FM9ksNQ_P9xY3jqxFiFMvN29SaLw@mail.gmail.com>
 <YJVnO+TCRW83S6w4@phenom.ffwll.local>
 <CADnq5_Pvtj1vb0bak_gUkv9J3+vfsMZxVKTKYeUvwQCajAWoVQ@mail.gmail.com>
 <YJVqL4c6SJc8wdkK@phenom.ffwll.local>
 <CADnq5_PHjiHy=Su_1VKr5ycdnXN-OuSXw0X_TeNqSj+TJs2MGA@mail.gmail.com>
 <CADnq5_OjaPw5iF_82bjNPt6v-7OcRmXmXECcN+Gdg1NcucJiHA@mail.gmail.com>
 <YJVwtS9XJlogZRqv@phenom.ffwll.local>
In-Reply-To: <YJVwtS9XJlogZRqv@phenom.ffwll.local>
From: Kenny Ho <y2kenny@gmail.com>
Date: Fri, 7 May 2021 13:04:39 -0400
Message-ID: <CAOWid-fRgjuY46KA-HBbEfhfwsWvDyhkp+iwZq=wA1h+Uix32g@mail.gmail.com>
Subject: Re: [RFC] Add BPF_PROG_TYPE_CGROUP_IOCTL
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Song Liu <songliubraving@fb.com>, KP Singh <kpsingh@chromium.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Kenny Ho <Kenny.Ho@amd.com>,
 Brian Welty <brian.welty@intel.com>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>, Yonghong Song <yhs@fb.com>,
 Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Network Development <netdev@vger.kernel.org>,
 "open list:CONTROL GROUP \(CGROUP\)" <cgroups@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>, Andrii Nakryiko <andriin@fb.com>,
 Martin KaFai Lau <kafai@fb.com>, Alex Deucher <alexander.deucher@amd.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 7, 2021 at 12:54 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> SRIOV is kinda by design vendor specific. You set up the VF endpoint, it
> shows up, it's all hw+fw magic. Nothing for cgroups to manage here at all.
Right, so in theory you just use the device cgroup with the VF endpoints.

> All I meant is that for the container/cgroups world starting out with
> time-sharing feels like the best fit, least because your SRIOV designers
> also seem to think that's the best first cut for cloud-y computing.
> Whether it's virtualized or containerized is a distinction that's getting
> ever more blurry, with virtualization become a lot more dynamic and
> container runtimes als possibly using hw virtualization underneath.
I disagree.  By the same logic, the existence of CU mask would imply
it being the preferred way for sub-device control per process.

Kenny
