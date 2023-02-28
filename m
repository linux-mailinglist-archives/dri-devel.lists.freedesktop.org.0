Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0546A593F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 13:43:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290E110E4A0;
	Tue, 28 Feb 2023 12:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048B110E6A0;
 Tue, 28 Feb 2023 12:43:03 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so9423751pja.5; 
 Tue, 28 Feb 2023 04:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677588182;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GNoSdXiAy4Hnpx4GSmf9v1s/TnoJ2Easnzikmce7RFo=;
 b=Df7zrRz22eg8YZi+bpqjSJPlYpN8eIwr9o77wJ4OIQ+4kuTEVXpnUz/mPubCGdCkzm
 wB0GhDQXs3xOQYDpZ9TG3khGJT4x7Ps3f8Vj0npRhk0C4oSB96tMQoW50c51EZ3lfU6+
 vFMlcXzfaK3nk76iyyHVvUt22CWre9Kuihg8DdAXM83Q0NBTYhnQ9e1mcv7ZaGj3nj6C
 DWIlEvKfO56rW78AV5SO5ICvqhDgv2GTFKuLLPU+zrXAXmgq0Z3G0wNqW6+IdX6MRcKc
 JC/a+Zbq22en8EaGBqwiunzxOiXmQHaNTUI4tKBNSby2zUAc3XWf8SlBzOOJfcD8IlKJ
 SM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677588182;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GNoSdXiAy4Hnpx4GSmf9v1s/TnoJ2Easnzikmce7RFo=;
 b=i0WolIOQycqcS09txPLhdzNCPZj/PTmw2mohwq1avEFuDxVYGZ056jaWP+D32o2AtY
 jZ/CWCQcO2sGyFgIUpqWJgfPdJLHUymo8YMSaBuwCvV6nU0EYSkI5Bfr/DCqPsXY0cUG
 9xrAQYlgjLhX9mUon6Kztcp26My3TgJJD9iqiMCGY+eHqODXqSp0cSgISaI83hRWccF7
 96myGlAAGtZ3Zpvx4lOLKp9y9G/IBLv9bMR6L2wyoitALMEXeyQsGwM2xr6lxYY1UMly
 v2zLvAs+/MhJbCtVsTa2UXXgcGHbQTa2BhhCV48Hfa7kweWkRiZuRvuBVpAA5gBz8qaj
 zehg==
X-Gm-Message-State: AO0yUKWMzeW+1DysM/xz6JSc4tQyE5CpDemnSDfg91XDuMHYtjasLcd4
 0/rmCYNbI4e2nwEZw765y1w=
X-Google-Smtp-Source: AK7set9OdAQjCkCpgdCiYZHKKMRQTrLw3bEzWK8cbf3O+nNoqA5K32bwW9Ij9MRpVcAkVdH7hRxAQg==
X-Received: by 2002:a05:6a20:47d7:b0:cc:68a1:5033 with SMTP id
 ey23-20020a056a2047d700b000cc68a15033mr3052844pzb.16.1677588182510; 
 Tue, 28 Feb 2023 04:43:02 -0800 (PST)
Received: from debian.me (subs02-180-214-232-83.three.co.id. [180.214.232.83])
 by smtp.gmail.com with ESMTPSA id
 y18-20020aa78052000000b005a909290425sm6172405pfm.172.2023.02.28.04.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 04:43:01 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
 id 24D0210105C; Tue, 28 Feb 2023 19:42:57 +0700 (WIB)
Date: Tue, 28 Feb 2023 19:42:57 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 00/15] dma-fence: Deadline awareness
Message-ID: <Y/320d96QmbLe1J8@debian.me>
References: <20230227193535.2822389-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wAv6Jr7MZqhKVbDV"
Content-Disposition: inline
In-Reply-To: <20230227193535.2822389-1-robdclark@gmail.com>
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
 Gustavo Padovan <gustavo@padovan.org>,
 Douglas Anderson <dianders@chromium.org>, Liu Shixin <liushixin2@huawei.com>,
 Rob Clark <robdclark@chromium.org>, Vinod Polimera <quic_vpolimer@quicinc.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 intel-gfx@lists.freedesktop.org,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wAv6Jr7MZqhKVbDV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 11:35:06AM -0800, Rob Clark wrote:
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
>=20

I want to apply this series for testing, but it can't be applied cleanly
on current drm-misc tree. On what tree (and commit) is this series based
on?

--=20
An old man doll... just what I always wanted! - Clara

--wAv6Jr7MZqhKVbDV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY/32zQAKCRD2uYlJVVFO
o1TBAQCAHLKqy5NdumoKS+DbOAOm+KfhLK93EKYDC8UmiebsRAEA+JAK75T6QTDt
aHxaJFTZKkVfK7+Eq1MfYn2ZeBgJXgU=
=jpg1
-----END PGP SIGNATURE-----

--wAv6Jr7MZqhKVbDV--
