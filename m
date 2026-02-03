Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOriMkttgmlkUAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 22:48:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 334C6DEF52
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 22:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5711810E356;
	Tue,  3 Feb 2026 21:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="STG9slgo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD5410E642
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 21:48:55 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b884cb1e717so39557566b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 13:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770155334; x=1770760134; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EOyw3MaQo4lDd393arkCTn4hcIpFAf6muvV/CwKSO1E=;
 b=STG9slgoXkvqDXWJp1qZ/XValWAmmckQP/kz3a4Q2yLNCTr7IimdMztZ0V2Nj0vIhN
 yViC3E0+zrqs5sNdCTJz5wvvjzBvEFA7i1qI6zyErRkAQxZljIw5U2cvGY3PfgklISfw
 ucqpc9AjxJ2irjtpoAygIcmJQ5kHMyo8I6efcxxIQYo4bMm+kccxGwUMxE5uqmQ0iJv2
 hh09IJDjw1AneVRyM8S5hj57n3RSqBwPWF1r7K99C/MI48jBjqRvqwreJDbY/jmofSWl
 1z3gqFfuCdyqNKiN5OkypbVMpj00dIoAKIkrif/Gzkhvng5mbXWW+xt7PgJ6sbN+5nDU
 7xlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770155334; x=1770760134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EOyw3MaQo4lDd393arkCTn4hcIpFAf6muvV/CwKSO1E=;
 b=GHd9uNaUMYogYawHCih5UOuMNfHv5mNtLHlpuTZ6Zxh7Q+uq9BwaPsPe3+jCJIU2Tr
 TYTTpebXkGsXnhvdDQGVeXHuI/eeT630adkIrXwx2AFQCeMO7Wo0v1SFNHGN/RDFeyG3
 FuGHYosCnOizlNpvlTBPKrZeXD+JhJMbsaJ0PAhnF0W0DWG2UdXWBgs6bnK47xTlT/tV
 tIPBFu2VguSa2KEIFBmScWs0T20vp/EmHSO1sSs+zM9qcSs7f5W3rWNDb/TxRSEYXA05
 /9GTH20riovUkcReABqqpKMa88QABtsx9+/BFcJAnOb3+1te9mSvQwz3RbbWHzrri+c1
 Vz+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmFurHQFNq/Dr2V784+LJIEYNIPfO0SsIbLNoWui6SLTlHoC1bcG8K6ZJRvDAlg8mlApPgxthgTrg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoYlMx9f2fzCrytFUidBZtPgQ28yIQPMXuw0yCFttdTFlHNfRi
 qRTqKykakk84h4HeN15aWkaITXfiY/Srb3NnbyH/rOLLOKW4Slp0/3WQ
X-Gm-Gg: AZuq6aK6Fbu7OP2g2ubke03WuoRvrGz2ru9vc2itMMt47f/kKaqnqXlAC/GIEQW/7gf
 ZgDtPDn8nrwXt1bXLH/DWzueQm4PP8xVYv6lRsVc3Zo2czT7EETLaUppNIn1gzqbMs3ZjleliNM
 AR6cmhLpEBa/YYCVv4nBm/fKWbp4al7bKWBmgvEHGU+jOC98ZHQBUSGVJnifWN1OsozMUulshA6
 dJmGKIT+p1VN9HMfpv/gCAXG2TEg8xl5AT6DvfcyroRPnWy4GkucJjkMdDzpjpleOK8HDeEDnSn
 XcwJ8P+no+MHlCg95Sp10bN3D8kjfNQ+US6cqp52lcIQ/9PhipzDFZvNzaTI+QWOhJ/BkITiJK+
 AMwXe99bzN7vzPw77ERIZAnlOpcLKxPc3hfZuqPSvAowL82XUXH9CBVz3ouEhQoywa3evvEuOAP
 4FgUEKd3XGqYdTmxdyWSXTC2BtFrK770n+ru9g1AgbDYb2hLhvY9qi
X-Received: by 2002:a17:907:9449:b0:b88:1e2:ed49 with SMTP id
 a640c23a62f3a-b8e9f95d967mr62528166b.8.1770155334110; 
 Tue, 03 Feb 2026 13:48:54 -0800 (PST)
Received: from timur-max.localnet (185.180.91.41.zt.hu. [185.180.91.41])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8e9feeff5csm32034966b.34.2026.02.03.13.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 13:48:53 -0800 (PST)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>,
 Hamza Mahfooz <someguy@effective-light.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
