Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EDE6A6942
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 09:57:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60EB10E0A8;
	Wed,  1 Mar 2023 08:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F4D10E0A8;
 Wed,  1 Mar 2023 08:57:20 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id h3so13162715lja.12;
 Wed, 01 Mar 2023 00:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677661039;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=fsdu2Eb3blGInGskJjm04MPUGM6r3/+cVPR317kKk+A=;
 b=AHfQcnnf7rLS73J/+l/ZkiNI0HgDJ8xVO8BYpbgEwVnvuJLTkTbqWEvwn6XOmQJgtU
 o7wjiR7ilWaqA6nVr8C52CnO6UJ6zu0PvU8uWzqzOyVXnQ8LI4zjstNVo6rMKlc/ibnT
 xNrA1/133hRRIzOWlysNfOXvYlwXk5p3WD9vGcWUBUowIkYqEIOAf+WQEV6/Wm+81oxE
 W7xPTUZPs/9uFHI5cpQHN0HRjOCMPvbdzQwgBacAKrsALIzikjiOWw8yTgD8Wx7ziFGV
 XGUJ08pccGAQDlRT2xQnLWYXl9W4xA2EoZURQFBORuULMvNN6lv/Z6TCpsqzoMjOMZ0d
 RHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677661039;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fsdu2Eb3blGInGskJjm04MPUGM6r3/+cVPR317kKk+A=;
 b=fVbgqXILstKLCNkgDPW3FZi9NJBBFe65PjAe+ETlbCJsedQVlu+f+f7EnW7y5k5qxD
 ZFFot5JA2jGfBn3vLxuneqRkCcVL2d7EdDp6P7AzcrmPZC2Q5AkVgrK5rRmK7K3fRI35
 k4OkmY884Gf3nUONfUJcbxs8Q1jqQJiasg2MlVeFsxSxYc3hhIwzZS3RZgOsMucM/pyt
 0p7u9FgtXQQQqNTSTyb06gX9SJ8juMeBM+K7UV2mZza+Gp+AcRN1FDSfDE1SYATllMHP
 djX1kbJZVUZP9SLwPjpspDspu6A/l+NfVDVJa/xwp8hDVVvjG/cUR60Ev874yFApHFh5
 MCfQ==
X-Gm-Message-State: AO0yUKW+qwY8VlNIy4qZhc+gZwdOvpyOi/bcWV5VpHDQYDBYn3BZvSaU
 3NX19zIXlp2d/ZJp6IeKZ+s=
X-Google-Smtp-Source: AK7set82/gI/ZiXCynTzPaOgWHLc7EeaoJaCL3F3vziWTQUzlK+NQgg2VxzJCzl53/JaLICRBGUtmQ==
X-Received: by 2002:a2e:9e14:0:b0:295:b2a0:498a with SMTP id
 e20-20020a2e9e14000000b00295b2a0498amr1900824ljk.13.1677661039052; 
 Wed, 01 Mar 2023 00:57:19 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 n15-20020a2e86cf000000b00293530f5765sm1556622ljj.113.2023.03.01.00.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 00:57:18 -0800 (PST)
Date: Wed, 1 Mar 2023 10:57:15 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v8 08/16] dma-buf/sw_sync: Add fence deadline support
Message-ID: <20230301105716.75136952@eldfell>
In-Reply-To: <20230228225833.2920879-9-robdclark@gmail.com>
References: <20230228225833.2920879-1-robdclark@gmail.com>
 <20230228225833.2920879-9-robdclark@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MU0/wWEPl4MipdcOND2ij7s";
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, "moderated list:DMA BUFFER
 SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, "open list:SYNC
 FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/MU0/wWEPl4MipdcOND2ij7s
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 28 Feb 2023 14:58:12 -0800
Rob Clark <robdclark@gmail.com> wrote:

