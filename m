Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGjNEKY4gmmVQgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:04:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8031CDD473
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804BE10E2AC;
	Tue,  3 Feb 2026 18:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="xhwORy4s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0912810E2AC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 18:04:16 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-652fe3bf65aso272a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 10:04:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770141855; cv=none;
 d=google.com; s=arc-20240605;
 b=OasbBKKXbpjwPyfASUPO/H5GqKBQD+7O7zdNaLon2b+ru0RUtOHUQSIknEp66cxaL0
 UziSDf73D5YkMEsvI2o+mqZvoIErup/eK8ZnCV1HlOgxcnypFSMrfocd1wnordqUB7BP
 Rocwyve+hiaUGn7TCZAauxJUyEF3d35q+4Dq/MUkGbsqgWW9uNgX+91lyuT7kBpYQTTl
 PZ0vR2nIJpb4FgOGfawnTAC9VAzBMahOPtY96744hG+2jlDVBBT6HFgC3RamUrgdkDYT
 0g2uHBjXTC84C1gTACDb94KPIKWrEm15NTAl9KiQs2VA+YQRav5PIhi54u+Fbt8iXFnU
 xPZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Zo5g4kjzsHVdCYVph0+zHfHpTvTrsr3e0LsvYcnTAos=;
 fh=eEBuwkHkfuJUt+KU7Emx5In87UOwx+cFD3PJXRvlalE=;
 b=eINGnO0GDWOqD9vxLSCqP3s4D6jtISc3cD5kZhwTgMa0sEON+/ebAlX25McHx3BQxs
 JAI0nz4VtqnL2I0zlLz2QtGG8p9p6EQLh+IBwCFlbixdtmvhTAknSd2GS/jSue/yOaUu
 WueDtVi7Q+rsJscrxhzuH699EAZiQIX+iMGkCwTRlHIVkmP1AQvd4NS5CjEXkIWqgc21
 IehENLsGghQqWQcME7+vHIjMGWqJErrq9ZIngfHXZTqKG3escpZC/cShnP1VYvf3tSW3
 QAVgkY/eJcLjVY+vrwi27yQOVrFs6I229LbQtt9bCmIqWsvk0oL0i6kO7C4rDTfeGA9d
 ewRA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770141855; x=1770746655;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zo5g4kjzsHVdCYVph0+zHfHpTvTrsr3e0LsvYcnTAos=;
 b=xhwORy4sRwNhnx/8oS07t8EH6UqL7gYDIH6fVnCcdPsROHeeFQIWHtj3oUlCCg0etr
 ROM8fP+XfSP9yuRRU71kiSb3ICJHe3xOVs/sIR8F3hR+qn4VnWeUYIjo5grnl6eIcaFU
 08XjvMZ87UuI/jNWMDLpxygyChQuWiHGuZHH86IXaiwEl0r+gh2Vy8/F6RA424SrX+aO
 ueWdtmk8/tn0aSHFklEpq3M0U4bBWNC+ibZqW+UX3/lYyelN+zm2IkSVkXkCMPIpm1ni
 YQt46THzWKDlJhoa+5F+e0AxuGZb/k4o0xgmVYFJTYfOfKwofZ7BeK+3hK4wXfgyj8qg
 F4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770141855; x=1770746655;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Zo5g4kjzsHVdCYVph0+zHfHpTvTrsr3e0LsvYcnTAos=;
 b=ZmalIAUtd7YONg4Eqa51tT3RqNBcs38KSH7lBsaZgSsPv7ov+q6FKf8sgeHXn/+WjF
 hb7dOUcv6SC2t11MMohIVKw+hRww2iBepL5LkfZkwDYPg34zL9SxSyMnouPzWNxWnwF3
 a/C30vDuSGPnFt2ueG3EVHbqOq/4u9gxl1cpDODOJ0nWkvJRya28wM442alCWCFdL5hP
 mlUjvTDix97tiL2R7NoiumUiizsPpfAzhESaGKLePYTr+Ug2Il5atA5oY2VKhjAgqgdO
 3BgR3VmVdWvUsJco+sPBeO5B5wLC7BEBZ/FlKvPUCapOD4ZCqidDkj1Pw5KA4OyF6a1U
 QL/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4+TUAR/eNbj3LYTJEyJttqApd7Ft8HePWZ9HFRMue41+a3YneJfrgOEZgzDEnK+bKlpj/BpF4nMk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsTSgA6ScNK5lgH4zSoLUHK7oHqGyOM/HSiJKOynHq6u3arliR
 rwuNR4AcOOAuXPMQTPD5TrexAzzbO5o39IjElnS90E8ezmcoJT1PrKQ4/3teLcPsbm1mMYCsTkC
 KJaaiGvi1f5NMo1n3g22qvflY/PlcCvEhpCT0ykYy
X-Gm-Gg: AZuq6aIqA0S3k7d1S0sBDDPZiTR0RUe6m2rZzKBaPWy6exiX73R7+OkeWUAQDY3sxUh
 /T4HD48beYDehzW7cpwmvjHlB2boizsK6eHvWlPaUlf6GFIEnB6fG6o8o5JVfmi1yNerf3c6L9t
 8L9yFGelEiKzaLrUiVgjLQfPTEQakO+T7BYJ3F5KaJ3KfRsJrz3nji96kT5lWI9hYwrwY2VRMS+
 kT5L+us7quXu/ZbF1u45WurTmUsK3JzUlfHsVEqXhl9OEaUw/lIOd4TKHDQeppqqMn03FqWoH2r
 DGUgZFOc6vugkzxBzy02kphTtQ==
