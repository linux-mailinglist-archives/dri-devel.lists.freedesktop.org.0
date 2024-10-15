Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C52C99E079
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 10:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D2710E53B;
	Tue, 15 Oct 2024 08:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="kEhLKthX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC64810E533
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 08:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1728979822; x=1729584622; i=deller@gmx.de;
 bh=mQWMACPtiDci8G7WcpMi/jiFarITfO4k7sfUpetIOeY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=kEhLKthXHetj7wJfQVwcEaoKB9ONI+iIp1bapaxkZrQ6tB21eJ/dFrdvwUtMtcC1
 MRnIClo3fGa7GOmTto/F6alBJZZLKxvzOkPKi8ojt2c7DVQRZbpXd9VIgDSup8hZ3
 Qi0IFcDubkuwazkgiAlFpZfiF1JmncgXGb53JYi7uywqPcAjXrhNcSfmb+0QMBTYg
 +XiMtf4Z0bEGJFQb/rA5OUgHbm9L1N0s8NQ2iAT9NX6G0354MyhZuBfLvDndsyHpm
 NoWyN4r7D13REQEl20lx+kBaf8AiRNMS08KifNR6z/79mSEckBxIAvtD0YvqPenoA
 bkzDynEtiCZ1599yfw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9Fjb-1t3fJ44BT5-0005aP; Tue, 15
 Oct 2024 10:10:22 +0200
Message-ID: <8b15aa5d-f768-4778-8246-eda704e7c7a2@gmx.de>
Date: Tue, 15 Oct 2024 10:10:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: da8xx: remove the driver
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, David Lechner <david@lechnology.com>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20241015065329.12732-1-brgl@bgdev.pl>
 <4cdde7d6-e0ad-44a4-bb8f-1df5cd3b1874@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <4cdde7d6-e0ad-44a4-bb8f-1df5cd3b1874@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DGDxZHuhnqs53RL0iCKK0AY2nwxQt9QhUMglCt2CTckGP+6IxIV
 L+8+juqTUjmo950QNy7J4vn22//2fsKuXBw8IU1xOlVRKYm9EOyYwjrzl3hi5VUm1EuH19N
 QditLxnjjeXpQUAL9+gf1EvyJBJkffGxpMCyu1B60FVWCw290VPHt5Hu7I+dKobymolmtCc
 rgAA+YzHE6dTuVrE1n9sg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/25xlcbN1QU=;P7NDhGTyrT6yTj2fLg5HEeESMBD
 qT8b3LEXXFUNA1icwlxE3++/9d5qRAOzmTE6IVI37MNGSyLwDkPzSDdospbrZ/3IAqUJyqBUB
 nG7vynyqlsKkkuddyRq9VnyICwMmXVmiSTHVazymO0Je5xfRoPqd9TraB2HP15gtZoxyAKE7y
 H0KBGkuOhsToWDXKXTBM/xji6BxCQMmj2itci9w/IKszS/Y7kPodiZ4vS7s55bGqXGbDx1rHA
 izPrJ5aMphKf1zv5DQC3RBt0vNk41/mkwalPvgxI9Gpi90FnCOZHuk6oJGmMJvkRtnsmvgZEu
 wGnQ6JT63AtVDZUSq5YGjg1KMENllcFr7zUtGYqMFCYvQOFri/50asT2p3C70TTB8Y0/3hyYh
 4nv7H2yGHE1kkhZ4xHs3KZuCmZCkrX+nd0pInUrYU0t7x0Fp61Kpp6WMBa8O+wl08lGifkzBD
 WZOepmmORV/kn2yx6bPjQh8/qMZCRaa3urR6hCZfYFqiNRhMozqwUd11L36GlnYPcfluFkZTV
 864yaHdHsoz66XqgXvdUkrwnMYiKqsFRyjrv/bmzUst0m21YWz+2cV/BtiLoZMoTDmSlKJW/3
 mYrZ26DqSl4tbkdtG4bLARSXmYVNBh7YH24HycUw7W4U6RNhFipEehYmVQjP5KQFtZU4GMYnG
 lOA0ah8p43n1ZZSAkbYxmmeTc9sn9zJIlE8pNk+9Bez+ZRzP7txjZHI/Ef4CeufgsMdREdBjc
 HNQ1Jb+3SEGEQj/PUIW2FUBM94jUBNp9/5XwoShmMRZh78O7P6bqjeVT8wutyObq/3iblm+lP
 llvDtcP1yTVcpcBeb9nXgPDQ==
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

On 10/15/24 09:16, Thomas Zimmermann wrote:
> Am 15.10.24 um 08:53 schrieb Bartosz Golaszewski:
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> This driver is no longer used on any platform. It has been replaced by
>> tilcdc on the two DaVinci boards we still support and can be removed.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

applied.

Thanks!
Helge


>> ---
>> =C2=A0 drivers/video/fbdev/Kconfig=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 13 -
>> =C2=A0 drivers/video/fbdev/Makefile=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 -
>> =C2=A0 drivers/video/fbdev/da8xx-fb.c | 1665 --------------------------=
------
>> =C2=A0 include/video/da8xx-fb.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 94 --
>> =C2=A0 4 files changed, 1773 deletions(-)
>> =C2=A0 delete mode 100644 drivers/video/fbdev/da8xx-fb.c
>> =C2=A0 delete mode 100644 include/video/da8xx-fb.h

