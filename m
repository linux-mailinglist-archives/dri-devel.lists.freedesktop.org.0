Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLMmA3Mwg2kwjAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 12:41:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E00E53D1
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 12:41:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CEA10E5D8;
	Wed,  4 Feb 2026 11:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="UP3E6cZR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E503110E5D8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 11:41:34 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-59b834e3d64so7317778e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 03:41:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770205293; cv=none;
 d=google.com; s=arc-20240605;
 b=UGklTPwQDhsCZWcSNUzXgQTDemOFOuXfLwxtVXmL+bPubQrvmEax/kB2yilzORS6HA
 FPBONJiZgFTVXWjtDE02PTn1bukBreOETj0ly860WY9LFE3zv1oel3R9xD8EinX5Ip3H
 FlRxhna4LPb+V64/GavEMWJP5XInpqDe3Bds8SmZSYNhhzo+ObcFSiEar+XcEHwkeeW1
 wnxE2b9MbO4xqHp/wiyAQqz+6kjiOKaffJmKj7c9Nrf/Kj+OlbjZlwj/49gVgILfL071
 XjZ8xL5aVYQ2E7nC4iLLBlA98gJNQ6jFYWquUoD5dfe4Bf8ntTKKbOt7fbrWoMsoNjT/
 ogbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=lp09Jmqhoc1wzHmZdeeGmwVVYZVTm06oQwBdBbqQ934=;
 fh=i/8i9PJeSKUeXTLelkpI7bhs+GUzGVoNqWFjAlEI2IY=;
 b=CyLbALzi30Ual5rBVdgM+LYarNS4OC0aMpL5ZS44xWTPY05L25afvalbq1Xi17uiqY
 c5K6KwTalJubvCdb9gZ9QT5R+9jO9TVMECb/8TjyiLfo2wFMEGtoQUI/wgPVIP+rOW5v
 TuQ9Ye2UTdL1l3w5mxip/tzS9uIRJ+FGaMzI4tBU4mcYQtIOZOxVQ3dOhbNhUZfQQHZk
 6y0f4e3I7yOZdsa3EjjiMvD91TRO3x8s+H5h4BLhyckSBtSxmSjfi6039JBjZ5fldBYW
 QvgKsHUKHdQW+9ZHjUgP8NWSwwu7WMNRapvohVKTyTX5Rt22hb/zqHdBki38SkjOzNBm
 mVZw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770205293; x=1770810093; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lp09Jmqhoc1wzHmZdeeGmwVVYZVTm06oQwBdBbqQ934=;
 b=UP3E6cZR9FP9F+fTdHXlKvFQJDO8imF496axnd748lYFtasHrH3Y+yCTbyaSO1KOag
 TUihUcIImmvmcMUILFuupQWSl6zEKxhh2n+MBhLkRIrHR7YyEjGBIhxJDyJ6HYHXWPQi
 0zJYFY5ospdFQPTedvCToFXMoPZItvHttDoN9XHR3KWme57C6tWfMoYcxXKvni90WiHQ
 o9Y7S5srAS+IAW6+hJ5dmTkpLT7CB/V7yyIqLAkIlcUXIlwDxc4+Xt2ilfPepfgw+krW
 LTsc/nQfezTeU7CrChgy9AKnBTVh0uG0ZSMnPW+SeMmmV8lmG0bXCiLmNb46ML558g6V
 E5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770205293; x=1770810093;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lp09Jmqhoc1wzHmZdeeGmwVVYZVTm06oQwBdBbqQ934=;
 b=NmDUhW0T4v25OZ39rv/rRCl+/aFNblI9bz3xCZVT3z5P1YmXEOzh1lbBNwnjGUmeHo
 WqFqFfmlexA8BzxdKx3s3xKVXr+1J+909Cp98HZXCXohn6n9k07b89t8sYi133oZSGlA
 2YKbUl9cTWCe9uARrw6Cnp8asDZ+UWtwZObYqgfOHTG5IygiiZHAXePw1fUpU5Nbd9jE
 IPvJ2b8kITAMxKmIo8UqakNdCY9Nmi3ewVvMVREl5hxGVoL92fdbcPUGZXuxGlfXknJc
 i8TYy+hCSDqf3zggq9b3kXV3YnOYCHqKc9mJXIuzJ2JjEFTwmlWreF2H9RK6i/G9tH4u
 1juw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu9w/0aYHFktALkTqpCH49/HltEBySa55UvuAQqChGbt1M6fNxKExFNx8bTFuAKQyP8hB2G51uBq4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4GFXB8Rz83LCWPiGXukV/mLOHdDKy48ZcWcd/CP/+1h8u14Ou
 pitqno5Piyxz/7F8/qatBYYoDEu6oI5zyX1cKukfBT2/TWIbDO/klmQuCMUMXTPsbDw4iE/3QX7
 Z2tJ1Dl2g3D0PW0v3OIOae2PaYYq9AiyLnHxV2iMmoA==
X-Gm-Gg: AZuq6aKSo4MxIpyzvTSqBLzDjt8OyOARg+QggPvObdYNeIWV3fr5dpLx8iWvEfPexov
 azykBY+rShLWPU27HCQQIgVsC7bEPwiU7fQCOaq0JK//TFgttsUTjrmOoHEaGtLi6IIZLJkp91N
 juPKcFoIa6ANxRWeaJDnX6NSEJ3nikRFMIo+FlQkeXAR/AE8zZqsF4UMfKOc6V9EzwlQSZCZbQm
 2X+oogjKT2XdYRZol18gO0x0v00gqspfF4nyptTB/8dX6VMGOCbO/vqjKBxZi09o1AjDiRX8gGd
 eBUCRRzugskoJwxu8kdzCkY/j7JP
X-Received: by 2002:ac2:4e16:0:b0:59d:e33b:6cab with SMTP id
 2adb3069b0e04-59e38c0256dmr887655e87.8.1770205293161; Wed, 04 Feb 2026
 03:41:33 -0800 (PST)
MIME-Version: 1.0
References: <20251105101134.82064-1-marco.crivellari@suse.com>
In-Reply-To: <20251105101134.82064-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 4 Feb 2026 12:41:22 +0100
X-Gm-Features: AZwV_QirxWn3kyl8yk4K-Po6pCojxSr2h_IVrPDp-Bg6UEwDZdu74TLfE9tRjEc
Message-ID: <CAAofZF4MWJ98s+RJOcnt4PaWGbMeZj7jtH9oCJiH8zn0EaxrZA@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: hdmi: replace use of system_wq with
 system_percpu_wq
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:frederic@kernel.org,m:bigeasy@linutronix.de,m:mhocko@suse.com,m:mripard@kernel.org,m:dave.stevenson@raspberrypi.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,raspberrypi.com,linux.intel.com,suse.de,ffwll.ch];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,suse.com:email,suse.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 60E00E53D1
X-Rspamd-Action: no action

On Wed, Nov 5, 2025 at 11:11=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
