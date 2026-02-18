Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INhALY2LlWlVSQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 10:51:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F546154E25
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 10:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EC610E2EC;
	Wed, 18 Feb 2026 09:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="4fMI5QzQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F7910E2EC
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 09:51:04 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4832c4621c2so55392825e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 01:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771408263; x=1772013063;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=PSlS4Q9N8FSMlYq+evkSTqDZvOhmh8neJQMMReaF6yQ=;
 b=4fMI5QzQ2InoKjV7Gdu7S84z8Txuz2LFCK0OQKpEsy85JkZ91VJw0oL1tOktycfXjW
 3ewrHFo7GhdJJC+ekcob5I4+b4q5pTQDAAHF5J0F1LV9vZfE0d/woGIe5yUsgsd2/oKB
 nsP+mlsAAYVMt2BUO8CrIBidQ0OjReVTfvHVvDdswo2eLdVnBCcHe/b2naTHOcy4j7wq
 O+C2M6si02+r99FfIhoxeTEjuBgzbQTDcAM3WBV7RMJ15c8/Sib10RvXFRKOZ+vcDF1r
 vcQJamZDmB7qBelk7GffGJP0/vv+7mjHzZDWqnsTiDH6+CwmtrWB+r0hDV/cmHmMRIYK
 r9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771408263; x=1772013063;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PSlS4Q9N8FSMlYq+evkSTqDZvOhmh8neJQMMReaF6yQ=;
 b=RzwQO6Os/0WX77CnlQxWs3rZVT7O9ycuAAIal+9l+/Lwfwj3tYpyM1G2OiKKyEguMb
 NLfDl3zRdLFkea8xVzmKkllyU/lDnTZNxbLQfXWslA/KIaJBAfnS6mDgWmV+luKT+P2d
 e7Tx7207HjRJtVRNX/oUPCzQpuibl9sSx10s+Zvolg86HM5RPxFoUuzMlYA0p9bv0e47
 qTgDLnxPwAmLDlFPHZ8RXIaOC2jPdx4saqcK5Ut6a93XRF9e1saDKGb21Ns9et3+bu8g
 kR42mqnoyFO/H8YtCh/Ldyds0Ue9vp+j5s3zUDUeKRh1oTfFzH3Z/NZSrIuaMgEzvmR9
 4scA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCwyeGgBZBTWPGiTLZb3gIha48JsPZfDswFc4suolEVktUh5rWcF1QbVJVPYbro32/n2rKc6OXUkc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyx59OCOAkdjOtAROtuoLV117nQy4b/tDSqbiL9AJH8Hq8KJG/6
 +TCxV2gB36Vts0hoIxgTVcNBX4XGmJRpP+eOQUd9PIsHNdr1gpucJ30yA9kQ3lMJxwtNd6exM+C
 /Pufsmrmxn9oGHHF+og==
X-Received: from wmbhg17.prod.google.com
 ([2002:a05:600c:5391:b0:483:7b48:cd99])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c21:b0:483:47ae:7c00 with SMTP id
 5b1f17b1804b1-48373a3eac4mr314707005e9.20.1771408263104; 
 Wed, 18 Feb 2026 01:51:03 -0800 (PST)
Date: Wed, 18 Feb 2026 09:50:56 +0000
In-Reply-To: <3fa96185ef99f56947360355dc55739d66043f28.camel@mailbox.org>
Mime-Version: 1.0
References: <aYsvc3Q8h-Gg27-g@google.com> <20260210142631.6f8a3411@fedora>
 <aYs3VVH_UXMFa5oC@google.com> <f4c32d9a-7303-4a50-aafc-8039102fbd3e@amd.com>
 <aYtJznZcCEYBffil@google.com> <d9e00d8c-93c0-45f8-95f2-3235fb781e7a@amd.com>
 <3d90656315ab0b52f4725ca7c2cd10859d1e4f69.camel@mailbox.org>
 <CAH5fLgjNS1e420UX7muyEPWX3dZ-JsA_uy3=PM7QLA2NuoKJmw@mail.gmail.com>
 <50ee6f3f-82d3-4eb6-ae3f-9f032f3caf1d@amd.com>
 <3fa96185ef99f56947360355dc55739d66043f28.camel@mailbox.org>
Message-ID: <aZWLgObIwWVaCPkv@google.com>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: phasta@kernel.org
Cc: "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gary Guo <gary@garyguo.net>, 
 Benno Lossin <lossin@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:christian.koenig@amd.com,m:boris.brezillon@collabora.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,collabora.com,kernel.org,gmail.com,ffwll.ch,garyguo.net,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:email]
X-Rspamd-Queue-Id: 1F546154E25
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 03:28:06PM +0100, Philipp Stanner wrote:
> On Tue, 2026-02-17 at 15:22 +0100, Christian K=C3=B6nig wrote:
> > On 2/17/26 15:09, Alice Ryhl wrote:
> > > On Tue, Feb 17, 2026 at 3:04=E2=80=AFPM Philipp Stanner <phasta@mailb=
ox.org> wrote:
> > > > > > >=20
> > > > > > >=20
>=20
> [=E2=80=A6]
>=20
> > > > > > > Thinking more about it you should probably enforce that there=
 is only
> > > > > > > one signaling path for each fence signaling.
> > > > > >=20
> > > > > > I'm not really convinced by this.
> > > > > >=20
> > > > > > First, the timeout path must be a fence signalling path because=
 the
> > > > > > reason you have a timeout in the first place is because the hw =
might
> > > > > > never signal the fence. So if the timeout path deadlocks on a
> > > > > > kmalloc(GFP_KERNEL) and the hw never comes around to wake you u=
p, boom.
> > > > >=20
> > > > > Mhm, good point. On the other hand the timeout handling should pr=
obably be considered part of the normal signaling path.
> > > >=20
> > > >=20
> > > > Why would anyone want to allocate in a timeout path in the first pl=
ace =E2=80=93 especially for jobqueue?
> > > >=20
> > > > Timeout -> close the associated ring. Done.
> > > > JobQueue will signal the done_fences with -ECANCELED.
> > > >=20
> > > > What would the driver want to allocate in its timeout path, i.e.: t=
imeout callback.
> > >=20
> > > Maybe you need an allocation to hold the struct delayed_work_struct
> > > field that you use to enqueue the timeout?
> >=20
> > And the workqueue were you schedule the delayed_work on must have the r=
eclaim bit set.
> >=20
> > Otherwise it can be that the workqueue finds all kthreads busy and trie=
s to start a new one, e.g. allocating task structure......
>=20
> OK, maybe I'm lost, but what delayed_work?
>=20
> The jobqueue's delayed work item gets either created on JQ::new() or in
> jq.submit_job(). Why would anyone =E2=80=93 that is: any driver =E2=80=93=
 implement a
> delayed work in its timeout callback?
>=20
> That doesn't make sense.
>=20
> JQ notifies the driver from its delayed_work through
> timeout_callback(), and in that callback the driver closes the
> associated firmware ring.
>=20
> And it drops the JQ. So it is gone. A new JQ will get a new timeout
> work item.
>=20
> That's basically all the driver must ever do. Maybe some logging and
> stuff.
>=20
> With firmware scheduling it should really be that simple.
>=20
> And signalling / notifying userspace gets done by jobqueue.
>=20
> Right?

What I'm getting at is that a driver author might attempt to implement
their own timeout logic instead of using the job queue, and if they do,
they might get it wrong in the way I described.

You're correct that they shouldn't do this. But you asked how a driver
author might get the timeout wrong, and doing it the wrong way is one
such way they might do it in the wrong way.

Alice
