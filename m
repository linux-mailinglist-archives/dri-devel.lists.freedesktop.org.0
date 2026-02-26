Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHPiGRR5oGmzkAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:47:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EC81AB067
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:47:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E52110E9C9;
	Thu, 26 Feb 2026 16:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gkCClim/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECC610E9C1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 16:47:12 +0000 (UTC)
Received: by mail-dl1-f51.google.com with SMTP id
 a92af1059eb24-124a7216c9cso70643c88.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 08:47:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772124432; cv=none;
 d=google.com; s=arc-20240605;
 b=Km/bmmOM9aMG3m2WEbYD2UAu71abLgLfkNqHPLBw97rNrdoAh/pWB7O8E1p6N9qG0G
 TVvVHEIlVhnGwSj2gdGhUt/+OV/0+D4GQGF0UNht7AM/zYfy16Ugq8p8DMmgOnSuhgXU
 0KNhp12rMqto9KM43joCOGiiOdUq9buPQ5jcIP93gU3IY6Vf8SVtguJedAeBq4BKpEGu
 8GWMA+oZC4/M2NI1q0acgtbT/n1sFedX7NPebC2H5hifbZNlj7hXaxIdglU1WuCymPwt
 pAF7/o4f36JKSXXoieiE+kWPBLiivPFscEsXGmvrYtRP0sIgsENyZZLZGY7FjnTNFcTZ
 Savw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=14b7Avo43YlZe+hxgSc9nKn/f7gq8EMXA4C+O7gB90A=;
 fh=vqi1Di7dAD1VUekvzV5aRSXwjAonKSTcjgO+Ec49dLs=;
 b=kgq8ZQT+rpbeHjgcff3gT9kdlOx6toy8d1Wiv5ALNZGl/3mZb5Z65b3jOr1fSBAz6D
 /8HqVQuN8M96sJbMV55Mr9YD9XzfTeAUAhBtQ613SqviwqxKutI9NC1H6seviHD9gfPj
 du46ZQehFfODSV0l4rzJGfA9Fz0mFSRsy08pVBmK1FJkxKwK/2xMmbB5XiahHuy/yUwv
 j41AXU/I+vuYeg8T8y8J624MrXJR7PYgROm9+v299kLJYOyh+BA/3ckOKwwxHQMNJQ81
 v5Wc8s3sMLVk4d6ZNkLdt9e9NtUvepfsKZ+h2UjghWkwjV9OoZCfTvmZGh71FdZIhz5b
 gkLw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772124432; x=1772729232; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=14b7Avo43YlZe+hxgSc9nKn/f7gq8EMXA4C+O7gB90A=;
 b=gkCClim/7wCUe97rcZQZutuIimQ0sX43oYAKmJShh+npmCszMMfdvD65Ph3b9NBzZg
 C+yhSz2V3qlcXCz29ZrEKUbqkzCTn/knblA+Si/ThJ5hmb8FZddT7M7UtLSINRqZ2/VG
 zQNRDlqKX6lSCzI1QSgRdJN2FDVvPW0dAwIa79HQGo+NpQSpii15oQLlb3/1FoWDUu/2
 O9KO9hCR741xB33MZ2ofL6vpaUvswI+fytnRwhxxUuanAzZQrNKxzoU5zXho1M7nouxl
 LteNQ4El53bDEZZm4JIdcBXnYT4VBLuvED0gcna1bkvpBPedCE9dNJEyL70U1qFQUS9r
 onfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772124432; x=1772729232;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=14b7Avo43YlZe+hxgSc9nKn/f7gq8EMXA4C+O7gB90A=;
 b=RCDinlthfuiCM/Y4DEO+kD6mvx84EbWcUXrplaJtuTiSRQw1JGFUg16lvGWEpKEhh9
 /8Cw1UpjE8upVE7xEnaBtqibLI8CPGPJvjObW2yOhBytQGv0vnZdrywb1pGxdxCQKDB2
 XdPqO8H3ALyPw2LUSJWg/Z/QKFi9oX6iQEdxnfmNKL7iP3xR5hncTWhZ68aI570fLCx2
 /qKCAf8SsdB3uv+53cEa1ytYA6X3umqzXwMGuhWciCTs9lllDUHkDP6r1dKNZUEptnKS
 SGHWDmnY9CQBeeUiG8JcXFLlcjWPyV4Fv9/Kj6hxzilLUKlnupuCsKY3nlnZ8DGdiHiB
 Eo6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs6BXg4msGx9pPbot1ji0V2MarNFZNBGGi86vV9K49hnqIavo+wkGCerWtcLChxXUHTqHLHA1BVyY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMjKlem9IwUuE622eZzHZBzRATYOhPmHbkk9b4GBGZUjg4zJN/
 s/fecXU4qys6C9CEC4BttxY+mlBE6HpxaroQem59kGOyOhDAXdXt/erQQlDehpcEojk91/QFora
 L7jlPXZv16GCuWq1N05c0Xls9i643ZPs=
X-Gm-Gg: ATEYQzx89r/+xcbkMYPUXJsj9bks1g8CpQyA1JjTWl9Jfc1sSZkbF3vEu1eT5HbTTm/
 m5CkT62/Hnk+EQua7EKtru6F5axt6vNAB0gNUWwvFthj7+mCRWXYBIgBKqRnSdUlVHB5dpLi8oL
 PvdSj2KQ2X6qGOUw6mSgcZKK7wNsg99+CPjPehyDVuzFlob9KiaT9Sn+y4L7EOHOYY/r3G5GZFr
 rbHbBcs8H/HKGbnXoKxvFZc6Pb/Wgr8YavqAGp1kP6UBghCn6Ng/WrlK13Vo3mB4JfnYeZJLi40
 sjnADcCaVAoVuPSb5/ITk8prhGRRIA2UTovtzBbw0+8+xyAnts4vdZO/eDVjBhxQFFKEIQ==
