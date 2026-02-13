Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKjzNil8jmmJCgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 02:19:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457B11323AD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 02:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7554010E2CA;
	Fri, 13 Feb 2026 01:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c4GaT3OP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com
 [74.125.224.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D2B10E2C5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 01:19:32 +0000 (UTC)
Received: by mail-yx1-f53.google.com with SMTP id
 956f58d0204a3-64aea64bf15so454788d50.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 17:19:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770945572; cv=none;
 d=google.com; s=arc-20240605;
 b=FRGgY8SrGfjk2wki+wwX5/Iu9ggXsTRXoyj163rF1mSbmAOpk+xvIRBRdp3BzXPT6I
 D6RnXeyIEYj5QH91JPNFpZnPwpMXRBiJ+GBgekN6H4Ojo1ID+gUkJSZIaPfC9OwUMCgW
 uy+q3uXvpOyzxOy6+X7Tlc0X+SFW6ALkxXu4t1NGhOwxyZi5QK0RygRa4p0kYYL8GFDg
 A6G/mj07M355U2qzuPifyEfTJy0cnBKlwq/3EWyZQqwXU3UEhwAVSUNWQ8VuGME1R3qI
 FMuCQdZjTBxUyEMbrQwNz6sXDU3OLS3w9cbOvx4X1Q/d9S8AdiN6Y40otEoutsZ9IRx2
 ZNew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=yApDU2Ws4OOhk6CUVKmDGIKXEqeT5B8RdBxIxaf/qoM=;
 fh=11YCRmOKu/W602EVwZG8Q8Gc+acZzK5KbMxdNXAL8xQ=;
 b=GYv9UTLTa0tS4R7kYccpwDKZ61dNa/IV0uTslRrqCnE93WpCo9Xu7HjhEBOv25JJcz
 jnz1p+4Kf9FwprVu62fInoNpC3xM2tVc+IpohdAMtUQcjymjDYo02JZsQgJ0+UmYJo4l
 mvf/aLeDRzBAwu9cBjKkL+HTVVQAX07f+pOad5qicFrOQsiNdT3dulL/SD3FHDRe24Qy
 VCEIdkSdj7iZH33qF3450QIF7Tc1inpP2cj92dPTw9EP9p7nlBINhwGJNQxN6IIPzwKE
 BOofQB4nDUkojgkZug1+/irOmJrNalrgRoMeWGh4qkDVQb+Lonz/tdGQnvfINzNic5wY
 NwlQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770945572; x=1771550372; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yApDU2Ws4OOhk6CUVKmDGIKXEqeT5B8RdBxIxaf/qoM=;
 b=c4GaT3OPd2usUXPTBGNG+MTldO2ZnguIn2w2nl9EpC687AQRYS1cNppeBmbU9G5owV
 N4I3mdI6r0NZOSNuvyF+HiOPt1sNMKmEulTgNez4c4AoADBhKQvH2XPF7oTK+OoDtqPU
 /8yqBg8pofZlNR+mNcVDYzlvLiRXM3IfbHzOBvuG5hHc8Gc4pVuVQgY3PyAcwEUsWcaa
 3DLyTavrd3m2K8XA4lbiBT2b52QfvZ/f4aM7JxWYE+Ejus8zMrNji79bDJguLB/zgdst
 ZqsFa5Ik0kuIrD3ktsjtXfPPhGwVE1gbTic7jmkiDypkSDbIkKf1cmR1FUAehunCBBfv
 Xz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770945572; x=1771550372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yApDU2Ws4OOhk6CUVKmDGIKXEqeT5B8RdBxIxaf/qoM=;
 b=pe6XaAFMz4egwl5V+QbInlE+mr5kZduX/rRt+bBif97YrWMAF9+3l6gQMNYasISfJ3
 +Co4ycWDYflXMaTLUnlIRb1xZfEw/5qLjTOUEZvjc8TtHy+bgoCMtgeqkItavaJcHZ/v
 sIWc3rCHmmfcbdf+9n4EBKEf0dZ/xm+8XuvRbRhVOfxn1+UVS0V3inWbOlZuFSFheoDQ
 quYqLZNISG7/033zr02n5DJtBw9CXotUXHpm+fTj1ZICZX13nRqRTZU4KVwp3YfYSyVb
 lGnB9IoceULHv6ycHpfa1jeZFaRFQsYonomSdqWYgBHcgplN8nEqAvs4hYNpK4LnKl4h
 +srA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfCB1bHmVkQVjJKO69JNGAA+NpBghtugz9Wv9Rnry15aay8Ih9XKC3mAoqdMohEsNJEnhRedqEjzc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzYGcsnWxbG8zl5V+0/wRM2Ov3P/kgbGFnJIIYjVZ2cGn/yQOS
 LSaiEObphMlWu8gxnrO9MnmHZ9eV6yoznt4SXSGkRjNGkOp3HD1sSVsYxLbGth/WeG//VUe4vha
 10l5QsQaX74/M+TlEvRyaF3gQ5pEEJGY=
X-Gm-Gg: AZuq6aIBDCaDovtdXkRdxW/m0DoMHGwNBzL9Nnr4x+fIiGj+bFCESU8Onj4hhR0POvu
 nd1V4BjGTxetGyHZAPAGrYV0dcrrhdCP4TfecMuCDS4ocelq8miTA6xLcWLgwlMU/MnfdDuqNPs
 27Zg+6zI37DJiPMzyBp3zU4+DFWJMGAukKjR9sZhUDSao5eOuFWupiWPg+1T+MPqcgK9338COBw
 ZHQhMNWzpS0KSgvFNa5RWQGGPHQA3K7yiyrQoFFWhb4VoNr857t9jJaZO0WmoBBe6lysl2NgDiC
 zbLvRtpfr23UrPpcT/XvGipOawEeUphEUeTvLA6D
X-Received: by 2002:a05:690c:7201:b0:794:c2fc:73dc with SMTP id
 00721157ae682-797a0cf0b77mr3597887b3.64.1770945571726; Thu, 12 Feb 2026
 17:19:31 -0800 (PST)
MIME-Version: 1.0
References: <20260211080343.1887134-1-boris.brezillon@collabora.com>
 <20260211080343.1887134-10-boris.brezillon@collabora.com>
In-Reply-To: <20260211080343.1887134-10-boris.brezillon@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 12 Feb 2026 17:19:20 -0800
X-Gm-Features: AZwV_QhbOxm3zfMmexNzJ-2dT1v9sY8tE-lapFDDURi4gLvsCkTC1b7obcs3F_w
Message-ID: <CAPaKu7SRZDi3yqPie_C8xh+KmENNKtm95im+v404fWK07_GytA@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] drm/panthor: Add a GEM shrinker
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:akash.goel@arm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:kernel@collabora.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[olvaffe@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olvaffe@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,lists.freedesktop.org,gmail.com,ffwll.ch,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,intel.com,google.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 457B11323AD
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 12:22=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
[...]
> +static unsigned long
> +panthor_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_contr=
ol *sc)
> +{
> +       struct panthor_device *ptdev =3D shrinker->private_data;
> +       unsigned long remaining =3D 0;
> +       unsigned long freed =3D 0;
> +
> +       if (!can_swap())
> +               goto out;
> +
> +       freed +=3D drm_gem_lru_scan(&ptdev->reclaim.unused,
> +                                 sc->nr_to_scan - freed, &remaining,
> +                                 panthor_gem_try_evict, NULL);
> +       if (freed >=3D sc->nr_to_scan)
> +               goto out;
> +
> +       freed +=3D drm_gem_lru_scan(&ptdev->reclaim.mmapped,
> +                                 sc->nr_to_scan - freed, &remaining,
> +                                 panthor_gem_try_evict, NULL);
> +       if (freed >=3D sc->nr_to_scan)
> +               goto out;
> +
Do we need to check for can_block here? panthor_gem_try_evict will
block for bos on lrus below.


> +       freed +=3D panthor_mmu_reclaim_priv_bos(ptdev, sc->nr_to_scan - f=
reed,
> +                                             &remaining, panthor_gem_try=
_evict);
> +       if (freed >=3D sc->nr_to_scan)
> +               goto out;
> +
> +       freed +=3D drm_gem_lru_scan(&ptdev->reclaim.gpu_mapped_shared,
> +                                 sc->nr_to_scan - freed, &remaining,
> +                                 panthor_gem_try_evict, NULL);
> +
> +out:
> +#ifdef CONFIG_DEBUG_FS
> +       /* This is racy, but that's okay, because this is just debugfs
> +        * reporting and doesn't need to be accurate.
> +        */
> +       ptdev->reclaim.nr_pages_reclaimed_on_last_scan =3D freed;
> +#endif
> +
> +       /* If there are things to reclaim, try a couple times before givi=
ng up. */
> +       if (!freed && remaining > 0 &&
> +           atomic_inc_return(&ptdev->reclaim.retry_count) < 2)
> +               return 0;
> +
> +       atomic_set(&ptdev->reclaim.retry_count, 0);
> +
> +       if (freed)
> +               return freed;
> +
> +       /* There's nothing left to reclaim, or the resources are contende=
d. Give up now. */
> +       return SHRINK_STOP;
> +}
