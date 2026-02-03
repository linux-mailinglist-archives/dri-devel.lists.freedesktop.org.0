Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM1IJKAtgmlFQAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 18:17:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B2FDCA35
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 18:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE8010E12A;
	Tue,  3 Feb 2026 17:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="OnSQTX8r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58AC10E12A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 17:17:15 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-64baa44df99so11581a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 09:17:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770139034; cv=none;
 d=google.com; s=arc-20240605;
 b=SZVs7AXBW/MCkWrBxH04Gs1PIyLHNZh3x2z0vEyZEzNTnRxXglaexY5mjG+wXx2C9d
 AlOH6NDVQP+dRFRrHejhJ2Lio1+3kTcfkAtVUKJbH9ZCfrFKNB9+7jRd0al4gzEGMmtd
 oVTys8uf3d/CDLVgdHRK3IHbZv3b0nMhGsI5WkLSqrfGsAQTkFOrILkq9a8s/yIB+kkM
 qjNCnfNlWYEr4kV8+VP0c1sr/xJUQUXoSMnSYrjtR7P7q0yWnQ+sRCcSKJjFp6GByDg4
 ngAQRfHvkGdPtb6E+Xp7yXvJhgCeQUpZENl5KrisEgcGjlJq6Qtb0dP7Y64oIL5+6wl5
 XKaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=XHfoxmbIC6zkgG4vIkE5TIaeovg1Amtxgwva3GX0OJ0=;
 fh=6f3Zyi7KP3wxRVMPosyjFewgyseEuBTbZ9St9MPDH1A=;
 b=FIbomT825e3d+MZ3idXb5DQkpAPc5tB3zF7ugI7eTzepvriXCA6xK2ag/tobc0V0xn
 fXwnq0QaGftc31uvxlq7nrFqjne84/kkPuGGaWYVlz6O/ZLSgNPFVrwLhqpZflSszqTQ
 S0kx3kg9hdDPWyP4WY9dSTDpfNb8ybyfArT6ftWN1rm+3xOuC6ma/0tTj9aPfiTrSh5G
 xRbPI5PZgPj0yV9iQOIH03n27vM0KXu4Yq1TnvqqTpRhhZeEhdMBEToq+mDng4GfZVBL
 UxDodDNhnssqTP/bl0vMw5lfGg8c8IXIdDDvlfgJsZzpow+eDq9TKjf4j9VRTAZOjwHo
 Nvow==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770139034; x=1770743834;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XHfoxmbIC6zkgG4vIkE5TIaeovg1Amtxgwva3GX0OJ0=;
 b=OnSQTX8rGNfMUpNxlO0MERBayaDcdsnW276F4WzN/lUgDA8nv1gSnYJQ6HhUw/iE+V
 91Kr4iTPnsknMH1/EhgxOdKC+DEHboZuvLBfV+18PnNvPLDQ25PITaw+9GfEE1T6EZ9h
 vlRMIyN8htgsZBQvbpW7skhWSTYsLrzbXaVljwRNDmthbOQfs2K4GPNKb5vTRKoIVAi3
 uq5VwjAYJSlKpcHTQM9Q1zpvpInq7RsMrU2JTLSl0Jce2JaD7dDnBUK1dPbXgyK+zLIx
 5PHDNWuEdrKvmQrHmrTWtPD/mpxNCifIcxhXPhi9rT/nge4jcakyTlHr2vasM5TwPX+6
 ELyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770139034; x=1770743834;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XHfoxmbIC6zkgG4vIkE5TIaeovg1Amtxgwva3GX0OJ0=;
 b=dNo37ccrKzH6MGWLe2m8wc1f7kCLK2cfWbmgLFx4H7THupQLaRAOkDoL8oBVLOY44Z
 UraoZRqjf/9zMBe5/qiPT5LPMqs0gyH/vZGPqa4OICXFcYZv3As9W2x+VLA4fcrtCEWA
 EhzDRTex3QN3CEAd+H+bA3kjd9O78I+IXtICII4NAFYoVVy8b2zP/RiqAadoYYE6lACZ
 70S0DLe2vLKSI2e3hdxxN6WcYFC/yiGqCD9E3zRWsnN5TyzWYRIsNqGYbnFRS+3vl6jf
 nlnpwtatoG8jaLuL1aeDpk43uvuDlHIW9B5LFi9wC3pDJyDP9kUqZwbBBHLDWtbS8egh
 wf9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8J7PfaW++yrMo1qBCAAQdnVnScCeomB9dz5iC9CeXq68K4rjV/49/TfW0+9ytmiiibqiAmHVNP7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5+24rtTBkp/JVBn71JppkEhqPhatK+sjO5ksHw7yxVi/kbpjF
 Vcv/65e9o6TcQ4pZN2vfOGSgEOZxFJ3qWzt/S0BfkwoNwZxNCeIO0w51dGP9t9V4ZWd8j5yNL2L
 7hHu68bKVUKboUAEdLNo8KtJeos4Hp9XcOJ4hH5Zb