> From: Rob Clark <robdclark@chromium.org>
>=20
> This consists of simply storing the most recent deadline, and adding an
> ioctl to retrieve the deadline.  This can be used in conjunction with
> the SET_DEADLINE ioctl on a fence fd for testing.  Ie. create various
> sw_sync fences, merge them into a fence-array, set deadline on the
> fence-array and confirm that it is propagated properly to each fence.
>=20
> v2: Switch UABI to express deadline as u64
> v3: More verbose UAPI docs, show how to convert from timespec
> v4: Better comments, track the soonest deadline, as a normal fence
>     implementation would, return an error if no deadline set.
>=20
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/sw_sync.c    | 81 ++++++++++++++++++++++++++++++++++++
>  drivers/dma-buf/sync_debug.h |  2 +
>  2 files changed, 83 insertions(+)
>=20
> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> index 348b3a9170fa..f53071bca3af 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -52,12 +52,33 @@ struct sw_sync_create_fence_data {
>  	__s32	fence; /* fd of new fence */
>  };
> =20
> +/**
> + * struct sw_sync_get_deadline - get the deadline hint of a sw_sync fence
> + * @deadline_ns: absolute time of the deadline
> + * @pad:	must be zero
> + * @fence_fd:	the sw_sync fence fd (in)
> + *
> + * Return the earliest deadline set on the fence.  The timebase for the
> + * deadline is CLOCK_MONOTONIC (same as vblank).  If there is no deadline
> + * set on the fence, this ioctl will return -ENOENT.
> + */
> +struct sw_sync_get_deadline {
> +	__u64	deadline_ns;
> +	__u32	pad;
> +	__s32	fence_fd;
> +};

Sounds good.

> diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug.h
> index 6176e52ba2d7..2e0146d0bdbb 100644
> --- a/drivers/dma-buf/sync_debug.h
> +++ b/drivers/dma-buf/sync_debug.h
> @@ -55,11 +55,13 @@ static inline struct sync_timeline *dma_fence_parent(=
struct dma_fence *fence)
>   * @base: base fence object
>   * @link: link on the sync timeline's list
>   * @node: node in the sync timeline's tree
> + * @deadline: the most recently set fence deadline

Now it's the earliest deadline.

>   */
>  struct sync_pt {
>  	struct dma_fence base;
>  	struct list_head link;
>  	struct rb_node node;
> +	ktime_t deadline;
>  };
> =20
>  extern const struct file_operations sw_sync_debugfs_fops;

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/MU0/wWEPl4MipdcOND2ij7s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmP/E2wACgkQI1/ltBGq
qqecHRAAjhjC3dSJPLKHaSsAI7cQzzt5Abml2ibr0Hei5R3tGeGmDsNslkWJiczW
/gh9o8CnyF9qlqm9gddyeVoOyRmIv6g7VeP2NWPC/QafUPLZs9cDatt581PhPWty
yHDgpksmTJmoOr+SoyrcIJLJiLv6+a22VycokaxFfIsIYXmG6PJxkFcFHRf030c9
QllXKDA2kPgCOy2df7cNasmwvirmScRaK/FqJr83xVx0CndUyc0uj3KUZl183whQ
r5mNQ2uphXXX4ceFdoFLoDpD3fc2+nO0q1Z+i+/+C7sZIglJi7wxCyfV5Qtw4vrW
qpxE+D8Oo+bRRtsofNJmran3RnPWeG6XCJ1z6ZlkP38hhaTxU3BIUZmkoaYM1of4
es+Q+f7gzf7BJNWcgAjs7bJecBr/H19eGWIg+zh+1MlfrdtqAIA1OlzPZc78JMt5
59IZx6k23ESS1g9Rfiw/9J2feQa1ZCO2oON3tqpbi/hgXUsTyR3V8x1Qu91898aR
YZSXIidMH3GV8phN5m1oht/3KU2U482zZ35O+u+dlkJ04v+Aimx/UDsA5r74P5lN
C+WkRYhlbBYCnqz9bgm1Xo8moXDuQi7u+9sABhIRIrywUm2JQ28LU/4UnsRK+epf
DNEY/D0KQO4hZ1J4zUBN2G0t1u+XTbpBHBwaFj5HKki4QAnFDNU=
=7DNe
-----END PGP SIGNATURE-----

--Sig_/MU0/wWEPl4MipdcOND2ij7s--
