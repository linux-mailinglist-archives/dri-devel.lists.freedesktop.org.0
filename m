Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7FB844AC3
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 23:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6EB810F714;
	Wed, 31 Jan 2024 22:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE6A10F714
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 22:08:28 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-40ef9382752so17585e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 14:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1706738847; x=1707343647;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VxGRQtTivmWoKuFadnWNImbg21dR/diu+Neco1gJfcY=;
 b=RFFAsMwb8hY/nyMoVBLa/ReK2M2CTP6luMBiIWblrpJfnV33lkTVU7Z9oljry6kDjp
 pYI3siscC0M/1EQxHEbbubQ8uBw2Km2SV+C7uKhtANL2Kn2lBrtN8cVYQRd1bZZIcc5P
 /0V66Jhcd9wyRa+lKZvMwtllEcK+hYq9DrgTd9XESN9xdni4ch87N5Wiqco6e42PrpBC
 zJWQu1VYKYzBxt1i/VD4m8vSEarm3sdKKDLXMdG/RmdZB9xuTSOla/luimuNEUTHzkcM
 Da+hWye1YBQlPvKpk8b9jE7u/C/dvdxaOdTbDSkV7s7J3CwtvhbRxdftzppqVrpppaGM
 MTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706738847; x=1707343647;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VxGRQtTivmWoKuFadnWNImbg21dR/diu+Neco1gJfcY=;
 b=njiJa+b/FKFNVYE5LHeTI1o8JrIfXU5xnfzm1+LHMTsVuGmLQhrqWTyZPYWgxmfros
 Hh8yhxvE9IzpziRSKFaSQ6dVH9S8q1DDiKsuMxug+g8quO9MqcuuOXVWY+ONF3sxVwN0
 ReX9Oy//ofiAp2QNcR6vjkN7Z3Vjcngg+hTjgnRWHAGnpgipX0HvjmDiBauJ/EVMsfk1
 Ako2KlvLND2XLRbA9zPbiaVMCfS/vbES/HfdeAaE7YFkx57apGz8+2SRniM796fifLiF
 L+mRQWL9xUeTuGUsjaSoKg1LKXkiQfOD81rmvalayuRQpAxd+iAlQHhzKM9As7txw7wZ
 SqRQ==
X-Gm-Message-State: AOJu0Yz4T/RlwWiggZPQr14s6uy1nAV2pa3b/bM3FZmCX4aR3n5KBe6E
 uHgfsvoXpeprunj57xQkxraDm1iJfp6jrR12sPcr8eFoySFkJWhOvuRD79Bm3XvK2kqxpPnCiW0
 11gbpkZ/Gh3MnJ/OAqE3vatsp9crydb1MG6o=
X-Google-Smtp-Source: AGHT+IE/2Dxf4agbwoKTbMQd8Mnstjn4gRLtOYMhgr/arfVgtxcTfa+Kk1PDbnEzzrNLU0B/ZV7z7fa+Npsy3Ek/Uvk=
X-Received: by 2002:a05:600c:5026:b0:40e:e7ce:da68 with SMTP id
 n38-20020a05600c502600b0040ee7ceda68mr66122wmr.0.1706738846818; Wed, 31 Jan
 2024 14:07:26 -0800 (PST)
MIME-Version: 1.0
References: <20240112092014.23999-1-yong.wu@mediatek.com>
 <20240112092014.23999-4-yong.wu@mediatek.com>
 <CANDhNCrxpeqEhJD0xJzu3vm8a4jMXD2v+_dbDNvaKhLsLB5-4g@mail.gmail.com>
 <CA+ddPcNdniUTpE_pJb-fL7+MHNSUZTkQojL48iqvW9JPr-Tc-g@mail.gmail.com>
 <CANDhNCqieBaH-Wi=vy3NSKTpwHcWef6qMOFi-7sgdGiDW7JtwA@mail.gmail.com>
 <CA+ddPcP9bgApNw_Nu7bxcV-oK_s3Bq1i5qun+vNSuRUO9tPEkA@mail.gmail.com>
 <CANDhNCrGxhHJLA2ct-iqemLAsQRt3C8m5=xAD3_dDdKH6Njrdg@mail.gmail.com>
 <20240131141523.yh74hsddtuooqfgi@pop-os.localdomain>
In-Reply-To: <20240131141523.yh74hsddtuooqfgi@pop-os.localdomain>
From: John Stultz <jstultz@google.com>
Date: Wed, 31 Jan 2024 14:07:13 -0800
Message-ID: <CANDhNCqKPmo-RUd6RRRS2=ZJHqyy40G9HE=6_cAyop1CN2xOgw@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] dma-buf: heaps: restricted_heap: Add private heap
 ops
To: Joakim Bech <joakim.bech@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, Pavel Machek <pavel@ucw.cz>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>, Yong Wu <yong.wu@mediatek.com>,
 jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linaro-mm-sig@lists.linaro.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, tjmercier@google.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 youlin.pei@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 31, 2024 at 6:15=E2=80=AFAM Joakim Bech <joakim.bech@linaro.org=
> wrote:
> On Fri, Jan 12, 2024 at 05:23:07PM -0800, John Stultz wrote:
> > So we need some clarity in what "restricted" really means.  For
> > instance, it being not cpu mappable vs other potential variations like
> > being cpu mappable, but not cpu accessible.  Or not cpu mappable, but
> > only mappable between a set of 3 devices (Which 3 devices?! How can we
> > tell?).
> >
> Can we flip things around? I.e., instead of saying which devices are
> allowed to use the restricted buffer, can we instead say where it's not
> allowed to be used? My view has been that by default the contents of the
> types of buffers where talking about here is only accessible to things
> running on the secure side, i.e, typically S-EL3, S-EL1 and a specific
> Trusted Application running in S-EL0. I guess that serves as some kind
> of baseline.

? This seems like you're suggesting enumerating badness? I'm not sure
I understand the benefit of that.

> From there, things turns to a more dynamic nature, where firewalls etc,
> can be configured to give access to various IPs, blocks and runtimes.
>
> I understand that it's nice to be able to know all this from the Linux
> kernel point of view, but does it have to be aware of this? What's the
> major drawback if Linux doesn't know about it?

Indeed, it doesn't necessarily. The idea with DMABUF heaps is it
provides a name to abstract/wrap a type of constraint. So you can then
allocate buffers that satisfy that constraint.

Admittedly the downside with DMABUF heaps is that it has a bit of a
gap in the abstraction in that we don't have a mapping of device
constraints, so in Android gralloc provides a device specific
usage/pipeline -> heap mapping.
(Note: This I don't think is very problematic - I often use the
example of fstab as device-specific config everyone is comfortable
with - but I know folks would like to have something more generic)

I believe Christian has previously proposed to have the devices
provide something like symlinks from their sysfs  nodes to the heaps
the device supports, which is an interesting idea to mostly close that
issue. Applications could then scan the devices in a pipeline and find
the type they all support, and the specific names wouldn't matter.

However, I'd expect the same hardware pipeline might support both
restricted and unrestricted playback, so there would need to be some
way to differentiate for the use case, so I'm not sure you can get
away from some heap name to functionality mapping.

My main concern with this patch series is that it seems to want to
bundle all the different types of "restricted" buffers that might be
possible under a single "restricted" heap name.

Since we likely have devices with different security domains, thus
different types of restrictions. So we may need to be able to
differentiate between "secure video playback" uses and "protected
device firmware" uses on the same machine. Thus, I'm not sure it's a
good idea to bundle all of these under the same heap name.

thanks
-john
