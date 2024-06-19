Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE67190E7CB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 12:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F0410EBFC;
	Wed, 19 Jun 2024 10:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="tBAdQpCN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3808A10EBFC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 10:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1718791436; x=1719396236; i=markus.elfring@web.de;
 bh=N0rZdlfAd7U6OxUe0j5Q0mo0zZ6C4FluWO5sXQFB2Dc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=tBAdQpCN8CFb5NtfCXJgu+Lt2W52L0LKmKsv10BO6fyncLM5JIoSjryw69gnoCyo
 PET1DlYm6DhXVTzZMbfoTaGjuZGc5KSrNBi7cmCv9xz4hv9idbdiztOPO5mNI0VAD
 A7T8Yobei04pmZMwS/cscka/tTFWJeLQSh++jqKw0prAEMP6DAlStLpICPXjMFlxT
 +1xPevYVdUZnN1E/4P+h293DqGCJfr8/621c8gaBpRX29aY8keQgziCTC/MayqYfW
 ARJGez+KuiR0XVsunJDr0l6Ejh3fvDDmLEaLJs3YU21BLvt/EfsoXp+nFoeBFGYjs
 G6F1w0y3spB55fA3Kg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MnX5T-1slTA13Qov-00hEnj; Wed, 19
 Jun 2024 12:03:56 +0200
Message-ID: <a4dd1d73-5af3-4d3d-8c0f-92dc439fa119@web.de>
Date: Wed, 19 Jun 2024 12:03:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: lkp@intel.com, Paul Cercueil <paul@crapouillou.net>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, linux-iio@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Randy Dunlap <rdunlap@infradead.org>
References: <202406191014.9JAzwRV6-lkp@intel.com>
Subject: Re: [v11 3/7] iio: core: Add new DMABUF interface infrastructure
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <202406191014.9JAzwRV6-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YAzpBoCMArLdRHEgRCPpV8S7lP94BPtW9JKR3kpWt+GmrGyIyRO
 U0Ev6it/slccDxvjpdyWyNj+9DIpSAdZtEbIQXHql/tJCL+yWLZ0KfGf761wwYQJQLLx5LR
 6D4L8HRgsSNHMxYyFWUp+wAqHQ7a4BONbf2v6ly5oiuFOnctW+n3o1UMZjRz4Igo+0B3CiQ
 r2Sdkv5oO1rbP9PxT1lcQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:olo0KHQ9exw=;A6YXTQReiRlIuBracnFZ2066hcQ
 TwmbZazQ72MXPkqjGLY2gFvpE3ZQILqJ2+GW1GO0+b8/gU+93ov1kDwoaOc60ZLCxG9mN6/C8
 v8q4xecOkiskrSFa/QC5AH08YhgTYcJb+IWCw7OYq/ajxD6DcCNDZDeVnnnz18Gd1FC3NHxqE
 cafyiRszpspb69bWnHMM8f2TiL8bfN3t5YMk8bpSO0cEzbkKkTRG/2t1X+t/OP4C8BB3P674I
 /z52o1lJxTyRWJXAUFMxK8kvZiXsf+vM4plSunJATqxARDjemlPpqM9nwV9xcGkQfxmWBDrF8
 ZWlX2+Y6vnh/dyUp7X9oAspf/2VxxLG3xi9RhvWV9rHj3XSZ8BamanWllPOWjMSvcvEBXUH/x
 foQPgaEh97fYESR7j4CRQm6GWdNB0fHdT3a7aaRz136nvcwMqps0WqjH0wtgRvwrH9xhKH00l
 eiOsH93uU5am+LCfOLTnSjJi9IygYA6WAVBL1S86wGgCss9fX089atVaw5lNHAiDRQq3NTytv
 GI9io9I3sZ7melM0AZyxfejRJ/C1uv9/3hhMTLBjMj7dRwYy5K5yASyqZN+y/Y6Ywb7nG2+Qi
 1XETEQHlV+ETFl0AgCVRW1NqM5RAyE9HZbd2hEggoQnXnbr0Hmd0cyNjnnnAJjoiNxpNy137e
 Uu2pibBZ9Z0jltO1JmEa3kb61he6r9CfaJ2rahIqQHn4JIUNd0cyhswCzCO6HMSmfL/08HvdC
 KNWMFvP5EPc+UW+PYJzC7qQ9nnMobusiRdEF3lY+zQp2IWMCgcWms44Y1p1Ne378GSNQqxxZz
 DvgipFct6HuJ4O0Pfvk02nYVBOZx46aaE+MLNWcMcbfA3D4cG4QKgzUVRn7FatfvjH
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

=E2=80=A6
> All errors (new ones prefixed by >>):
>
> >> drivers/iio/industrialio-buffer.c:1715:3: error: cannot jump from thi=
s goto statement to its label
>     1715 |                 goto err_dmabuf_unmap_attachment;
=E2=80=A6

Would you dare to transform the remaining goto chain into further applicat=
ions
of scope-based resource management?

Regards,
Markus
