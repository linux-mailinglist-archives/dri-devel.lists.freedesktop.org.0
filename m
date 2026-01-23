Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLRnB//Oc2kCywAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 20:41:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C28A67A3BE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 20:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C750910EBC5;
	Fri, 23 Jan 2026 19:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oj/+fGK1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A9910EBC5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 19:41:47 +0000 (UTC)
Received: by mail-dl1-f51.google.com with SMTP id
 a92af1059eb24-12336c0ae91so302819c88.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 11:41:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769197307; cv=none;
 d=google.com; s=arc-20240605;
 b=a7mo20AVEMkhi/GURVanQqmRBWSW/+PEIUMNFJyMwwtHYSreSoZwr9ru8ovQbd3cc0
 6LHh4RGDv5gAZ89omWqSfZDErux9Wd632J8I0jHtRvtdWo4N5WHJ4QcL+Ztgy2ik6W2v
 rztO9BNn9haLo/gg5hFxVNZOWKe3W3DpJyV2NSxeTqR5P08QoVzqyAAW6DzxmWrAg/eR
 xQHF1Uq1mAcopDxU1N4dShg8tNCe8CHu04ypmxMdobx6UoI9d/1GlaNteEZBvK/A5i4/
 c+H9KgshqbvIUyaz1KbhG6kffl/ETJdNIBYyVOodyAzqI43/CJXA4GXbfLuU0hz5G96J
 RyCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=fM4V7Qlttc81MqOWGsEEBwKdyqSfdIs8cEOQqgbpEkU=;
 fh=gM4qajZm21eq5z0mGEgypfbKEpy0wp5xgu/2bUSp2jM=;
 b=QCXaZeCpEeWjVQbTHx4Whx6kjaKIfMjqPst1wBI6AlHFz+ckq3SLKkBJaeSDLDVO9E
 RrUN+jBE6z4Lp6VAco/mhD6kAFilLVtCbKjZUn9reeb/DVJi1D7tQDKGorRFNkBdCx+g
 5B9gXjdI2WyESGX+DGVxCaJhuzinVSFbTyhAJDaPd/6SW9bAdQdEzpzKAJkgbk3PTm6v
 TxTgRztqmPeCSuYIK+rvm/vG8zTllTWQDtjJWo4yf/1tgJTdBzfj/knWRbfrZnqwRYx8
 ZsRJq0ekmfOqEQMogGD1VdDbUswrGC1g+4KORW2Nokh2DIpZsjf6cTRHjjCql6i52NOL
 vrZg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769197307; x=1769802107; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fM4V7Qlttc81MqOWGsEEBwKdyqSfdIs8cEOQqgbpEkU=;
 b=Oj/+fGK1TCPbVlt+k5gx6yxHaYtBO1bgxGFj+12s1ZHa8kNuC5wbeQC3VQcf571O1M
 kaSpIfgCmVfdh5ohwINbObtCA/7YbozPw4bDdM7qDGUNuMaYaMhdSqoUgp6vV37w/ARc
 IyDl22dnHT0i//TOh1sFX6rWAnUvDMmjh15vnBF5io9xWxxjODz1p6k04ADIEjXUBQOY
 IeKZwZNmXPpO1wfWjzOm5wLsoiFJ0JpmZ4lShHnM5kYt97k5g4F3GpvsrZsRsOv3GhJz
 1lcH+1dGjwaVrwmxUcOgTGmPJgI8ANrrgE5bKP+igVIIsMKlfZZsMhwW5QWX+n0FaYpc
 wu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769197307; x=1769802107;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fM4V7Qlttc81MqOWGsEEBwKdyqSfdIs8cEOQqgbpEkU=;
 b=rwTmvpgrRr9R7WefANYQXSQBObmoUF6I2dOVfoBJa3cy3ecXpgdBlxMljf6Yk7XcUu
 HAAHN54yX4g638WcnuetUqs1XlUQA9zPk9NpgG8lpzpsqYMgSeRdQNMkkveSMu+U5iYl
 luxKK8tjbmdjdHXdmTbRdjdS3KMDQps07vPcE4+T9aQ8fsXpoy4WnD8tcwRMJCOkEog+
 MTepjxSEIpHIIrHY5XmrMWT2L+EPepObv90WFsxSKde30Gfnz7wGw8Y1MRL6Cvm2t+eO
 1ObYuzZtC/hk2TV8l/T9mhLhEhIB0Dio6ZcC+y6sHDKSQFfFnHqi1WJ510boHnfJtyKL
 CTnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa1P0Sk8qFQBGapn4vwOAYhIJ1N35wZHbCgxzAxPcc4RCcPo4evera38v1tu8m1YuQrUP0hv0ibiI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6EuIy1pdzqy2ROCW9Fe1MwkAoJ+iSGC3QuARf+Oc7reDXbSaV
 xLoMw9l+m3QaWXzydrcK3m69jldjl7XiqGbPekPyXUqyvTmNM2zna9DnYUKNlDDLkQD1oQDUS6d
 0RhHyYCW9UiehRJqr2g/nQReeaJ8KlHQ=
