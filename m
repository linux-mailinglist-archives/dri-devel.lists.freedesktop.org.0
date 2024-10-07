Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C260699283B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 11:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F2B10E33E;
	Mon,  7 Oct 2024 09:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="rX6f/0U8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C967110E33C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 09:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1728293655; x=1728898455; i=markus.elfring@web.de;
 bh=E8AFC3vJAjHzrpqVDLoldFXTK/U5srUyH05spTlfP1w=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=rX6f/0U8f5wtmtxWrZmbLaBUzcCAsjuUakwZA9Nvdf+pYNhTqKiWDWaMbcmxHtcG
 RbqoXJbP18hyUwpsjJRBud/wwf8s0HyUSpJQUV7969GxZ2iE1gu5tZCw2laj+ujog
 Ubp7/87d5tzGMRSC1ZGAfyitE15IJ2LvIP1Zp2mkzcOslqyfClNfJUgI9+b2fOF+v
 la03gsOvjqbT8HqO4gfrb9Z4MEE8RZ54s3cYDnxvBiuoaWNvUtwP8KVUoRxDOIZGX
 6j9TCohZ0BeinzHxpKoCdgjNhKPe2bxJ/ejeVL4zENE3QbJOHzhjKZUOghjMIeuln
 PYOYJao80vNRTzLg+g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MA4fI-1t89CX08ja-009AV3; Mon, 07
 Oct 2024 11:34:15 +0200
Message-ID: <4e1d50de-8e00-47a3-94e0-5ee9c5df8755@web.de>
Date: Mon, 7 Oct 2024 11:34:13 +0200
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
References: <20241007013036.3104877-1-lanzano.alex@gmail.com>
Subject: Re: [PATCH v9 0/2] Add driver for Sharp Memory LCD
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241007013036.3104877-1-lanzano.alex@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rR2t7Wp2hZRiAb/yvZ9QgARwGiDDwzquxtShZ89SpcJPiec4qQB
 6bLSocXYLUlNWmFEpjB+t2lsProJxaVXkFnIipZELFqgz03WEDRwcu1awSTO12RQb+2JDDR
 G2lyvui1h9Aih3uiJWr5lvTsPH8ak29feabOGUhquhqKWumeIFsXU6nrgzhXqiM7EoXi9eL
 GkhHbba2YZyjdjkyhI4hg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:teEmP1NgyxY=;NTXvpEe1d0ucl3ou6FBsiGiNXEM
 wfsWbKpcr/5esT4j1RcosJawt4OhCv676VkbSL7veI4uf4d3pKD8MSoxBv2MWwllsySiNXX0V
 9tmBU5+lBm9fMKuvyUzGYsKjbYfY7I1i53ZjApx15089wDAHt8h6dibZzMSZh7TY3ZBLZdMrF
 UDXvpbdRGRt4zZB8rPFiFTxSyRtSiY8L5WB5/Y4uoHAr4jVRmW73DFmOBvVRjpQyFluoxPDhM
 co26t19Sv02s7P+rxWsFjlg9gyvsYmx33xN1zDwKwfA6O7+F3aWXo7XUcabebPhZXx9d8puee
 D5vD02NcecHtuFYFYC1EXGq2/1iVSTwkTU9Au5XdED6uv5KzzXmgNRWpuuIMt7WDXxZp7qL91
 qmlnNhpEugaGfYWNw8ILX96oRE+zFzaGjJEh2rwoyUwkHfmFWvc8QKbVZmpYLNqTwlK1fVpQr
 jn2n45ECm/LkwtAGDALqzBtdPaSCrCu1LFScy2XplHWBSEr9hepadI9KzF49sfLa+pS6ngxuE
 djEX34HmG6HtFjnG4VK5CTAqyS9bKKzNvO2jfmrvTHGI9GewXtwPMbqMJIpThwqGGsBwyRB0l
 46JtYDEkKssML1SBO78zbf+kkUOUDDba5giFfH3hCs6hgGymmSrkq3HjWKP/tKLvalm9c1/t4
 9mj8xM6XJLj0CcM/JZ1blQQBRoeDsGWIEv4mIefNro1JA2x8zSGpzM44htdWUfoDzcC+zS/Yv
 sNtDJrGTJKv/QhTjDezjU33hcNo4NbpAD2g1iFjihwcXJazA25bn8dpeLLq5k9uyvAiJI8H04
 YfFYOSzAMdKjrVLQkgfva+3Q==
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
> Changes in v9:
=E2=80=A6

Would you like to benefit from the application of scope-based resource man=
agement
(also for this software component)?

Regards,
Markus
