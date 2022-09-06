Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBDC5AE385
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 10:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CFA10E5F8;
	Tue,  6 Sep 2022 08:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2516410E5F8
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 08:53:54 +0000 (UTC)
Received: from localhost (unknown [151.19.254.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id BC3656D6;
 Tue,  6 Sep 2022 08:53:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BC3656D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1662454433; bh=U64JMGXBUPe/rjMxKId+7kfdVmV5H1yEQOvihO0gvi8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pSlGHOirOVXiWeeAe2zmYD1aw2cIr79HhSif7hs4Nhzn38Dqs9Otwx6hImJZ6Pimp
 O3+UeSjlgAwV7yeL8yVgGM7X35uD6aBuxn91BcCCI5RqBtYG58HmYXA9vS2eVA3Aub
 uC1jA+X7TSlhaU1+VWBXX7Ko9L0e1PbCblTMSxSKo5iOdL1g0v6Y2U3It/IU0QB5VE
 AZp6CR0A+kXtOdJLq79gVigR7+Tg1D/i1GNE7Co2kYGu9COdEdr3m6oaxQg003D4uf
 5dJ3W85jqxn1oeqtBI2bSss87BXTpsADeqJ2wuMhOGiFaqIlLcdhJpktVu9E4l10va
 CRPh0M4wd7fLA==
From: Jonathan Corbet <corbet@lwn.net>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, Bagas
 Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH] drm/doc: Custom Kconfig for KUnit is no longer needed
In-Reply-To: <20220906081211.i6r3fhopkd76w7vw@nostramo>
References: <20220905184711.391022-1-michal.winiarski@intel.com>
 <0131b046-a891-2fae-d2a5-6510455c3449@gmail.com>
 <20220906081211.i6r3fhopkd76w7vw@nostramo>
Date: Tue, 06 Sep 2022 02:53:48 -0600
Message-ID: <87v8q09943.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: David Gow <davidgow@google.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Micha=C5=82 Winiarski <michal.winiarski@intel.com> writes:

> On Tue, Sep 06, 2022 at 08:37:00AM +0700, Bagas Sanjaya wrote:
>> On 9/6/22 01:47, Micha=C5=82 Winiarski wrote:
>> > References: commit 6fc3a8636a7b ("kunit: tool: Enable virtio/PCI by de=
fault on UML")
>>=20
>> Use Fixes: tag for bugfix patches instead.
>
> Can documentation update (when the referenced patch didn't touch the docs)
> really be treated as a bugfix?
> Or is it just a reference, validating the reasoning behind this patch?

I kind of agree; I'm not sure that a Fixes tag is really warranted here.

Thanks,

jon
