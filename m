Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFMnMuUgg2nWhwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 11:35:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A00E4943
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 11:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1935A10E5B9;
	Wed,  4 Feb 2026 10:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Vldgl1hL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DEB10E5BE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 10:35:14 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-59b7c2614f7so6174263e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 02:35:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770201312; cv=none;
 d=google.com; s=arc-20240605;
 b=NV+V2BI1t+nStUw1pTJMfNVwudtipDfl7vfWFEw4zNmdzVymcJ+oqxVxKvrDMBAgNE
 Wpj6YzuQmd0oKsxdb4PA/V5l112DZ9gIlkC+QqT+fawQsJEAJ/4gVl1VcJIKZ/rOGXX9
 xoHLXpB2g1bNFeIEFvLXtne5rd+dPl1sqcbgyDzR7MZZOnApO7J8HwOqFa5INPTGE1kV
 u6UWGV9XYK9PbUZk636Xo4g3vsK8NgKlj6X4tLQgci2EVDhxJoyjDOP+rad3MikvFEf5
 5HuL2Mk8/7odlTRsAPYm8LDrCiB9Wz+GTDV6wd7G/sre2XRIeQts0SkQwIDjDMONVkJA
 WJGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=nOiC9pvPh+VgFtURHAiWfhK9h8fXI4IYsOk6Zsqg03k=;
 fh=DxugiPg9lPvoY99yLWhwfBySE17UvKcbrAgMm36oAy4=;
 b=T5AVQc2dlD1CvXWHG5iMfWEoSNATDd93UtxOOFhRY+ZHK/10vwRm4WIBKjYBgCRGoN
 tA2WzqaAy8rt4246fmS7Jywj8myMKAh+lSaXEzNlDEa07hVEO/hOAf3HAnPAwDqLgPkX
 xdP6wgl07cUBfBmMn0h0Qg20hdLW+Ux1Nls3Q+ftYISBGxNv8pMnbdS4Gg4wRM1WRJ00
 b04S8gIo1CyhCzuusjjB3TijoSUwlcWtjZTIvTYrgsqayo8Cw5O76B6DjCEcZ4xd9jie
 8P4j2HTim3uMNFYHMsY9Ofx7VdAnMiv30MxeXss6valbv4VV0GsklNVHaMnRyk1i3pZj
 x0fQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770201312; x=1770806112; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nOiC9pvPh+VgFtURHAiWfhK9h8fXI4IYsOk6Zsqg03k=;
 b=Vldgl1hLlH9TbEzbWkjYIDXcQzNz0/ILbVopt3e5ZToeuJxk+erU7wGztoZRPDhKcc
 0Ywp8Fp4BDkSYO70hfeXCvFeUEG4emTFq3PRQVXEdtuPssfl9a/E7+JHdBmTWvgFgvff
 I75VefbDlDxs9LkR4t8RQP++uIxru1oQnEt3pnV8iKpwzfjYS16Gh1t7BYxDOWZ0b5OK
 2fW8qCPMTV1UOLxDYFibUoePh4ypgCziieKdW0+IbICHjAqlT65HFsM/42MTkJcG50z1
 xnILfeiq3qyd9NqpuaE5jmeallT2CFbLnubWkxPFcAFdfRaf/KvfDn7sN6URXatvdLQw
 sfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770201312; x=1770806112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nOiC9pvPh+VgFtURHAiWfhK9h8fXI4IYsOk6Zsqg03k=;
 b=qvSu2HcGV+bIIn2YAmFCto/v9dmDmhrAfmljCc1YF9ot9LDl0NmBRjgFPeg27NvS/u
 77IIGdKpwZzw00I0mEiyPUWXbouuVGZKCL5TFk73gzy5ZlDehPpj9/xKcwmTchSg1CBt
 r6+WON9Djcbag7+WXUiOcBDDJa0AVxgYBWDggjD2FcvPUbWArWU0CnJxnr3PBo+0oxxQ
 DCBTx004VfAjc3nciBQ/rpyPz9BRSQKtZWs5nsyifdIVDObjVjgtYr1BVel3YTghrMiR
 MfKECioJNBsx92QS+aaTOWXtFoj4AluohO17RfAYQGsKMG9O/nF433Mp3gjvEO0XM4ia
 mg9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6oOBg+BZE4A+P5NLpnzkRbsBq13DaUmv/eYTKeuD7Ra1MxrKaOZcZKrYVCy5D+oYcnmKAxBHIaAg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoR2jCuZ9dZ7kbnP2wNaPfTnF+dN58Liu9DT7MngEG2k3FJan5
 4padyX25iNx2xBOadDfkayiLDhmRaka0uxGXTtnL/JJ4b4q0sAteOejmrv6JTsSwQi0nsKfFqDG
 nZ836vuaPevu4odjxu7tGeAMNeuiRylttclQffpswJQ==
X-Gm-Gg: AZuq6aKxFpJ0sPpqy3xuuBZMtcoopLouQ+98xA23lFyex0CfKxjnNhfRVFF9FFNWUbK
 n32cPuq764AL82l0wsJZIZghqbHOEuCYpLaz0Kdls8Q1tRYEnJIHdtzZ3e2zbwcPr7S9rPdjxMJ
 Pvu/sz9eofSU79oBLQepLrUn90G988xN650oQJNTvo11D95/rM70Twt+Hu5HsrDqZy1IGGe+AMl
 tubGGZQ8LfDbI80Kh6ZCiQoOm+pCTArpmKORxq1mZ7+Xyq68ctB/lg8UlHOi9twVOa4Qf2SIuj/
 Z7U+Y4XqId/++5U0q5p12WOLXAxl
X-Received: by 2002:ac2:5687:0:b0:59e:a2d:daa1 with SMTP id
 2adb3069b0e04-59e38c03f05mr964941e87.5.1770201312534; Wed, 04 Feb 2026
 02:35:12 -0800 (PST)
MIME-Version: 1.0
References: <20251031102020.95349-1-marco.crivellari@suse.com>
 <CAAofZF6M+87thr7KGyytcM1sqebH=U10nSNo-gmuDxeFSrkwCw@mail.gmail.com>
In-Reply-To: <CAAofZF6M+87thr7KGyytcM1sqebH=U10nSNo-gmuDxeFSrkwCw@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 4 Feb 2026 11:35:00 +0100
X-Gm-Features: AZwV_QhGq5526Oi3h8uHCtPNHAdKDz_sRIaZEEef097pXonwtoTLaAoklW1YP8c
Message-ID: <CAAofZF74-jfGMTTOfD1MYSmoFngZRy12G4_Wv_ANHXGaor0gQA@mail.gmail.com>
Subject: Re: [PATCH 0/2] replaced old wq name,
 added WQ_PERCPU to alloc_workqueue
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
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
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:nouveau@lists.freedesktop.org,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:frederic@kernel.org,m:bigeasy@linutronix.de,m:mhocko@suse.com,m:lyude@redhat.com,m:dakr@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,redhat.com,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 31A00E4943
X-Rspamd-Action: no action

Hi,

On Tue, Dec 2, 2025 at 2:20=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
> > Marco Crivellari (2):
> >   drm/nouveau: replace use of system_unbound_wq with system_dfl_wq
> >   drm/nouveau: WQ_PERCPU added to alloc_workqueue users
> >
> >  drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 +-
> >  drivers/gpu/drm/nouveau/nouveau_drm.c   | 2 +-
> >  drivers/gpu/drm/nouveau/nouveau_sched.c | 3 ++-
> >  3 files changed, 4 insertions(+), 3 deletions(-)
>
> Gentle ping.

Hi,

Gentle ping. :-)

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
