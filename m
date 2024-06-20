Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 651BE910CFC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 18:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F0610EB30;
	Thu, 20 Jun 2024 16:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="U4wfLMhE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF21810EB30
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 16:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1718901173; x=1719505973; i=markus.elfring@web.de;
 bh=dykB42Sd3Re8NZvckvEK5UPju/y5TnSdBQ5mULG1s+g=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=U4wfLMhEqGf/E6owLCEXzYfF2p1eof2l1Z1G0B174YWML31y+GstGgGuYseaK8W5
 20FjbUI51rhZFM/28AFVsOiUflRpo83Rn3OgQoxAOTnb3g4rCdnjKgRkkrFoptmA2
 XahFJvFmysdUjmll65ysQyG0wA30G5LkHfCpFpDcMXEPuYRheckabK3Bnbj29/XRy
 s8cEOUpflyJg4v6av1dhi9v6MJ+5oKPRKDumtHuZKYPBEtbAjnDrXKOTAQp/CRc8U
 afrD8aAjsd9o5gqOIC8jqOkZDW5djEwDw3eSxD2ahX7c5mULcFLtBxoeqorJy9eRM
 t4QWjn5FdXYQDSTIHQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MAtsZ-1sE27I0wDR-0008e4; Thu, 20
 Jun 2024 18:32:53 +0200
Message-ID: <ca3efef9-9720-46be-a59d-a9a4c5873ea2@web.de>
Date: Thu, 20 Jun 2024 18:32:48 +0200
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
 Julia Lawall <julia.lawall@inria.fr>, Lee Jones <lee@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20240620122726.41232-4-paul@crapouillou.net>
Subject: Re: [PATCH v12 3/7] iio: core: Add new DMABUF interface infrastructure
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240620122726.41232-4-paul@crapouillou.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jeIzi8pMUjRRHbkEI2McLlbFKS2rmTp2/YbWVN/pPMg1625Dmrm
 OG7fNtWabJLFJVITv55DtECwqQZJrxQqDrkpXx1tYmjLmWo4ibjIqLpK0G+tPWF+YQKJOXl
 X/CPLEcXcpigj9lmdLnvVZNThD1kaIAPXqRFU2Mb7gXvFj8W0tg2Gte24rlJ9rwFjO2p3Zk
 42RBmPZVkFpHq88jk31og==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+eTpu5gHISo=;FvPn9BFx0q8Vg3ZhRq6hxBpzKLZ
 U2PEJ659y+nj6QPHJYsDL+YEaJTPpXHTxgx6wRviFNOe4p3/yROsBK76+gOunzodRdYeS4BqN
 oqOr6J/RHfTPEXsFWBtO6kASEmubf1Q41aTy8TiKAUINr1QroIcBFlzv/5ZilBf1bC70Xq5rk
 PMPyOq3IPqtZymss7xyFlSsMHwNImQGNG7dxgDakPJ+qL5eyXplYP4YuPxOVuuAct/LjZ9Gau
 DZiIvmiYP7esUvAlxG+TEcIRU/PtAjKKQhug9NCEd5TKnVm69K4Qb2HhnEeXKpkRj2P6U72KT
 0QaXQFFOo3nzYNw79cseCq+B01LfPyQdgOL+KnMH7zqbNRj4l8yvKgmaoAPCuZcSrdH36XWVU
 lBWsQTVodUo8YwquewptgmXQzdsXxHPk7DtPS7ZCb1V6K97ErqY4YLuLZUhN/iUxYoeQfVGiP
 FrVafcM/vpkCyDDwWhZbe6+JMh3E34KA1VhP+GVSozJFNemH8EpBfAg/2fWwaPhNYGcdrDpSv
 SA9mzcvxhJAmKx8wYLLpobtdCTY9jqrut8pJK708A93fxLx0xs4hd70TkjFBvSSiXPBYIWHn/
 1YkHWswiiSMk0yoIsTfqJLMShiF4KbmgnsC6pRmm/BC9IzyM/D5Z7acm/ZZv9elLpcEaq8ot8
 qcadgr7f040EA2OAa5Fg1S7qcIiBuMJf3+BTtU32X/J7fvZuSrfUpdzQP18EP0rFvVsZoWgnd
 vBqsqXpRfJ4XaA+vWxJqcfF/6rvwut9TAVZ5+LVezjZ2rnOhPwpLeyfoZbHPMKVgxtfRZy9Cm
 JumtidR4NTrYbH8Eyja37pmb4PkQs/jVIkjk5wy+K3LytLQTq2LT+/Scao1DN2M88q
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
> v11:
=E2=80=A6
>     - Use guard(mutex)
>
> v12:
>     - Revert to mutex_lock/mutex_unlock in iio_buffer_attach_dmabuf(),
>       as it uses cleanup GOTOs
=E2=80=A6

I would find it nice if better design options could gain acceptance.
Will the chances grow to adjust scopes another bit for involved variables
in such function implementations?

A) Enclosing a source code part with extra curly brackets?

B) scoped_guard()?
   https://elixir.bootlin.com/linux/v6.10-rc4/source/include/linux/cleanup=
.h#L137

C) Moving a locked source code part into a separate function implementatio=
n?


Regards,
Markus
