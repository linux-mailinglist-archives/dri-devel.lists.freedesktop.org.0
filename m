Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 908C36D5A9C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 10:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87A510E611;
	Tue,  4 Apr 2023 08:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA02610E144
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 07:42:16 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id g9so22829161qvt.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 00:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680594135;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lDMI70p/Qx2JVl34fHr9W5X4xmsW9s9zZJsUsj0SZQc=;
 b=T993r5eblXCvT06GT9ZVZbRjR3aYs3XG6Oy2yizyGTVHtnxohPsaS7SY4C5smWzkL8
 dwAhHkA2CevrwjOA/Y1dh/T/aKK7Ns/euuxt0XYrQm3djyGyPRo9d1m30KrdwQ17BWGO
 aKCtd6MzOnrqgXzFcjjM4PYmFNqLLkV8kqhM/uHT2tYVfm74f4UDJrCpjLDSSAXqrHLf
 rxrNVK2cRb6u9zdbFk8m71AI4BOZXD5h/oTtoHl+Re5rYrZnABKuuhkG9XtWM50DLQnC
 WxKV+2Ef4g91++BU8UJ38AzbcpDncCauyeOvD4cPmelmRc17dURoBnT5nnJ3nKDCXzAI
 0K+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680594135;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lDMI70p/Qx2JVl34fHr9W5X4xmsW9s9zZJsUsj0SZQc=;
 b=k0i5r7CJhyZusehp/Gw50NBXU84t/ggULdHZ9km5CZeqwgLmPsiEOCzZZzYtlcLfv3
 HBgUWQYxnTPVtmTm6cH8Wtzt+61oz8yqLBThUVv92hIs3Rld/nsCfQEwDLq9CAgsQaJ9
 RvWgGbiUIy03mTJnf+ft5HtOOtpJl+LPqw9ud/4w3WNhyisMzzlwYB/2uIrxtRctotjl
 vdX6j6r5FTLkK4S9bk515t4K2zYSffjfxEouX3GZum/G2SxB38pmaa/hiAFVpNQIY7cV
 vZUlgG1jaTiAmQUhfKBBQ2bw4/VbFsX/9Ne/V5pL8gLv/sXWhr890UT3qRmgVfsR+2g8
 JuBA==
X-Gm-Message-State: AAQBX9chISBHWzeClwazOH2AOZHfbBEm37C9X3a+197se4oqMqiKjEd1
 7D9uZ/unV+mKkDhAezIrAxE=
X-Google-Smtp-Source: AKy350a7AIirL2LCRCeg6Ayh0sxRvXwJm1kJOUFvTNEb9Qe/BfEBzR8SQUg6etn/sxviFzC6/snPSA==
X-Received: by 2002:ad4:5be8:0:b0:56a:b623:9b09 with SMTP id
 k8-20020ad45be8000000b0056ab6239b09mr2092833qvc.14.1680594135330; 
 Tue, 04 Apr 2023 00:42:15 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef05:8700:853c:3ba5:d710:3c1d?
 (p200300f6ef058700853c3ba5d7103c1d.dip0.t-ipconnect.de.
 [2003:f6:ef05:8700:853c:3ba5:d710:3c1d])
 by smtp.gmail.com with ESMTPSA id
 ne2-20020a056214424200b005dd8b9345c1sm3215323qvb.89.2023.04.04.00.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 00:42:14 -0700 (PDT)
Message-ID: <35805dbb85496d3a27872c578158c695c8bbb6b5.camel@gmail.com>
Subject: Re: [PATCH v3 00/11] iio: new DMABUF based API, v3
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, Jonathan Cameron
 <jic23@kernel.org>,  Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul
 <vkoul@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, Sumit
 Semwal <sumit.semwal@linaro.org>,  Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Date: Tue, 04 Apr 2023 09:44:18 +0200
In-Reply-To: <20230403154800.215924-1-paul@crapouillou.net>
References: <20230403154800.215924-1-paul@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 04 Apr 2023 08:19:57 +0000
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
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2023-04-03 at 17:47 +0200, Paul Cercueil wrote:
> Hi Jonathan,
>=20
> Here's the v3 of my patchset that introduces a new interface based on
> DMABUF objects to complement the fileio API, and adds write() support to
> the existing fileio API.
>=20
> It changed quite a lot since V2; the IIO subsystem is now just a DMABUF
> importer, and all the complexity related to handling creation, deletion
> and export of DMABUFs (including DMA mapping etc.) is gone.
>=20
> This new interface will be used by Libiio. The code is ready[1] and will
> be merged to the main branch as soon as the kernel bits are accepted
> upstream.
>=20
> Note that Libiio (and its server counterpart, iiod) use this new
> interface in two different ways:
> - by memory-mapping the DMABUFs to access the sample data directly,
> =C2=A0 which is much faster than using the existing fileio API as the sam=
ple
> =C2=A0 data does not need to be copied;
> - by passing the DMABUFs around directly to the USB stack, in a
> =C2=A0 device-to-device zero-copy fashion, using a new DMABUF interface f=
or
> =C2=A0 the USB (FunctionFS to be exact) stack, which is being upstreamed =
in
> =C2=A0 parallel of this patchset [2].
>=20
> As for write() support, Nuno (Cc'd) said he will work on upstreaming the
> DAC counterpart of adc/adi-axi-adc.c in the next few weeks, so there
> will be a user for the buffer write() support. I hope you are okay with
> this - otherwise, we can just wait until this work is done, and I still
> benefit from sending this patchset early to get feedback.
>=20

Indeed, I already started a discussion [1] since what we have now for=20
adc/adi-axi-adc.c has some major flaws (IMHO). So I'm hopping to get some
feedback/discussion to get "righter" from the beginning.


[1]: https://lore.kernel.org/linux-iio/dac3967805d7ddbd4653ead6d50e614844e0=
b70b.camel@gmail.com/T/#u

- Nuno S=C3=A1

