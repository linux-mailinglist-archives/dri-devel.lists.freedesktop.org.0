Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E41B90EA30
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 13:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCA110EC89;
	Wed, 19 Jun 2024 11:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="hDMCyS9P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3828F10EC73
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 11:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1718798204; x=1719403004; i=markus.elfring@web.de;
 bh=XT72b7itPnzm1V+2+Xgf1kA9L0kMIcyaM91Blh2TMYE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=hDMCyS9PZcFIrqVgq01L8paMukJhaLbCZcezdnHssdReyhafT702yO/Y4f9OzL18
 1kxe/Wt2yCzYwSqIoPRHh0etdDBcuF9HsWSaNKxX59+MMLh05rTDJbaRBnbgdnCjQ
 uEKugkgEa8nQ59I/3ZnTGJeuKOqhLUOBaptl3c8+lR1C6Yz1zF1YBo2bKBD8x4OJR
 ob9JN10T2hRaSXpCVc+HMGpFRyR+MPpdilnGvPWTZ8REaSzrJ291VwcG7i7tq/2tX
 fGG7cFKFD0wFlgr5iPWSuP32+Wwv8WuO4i60LJ0B3mYUupO5LOqW1e+oGroqO193R
 D7773Gt2hnEg7ad/oA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MkVwi-1smwsM2Wsg-00b84i; Wed, 19
 Jun 2024 13:56:44 +0200
Message-ID: <41fa9904-28a8-46fa-bf2a-014875409b83@web.de>
Date: Wed, 19 Jun 2024 13:56:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v11 3/7] iio: core: Add new DMABUF interface infrastructure
To: Paul Cercueil <paul@crapouillou.net>, lkp@intel.com,
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
 <a4dd1d73-5af3-4d3d-8c0f-92dc439fa119@web.de>
 <d452ecc4fc703a1f98aa4f243c6ded7fbfe54b0e.camel@crapouillou.net>
 <cbcfb64a-e5c2-41a7-8847-227d4f6872de@web.de>
 <e948cd137da8e4f97bfbf7ef68a5450476aeee0c.camel@crapouillou.net>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <e948cd137da8e4f97bfbf7ef68a5450476aeee0c.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JznLXOOrjHHjdQ/DvgHNKMl+mHWbtfwr9nCttlec4A/5RKvIavt
 4n+CE8KRkg6ci+QqCtvyC6RYUk6aA6oxPkC51HrYbG2i41cMc//MGMP93+LzHxzocW10T6R
 +q1l/LN6bOPS4GMjyPPdFTpiCGel16Vcc7CBoHmM1GJxdWloElqFWhG5diwkrkSKHv8N3zV
 nOLsUHkwsQ9Yvs577/4Ww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yBz4OltUnbo=;2fpQBJSqjGM3IDnFAq+/OFA4RM2
 J9CSQLZFJGJBDaOD5fJv7Avj6U8Spt/xBDJi83VrQdfXzlW7DSFQeSpYxEqfvw/XAb+1hDiUl
 hlogL2PmlaL67u8rLXsumRtBqAEbw0T2emQg54nyM9GEiGmASg93tktB7toBenwdSHfAaBTbh
 jsFDGrwz5CNCF8WwKm7h/MD63ksX0NABFwTxObOiCv7qjNSukCouQMafmFF902eHiK61mG9dG
 WNGjzNnW/m/DXQEJiUkCKRoAP4Li+d/piFODeFuK2ZlFt1pnmKXmLDGa23AfdHS/NOG8Jf2d+
 IKEE2XgxjYjX5HmMkWRNNMqCR5rxaJE+eLIxmh9a3ENh/zO+70eiGqMf9hPZuSQImkShl5376
 ntEVQbhchDZE1+AHjaAVvDmiRC9a7LecXsbCdPBNWg29fVEt2QtD03Zh/TLgpSDUG8leMxLtC
 0IAl6q+YRkfMRhRn9qVngBVTS6HDqurQlZaEiCmOZU5eIS1Xf5uKeVZ4yQxjqgrwast2yN3zX
 a3Cd4DL1dZSNNmWJFtrInA92d92kERWL9IndYa66N3dtdWVEcBd6WxTDE0RfiP2NKOJKlhMHQ
 IWkdfXR1PZQ8e/pYMNPDBW/QqhvPCVdy/AJhh6cPXzB9pjFS8sBz0iDHYPN9TNMtoFafjmZsC
 hhcugnYorWHfU3fcPmZPpNchV56arlpeEKKTweaS+BqamnBf07A1kvXFmiuO7esD8HVI6urzx
 IOdoOGqe5ao9xlzwisIidNYIA1o7F4692zJsoUIYdgQP+8cd+n/cnrKstOkObFliuzuQ//nrJ
 QyA2XXTSee9Dy1EbWpi9if9GejQRO5Y4RTou9Ysp1wrqd3SfH/pzJD8c8rgCdtSP+7
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
> https://lore.kernel.org/linux-iio/219abc43b4fdd4a13b307ed2efaa0e6869e68e=
3f.camel@gmail.com/T/#eefd360069c4261aec9621fafde30924706571c94
>
> (and responses below)
>
> It's more nuanced than I remembered.
=E2=80=A6


>> * Will the desire grow for further collateral evolution according to
>> =C2=A0 affected software components?
>
> Not sure what you mean by that.

Advanced programming interfaces were added a while ago.

Example:
https://elixir.bootlin.com/linux/v6.10-rc4/source/include/linux/cleanup.h#=
L8

Corresponding attempts for increasing API usage need to adapt to remaining=
 change reluctance,
don't they?

Regards,
Markus