X-Gm-Gg: AZuq6aJWEDPEbAWaBjg/zo/8QeaKrWY4fJaPnAlNCSnWd03nMWof1osLtIvztSLdEO5
 YveZyRawlIeTiHM5z38chTBmiFx6mHF310WAKi38CwDDXgvM7dvYkW8ZFtup1Wb7toRBK2cc3R0
 aSsYONf1+q3rTFpEb+UkW9IRkdhiRH6JJfI1ccBnrsRaD/TiTr+AY1FRX2HTdfm9QgZTfyZCkMY
 fRctPGx1qSsUmPfIHw2NoMu+pPXGWqE6aWVAfbubVaHO05EXDySf2gSdCtNvOgBYy/0+VioIYTj
 BlrL/8oBZVKN3+ss7/w4l7ryS0k3LrLgcYXN
X-Received: by 2002:aa7:c1d8:0:b0:64b:53a1:7b09 with SMTP id
 4fb4d7f45d1cf-6594a34b6damr3702a12.14.1770139033838; Tue, 03 Feb 2026
 09:17:13 -0800 (PST)
MIME-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
 <20260203-qcom-socinfo-v2-3-d6719db85637@google.com>
 <2026020338-gratitude-overplay-98b0@gregkh>
 <DG5GWC5MR1ZC.3VFVRL0G0NMUW@kernel.org> <2026020342-dime-sharply-3fd4@gregkh>
 <DG5H9N9QKZUW.3KLJW09OBNRD0@kernel.org>
In-Reply-To: <DG5H9N9QKZUW.3KLJW09OBNRD0@kernel.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 3 Feb 2026 09:17:02 -0800
X-Gm-Features: AZwV_QjJ5I2wN6j4AaSDIxHXnmaEEy8I5VLzgVrY-Rhll20Eq-wK6CGJrbI2UCY
Message-ID: <CAGSQo00M_6-6S3Yr4sLdGkNH_KAgP1FoC3zbdwdFuEOxic5vqA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] rust: device: Support testing devices for equality
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Satya Durga Srinivasu Prabhala <satyap@quicinc.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
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
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:satyap@quicinc.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:daniel.almeida@collabora.com,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:m.wilczynski@samsung.com,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:tsoni@quicinc.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-pwm@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,quicinc.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,ffwll.ch,samsung.com,intel.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
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
X-Rspamd-Queue-Id: E2B2FDCA35
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 8:46=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Tue Feb 3, 2026 at 5:40 PM CET, Greg Kroah-Hartman wrote:
> > On Tue, Feb 03, 2026 at 05:29:16PM +0100, Danilo Krummrich wrote:
> >> On Tue Feb 3, 2026 at 5:17 PM CET, Greg Kroah-Hartman wrote:
> >> > And I don't see what patch in this series uses this, am I missing it=
?
> >>
> >>      impl Smem {
> >>          pub(crate) fn access<'a>(&'a self, dev: &'a Device<Bound>) ->=
 Option<&'a Mmio> {
> >>              if *dev !=3D *self.dev {
> >>                  return None;
> >>              }
> >>
> >>              // SAFETY: By our invariant, this was a subrange of what =
was returned by smem_aux_get, for
> >>              // self.dev, and by our above check, that auxdev is still=
 available.
> >>              Some(unsafe { Mmio::from_raw(&self.raw) })
> >>          }
> >>      }
> >>
> >> It's used to ensure that the Smem provided by the auxiliary parent can=
 only be
> >> accessed as long as the auxiliary parent device is bound.
> >
> > But how can a parent device ever bevome "unbound"?
>
> It can't, that's why auxiliary::Device::parent() returns a &Device<Bound>=
, i.e.
> as long as the child is bound the parent is guaranteed to be bound as wel=
l.
>
> The point in this implementation is that we need to prove to the resource
> container (Smem) that we are allowed to access the resource, since it is =
only
> valid to access for the duration the parent is bound.
>
> In the end this is equivalent to Devres::access(), which bypasses the Rev=
ocable
> if we can prove that we are in a &Device<Bound> scope.
>
> Having that said, the code should probably just use Devres instead. :)

Not using Devres was intentional because:
1. Implementing `subrange` would require more unsafe / invariant logic
with Devres. I would need to either wrap `MmioRaw` in a wrapper that
maintained that it would always be inside a Devres that owned it, or
wrap the Devres<MmioRaw> in a wrapper that encoded that invariant.
Then, I would need to propagate the `dev` from the source `Devres` to
the derived `Devres`.
2. Devres is PinInit, so I can't put it in a vector.
3. I don't need the destructor feature of Devres that necessitates the
extra complexity, because this is morally a checked borrow, not an
owned value.

I considered adding a more lightweight `Devref` to the kernel crate
which only supports types which do not implement `Drop` and access
through `access`, and so does not need to be `PinInit`. However, since
that would still require the manual dev propagation wrapper, it seemed
like it might be overkill.
