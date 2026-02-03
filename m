Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLoGF4Iygml5QQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 18:38:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE412DCE47
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 18:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B6110E118;
	Tue,  3 Feb 2026 17:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="3P45YdrJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E0010E118
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 17:38:06 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6581551aa88so128a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 09:38:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770140285; cv=none;
 d=google.com; s=arc-20240605;
 b=CKptjVGAFi6XA83ZXO+AjkPioCt2pg9Uoe14l1m2RUsSHKHA5k7m/6VWR6gIkSeBhW
 OCJzjaobIslQ1F4uDsgjtBXRK3tgjHfZMOT8+ov6tEkwf5NFytH1vpEQQGmE4B9DuoK1
 rh+7uTBbSaw8PMrWFvjicqSSs8oP5fi3FQlNAA8DIrzQidtB5FfrUcwj9mqV0LJNABL2
 2TqTm5oEkgzDLF4gBtkaBV/djzEQvI3eiUAkhDCxh6dYArtxz4mqEGUa/CupBh5u9DSH
 KVpmTeJEdf4qf5pdfAyaPlhxZ3aHEnheRS+UUBUss8sLNKALXqnj0/1NSi8WyD456oaE
 303g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=j4q33YjRLQ15ajYRux/jBaFbRViw55ylugUQtfD14xM=;
 fh=/T8UZkGDOAM8B6vnzjW+tDGA2wpyCSUbXIeZm5QYxn8=;
 b=N3fC3aZrIVmJUkay2E4es+SA0gB0w0KFYDMsm5jS2bl9D+0SljaK/ck0P9kxmrO3yt
 1CKCww4YBoZB9aJ10aMSPSi9jTrjAmmzBefMq3QnkEipl7yfcdqLu0I+zKzi8txomz5I
 fD//gUZkFFUKoc2d18jkd0me6rax4qrdXPC/zXSkstVyUKmTiWpnNhMW8Mm/FIa32JwW
 sp5yLLapEp1u3B0O4l6P+H5FC9Vwsn28/LyK0P1NcfNRL9CwUa7iQs/oVGEslpcmzoTI
 WCjVzuotSqAfje1Xjz16nbXtq7biw1zg+tLPgjdji4paoxuVFtjbFpPuXXgNkPSuOLGu
 kCjQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770140285; x=1770745085;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j4q33YjRLQ15ajYRux/jBaFbRViw55ylugUQtfD14xM=;
 b=3P45YdrJap2u7hZwkYhr5iBSDwoZXfRFpAt++C7+5/K//Vui/Wx4C5ZQ9rh2gM/+Qy
 L5ixdGTos/yWtNRu/B44cSEHyCai9ZInPWrPni6StdMN0nwJ6pBYVzSsKlci9UxHpxKA
 JhZIo6zpqbLYfl0ciqd5efLINLytv82tWUNXJXnXhT8MRQKjqXhLDaG7u7RpKhcTxqr4
 IO/Hvhiq6fAy0mJndF8vM6nFPE/TnLZR2jQm2zHlpY9KBXmAARlR9pj/jzazhNf8swR1
 By+8/QbJFtanOddkPOwzjJWwEl/hrkv408k0NfK5Dnp3DxS5DnmqBsQVDcs/215XqXRN
 2Y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770140285; x=1770745085;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j4q33YjRLQ15ajYRux/jBaFbRViw55ylugUQtfD14xM=;
 b=XOfEANsnXlXWVoOPVmWFcqzDVWRVaeY9VT39zCb77qHg0V6nspqyZ8O7HLGtvyrr/y
 //dcvOY1LcbVE39RFrwitEDO/viKUY0hr8vcQca6TBqfTecXNBzio/AG+KG6BKhzbjn1
 yk3RYiDJ+mfjgMJczBcPQgj/sEX/QV174rkDOdVYhSUR71f/fJd6tfIZ55hp20iDquSK
 RC7aHXMIhgt2XHCQY+Lw/o2hBHAkSD524BekpWqrVdgmhnfNzAkSLT2oFa/QNowVPl5p
 9BZo6V4pTFTGS3Wdb/seavVfpjbh/niRCbixQjXR8znhJlJQKpY3yKRTNxYnuMRPa15V
 bugg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUf7TjCnXooUeJe+50tYviNNP04Pqs2v4UZ7n6oooOrlrdOuJND26xZbZ3njBue9+pJB21jeWpBmaM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwUbaX+uRUKTewPm2R8s6FaVNYuf2FuGY42F2bpTbP5p1NoxnJ
 HITYcHvkdkFAY4DVSEeucgVsac+5eJEE7asDow47A9nt4EnH4UM+0UfV7M3s2BxHuCnTFeMR9yv
 ljwaN2HzoGuy3fXLo6oNOwG10JvbZ0pICDxUOqWdl
