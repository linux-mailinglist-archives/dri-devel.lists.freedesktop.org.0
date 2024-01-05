Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E80AA8259D8
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 19:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069A110E634;
	Fri,  5 Jan 2024 18:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A521C10E634
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 18:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1704478519; x=1705083319; i=markus.elfring@web.de;
 bh=kjsi//CS6/CEI7ZTnZiZ2M0Q8kovL6NhuU2PDiYlE7A=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=wgcxae0nwI/ooEukzULs3Y8NqX/LbBqecUhXzXY/vfk5nXNFaSMKgM7vaQH6xcuN
 pr8MO8/VTBcQoxRiMJM+/q6e58vblA9wDYn/o/v9ad96oI1xz/e/EjfWTPBipNfHf
 0vqr51Lky+3kAZ3YRpYZY9JBWt7fgtBLYkGGPuD+OFzl9tezakYDGkHUCQav4wkPU
 kGtMmTqq0u9i8eCVDhA0atm3oMeiGS3MXwztQQaawzQZDXMm37YEYc+bj8AVgcjWo
 YpDduSaa2cGvNIEIhjSzEgAdgekd4r6ucKNmuO9Wo/tXIQIu2i3kqlsETCkB7P474
 sBVBP4rrMAb3FXE4Bg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N79NA-1r7dwh0zT2-017dR9; Fri, 05
 Jan 2024 19:15:19 +0100
Message-ID: <e90eea03-d7e4-4c0b-88c6-749e3528d4a3@web.de>
Date: Fri, 5 Jan 2024 19:15:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm/amdgpu: Fine-tuning for several function
 implementations
Content-Language: en-GB
To: dri-devel@lists.freedesktop.org, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Chunming Zhou <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Monk Liu <Monk.Liu@amd.com>,
 Tom St Denis <tom.stdenis@amd.com>, kernel-janitors@vger.kernel.org
References: <566ABCD9.1060404@users.sourceforge.net>
 <8d614254-1cba-0379-cf84-52ad9bd9f3a7@users.sourceforge.net>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <8d614254-1cba-0379-cf84-52ad9bd9f3a7@users.sourceforge.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eakxCCPCSxbEEjedaAtVHCgkcXEeFYXgaLWUB070gNQJwnVBF2P
 gbqX/Rgr4SQMm1o/+r0njQWFTprK4qdLi41saTmRCiapGDe1L9DnmWT1/fa8aaRd11JlfjO
 lThzCe1qW24qlvN2mNiMUdMEYVtnB7VovJNNBEnfjTDjOITDqgmQr/OemXxRYGlYnXIGIZm
 +BR9sjBMvxLb1lhiQjoYw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8AwOu84PzqQ=;hPjjvpdTIMzS8bCknpgDuG7obzP
 cbpedb7RDsICiiIQ3Smf8PwqlD+aR6rHw216sO0VU3Dv6eEe+Hikcdmtf1oBUknRkgl+qtNTW
 iGB656l3rFITsOw35A1+GaikHlK/9Kld2/vWYvNl33w0BzsyOODV0q49ssRsmNfeRyNV7j/Dy
 VNbwnmZqpbUjWu5Zw/ortDeN1cVaEQSxog7OLwF7260y/f4oIwMJ8NfJ2tMClT9yBuPgZ0Yio
 jrcs2FX1+JOhaqG4iy4/lt/fGs9i3czFXV4jmyVOsmAukdacCo2SnuIS3kS44E2aD6wobd8BO
 o1ajJBPlqYTd7FqpiiXtXUxqOSMPfhcqp4+Z1Xhm+XiiSRB4XKN2lxfhynn4+WztgMxCeGNxw
 8OUCgwxkyn19AqVd8XxiUvTXqppXWbRNOEyj6F/h6FWSXUBfWsxY0MWJPnI2JwUTSOLcz7EzQ
 AEFX9JYQcTsEeVGF8/pZTYmAb15kcZwwprEXQNbgyFNGOIGpUj2olio1ybV5oGQqHog5bkX44
 9ypKNkpBoCtxWru2pKX8Xt7NXLxV5uBWvKU/x7A0JtlPPqt+5kvufKiYP6Pcy14dc88RLExtZ
 gV9jZhsT05oalx/nxtutH5qpQp9nr31VNyqhM/rR5OQHSWRqHSCUBKcGG3J232tXf0pKTufck
 U+3Sz0n4PDw5vYlJTEiCn1UyLNH1iHNuxhWWwCPyGaPbGeCMSmPa14bA5xCQQK+IpqD63C/Dh
 F8AiN4ucrgtGVGhevYF5mJ1nCCBoJVPWwNZUi1q2HPw5uQWKNjqDEpUfEReJfrZxm0Syn4AEj
 dkGJ56Xg66fCsZZRkmlOW64KdDIM3g4cMTDmVGaoP8U7uCJeQO1OtjjF7QNueH2eWGwJXutzZ
 ajX8wWYR5QqGZK5Al/QwrQ4mXj8KDyzzrumgxJDQetjscXgXhdSM3UPf/+K5Y6gozAB4+mbQE
 RyHv79Wc5jGJP1kG/KmAzyik5AU=
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
Cc: Julia Lawall <julia.lawall@lip6.fr>, LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Date: Sun, 18 Sep 2016 18:38:48 +0200
>
> Some update suggestions were taken into account
> from static source code analysis.
>
> Markus Elfring (5):
>   Use kmalloc_array() in amdgpu_debugfs_gca_config_read()
>   Improve determination of sizes in two functions
>   Rename a jump label in amdgpu_debugfs_regs_read()
>   Rename a jump label in amdgpu_device_init()
>   Adjust checks for null pointers in nine functions
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 68 +++++++++++++++--------=
-------
>  1 file changed, 33 insertions(+), 35 deletions(-)

Is this patch series still in review queues?

Regards,
Markus
