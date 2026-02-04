Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJ4sEuswg2kwjAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 12:43:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C49E53F6
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 12:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A49E10E5DB;
	Wed,  4 Feb 2026 11:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="HqNzEpXx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DB210E5E1
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 11:43:35 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-59e2cb21520so3331764e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 03:43:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770205413; cv=none;
 d=google.com; s=arc-20240605;
 b=RkY/73XHH7sURXZpbypnfMJZaKx5BCRjIHkElYZ651z9M2wGnSRJXHTSlBIxlbXW9L
 PDM9TVMpSFLngtKcBEBZnSmcY7cG05g58PPUvFXhw4DI3OW0EVhH38Xd3X7Q4sO04T6S
 DHYvjN1VGsfcKQ2tZoR6lDqVRmEKin96bZvlhAkNxDXehsPPlgCltbYJ4kgDHfFigXu5
 vmGAwvMzx4an1NnnoKHipxska6Cs41wRikFKL1KS83NLpwiZXCqQQ1xFff5lFiBq6Gsz
 9lvMTzLC9wTXkPxQn+0ypCGIWUo3v+OcZLFLmTjtuHq4DjU5kvTmVfwU7q2iR3WR0IZA
 mDSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=o70mA6mzI46usIispa3xJ3u50KpGuilI2ZmshcatxII=;
 fh=ex69a3HS91F0Of2rnq3Vz3IsPph4V9in15zUHzD81cs=;
 b=PhBn9Fu0tZoEFn8PW5RCtYrl3Trq0njC5aLEmD0/9m8pTl5Fv775GBuZfqaun/KD9g
 BdUsIjz+Yt2vE4oAIgS6NiLa2lCo5iWsf23kDKlFblyMq1LopPYe9ZHR+YfYkSOXkVKn
 GqAN5LmPH+wnMMw4s+QFfo8FVlQ9K5aSh/oN7ikZY/yvIrzmvq3IM6js3bgQ8/Zy3DZM
 9psr0h0prNoCmEw7b1004OMu6AhOVtmDc4QJLNN+Ifpfk3VSBfxC6g5r/oBygh8oatwn
 PDHbjihoJUQplQEvmOMRaxi5XqrW15p1iwWSV9wVracc9F36V1tNr2rivZxfBvqmmOxy
 FCOA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770205413; x=1770810213; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o70mA6mzI46usIispa3xJ3u50KpGuilI2ZmshcatxII=;
 b=HqNzEpXx07MgjJViLJUOv5Nr5AmJ2CeGFUVEOW7aW2D8UqhKEW+hnk8z5+QeegmhDy
 SNFWI9bqdtL+0l/doA4TGVRHzu5GFFrSW7yeg1lJzEg624v7wzSKqIZndCV4/2PNqv4w
 VyjO1lUUwXJzL+SFl1Q08W2fjetCkMme5bhnoLQvGWwE57ZuaS97XsIwmz/sK/yyeUYv
 6BIaN7t7XPgUuRMnlrztBLne3/td8onLM1kZhi0leC4hcWT133Fbt5SOmZ3kPUuu/k0m
 jUp/8LemQQIiYiZydonhhXmBcsp5vmYqDrfDsVRGOPZfliMJaHQliAhDw00tYssAEEqR
 pmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770205413; x=1770810213;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=o70mA6mzI46usIispa3xJ3u50KpGuilI2ZmshcatxII=;
 b=vgk7OWtygkTewvPkh3R9Vab01JskMe32qbeq2PwH1cDEsi2ERFJAl/iByjYXjNJbVW
 Ljtaxqu+6HC0/yWhZw58h9RP29MMqSISOE8mF36vcYF+21N+vUVCkbtKE0Mw7cX7DPgm
 aHU4MX8hSvvtsSBqRH4qFsKauOzgb8cQEMB1KLRr/K+dODs2O9wHzSDx+A2gUUlSMjHD
 htEqbzdXrDblinzEnRNQg+bbMlmBprl+suLBltgKWmmkbNLc561D9mG3deCN+lzoEhum
 mdlDMiCncGWU1pgGgbFaheLDPUubYbtifjQ0xefvPIeDIjph0skziALJsyDXUwqpuIvF
 dG/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcBiziAQLhBob3jSgxbzcYTqTTflgjEqzz6N+Myi06vyC8IYEWLGi2SzDPf98cluF9lY2C0/WmSmc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkjmW3p3VAM1RkarehD/SqH+a1Zbu/4u2OXXjRel06o/r/kNeO
 aaBBG/lzqBTweDEetWfa99uNtYnT9uAGrjS9x04t/+YbwZj6K/D3noSUfrZPwt5yiP3RNF5JIKW
 zM9G8x85Tlm4TUtbh4yMurpRooM65tl4Tw9y3CTmKrQ==
X-Gm-Gg: AZuq6aIplDkZlmeVJrDp7OyxO6OfPuxR8YRbDwIMWPKXZ/kT9GzvbY+Z2MC6SH4WOGh
 n/5HAq6Cg8zTZMK0Pn32x/o6gMGj87gS0a/09nAHs7p6gFtfTb/RiPl9abERNv0X5vftVIGaPU/
 jB+hIxTkgzFtXQZChIr8vC9QUwE9BkVhlLDNyUgj0iaYpPJAFMzdKsNEid8EJc2KEYrAkOQUJIG
 QgoCz2y2bAo8ez4u9u9jLEhAHStnLdVsoL1NGgjCOQOwhnHS/pQFo4VZiGrGkW7zkxq+qMNwa7/
 ud9wd6Iba72yRHV4cgW13OulmmcR
X-Received: by 2002:a05:6512:ac1:b0:59e:1930:d92a with SMTP id
 2adb3069b0e04-59e38c07036mr1021122e87.12.1770205413409; Wed, 04 Feb 2026
 03:43:33 -0800 (PST)
MIME-Version: 1.0
References: <20251104165731.315074-1-marco.crivellari@suse.com>
In-Reply-To: <20251104165731.315074-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 4 Feb 2026 12:43:22 +0100
X-Gm-Features: AZwV_QgysUMoylTTMvaxI6tB9xn4CL-9t81P9Et_ChYZYUuSGk_E38mN9lu2Jzs
Message-ID: <CAAofZF7S+Pqip-Ewn4wA5p8bVBwERpegHWmObpc7+LoPt7OKAA@mail.gmail.com>
Subject: Re: [PATCH] drm/tilcdc: replace use of system_wq with system_percpu_wq
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
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
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:frederic@kernel.org,m:bigeasy@linutronix.de,m:mhocko@suse.com,m:jyri.sarha@iki.fi,m:maarten.lankhorst@linux.intel.com,m:tomi.valkeinen@ideasonboard.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,iki.fi,linux.intel.com,ideasonboard.com,suse.de,ffwll.ch];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A1C49E53F6
X-Rspamd-Action: no action

On Tue, Nov 4, 2025 at 5:57=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