X-Received: by 2002:a05:6402:5351:20b0:659:3fc7:e1e1 with SMTP id
 4fb4d7f45d1cf-6594a350f8dmr6491a12.16.1770141855228; Tue, 03 Feb 2026
 10:04:15 -0800 (PST)
MIME-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
 <20260203-qcom-socinfo-v2-5-d6719db85637@google.com>
 <DG5HAM6F5QYE.1ZFO7GD3SL9V0@garyguo.net>
In-Reply-To: <DG5HAM6F5QYE.1ZFO7GD3SL9V0@garyguo.net>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 3 Feb 2026 10:04:03 -0800
X-Gm-Features: AZwV_QiFdGyk29eec1MFmYhNyUzLZTIr17YBC0D3LJX2IXJzzxnb_bKNmlHpqIg
Message-ID: <CAGSQo03g8bjRosYVPzxhK9FpSW1ZfW52unPaoxpcn=pXaDUriQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] rust: debugfs: Allow access to device in
 Devres-wrapped scopes
To: Gary Guo <gary@garyguo.net>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Satya Durga Srinivasu Prabhala <satyap@quicinc.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:gary@garyguo.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:satyap@quicinc.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:m.wilczynski@samsung.com,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:tsoni@quicinc.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-pwm@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mmaurer@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mmaurer@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,quicinc.com,gmail.com,protonmail.com,google.com,umich.edu,collabora.com,linuxfoundation.org,ffwll.ch,samsung.com,intel.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,garyguo.net:email]
X-Rspamd-Queue-Id: 8031CDD473
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 8:48=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Tue Feb 3, 2026 at 3:46 PM GMT, Matthew Maurer wrote:
> > This adds support for creating a DebugFS directory which is aware that
> > it is bound to a device. As a result, callbacks under that directory
> > have access to a bound device which gives them efficient access to othe=
r
> > Devres, ability to use dev_err! and friends, etc.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> >  rust/kernel/debugfs.rs | 40 ++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >
> > diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> > index d7b8014a6474698235203f2b7d8fec96f2bb43f8..ac614d693fa73929d095b66=
9e9ba61958bec609e 100644
> > --- a/rust/kernel/debugfs.rs
> > +++ b/rust/kernel/debugfs.rs
> > @@ -11,6 +11,11 @@
> >  #[cfg(CONFIG_DEBUG_FS)]
> >  use crate::sync::Arc;
> >  use crate::{
> > +    device::{
> > +        Bound,
> > +        Device, //
> > +    },
> > +    devres::Devres,
> >      fmt,
> >      prelude::*,
> >      str::CStr,
> > @@ -722,3 +727,38 @@ fn new(name: &CStr) -> ScopedDir<'data, 'static> {
> >          }
> >      }
> >  }
> > +
> > +impl<'a, T: 'a + Send> Devres<Scope<T>> {
> > +    /// Creates a new scope, which is a directory at the root of the d=
ebugfs filesystem,
> > +    /// associated with some data `T`, enclosed in a [`Devres`] for th=
e provided device.
> > +    ///
> > +    /// The `init` closure is called to populate the directory with fi=
les and subdirectories. These
> > +    /// files can reference the data stored in the scope. Because it i=
s stored inside a `Devres`,
> > +    /// the init method is granted access to a `&Device<Bound>`.
> > +    ///
> > +    /// This can be used for cheaply accessing device-protected data i=
nside DebugFS methods or
> > +    /// accessing device-specific methods (e.g. [`dev_err!`]).
> > +    ///
> > +    /// The entire directory tree created within the scope will be rem=
oved when the returned
> > +    /// `Scope` handle is dropped.
> > +    pub fn dir<E: 'a, F>(
> > +        dev: &'a Device<Bound>,
> > +        data: impl PinInit<T, E> + 'a,
> > +        name: &'a CStr,
> > +        init: F,
> > +    ) -> impl PinInit<Self, Error> + 'a
> > +    where
> > +        F: for<'data, 'dir> FnOnce(&'data T, &'data Device<Bound>, &'d=
ir ScopedDir<'data, 'dir>)
> > +            + 'a,
> > +        Error: From<E>,
> > +    {
> > +        Devres::new(
> > +            dev,
> > +            Scope::new(data, |data| {
> > +                let scoped =3D ScopedDir::new(name);
> > +                init(data, dev, &scoped);
> > +                scoped.into_entry()
> > +            }),
> > +        )
> > +    }
> > +}
>
> I think it is a big strange to have this on `Devres` (in patch v6 it has =
`Devres::dir` doesn't make
> too much sense). I would suggest that we domsomething like
>
>     impl<'a, T: 'a + Send> Scope<T> {
>         pub fn devres_dir(
>             ...
>         ) -> impl PinInit<Devres<Self>, Error> + 'a;
>     }
>
> To me `Devres` is just a generic container type, just like `Arc` and `ARe=
f`, so
> the assoc functions should be defined on the concrete type.
>
> Also: is there a reason that this needs a special API, and by
>
>     Devres::new(device, Scope::dir(data, c"name", |data| {
>         // use data and device
>     });
>
> ?

Yes - that won't work, because the function being provided to
`Scope::dir` is `for<'data, 'dir> FnOnce(&'data T, &'dir
ScopedDir<'data, 'dir>)` - this means that *intentionally*, if you
capture any non-static-lifetime variable from outside the closure, you
won't be able to use it with the methods on `ScopedDir`, because the
`'data` lifetime bound should stop you. In the general case, we
wouldn't want a reference with the same lifetime as `device` in that
example to be usable inside the debugfs callbacks. The device of a
Devres wrapped scope is a special case because we know that it will
outlive it.

>
> Best,
> Gary
>
>
