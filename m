Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AB96B2139
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 11:21:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D358010E7DE;
	Thu,  9 Mar 2023 10:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3A510E7DD;
 Thu,  9 Mar 2023 10:21:24 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id d36so1600015lfv.8;
 Thu, 09 Mar 2023 02:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678357283;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=KprGKYQ8KgwaGWUbn17Xz5NYf5KpExwL2NMCF7dMdgM=;
 b=TRXqe8TQv4yfm7qG2xhZaoah92igaQMjG0ELmUtzdt7kOaZwrOkfWMsKMhXAsa9hWr
 IL0zq8+qpdODRl4JxxUzTaLAhEWPwUZZ6Mhbqbt02z9+OjT3pKdWZgpfIPX1EucbWd7J
 ZqmAIYlYVO7LhfBF3UcgAdoMoWTDMA31Wi2xJlHuATDyncXQ8Pfi9djMDqLohAWgD75d
 mZFUk/mP5ZFsiSO08rhOZx5yv5XPUBSj0kg1POAZkFpeR90Su3vccPXA4pGFNY7nWAvL
 VzrWe4tUvpwQXG9XL5JNCiaMy1X9pmDW9fxUDAValpicdBYX1P2nMJ3EUImUJlArelB6
 U0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678357283;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KprGKYQ8KgwaGWUbn17Xz5NYf5KpExwL2NMCF7dMdgM=;
 b=mz6DJRZZ5Y0C0Yhm3m3PNxSC+rJmKd3WlsDu40UOxifvFUe4Gh4h9LK2mZo/Y0q93a
 fCBgWvhigpEbIhjeKr578MHr25IcYBZs8dDe7XBrST0iJIfqkt4g20MuhOVpLF3HYCsw
 +K17q4K9WrIqyr/uZ4sfyiZP06vNiX909XpgypDh6mTiMQY8scPq3y+gCZLW/F8ZvN61
 7tE8r6FP4mMnVR3kXmMe/HvIgN3BWtGmRNII+5wfIWHLJ5ZCzPHnG+YM53zRc4sxmceq
 OogBFRzfRw0lEJWhdMHqIFJemxgDSORdYuv4BfvHswj6aonI0qRpls/Ey/KcDUcrGsyI
 WUmg==
X-Gm-Message-State: AO0yUKUlnKJdr0F9Q+CDnp6URtE8qLeCfTemo/smhp8ZbTWXGbI3vpsQ
 reAw9WntGNpyOlO6CYECzLk=
X-Google-Smtp-Source: AK7set8//lzFNi6UQdT0Qz69/iAT27g06pbsZrFtDMb8VzTxl8+gMl6jx74dZt+KkxkgfpPWfGRocg==
X-Received: by 2002:ac2:4949:0:b0:4d5:831e:3154 with SMTP id
 o9-20020ac24949000000b004d5831e3154mr6109888lfi.45.1678357282880; 
 Thu, 09 Mar 2023 02:21:22 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 u23-20020ac24c37000000b004aac23e0dd6sm2605330lfq.29.2023.03.09.02.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 02:21:22 -0800 (PST)
Date: Thu, 9 Mar 2023 12:21:18 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v10 00/15] dma-fence: Deadline awareness
Message-ID: <20230309122118.661e85b4@eldfell>
In-Reply-To: <20230308155322.344664-1-robdclark@gmail.com>
References: <20230308155322.344664-1-robdclark@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YsnEA9P_sNO1q.G4g.HWGt3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Gustavo Padovan <gustavo@padovan.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Liu Shixin <liushixin2@huawei.com>,
 Rob Clark <robdclark@chromium.org>, Vinod Polimera <quic_vpolimer@quicinc.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Matt Turner <mattst88@gmail.com>, "open
 list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, linaro-mm-sig@lists.linaro.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/YsnEA9P_sNO1q.G4g.HWGt3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed,  8 Mar 2023 07:52:51 -0800
Rob Clark <robdclark@gmail.com> wrote:

