Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNucL+0+i2mfRwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 15:21:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE2411BD54
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 15:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386AB10E59A;
	Tue, 10 Feb 2026 14:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="QiSfZCU5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9C510E59A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 14:21:30 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-59e4989dacdso3511713e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 06:21:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770733288; cv=none;
 d=google.com; s=arc-20240605;
 b=B8NgEo+D93dtgswuVw0uxQyzcAKlM8uTTiT/nuvWFp3qksJc/7dcuGZvQpF1gkwKlA
 QncdIuFhGnJ1kXy461wMDATPfzEJVIUM6emFroXzof4tGx60aczMEIL65jytIsFv006z
 bEshSv32Z8R2uXbtsTmytPHdZGIi9MtHvB3LCWpxgkmLKDKHnK3IVBWn3241auzrZxNY
 DG7cvGqIItTxPVoJnYGtII/Ms+vh7qY228P0bQje9+hvxvoqSPPDfXz+7eBw6bAKSIhu
 MkKb9S1W/QsbODekVC5t6bErNL/FJ/BLht6ao8CJTqQH8aIMe9RE2BpwhP3m3fxliw3q
 88ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=a+wYtYkuvYSpiBdy9qM8WPe57Dnide31Iur6hM2/5e8=;
 fh=Ka7WjLRDyF4ZDiZeenmFgkU08HV6rIOV8EF1B0HLNC0=;
 b=XD5tlhPyUtYaeyn+8JBSnnreQT/MpJaj55CBhvKxYuakkK+IzJ3/MeTD5RBuSWfWVG
 8uHpBJ6ubSyJWf+ar9y2iLAC7rHOJ24EDt/oMklfZVz/2j+6DqrSl9ulXXEEpcZ8Ht6R
 tPiI4gtxVN/v6DMBOeaIoEI2ZqymoQrqbicJqwh4m5BxLxJ4QhkjjVRAps7IUpHuhz2P
 BOJBCtdplYQqcCsqf58CW3AejXqi/KEasnX1ZM34PjSfOPpskQ/nstKOQp1mOJwxNmdk
 MghzqSFfmKZZgwjAE5w2J5VFUSB9sLRg38bbCkzxDRv1u28iBdx2baEGR9KUFsspdd7u
 9fvg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770733288; x=1771338088; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a+wYtYkuvYSpiBdy9qM8WPe57Dnide31Iur6hM2/5e8=;
 b=QiSfZCU5uaQOBmpA1rta/xlkSlM1cnpKK7E4D65IrK/v22Ga7oCphEDv3BmHoPZGl0
 ECzyTSD3cmAQluIqeTCHR4VzgQqmK6ejXHbUo4dfBiuwXV2gyg3jPhf8/fjcR++NADGA
 h3dubQEVRz+aK51Fto8zaDIDT0Ds72JEBKXfGbeQcM2RBmCpCpnjnh4yOdIUPzLQACgP
 MqVdrU6L2Fu8Eb+1Jjj2+Uz253XxBeBmxh9afpoQDMBAkXX8fkKtmD8VlzLekTipwI3P
 J7UadQphCK8UMvZkX8L23QfNOUaBRRzSLkyJLyX7HrkDI9vxD2AtECq5J0BdZZAs1GVP
 SlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770733288; x=1771338088;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a+wYtYkuvYSpiBdy9qM8WPe57Dnide31Iur6hM2/5e8=;
 b=svGy54Q2yj+LGH5V9yHd1jcNBwenVzPr1RZLSjv6rabtxAxqBir0e+0CDOQKt/SD/q
 o42V5H+ZPRkycQyVv5212lbFYjSPsCDC8ZeY3cViDFlDPHJ4j4I7FuVuB4QDt2n9TbW2
 G79/KFJsXflNaL9EwBESYrYP/QBDKANnGhyLIWjE4ONnJwJ5ezIkXVKNf0uMh0NNqJxT
 +W38/6FmPX860BnT7vnQoLAvfVVrVr5BKrityFcSXGf5hp21Ou6jmHu1t+0VoXkdHNga
 haWCadyCNk08OEqK8t+3UxJeRk5FRhyyHE6OCfCcKP2/PeSJqR9Kk9g1AgUG6BGq3cpo
 5r6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVri3SLCOa9TBHfpi1rw8MJ7qwPq+Xxgrvw5SXGy8hANthIClA00WcaCQx3rTPYcXQ5PjtPoCsvpIw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0XNNQKcFn3cpun5XmrIebB2mtF6o+dtgglEXTJw2PSNobU9wN
 5YUHiF1hCPHuyBLpxAvrxCdm5n2k1/lfPwBufNmfFrojBQtiUlmqSJJenngtVjLfHmKoi6qSE2o
 B5Qkgskw1qfX4jGhQCyui7tzEBnehHzMjSczzIY2dsQ==
X-Gm-Gg: AZuq6aLnLs166apQGzUzJ07BaeTIVwzsKR6Mp7nmgyqMbdt8Tr1mZhpMhnfE3slbXHl
 aISMqE87Tr60nip6I7YUlo35pDF9qNrYY/bpY/bTBtkKvkf6av/tKSgiSY2CAedFp87jo430YvR
 5LD+6qF8COjl1Ztx85U2yo0AzZCKHAt0L/3N6Ixo5zxEsbIH3JWmlZsI56QXK6u1NXFhI2gn7zj
 4f/F4QGf3xRGSx8sktTc1Kb18UxTg/ssMjMvgJIFI1IfcqIdw8Z4YBfYyM+doYltytcI7K7Dd8G
 ATAZ455WxaRKTRMqsefjJR/0HUHaC8nE/S1DurMg6ir8IyOu8L8=
X-Received: by 2002:a05:6512:31d2:b0:59e:38ba:1821 with SMTP id
 2adb3069b0e04-59e55bf57b8mr844996e87.48.1770733288381; Tue, 10 Feb 2026
 06:21:28 -0800 (PST)
MIME-Version: 1.0
References: <20251105101134.82064-1-marco.crivellari@suse.com>
 <7bfb8769-6987-49bb-b56c-b840697966a8@igalia.com>
In-Reply-To: <7bfb8769-6987-49bb-b56c-b840697966a8@igalia.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 10 Feb 2026 15:21:17 +0100
X-Gm-Features: AZwV_Qi-4PhRJIcXomE4i5EfClLUg6dh5n3pCTIcZUZTrgXS-5dPV_yOMPQ0l5M
Message-ID: <CAAofZF7PM0kxuw_sTJ09-iATjK74+7ejjWpQXELKUcfmZbZ2BQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: hdmi: replace use of system_wq with
 system_percpu_wq
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
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
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:linux-kernel@vger.kernel.org,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:frederic@kernel.org,m:bigeasy@linutronix.de,m:mhocko@suse.com,m:mripard@kernel.org,m:dave.stevenson@raspberrypi.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,gmail.com,linutronix.de,suse.com,raspberrypi.com,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.com:dkim]
X-Rspamd-Queue-Id: 1EE2411BD54
X-Rspamd-Action: no action

On Sat, Feb 7, 2026 at 9:44=E2=80=AFPM Ma=C3=ADra Canal <mcanal@igalia.com>=
 wrote:
> Reviewed-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>
> Will this patch go through DRM trees? If so, let me know and I can push
> it to drm-misc-next.

Hi Ma=C3=ADra,

Yes please.

Thank you!



--=20

Marco Crivellari

L3 Support Engineer
