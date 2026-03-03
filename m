Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sP8VK/5Vp2lsgwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:43:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C59E1F7AEA
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D1B10E8E3;
	Tue,  3 Mar 2026 21:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZA7fp9ts";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4533110E8E3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 21:43:21 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-899e85736e2so33916516d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 13:43:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772574200; cv=none;
 d=google.com; s=arc-20240605;
 b=ISvrp2XSeyfacJI5k9UVtM6QsNkWBibu2tIpHVEPbJ+JM4x8wppJnL0znK8rzbheix
 fGMtALvqYZx0OVOEVkPKGjBmyhVFE1EuN9N5XTKExS3rYATLq3r26BxoCGnfT5VmXlSi
 3T8HC9mmBw4ihvYlGJFT/mBvjefWVpCZA7tKUu0D1Gu5i6VJlnKuC7RfbfutA9Xz6cGV
 tBTQ1asi8pg2jt4sz/EMGJyebIJq2zcyIBByqyijwi0aR4RDtBc5IJLrAWyqYZACEBad
 pFtcD9AEnW6ngtOFXrIwheHj7SVTHH0aFPdFxVcRMpKoRVRrdWcoUtTg5JCLMC5OTKvj
 Y6sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=/hxUXM4jn99GEhz9ASaqdbuFmthU86dS4GyXCltKJ1o=;
 fh=PfrA/i5fSh5XYa38zO4RnD6sAr2EC/BI6s/48Q24WsI=;
 b=SERATelqp+AKwdktvZL8tw96PnDwZi/6jvpnza+u+/OorhA5y8zEWuQrs7vaS74TcJ
 NJuLwwY47icMm3+BjOYnB5uv2+QJE2P8EQVX8kuBvSIaLYj1FQQqJOgEpU6oFP8VhosU
 kqUafIjQPQkIZMpXrBQHxCestDohOCdFcZwKkXXMVj4BPTdR/tlwYm9FEiHjSh0oK/Sh
 zOlBbLg6hZ8jqyvBRTsDCKSc2j0L3dJSc3tz2lVjo7ybhIfVjfcV9sdFDCPlrjorGF4Q
 9lUXWhBF3BDYTI+2T5uYptlAYf12dfWFfCKQSorubsXUV2AIVA33E4MPaxWXHdrCyMOn
 97BA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772574200; x=1773179000; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/hxUXM4jn99GEhz9ASaqdbuFmthU86dS4GyXCltKJ1o=;
 b=ZA7fp9ts/rxZQe6/m+kPJsEJaDXEl3IxKFM0IromlSAbO/WPvcNVfjo3sgHFbENOyJ
 3Np5E5KgGYM8ph6MDoiC/UmVwKxXxwHkGqz1Lbul6HhZLnlvjR53M2rkjxT7SpLwtjeE
 tL/WOGrgsGS6Uh0RniKx1sGpEBn6sWZL8Q2SMDwUkdXwsbASCbkJIq9xfip0r97bME/y
 +u5t4sbxJNVwjQIlFdDmnfNluL6EP+GB43NNsuSea+fyG3COaKf24BcB6qSfSIA3rKvs
 xIfmXdtFxHjvGJms83djF165lKY4W1zQdba1yn337FyyWvhy/0XVO3DIok8nsHx8hJyA
 8reg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772574200; x=1773179000;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/hxUXM4jn99GEhz9ASaqdbuFmthU86dS4GyXCltKJ1o=;
 b=T/4Jj5weAPrJBtS2EUIX1ouW+sbY0nxclnFJWiQyh0Jb7YUnSHxkTUMYqzZExtDpvC
 qX0asqHJgGEiJb7moZCw+qYhgFJrGbNLD8BS00Hk+W3JNrGyVbz+WLjuysbnnHwoALvR
 bVdAzc3/9LpR1c4NDmGblq4dO2+hsJFL+e9cTtMs7uqX0TXO98gvwSHF8QqnTOJhgaGc
 VmWnxoIFWBwydkQXwEtL9Y+ZPqDKq0KL48iyNm2+ZMzSMSZV2YPdxeDfcPh5iuzWwgNq
 B8rzGfsFW25lHQY33Oj+cMeYKJENjA3daovHFVPlG9UKg/94GiVjJ8+Iwk0AHu+61xgn
 VEqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYnUits5+zJbDmBt3doAWTbc+yKzX772JCSRX+3jOUfifU1O67y0032BJeU0kbGYM3s/7vLAqhH7k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybC+Wq+nDElhkmkeSndqQYywRTHwC8jOvIHZSwbnt1SY7gk8tW
 bzYqupBsD7C5XMiAJRuINVw2zwpcAx/1JWzVph8jJHDk5tj2vR5T0OPeHj5WCQVACOJsRzsQ2Hh
 Hm5TEf4MI7YtviYigJZrJtFM8xlkKL0o=
