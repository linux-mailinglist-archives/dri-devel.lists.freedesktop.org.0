Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF68376ABB
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 21:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4656E3EF;
	Fri,  7 May 2021 19:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9716E3EF;
 Fri,  7 May 2021 19:33:30 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id o5so9683005qkb.0;
 Fri, 07 May 2021 12:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DQeWsUe4sdL5lwcQgjwlYsUvqoVq4rgrGbWAxTRdzK0=;
 b=nGfiv21ZL8q5oVm8kipMoDb98KQPA4A9rngwmvXuqZnlY2cy9b/IbHGzKHuZ9/55Wg
 5rUH8L/Fu3n0B4hrJZ4B93X2HYBnLD/Lgrm+C58moHKKCT11Xw3AzGWg6CLYIhGjw2Lb
 sxBYCIrVWBFMASbtLYqc786mHo8oNlZnIRDVF7rJuoTPbfyqlnOLZqZwAyqypSouggs0
 yp2jIiV6O9MndUS/Sv9UxT6tVTL3ZezUAQZha9GS2GhAs+s2h+T3kfrqksj93rZHFqQj
 XaLXEGcaw6eFzEOZzgOS8jX+XQ3V8bvJnHAMEhXK/akANXg9UkdyK8Suaox+MyCAwzH0
 cAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=DQeWsUe4sdL5lwcQgjwlYsUvqoVq4rgrGbWAxTRdzK0=;
 b=EyRVu51rPY4ZPNuNkVfMnz1szCn7N87cvNGCt9NETRWoRi4riRYETkGdt0qcSrlHvz
 yZGtzYcLkQDp2EyaXdFKmEq4Ja9QXNsYV3AlBSBME3/GEpEVJtllUbVdcbCSkr6fqerc
 uFkY3JcnRdo59G9JhTqncGzJkITP+jvIJYLUSFAS1SnxT4tlHsuE/4EKaL50ZIwip7Pm
 dFy4GLxeObK7Zv+4sLIZgSqku+fKTiXRB6fqEAhK1Jsgw0FO5+uhI7I0olgyl8Ko5cj9
 u3T/6PhB7C462n5umRcnFhz0Ld5tGdvOXr/BwQRJNQlTHXVbekXiMGvf4Uz7N6cut7cl
 ZvLg==
X-Gm-Message-State: AOAM53348tS67+SjMl/fs1F0hS4KaJBgMgRkG8A9Mud5B/X84U2pTxhO
 Ro/nwlGryn9LxCTpK/i8XOQ=
X-Google-Smtp-Source: ABdhPJw2cRhG8UHN8LXnIN2dTKp9oF06g5FI6Zqbk2WI27UC68arv2TLcX2Slci/J4LFn7amAwSThw==
X-Received: by 2002:a37:4496:: with SMTP id
 r144mr11246241qka.242.1620416009423; 
 Fri, 07 May 2021 12:33:29 -0700 (PDT)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net.
 [199.96.183.179])
 by smtp.gmail.com with ESMTPSA id r9sm5626187qtf.62.2021.05.07.12.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 12:33:28 -0700 (PDT)
Date: Fri, 7 May 2021 15:33:27 -0400
From: Tejun Heo <tj@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC] Add BPF_PROG_TYPE_CGROUP_IOCTL
Message-ID: <YJWWByISHSPqF+aN@slm.duckdns.org>
References: <CAKMK7uFEhyJChERFQ_DYFU4UCA2Ox4wTkds3+GeyURH5xNMTCA@mail.gmail.com>
 <CAOWid-fL0=OM2XiOH+NFgn_e2L4Yx8sXA-+HicUb9bzhP0t8Bw@mail.gmail.com>
 <YJUBer3wWKSAeXe7@phenom.ffwll.local>
 <CAOWid-dmRsZUjF3cJ8+mx5FM9ksNQ_P9xY3jqxFiFMvN29SaLw@mail.gmail.com>
 <YJVnO+TCRW83S6w4@phenom.ffwll.local>
 <CADnq5_Pvtj1vb0bak_gUkv9J3+vfsMZxVKTKYeUvwQCajAWoVQ@mail.gmail.com>
 <YJVqL4c6SJc8wdkK@phenom.ffwll.local>
 <CADnq5_PHjiHy=Su_1VKr5ycdnXN-OuSXw0X_TeNqSj+TJs2MGA@mail.gmail.com>
 <CADnq5_OjaPw5iF_82bjNPt6v-7OcRmXmXECcN+Gdg1NcucJiHA@mail.gmail.com>
 <YJVwtS9XJlogZRqv@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJVwtS9XJlogZRqv@phenom.ffwll.local>
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
Cc: Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Brian Welty <brian.welty@intel.com>,
 John Fastabend <john.fastabend@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Yonghong Song <yhs@fb.com>,
 Andrii Nakryiko <andriin@fb.com>, Kenny Ho <y2kenny@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, KP Singh <kpsingh@chromium.org>,
 "open list:CONTROL GROUP \(CGROUP\)" <cgroups@vger.kernel.org>,
 Kenny Ho <Kenny.Ho@amd.com>, Network Development <netdev@vger.kernel.org>,
 Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
 Martin KaFai Lau <kafai@fb.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Fri, May 07, 2021 at 06:54:13PM +0200, Daniel Vetter wrote:
> All I meant is that for the container/cgroups world starting out with
> time-sharing feels like the best fit, least because your SRIOV designers
> also seem to think that's the best first cut for cloud-y computing.
> Whether it's virtualized or containerized is a distinction that's getting
> ever more blurry, with virtualization become a lot more dynamic and
> container runtimes als possibly using hw virtualization underneath.

FWIW, I'm completely on the same boat. There are two fundamental issues with
hardware-mask based control - control granularity and work conservation.
Combined, they make it a significantly more difficult interface to use which
requires hardware-specific tuning rather than simply being able to say "I
wanna prioritize this job twice over that one".

My knoweldge of gpus is really limited but my understanding is also that the
gpu cores and threads aren't as homogeneous as the CPU counterparts across
the vendors, product generations and possibly even within a single chip,
which makes the problem even worse.

Given that GPUs are time-shareable to begin with, the most universal
solution seems pretty clear.

Thanks.

-- 
tejun
