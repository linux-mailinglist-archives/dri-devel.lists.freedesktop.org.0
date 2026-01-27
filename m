Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iC81J/BCeWmAwAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 23:57:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B349B4A0
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 23:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A568E10E5CF;
	Tue, 27 Jan 2026 22:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CPYGo4Qf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A69A10E5CE
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 22:57:48 +0000 (UTC)
Received: by mail-dl1-f51.google.com with SMTP id
 a92af1059eb24-1233ad1b4cdso5636c88.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 14:57:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769554668; cv=none;
 d=google.com; s=arc-20240605;
 b=jawXuRqU74hS7P9oLUwiagc/96EMu9TQeJ193WBxLO8tlrOm0faTIFWI4jk4qBue4P
 s0szwz9leIpkiccKFUXJlAsOzWNdkw+2grm5wH0FUulR5MCICvcKEHDGyV4QMBqVV82o
 KJlunMoILTypUZMTpSPdZmC1za2Z63CXWSnVrn49urwapS2IoHcRygEn88fVCFg4ig90
 JsgC2zNh6rTSDuTXPq/Z6DJTnbP9SQGDHsywmFSbs49SR0vetV9rFf2EyGNCKMpPYmrM
 BHaXkYqY0GJWBfAeiXSEqzI86cumyfDETu9ItMaZmkh6oWnvzpl46Uy9DnuQVe1Ua4mX
 akVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=dastR+txnDmXRBbBVeuAN64jXG1aCHDH1SoB/eaxcuI=;
 fh=3F/U5NqfNwEJVB18IrDuyEoeU38rCtuyd/tG0emFkMs=;
 b=EYISdrI3JuAEBYGllGNkDV+q8e6rCiCKuNkuejLiI+zMBo14/gAzlbKgPuPmxZapk3
 PezXcPiYRH5DN05YIGqWnTQaiv9vRO778uPMoYWDT5KuF6dsFzG+hcBEr6xQZUyvyRR9
 1BYALq50/moSlg3m3PhBl7g5GYl9JPDM9HXGe4mP9Giroky9Pw4TR6wY65Hb2v4HSUKJ
 m7ZhWKouAAgJpGLTDANIDMy8QnUw47+P/rXJ/KGS9KSsvHWR4tiRVLf7mp2oHQSxKV3g
 Qy2YHzmEjruQzVQ4y3mppPxo5TEW93jR1T2W6OWhEc9zElz93QYBpVqLkO7pMWD90M0Q
 Ie6w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769554668; x=1770159468; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dastR+txnDmXRBbBVeuAN64jXG1aCHDH1SoB/eaxcuI=;
 b=CPYGo4QfcML4tFJJnHYsZfBf03gbMOftuH4rXHGM9faG1SNEfRt5jkYIFxi7H1nk7D
 zzX4VcSafeFhk81TC8RAgZAsqEoJjYtvlp1Yq1uDRNmo65dmneb+nqzZe2NrbNlN7RJ0
 yuNkiXuFqg9bHJSmKmaqatt/pIMjOdPNXRNTnbPR/P9ugbj1hcoG8ui4Rcg5FWWrjQCZ
 GTobwUtEKv3jsHQSvkTFPztou2BhTzadunOV4LozNCFyPxigHFVyPVnRyBPrO1QKeL4b
 v3HwyHpzmUgIrdSOJWfWd9sQKZ2FonB2Wb1Er9rjtG3BN2Q0Y96efGcVJl4yiMlaOTWh
 5Esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769554668; x=1770159468;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dastR+txnDmXRBbBVeuAN64jXG1aCHDH1SoB/eaxcuI=;
 b=Jk6JJPq1GDmmOQpl9KaS72VVARw67wh8C9R2phoWiUNmP911bpx6Z66se2iEhrTj5v
 dLOpd31TAWFecuqmF5zTAZr8QAZ011PxSuDuDkno4rn8BhwW0MrkZEBaOFA/3RrowO0o
 xFn3EotcNcEQTOib283v1z+Qvrto10hgci5cwmE1nU+6u+KTffA6nn3VGhtQe4XnNLa2
 HwUHZn9DN62QbLKiksAXSsPkpEwvwDhnNFDWEqihBGu8+NXZW0pZwBDAOPYl7rlw3O1+
 F8aWhXVlnuaYdGljmZ1c3jQEZNI8g9Gg8WaxQztNiXcFrBecwArEyGdIzCOn115ji3uc
 dbzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS9HVj2tYldP7a0H6JPkhPv28mFvx0Ll+TBb+QQl0xQLLlh/+rkCrmxxpBfjZMmtosPfJGTdBBeeY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzLWEUNAINRi07w370mNW73qYToJLXtRlfpVVyTJi7oDpHqoSi
 ygpyrdysWJPFWgfc5/xvdy8FRQPYC+TFp1grxeHx+MOegdfhbh5eCocC5HTA0Uvyr6HSuUfNB4A
 1X0WxqnqUduKH3fTVNgN2vnlL6075gnE=
