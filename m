Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0K6MJqmrb2mhEwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:22:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5AB475B1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C91B10E133;
	Tue, 20 Jan 2026 11:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=fooishbar.org header.i=@fooishbar.org header.b="NaJRCerM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5A610E5BF
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 11:23:15 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-8c531473fdcso706257285a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 03:23:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768908194; cv=none;
 d=google.com; s=arc-20240605;
 b=P78XGJ3OAWBD9rs0UMJtHBvPemqk5YrKexJk4fSIiMxui5Z4WLtXyeES7lh9k49P7q
 l1lQObFN7fpwk5AORqjCg9JBOVSutgTsj6keM8iVSOpmXvDlQzB5GJ7tnJ+WJPEbbk6F
 P4XgvGk5RqQM2LvMjOwR0zue1OD06n7C8oKPS9N11G6PEFkm6DKnFAwepBNhftewoo5Z
 DDlROUMyHkcz4uNcpvPXe5KFvr25PRpZKCBhe/3TmcwqebSBaTGDfQCcNVMwasxBfTSV
 wDVNkiC8V4M2nvyhSSlesW9Vjj4E4dN0lROD5YiNhJa0AnHWrvwoGrWtsoexj/3bBIX3
 sxwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=aHJ4AV07cg+NHi3MzSiAdSIIdl4XbTkYKA+Ccgm1HOA=;
 fh=RJxJwq+9S32rfXZVSZno/jwkGF90btt5FG4ZXqDdRhY=;
 b=jQstyGt4pakFq6DyZsVMyJg+2i2wfls6BJQJqbdntIdUhGPlX5qDTtWV3YuT7r8ccn
 WAhceIg/ZyPajb7KDJqtf2Bbd0Sy/7Vit1whtxXQaUFqit7VAIzkzZznhg0Y7qtHJKc9
 65jWi2gXLICSnHzeG8LnNJXw+CTt9bU0OR0QDlHlu6vRuoAf0enWoyIy2fF7MxVub1U6
 kxCVpeL7Q+OmsdCOPPqhIXV7EZyiwzKiFZe9PXfNVCMuhQ6r45qRSBnJz3ZBdxcW7MtS
 LCum+vuHxQYgbJluA1kFo0E0DnNNQm+aPvgBfzCVtW0M8NxGQmCmqBiK3qZKg7wWJzdu
 Z5jg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1768908194; x=1769512994;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aHJ4AV07cg+NHi3MzSiAdSIIdl4XbTkYKA+Ccgm1HOA=;
 b=NaJRCerM9kbdQtgzcJiFrTuP0lu3mmmRsX+74MVuVWFBj2CKiw4C1yZpoCN2CC3b+W
 SoSAlLGoCZuGwCpaeay4MbaofHXk6wsu/7BEICgJz0ZLQEVuycNi8DarUizgLT0OIac9
 FUuIZeFC3tjFFuVh3+YIQ4kT75I1dHX4KzFNrYsLKNxNjswck3MRy5q5x6dS0RURRL9P
 lfREiihPd5bXfpChNq8FMQklM+mi9gEX55807AfGSAZ1nM/fDZGPU2rzQ4qfod8oF/iH
 CNuwrpFPXe5j7WkhLE4/ZqzzFylD2dEe+kmavTMlmmPDaDwgY8+lFOtOD+QoH7nh5OHM
 PcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768908194; x=1769512994;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aHJ4AV07cg+NHi3MzSiAdSIIdl4XbTkYKA+Ccgm1HOA=;
 b=b+Ss0fvbvbFq9T4oinIcQQKEstKx52AcZELIRXqPOWJFPC7/xqL8R4S6xvot+DtQ7x
 H9CzpKOYvP2BXZ8TUGQu3rLECd4Bcszm7XAw2DiMzHWfm5Igo3zZz3hsxO/M/wk19baz
 U6BrQVwmeHvw/utvBc05JJE42Rz6saJnNgoHYVIRoM861Z2LqloB80L639jZOCulqxf8
 lBw7xgJ/MqONJK/gvgkUkfkAoqPA1hr0WsE/DzKcZR2dDgYPWp0LYqEvFnmCHrDgjpiF
 L7wMkMcM4L+zVhPVsKn2+7tEEeCiFGu6sSNqizIP0DqS+DYYaCFr9POoC0exmOFrOmI0
 wzMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvZwHKq4el13z7FkZ7a6k3PmcdKL0KxFrfOG7vq8q6Dc5Vx3e3rKXkLyAYXnQ2CKgsTjX6VoAPfYU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9AYA8vKuPp5s2hOa4WWNXKDxJtRNnoW7+I3U27TakrGS/TEVe
 PzErUkbZ3bRXfpNxjKw1j59hSVnZAVM7uyIrQCkwn9sj7FRvfJpoKqqwSfl8n2OjojrMzzAdw8p
 dt+CWXAsUlbm4yIiKwHd/iA6sx1dsii1Z8m9kK58gdg==
