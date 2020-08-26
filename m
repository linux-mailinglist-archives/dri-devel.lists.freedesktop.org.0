Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD24253414
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 17:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A3A88DF8;
	Wed, 26 Aug 2020 15:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA6388DF8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 15:56:08 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200826155607euoutp02b8a20bb1d24ea20d80687c943022dd2b~u3IG5LZG40127001270euoutp02k
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 15:56:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200826155607euoutp02b8a20bb1d24ea20d80687c943022dd2b~u3IG5LZG40127001270euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598457367;
 bh=797iMJmF4byuxy4fF7Nm01q6tzaVQ6LfJQEWT6x0h6g=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=ORyDOvzJUvj6l0GGdlbOjoxeEmDxWdJL18OmWJC3c0aka0UcPtEc96EGUa7Bc2byK
 i09gpvZ2/IQdA0mTovsG6i58VK7FRLbSHE5YVoOTFlC8z512FZSEl4RnIlvdVn4Paw
 S54bPq/tGQNKBrJnKpopGahgBwEhFKyJOhWsewxM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200826155607eucas1p17c291ea7c3c04c74e520bd6f0593a96f~u3IGfxZEa0034300343eucas1p1l;
 Wed, 26 Aug 2020 15:56:07 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 67.EF.06456.616864F5; Wed, 26
 Aug 2020 16:56:06 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200826155606eucas1p13dc2a56112531c6cf9cb3f75a23beae2~u3IGCQ5Fo1505315053eucas1p1E;
 Wed, 26 Aug 2020 15:56:06 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200826155606eusmtrp1eeba4d742022840ab062dcf6c9121c0c~u3IGBkoho2120121201eusmtrp1J;
 Wed, 26 Aug 2020 15:56:06 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-ef-5f46861636a6
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 17.F6.06314.616864F5; Wed, 26
 Aug 2020 16:56:06 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200826155605eusmtip11da46399c815ab3a3ebc146124f2e163~u3IEwUb0f2185021850eusmtip1z;
 Wed, 26 Aug 2020 15:56:05 +0000 (GMT)
Subject: Re: [PATCH 1/2] drm/exynos: dsi: Simplify with dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim
 <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim
 <kgene@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <5fe9318a-8ad7-a223-7ae0-38cff601fb69@samsung.com>
Date: Wed, 26 Aug 2020 17:56:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826145513.10657-1-krzk@kernel.org>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHeXbv7q7DyXVaHkwMh0FKambChUIsREefepEiK23lRU3ny6am
 9UERE7VsppE2TZYkTqmUq86XynKlQ2zqfAktc4UhviSKb5hppbuT/PY///M7zzl/eEhM3Mt3
 JmPikxlFvCxOQghxXdevPq+9OcERh/NGj9AFvd08+q/uAUYPrcwTdJG5EKenxk04rZqYxei+
 vnoBbcz6KaDZiU98erCtnKBL+9p5dGnxNBFoK32zqsGlbG0eIW1e/caXmu8aeNKGZxnS+421
 SLrEup4WhAmPRzJxMamMwifgqjD690w+kdjKS+vfaBVkohxePrIhgToKj8q/8/ORkBRTWgTl
 XVqCK5YRDFYUYFyxhODrc41gZ6Sho9lKVSNQLSxaqXkEJfNl+DblQIVAYYWKt91wpF5jkFc7
 bhknKA/YbBgltrWICgC2p9qiceoA1A/PWpg9VDg0GYZ5HGMP3Y9/WB61ofxhcqbDwmPUfmie
 K8c47QRZyzWWFEANCGBtrc56axCs5y3gnHaAGUOj1XeBnuJ7Vj8DzNpsjBvORdBU34pxjWMw
 1ru+tY3c2uABdW0+nH0CdKZO/rYNlB2MzNlzN9hBka4E42wR5OaIOdoNzMYm64NOUNW/QnBa
 Ch/eLqBC5KbelVK9K5l6VzL1/xs0CK9FTkyKUh7FKH3jmZveSplcmRIf5X09Qc6irV/W88ew
 2IJWBq7pEUUiia3oYERwhJgvS1Wmy/UISEziKDpp7AkXiyJl6bcYRUKEIiWOUerRPhKXOIn8
 KqeviKkoWTITyzCJjGKnyyNtnDNR7kPjWjZfo/V9SmkupN2+8WWxsOxVZ2D0VFelL/8zWzUo
 b/Z8EsouJLWbNoz+odN+Kt2lkNx1/bCkYz2g44467czq+fcuBnd28uxmxoZJODK0lsQOqlZj
 a1yDJj+6egU62r88p7potgszvXNXFRUFtxxKvxwLp1pfjOkZCV0lwZXRMl9PTKGU/QNIqAYK
 YQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRmVeSWpSXmKPExsVy+t/xu7pibW7xBv9my1v0njvJZPF/20Rm
 iytf37NZTLo/gcXixb2LLBb9j18zW5w/v4Hd4mzTG3aLTY+vsVpc3jWHzWLG+X1MFjMmv2Rz
 4PHY+20Bi8emVZ1sHtu/PWD1uN99nMlj85J6j74tqxg9Pm+SC2CP0rMpyi8tSVXIyC8usVWK
 NrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0Mv4/aqLrWAnU8WFPzvZGxjbmLoY
 OTkkBEwkNh/czgZiCwksZZQ4t80DIi4usXv+W2YIW1jiz7UuoBouoJq3jBIPD/8CaxYWcJeY
 MK+fCSQhIrCHWaL1bTcLRFUHo8Sqtn4WkCo2AU2Jv5tvgq3gFbCT2HR6OZjNIqAqseHqa3YQ
 W1QgTuJx739miBpBiZMzn4D1cgqYSjx7dRCsnlnATGLe5ofMELa8xPa3c6BscYmmLytZJzAK
 zkLSPgtJyywkLbOQtCxgZFnFKJJaWpybnltsqFecmFtcmpeul5yfu4kRGKPbjv3cvIPx0sbg
 Q4wCHIxKPLwa8W7xQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEotyo8vKs1JLT7EaAr03ERm
 KdHkfGD6yCuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwNi0RWeG
 TeXL6VW/ct3c3wS+jnSQf9+8yCBX1OXqZlXuKuNY6Xn9LQGLb6us2lwue8D3/7fzT4TONR2d
 G59T3a/V6Pn81epbTuIC3Zrzucv75jxhtQxqvxNwZ5WF+u+fBtsmiqQ6XlDPWqfFUrm08Om7
 vI5bplpLnPvv3kwVdOLPVv9bzRijpcRSnJFoqMVcVJwIAILifU/nAgAA
X-CMS-MailID: 20200826155606eucas1p13dc2a56112531c6cf9cb3f75a23beae2
X-Msg-Generator: CA
X-RootMTR: 20200826145528eucas1p10342e7d1c88a31adfcea420f8c80af81
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826145528eucas1p10342e7d1c88a31adfcea420f8c80af81
References: <CGME20200826145528eucas1p10342e7d1c88a31adfcea420f8c80af81@eucas1p1.samsung.com>
 <20200826145513.10657-1-krzk@kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 26.08.2020 16:55, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Regards
Andrzej
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
