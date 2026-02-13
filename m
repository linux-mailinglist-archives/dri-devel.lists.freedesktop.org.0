Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJeCHsJzjmnnCQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 01:43:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC034132211
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 01:43:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DC410E038;
	Fri, 13 Feb 2026 00:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gGLQ+0Lj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com
 [74.125.224.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1680410E038
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 00:43:41 +0000 (UTC)
Received: by mail-yx1-f44.google.com with SMTP id
 956f58d0204a3-64ad46a44easo397716d50.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 16:43:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770943420; cv=none;
 d=google.com; s=arc-20240605;
 b=Nr+q8Z9+H1XGkwWQD/ZEN2L8Z8eq9iRlomkigBu/VCJE+E/3FlWiSlaACY2YidXOBd
 4ZwcZNsxw6jsA7cQjsoaHIUqgf1V2Z1OOKYW90wtVQ/0W1cEQoWuZymx6lTf5qrl2bH+
 kBsQ5ee8eSFR5J0lxdjPUjkc8/a+/NNo4HHOKV8PC2Cn035leP1MZJPZOeZQdlmLAwzN
 3rlzuonSE6+CnB+s8mXNJi7c/KzDMqOVTjB7uoOCfIvESDVJf2JEM0TmdVhNVK+R8TY0
 RMPyUrED6xBfHVNICqd/NxNuRQUsDELwilCtGcDu61APdh/DntuINxNBfTUuFzVBW7oC
 LsGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=eMMPVLR9una+hQqe1eaCONVqcdhUTli3KSOKNaBx1Pc=;
 fh=hSqOd5q9kf0BZjBmvQluBuB6it7H/PhlAr13Q9nbdy8=;
 b=WV5b+YqP6RkN/9J+lzxiymdqltoCyuuJCLln6HwofuAyAUjvbUfBzipD2XEf0APE9i
 k9vos6cqjkPH7av+TaPKmwE3ffcZUwJTKlK9/x9/NaU3qzdI/dr1KLm11PFz6BRN150r
 WjsU9vpWIvWEgtJ3k63r5ee7zrppP2QKWaUt319K3VhY1unaty4pgU2HndWo8TwK/C4M
 si+xzoNcVW2sBDplWeP5yl+ui1kIBvNKOeZ2usQGFvyEq86k8u23KdSKJpd89DpAaONl
 kwOiRF5eRqTPw44D25JqR0iRhOGQP4rdoarZEezRqe6vjG90R+TmFkjREGV+HZlbsZY+
 +HRw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770943420; x=1771548220; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eMMPVLR9una+hQqe1eaCONVqcdhUTli3KSOKNaBx1Pc=;
 b=gGLQ+0LjX3+pGMtFwoACRmcYA7Bp58zAiYRiLWCs5eNeVUmiEuU6CjVUfiUQhumoU+
 SUMxo5srXDKsgkEIlkg+AHS8LnJgX/wh2KUNw/koV61OLPcJpcBcOoyFDvVbbtFKsZFn
 nrkJCMbM5HnwgvRM6yoUE9eFlIOMJ3bxqGDuFMmrD2TpwLE0cifRwBTPqvAwMGw4UhA6
 EuXrSExHr9tievxp1MyDbA1TsIMA2fxglbQEK9laDPLlOTisGoD0iI48dhrQZJhzzuu3
 f2Fkq/UkRao4Tfk2fKuIJPuTXbvWiRIq/xBovOsYF3IRIXbOaTtdjt0TNWXprt6a/X6Z
 xo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770943420; x=1771548220;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eMMPVLR9una+hQqe1eaCONVqcdhUTli3KSOKNaBx1Pc=;
 b=ujXXWovp2em+sTI9sc8RFwF6IY+f7/Wv1zjZUwOCM6wNNCSnSYJw3rVjuz1seChz8B
 sBQlqlg1mLgnBAnIyQH/WH66LThosN6x3Vk1fTBPB6GRl91ozbTd/kTGSUZEBD5VdfFg
 LCz59G+C4WpgaVgWLVobFq5wsfZWD0QsizukoU7xSatajgnjq5Id/Thzj0oULJ8ergtz
 VDw/vicLAUFqP5af/MqMxQt6ZAnjEPH0aJCV9jgrMTdCciD2CMpPq5wv9kFiHaqhRtbC
 6/TEAd7B7qXXqL3UlLHCGWZuCxLtCbL0wnz18WWTXIklk9WMQuSNIrWwFOYmitdQitrx
 LKMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQaaIwirz0qwKx6/B2E3/kwGvDC9xxdmQ5ySEpXj7a7NPQjBfrF+5h7O0KLvyClia97mVcUWVANcA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdymUJf7NPvSjJQEj+Kogr+ndFjac5TDMcx8WgBcTCex84bnwl
 apI4GkWWGSN4hlWUR6/PIP6Fd7uBucPUc+gjzXVYqczxJrH/b4TLOGKLBo/+l+6cTE5oTCvbA23
 YDpfLFAuX9kAi+mczveERfbOUQjLs+kI=
X-Gm-Gg: AZuq6aIbGM2T5tL47SsD46Mcvgozx6L+zkrw22vowVFN85gFO6OVbG4WmThkl1Kc85N
 4BYV0ny6+OsfP1RnxDWeQkZ2z/W9nQNM/3P505vzG/tXiwfWMRYKQk+vgBDySM5i82MzIEzxcyw
 2QzLFJxsb0r2dQkgfkLkcQp9MbDHGNPkKjXS8/U0c9wFTEPxqTiNtbJEO/qVSSn3xuHruZ74kiR
 oT1Pm1y81+ZGfkupWzsxerqqgV8JeyU/BP73dDmzjYb98X6GVZ9FXFK/qhou97UtxM9yLxSjyk4
 ZgZMQGJxnCLjTltVlYiEYodUFzexp5Qz0HWxe+yr
X-Received: by 2002:a05:690e:1503:b0:649:d40c:7ee5 with SMTP id
 956f58d0204a3-64c14dcbd22mr721327d50.79.1770943419870; Thu, 12 Feb 2026
 16:43:39 -0800 (PST)
MIME-Version: 1.0
References: <20260211080343.1887134-1-boris.brezillon@collabora.com>
 <20260211080343.1887134-10-boris.brezillon@collabora.com>
In-Reply-To: <20260211080343.1887134-10-boris.brezillon@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 12 Feb 2026 16:43:29 -0800
X-Gm-Features: AZwV_Qj_VOQvptlS5TjnE_S-TNVAFw5BXMpqC7VGXbPQXYaqyOzg9dpTVQWYEp4
Message-ID: <CAPaKu7TNz83z=Y43tnb+yrSUMKbD6ztLZvtQ80Wzzqps4jkK4g@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: CC034132211
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 12:22=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
[...]
> +void panthor_vm_update_bo_reclaim_lru_locked(struct panthor_gem_object *=
bo)
> +{
> +       struct panthor_device *ptdev =3D container_of(bo->base.dev, struc=
t panthor_device, base);
> +       struct panthor_vm *vm =3D NULL;
> +       struct drm_gpuvm_bo *vm_bo;
> +
> +       dma_resv_assert_held(bo->base.resv);
> +       lockdep_assert_held(&bo->base.gpuva.lock);
> +
> +       drm_gem_for_each_gpuvm_bo(vm_bo, &bo->base) {
> +               /* We're only supposed to have one vm_bo in the list if w=
e get there. */
A bo that is validated in one vm but evicted in another is considered
PANTHOR_GEM_GPU_MAPPED_PRIVATE by is_gpu_mapped. We should check for
vm_bo->evicted too.


> +               drm_WARN_ON(&ptdev->base, vm);
> +               vm =3D container_of(vm_bo->vm, struct panthor_vm, base);
> +
> +               mutex_lock(&ptdev->reclaim.lock);
> +               drm_gem_lru_move_tail_locked(&vm->reclaim.lru, &bo->base)=
;
> +               if (list_empty(&vm->reclaim.lru_node))
> +                       list_move(&vm->reclaim.lru_node, &ptdev->reclaim.=
vms);
> +               mutex_unlock(&ptdev->reclaim.lock);
> +       }
> +}