X-Gm-Gg: AZuq6aIMvIAipC5ikp4F0st+jYooqwItwmUSAXgHOcOPkHooQ/3kggbY7QUdMV4Buqt
 +tfGcDPweho3SZt2q4CsmW1870BEdBhN+fhIQVO39gIRcYel60alP0e9ZmdmOiA1fx4vqPOhxoT
 8Gqvf+kb5p0daxmj4SUzDFLmBbof4EyM7FVlj1vk6UiIrljT0+HfkJAqtflWtLNPBLN1zJx6FRb
 hjcy1n9rUUgdBSJHdU4PRUGAWN/zpJinTgdjNx7rjbTrCyepyu0R2KsAV5lSB1lcjrwEwleSFRA
 VsqVbbtJAHVXM6uQSmrbejsb9A==
X-Received: by 2002:aa7:d355:0:b0:658:bd2d:929c with SMTP id
 4fb4d7f45d1cf-6594a33abd0mr5612a12.12.1770140284581; Tue, 03 Feb 2026
 09:38:04 -0800 (PST)
MIME-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
 <20260203-qcom-socinfo-v2-6-d6719db85637@google.com>
 <2026020315-conch-trickle-2d84@gregkh>
In-Reply-To: <2026020315-conch-trickle-2d84@gregkh>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 3 Feb 2026 09:37:50 -0800
X-Gm-Features: AZwV_Qib0Xwq7jvSK8YoP13KkCRLNUErONN49KXCI4YsJMCfMFPdjadu_r-_mhs
Message-ID: <CAGSQo03Ok1sv4myQk2Ch68rET19ypq4Mm-=82Ue-T-2Z8kaGmA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] soc: qcom: socinfo: Convert to Rust
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Satya Durga Srinivasu Prabhala <satyap@quicinc.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
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
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:satyap@quicinc.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:m.wilczynski@samsung.com,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:tsoni@quicinc.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-pwm@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,quicinc.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,ffwll.ch,samsung.com,intel.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
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
X-Rspamd-Queue-Id: AE412DCE47
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 8:28=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Feb 03, 2026 at 03:46:35PM +0000, Matthew Maurer wrote:
> > Convert the socinfo driver to Rust for a number of improvements:
> > * Accessing IO mapped regions through the IO subsystem, rather than
> >   through regular memory accesses.
>
> That's good, but the C code could also be "fixed" to do this, right?

Yes, nothing stops the C code from being fixed to do all of this - all
of this is representable in C code.

>
> > * Binds the device as an auxiliary device rather than a platform device=
,
> >   ensuring the mapped IO regions cannot be accessed after the smem
> >   device is removed.
>
> I'm all for this, but is this really an aux device?  What is the
> "parent" device of this aux device?  Where are the "siblings"?  What
> does sysfs look like before/after this?

The parent of this aux device is qcom-smem. In the prior
implementation, qcom-smem loads this device through
`platform_device_register_data` and `platform_device_unregister`,
holding a reference in its global struct to release it when being
released. The probe table for the qcom-socinfo driver was empty, so it
would not probe without an explicit registration.

>
> > * Adds bounds-checking to all accesses, hardening against a repeat of
> >   CVE-2024-58007
>
> How do you now "know" that the bounds checking is correct?  The C
> version also had this, it was just "not correct" :)