X-Gm-Gg: AZuq6aL0CYrv+p6TqJ8UkxdLxvpkZ0GBVgV7j+T1HNvTdF6AGOnHy1DXSp6l5D2hD0c
 /9ukrxreTpfKIxKrpnIf8DD0K2LoADK0Y7+Kl64nhkZIB6PqxaBow6bkskH1S4bGY63m6SqKUYB
 qf03yF+4TXnP1PHupml3d88Jw3Eu+Y4VDiX7MJKXaTn9JaYFktiSASUf1U3pEV6xjMnougJDLSp
 vh++9cCHZcCKnp8k/ObkOv4a8nVxsuFNJtFFzFTKClP3RUbwXH5TrQB50i3gpIByGXQIoQj
X-Received: by 2002:a05:7022:301:b0:119:e56a:4fff with SMTP id
 a92af1059eb24-1247dbffc9amr1029257c88.4.1769197306543; Fri, 23 Jan 2026
 11:41:46 -0800 (PST)
MIME-Version: 1.0
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <2de6d428-b997-4ba8-8766-a211e5612e72@amd.com>
 <aXOJRWALUJLcGWqh@hal-station.localdomain>
In-Reply-To: <aXOJRWALUJLcGWqh@hal-station.localdomain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 23 Jan 2026 14:41:34 -0500
X-Gm-Features: AZwV_QgIlpADFNOPq37tQrn2l3FRpM0FiOTKdfkPdEEdOybAHxouyd6R1aMoyPI
Message-ID: <CADnq5_P0QUmKNHyrs5qBkE+EWh1-i5U0+vNRqvwPwqqQPfNqZw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
To: Hamza Mahfooz <someguy@effective-light.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, 
 Kenneth Feng <kenneth.feng@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, 
 Alex Hung <alex.hung@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, 
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>, 
 Fangzhi Zuo <Jerry.Zuo@amd.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
	FORGED_RECIPIENTS(0.00)[m:someguy@effective-light.com,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:sunil.khatri@amd.com,m:cesun102@amd.com,m:lijo.lazar@amd.com,m:kenneth.feng@amd.com,m:ivan.lipski@amd.com,m:alex.hung@amd.com,m:chiahsuan.chung@amd.com,m:mwen@igalia.com,m:mdaenzer@redhat.com,m:Jerry.Zuo@amd.com,m:timur.kristof@gmail.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:timurkristof@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,lists.freedesktop.org,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C28A67A3BE
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 9:52=E2=80=AFAM Hamza Mahfooz
<someguy@effective-light.com> wrote:
>
> On Fri, Jan 23, 2026 at 02:52:44PM +0100, Christian K=C3=B6nig wrote:
> > I can only see two reasons why you could run into a timeout:
> >
> > 1. A dma_fence never signals.
> >       How that should be handled is already well documented and doesn't=
 require any of this.
> >
> > 2. A coding error in the vblank or page flip handler leading to waiting=
 forever.
> >       In that case calling back into the driver doesn't help either.
> >
> > So as far as I can see the whole approach doesn't make any sense at all=
.
>
> It appears that resetting display firmware is able to put at least a
> subset of these systems back into a consistent (usable) state. Though, I
> don't have a reliable way to reproduce the issue that I'm seeing so I
> can't say for sure what it boils down to.

I'm not at all an expert on KMS, but I took a quick look at the in and
out fences in KMS, and I think I know what might be going on.  The out
fence is signalled by calling drm_crtc_send_vblank_event() from the
interrupt handler for the vblank/pageflip interrupt.  If that
interrupt gets missed somehow, that never gets called and userspace
will wait forever.  As a safety measure, maybe add a worker thread
that gets scheduled when the atomic commit happens and then in the
interrupt handler we cancel the worker.  If the interrupt never
happens, the worker will eventually run and call
drm_crtc_send_vblank_event() and get things unstuck.

Alex