> From: Rob Clark <robdclark@chromium.org>
>=20
> This series adds a deadline hint to fences, so realtime deadlines
> such as vblank can be communicated to the fence signaller for power/
> frequency management decisions.
>=20
> This is partially inspired by a trick i915 does, but implemented
> via dma-fence for a couple of reasons:
>=20
> 1) To continue to be able to use the atomic helpers
> 2) To support cases where display and gpu are different drivers
>=20
> This iteration adds a dma-fence ioctl to set a deadline (both to
> support igt-tests, and compositors which delay decisions about which
> client buffer to display), and a sw_sync ioctl to read back the
> deadline.  IGT tests utilizing these can be found at:
>=20
>   https://gitlab.freedesktop.org/robclark/igt-gpu-tools/-/commits/fence-d=
eadline
>=20
>=20
> v1: https://patchwork.freedesktop.org/series/93035/
> v2: Move filtering out of later deadlines to fence implementation
>     to avoid increasing the size of dma_fence
> v3: Add support in fence-array and fence-chain; Add some uabi to
>     support igt tests and userspace compositors.
> v4: Rebase, address various comments, and add syncobj deadline
>     support, and sync_file EPOLLPRI based on experience with perf/
>     freq issues with clvk compute workloads on i915 (anv)
> v5: Clarify that this is a hint as opposed to a more hard deadline
>     guarantee, switch to using u64 ns values in UABI (still absolute
>     CLOCK_MONOTONIC values), drop syncobj related cap and driver
>     feature flag in favor of allowing count_handles=3D=3D0 for probing
>     kernel support.
> v6: Re-work vblank helper to calculate time of _start_ of vblank,
>     and work correctly if the last vblank event was more than a
>     frame ago.  Add (mostly unrelated) drm/msm patch which also
>     uses the vblank helper.  Use dma_fence_chain_contained().  More
>     verbose syncobj UABI comments.  Drop DMA_FENCE_FLAG_HAS_DEADLINE_BIT.
> v7: Fix kbuild complaints about vblank helper.  Add more docs.
> v8: Add patch to surface sync_file UAPI, and more docs updates.
> v9: Drop (E)POLLPRI support.. I still like it, but not essential and
>     it can always be revived later.  Fix doc build warning.
> v10: Update 11/15 to handle multiple CRTCs

Hi Rob,

it is very nice to keep revision numbers and list the changes in each
patch. If I looked at series v8 last, and I now see series v10, and I
look at a patch that lists changes done in v7, how do I know if that
change was made between series v8 and v10 or earlier?

At least in some previous revision, series might have been v8 and a
patch have new changes listed as v5 (because it was the 5th time that
one patch was changed) instead of v8.

Am I expected to keep track of vN of each individual patch
independently?


Thanks,
pq

--Sig_/YsnEA9P_sNO1q.G4g.HWGt3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmQJsx4ACgkQI1/ltBGq
qqeCVQ/7Bzoz7uNe1NEopzqqHKfxESL0GuvB+Ky+giA53z+1ZulhFzT1AAiKInp7
QOwxDpDiKSJigTT68UUtK7LRc42z41SLnPXF9023LhNJYUw7lC0L7oAmQLqUaeyw
lPuPxOWgY5XPkZWdzJoZVyky4lBS2uGnF8I0+Ek2FTWRVlpGToUiXcHW5xHxH1Vi
aQzqiH/s7EIWSuR8dZtzSTH0uA641e3dt+9AKOGYZQlwCLOdcngZ69vu0bft5pPG
aKrWz6zfX7iLIbwWBJvKzBb4jvKC7gV/7a0p7kwyBPTnJ+TbDS0tWgcwDJ59vTPo
L1Lfysi8uFdx6gSW0P864n+wbh96sPaJE+ZlBc174RTW5XzN0wu9V+phPUoBM7/T
F2G5B8sYKwTMdxA//7PVjviDGDTZ4YHn1MLLRjwhUGF6HfvU0aLrHY5iKOHtUWVc
XAL1exaXtkOMyd5EoezO7zSIQ9umGAQGGffMg15sD7mL+4wIhKY85WehBySfXLUK
PVlTV62a4vdO58ZcWn0U299HPi0ehjQXvHRkFe4D2827dnZNsLd+BEJHzgDmI/l3
x0lGGauKT+X0cexJetComQh7AszbkRrdP4SJGfRxJBrfkiKN4JsTEQ5s6ZoGWBjm
vXZD3smbWhE69Bc3HDJe/HQA/uGYskkrLTL8oV+aYiy+pj21+W4=
=ZIGt
-----END PGP SIGNATURE-----

--Sig_/YsnEA9P_sNO1q.G4g.HWGt3--
