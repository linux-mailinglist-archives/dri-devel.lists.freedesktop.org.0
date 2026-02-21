Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFepBXZxmWkfUAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 09:48:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FE416C6E5
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 09:48:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48AD10E093;
	Sat, 21 Feb 2026 08:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XwcCNsDU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC89310E093
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 08:48:47 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-65a3527c5easo5028115a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 00:48:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771663726; cv=none;
 d=google.com; s=arc-20240605;
 b=N5T/04BWrChY1qfa1yvbdB9VnHOEKFybzr4QOPUpo5QHHgpeVUvbmKNtuYHh5vrFaS
 Zn2/Gweh7CvWXeLgupE6u+JZDyS5uVtTvMUNRlcPPC8DrQ60+6thXHhfXZIRS9NsYhbb
 asPB2Mq76GFHx3f5rciSDzXMqB9vZ2mpzn+ecqWdU0lj/i2sXQnsEZ76Qj/y+h8SRy2k
 0EdKdRuy3LuuoScBPbEmIEnrpaEcmDBdBA/b60w7mn52snshKqVzMo6RR5ccBIqOdZoz
 hEtsfcOes41o2cE2NCYke3TJXYVJhe+uoWdhfS/Sy5Wkg4nAKWm0bv9itYCX1Ml52jZF
 7qtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=2EY5qpVvBsTDuSWve1J1gQhJ93SfOnHR3h2XpXzEvYk=;
 fh=6bOTqtqHoU/nukP/O8qO/OIIf6aO6XGw/neEi2FfTbk=;
 b=K5fDLJm7N6h52mc0zdVVmpX5tIBgjt8bdvOsuzeT3UCjrgUiSouCqiF96pZBSGarGt
 rSOuxDQtG39x3wDcV/s00AOUwya8tBcPlvvSxZOirkcS9zb0SB0n/4MtlrH56D4BmzwZ
 whRbGSQuurr3TFyqG4oIkpsIjrPpNIzFVH212z9EUziDPBkDoRsuCPu9J4OUOaWs7dhH
 T1/1w6wx2PgZ1fhCHH3W7xK4ysL0tWx0EM9e/r9R+hsLRrC9IcXBekRgR91cOgQEByeU
 XR+Y4G2beGWd0FlbAg53f1x//WMEhfDZp62k8vVoxHifDt5gpzsT3FoVte3FGs4TCNVC
 ZQTw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771663726; x=1772268526; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2EY5qpVvBsTDuSWve1J1gQhJ93SfOnHR3h2XpXzEvYk=;
 b=XwcCNsDUE3wy19+vabGPR4EJR4Y4D3qyivsgBUdE/1vAy63LpYlS9S+oeG1rQn6ILh
 4845kLRidfNHN2cxcAp2oe9R0g1B8Lbrc+GNreV2bLwTDbDu6Ar2ZL6zdPLB8YJLt1b9
 gEqbPf2AXajtQCa0UW2fXhsmin8R2IkF7053ZnsBrpnlxdEzcjp97E1VfJWtD1FuyrSY
 AU7jmxto16XNuoVYTT5Ls2i8x5xr/Smn7HzIXMylRuEV2cfcPb5yuHKyecIhxT2crKUk
 tB6ciyrHpKgkHtU6G7mSdF3Ink7HlfObKwgbQSuQHwR1a54gINsQ5MYH2fa0sWuHmCJF
 ZvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771663726; x=1772268526;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2EY5qpVvBsTDuSWve1J1gQhJ93SfOnHR3h2XpXzEvYk=;
 b=YaWKcVKRpGbNMUtYCwjqNuJSJ/AGr4wEsex8xiadN8piP+c//cy9a0pBhCixhsdIOH
 qBkJ97pvKgJNUW8uu+263O0Cj+ghoMas5XvoBgLrtaAsmo4ytsv2swP3lDlFLX6k2SS5
 cdbfCcpULCHSB5/1X1cwnhS8DUscfrjuR+QPG7KbdrvC25wARzXRdCZuL4JX5pBRJk7u
 CsoSPdsHywTnk2OUB46rsP3JYMk48GUB/1XGATbQeIIxSn3PVve8d5JG+M/H1b+OMxro
 kgiwtNKhbVpnqMMHnXRDsoiQxbNhFurUQBJhcpc1vLVrV9hOO+T3vx7llZrBB4gXvTZJ
 yCUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNaIGi33h00Fscu/p8tDL3Zyafw7Gx8zN7ZIjIYK2lFZG+yY8XBKhrnfEsd1QfcgAJq5mGt1nlNnU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlrHMjUnGRft+u6jxWq9OoVvi3PBOJLDfPajzEZ3MuQXyBk5he
 RQ4RgmwjGpCG/0FbDVt770vTNpZMwEN4k85RJkVb7FzFs1kiCTkRf9mhjHEygcMaBREKvm4l/U5
 gnFkvsZ2crRRVAPeU4dVAmjeRvv0PqJU=
