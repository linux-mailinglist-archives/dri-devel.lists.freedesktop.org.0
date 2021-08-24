Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D769C3F5E9A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 15:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AF589FDE;
	Tue, 24 Aug 2021 13:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E9B89FDE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 13:04:45 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210824130443euoutp0136a3cd3eb3503cf174722164a2de2fc9~eP9FVMiW51634816348euoutp01K
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 13:04:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210824130443euoutp0136a3cd3eb3503cf174722164a2de2fc9~eP9FVMiW51634816348euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1629810283;
 bh=hyyPvFzmmD+5gwItV1wV/ZgBCFwwiOaD7PtUyxbViyk=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=FPnGHYR/8fWepP0/JK/1AxZq18ri/NEi3HGhChQHS7PcBcJUPPiILjhUQ611jk+k3
 i0nphtvZV4UIPabiDc40KrEJSXpKIc6XbcC+vYDHzpIr9DKKoA1jRaVfTqF20Qht8k
 esbVN8Nok2W2JQ2EWdOonjE5wkV1rrAG9+WQllXY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210824130442eucas1p20bad27fb1af3856cf3c7ccd1aa60c948~eP9E4SXaG2273122731eucas1p2J;
 Tue, 24 Aug 2021 13:04:42 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id A6.6F.42068.A6EE4216; Tue, 24
 Aug 2021 14:04:42 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210824130442eucas1p276fb48e06a3cb497f95457f0993e2bed~eP9EYu0LG2273122731eucas1p2G;
 Tue, 24 Aug 2021 13:04:42 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210824130442eusmtrp149e4fd064239d5ebd7dda95e514987d3~eP9EX6B_R2967929679eusmtrp1w;
 Tue, 24 Aug 2021 13:04:42 +0000 (GMT)
X-AuditID: cbfec7f4-c71ff7000002a454-a3-6124ee6a57ec
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D9.B1.20981.A6EE4216; Tue, 24
 Aug 2021 14:04:42 +0100 (BST)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210824130441eusmtip17ac282730ec467c152aad3b5757bbb57~eP9DoPMeu3000130001eusmtip11;
 Tue, 24 Aug 2021 13:04:41 +0000 (GMT)
Message-ID: <53fd7c71-d362-683f-39e8-3aa313e92c04@samsung.com>
Date: Tue, 24 Aug 2021 15:04:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0)
 Gecko/20100101 Thunderbird/92.0
