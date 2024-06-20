Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C119B9111DE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 21:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548C910E008;
	Thu, 20 Jun 2024 19:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n/sj23vs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9CD10E008
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 19:11:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C0F2BCE28B6;
 Thu, 20 Jun 2024 19:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D48AC2BD10;
 Thu, 20 Jun 2024 19:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718910716;
 bh=PHJYBUwMx9MsppvbS5e3PTjqE/Je4d+7DMUX9BJflTM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=n/sj23vsn1PWHoed17H0pABW4prh3E3LTezhve35uy3Sdmj0kFptQMqKyozm16g+A
 6idpJFvmOkQcOxtMGifHN0Pid1fCKQ1JyJXgushJhM4smjPvwB++4/IN0gjt1EtlWK
 JL/D1flZA/51Zf9CyXqQ+u9fz6+2AR9z2eaKb3JVawSD6YzNa1uqFYngRGgXnfUQoG
 9AULJwTpjghTEH3Y+h3oruJow/Oz5QdkaLVXbx0lHzAF1PYckOuQR+XIqQfgKhDy0C
 jTQF3ZVVzpd2cQKtt1BsWvPNzKm1hs4AgZHAVA8QBMxe7ZtWzr3RHMx5topRAqDciC
 XqS187DxFpadw==
Date: Thu, 20 Jun 2024 20:11:50 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>, Lars-Peter Clausen
 <lars@metafoo.de>, Sumit Semwal <sumit.semwal@linaro.org>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Jonathan Corbet
 <corbet@lwn.net>, Nuno Sa <nuno.sa@analog.com>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v12 0/7] iio: new DMABUF based API v12
Message-ID: <20240620201150.72c11599@jic23-huawei>
In-Reply-To: <ZnRW2axOg7gtKzz0@matsya>
References: <20240620122726.41232-1-paul@crapouillou.net>
 <ZnRW2axOg7gtKzz0@matsya>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 20 Jun 2024 21:50:41 +0530
Vinod Koul <vkoul@kernel.org> wrote:

> On 20-06-24, 14:27, Paul Cercueil wrote:
> > Hi Jonathan, =20
>=20
> Hey Jonathan,
>=20
> Assuming we are fine with this series, how would you like to proceed.
> Would you be fine with me picking the dmaengine bits and providing a
> signed tag for you to pull?
>=20

Hi Vinod,

Yes. That will work nicely.
=46rom my side it all looks good.

Thanks,

Jonathan