X-Gm-Gg: AZuq6aJeg47iruHmdOcvSh9ezHiwmLLzUZ17gFeBlJn3RahUQbHFNry0ujLjxE7nGrv
 r8HECebb5j+oX2OAPnUuGFI36g78Sk0MSN9Pd0bxPgKvTE+denVQSRmnZLy04s9ss0hXk+CeS9v
 UyDEq+4OxKcFcqQ4cOzNJhlT/WQW1utzwmjdpy2+I9HKYlDywxTdPXbNSbOLDndS6u6qVm9EdsE
 Nix8451vKXHqLTjNSjucxYRYFZ6K3uGL1y/aN19BacKXNYR/daTkos394Z78Fca32WqtWPUP4Ia
 iJYYpUWEUqMlHSfj8IOpJKVU/5iV/Tbc9H74jRY392I4wGdUpGuKcptIs2mSFMQ9xNobdNvkabj
 T3lhXgQ==
X-Received: by 2002:a17:907:3c91:b0:b87:b0ba:5d2d with SMTP id
 a640c23a62f3a-b9081c42436mr136091166b.57.1771663725994; Sat, 21 Feb 2026
 00:48:45 -0800 (PST)
MIME-Version: 1.0
References: <20260221034402.69537-1-rosenp@gmail.com>
 <20260221034402.69537-3-rosenp@gmail.com>
 <2026022148-unsorted-pushover-8262@gregkh>
 <CAKxU2N9dJg9dy05h6oGgWidc81-kdGw=jUuM-i4KL1=EhevrZw@mail.gmail.com>
 <2026022126-chair-spout-641a@gregkh>
In-Reply-To: <2026022126-chair-spout-641a@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Sat, 21 Feb 2026 00:48:34 -0800
X-Gm-Features: AaiRm51RjwwZfhQIEJaLMLmlDT-qI7j28uWxDcE_9CBb9uX55P5V7cGqPAMw40E
Message-ID: <CAKxU2N9Fz7SCHUah3LbWSwyyO61v5iB0A0cPkMBBBZ+pF4gWwA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "drm/amd/pm: Disable SCLK switching on Oland
 with high pixel clocks (v3)"
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Kenneth Feng <kenneth.feng@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 "open list:AMD POWERPLAY AND SWSMU" <amd-gfx@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:stable@vger.kernel.org,m:kenneth.feng@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:Xinhui.Pan@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 31FE416C6E5
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 10:33=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Fri, Feb 20, 2026 at 09:52:29PM -0800, Rosen Penev wrote:
> > On Fri, Feb 20, 2026 at 9:41=E2=80=AFPM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Fri, Feb 20, 2026 at 07:44:02PM -0800, Rosen Penev wrote:
> > > > This reverts commit 0bb91bed82d414447f2e56030d918def6383c026.
> > > >
> > > > This commit breaks stable kernels older than 6.18 that are booted w=
ith
> > > > radeon.si_support=3D0 amdgpu.si_support=3D1 amdgpu.dc=3D1
> > > >
> > > > In 6.17, threre are further commits that are needed to get the DC
> > > > codepath in amdgpu for Southern Islands GPUs working but they seem =
to be
> > > > too much of a hastle to backport cleanly. The simplest solution is =
to
> > > > revert this problematic commit
> > >
> > > Ok, this is better, but still, this only applies to 6.12.y, right?
> > The reverted commit (or rather the one from master) was backported to
> > at least 6.12 and 6.6. I didn't check what other kernels include it.
>
> I see it in the following kernel releases:
>         6.1.156 6.6.112 6.12.53 6.17.3 6.18
>
> All except 6.17.y is currently being supported.
Yes. I complained about 6.17 being broken at the time and luckily the
proper fixes got backported to 6.17. There's no issue there.

Those fixes are too involved to be cleanly backported to older
kernels, hence the revert being needed.

I'll mention 6.1 in v2.
>
> thanks,
>
> greg k-h
