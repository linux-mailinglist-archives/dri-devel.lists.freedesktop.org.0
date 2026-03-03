Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGh/IY3qp2nelgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 09:17:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 085C21FC5EA
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 09:17:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A242E10E152;
	Wed,  4 Mar 2026 08:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a4bO362u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com
 [74.125.224.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09C710E89A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 17:30:17 +0000 (UTC)
Received: by mail-yx1-f46.google.com with SMTP id
 956f58d0204a3-64ca09f2170so6083420d50.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 09:30:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772559016; cv=none;
 d=google.com; s=arc-20240605;
 b=TMViKDEBhzyqWM5tiYYjn57nadkFJtOVazBw4+WNJgD/PDivTTl4SVlc1JdtlbO6EE
 zqFe84fUAma4VFYqJMAbWp2mbbgY7UKH4+2ixLLaaZ7gYtN8O2s+PMIwyV3GF5INjn0A
 t2UUisOUbM3RT+D6Ok+ot5hAIwpth6lU/coFxePSYEdkq1+7Krs9XdZeopIgiZzkxEv4
 y39ZlrOQwGHnjpbPeuubjDhop6hU13TQI07mvgVL7u9IScfEe5kWlswMrV5OfxtMPHi9
 ckP8BR5gtHl2dviP2hhTlsiFTxynwCdpFygEnfaIYvMKiHl4xKBpZ+PhCMAuxCu3BOMS
 pRxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=tBqMqOWB4Kwv1v44saBCX7pvTNjFFYJBPx7AQjJGgzg=;
 fh=fD7T1e4PTQ0HAnSI5INQI21sNdG8eCrOlYbcRnPQRQI=;
 b=eI/vrrczoEBxZi6hlQ42rebmLX5w8PhI5zKfd1LUcerS7hMqSmuRQELw9A6V4A1a1O
 i2/qB3NZoLuuh8oR9/kgpn38AlX7/SMFM86D9Ozn91BnS1F1ywOBAW9hkDdHnq/cp06l
 t4ToO2vOX1vwTkMIuAsJ+dCvhqKtwk+YVGOZNEYWMAD0H1EFsWSIuIMXf60Z3lXsJENm
 ad32WY+eB0tTQQeA5guSyQeDUr74PLVNapqUI9j7QtNyMeBk05iKj1vHeiblj6bWdPxP
 qqURy7//RahJtR5HDrPL2vzyqoa3dqrHodws6a7OnfB7nbBxG44Bs+HTpx0WwcM/AZs4
 PlUg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772559016; x=1773163816; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tBqMqOWB4Kwv1v44saBCX7pvTNjFFYJBPx7AQjJGgzg=;
 b=a4bO362u++c/ZyPre96kIokogBHTwNdttq2He84lTM0SmF0dL3pI6mRHNqIObO3m2t
 j1fIxp4OSA0FoZyRxDPnvMtmW+Xkur7K4fnGUUPyU43TvSIpmWDtiClHi1GcVuROgAMK
 gLjejCBHOb/5vs+Bz/yiLx8zMAijsfFHX7c2Wo1SvcnGZxBE3hr5wdtuCby6DHmnkk5Q
 bVD40zUvyHqNG6DHcL2qNQKfTULbxfMLHBDjCs7muAwjzDaDFdowETrRRYmHy+2aUV79
 vc7PuXZs6GoTQZsIufiR6CiZvnjSPegMLYzx3tnOrNe7Tv2gWLdTN9ZRPva0mK9ZfiIH
 W3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772559016; x=1773163816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tBqMqOWB4Kwv1v44saBCX7pvTNjFFYJBPx7AQjJGgzg=;
 b=Q79P7lwfTYIxALdOUhg5C/kZT1/perVIwKqmT3P0yPhWQoTe6apg6w/M+gfbFljCDT
 7n33PdTw0PywpmN5MqXu3Li+0v+E23Kx84c7MsaML918R/FPypk8a9xfrcohIwcyGy/w
 X9O4anv7GsaGHzLaX/gZGf0bsR0NoW6+/7ZMKAgyzmVndGVo/NsPrAp5W20GLIKAzNl+
 u31kYISyhHIqCDE8JRQciIMMKsJHCaI5Wdbx+wMtoSBnHrY+nteaAG30QcXgxjbT0iPf
 YYKWupF7xD7EAFdD3fCUACYoj0PRgO55/c9jiX1HvO5HPIusp1Fm7X5/DQCo04oHHWW8
 vwNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWib+lm0y0GhRR4CVioTJ9OeIPrML7FSiBG3g1R1dzmwLpIG32mZmrqrbLcx8GKEtESQvN/tqCdlIA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9FibltV6nfK4KGpwkf8a+eKEs9d0Q9EQSvIAgls6nEeB3LyY3
 IxvnwXBe8l0Rnmir5x//yU8rx78KTQBn1k27zlcvUtjd0PowMrDwEqgg8Vyo+U8IAZlzOpWaI04
 /5VeHTLmqAgkYrT0IFzxKHvWfZ7PHoMo=
X-Gm-Gg: ATEYQzxZhxxh7ZvBS7HaYz0RLRDR/MCo6cy3gMm52l4ryUbugEiCglbgiCMYW0In9XU
 W0vutoc+Y6R0UEx9baGEMbE7R1/UhckBMxZu2EDhEcMELXGgUfui4yi/X471S6lX7hRBnkDPXqq
 +cybkV+Q1ykR1r6mr8i3laJ6bOn7PAN8bSuImP7DvALazg31IUoo6PDbyfdoLCrKsZWjvbzVxzk
 6zGZT1oHSFb/VAlfk1PFjiDuLgmUij8p98nd3C1JlJvdMPi5MpBs6FgZV2AWO1urgR92TEsZxVh
 S7c/9QvRftd2Wxvi+V8ye2RCcpmyCZqhqL1qRyMyWLMfVDiRPqTJ/h97SX4=
X-Received: by 2002:a05:690e:444d:b0:64c:ed9e:2e28 with SMTP id
 956f58d0204a3-64ced9e3709mr1676658d50.66.1772559016210; Tue, 03 Mar 2026
 09:30:16 -0800 (PST)
MIME-Version: 1.0
References: <20260301-point-v1-1-21fc5fd98614@gmail.com>
 <e0f687da-7323-40fc-af50-82abea6e25cc@linux.intel.com>
 <3c969254-ed38-4b13-84b3-5afa365b04cb@amd.com>
 <2b75199f-b78a-4915-8e75-5d186f63f7c5@mailbox.org>
 <CAHijbEXkn3+E_u1+aZgLT+pQ_vLYvKKv9VU_5kOuEaFheLRQeg@mail.gmail.com>
 <bc3417d9-d191-4cc7-95e0-968b0b9bec05@linux.intel.com>
 <CAHijbEXTPSLSADqet1=P1FV6jvoa5yGEprOuYtpQWUq_y5uT2A@mail.gmail.com>
 <c5e2cd1d-05a9-489a-be8a-be4d0d583688@mailbox.org>
 <CAHijbEWoQHTyj_V1dD9UWskPmz0WbrVwzPTD3XqJTczy1ojBnQ@mail.gmail.com>
 <d90d6eb3-72bc-4502-934d-f77dac83690d@mailbox.org>
In-Reply-To: <d90d6eb3-72bc-4502-934d-f77dac83690d@mailbox.org>
From: Julian Orth <ju.orth@gmail.com>
Date: Tue, 3 Mar 2026 18:30:05 +0100
X-Gm-Features: AaiRm509zDnpOUQqSmRJWqdOjVIHXq_9v9CJ-qMa7wmxyZYKZVM0c_kciHvjbhw
Message-ID: <CAHijbEXk9q_cF6g=OuPKG-Wd+GLfU6Pu1HU77FpLdV6jfg9MnA@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 04 Mar 2026 08:17:10 +0000
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
X-Rspamd-Queue-Id: 085C21FC5EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:michel.daenzer@mailbox.org,m:maarten.lankhorst@linux.intel.com,m:christian.koenig@amd.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[juorth@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,amd.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[juorth@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid,mailbox.org:email]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 6:18=E2=80=AFPM Michel D=C3=A4nzer <michel.daenzer@m=
ailbox.org> wrote:
>
> I wrote in my first post in this thread that I don't object to your patch=
, so you can relax and stop trying to convince me not to object to it. :)
>
> I'm just pointing out that this is working around broken user-space code,=
 and that there are other similar cases where that kind of broken users-spa=
ce code couldn't be worked around in the kernel, so it's better to also fix=
 the user-space code anyway.

At this point I think we're arguing about "how can ioctls be extended"
and "does userspace have to use memset" in general, not just about
this particular ioctl. You've made the argument that ioctls are not
extensible in general unless userspace uses memset. However, I'm not
yet convinced of this. As you've also said above, drm_ioctl happily
truncates or zero-extends ioctl arguments without returning an error
due to size mismatch. Therefore, the only way for userspace to detect
if the kernel supports the "extended" ioctl is to add a flag so that
the kernel can return an error if it doesn't know the flag. And then
that flag could also be used by the kernel to detect which fields of
the argument are potentially uninitialized.

That is why I asked above if you knew of any other examples where an
ioctl was extended and where memset(0) became effectively required due
to the extension.

>
>
> --
> Earthling Michel D=C3=A4nzer       \        GNOME / Xwayland / Mesa devel=
oper
> https://redhat.com             \               Libre software enthusiast