X-Gm-Gg: ATEYQzzAulOalfnOkhRmmiXqiQIu291XfsTQdD+0s6j7LJxpukfDRIpo3xDd92g8YQA
 X1dITSvlpkfBZrynoD+ZCRAfvLZTq1uCiU7lPr02fRJz5jR6mCKEk71fWhZHifxGC3jJCTEPN5E
 hX0pGmr5WXXJY4dEiMtnBiRV3ll6rxqvFFbf8JCIqVYRqeHz8KoYtJLvdkKTyhQ3sbXBbQUYa6G
 NxNYqw7eqIUf11Tf0pO4g88S8OLstPbwtIXxiEOdwQRbYfgu3p7mIv2ZcA5IHGQa4c6SuNTETOt
 P+nWFEbJF96IATR8XM6hNkg1q81O6UkGu3WJmnXE5BmCh5jSOIcPj0DtM6OlTGnqeDw=
X-Received: by 2002:a05:6214:d4e:b0:89a:424:984b with SMTP id
 6a1803df08f44-89a0a92c184mr46978966d6.31.1772574200143; Tue, 03 Mar 2026
 13:43:20 -0800 (PST)
MIME-Version: 1.0
References: <20260224224005.3232841-1-joelagnelf@nvidia.com>
 <20260224224005.3232841-5-joelagnelf@nvidia.com>
 <DGPPKJ5W6FVD.29LI1HKSBZSG2@kernel.org>
 <7b3146c1-ce5a-4bf9-9837-57c19b24ada9@nvidia.com>
In-Reply-To: <7b3146c1-ce5a-4bf9-9837-57c19b24ada9@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 4 Mar 2026 07:43:08 +1000
X-Gm-Features: AaiRm501GK9n8VvFP38XoGBcDXH4aTIuBWI3dYVSffrndOj8CyH9AOfQu1dTQI4
Message-ID: <CAPM=9tybjq8_ea+iJXxsWK+OXwExJNjBu50se036-9vhO+KodQ@mail.gmail.com>
Subject: Re: [PATCH v11 4/4] rust: gpu: Add GPU buddy allocator bindings
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>, arunpravin.paneerselvam@amd.com, 
 joel@joelfernandes.org
Content-Type: text/plain; charset="UTF-8"
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
X-Rspamd-Queue-Id: 0C59E1F7AEA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:joelagnelf@nvidia.com,m:dakr@kernel.org,m:linux-kernel@vger.kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:airlied@redhat.com,m:nouveau@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:acourbot@nvidia.com,m:arunpravin.paneerselvam@amd.com,m:joel@joelfernandes.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, 3 Mar 2026 at 07:19, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>
> Hi Danilo,
>
> On Fri, Feb 27, 2026 at 12:30:20PM +0100, Danilo Krummrich wrote:
> > >
> > > +RUST [GPU BUDDY]
> > > +M: Joel Fernandes <joelagnelf@nvidia.com>
> > > +L: dri-devel@lists.freedesktop.org
> > > +L: rust-for-linux@vger.kernel.org
> > > +S: Maintained
> > > +F: rust/helpers/gpu.c
> > > +F: rust/kernel/gpu/
> >
> > What about adding this to the existing GPU BUDDY ALLOCATOR entry? Maybe you can
> > offer Matthew and Arun your help.
> >
> > Also, this wouldn't be a subentry of "RUST", but the rust version of GPU BUDDY,
> > so it would be "GPU BUDDY [RUST]".
> >
> > Also, please add rust/kernel/gpu/ to the "DRM DRIVERS AND COMMON INFRASTRUCTURE
> > [RUST]" entry.
>
> Both these additions sound good to me. Just to list all the options below
> so we save time on what we all agree on:
>
> 1. New GPU BUDDY [RUST] entry.
>
> 2. Add it under the existing "DRM DRIVERS AND COMMON INFRASTRUCTURE
>    [RUST]"
>
> 3. Add the rust files under the existing "GPU BUDDY ALLOCATOR" and add
>    myself and Alex as R:/M:
>

Number 3 please,

Dave.
