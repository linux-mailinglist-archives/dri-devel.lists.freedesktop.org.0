Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DhBGthAqGn8rgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 15:25:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B998C201610
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 15:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D59D10E9FD;
	Wed,  4 Mar 2026 14:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F4Y6AL14";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com
 [74.125.224.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383CA10E170
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 12:33:08 +0000 (UTC)
Received: by mail-yx1-f46.google.com with SMTP id
 956f58d0204a3-64ad8435f46so6385483d50.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 04:33:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772627587; cv=none;
 d=google.com; s=arc-20240605;
 b=lIAVi0LQw5NfOISMwm4ggbNoJCxbe6xSwJDl7nJwHkmzYIfBlIOkR1rKH9CTGCp5nk
 k0jhWxqy5v9kxH/VlJP+fJDm+nWNl9tdXUPcydNEZciw4Cesy7pX/7C6E5xsQbQHe1Xa
 assONhtxKRhHRiye9PygUqFpm3DYCX3m4UKfN7KzCHnykCrm9vJVrdZR7S9Ztf39Uejm
 VRN1n+yy1vPxSMAzorfy57WzoH321pYcVbQNisrWpyCaTKiTAsUU2c+P90MMqagQtxom
 RIoTRNNvbyAQt+OXtnWtS9LB9uo9Yi0kW9D2zg2n/ILzsDqgfJUeniIDuDMhDTOIKrL1
 Nk/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=05YmIrijcjcivZ6fDMYuePjXy8Ceppdwjm4CqXoIER0=;
 fh=/911+7YCVMRD6dBnfTVpxqmN4xBY9nupSh7BZO7/5u0=;
 b=e4owPT9QzxqBnex9ew1w2kmrM6nxoGC30obSw5GQtghnWcj0ILedvIhlJ+4+nMm1iE
 3f3s7uZikaK87/ifLoztyBHKOkYENi5m/q2QHpUR4Dq+EPzi3c8LT2/oZGBQ0dfO1UEL
 C4BHVoqYQXiV69PA8r3yHahqn1M2nL22fbpf+5hFIBw2ZzO8iJej7toVFpiHrF47OO6w
 MzO32eUIW1rf1Qa8H5j50XN9db9r6PzDe1OZc7Ok4yblH9Eu74EtM9koU9pDTpFKXEw1
 DpaHguzrLA6ej8U4agI4CVR4XJeoHrrdUEttnOlGjLszEpWS0F+p++qD1g+o+JwvShYk
 /wDA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772627587; x=1773232387; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=05YmIrijcjcivZ6fDMYuePjXy8Ceppdwjm4CqXoIER0=;
 b=F4Y6AL14yZoLI/haX0Tfte1KiviqXl1kk0ZVfmPiF7rITkG4CKgw7ietcOP7S5sPdi
 KG9uw5uMYcDQWaBvJUlSGD9Ef+466BR8KMLL1+mJN9jvFJ4AU24bWOgC38yQNeEyL550
 2MJlKtGxKY4/cJ0wss3iqI9TDI1mZU9t6NmFaMBJm7QMdEdCQmHXFoHQlhJqCBk9wDi+
 uj54RPVKRc8pNFRzSXE6AyvV+i23+WVc3yxr4ZfUvNQ+Zb5v+9ZwPM7yKI9fwVAMu9yY
 SeGXsjWEJTGE1gvez2zltP1fNMJm8clDcSXqu0qb5SN/TF0KuOVgNLGmVInNa/QXjrLV
 +8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772627587; x=1773232387;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=05YmIrijcjcivZ6fDMYuePjXy8Ceppdwjm4CqXoIER0=;
 b=RB2v8D05243+2XWC/FjkjUtfJ0s4e8XYsurWTM/Ybv+WdBtzwO8VynEaI/9RvFmMa8
 /b5M5X+f+6F6xJQN+icDuUtlglljMN/a7TJZb4EfV7NM7ZaeMLgAgIZGwe76Eo7wOBWJ
 wYRmyRCRe+3aI4VBlpj9asAzlJtvzF4NaKSyMT4C6RvnYx1GzqaG/9v8twaItvRLRxXZ
 2ZnNpqi2wjGjb7FJi/QfGR5pKr7dMinZxb8LA5Fcw9l4iE9QI4OFbGWdUkFPO8DWB+W/
 I7xMiGHU1xnf5HuEwvPBq7dRiCgwpTZ6k4BaaT2jnV/OSXEthtlZhgG/r0c0DiJQgOCo
 X76w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqL5VSErMrGjgCNh9ZiXsNnLX80X16BeLMbGdmFzpGFEbR2Os9yhT4o+ZXxjNDM91loPI6heF3rc4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZynbFsjv23UEpO35QKhkr07D+kiYrrc4FLBRLCVVEB8+1pJf2
 KzR9+h8g3skCx4kswzBnu5gZiFYOCAXUl9MeExdKB50Qv9ooJyCCzlT9c1ZOjrHHUutfhACfEIA
 FcI1kEEXmGP0Wsuxy0woYYVzL+uJvD+w=
X-Gm-Gg: ATEYQzxqShdM2gyP50Q1M2fBvc1L/ztqNMkuWmTL6fnKrg2XVE0YnbknKljKqqzv5MW
 a+9dipdr4sM/dCMp11/7bYBWCeEReDkxMsTXqB5dUXBSo9YLqM+la0Mk2bs7Afq0pUgfJ7g9t04
 hS7Cx6SA+tmMknd96KQS3OI8kMi8lBaS0sI3GHTXaVCISpZ8q9k9Y65Ekp6JJWbuzG0u9EDzp4+
 6WmByNcoi+sJUlzfxovrBgAXb4S8UHZC8RA8Wtv8BdB6Ssdyim/ppa9q6mKoQuyoOnvqXvbAuYW
 DAe/EnKbPTlm9y65rPEDY/17tP0s6fMIOLcrAH+KnU63xcZuAPVpxZIINBM=
X-Received: by 2002:a05:690e:12c4:b0:64a:d759:676 with SMTP id
 956f58d0204a3-64cf9c16928mr1116570d50.87.1772627586951; Wed, 04 Mar 2026
 04:33:06 -0800 (PST)
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
 <CAHijbEXk9q_cF6g=OuPKG-Wd+GLfU6Pu1HU77FpLdV6jfg9MnA@mail.gmail.com>
 <daaa5465-c086-47b9-be7b-13f5d62292ac@linux.intel.com>
 <5464a6fa-5a49-42f5-a1ea-ce9f18a6955e@mailbox.org>
 <CAHijbEXaxLU7sbCyJr1X8B_PoPdM2q19+JuF+huLQqFoLYP8kw@mail.gmail.com>
 <59bd46c0-03d9-4fef-a4fd-14b8f68f9860@mailbox.org>
 <CAHijbEUSFA3ptTNZ_YuOLgc44Px4CjAaa9x6DDjJktRCKjj+Dw@mail.gmail.com>
 <0847752c-39cb-4233-8e07-8e1325c196cc@mailbox.org>
In-Reply-To: <0847752c-39cb-4233-8e07-8e1325c196cc@mailbox.org>
From: Julian Orth <ju.orth@gmail.com>
Date: Wed, 4 Mar 2026 13:32:55 +0100
X-Gm-Features: AaiRm50OhXb_lcvsYkJY50y-QMOGBKfRHJJ2trL9NDtdx6zbv0TVR54CKpedZKc
Message-ID: <CAHijbEX6nqnKOSQs7=UgwVZWDwQ71ZtSjhoDoo5YCvT2_rJ93w@mail.gmail.com>
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
X-Mailman-Approved-At: Wed, 04 Mar 2026 14:25:23 +0000
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
X-Rspamd-Queue-Id: B998C201610
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

On Wed, Mar 4, 2026 at 12:47=E2=80=AFPM Michel D=C3=A4nzer
<michel.daenzer@mailbox.org> wrote:
>
> On 3/4/26 12:25, Julian Orth wrote:
> > On Wed, Mar 4, 2026 at 12:15=E2=80=AFPM Michel D=C3=A4nzer
> > <michel.daenzer@mailbox.org> wrote:
> >> On 3/3/26 20:12, Julian Orth wrote:
> >>> On Tue, Mar 3, 2026 at 7:53=E2=80=AFPM Michel D=C3=A4nzer <michel.dae=
nzer@mailbox.org> wrote:
> >>>> On 3/3/26 18:44, Maarten Lankhorst wrote:
> >>>>>
> >>>>> You don't even need to use memset, this would work too:
> >>>>>
> >>>>> struct drm_syncobj_handle args =3D {
> >>>>>       .flags =3D 0
> >>>>> };
> >>>>
> >>>> TL;DR: This method isn't 100% safe either.
> >>>>
> >>>> It won't initialize any padding which isn't covered by any struct fi=
eld. We try to avoid that and have explicit padding fields instead, mistake=
s may happen though, and in theory such padding could later be used for a n=
ew field.
> >>>
> >>> I don't think this is workable.
> >>
> >> libdrm begs to differ. It shows that it's not only workable but really=
 easy. There's no reason for doing it any other way.
> >
> > Using memset to initialize padding bytes between fields is workable.
> > Having the kernel add checks for this for existing ioctls is not
> > workable because it would break usespace that doesn't do this.
>
> As discussed in this thread, memset is also required for when the size of=
 an ioctl struct is extended, even if there is no such padding.

That is not a concern in rust code. If the rust code extends the
definition of the struct, all call sites will cause a compilation
error until the new field is also initialized.

The issue I'm talking about here is strictly about padding bytes between fi=
elds.

>
>
> > Which is every rust program out there as far as I can tell.
>
> That's surprising. Surely there must be some unsafe code involved which a=
llows uninitialized memory to be passed to ioctl()?

The memory is not uninitialized from the perspective of the rust
language since all fields are initialized. Only the padding bytes are
uninitialized and they cannot be accessed in safe rust, therefore no
unsafe is required.

I've never seen any rust code that uses memset to initialize ioctl
arguments. It assumes that the ioctl implementation will only read
from the named fields. Therefore, while the ioctl syscall itself is
unsafe, developers assume that the safety requirements are satisfied
in this regard.

>
>
> > I'm not aware of any ioctls that actually have padding bytes between
> > fields so this discussion is mostly academic.
>
> I covered that in my previous post quoted above.
>
>
> --
> Earthling Michel D=C3=A4nzer       \        GNOME / Xwayland / Mesa devel=
oper
> https://redhat.com             \               Libre software enthusiast
