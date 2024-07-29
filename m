Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D8393EE40
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 09:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A1410E14E;
	Mon, 29 Jul 2024 07:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="ka4UEiRb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DF410E2E9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 07:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1722237328; x=1722842128; i=markus.elfring@web.de;
 bh=duZpOgGavgIfcJxJxGDjjsBaYUoNsCLxi9ySKX3D78w=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ka4UEiRbjSKQLNop9RMXU5Kce4LrTG4VppUU9xvJnlswYP7OJiMGCPrXFUF8La7Y
 k7MTT0ZOwaOG4qDmrTyqhqLB87/i0dcXYx/iJBvuLvrczHFKWDADjKtc4sS2J/fbZ
 e/tgLVzkt59YLyEi7jYDz0IsoeS2C+7nWGmN1Vz42jPdF1HUn5oz9ImAYjRURq6yX
 00aOXhrh3YXO920fCihqqM6KBQtZhp5Q5QnqZg+QO0ackwob/AJ5+occC9JKeu++V
 szZ3VVYeNJ4W/NVH2WUgs4RFM1TnDrPWyi/oeUSMexXCLwD9wZOaz/lpGr80EHa8k
 meiTPI0dlUXb6ZgF4Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M28SB-1saGPh2mgj-0022Gv; Mon, 29
 Jul 2024 09:15:28 +0200
Message-ID: <139afaab-343e-4cb4-83b7-2695129d27b1@web.de>
Date: Mon, 29 Jul 2024 09:15:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/loongson: Add dummy gpu driver as a
 subcomponent
To: Sui Jingfeng <sui.jingfeng@linux.dev>, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20240728152858.346211-1-sui.jingfeng@linux.dev>
 <20240728152858.346211-3-sui.jingfeng@linux.dev>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240728152858.346211-3-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:l0i/D/twx0/4yQ+jxA/4dRn8I7iyk9vkP4mvHIOx1amytFbIiqs
 NQ8/BQNnqTivPoQBDdBQjrSTwj8wX1BeiYYOyHZbCeRXMFh+f8BLs2vT5A3Bg64L8egyFL9
 WnFiOYF7rTWYsGrLfuJBVu+4tebW1KNfwyOzldQ7l6r5EWa1i8GcQ3XtglaN8Y8fRyn8miS
 vMSGeJXs+oRBWLAcmbmZQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kq7j6WJqdN0=;Kr1+OCJOzj6C8z5RW2OxVuo57M0
 HYQQaYI2tUE4hxBCgwltXreqLPepPkY6jGJTcISe386X+gBoApzNOm/JTuqc+9vrIRtx1Wlum
 Nhp1ibF6OTRpWwE/PwBwR60hcHH2wF9QWMoJkBI0vJAvHLm6WOgRC034W8j92143ZIQy5g2+E
 0N9qY25O7/P5JIfY/yUetuGYHGM//mIsOVhhlgitu+FMEq9r7NBd7RHjlS/55xi6QJLmR+jUU
 Afiv8oBcu8FBOkoD3GwkCx5IFU2A/nP5zBvOReOnLqaxve+xMe3nLu3NakpHzdrxkNTtKWj7S
 WlLnhgrFXP0NGbh1cpSASm2N6Mf7VDLQfaQOcAMNmFPTehYUT5dh3rHRIQmux4TmRlwmo2B16
 YcoZ2ub9GIdG+fMYfKIWSTrhVdf9E7tCCqs3bEvJM5wAcn7I1B7JaoF237j27EeJk5uKhOmcB
 F/bKblgtBdNmaekzqO6PDpI+bGBjWm4icaAUKH2y7waKr7cXGoWbsdaJ5v+0cgimPbO/q3tNB
 8RdY+Ng5mcs7ck5vn6NynxkdHBp+MfsiQYXE/ohLMaetis6BayjyHGfS3AqcMx3rtCdo7+aJB
 Sqr9job+SMviRGN+vTZBN5MR/RokWkrwrjgPgqC8HHl0zgJH3oHWXNUKm3q7Y73rSPz0J0fCT
 B8EEbk0M9K2pgF4S3VIbfWnEpEXWHtcA68+rCOhjoaRmyu9lo3GDauVnwBy98zdTbuwvQ5MPK
 96KUUQLdfk5JEaYG3wkgCvtgyzTSW2yopXabiiFDBO48mR3FiyMWTN24I2zDP/rzWwb7J1ReG
 cbRAsiEuKfrKIoen1LoiCbig==
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
> the driver is loaded, drm/loongson driver still need to wait all of

                                                  needs to wait on =E2=80=
=A6?


=E2=80=A6
> design. Therefore, add a dummy driver for the GPU, =E2=80=A6
Is there a need to reconsider the categorisation and usability description=
s
another bit for such a software component?

Regards,
Markus
