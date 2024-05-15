Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F568C6CC8
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 21:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C688810E87F;
	Wed, 15 May 2024 19:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora-corp-partner-google-com.20230601.gappssmtp.com header.i=@collabora-corp-partner-google-com.20230601.gappssmtp.com header.b="vIXQSdMC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3075710EBD3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 17:44:02 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-43df751b5b8so48272791cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 10:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collabora-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715795041; x=1716399841; darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=E0amurYLWKaRKPa/iEdq5FcEnj0UswhFN3sKXOxoIEk=;
 b=vIXQSdMCbnETqt/YwpBuLu3CfesVLRkV8LBpneXiL6FBVF56QeLBkkmb0k11RHxl+g
 NANRQ93JgqVoDF519QeXQFsDPHDvDO9gSZehFSWeqEO24Xqf9e54f2T4GuLz/Sh0rOuG
 jN0HmobOu64RGORVF8wSW0w8f7pAm+R9HdrMDUsfK8FiKRLD4XzpJmUIwIPxDl2Ut0Ai
 +ZnuZWgdZJ0lXzDaydAspVZAYWMyG8TsbpLmVlybHm0p2lbbEdjJlGeW/Vkb3a44ysIA
 14D6QUqwdd2LrkVXgrnj/2NxgI/CxOZkY7Ertc54VX2sz24Pqyj9eaOXaKrMdTnuLo3s
 E02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715795041; x=1716399841;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E0amurYLWKaRKPa/iEdq5FcEnj0UswhFN3sKXOxoIEk=;
 b=ZKq1f4L6NSs5zlR3Z6RDJdXk5SUJXZkOAH4SntnqpEzhRUgs49UytMkkF0jtlgYnr1
 ofxB3rA2MSgXFUB/Ze07nia4IK6DyvzS2cozDcCa0Ts11aUd28je60ndzZlKfPSTU+QW
 j/X92474BZ1TrHimaPfajqSiAs/KwbwSiBS2kk2ZkGjSMLUJn2eo+Af2Duga8ANdZjMX
 aXbAD4zXCaC0usNE/nm2bh5qlVsr0TvoKAQke6o30riEOCZrNQa5ilkqBxw2xM/Tk7Dh
 lLdWFKNbPQE90z81iOmku87nn7jbQeAgOpWk3eYYJq/HOK6jG3Gdh9xABqbIilUz/9mZ
 FSsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3lSL/QM2qjbvwhzTwnQG81JpOUUClWQrIJzi7Rms2aNvTgPufKnlgFJt13WS+J6BaaQsQvWMuOQTRQWg4AtZ7myWVk3fbEiRyTJOcBJLd
X-Gm-Message-State: AOJu0YxSCGFBoKNpWsdr4d11RFzynvXDz/3rwfCu+xEdBmtmJeBtX1Ue
 GpO2DhuvXI7+f1D/1dwMMqvpYuA2k+G/q9zWXGBny30aMTcrAKOXW3MRMbVJLBM=
X-Google-Smtp-Source: AGHT+IFtGcMXjpt3HsFnPe9OF16luEvqPVOtySj8IBH0wjxyNEhyn0setwNtXCb14ES3yOalUq8alQ==
X-Received: by 2002:a05:622a:1a96:b0:43e:3943:4379 with SMTP id
 d75a77b69052e-43e39434693mr20225301cf.19.1715795041568; 
 Wed, 15 May 2024 10:44:01 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:5985::580])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43e3a57b396sm2575901cf.24.2024.05.15.10.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 10:44:00 -0700 (PDT)
Message-ID: <a3428b0c352c24d43a2d458d41819fbf4b6cce0f.camel@collabora.corp-partner.google.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present
 users (udev uaccess tag) ?
From: nicolas.dufresne@collabora.corp-partner.google.com
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <mripard@redhat.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>,  Hans de Goede <hdegoede@redhat.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Lennart
 Poettering <mzxreary@0pointer.de>,  Robert Mader
 <robert.mader@collabora.com>, Sebastien Bacher
 <sebastien.bacher@canonical.com>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,  linaro-mm-sig@lists.linaro.org, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Milan Zamazal
 <mzamazal@redhat.com>, Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Date: Wed, 15 May 2024 13:43:58 -0400
In-Reply-To: <20240514204223.GN32013@pendragon.ideasonboard.com>
References: <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
 <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
 <Zjpmu_Xj6BPdkDPa@phenom.ffwll.local>
 <20240507183613.GB20390@pendragon.ideasonboard.com>
 <4f59a9d78662831123cc7e560218fa422e1c5eca.camel@collabora.com>
 <Zjs5eM-rRoh6WYYu@phenom.ffwll.local>
 <20240513-heretic-didactic-newt-1d6daf@penduick>
 <20240513083417.GA18630@pendragon.ideasonboard.com>
 <c4db22ad94696ed22282bf8dad15088d94ade5d6.camel@collabora.com>
 <20240514204223.GN32013@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 May 2024 19:25:57 +0000
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

Le mardi 14 mai 2024 =C3=A0 23:42 +0300, Laurent Pinchart a =C3=A9crit=C2=
=A0:
> > You'll hit the same limitation as we hit in GStreamer, which is that KM=
S driver
> > only offer allocation for render buffers and most of them are missing a=
llocators
> > for YUV buffers, even though they can import in these formats. (kms all=
ocators,
> > except dumb, which has other issues, are format aware).
>=20
> My experience on Arm platforms is that the KMS drivers offer allocation
> for scanout buffers, not render buffers, and mostly using the dumb
> allocator API. If the KMS device can scan out YUV natively, YUV buffer
> allocation should be supported. Am I missing something here ?

There is two APIs, Dumb is the legacy allocation API, only used by display
drivers indeed, and the API does not include a pixel format or a modifier. =
The
allocation of YUV buffer has been made through a small hack,=20

  bpp =3D number of bits per component (of luma plane if multiple planes)
  width =3D width
  height =3D height * X

Where X will vary, "3 / 2" is used for 420 subsampling, "2" for 422 and "3"=
 for
444. It is far from idea, requires deep knowledge of each formats in the
application and cannot allocate each planes seperatly.

The second is to use the driver specific allocation API. This is then abstr=
acted
by GBM. This allows allocating render buffers with notably modifiers and/or=
 use
cases. But no support for YUV formats or multi-planar formats.

Nicolas