X-Gm-Gg: AY/fxX7YoaHWCO2YkhxEVMO3+iGiqjTY8dzuA5ndFyB/w2eUCXfRHAB29GMP//lqsp6
 e3hyVeM8sshhYNGVNGn6HqAOlffjCmb5p5oyoBAKG74/DKxAW9ZYOe15elFZ7vFRWaCFUFo/AbE
 eha/O+rxJadWPgPd6XN1AYC42qxA2GPTro9xY3bO0re9ltnlkHDWW10heuLL7ZAsAklSchcDQay
 oCBreMsctzuutt+MwTs672Z5GNTToSoKhq7ifvlmK+FYy14jhvpAH/S0a2tBpWNaCtH
X-Received: by 2002:ac8:57d2:0:b0:4f1:e988:d786 with SMTP id
 d75a77b69052e-502a1fac726mr188065721cf.80.1768908194161; Tue, 20 Jan 2026
 03:23:14 -0800 (PST)
MIME-Version: 1.0
References: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
 <20260119011146.62302-16-tomasz.pakula.oficjalny@gmail.com>
 <82645a06-2d15-48fe-a250-56d736d636da@mailbox.org>
In-Reply-To: <82645a06-2d15-48fe-a250-56d736d636da@mailbox.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Jan 2026 11:23:02 +0000
X-Gm-Features: AZwV_QifkBpxkkL5Tc3nuCYS_D5SLTGXmOunBIV70V1xvj5YWx3lMpqA4g9a_Xw
Message-ID: <CAPj87rPyt2+cWjM7KmpRzY4sBgaUzZBOS3FJoxF+PjkijapTag@mail.gmail.com>
Subject: Re: [PATCH 15/17] drm/amd/display: Trigger ALLM if it's available
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>, 
 alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, bernhard.berger@gmail.com
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[fooishbar.org:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[fooishbar.org];
	FORGED_RECIPIENTS(0.00)[m:michel.daenzer@mailbox.org,m:tomasz.pakula.oficjalny@gmail.com,m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:bernhard.berger@gmail.com,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel@fooishbar.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[fooishbar.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@fooishbar.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,amd.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fooishbar.org:dkim,mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mailbox.org:email]
X-Rspamd-Queue-Id: 1B5AB475B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Tue, 20 Jan 2026 at 10:33, Michel D=C3=A4nzer <michel.daenzer@mailbox.or=
g> wrote:
> On 1/19/26 02:11, Tomasz Paku=C5=82a wrote:
> > [Why]
> > ALLM automatically puts TVs into low latency modes (gaming modes) which
> > we basically always want for PC use, be it gaming, or using precise
> > inputs like mice and keyboards.
>
> How about e.g. video playback though?
>
> It might make sense to let the Wayland compositor control this, e.g. via =
the Wayland content type hint protocol.

Yes, I think this should be a connector property. We'll happily
implement support for Weston as the uAPI vehicle.

Cheers,
Daniel
