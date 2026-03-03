Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOgAB6kTp2mfdQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 18:00:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0421F4469
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 18:00:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DEB10E866;
	Tue,  3 Mar 2026 17:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D5JTWFE1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com
 [74.125.224.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5863410E79E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 11:42:06 +0000 (UTC)
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-64ca9ec3ee7so5537104d50.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 03:42:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772538125; cv=none;
 d=google.com; s=arc-20240605;
 b=AEfdff65tomyjqyEzvWliiALRMWfD7Wx5x6YF2ECQQpKgxcHK/Og8KmuE1r6wu0ZSF
 kzbyijK4uIb4KyPLbF95eYNHfLjwYcXuGJMf/g6sBX7+UQBXEbtsleFW0je65uc+9UIl
 rVnzgPBxc8qswH+XZKfrljpEtGZN3vhLyHSiKcEYuv6mox1UQYBkYPSJCTvpm+ePMtvz
 d8KzQxgtKHZGjFlvqoZs1wpSYk6pVHZnR/UEXuxn0UMhl/PFTRserthSnhYv2D6osZXg
 BPf/n3lNtaczRmayoMTNuVIk9MycfYfthL7D3VhrpbjzLmjfUDSOEB6o+VLgJE0D5s4c
 zzQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=3S+kM6AzNiQmkYrTR3zb0hWiMrh+AxcEOoQFvo/2/HA=;
 fh=0jcgpFJIyp9ztk1pvx2jwoX/Y0GxGE+NUmV36llARoc=;
 b=aN9MVE5Ch5c/78NNHiKRSENa0Q/WS/DqxM7WVXFvm+/vKskaeUTWPkzOrngVTohhZj
 dYnqN5JhM/QIvd2qlBHQPIlQBa8e6BkAfAzDabu/tBLJAC78B02yyVK0tPWd4ZswSTkV
 gkXcH8bmdT3Tir9i1Bh5oiVhXMFDubx5KJeR+oO0PTHLkneQYT0GdyJgwIjSoCQ8rpVS
 UkX7X7wopUu3seDvt7OFwLxVwUHLV9xsExzrmhzmP8vTvQPQLrIpnlTh+R2v4Kzbprof
 NyHT0O2ZQ2fQuhOESNwz2NOBrVUlRyUynaHUYuNWMvDTTgnzXrRv/l3rOKs1y84gDbnI
 4uMg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772538125; x=1773142925; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3S+kM6AzNiQmkYrTR3zb0hWiMrh+AxcEOoQFvo/2/HA=;
 b=D5JTWFE1XWRozH9VxJhnW6N4DGe7EzPGEn3c9MC8DD7/TqW0I22IwLBFFbFqWZYDNZ
 GUteyKwC2Inzy25FyRiwOcLIvsWme+2ccF0SpBi1MWnObfdjlFO2muNHVdvOAoK/c2/I
 LnhltE1fqoRqNtwB+biosJJJGVNdpBRmak4I1vnLsg3gwSL76rK693wxEHKZaz0XA4O2
 e0QJh+HNAIFWT3xb23GB6hCrXqGG6hB7HCUre9lEmyeg1yLXW/K/pByaWuGXTEg6zRCL
 EKVMfbIxoOXyqQrv5AwvOd6hgAVNsw6Yyr6L+IHw4wh4je/hdqahI98NjAb5szAX+zeU
 Gp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772538125; x=1773142925;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3S+kM6AzNiQmkYrTR3zb0hWiMrh+AxcEOoQFvo/2/HA=;
 b=fgjdhEBIT+ehSZFel2owCDK/jodgw/o+lKfCd3OIbL0WbCeSAjIdYi14H+ha2bK5vX
 d5YzxSTeyQnLj2X8rLGSEl9bLiiBF3LSOY6FNBpWvE6B0XIwg30fM3Mx8saUIaJD9Cyk
 /lVrQq54MKLtgEuWcMz7IlNiZXX+RCCZMg3gXc5nx4GU0e3RLt8leqp1PNlAqeD4iFJl
 LnZrqk0aJiTw2oOuwaSfK3gF8vUaXE5pbfmRE+S8WnXrM3vB3Y8WG45W4tmRZZP9WQmN
 EK6pzyjODYMB+bptqlHvwiFXHR0kin7Qv84eW+svwHBJTIsqPiCGCnR1Q4nIhQsRFF+Z
 XI9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3pNE9YvYgn+4WWeyDSTJhmVrgsS1lKHs0UjR/B4Eii2NKCTrNIB3ELFX2PEM5hqLHSoTJ8E3ByoY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKrk9UScoEOlSWgy8xiGhuiQkJfPMHiKGMGwAI2t9h8pBcvE9o
 E27O9vTctXc+eiNKA4DZVvSXJC62v/z3VF5sUu0aVBAteeKxLTXISBgH5sGoJwp86DeqRURQfdE
 6yle/tY/DcPH2xbLLBJyTvv/NWx/UVco=
X-Gm-Gg: ATEYQzwqByXJVXVg5bqDuZZ644OBXkhZT8VyyRjnlU385XCx4vqTjOmhZa/SIu8zh44
 wbXBbeT+wy3wAfXrPR07BEnx7zdJqYpjnDMPldcG4ut5XSqD5+0RMwLLnyYl5ADMTLsMXq9xstl
 cafSh8NJh1FjmtJoNVgcduoo0MgS0m3zIKlmXj3ZaGpfmPzGUhXcDBsa4d3R8otvrDOvrApeqNf
 WRfLx1kxsdfUGyCKVw3Hh9zBR162HlLD50fLi4a7e0B6dLZEezcbxkszgBGaOd3901SCj2x2S32
 EsyAkaLKmxWDmBkSxmBLPiJYzKq6yuUzkCP3AOXs1Ve+1d76
X-Received: by 2002:a05:690e:14c6:b0:64a:f289:28d7 with SMTP id
 956f58d0204a3-64cc211f199mr13054962d50.36.1772538125357; Tue, 03 Mar 2026
 03:42:05 -0800 (PST)
MIME-Version: 1.0
References: <20260301-point-v1-1-21fc5fd98614@gmail.com>
 <637a138f-ee6f-4940-843f-0ec873997de3@mailbox.org>
 <CAHijbEVBisTwn2hYdmPiz_ZNZZWppXHgN6T4faHncMHrPWSOuA@mail.gmail.com>
 <c62cdd6c-1a66-4c7d-a49e-8098c008c09f@mailbox.org>
In-Reply-To: <c62cdd6c-1a66-4c7d-a49e-8098c008c09f@mailbox.org>
From: Julian Orth <ju.orth@gmail.com>
Date: Tue, 3 Mar 2026 12:41:54 +0100
X-Gm-Features: AaiRm51KXKOL1n8YrzQIeRF2S_qsUIuNii8GsKvkBjaXqn2Rd0WRO046NFcZx5Q
Message-ID: <CAHijbEX-V9ioXrDAQVrBXET2zq0XiWjWmYsXNJP-Fij7Deo38Q@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 03 Mar 2026 17:00:21 +0000
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
X-Rspamd-Queue-Id: 6A0421F4469
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:michel.daenzer@mailbox.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:christian.koenig@amd.com,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[juorth@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,collabora.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[juorth@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 12:38=E2=80=AFPM Michel D=C3=A4nzer
<michel.daenzer@mailbox.org> wrote:
>
> On 3/3/26 12:23, Julian Orth wrote:
> > On Tue, Mar 3, 2026 at 12:17=E2=80=AFPM Michel D=C3=A4nzer
> > <michel.daenzer@mailbox.org> wrote:
> >>
> >> While I don't object to this change, I'd argue that this is really a w=
orkaround for broken user space, not a fix for a kernel regression.
> >>
> >> User space must initialize the full struct to 0, except for the fields=
 it wants to have other values. This kind of kernel-side workaround for neg=
lecting that won't be possible in all cases.
> >
> > When the code in my example was written, the points field did not
> > exist. Therefore, as far as that code is concerned, the authors
> > believed that the struct was fully initialized, since they manually
> > initialized all fields that were contained in the struct at that time.
> > The code was then later recompiled against a version of drm/drm.h that
> > contained the new field.
> >
> > Or are you saying that userspace must always use memset(&arg, 0,
> > sizeof(arg)) to initialize ioctl arguments?
>
> Yes, it must. Any approach which results in newly-added fields not being =
initialized to 0 is broken.

Do you know of any other case where access to the new fields is not
guarded by some kind of flag that exists in all versions of the
struct?

>
>
> To prevent a potential follow-up concern: What if the kernel uses a large=
r size of the struct than user space? That's fine, user space encodes the s=
ize it uses in the parameters to the ioctl system call, and the kernel uses=
 0 for all fields beyond that size.
>
>
> --
> Earthling Michel D=C3=A4nzer       \        GNOME / Xwayland / Mesa devel=
oper
> https://redhat.com             \               Libre software enthusiast
