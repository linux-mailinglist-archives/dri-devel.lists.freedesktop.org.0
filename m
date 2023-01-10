Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D9A66361E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 01:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D81810E0DA;
	Tue, 10 Jan 2023 00:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E714210E0DA
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 00:18:24 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-4c7d35b37e2so78557817b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 16:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sgQCt0va7Fj5/9fGcldqaAxXWYK8cBxGZmP9xyPfdn4=;
 b=CjxZ1mdpIhqu8VGPVCMoqsbsDlIhqCjEmsPqq5qkb1qszkge1Jm7eoOuPAcP/ZV3bk
 wPP+sf8id+ynxeTBPKOWQaibXFQF9VkirxIevCIzpGAQ21ueiyMyljdoDpqBwv6iADhp
 JWDpspg8gxuUz/g8o8f3Q/TpOZXD4wUkStfMnP3bNMTdaoT8E8PrN4XpF0W1y5T9lIyj
 m9H9otSUCpmNvNlNujrmOWTRlgks+Pwp+EXc1GX8tr1KUVIqmZXacuPH98ZfnNVZNFn8
 /a3FCftCVuu8stwkCKaAOtd2Rf8qgv7JUkOT3SOOPfRdmX4H3QpcqFd3fI60DVZdrWVr
 exyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sgQCt0va7Fj5/9fGcldqaAxXWYK8cBxGZmP9xyPfdn4=;
 b=FOpsQ6S/HqYUI7fJFmzuwu4se40aDayxQvi0lSoiwjuLFM2xbIe20TuQKntprU5e8F
 nRk1B9zqgZ5HfGddx4KZljQ41DgzQcsI13fRXCMIN7irzev+tcSZNw3hQpxB4P0s0nfs
 rfYib5gO14wj3JzeZDuhYKmUOSG+BEg827PWxXjPa/5xbpdA0wSN0vc0PsdLmms7mOWt
 jP+dALuK8HX+ExYzc+SILHQ5iz7s5BSCKugYGoZ8a49MgmJ2yOO1rKpN0gZ2P3amcltn
 HV1IDhHZcXH6M9os1X+U5ZhnMeGZeByBaCfvsYWzi7D7jmMHLDUTideHcbK5vEGo+U20
 k5Qw==
X-Gm-Message-State: AFqh2koAgasvx1syWvE/124Yru2vX03sQDI/nj4UKHVoRldvCEsRMylf
 RWjRsZ3WZSyCgaTwdPUdxieQgA8VN7HsaDAjDgWgbg==
X-Google-Smtp-Source: AMrXdXvykUOk6Aq29zKPFweeZ5QLOqVr0VtGabuLWKsdUabDXPvAWtUyFW1w97fkSV+2AQTk/rtQ4CJ6GNWf2U6U44A=
X-Received: by 2002:a81:7386:0:b0:391:c415:f872 with SMTP id
 o128-20020a817386000000b00391c415f872mr1094430ywc.318.1673309903890; Mon, 09
 Jan 2023 16:18:23 -0800 (PST)
MIME-Version: 1.0
References: <20230109213809.418135-1-tjmercier@google.com>
In-Reply-To: <20230109213809.418135-1-tjmercier@google.com>
From: Shakeel Butt <shakeelb@google.com>
Date: Mon, 9 Jan 2023 16:18:12 -0800
Message-ID: <CALvZod4ru7F38tAO-gM9ZFKaEhS0w3KqFbPwhwcTvgJs4xMUow@mail.gmail.com>
Subject: Re: [PATCH 0/4] Track exported dma-buffers with memcg
To: "T.J. Mercier" <tjmercier@google.com>
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
Cc: linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch,
 Roman Gushchin <roman.gushchin@linux.dev>, Carlos Llamas <cmllamas@google.com>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, jstultz@google.com, Zefan Li <lizefan.x@bytedance.com>,
 cgroups@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, android-mm@google.com,
 Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>,
 Martijn Coenen <maco@android.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Todd Kjos <tkjos@android.com>,
 selinux@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Eric Paris <eparis@parisplace.org>, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Muchun Song <muchun.song@linux.dev>, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi T.J.,

On Mon, Jan 9, 2023 at 1:38 PM T.J. Mercier <tjmercier@google.com> wrote:
>
> Based on discussions at LPC, this series adds a memory.stat counter for
> exported dmabufs. This counter allows us to continue tracking
> system-wide total exported buffer sizes which there is no longer any
> way to get without DMABUF_SYSFS_STATS, and adds a new capability to
> track per-cgroup exported buffer sizes. The total (root counter) is
> helpful for accounting in-kernel dmabuf use (by comparing with the sum
> of child nodes or with the sum of sizes of mapped buffers or FD
> references in procfs) in addition to helping identify driver memory
> leaks when in-kernel use continually increases over time. With
> per-application cgroups, the per-cgroup counter allows us to quickly
> see how much dma-buf memory an application has caused to be allocated.
> This avoids the need to read through all of procfs which can be a
> lengthy process, and causes the charge to "stick" to the allocating
> process/cgroup as long as the buffer is alive, regardless of how the
> buffer is shared (unless the charge is transferred).
>
> The first patch adds the counter to memcg. The next two patches allow
> the charge for a buffer to be transferred across cgroups which is
> necessary because of the way most dmabufs are allocated from a central
> process on Android. The fourth patch adds a SELinux hook to binder in
> order to control who is allowed to transfer buffer charges.
>
> [1] https://lore.kernel.org/all/20220617085702.4298-1-christian.koenig@amd.com/
>

I am a bit confused by the term "charge" used in this patch series.
From the patches, it seems like only a memcg stat is added and nothing
is charged to the memcg.

This leads me to the question: Why add this stat in memcg if the
underlying memory is not charged to the memcg and if we don't really
want to limit the usage?

I see two ways forward:

1. Instead of memcg, use bpf-rstat [1] infra to implement the
per-cgroup stat for dmabuf. (You may need an additional hook for the
stat transfer).

2. Charge the actual memory to the memcg. Since the size of dmabuf is
immutable across its lifetime, you will not need to do accounting at
page level and instead use something similar to the network memory
accounting interface/mechanism (or even more simple). However you
would need to handle the reclaim, OOM and charge context and failure
cases. However if you are not looking to limit the usage of dmabuf
then this option is an overkill.

Please let me know if I misunderstood something.

[1] https://lore.kernel.org/all/20220824233117.1312810-1-haoluo@google.com/

thanks,
Shakeel
