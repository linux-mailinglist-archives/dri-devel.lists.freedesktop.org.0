Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COrYOYOMjWnq3wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:17:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE2D12B2BF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9246310E170;
	Thu, 12 Feb 2026 08:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="fczdTTiY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C097D10E6F5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 08:17:04 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-43591b55727so5611827f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:17:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770884223; cv=none;
 d=google.com; s=arc-20240605;
 b=Bbq0LqePVZ4ln2rFLA1cenb6yOz8escAM+8iAth5IQCdLa9LfT1mF02K2Yqi8ytp6D
 tKOWWlXjHqU+0fCtE8w65vMlgC9cN751m4ug0FLc0qw5/NPVpZaVlSA4fNH7SKaDCV+K
 wuWe2mLNm+gBFhdwWZE1+j9DIC4yuRTXtuxRFeJ5LNZ9qKwDxN8Auk4sKDDThYApa/TW
 qrh5Owf3nqEPq4KvNsuYujTXYowGrjHzx2Upobgjl1v8QuhDmj+Qp6zvfCRNCbXSXb4X
 VFYTznC1Xu/Aryaxd5uAYjapMyGf+urhJQK8F95Jyc2opV9+gOAcBybYBY3CGCVdfwmw
 qEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=NpjJ+bXgoJAJdq6/RHAgpjIs0bFSGiAauGnbv0NC43o=;
 fh=nZZ+KTOCv2Ceq3ktw0H4nomfAB7yR8Jy16Wmahn3OFk=;
 b=Jx3/nCJplH8sll0rW+urv1q825F3+cNvNacbpZl7UPF+5xs3BSM297BUGFp8UfZiQA
 3EPCakdnTenN1QWQuLIzPT64mlYTh393dDCufJcWFDuuBjRfKKYZmOsXNOJm4Hqag6Mj
 3epZknIOS5a07Hv/vL2BpeBBVDayuxtuyDrZkDm9DEFd1YFX86gtbHZWb3q4SK//PYqF
 LrhzuGnR3b8Yazib6mgITiURJf0nTvZtPVgKCl4dvsjdhrLeZi2hDd+Gzped5n99h9Ay
 YoW8RSAIEapI8ckLGPxnGpXFPWPtn4jj1cr/wELY6q/0CclYtxc6NGeYCsXn8PiEi/Ke
 sYJA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770884223; x=1771489023;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NpjJ+bXgoJAJdq6/RHAgpjIs0bFSGiAauGnbv0NC43o=;
 b=fczdTTiY6sUQa3f6EDTYL2iwCBNe+FNJdZzYR0/J88MVerlUCHh9lheOcn9A8HO8bN
 zHL4HMJJwamxrflVcW2XFGl+fMjY8NSHLHQ9CrlXx1LFEkHPqrsUhwF6MhRupWMCfm7M
 sS8XNJEKKu+xBIxETyLXROVLtBP/hpZvwV8kXc9Yw/WcaiAp3MMrWTd1TPP33u7LK2fD
 KExI7evc4VgFTI+IyKk22JUquPGCGxnuCf3RxtvxFDusFyh0sHSBn8NzPTftWJe1ThvU
 WnRnLean9LXdc6WpHmzlc22fme40Hyd0sd2x8QZ+PD7e3X9BpmDNHe1f3O4Cnj/klmuy
 HrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770884223; x=1771489023;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NpjJ+bXgoJAJdq6/RHAgpjIs0bFSGiAauGnbv0NC43o=;
 b=favbG6mzvAx0a/3kUXqB4Wdf5ANwOpvKAzCwlEh43XfTkS7/pMODP6LdJyucv5qDKE
 oaKd2AmxOTf7Jah2+IR4vRiBJalwjnlkxMnxEf9oTpIB1l8Rjoqc+bDBlddiCxYkvDvU
 N3M4gw/dtefDGTLo6sStc2KOz+PxsWsWr+Bvrd2gZTjEEkZ3cMLZlGPkh0VbqidAEIzf
 VgYYUJJOLSbeiUkYYFLhnARC8qZ5m0uVwI+DIhTuwFALZ8Lh/+kD95odNvdDJ7DNFDur
 +QEE2/bVXJuptFimd+TxeXdDET/AJhXFdkIMWb4St15gdnqPAA6coMJxM60509dIyLMB
 YE5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEDTeXGD3jghTeFr+AQsgJPBjSE7xQszoKb69MVOPAX0TPYFwxnUR6a1TTlAa+cQ/bWlU4tCeHPNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4hCOay6jja3A1G9hs+GXkA7gJHQaxtzmbfEkux19bvrGZhJt4
 7IiwTtpynnjF0dWxXMkdsPBjpE29BxWsZbJ0+alsTuNSmiYOejgzAYQkTL/nvNBxSNdDXzSo69v
 /78sWVkV/NH5Ym2/v6IWU1PzVL32yDOQHZpkNRdCy
