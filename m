Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E97D911CF6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 09:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B73A10ED12;
	Fri, 21 Jun 2024 07:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="fnTQCzNf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE75910ED12
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 07:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1718955413; x=1719560213; i=markus.elfring@web.de;
 bh=0VIfHxW0+liwplhCqw+Yef8Z9T89WBewbGYmD95IuEA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=fnTQCzNfN4syCaJ7IOp6CJ2NlYXkBkYgxVqF+3tO+5iHHKvRJOMyDYBhf6qI0v3k
 Eu0lY3/cj6KFd46Vq3xTBzQVq+EAj+4+CgMLczqkZLHBB/Vf+gR78Ol3yUgXqKWSE
 MY3kpN4FFWk5k3js0VtySFrqaD2X+pohcqGGxFzxowNP7rW8bB9/yxVABXzDGBfA+
 9+PCDOBbwU3cIDYobGs3M38kz6QBPkD5LtwPJFjgmVatwHpHZOmHDBgACrWUeUvNr
 FPoZQrIh/2aTHChxPTeSSEFGFNL3KMNeYLbKPV0w1CySxh0pgHXXSbXRLOelRpXIv
 rpltTyrATTwWaE7xtg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MHmq2-1s6nBb1npW-0085aA; Fri, 21
 Jun 2024 09:36:53 +0200
Message-ID: <41f6ef6f-91c1-4b85-b049-efd25e403b73@web.de>
Date: Fri, 21 Jun 2024 09:36:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v11 3/7] iio: core: Add new DMABUF interface infrastructure
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Lee Jones <lee@kernel.org>, lkp@intel.com,
 linux-iio@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Cc: Paul Cercueil <paul@crapouillou.net>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Sumit Semwal
 <sumit.semwal@linaro.org>, oe-kbuild-all@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Julia Lawall <julia.lawall@inria.fr>,
 Randy Dunlap <rdunlap@infradead.org>
References: <202406191014.9JAzwRV6-lkp@intel.com>
 <c25aab0d-48f6-4754-b514-d6caf8d51fd1@web.de> <ZnRUSaHJhz7XLcKa@matsya>
 <20240620170522.GU3029315@google.com> <ZnUnFeum1Z2ahm9M@matsya>
 <b7283f9458047e63e7d8c8b80daf2bd6232403cb.camel@gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <b7283f9458047e63e7d8c8b80daf2bd6232403cb.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:y18xF/BSqPqf/Tvd80huZy/wZJ1h5Bc08s683x3NvrVq90rJY2g
 25FNVxt5WmLgQyxXayqeKD/5LGzA/+8QcKwodwT4SOZUxob0FicEpj32OD5nnQATMlHF7FZ
 COw3DPoewg004G3y9I3vMoWlbfjf7WjlmxyTCmHTQm/8yD/YrFh2anIMla8LWrYKtUCfEJp
 ICM1Mgm/f0NtpI8PJ0CLw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:q5fLA1zrxUw=;NcAHeCyo5KoUp+4fE1PnEQWXWpX
 2kfcz3PSiFtu6vhNZ2OBrBO/YlSU3NOLKykDf+vQ4Zqj1gWZbMn61Pmyvo4PFtlNZ1mV0eBX9
 aQxRuVeWOBx7bN1xtNagodWVyhK6IjiRJ8vp3JiK3tyOFYdCTClAsrOYG62zUHrzuA92PGGUJ
 ocLt7G8Na2nyOCEMC6evezplg1YSmPGqYDCeh+Vgn2g+ozqOhT+A/lokF4T5DVIes+FazphRY
 6l/7KpWeuN9dkgOcAORi6nWQzYF6+AnnHyE8PG3vplXyYVO1WtZzemF1m+3NZUEMN8zj7j+Aa
 fk54ic78Uq/CQvYs93ecIXTabrevSYrfXNdD1+gABU+hoxpMSaGX2ZqO71aB3NRIc4wEdHqHq
 9Jrth9NBLxmKQcjWOkL3QqaROfeTSgJR4yypWq5gpJHbLCXO19avPKx6RyyVYZzgzcUKsfc4m
 9SvNo6L7ZiJgSKiEOLmaoGI0j2wnUaggx5ldIZOHv4OZvPrkFkHZ8fCp35FRSsHhrKuD0zStQ
 86LcIVn6t50aT7XzB0+xcyN2CGt32ogN/P3P70XReydn2dAEDEA3uI0MSssFQDmQV0XlWIpB+
 yAZ+//jQP+TBDlxM9RUVNNDlyQgC5E+7Ze+SjOuea7dxfQaqJYfadzTI2IdNbuWZRDf0H40bM
 yd3QWHHDfz+hxkpc5QbxW9ditnRXeKzdmwFk+ozM+/ljhAjcj+uFFeGABHRrWp4/PG1coH/kv
 Cm50FC29cFGcDUdZnfYMqG2/PgjRYHlk5ocV7FuOf2Z/ndla6Z0K811VQCeIMzYPhd7uWdd3P
 2mXNlFkGiNy4pvukMscNkEuZKnLa2Rvn6navq7svFGnP4=
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

> Yeah, just look at how many automatic replies he get's from Greg pretty much
> saying to ignore his comments.

Does your feedback just indicate recurring communication difficulties?

Regards,
Markus
