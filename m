Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJE1OXtEqGlOrwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 15:40:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71805201C13
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 15:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06ABD10EA1D;
	Wed,  4 Mar 2026 14:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M637vbAj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com
 [74.125.224.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE0810EA05
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 14:36:00 +0000 (UTC)
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-64ae222d87dso6312139d50.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 06:36:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772634959; cv=none;
 d=google.com; s=arc-20240605;
 b=jm9PvJxAezZpHLlxlNkh/2bRe7Fp/OcfZAD9bCADj5HOfxSK2QeuKFoikMrCFjJubV
 /BVmnUge0AiphfiY4bLxT5TkiroB+Y1cwiOZTSIrc7HPNniNaGs/qoh+9CydsWupzj1l
 8ICSjnFAkb+UJXwt7p6/ru2vIYpWX9hBcXN6fCHqECwXHG+czUDHuq23BN4zKYm049Qq
 A36zWrtlXoQnWXLhMiVfxFWG+ifW+X1mBp+9lrOkb13kDDmjs7LC2HoZIO9EspRq4l2m
 CHx/mcmt6jZxx31/S0G+KcfAw7rczGzSdkjK+loVRzOKSUaLJNzBQsK5i88reIyFIKsB
 Pnig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=HPekhOniE8cwd2pMy8xyd42/K20B+U7H/0Z7H/Qqqcs=;
 fh=WmUMdcdWLQl3Ad3+W9MtYov46OJ2GrWZ6Rkt/43dDoM=;
 b=MDVI+9FPLr2NCMR4kG0v+PZ7VnG7rMeHeTad21FWuTk/d8nUlWkbfoVGbIvjkopvvx
 ymooVP6tBBjZqbbxsVWBgWap3y2WXHeW355Br7x6FhfdZeNx6TBj6sxa2HW+hp8ig2y9
 56b4/3vX/aIYc6YaYSZ4zSmB3YP5j/mpaSpnd+xumr24Xkbd3/Zsu26ECFDTn4QJ1SOk
 yys6YndTon+JgubE3hAmqoar6t8P6rkUPCdCg/xeA2cI5tgkuFbi+KoDLf3BkJDu9R4i
 pSYNgudFldGi6Y/OvyPP7sulHTdUGMt/wGVoYOFxPSEQIRSnnHofixWX4EVODjObJe2O
 RZ0w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772634959; x=1773239759; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HPekhOniE8cwd2pMy8xyd42/K20B+U7H/0Z7H/Qqqcs=;
 b=M637vbAjqRL6A0khKqPjHUxrQmlP3t74kfaTt79zRR/iP41qzFpriGVqK0zvlBpuCb
 m8/MJjhjSIQl1O/PjX5M1eJaoCeneFP7UV6rCLvTEZG7HbbU0yXlFkd1QgIF0bLRNibl
 nr7GsepStWy3+S3PxqJagllXk1XlLli7IYjYzdEH2DRQLzG13tPCbRAvwlaNO05P+aqX
 cO5wnHSZlGq/2CJ6MUQa0aNwgEFkde6hlZLGeDz/mM7Vb48N+toNltq78xn4meKYgXBt
 HI+xOIhlwrVTvKdGsA5xPgtIEZ32u4X00WBYvziPgTPVn3MvfQLVZpS1JeHVrUUApF46
 J6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772634959; x=1773239759;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HPekhOniE8cwd2pMy8xyd42/K20B+U7H/0Z7H/Qqqcs=;
 b=mwIcZZT+wPr5XnuPfBGYVtKP22yzagweD8gK9yOEcxujoKU5sl9lHaO/oQIbH/po0r
 Qk5qJ+tRNEVoCivD9p5w5rcZZNl4B5r8CJalKfn61ZiQCBzYjVDrBlZCTb95eE+dHgCL
 hxhWs0iWwM5VU1fGmZUitpygi1EQvWX7VIDDd/+d3xA8rzj4+LU/zbocLrzRFQ/hc96H
 SWClDTEKU2QY+knI/ZHzqvoxO+ptKfZ6VxbCeZtrBtKLEMazupgxbStkHq+VaUv3IUWs
 /Dd9ab5gZOWRkJkvzQr1Mw9j7kA5s4VNy8b3Xsos2kPSN04g6tblubSIxJiWtF+MC3FL
 Ci1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX24N8kiUT52RY7XbeOkqolOdVOSrS58ytplyuy3Vn0/YcVT+7RKQ9prVx2bXx3R2C7403rN9yhdpo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIKLUZ1+r/xxq+T4Fnkd+K+NdFCe+uAR9Eclka6KqWAN7rB+e9
 yQu0ZP++XyItcWVkPdWbdi9LuiwCkOpdzWhDH97O0FZ8afA4CMiIuVhgFQsk+8jCAoR03vMf5Tp
 c/KuTMYS7lHmUWf/OyPxglHizyHxKA7I=
X-Gm-Gg: ATEYQzynGc7TMqf65XdCsKJKtThBqCLsqPWttyL+IW2PZ7O+8PVOEcQKxyiEDhVY9BU
 qAp4X79VK1JZaHs5Ah9435PbvIIHcbF42XO+tYsrio93rahtUQmcjjXgML/EFjXQL3aE+VoTK6e
 J9TQnl6mKE3JnilfKFcHCI0GnkOF+nsHdle9dJnSIHe0GPpa5jg9gqIi/KN9mzmSDT/TVJpuKvb
 QKgH0pqH9jSrZ1sqNHKcli1WYr+6785mBAVbQCLl+QqE1mX97BPQUW4VTbWsoOcjasa/uCtIoL0
 VXwozTDIHbzTXx4EOCGQGaEE1SM6LgK8RYT7Wege0vnusdurcFm8Dl4MguY=
X-Received: by 2002:a05:690e:689:b0:64a:d80f:5c8 with SMTP id
 956f58d0204a3-64cf9b70f74mr1396869d50.21.1772634959060; Wed, 04 Mar 2026
 06:35:59 -0800 (PST)
MIME-Version: 1.0
References: <20260301-point-v1-1-21fc5fd98614@gmail.com>
 <2b75199f-b78a-4915-8e75-5d186f63f7c5@mailbox.org>
 <CAHijbEXkn3+E_u1+aZgLT+pQ_vLYvKKv9VU_5kOuEaFheLRQeg@mail.gmail.com>
 <bc3417d9-d191-4cc7-95e0-968b0b9bec05@linux.intel.com>
 <CAHijbEXTPSLSADqet1=P1FV6jvoa5yGEprOuYtpQWUq_y5uT2A@mail.gmail.com>
 <c5e2cd1d-05a9-489a-be8a-be4d0d583688@mailbox.org>
 <CAHijbEWoQHTyj_V1dD9UWskPmz0WbrVwzPTD3XqJTczy1ojBnQ@mail.gmail.com>
 <d90d6eb3-72bc-4502-934d-f77dac83690d@mailbox.org>
 <CAHijbEXk9q_cF6g=OuPKG-Wd+GLfU6Pu1HU77FpLdV6jfg9MnA@mail.gmail.com>
 <daaa5465-c086-47b9-be7b-13f5d62292ac@linux.intel.com>
 <5464a6fa-5a49-42f5-a1ea-ce9f18a6955e@mailbox.org>
 <CAHijbEXaxLU7sbCyJr1X8B_PoPdM2q19+JuF+huLQqFoLYP8kw@mail.gmail.com>
 <59bd46c0-03d9-4fef-a4fd-14b8f68f9860@mailbox.org>
 <CAHijbEUSFA3ptTNZ_YuOLgc44Px4CjAaa9x6DDjJktRCKjj+Dw@mail.gmail.com>
 <0847752c-39cb-4233-8e07-8e1325c196cc@mailbox.org>
 <CAHijbEX6nqnKOSQs7=UgwVZWDwQ71ZtSjhoDoo5YCvT2_rJ93w@mail.gmail.com>
 <07e4a878-199d-4f6a-a36c-95b3e168354a@mailbox.org>
In-Reply-To: <07e4a878-199d-4f6a-a36c-95b3e168354a@mailbox.org>
From: Julian Orth <ju.orth@gmail.com>
Date: Wed, 4 Mar 2026 15:35:48 +0100
X-Gm-Features: AaiRm53vP92MJ8eAyNa4_RUOPmzxhBPUub3yU9Z_rqw9dQPVWf6dFI-tAKHGbo4
Message-ID: <CAHijbEUQ-DKcrtJM_N=JxR3c3JgR1y+qt76W4PETFGZVdLN6-A@mail.gmail.com>
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
X-Mailman-Approved-At: Wed, 04 Mar 2026 14:40:56 +0000
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
X-Rspamd-Queue-Id: 71805201C13
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mailbox.org:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 3:30=E2=80=AFPM Michel D=C3=A4nzer <michel.daenzer@m=
ailbox.org> wrote:
>
> On 3/4/26 13:32, Julian Orth wrote:
> > On Wed, Mar 4, 2026 at 12:47=E2=80=AFPM Michel D=C3=A4nzer
> > <michel.daenzer@mailbox.org> wrote:
> >> On 3/4/26 12:25, Julian Orth wrote:
> >>> On Wed, Mar 4, 2026 at 12:15=E2=80=AFPM Michel D=C3=A4nzer
> >>> <michel.daenzer@mailbox.org> wrote:
> >>>> On 3/3/26 20:12, Julian Orth wrote:
> >>>>> On Tue, Mar 3, 2026 at 7:53=E2=80=AFPM Michel D=C3=A4nzer <michel.d=
aenzer@mailbox.org> wrote:
> >>>>>> On 3/3/26 18:44, Maarten Lankhorst wrote:
> >>>>>>>
> >>>>>>> You don't even need to use memset, this would work too:
> >>>>>>>
> >>>>>>> struct drm_syncobj_handle args =3D {
> >>>>>>>       .flags =3D 0
> >>>>>>> };
> >>>>>>
> >>>>>> TL;DR: This method isn't 100% safe either.
> >>>>>>
> >>>>>> It won't initialize any padding which isn't covered by any struct =
field. We try to avoid that and have explicit padding fields instead, mista=
kes may happen though, and in theory such padding could later be used for a=
 new field.
> >>>>>
> >>>>> I don't think this is workable.
> >>>>
> >>>> libdrm begs to differ. It shows that it's not only workable but real=
ly easy. There's no reason for doing it any other way.
> >>>
> >>> Using memset to initialize padding bytes between fields is workable.
> >>> Having the kernel add checks for this for existing ioctls is not
> >>> workable because it would break usespace that doesn't do this.
> >>
> >> As discussed in this thread, memset is also required for when the size=
 of an ioctl struct is extended, even if there is no such padding.
> >
> > That is not a concern in rust code. If the rust code extends the
> > definition of the struct, all call sites will cause a compilation
> > error until the new field is also initialized.
> >
> > The issue I'm talking about here is strictly about padding bytes betwee=
n fields.
>
> So this is not related to the issue which motivated your patch?

I don't believe the ioctls in question contain padding bytes on any
architecture. This thread is in response to your statement above:

>>>>>>> struct drm_syncobj_handle args =3D {
>>>>>>>       .flags =3D 0
>>>>>>> };
>>>>>>
>>>>>> TL;DR: This method isn't 100% safe either.
>>>>>>
>>>>>> It won't initialize any padding which isn't covered by any struct fi=
eld. We try to avoid that and have explicit padding fields instead, mistake=
s may happen though, and in theory such padding could later be used for a n=
ew field.

----

>
>
> >>> Which is every rust program out there as far as I can tell.
> >>
> >> That's surprising. Surely there must be some unsafe code involved whic=
h allows uninitialized memory to be passed to ioctl()?
> >
> > The memory is not uninitialized from the perspective of the rust
> > language since all fields are initialized. Only the padding bytes are
> > uninitialized and they cannot be accessed in safe rust, therefore no
> > unsafe is required.
> >
> > I've never seen any rust code that uses memset to initialize ioctl
> > arguments. It assumes that the ioctl implementation will only read
> > from the named fields. Therefore, while the ioctl syscall itself is
> > unsafe, developers assume that the safety requirements are satisfied
> > in this regard.
>
> As discussed in this thread, that's not a valid assumption and may blow u=
p in their face sooner or later. ("No padding not covered by any fields" is=
 best-effort, not a guarantee)
>
>
> --
> Earthling Michel D=C3=A4nzer       \        GNOME / Xwayland / Mesa devel=
oper
> https://redhat.com             \               Libre software enthusiast