X-Gm-Gg: AZuq6aKvg2vSfLNzsv7EaVy94w4XfEct/D0az5ryCW5NOaFSYuVzfr45nHIe2ii546d
 VILfZpOOf8QfbK7PI65OJtYp0qXFZ/08IUdoD3ECxihobkm//KtSJimKlamRle8Xp7qX+x/esEU
 WvICj2M+mtS2GFwhAD9HAmAOrBbXU5/qcLjAgnffSzHH10tXTk5d6aWJFc1As3L389GMAH7R8HW
 La2b98kIb7JU7Fpt+I9BYEJn2YWo3v1Cmp12t18UVRlRi4LaZ/g5ZYcPO7R+wm262U+9pJfXGZL
 VssHMAI9ptOx2E8OvHPXBPtiPypEVVR3/Bmqow==
X-Received: by 2002:a05:6000:1a89:b0:437:678b:83ca with SMTP id
 ffacd0b85a97d-4378ac99f00mr3631820f8f.50.1770884222766; Thu, 12 Feb 2026
 00:17:02 -0800 (PST)
MIME-Version: 1.0
References: <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
 <DFSLCI9U4NCW.2HI2UPUI7G134@kernel.org>
 <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org>
 <20260122-majestic-masterful-jaguarundi-d0abde@houat>
 <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com>
 <20260204-nickel-seal-of-poetry-8fdefb@houat>
 <91A92D84-1F2E-45F3-82EC-6A97D32E2A78@collabora.com>
 <20260204-angelic-vermilion-beagle-fd1507@houat>
 <20260209105047.693f2515@fedora>
 <20260211-flawless-feathered-boar-0b87ad@houat>
In-Reply-To: <20260211-flawless-feathered-boar-0b87ad@houat>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 12 Feb 2026 09:16:51 +0100
X-Gm-Features: AZwV_QinKyXJ-A463YThqNsT1M__XmmPzGQJrynVFHR1tMFsQH08Zqmn37iT6Tc
Message-ID: <CAH5fLgiQE7mJBpAxv6xTVKKFWadg2GdVe31hRM6gNk3Vah61MA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
To: Maxime Ripard <mripard@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Drew Fustini <fustini@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
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
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:boris.brezillon@collabora.com,m:daniel.almeida@collabora.com,m:dakr@kernel.org,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:ukleinek@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-pwm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,kernel.org,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,redhat.com,baylibre.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4DE2D12B2BF
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 5:37=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> On Mon, Feb 09, 2026 at 10:50:47AM +0100, Boris Brezillon wrote:
> > Hi Maxime,
> >
> > On Wed, 4 Feb 2026 15:34:29 +0100
> > Maxime Ripard <mripard@kernel.org> wrote:
> >
> > > On Wed, Feb 04, 2026 at 09:43:55AM -0300, Daniel Almeida wrote:
> > > > > I'm probably missing something then, but let's assume you have a =
driver
> > > > > that wants its clock prepared and enabled in an hypothetical enab=
le()
> > > > > callback, and disabled / unprepared in a disable() callback.
> > > > >
> > > > > From a PM management perspective, this usecase makes total sense,=
 is a
> > > > > valid usecase, is widely used in the kernel, and is currently sup=
ported
> > > > > by both the C and Rust clk APIs.
> > > > >
> > > > > The only solution to this you suggested so far (I think?) to impl=
ement
> > > > > this on top of the new clk API you propose is to have a driver sp=
ecific
> > > > > enum that would store each of the possible state transition.
> > > >
> > > > Yes, you need an enum _if_ you want to model transitions at runtime=
. IIUC you
> > > > only need two variants to implement the pattern you described. I do=
 not
> > > > consider this  =E2=80=9Cboilerplate=E2=80=9D, but rather a small co=
st to pay.
> > >
> > > A maintenance cost to pay by every driver is kind of the textbook
> > > definition of boilerplate to me.
> > >
> > > > I would understand if this was some elaborate pattern that had to b=
e
> > > > implemented by all drivers, but a two-variant enum is as
> > > > straightforward as it gets.
> > >
> > > And yet, that framework has dozens of helpers that do not remove
> > > anything from drivers but a couple of lines. So surely its users must
> > > find value in reducing that boilerplate as much as possible. And you =
do
> > > implement some of them, so you must find value in that too.
> > >
> > > > > That's the boilerplate I'm talking about. If every driver wanting=
 to