Date: Tue, 03 Feb 2026 22:48:52 +0100
Message-ID: <27239220.1r3eYUQgxm@timur-max>
In-Reply-To: <2f9bc706-02d6-4dec-a56c-53abc5d43f46@amd.com>
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <2285353.hkbZ0PkbqX@timur-hyperion>
 <2f9bc706-02d6-4dec-a56c-53abc5d43f46@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:alexdeucher@gmail.com,m:someguy@effective-light.com,m:michel.daenzer@mailbox.org,m:christian.koenig@amd.com,m:mario.limonciello@amd.com,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:sunil.khatri@amd.com,m:cesun102@amd.com,m:lijo.lazar@amd.com,m:kenneth.feng@amd.com,m:ivan.lipski@amd.com,m:alex.hung@amd.com,m:chiahsuan.chung@amd.com,m:mwen@igalia.com,m:Jerry.Zuo@amd.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,effective-light.com,mailbox.org,amd.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,lists.freedesktop.org,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 334C6DEF52
X-Rspamd-Action: no action

On 2026. janu=C3=A1r 29., cs=C3=BCt=C3=B6rt=C3=B6k 13:59:00 k=C3=B6z=C3=A9p=
=2Deur=C3=B3pai t=C3=A9li id=C5=91 Christian K=C3=B6nig=20
wrote:
> On 1/29/26 13:06, Timur Krist=C3=B3f wrote:
> > On Thursday, January 29, 2026 12:38:30=E2=80=AFPM Central European Stan=
dard Time
> >=20
> > Christian K=C3=B6nig wrote:
> >>> However, just like we do with ring timeouts, we also need to be prepa=
red
> >>> for the situation where a page flip timeout happens and we should try=
 to
> >>> recover from it. And if it isn't recoverable, fall back to GPU reset.
> >>=20
> >> No, that is clearly a bad idea.
> >=20
> > I don't see why it's "clearly" a bad idea. It's not clear to me at all,
> > please clarify it for me.
>=20
> The GPU resets are necessary because we allow Turing complete programs to=
 be
> submitted by userspace and that in turn is then messing up the HW state a=
nd
> we need to reset it to get into a known working state again (e.g. classic
> reset signal in electronics).
>=20
> But in this case here when you see a frozen picture on the screen then th=
at
> means the CRTC is still working, e.g. power is there, clocks are running,
> hblank, vblank is happening ... this doesn't looks like a HW failure at
> all.

I don't see why that is an argument against performing a reset.
Regardless of whether the display is Turing complete or not, it can freeze =
up,=20
and resetting it will allow the system to recover.

>=20
> After the input from Michel I'm pretty sure that what we have here is just
> messed up SW state, e.g. the DC/DM code has no fallback handling and not
> only misses the HW event but also blocks all further page flip requests
> from userspace which would resolve the issue.

The display HW can hang in other ways, as already explained in this thread.=
=20
Also the amdgpu_dm code already acknowledges that the DMU and SMU can hang.=
=20
Those would be fixed by a reset.

> >> CRTCs are fixed function devices that GPU
> >> reset helps here is just pure coincident.
> >=20
> > Currently, the driver doesn't handle page flip timeouts at all, which
> > means
> > that if it happens, there is 0% chance of recovering from it.
>=20
> Yeah and I completely agree that this is the absolutely worse thing we can
> do.
> > If the GPU reset improves that chance to non-zero, it's already an
> > improvement, and already more than what AMD did to address this problem
> > for
> > the past few years. I just find it incredibly disrespectful towards the
> > community that AMD proposes a solution that they neglect to implement,
> > then
> > when somebody from the community steps up to implement it, it's rejecte=
d.
>=20
> Well, I've heard about this problem just a few days ago.

Harry presented the problem and the proposed solution at XDC, and the displ=
ay=20
team already merged some patches which are intended to hook up to the GPU=20
recovery, see:
dm_helpers_dmu_timeout()
dm_helpers_smu_timeout()

Do you disagree with how these are handled as well?

>=20
> >> What we can certainly do is to improve the error handling, e.g. that t=
he
> >> system doesn't sit there forever after a page flip timeout.
> >=20
> > Sure.
> >=20
> >> Let's maybe try a complete different approach. We force a page flip
> >> timeout, and see if the system can handle that or not.
> >>=20
> >> E.g. every 300 page flip we just fail to signal and see if things still
> >> work after the timeout.
> >=20
> > How do you propose to do that?
>=20
> I need to dig a bit into the DAL/DC code and see how the signaling path
> actually goes.
>=20
> Going to give that a try tomorrow.
>=20

Have you had any luck?



