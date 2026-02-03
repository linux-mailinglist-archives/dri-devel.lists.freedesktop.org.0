Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFoqAtEvgmlFQAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 18:26:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E7ADCC3D
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 18:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59BCD10E72B;
	Tue,  3 Feb 2026 17:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="tS++Hv3c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3EC10E71C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 17:26:36 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-64baa44df99so11850a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 09:26:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770139595; cv=none;
 d=google.com; s=arc-20240605;
 b=ZoWDHhA/3Xyitq+QBXnTz5cK66eRdyAjEHdPHZGpt/3qT7T8V7xD4+RWF7V0XON//S
 j8ovIrFpn1xGolcNOUJ3QKPYEOW0HbJo2lb2pxW8vsS+3qRw3mY5IAZPBqVdNakVWnZI
 IwgBuJq9x34DpSNPTrBb5yF5C1uAMaxFSroDHVAf/6geOoU3j2Ot7gkgnoD0n2RJQusk
 lpJTzP0ZWVWjxzEF4M0DQ37wT+q0w9LCZKLHa6BlFnncH9mdSmPes6LIv+JHnCGcDIda
 SQih27jyJ0zMdWzrPOC6pK29H4/I/JXgSpi8t6+0uyyMyflj2JQgMbK1RlJ8VvVKKMgS
 xEuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=TNaiJtMpISY5S0HDy1ONbkfjtxu0QVlIHfgawUN5ajQ=;
 fh=oKH1vo/2NVE08qZ2qOQOESogljMQCi2sN8tZ+9C1F/s=;
 b=eVIaq1y4Wxv448jrnwaKTEeyjXcVz6AiXDgNR2gkrddyYM/X23pp/QoNowuy4aXguY
 MUJCch9JcS6Rvza8NKFbdBYhKOFIHDCZfvg5Qwj5HYOrCICTQesIFjauSsGf5fRWJrW4
 MiaqR7ZIaphqg5A1dj8hG3cMBlvdjZruAaiOCw+ZaRBY/DhLlOqgmz+YsKLlufatdFfG
 Sp1wkSInUXSmZYAcU1nPS7pruqxD7nEn03lEnX82QZGjHofPddY0CQmXDObnEmCV1hKc
 A5RkTAlOloTAdyzlaY8KFXDpAafuhomcR9pWVJOHoFOvRJs/AYqA0k2EF74DB+UT59ZS
 NCZQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770139595; x=1770744395;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TNaiJtMpISY5S0HDy1ONbkfjtxu0QVlIHfgawUN5ajQ=;
 b=tS++Hv3cmB4Le7l7/RxRwecjH6tCYRUubMa0BzvvdYduNhto/GifqluPblZv2HhZQ0
 ldqnNydD8Ski07YlG9zw4LGIU9NgiE11D5C1usg+JZjsG//1mYsxbz5McT2zSjBkzdBB
 pJG4JGerBs6XJGTWhk152UBH8KmP0KDj3aqEpSf5pziR1Oq2iCRRa+RlZXQDyylJ3g7v
 ftXmAXyXZCobk8kKqMAwqG5K51guAKqPkMltWQUK6xgYGRFruwVXPnGCcUVWEwRSaLRY
 rfgnGxTo7Of7/S2KTFI+DVAyDausEH1z5OnvunOadRbgkq2CS2pLxYYHAKpZuDDUa5iq
 YKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770139595; x=1770744395;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TNaiJtMpISY5S0HDy1ONbkfjtxu0QVlIHfgawUN5ajQ=;
 b=BSBSkyFI4l8bbG6JSMoJFGWJxfX0ERk1tbwxi1N4lYxvtlyb/KfPPyVWP4+JwqGRTr
 6ntGuQTAVjyBCytViQlsq9ORRePS/hMeOpA/CnFF264BpiP//WbWPqJDjwBX8JTLT9hW
 6fIs9pJjtUUkSKQD4BpluL1uFT8zfgSV5ltf3EdOCVjqGUR46tc5902krldK9ZiHpSCZ
 Yu8Wj+T+ONxiOxcNBno/edYrqQtQT/atYANDcd4e8A1DvzEQFRexxgCqZCqKwy1YE54V
 f+Utk6tZWRtl+DAEBF3u9IZZyo6PZapvx9o4uWJSR2o0AXc81DfsHCWEzOI/I/cHdsnn
 Du0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVHq95H+ubL4NRXSea+13GFMPWuzyPqfMmrLyCq6tUCFEaWppIEdLnMuBG1+i+zmec8EqIep56sMU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHaJVROvS2fWytTRpudlDeLBwAHFX8vEr6zcIoZXYUXdC3DQTX
 t7lcQcfmmpHS75+4Xy4JITaqqK28CYo5nvPu11T1sulnTflebG9RJBOwk4sJxQouRLdaXb3lPCC
 D2hEXkciAzZBYj444WnA3DcCRpXnSLRUABJuXnt+e