X-Received: by 2002:a05:7022:521:b0:11e:3e9:3e88 with SMTP id
 a92af1059eb24-1276ad1a953mr3945750c88.6.1772124431737; Thu, 26 Feb 2026
 08:47:11 -0800 (PST)
MIME-Version: 1.0
References: <20260225174702.it.918-kees@kernel.org>
In-Reply-To: <20260225174702.it.918-kees@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 26 Feb 2026 11:46:58 -0500
X-Gm-Features: AaiRm51xyAWxRasXbIsk-hsIItXJk-3QDBUo6dz1ndGIfSkhqxcHNt_CuM4bM8E
Message-ID: <CADnq5_MWNLM+KUb09LgPUq6QsY68paojSAWXEZ3n+YLHq0ULxA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/ras: Fix type size of remainder argument
To: Kees Cook <kees@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 YiPeng Chai <YiPeng.Chai@amd.com>, 
 Tao Zhou <tao.zhou1@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:kees@kernel.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:YiPeng.Chai@amd.com,m:tao.zhou1@amd.com,m:Hawking.Zhang@amd.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: B0EC81AB067
X-Rspamd-Action: no action

Applied.  Thanks!

Alex

On Wed, Feb 25, 2026 at 1:04=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> Forcing an int to be dereferenced at uint64_t for div64_u64_rem() runs
> the risk of endian confusion and stack overflowing writes. Seen while
> preparing to enable -Warray-bounds globally:
>
> In file included from ../arch/x86/include/asm/processor.h:35,
>                  from ../include/linux/sched.h:13,
>                  from ../include/linux/ratelimit.h:6,
>                  from ../include/linux/dev_printk.h:16,
>                  from ../drivers/gpu/drm/amd/amdgpu/../ras/ras_mgr/ras_sy=
s.h:29,
>                  from ../drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras.h:=
27,
>                  from ../drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_co=
re.c:24:
> In function 'div64_u64_rem',
>     inlined from 'ras_core_convert_timestamp_to_time' at ../drivers/gpu/d=
rm/amd/amdgpu/../ras/rascore/ras_core.c:72:9:
> ../include/linux/math64.h:56:20: error: array subscript 'u64 {aka long lo=
ng unsigned int}[0]' is partly outside array bounds of 'int[1]' [-Werror=3D=
array-bounds=3D]
>    56 |         *remainder =3D dividend % divisor;
>       |         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c: In function 'ras=
_core_convert_timestamp_to_time':
> ../drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:70:19: note: obje=
ct 'remaining_seconds' of size 4
>    70 |         int days, remaining_seconds;
>       |                   ^~~~~~~~~~~~~~~~~
>
> Use a 64-bit type for the remainder calculation, but leave
> remaining_seconds as 32-bit to avoid 64-bit division later. The value of
> remainder will always be less than seconds_per_day, so there's no
> truncation risk.
>
> Fixes: ace232eff50e ("drm/amdgpu: Add ras module files into amdgpu")
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
>  v2: use temp u64 to avoid 64-bit division later
>  v1: https://lore.kernel.org/lkml/20260225024716.work.043-kees@kernel.org=
/
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: YiPeng Chai <YiPeng.Chai@amd.com>
> Cc: Tao Zhou <tao.zhou1@amd.com>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Cc: <amd-gfx@lists.freedesktop.org>
> Cc: <dri-devel@lists.freedesktop.org>
> ---
>  drivers/gpu/drm/amd/ras/rascore/ras_core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/ras/rascore/ras_core.c b/drivers/gpu/drm=
/amd/ras/rascore/ras_core.c
> index 01122b55c98a..02bbee64a5bd 100644
> --- a/drivers/gpu/drm/amd/ras/rascore/ras_core.c
> +++ b/drivers/gpu/drm/amd/ras/rascore/ras_core.c
> @@ -62,14 +62,16 @@ int ras_core_convert_timestamp_to_time(struct ras_cor=
e_context *ras_core,
>                         uint64_t timestamp, struct ras_time *tm)
>  {
>         int days_in_month[] =3D {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, =
30, 31};
> -       uint64_t month =3D 0, day =3D 0, hour =3D 0, minute =3D 0, second=
 =3D 0;
> +       uint64_t month =3D 0, day =3D 0, hour =3D 0, minute =3D 0, second=
 =3D 0, remainder;
>         uint32_t year =3D 0;
>         int seconds_per_day =3D 24 * 60 * 60;
>         int seconds_per_hour =3D 60 * 60;
>         int seconds_per_minute =3D 60;
>         int days, remaining_seconds;
>
> -       days =3D div64_u64_rem(timestamp, seconds_per_day, (uint64_t *)&r=
emaining_seconds);
> +       days =3D div64_u64_rem(timestamp, seconds_per_day, &remainder);
> +       /* remainder will always be less than seconds_per_day. */
> +       remaining_seconds =3D remainder;
>
>         /* utc_timestamp follows the Unix epoch */
>         year =3D 1970;
> --
> 2.34.1
>