> > > > > implement that pattern has to make such an enum, with all the rel=
evant
> > > > > traits implementation that might come with it, we go from an API =
where
> > > > > everything works at no-cost from a code-size perspective to a sit=
uation
> > > > > where every driver has to develop and maintain that enum.
> > > >
> > > > There are no "traits that come with it". It's just an enum, with tw=
o
> > > > variants.
> > > >
> > > > > API where everything works at no-cost
> > > >
> > > > The previous API was far from =E2=80=9Ceverything works=E2=80=9D. I=
t was fundamentally
> > > > broken by design in multiple ways, i.e.:
> > >
> > > Out of context and not what I meant, but ok.
> > >
> > > > > a) It only keeps track of a count to clk_get(), which means that =
users have
> > > > > to manually call disable() and unprepare(), or a variation of tho=
se, like
> > > > > disable_unprepare().
> > > > >
> > > > > b) It allows repeated calls to prepare() or enable(), but it keep=
s no track
> > > > > of how often these were called, i.e., it's currently legal to wri=
te the
> > > > > following:
> > > > >
> > > > > clk.prepare();
> > > > > clk.prepare();
> > > > > clk.enable();
> > > > > clk.enable();
> > > > >
> > > > > And nothing gets undone on drop().
> > > >
> > > > IMHO, what we have here is an improvement that has been long overdu=
e.
> > >
> > > Nothing is absolute. It is indeed an improvement on the refcounting s=
ide
> > > of things and general safety of the API for the general case. I don't
> > > think I ever questionned that.
> > >
> > > However, for the use-cases we've been discussing (and dozens of drive=
rs
> > > implementing it), it also comes with a regression in the amount of co=
de
> > > to create and maintain. They used to be able to only deal with the Cl=
k
> > > structure, and now they can't anymore.
> > >
> > > You might find that neglible, you might have a plan to address that i=
n
> > > the future, etc. and that's fine, but if you can't acknowledge that i=
t's
> > > indeed happening, there's no point in me raising the issue and
> > > continuing the discussion.
> >
> >
> > Okay, let's see if I can sum-up the use case you'd like to support. You
> > have some PM hooks, which I'm assuming are (or will be) written in
> > rust. It will probably take the form of some Device{Rpm,Pm} trait to
> > implement for your XxxDeviceData (Xxx being the bus under which is
> > device is) object (since I've only recently joined the R4L effort, I
> > wouldn't be surprised if what I'm describing already exists or is
> > currently being proposed/reviewed somewhere, so please excuse my
> > ignorance if that's the case :-)).
> >
> > The way I see it, rather than having one enum per clk/regulator/xxx
> > where we keep track of each state individually, what we could have is a
> >
> > trait DevicePm {
> >       type ResumedState;
> >       type SuspendedState;
> >
> >       fn resume(&self, state: SuspendedState) -> Result<ResumedState, E=
rror<SuspendedState>>;
> >       fn suspend(&self, state: SuspendedState) -> Result<SuspendedState=
, Error<ResumedState>>;
> > };
> >
> > enum DeviceState<T: DevicePm> {
> >       Resumed(T::ResumedState),
> >       Suspended(T::SuspendedState),
> > };
> >
> > and then in your driver:
> >
> > MySuspendedDeviceResources {
> >       xxx_clk: Clk<Unprepared>,
> > };
> >
> > MyResumedDeviceResources {
> >       xxx_clk: Clk<Enabled>,
> > };
> >
> > implem DevicePm for MyDevice {
> >       type ResumedState =3D MyResumedDeviceResources;
> >       type SuspendedState =3D MySuspendedDeviceResources;
> >
> >       fn resume(&self, state: SuspendedState) -> Result<ResumedState, E=
rror<SuspendedState>> {
> >               // FIXME: error propagation not handled
> >               let enabled_clk =3D state.xxx_clk.clone().prepare()?.enab=
le()?;
> >
> >               Ok(ResumedState {
> >                       xxx_clk: enabled_clk,
> >               });
> >       }
> >
> >       fn suspend(&self, state: ResumedState) -> Result<SuspendedState, =
Error<ResumedState>> {
> >               // FIXME: error propagation not handled
> >               let unprep_clk =3D state.xxx_clk.clone().disable().unprep=
are();
> >
> >               Ok(SuspendedState {
> >                       xxx_clk: unprep_clk,
> >               });
> >       }
> > };
>
> I'm not sure we need to associate this with the suspend/resume state eith=
er.
>
> > With this model, I don't think Daniel's refactor goes in the way of mor=
e
> > generalization at the core level, it's just expressed differently than
> > it would be if it was written in C. And I say that as someone who strug=
gles
> > with his C developer bias every time I'm looking at or trying to write
> > rust code.
> >
> > As others have said in this thread (Danilo and Gary), and after having
> > played myself with both approaches in Tyr, I do see this shift from man=
ual
> > prepare/enable to an RAII approach as an improvement, so I hope we can
> > find a middle-ground where every one is happy.
>
> I do think we can find a compromise though. Miguel suggested for example
> to make the current enable/prepare/disable/unprepare function unsafe,
> and that's totally reasonable to me.
>
> Then we can implement the "managed" clock version on that unsafe API,
> and we would end up with a "raw", unsafe, version kind of equivalent to
> the one we have today, and where callers would have to justify why their
> usage of the API is actually safe, or the new, managed, variant that is
> safe and can be easily used by most drivers.
>
> And we can call these RawClk vs Clk, or Clk vs ManagedClk, or whatever.
>
> How does that sound?

If you make the raw API unsafe, then that's okay but any use of an
unsafe API from a driver will receive very hard scrutiny. Yes, there
are occasionally good reasons to use unsafe from drivers, but the
entire point of this Rust exercise is to isolate unsafe code outside
of drivers as much as possible.

If Daniel's proposal is inconvenient for some drivers, it would be far
better to have a third API that is both safe and convenient for those
drivers.

Alice
