Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA699E612E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 00:18:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DAC10EFD5;
	Thu,  5 Dec 2024 23:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="NDy6Uppj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B4410EFD5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 23:18:12 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-aa5f1909d6fso286242966b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 15:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733440691; x=1734045491;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ABRkDj2N+QkWL48IvhN2/HmURfPPjhYtD6+wjCTrDIo=;
 b=NDy6Uppjh7Rgh/SIXDM49+7IWkj2hJXIh5nQP7JlL+hGNGBx3p9W2AM5sFQZbr/iCh
 wsNLuXXkCYlS3ahtuPUw9mqugsb0fD3Z0cU5fx2qVV012Nk4UvSzbaVeT9JQshw190F3
 gZzUchJsZiEVHSmpCFV/3BDSsZLQ1kotIRsP9miWTA5d97B9Q6PGIDjYx5CJ98vM0p9A
 WaFqUfm8VAZ3hd/n+owFPlWUIHwc9ZAY3j9QjLsj+NR6+BU72m/gxmdhNHx21vREIo91
 1GIwe/Se1DLGR/oCBdblRUarVUHd3XzwwUItzPcjaXTDsmjPfRvv3zvGhnBvSOF+1jZp
 LVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733440691; x=1734045491;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ABRkDj2N+QkWL48IvhN2/HmURfPPjhYtD6+wjCTrDIo=;
 b=KnGFWgygr1D1J/Jk7ibo+PmyGROWx/rjf3LYQpuAg4IgejkVcPgD92FJmZE7Q6jNti
 4PFvrMNiEN2umECgWho2NQlf2I9dHwHuBqZuMHrDYvNK2KA+pNTiNkUX8pIa7Z6UgAQh
 Uqg7z4bYzk6wSpVlci7GHN+r9LOzz1+WBPjnVewO18Sjg+M4qnHeW9173kfhoaomIriT
 /cnY4x/a23rbi6xOXgODtjup76y0MHh1HvQulaKe480TDiSi3Eop0IxGQq81WfH+kuoM
 1nhJEyojH5qyR6D2PZDj1dSk6m7qvAhd8nARBgvpxOtT5ZDGbGt68vGhuc7tpTSbfbn8
 Oj1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTt1vdB6hROxpDTqrAF97a9VgGH3ac8A03cPlTKspLCErreWwmpUvGHLl5hkQhDJuUAW4u0nKhsoI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQ3fDpJTuekvjpwwP1quxPwUl6Ly5eYP4C96QrsOdTS6GcOEwb
 wwM8AVS6n7p7V4sFZLG9LnWIx6AEfOgSQDFo+pBa1DP06cJ5/KvizUVwr3RxuWPJLlo61qy5Cfk
 1LD2HOR9cNVhuuEsaCwcQPiFJilvXraKtIbo=
X-Gm-Gg: ASbGnctpVmCB31uXFOJ73DoeLvVnHZ48xIrsXPZ7N0gVQK9rCWxKUojGwZjBBD8+uoQ
 oTEuBSviWCde0y+83pQNwLxB9i+Dw/yms9YvOcq1h5XcA6t1tU3FI0GVy93HF
X-Google-Smtp-Source: AGHT+IFp8XCFg1lEU3e1fi+fHUhDavDNkEfjadO/eMfIJfRp5lhMaScdyBmt/tCjFNB2PINDghB3+C6LC7IZg7++n4w=
X-Received: by 2002:a17:907:3a57:b0:aa5:2bab:69f6 with SMTP id
 a640c23a62f3a-aa639fb37fbmr47238966b.8.1733440690804; Thu, 05 Dec 2024
 15:18:10 -0800 (PST)
MIME-Version: 1.0
References: <20241202115827.50388-1-mripard@kernel.org>
 <CANDhNCpTnc6=YkjQgQngRCw1_xLWgOFrcjTxrrGX+bRhvGb5DQ@mail.gmail.com>
 <20241203-cerulean-ringtail-of-speed-920c5f@houat>
 <f6412229-4606-41ad-8c05-7bbba2eb6e08@ti.com>
In-Reply-To: <f6412229-4606-41ad-8c05-7bbba2eb6e08@ti.com>
From: John Stultz <jstultz@google.com>
Date: Thu, 5 Dec 2024 15:17:57 -0800
Message-ID: <CANDhNCqtMUaO4Y_7UYGJebDEdN==vTAQRexuuek5SZt5rqd8sQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: dma-buf: heaps: Add heap name
 definitions
To: Andrew Davis <afd@ti.com>
Cc: Maxime Ripard <mripard@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-media@vger.kernel.org, linux-doc@vger.kernel.org
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

On Tue, Dec 3, 2024 at 11:04=E2=80=AFAM Andrew Davis <afd@ti.com> wrote:
> On 12/3/24 1:44 AM, Maxime Ripard wrote:
> > On Mon, Dec 02, 2024 at 11:12:23AM -0800, John Stultz wrote:
> >> Hrm. I'm not sure I see the value in enumerating things in this way,
> >> it seems like it will be a nuisance to keep current?  Maybe something
> >> like:
> >>
> >> On most systems the default cma region is named "linux, cma" or
> >> "reserved", with a few exceptions:
> >>      - Allwinner sun4i, sun5i and sun7i families: ``default-pool``
> >
> > I'm a bit worried about doing so. What if, on a "linux,cma" system, we
> > have another "reserved" heap created with different semantics?
> >
>
> Having the "default CMA" heap get its dev name based on the method that
> created it was arguably a mistake made when first upstreaming this heap.
> We should fix this, then maybe add the old name as a link just for
> backwards compat as needed.
>
> exp_info.name =3D "default_cma";
>
> All other CMA and carveout heaps will have names based on their
> method of creation as there may be multiple of them, but there
> will only every be one "default CMA" area, and its heap should
> be named to match.

This seems reasonable to me. Maybe putting the link creation behind a
compatibility config so they can be later deprecated?

That said, while I understand the impulse to want to fix the heap
names so applications can depend on them, I also want to caution it's
a little bit like trying to hard code eth0 as a network device name in
your scripts.  There are too many potential configurations, and any
fixed mapping is going to break in some cases.  I think there is just
going to have to be some (gralloc-like) device-specific configuration
glue to map a pipeline/use-case to the memory type (similar to fstab
for filesystem to mount points) in order to handle every case.

So if I'm being a little squirrely on fixed names, it's mostly due to
wanting to avoid anyone getting the mistaken impression that fixed
mappings will generally work.

thanks
-john
