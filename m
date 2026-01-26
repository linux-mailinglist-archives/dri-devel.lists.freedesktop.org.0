Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDjSM7nNd2mxlQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:25:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC228D097
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19A110E48A;
	Mon, 26 Jan 2026 20:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TCnD0VcD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com
 [74.125.82.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6798B10E489
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 20:25:21 +0000 (UTC)
Received: by mail-dy1-f172.google.com with SMTP id
 5a478bee46e88-2b7063004daso294942eec.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 12:25:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769459120; cv=none;
 d=google.com; s=arc-20240605;
 b=Vc1kM5VD9th/2Ad8+wT39ef4dbRKnwbOIOyYYZoR7700hGGcVC35YW5b6oOc1X48CN
 Ff0hhPcehR3O/9kDHaSuIQo6hxOMxe2GGC4JV5jH1MZeybfERP7RrNCphkFpWa0/rCpl
 I7pgPxMYK4vbhEa08z64xJvaFn81Jju2PrK4LazGyKUMX+YTmmp91i6FDZYL3KdfmxZG
 RS3R9fnav4o51iBsnuRr1lyFu3IwawkjtSTo1QemdxP5H5OK06AO2pwXP8tLPcQI4Hjz
 mw7yvm2WlYgL2DTDx8czVp1Xt8/LUFoNtRxqXH8tYRNgu52Zqircaxqvue296ppp7R9f
 ueQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=TlhXy2+ecr5O5aP2rJabZmdOTWx0wQqUqCyojKq3NqM=;
 fh=4ZTvyDU6jfTHHX239jENtNVZ0A/QhqyMvVOGIkLimik=;
 b=Pb7N1yYrf5MZkS2VxaVIiP5C27zSMYKzyu8r2M3sD4se7sgxEgM3Jtq8CAE8erGtXV
 6OgMjfEmbkWCDF3u/i+7VHTcR0YXv5g1K3HxGC7QrLjzoO835yKunkytPdwa3/kqCumT
 KJAoRiPoSg1VR5/hYPj1Rualjv3OGDUD8HdvQF9sdnJV8hAqhAPzZla3Ux/lC5c/wl2Q
 C9dSdddpJ91yT1nU0Rz1fde+6EbaiMNtHLKfgC8xm7DY3y6yT0biih58Df2X57RhHLa9
 3anSlMLQpWIb7F1JAB1hOYyZSaYzqs5oBwauf5d+/09FTjkNxArk151IaDIF4Kqdeo3Z
 htqQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769459120; x=1770063920; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TlhXy2+ecr5O5aP2rJabZmdOTWx0wQqUqCyojKq3NqM=;
 b=TCnD0VcD321Rn93ciBk/QTZNVkYsMFBNp1N62BCSpVQZYY4L5PXEISIhCK0qFLIXfU
 UTe/C+mJOr3g/dr+aJbL1o8adppNSX+J0mJgSh5wlWFwha6M5e380yYGbFqSPwBgUwia
 VRyVzyL3gAQp13NUcGEwoHcrV02SGBOZSh94mPiGio9QQFIwVmG0sGvwviu0eHgelOvx
 qYb0HFv85NclTu+FsaVKPghTLj4C+4GECfaNmdVgL/DRSWRDKeSbL3HEdV68H9A4jZwr
 /p2q8zlzUDK9ZMziggA2MdhHja4EOhsFsBfsRDiBx0Ert+aFqb/XiBHt7Yp63wuFK3GS
 fsMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769459120; x=1770063920;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TlhXy2+ecr5O5aP2rJabZmdOTWx0wQqUqCyojKq3NqM=;
 b=BKHtSJYzjSupDRKx2xMCPd6pJPoH6xfPSb7GmCLw9td2ltSmUbUcCnHHp7FUkRLuyZ
 KXdZaXA7DMIzsBbr+ww6qGpE7LNIaBuNWtZUyRpHx0P4zklbi7dNHIbuiUp3B7TrC6JX
 4YZWVBVnGI77BKN3GElf8vcClla5cW3WKskNMPS6wGMjgkXS0Byr0+0OHixT4FQkGG49
 yrvoSdI1zAZVLIVQVJIE8pkesylVFzeg9FR4/YTD2tNVOtgheTqVXjyN2iZ1uAXu9hv9
 ycLCsBq6Niewz5OGsGv1OY70vMRssbcajPr1n4mdryJ4c8Z7J3Gw8sXOXW107cSEn3IW
 oPqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6C5Xg0NiqtSPdWE4t1PGinAXb4VxNfr7oE8YwWO5j5ks5EG2W9NeA1MNCozjObRwIeigKxaGT3zs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1PzehE1CNo8Cn/AOtJ+LYH+8CASARQRqlUR5QTDH4jac8759f
 fV/7CSzUYJyE0+vSI6S2ULi2wTZwj2aOk1rfgukpPImql94YkAEfFkCh/nUBRs/8THb9MxNuz3Z
 Jk02cnM8/o8ESa0+UCbGugElB2cAgKis=
X-Gm-Gg: AZuq6aL87KGGdtJh9N/dt4frxxO84Ex2Eo0DAuR9ISqHAHqEMQRUG3fSPQnKX4t/can
 hrQQejjySj2RqacNafsB1EiH4y1R9Eu+qLn10bO2g2e2R4L8ttSuwcamkYM+cC2SNNcCI67S8EA
 4cac/VN+DIDKEL2xo6lBRotSWXjsZiiJua6heKtGt6rJRzhketPjxujiRFb41V6WCz96drsdVuC
 EjIj9yN4XRRS7yL4P9Eh6LyrEYYzg15wyvZQp+YGGqXsIV/anW4dhmC5Cd3eN40lp5Ik0m2
X-Received: by 2002:a05:7300:caa:b0:2b7:2bf3:ce06 with SMTP id
 5a478bee46e88-2b764327d2emr1666763eec.3.1769459120382; Mon, 26 Jan 2026
 12:25:20 -0800 (PST)
MIME-Version: 1.0
References: <20260106125929.25214-6-sunlightlinux@gmail.com>
 <77fa0344-3507-420e-9d77-d454ace55cfd@amd.com>
 <20260126194057.7376-2-sunlightlinux@gmail.com>
In-Reply-To: <20260126194057.7376-2-sunlightlinux@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 26 Jan 2026 15:25:09 -0500
X-Gm-Features: AZwV_QgKB7LKTlO7ADNsXDqB9ZYaUCGl-v-GxrYrwM3h0CLKwV5nMT9xESwTTtM
Message-ID: <CADnq5_MSvWLVqhgkdaYn6bjPC2L2=jf5v=h3n1cx=ZYgnXLQPQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: Fix TLB flush failures after hibernation
 resume
To: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
Cc: christian.koenig@amd.com, alexander.deucher@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 ionut_n2001@yahoo.com, linux-kernel@vger.kernel.org, superm1@kernel.org
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sunlightlinux@gmail.com,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:amd-gfx@lists.freedesktop.org,m:ionut_n2001@yahoo.com,m:linux-kernel@vger.kernel.org,m:superm1@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,lists.freedesktop.org,yahoo.com,vger.kernel.org,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CAC228D097
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 2:52=E2=80=AFPM Ionut Nechita (Sunlight Linux)
<sunlightlinux@gmail.com> wrote:
>
> From: Ionut Nechita <sunlightlinux@gmail.com>
>
> On Thu, Jan 8 2026 at 13:36, Christian K=C3=B6nig wrote:
>
> > Question is why the KIQ is not up and running before we do anything wit=
h it?
>
> Thank you for the feedback. I completely understand that my patch is
> just a workaround and not proper engineering - you're absolutely right
> that the real issue is KIQ being marked as ready before it's actually
> functional.
>
> I don't have experience with GPU drivers and video subsystems, so I'm
> not familiar with the proper initialization sequence for KIQ. I'd prefer
> not to keep a workaround for this issue in my tree.
>
> Is there a proper fix available, or could you point me in the right
> direction? I'm happy to test any patches on my AMD Cezanne (Renoir)
> hardware where I can reliably reproduce the issue after hibernation.

Can you get a stack trace when this happens so we can see the call chain?

>
> Also, regarding hibernation support: you mentioned that hibernation is
> not generally supported with the driver. Should I expect other issues
> beyond this TLB flush problem, or is this the main blocker?

The biggest issue with hibernation is that it's not compatible with
secure boot so most distros don't officially support it.  The other
issue is that when we go into hibernation, we need to evict the
contents of VRAM somewhere and at the point when that happens, swap is
already offline.  So in a lot of cases, we don't have enough memory to
back up the VRAM contents.  There were patches to the Linux PM core,
but I can't recall if they've all landed yet.  There's also the
possibility that the user's swap partition is too small.

Alex
