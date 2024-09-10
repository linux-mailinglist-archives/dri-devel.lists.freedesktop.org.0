Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF7F973CC4
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 17:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC2310E873;
	Tue, 10 Sep 2024 15:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="iNnhWeW3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D345310E873
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 15:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1725983715; x=1726588515; i=markus.elfring@web.de;
 bh=LwPewJzw4V4WuTKlqB1K5tYOXWB1kJNCFgItpQi5tGA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=iNnhWeW3g+hAODGfDoNqaFNmgaqEIFIxBYn1ZoP8hSe3x+BD1sV4B325L2GnuTw+
 rS5hC4/0u5R9vMk6U6UONrI/LkdfzeoCsQD1AIzg7Tdi/LuH1fqugv67ZSHvtDbET
 HJ9a8cYpiZLslSqJwZ1fK/Hn5lFR5UCt3+WqWud4qhwzKSVUF84iQ6KGvEbmFBprA
 up6ONxaeOGoIOqGRvij8NW5BAV+mKVF8u8nWEH66WZx4XM7m9GQDdskq9x0DLM/MP
 22qsnFjSI3lDJy7K7XL4M9//MLnEse9PHKT5aeCeAfVywoKfbktkSMz1VPqyZAbMM
 wAuWVvadLOnXO+PB6g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1My6lX-1s5r9Z3SZD-010uBy; Tue, 10
 Sep 2024 17:55:14 +0200
Message-ID: <aa9efb22-9ff1-412a-a949-bd727350532f@web.de>
Date: Tue, 10 Sep 2024 17:55:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh+dt@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 Vishal Sagar <vishal.sagar@amd.com>
References: <20240910-xilinx-dp-audio-v3-3-75560793f4d0@ideasonboard.com>
Subject: Re: [PATCH v3 3/3] drm: xlnx: zynqmp_dpsub: Add DP audio support
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240910-xilinx-dp-audio-v3-3-75560793f4d0@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dUTuMxY+RIMsMYSPo9z08ag0Ve3CqYJZF0sCAewlSlRgL/pPk2w
 Bh98DzjKfd4e9R76Fd1HDYqZURqHHYgrJRckEUrNxqB3X6bXg9R/DkqHB1XHiqgsndIDFUc
 QThopc9jqRyEGyURUeg8lLZe3q55FgeDAcDsCAKTqYoSR3CmmVqngB4aTA1Ff03bCxpT5yT
 tMQk16/syJxIlSKpUCuiQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Y7xr2WFazI4=;iydN9FdWvdIe7qftthK9MZ1odcD
 nAoXuuHvB4+sRQ1usDd7/6WSBME0otRiam/ITa91XIkTcbFqZm75z/vJ58h/mlTj4cr5YzzhX
 tE5pxnpILRxoSefbCbwx0BS/2HFfu2ITXG0I5WdX/tcBTtklPHUqNLQ2JnJVUyFxp6SyoAeN8
 x2RRB3L070cQ5ugwsv8t/AC67zu308FVzXtj57unFrwZrkSrfUwaXSx/tWy8oIeEPla8NZgTV
 o7rJXO/2E9Zt2GqPir5MEfrOsmUXT9JJTZZ1VSwzmDTwXENJStPO18x/bgzKRWyIuQGwagTeI
 L7l2RR7KdS1tfiSb7B8WBHWieKbYczY3HZwcy6MfaBvwdHRGhHDdJLCht0qmNjyimuGL0Fgns
 gEFDQkL4sEUCPwfCxzbm4S8HFo9gn7GJGLalPnc0h99/6fVf0v3bOVzvfIwUDII/lOzvVRCgE
 0at1gKa4Iq6fd7EHbpKV7OnhsRthI/EXBJ5iVyJEWX0qqVqutSuYyWuFKlE46z2n9+wSUtnEb
 1mC8TU+/7T730+T18HM5l7kLpoY2bxknMOzkBQBN58vUnVuR9m1fKCC3ODocmUfpYIdk6lNz8
 C1iJquV191W0yVWbXussHkVDB3RESzvkiqETiPxXezxnjQLCsW8nhDYWjMMUUX1p9l4TUC/2+
 8qA3ajwJ1tl44IiJfNyo927sXUobOpsM5UQwpwwF2eSQdOdQw5nzrcPurVZ+0deO0Gxc4KQVn
 rWIe6YtiLFhMxb9Xv4SO+xOEH+LOJ7GpznOwoGvlYXQHql9xJWiRE8f8qAyNKkd9QYYNNR4RZ
 dOi80qkX9EC2hU09JSLseCkg==
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
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
> @@ -0,0 +1,461 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ZynqMP DisplayPort Subsystem Driver - Audio support
> + *
> + * Copyright (C) 2015 - 2023 Xilinx, Inc.
> + *
> + * Authors:
=E2=80=A6

Would such information need another adjustment (according to the current y=
ear)?

Regards,
Markus