While it's technically possible for the Rust code to have an error
here, the error would not be in the driver, but in the kernel crate.
The advantage here is that the bounds checking is all centralized, so
we get it right once, for the entire kernel, instead of needing to get
it right every time.

>
> And which accesses are you referring to?  From userspace?  From the
> kernel?  That CVE looks very odd, it's probably not even a real one and
> should be revoked, right?
>

That CVE looks like this:
1. qcom_smem_get returns an object of size N
2. When initializing the `serial_number` field of
soc_device_attributes, the offset of the serial number field was
checked as <=3D N, rather than the *end* of the serial number field.
3. This resulted in the driver exposing through sysfs whatever data
was mapped afterwards, interpreted as a number.

I agree that the severity seems oddly high, given that in practice,
this will expose the remainder of the IO mapped page - I don't believe
it crosses a page boundary, so it can't even *really* leak anything.

>
> > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > index fef840b5457407a85051ded0e835430dbebfe8bb..dcea2d7f37067b0b6f801b3=
d2b457422ad9f342c 100644
> > --- a/drivers/soc/qcom/smem.c
> > +++ b/drivers/soc/qcom/smem.c
> > @@ -4,6 +4,7 @@
> >   * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
> >   */
> >
> > +#include <linux/auxiliary_bus.h>
> >  #include <linux/hwspinlock.h>
> >  #include <linux/io.h>
> >  #include <linux/module.h>
> > @@ -279,7 +280,6 @@ struct qcom_smem {
> >       struct hwspinlock *hwlock;
> >
> >       u32 item_count;
> > -     struct platform_device *socinfo;
> >       struct smem_ptable *ptable;
> >       struct smem_partition global_partition;
> >       struct smem_partition partitions[SMEM_HOST_COUNT];
> > @@ -675,6 +675,32 @@ static void *qcom_smem_get_private(struct qcom_sme=
m *smem,
> >       return ERR_PTR(-EINVAL);
> >  }
> >
> > +/**
> > + * qcom_smem_get_aux() - resolve ptr of size of a smem item
> > + * @aux:        an aux device that should be our child
> > + * @host:    the remote processor, or -1
> > + * @item:    smem item handle
> > + * @size:    pointer to be filled out with size of the item
> > + *
> > + * Looks up smem item and returns pointer to it. Size of smem
> > + * item is returned in @size.
> > + *
> > + * The caller may take the loaded state of the provided aux device as
> > + * an acceptable proxy for this memory being valid.
> > + *
> > + * Return: a pointer to an SMEM item on success, ERR_PTR() on failure.
> > + */
> > +void *qcom_smem_get_aux(struct auxiliary_device *aux, unsigned int hos=
t,
> > +             unsigned int item, size_t *size)
> > +{
> > +     if (IS_ERR(__smem))
> > +             return __smem;
> > +     if (aux->dev.parent !=3D __smem->dev)
> > +             return ERR_PTR(-EINVAL);
> > +     return qcom_smem_get(host, item, size);
>
> So you are returning a void pointer?  But don't you really know the
> "type" of what is being asked here?  It's a memory chunk, so u8?  Or
> something else?  void * feels "rough" here.
>
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_smem_get_aux);
> > +
> >  /**
> >   * qcom_smem_get() - resolve ptr of size of a smem item
> >   * @host:    the remote processor, or -1
> > @@ -684,6 +710,9 @@ static void *qcom_smem_get_private(struct qcom_smem=
 *smem,
> >   * Looks up smem item and returns pointer to it. Size of smem
> >   * item is returned in @size.
> >   *
> > + * It is up to the caller to ensure that the qcom_smem device remains
> > + * loaded by some mechanism when accessing returned memory.
>
> What do you mean by "loaded"?  You are saying that the caller needs to
> rely on this driver remaining in memory for that memory to be "valid"?
>
> If this is the case, why not take a reference count?
>
> > +impl Smem {
> > +    pub(crate) fn access<'a>(&'a self, dev: &'a Device<Bound>) -> Opti=
on<&'a Mmio> {
> > +        if *dev !=3D *self.dev {
>
> How can this ever happen?
>
> thanks,
>
> greg k-h
