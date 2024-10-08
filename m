Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BFE994370
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 11:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D299B10E4A6;
	Tue,  8 Oct 2024 09:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="ZsrRmWc3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0DE10E4A6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 09:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1728378273; x=1728983073; i=markus.elfring@web.de;
 bh=vOeNwF5HYjy+FpU+6wB3oyl5C8h4PqkMYqgOx3rhiRo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ZsrRmWc3L2v62MGTOa/X+IxK9OQxL+HultWO8TpBUj288rHoYj/qLAwvIARKKzVN
 wnMCZ76v+WTkvBVQETLfXxGwfoyqeKMa4NlUgeCNHKHOKoExLt4mIA4sSCYB5Y/S4
 Ak6Ut+L7vazDw8NaSNbtFXu1ZfhOmK7FLCZA+G61La0RqLtM+lHjQb9DDners4t6X
 H/v4Z/wHVF7RwIgZj0g463pho2tzibzveYxpFAK28d0FtVqHCgKvef4swO9YTdIjV
 4CKJJPBslQrdhY3YP4dTdO3nPUydJqc7azRJFCzOJ75Ta+J0Pv2w8oU7xs2ctdf5P
 KbVLlkaPSV5m0dAKtQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mpl4x-1tlgRI30SD-00nObo; Tue, 08
 Oct 2024 11:04:33 +0200
Message-ID: <a862e4fe-af97-469b-8fd5-b2b0bafc6601@web.de>
Date: Tue, 8 Oct 2024 11:04:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alex Lanzano <lanzano.alex@gmail.com>,
 Mehdi Djait <mehdi.djait@bootlin.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Shuah Khan <skhan@linuxfoundation.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20241008030341.329241-1-lanzano.alex@gmail.com>
Subject: Re: [PATCH v10 0/2] Add driver for Sharp Memory LCD
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241008030341.329241-1-lanzano.alex@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hN+eO2bYOu7RJGSr0CIoJXNI3UqnDjFeiXWoWVNFHP/KqYR2jvi
 MM0ca7NBKFAvFsSaynK85R2DSpzOTFuFdHiuQEu/Fiakz/o/5Ic9sXxTeOF1LMGXWsAPWGH
 LOljMGnJ90/9jKwRPS1WqTWnmw4jUBGzuuo6miu6qS6yQHm797SHnwDb0gMn8z6nWB3rWYw
 jAyOkjBQ8RVpNomLzseYA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gPyJ1herBSE=;3VAUm4TJSoHdSIHai2gWjdyPJNV
 umTBQzUn3h4triRCkF45qq8KEKHx8ex30h+d7ev5omN3le/OTT4Z22fqbC9PEwPPqIqTJkEdm
 9BhfNLDsfepLvJ6/zMJIq6e6kBKaMcvYLPqV5iCLEgwzmnjnit4n/CJpd+AENrsi+NXpQzdbB
 9E6ScGAF07HXj7NsWe1HMhkdR0ZM1WnFuDGyCqg3fm5yfJuzEkAnR+q3QK/wDiwlqjPpg26Vi
 2WKwGQXHd5cRyGbfaK1hyoiwuz7F5EDCbjpWf2tMo6998GE3lZBdk+X4xKMKiy+MmbJ0+BqTo
 mvwuVb3xJnIOpmJIV2I0XEXiUWqaCgQpx0Lpl+I3EG9qZcXUOr+J73UesOE57PnQH1gl3GG49
 rRp/Ypb8GXhrvA3gco7CGhui60XubaOzhLGu/nCsU/SfudjSnqD3JLTrYr0Dq1UaBDXd5QDqH
 pwnT3rcs1x6T+fUyQuOOaHtTaqqCnLC8iDKRc4l28z5/JeM8YlxrCc42+k5CmdhjfWvhGOb5q
 OZ2BgnyTZEM1cfynj8RWIUBkyIxmkWE8BWYG9TqZTpurgOOmW931vCdVuRscliR8XgFM0fJUI
 HJThPSevXYfyVQ0QAX+R3kP3k7IEMtaUdP/COEmyqkSTNSyj2DGOAFIDdjHQokpO6vwDYKG4D
 TK8R0VQL6rMJE1OMG2Ft7iRRTnnxgwQmNnKx/i8jkkGz3/P3K5Kpgkzyw4Tx9Z0iCpH3dJUqR
 YDXywdYxs71hiVFvrFwig7WoIHVhe7nank/qQ9tTAET6zhAgRunFpY8LGQdG8Hz9m4HC5ecE/
 j5B5pheCMY2VzLrkbWfNhPLQ==
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

> This patch series add support for the monochrome Sharp Memory LCD panels=
.
=E2=80=A6
> ---
> Changes in v10:
=E2=80=A6

Is the support for the application of scope-based resource management
still ignored here?

Regards,
Markus
