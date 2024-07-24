Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE0893AD29
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 09:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7714110E200;
	Wed, 24 Jul 2024 07:30:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="MxwgKRJL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD9C10E589
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 07:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1721806223; x=1722411023; i=markus.elfring@web.de;
 bh=idiJEVgGqWmot7ALwqNea99TLDPJ+Anm280Dzw8mH1A=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=MxwgKRJL0x3y8YzOyL0jzhNrxX/vek2oHGzIxZDrVvd9lKbkaySi0kFNdLIvxBr6
 07GrpCNVgDeJHcaAVrHpU8tqd6Er35rhFGr2q1uHajsSsToXBjVl2K8He39qb6ugo
 F12BPS6Xm+lhcNGB2va/ebPS0+m7g6Q013qqOhuGCTHGa+MOm82HVOzKaSUJjWdeu
 Ppy957ZhSJCDYEUPC5kxqkMWVmEfULKAup8ipazhw1Yj9He8Bx4XC5zGdeWL0P9qR
 ajdK4sHRIcj14yYiAkzohsahOA5pa5mVNu1aa2vIg3LJXH9mRMnG3MM8pRwbpLXsf
 lml7R1UGCrIzdn7Y/g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N1d7i-1s8DDD27K4-011RPD; Wed, 24
 Jul 2024 09:30:23 +0200
Message-ID: <b3f75c6c-6c3e-41ee-92b9-ac5d9cca53f8@web.de>
Date: Wed, 24 Jul 2024 09:30:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/loongson: Introduce component framework support
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240723183436.216670-1-sui.jingfeng@linux.dev>
 <20240723183436.216670-2-sui.jingfeng@linux.dev>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240723183436.216670-2-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8pTqHdI8f84MUOrOeomV1gClWCxBPTB0r9HEpO7Fv3ot86jPeK7
 CS0hMyYWor1qvGP+hwcvZBMdozsAgmaicP4PIt/+z9QMCuCbrfBCTxstLinqFyQwzY8Bmm0
 edsbd54VpK2gQMAWDMPpYADHjzm1Z8JsKGtQjn4plLha6B7poB4Q7r5IVWs8doSZbTdsjRq
 Ob+vS3IWzZFrc75UjrWMA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UmzbbpJucno=;z4v+NHdZ83Y3e7cyoDgnBFIQBrI
 ICn4YGt1fInAGxsZnw3VyS7BHrQDEjVzcCvvUJUiyj6BgvVCYmJhUv55WDWdwm+HMzobAfDKi
 /uLpRqngf+jHCtKY0uUha/E2LO/jZik7hW/9o8IfRfCHTaBmrRholArKo6joApgcXIOO8SxUn
 t1hcbabnJYF2ZlzBGqOLwEVyaj3rH40bekFSZLb6YFsND1mcqv1JleC3PbuthA3Us/w/hAM+B
 qYoISRFwZGM/ehgkZ35FI8eNyGX+ZBbhZXMLDyV6fUZYfKNGis45pUV1QsupQVahn5n2Tv0+e
 OZBrVsmdliiJr5qn039YICT6OUwophxS9uDENSZPMfLIoLsRCkabXmenAYs5nRoKe70DCNWie
 aQzk9rIM8mMOfOOtsWRFaK2CByuK3MwPWYWRvb64hQe4wze+5wxApM5N0U7Mk+QGnT4RPMJr9
 OfZJdOTyDwti844ciLm93jEyi6+C8g1PlwlbI4m0ygRtIYCzBAEgDDFCbC+a5KcvNsS91knE8
 oj/3ub2NmfyMFzHg/VNLV9lZ+ReoC1YUwXiiKQpezFWYPF+sW/ubtoHX1ITtSDBXWm4Nzx4WN
 uSZdoI6POy3vUhFajl4wxeF7NuMetTm5ygyhw/73ZADOpfYmklZ0PVeK9eSxXtO7bxXSHYkPL
 Qgkcwvq7rx7YdljSXyPeQRpBsXg7Ubn8NTpySQm3W6RCRuWzS33AllwSND4O4Js5rd+BuEmy6
 mfiIgwDAdDTPFyyp/wL4vkuonznlplWc/cKTBsvPMToYwOkAE1RC4Xg45SXojBEz926k/u8kP
 pbMNb5yGa5YcarwASVRlWmPg==
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

> In some display subsystems, the functionality of a PCIe device may too

                                                                 might be?


=E2=80=A6
> of the dirver is loaded, =E2=80=A6

         driver?


=E2=80=A6
> its dependencies ready before it can register the service to userspace.

                                                               user space?


=E2=80=A6
> submodule by creating platform devices manually during driverload time.

                                                         driver load?


=E2=80=A6
> device as a DRM proxy, which will attach the common drm routines to our

                                                      DRM?


=E2=80=A6
> While at it, also do some cleanups.

I find such information suspicious.
Is there any need to offer adjustments as separate update steps?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.10#n81

Regards,
Markus
