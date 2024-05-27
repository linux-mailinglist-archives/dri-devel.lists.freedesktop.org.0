Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5068A8CFAEA
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 10:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB03910EB17;
	Mon, 27 May 2024 08:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="pgZWwmqF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6089310EB17
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 08:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1716797137; x=1717401937; i=markus.elfring@web.de;
 bh=tUhLW3gSQMrfMGYIaJy3UrTLpWoedEqeyBGARH45gtQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=pgZWwmqFhg/WGxzKaBPPNy/YH6jENnjw3g9zB9rmapBCAR1YFSIfCVBAEnt5Tl8g
 Eb4njblgMVITtrJEuiecbFk99whE2mr+H+Y6aONYhqwY3njOeXke3/FuiulU43QOa
 Rj2ANTms0NmnP9tNUGwgGNbn8vDUTUK1id0rRk+kSWE6u6tkXPYkkWfg7XHdx+7st
 2/f69hVPh6a2C3J8eq99No+6MDQsEE4HCRdTKUkxl8C6GUclFjTmRSevnjexjbFL6
 xRUyKvQ5Jcunp08Aly+8lqyGI1dJjf4SZYIz/jfX1cdsBkGbNMj9zERvwVtHVKYUY
 9MbmOgCh+FCPU49lqQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N5CUb-1sbFK82KVZ-00rtDW; Mon, 27
 May 2024 10:05:37 +0200
Message-ID: <9023736c-9200-4eb6-a254-8e7d0e0204fb@web.de>
Date: Mon, 27 May 2024 10:05:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] drm/loongson: Introduce component framework support
To: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20240526195826.109008-1-sui.jingfeng@linux.dev>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240526195826.109008-1-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Dz0NBNGIB9FBnJYsIivyNBdzqCc1nQQZfrq1t+MPBBgHP6v7Q5S
 BajyHOAUvekc7piKf/IUwwgyCpNYQj3BFg7Cm9vBw3FHFZFd0hlsrewUi6G+KPiUwAWCwpd
 XKrTHEpzkNYLrVtXAti9iBKLj71ST2yWUR+vRO86UHdwfnN4A6NlT2cZvOYVtyWamLjYFi1
 YWI/Y+XcE3mppx6aEYkkg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9Rnuh3skm0Q=;abL3an1p3naxwBsoYmxawzf6ScG
 GJ5s+hV5VMsODidBf4XAK76lA0szbq/jrorSHShcNSgJajZeZt+n+HsJKKG1EjXRMPf5x35Tw
 uP4jH2S7rkxo3BK8KVyhkSJ1DJql+50jWSX8Lz7J+DkLqGPjsW2TVPKauZxamZa8fR59T63VO
 rwy9Ew7yZk6x/D4UozSKkkXxB/9urBcRIqBpxXve4T4UtOnqHg/luSk/9HREOZL5haVFoKAUN
 6OTu/wLwNnNQ93+sCaP7k484y+JZIofX5c9o7Uqv6S+zE39m73i5R42wskidJ0SZtZwO5P2Re
 1mr+x9ddvijLJPF1bOGUxZ23ZEWqVsqOBFkIlQmWrgC+TTcEK8yMZHzNtE4QhvHMM+fmNr2yV
 P8xnbR1fqmpme34ti1qKd+OfD0Lmvs3dpOd86PePTYMp27m/KfQmWNYs237FRoDXH3/7kc0rz
 Mx6BsTSpU3fULwyM9lvReaIIzApxxUgAIgROD9tgvv0umLr1TDTOD/x5prGQTz7wFMpgkBGOe
 yCKWFXLo5PRUIZDegTXexmrs2npxiux3xSWM9XlwOgoeuGo9R3oQTCkf0wePmrS6AMIuhIAtB
 1dMevqFuuzZyQA//mCwEa8ScVUEnffn4rZiURvRVMUtj+IcmLi7207ixCmR7zWKhj3esGIHDP
 02lF1svbdC0GzTq39UJQQxp7wKm5HKf/9v/upUpEDbUsQDxHFg8kr5GJ7eH5D1RxIS4hwNqIj
 Nfu4HYkRNl0M8M2d6X1YeV3NeM0tcFz4GNkYrtCogvws7QkPxcWgYenEJ+91b8GvyBr2ReCFp
 SKMOHnpZv3/qZPsXFH80NyBOtUHzNkyUr/sSL8fNfTihM=
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

> Introduce component framework to bind child and sibling devices, for bet=
ter
> modularity and offload the deferral probe issue to submodule if it need =
to

                                                                     needs=
?


> attach exterinal module someday. Also for better reflect the hardware

         external?                 Reflect the hardware layout better?


> layout.
=E2=80=A6
> consists of encoder phy and level shifter. Well, the GPU are standalone

                                                           is stand-alone?


=E2=80=A6
> for the master, it could return the -EPROBE_DEFER back to the drvier cor=
e.

                                                                driver?


> This allows the master don't have to tear down everything, thereore

                                                             therefore?

Less typos would be nicer also for such a cover letter.

Regards,
Markus