Subject: Re: [PATCH v3 4/8] drm/mipi-dsi: Create devm device attachment
Content-Language: en-GB
To: Maxime Ripard <maxime@cerno.tech>, Jonas Karlman <jonas@kwiboo.se>, Sam
 Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Neil Armstrong <narmstrong@baylibre.com>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Robert Foss
 <robert.foss@linaro.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <20210823084723.1493908-5-maxime@cerno.tech>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMKsWRmVeSWpSXmKPExsWy7djP87pZ71QSDd4vM7foPXeSyWL5mXXM
 Fle+vmezeD5/HaPFyTdXWSw6Jy5ht7i8aw6bxcKPW1ksZvz4x2hxqC/a4tOsh8wWK35uZbT4
 uWsei8WWNxNZHfg83t9oZfe4c+48m8fOWXfZPWZ3zGT1WLznJZPHiQmXmDzuXNvD5rH92wNW
 j3knAz3udx9n8lgy7Sqbx+bT1R6fN8kF8EZx2aSk5mSWpRbp2yVwZTzddJyt4AFjxd9Nog2M
 Wxi7GDk5JARMJLYse8rexcjFISSwglHiy8RjzBDOF0aJR4d3soJUCQl8ZpTof2gA03H21m9G
 iKLljBJrZ55mgyh6zyix/VkoiM0rYCfxYsFSdhCbRUBV4urf9ewQcUGJkzOfsIDYogIJEs+X
 fmUCsYUF3CUmzV7BDGIzC4hLNH1ZyQqyQETgN7PElubzbBAJR4mbU4+BXcQmoCnxd/NNsDin
 gKXE3fXLWSFq5CWat84Ge0FCYD+nxKTOy0AJDiDHReLk1AiID4QlXh3fwg5hy0icntzDAmHX
 S9xf0QLV28EosXXDTmaIhLXEnXO/2EDmMAMtXr9LHyLsKPF9znQmiPF8EjfeCkKcwCcxadt0
 Zogwr0RHmxBEtaLE/bNboQaKSyy98JVtAqPSLKRQmYXk+1lInpmFsHcBI8sqRvHU0uLc9NRi
 o7zUcr3ixNzi0rx0veT83E2MwHR4+t/xLzsYl7/6qHeIkYmD8RCjBAezkgjvXyblRCHelMTK
 qtSi/Pii0pzU4kOM0hwsSuK8SVvWxAsJpCeWpGanphakFsFkmTg4pRqYSvqu3XOU2Rrstkyv
 09RhgXr4leb3iy2KFQ5KrfkYL29+6th6kykm4RbVxh3zmt/PvHLe7KHcsWcrI267nUlpv8HI
 uophxdGM6eLpnxu6P+8sDpw60U/vZqnnke+ykX1BDU5rVdsefVl96/jSmTyLPk4wOfT2msnV
 W+s4jA3+Bmhp/F3y+5p7v2jxpZk769ftYzG5cChc7pStltCEOUy5SZekpm7/O+9mtt/ZY+sW
 be/X9OSa96XgwgnrFe4XjtZttHZaNbnzz9R1VnxZb2dGrjpVGZZ623ONVJlJ6+nbWaqnq9NY
 /ixw1JtWt/JQ8688Jc/uPe0y6Q9nOZ6cVXHG4P3vk2kc2nNDDsZy84rdFldiKc5INNRiLipO
 BAA6Jvs+9gMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBIsWRmVeSWpSXmKPExsVy+t/xu7pZ71QSDT70ilr0njvJZLH8zDpm
 iytf37NZPJ+/jtHi5JurLBadE5ewW1zeNYfNYuHHrSwWM378Y7Q41Bdt8WnWQ2aLFT+3Mlr8
 3DWPxWLLm4msDnwe72+0snvcOXeezWPnrLvsHrM7ZrJ6LN7zksnjxIRLTB53ru1h89j+7QGr
 x7yTgR73u48zeSyZdpXNY/Ppao/Pm+QCeKP0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUM
 jc1jrYxMlfTtbFJSczLLUov07RL0Mp5uOs5W8ICx4u8m0QbGLYxdjJwcEgImEmdv/QayuTiE
 BJYySkze+IcNIiEusXv+W2YIW1jiz7UuNoiit4wSp69+YAdJ8ArYSbxYsBTMZhFQlbj6dz1U
 XFDi5MwnLCC2qECCxO7DXWBxYQF3iUmzV4ANZQZa0PRlJSuILSLwl1niy6JYiLijxM2px1gh
 lu1mlDg7/TNYM5uApsTfzTfBruMUsJS4u345K0SDmUTX1i5GCFteonnrbOYJjEKzkNwxC8m+
 WUhaZiFpWcDIsopRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMwCWw79nPLDsaVrz7qHWJk4mA8
 xCjBwawkwvuXSTlRiDclsbIqtSg/vqg0J7X4EKMpMDAmMkuJJucD01BeSbyhmYGpoYmZpYGp
 pZmxkjivyZE18UIC6YklqdmpqQWpRTB9TBycUg1MszZ8/hSklHznq+k2Je2Yh3de7b945djv
 oA/+/Y/enxPv33ykqP2rkl9N1dX/cwvZNIM+uQk9y1B4pnF5J49inHujqYzhSvWEFcp5nWIv
 98UdYIkTXMpRVM56rfqxSrX5y6VXZR5Zup28wWDSdsm7TtWsedNFbobVP2oWTcpjOtlvw/Pu
 puTN4PMXK3gDOIpbHqT8DRa32CHFIm2/c+VlxZilf9TPpIZEaR2bxDhF+uDftfc+f3n86pCo
 6tZ4770iWdP+cOX2bTBa7qL2Y6fI+QPMXCflRYqmW3q3zmpdsS72NIf9zTkpBwSr5Z/cOjYp
 zmr+jduf2LY1zX2e/In1Wd2eQ8wVdsxdhx4W3T0zW4mlOCPRUIu5qDgRAKK9L4GLAwAA
X-CMS-MailID: 20210824130442eucas1p276fb48e06a3cb497f95457f0993e2bed
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210823084758eucas1p2f4308b4435ef19643685d82e9bac977d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210823084758eucas1p2f4308b4435ef19643685d82e9bac977d
References: <20210823084723.1493908-1-maxime@cerno.tech>
 <CGME20210823084758eucas1p2f4308b4435ef19643685d82e9bac977d@eucas1p2.samsung.com>
 <20210823084723.1493908-5-maxime@cerno.tech>
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


W dniu 23.08.2021 o 10:47, Maxime Ripard pisze:
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>


Missing description.

With this fixed:

Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Regards
Andrzej


