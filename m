Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3D0BFB9A2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 13:20:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E0210E07F;
	Wed, 22 Oct 2025 11:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="ILYtC9vv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 326 seconds by postgrey-1.36 at gabe;
 Wed, 22 Oct 2025 11:20:01 UTC
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F7110E07F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 11:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1761132000; x=1761736800; i=markus.elfring@web.de;
 bh=WQh/q03bUDYSmRb3ARH65jyFk5aRNd38x4A59pLe7SY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ILYtC9vvy4JX1XAjAGrUjYkNY19yKQgq3mFrPKVuDlM73u5t8rQskxmtj1PfACY+
 WmI8pAJ4ANkx7Fe6t4hL/2rlDi0rw9G70jNWXs2QsXhqP1gYzNbHXKPGHBEA564qX
 QnRuutcLEoIos58EkASIgH+V5SFbjw46xgurqGX4kjJM6Oo21w1CUE0Ge5J4x+2wZ
 VrXB/dfpcYuotFvtjy885qszHdzI1PdsYpKClN1m1k4Qe26502fTW1Xz2LcgFQ66S
 sbMOzlFMu6NiunBodL1hKealw7r6adAcXvLNZLzBgvi4tNcE0CAJpktBNd8u/47qV
 skWxfaSH54aJgJRYGA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.250]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MWi5s-1ueXU21um0-00XJna; Wed, 22
 Oct 2025 13:14:26 +0200
Message-ID: <d1461717-1a58-46f7-b8fd-a185aaf90828@web.de>
Date: Wed, 22 Oct 2025 13:14:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Biancaa Ramesh <biancaa2210329@ssn.edu.in>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 lkp@intel.com, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20251022043108.7197-1-biancaa2210329@ssn.edu.in>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v2=5D_Signed-off-by=3A_Biancaa_Ramesh_?=
 =?UTF-8?B?4oCm?=
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251022043108.7197-1-biancaa2210329@ssn.edu.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0OaA8HjrVXcqa3gae9XV0pfDlRR6IVm+fJ7MEAd9rA8juELnufq
 AsPkoJi+l9YuG8Tpen6TuXZaSNZqwhoP2Qo9aUnYcpAZTnigtlPblrfFopCgAueVZwoOQbF
 HsmEbHm2j8azgyjY8vIHx4JrNeJNloubBfI2rgok8f/1AhxqtyEnzAIq6stuVf2CEP0Cmxf
 ky6HIjwRyYDp5oNqJfZcg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PNa5F1/ta5k=;5CAriVO0ujjqzPBrALmiQW2Zd6P
 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
 BQiAA==
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

> dma-buf: improve dma_buf_show_fdinfo output
=E2=80=A6
> This patch also fixes incorrect =E2=80=A6

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.18-rc2#n94


> Closes: https://lore.kernel.org/oe-kbuild-all/202510220802.svbgdYsJ-lkp@=
intel.com/

Not yet.

Please use a more appropriate patch subject for the proposed adjustment
of the function =E2=80=9Cdma_buf_show_fdinfo=E2=80=9D.
https://elixir.bootlin.com/linux/v6.18-rc2/source/drivers/dma-buf/dma-buf.=
c#L570-L582
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.18-rc2#n396


> ---
>  drivers/dma-buf/dma-buf.c | 26 ++++++++++++--------------
=E2=80=A6

Some contributors would appreciate patch version descriptions.
https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+pre=
viously+submitted+patch%22
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.18-rc2#n310


=E2=80=A6
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -571,24 +571,22 @@ static long dma_buf_ioctl(struct file *file,
>  	}
>  }
> =20
> -static void dma_buf_show_fdinfo(struct seq_file *s, struct file *f)
> +static void dma_buf_show_fdinfo(struct seq_file *s, struct file *file)
>  {
=E2=80=A6
=E2=80=A6
> -    seq_printf(s, "flags:\t%lu\n", f->f_flags);
> -    seq_printf(s, "size:\t%llu\n", dmabuf->size);

* Why does such a diff representation contain space characters instead of =
tab characters?

* Did you refer to a source code variant before the commit bcc071110aeacd2=
8a87525a2442dd96eab145a3c
  ("dma-buf: add show_fdinfo handler") from 2019-06-14?


=E2=80=A6
> --=20
> ::DISCLAIMER::
=E2=80=A6
> The=20
> contents of this e-mail and any attachment(s) are confidential and
=E2=80=A6

Please avoid such unwanted information for communication by the means of p=
ublic mailing lists.
https://subspace.kernel.org/etiquette.html#do-not-include-confidentiality-=
disclaimers

Regards,
Markus