X-Gm-Gg: AZuq6aInifFH0DcezGy61z3YObDJt0CgDntTl6Wj0ILopoC1TSROL1ixsSHm2hhBcjz
 RaW4aB6CZKa/mHF5j9RnfoT3pnKscymtKgy1kuTvd2/wqhkt/MhEwi4uSCj/hMeuaOQWxe/b0dL
 N8ta0FZTznHGKEHbPgF5Rz//jMWkL10wbgr88fxu68zRvnsjJCo3JkGH5C/+7GK7ujulwPBY3r8
 VPxH0wU0FR/QeIxgYG3AzwaYeppulUYBeAz5MyRRez9ZJG/58dO99MfucUIqUNCQrCRwf7oRy48
 gqH49enXmaEVUvmIppkHE4BE/w==
X-Received: by 2002:a05:6402:3098:b0:64f:8fc5:251c with SMTP id
 4fb4d7f45d1cf-6594a353279mr5513a12.18.1770139594461; Tue, 03 Feb 2026
 09:26:34 -0800 (PST)
MIME-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
 <20260203-qcom-socinfo-v2-6-d6719db85637@google.com>
 <2026020315-conch-trickle-2d84@gregkh>
 <DG5H119NY68Q.TWLCK3W36CM5@kernel.org> <2026020347-sneak-embark-1b36@gregkh>
 <DG5HGZG62NNS.18BCSOO6TR70G@kernel.org>
 <DG5HX5K2T371.3JGY5PQIV554K@garyguo.net>
In-Reply-To: <DG5HX5K2T371.3JGY5PQIV554K@garyguo.net>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 3 Feb 2026 09:26:23 -0800
X-Gm-Features: AZwV_Qh4ac161-isyLFn5NPWx7VX7FdmQ6d8uiNuPee-beDbNAjAyPPpvPjCwQs
Message-ID: <CAGSQo01qf4i6LDyi1umH6-6vjiE-VrFc1dd+qLxDXkjiYLcOCA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] soc: qcom: socinfo: Convert to Rust
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Satya Durga Srinivasu Prabhala <satyap@quicinc.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Dave Ertman <david.m.ertman@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Trilok Soni <tsoni@quicinc.com>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mmaurer@google.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:gary@garyguo.net,m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:satyap@quicinc.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:daniel.almeida@collabora.com,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:m.wilczynski@samsung.com,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:tsoni@quicinc.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-pwm@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,quicinc.com,gmail.com,protonmail.com,google.com,umich.edu,collabora.com,ffwll.ch,samsung.com,intel.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mmaurer@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 54E7ADCC3D
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 9:17=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Tue Feb 3, 2026 at 4:56 PM GMT, Danilo Krummrich wrote:
> > On Tue Feb 3, 2026 at 5:48 PM CET, Greg Kroah-Hartman wrote:
> >> On Tue, Feb 03, 2026 at 05:35:24PM +0100, Danilo Krummrich wrote:
> >>> On Tue Feb 3, 2026 at 5:28 PM CET, Greg Kroah-Hartman wrote:
> >>> > On Tue, Feb 03, 2026 at 03:46:35PM +0000, Matthew Maurer wrote:
> >>> >> +impl Smem {
> >>> >> +    pub(crate) fn access<'a>(&'a self, dev: &'a Device<Bound>) ->=
 Option<&'a Mmio> {
> >>> >> +        if *dev !=3D *self.dev {
> >>> >
> >>> > How can this ever happen?
> >>>
> >>> You are right, since this resource is local to the driver, it should =
not be
> >>> possible to have another devce from somewhere else (especially not a
> >>> &Device<Bound>).
> >>>
> >>> However, from a Rust perspective I think not having this check would =
be unsound,
> >>> as the method by itself would not be able guarantee correct behavor a=
nymore.
> >>>
> >>
> >> I don't really understand this last sentence, sorry.  If this is "not
> >> possible" why would that at the same time be "unsound"?

The code as it stands doesn't do anything that would grant `Smem`
objects to something that exceeds the lifetime of the device. The goal
of bindings APIs like these are that it should be impossible for
someone to write Rust code without the word `unsafe` in it that breaks
its invariants. Without that check, someone could do:

let smem =3D Smem::get(dev)?;
let f =3D move |offset| smem.try_copy(offset);
some_other_driver_or_subsystem(f);

That other region of the code would now have ownership over that
function, and expect to be able to call it safely. We're not doing
that, but we're trying to design the unsafe API in bindings so that
you can't mess it up even if you wanted to.

> >
> > It would be considered unsound because the function itself can not guar=
antee
> > that it does not produce undefined behavior, i.e. it would otherwise be=
comes
> > unsafe.
> >
> > But I'm not an expert on this, I'll let Benno and Gary jump in.
>
> Yes, in this code, `Smem::access` is using the passed-in `&'a Device<Boun=
d>` as
> a proof that the device is still bound.
>
> If the check is not present, the user of this API can give in a reference=
 of a
> different device, and now you're pontentially providing access to the MMI=
O
> region to a device that is not bound anymore. A important property we wan=
t to
> enforce is that UB cannot happen no matter how an API is misused (it may =
still
> oops, which is bad, but better than UB).
>
> This particular code, though, probably should use `Devres` as Danilo sugg=
ested.

Mentioned on the other thread, but I didn't use `Devres` because it
being PinInit is problematic and I would need to encode an additional
invariant anyways.

>
> PS. Personally I think this check (and the one in Devres::access) should =
use
> assertion rather than `EINVAL`, because it is a bad driver bug when this =
is hit,
> and adding failing code path for something that is a bug is something I r=
eally
> dislike... It should at least be a `WARN`.
>
> Best,
> Gary
