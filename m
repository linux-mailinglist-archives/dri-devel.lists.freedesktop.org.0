Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E962DA26621
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 22:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A166B10E07D;
	Mon,  3 Feb 2025 21:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="gItr8kFV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5E510E1D5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 21:53:54 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so35067965e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 13:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google; t=1738619633; x=1739224433;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WuP2pJU8bBZXahLySdNlt2shroJTENQiUQtUnqJ4MBc=;
 b=gItr8kFV9gLtO8fJjNvmXXdDyqOf7mfLrDDEcKJ8huUkjS7H+rs8xvtIBSh/wiaCXd
 eBvJ6TFGbbG3wtnyORLc+GeKlpk/I1IRb/Wi2eObGk+5N2ZQKagZb42KF5pKBE6F8yHD
 KrHVgLC8UfBV7t002CMl0DynEuk+QjasksrYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738619633; x=1739224433;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WuP2pJU8bBZXahLySdNlt2shroJTENQiUQtUnqJ4MBc=;
 b=gZo3aEwDAh3/BSIgNaOKb4GEYYRDUrb6o2BHUEX4S6oTb2nBYoP/GMYywGXEA4s5v0
 ZT77yAOcG8ks5At84wsRLZXGk0u3qlAdMsEDRll/fodfhthn68EbsN1GQ8sxcIyw3y5B
 KZs3q/DgCWWskBz1KzpKDCKij4tNrxEG55Z+WMde9GNPxjXXOYYUXL7NK268K+I59iSH
 AxBnEIWVKvcH5eHaSc14EH2lweT4eKhXVTSGPjaD6yoPTIl7Z3Y3n+F/J7Qw3dfUZIQp
 tkgemAGHDvq1YHHMRmpA4VUC4oV3nHEjTy+tOFhGxTnQyuw4azA+MF4H6Imy9Cghyqyd
 iaxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUG6uQwRIlqfbG0ImHLP8abWQ+S4FSV84zd+FUqiln8iWRsdJlZZAOIjEKbIHiiwFfZDQYUVSKjUg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGPfUa1p+810GHMp9qxmAHl0km87XGIMrPkm7A7Q8cC5ZwkPVC
 Etj31GctC7k6gahCZVxkODEU47N++nfyPNpcCowBtJMV2Fdod5zbB9Z8MAoNeD5GdpUjYdOVyQX
 d2v9JS7iRE3tVsLLlSD8f4G7klKprUqF5RYeo7w==
X-Gm-Gg: ASbGncuA9RNn9g40DNEtD26/+c7azTGTTWT4HywxjCixx2xf71px6+rVrxLQJWBZJOF
 tKg6jGbQlTxZjB2SOcHHgtzoXb7qqVRGo5mzYji8zeMAmpQ1hg82ND127t4/lskFAyGnnaxDHDd
 8=
X-Google-Smtp-Source: AGHT+IFTT878gvRp7ddeyuzEmi6d3nVR7yt9pGw+C9SikTc7j0JfpLe79f9EX7kOwWILUEP0xX1xpi49VVK/vAEm5uc=
X-Received: by 2002:a05:6000:1445:b0:385:f573:1f78 with SMTP id
 ffacd0b85a97d-38c519744e1mr18589075f8f.24.1738619632538; Mon, 03 Feb 2025
 13:53:52 -0800 (PST)
MIME-Version: 1.0
References: <20250131220432.17717-1-dakr@kernel.org>
 <20250203202410.GA3936980@joelbox2>
 <34d7a6af-5974-482e-9f70-3f92a823bd96@nvidia.com>
In-Reply-To: <34d7a6af-5974-482e-9f70-3f92a823bd96@nvidia.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Mon, 3 Feb 2025 16:53:42 -0500
X-Gm-Features: AWEUYZl0JrUywsCdCfm9saD5c0m9P2P4l5rddBjbWCr91MZ6RR70sF-I7X6sYiw
Message-ID: <CAEXW_YRpjzGo2AJLFb_eAyi03pzSVGKJywxzQNatGnQTF4me8g@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpu: nova-core: add initial driver stub
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, airlied@gmail.com, simona@ffwll.ch,
 corbet@lwn.net, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 ajanulgu@redhat.com, lyude@redhat.com, pstanner@redhat.com, zhiw@nvidia.com, 
 cjia@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com, ojeda@kernel.org, 
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
 aliceryhl@google.com, tmgross@umich.edu, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 joelagnelf@nvidia.com
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

On Mon, Feb 3, 2025 at 4:00=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
[..]
>
> >> +        ()
> >> +    )]
> >> +);
> >> +
> >> +impl pci::Driver for NovaCore {
> >> +    type IdInfo =3D ();
> >> +    const ID_TABLE: pci::IdTable<Self::IdInfo> =3D &PCI_TABLE;
> >> +
> >> +    fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<=
Pin<KBox<Self>>> {
> >> +        dev_dbg!(pdev.as_ref(), "Probe Nova Core GPU driver.\n");
> >> +
> >> +        pdev.enable_device_mem()?;
> >> +        pdev.set_master();
> >> +
> >> +        let bar =3D pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("n=
ova-core"))?;
> >> +
> >> +        let this =3D KBox::pin_init(
> >> +            try_pin_init!(Self {
> >> +                gpu <- Gpu::new(pdev, bar)?,
>
> Here. Try to construct a Gpu, which tries to construct a GpuSpec, which
> fails out if Chipset is not listed, or if CardType (which should be
> renamed to Architecture) is not listed.
>
> And only Turing+ GPUs are listed. Turing is the first GPU that has a
> GSP unit.
>
> By the way, I have loaded this on a system with a Kepler GPU (pre-Turing)=
,
> and an Ampere GPU, and traced through actually loading NovaCore, and it
> behaves as described above.


Ah that makes sense, Thanks John!

 - Joel