X-Gm-Gg: AZuq6aJw7u5siMwIC3mOaCXZXzvzLud9VxYuO2jZ9cd3FnOeBKhDsBH8FckwPCtwacy
 mSid3WMKfsOpCwq8/5jisrFpQn/eBIbwtxxiHZcVLZ/hBNoDJ+qleEXluqLRQIaZPrU3Qp6CEVv
 bNTXY9fqKZWD0UagmpIHqRb+vOoq5xZDGZ01kv14AOW0ArB6nxtxiANsqljPgIVoVbQ95CsGKaf
 JTcMJr1qyfSaE9pxhFE+XJtLOLoZX5WSrNBBb+B3XLCoQaMFv0zPvkNV0Nkvs8AdIXVfbJn
X-Received: by 2002:a05:7023:b02:b0:122:8d:39d8 with SMTP id
 a92af1059eb24-124a9a0f8afmr118232c88.6.1769554667696; Tue, 27 Jan 2026
 14:57:47 -0800 (PST)
MIME-Version: 1.0
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <2de6d428-b997-4ba8-8766-a211e5612e72@amd.com>
 <2349754.vFx2qVVIhK@timur-hyperion>
 <a8b972be-7265-492f-9855-cdec94a0e0dc@amd.com>
 <aXUQKSJGkz7nzHJ4@hal-station.localdomain>
 <CADnq5_Ob8yiivco+szanSiXuRwdAu4xHMe=8OQSk+Ufqykgobg@mail.gmail.com>
 <aXlBx528d11lMJvl@hal-station>
In-Reply-To: <aXlBx528d11lMJvl@hal-station>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 27 Jan 2026 17:57:35 -0500
X-Gm-Features: AZwV_QjN7agKnLyYKe7Smi9fxSFoYzyznSj_J6HKhoMFANGlUSc0gJvc9OHavDM
Message-ID: <CADnq5_NXd7HYipJTW_riwQDjrZ7S-PW7oFJ=C94_FGAAesV3kA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
To: Hamza Mahfooz <someguy@effective-light.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
 dri-devel@lists.freedesktop.org, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, 
 Kenneth Feng <kenneth.feng@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, 
 Alex Hung <alex.hung@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, 
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>, 
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:someguy@effective-light.com,m:mario.limonciello@amd.com,m:timur.kristof@gmail.com,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:sunil.khatri@amd.com,m:cesun102@amd.com,m:lijo.lazar@amd.com,m:kenneth.feng@amd.com,m:ivan.lipski@amd.com,m:alex.hung@amd.com,m:chiahsuan.chung@amd.com,m:mwen@igalia.com,m:mdaenzer@redhat.com,m:Jerry.Zuo@amd.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:timurkristof@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,lists.freedesktop.org,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 51B349B4A0
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 5:53=E2=80=AFPM Hamza Mahfooz
<someguy@effective-light.com> wrote:
>
> On Mon, Jan 26, 2026 at 09:20:55AM -0500, Alex Deucher wrote:
> > I suspect just calling drm_crtc_send_vblank_event() here on the
> > relevant crtcs would be enough.
> >
>
> Seems like an interesting idea, though I would imagine we would still
> want to attempt a reset (of some kind) assuming that the subsequent page
> flip also experiences a timeout.

Is it actually a timeout or just missed interrupts?  I'm wondering if
some power feature races with the modeset and causes the interrupt to
get missed from time to time.

Alex
