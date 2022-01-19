Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA01493412
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 05:40:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003B010EE41;
	Wed, 19 Jan 2022 04:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1565D10EE45
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 04:40:29 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20220119044024epoutp03fc371fa3d1287dd7ba6c8a3905d4167d~LkjAtgB1F2570625706epoutp03m
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 04:40:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20220119044024epoutp03fc371fa3d1287dd7ba6c8a3905d4167d~LkjAtgB1F2570625706epoutp03m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1642567224;
 bh=D1UmcVuj0znNS1JaUCe6SRDz6GXCybBtJLT3N7ftdvs=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=H3yWK0L/3ycxuqx4dh5AXpvKN8WObQgQs2lld4nvi4HAec40h7UE6TZq6ducsh8AV
 auN6Q/w/SSPjhtxTBXFa2XfCXp1JzEnyFWuvkiyLygNbBm27BTwbWza4e4VRgJOucn
 ae0VndO6rtjgyoAyicpKZ+hgjldssNPhlA8eaM1s=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20220119044024epcas1p33c876a602c016e8ffbd05eebf2a61fd5~LkjAfyfzZ0149301493epcas1p3g;
 Wed, 19 Jan 2022 04:40:24 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.232]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4JdtH46n2jz4x9Qc; Wed, 19 Jan
 2022 04:40:16 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 D8.16.64085.B2697E16; Wed, 19 Jan 2022 13:40:11 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220119044011epcas1p2a41a76257d09da5467e227d07affaba6~Lki0RQTG-0560305603epcas1p2V;
 Wed, 19 Jan 2022 04:40:11 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220119044011epsmtrp18aa0655d947f563f2992e13ee4a0338b~Lki0QcSEi1910619106epsmtrp1O;
 Wed, 19 Jan 2022 04:40:11 +0000 (GMT)
X-AuditID: b6c32a35-9c3ff7000000fa55-71-61e7962b032b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 54.92.08738.B2697E16; Wed, 19 Jan 2022 13:40:11 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220119044011epsmtip1caf4dd660d11beac8f950145ad0dcabb~Lki0E5ACm1764117641epsmtip1h;
 Wed, 19 Jan 2022 04:40:11 +0000 (GMT)
Subject: Re: [PATCH] Revert "drm: exynos: dsi: Convert to bridge driver"
To: Robert Foss <robert.foss@linaro.org>
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <7125d35f-ad89-b4a2-6328-77a114661926@samsung.com>
Date: Wed, 19 Jan 2022 13:51:50 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAG3jFyshPasynXvWbyoeyAWnYXwMc76TwMnw2v_diHAOEFhHxg@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNJsWRmVeSWpSXmKPExsWy7bCmga72tOeJBv1f9SzuL/7MYnHl63s2
 iy+bJrBZdE5cwm5xqC/a4tOsh8wObB5rP95n9Xh/o5XdY3bHTFaPxXteMnncubaHzeN+93Gm
 ALaobJuM1MSU1CKF1Lzk/JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoDOU
 FMoSc0qBQgGJxcVK+nY2RfmlJakKGfnFJbZKqQUpOQWmBXrFibnFpXnpenmpJVaGBgZGpkCF
 CdkZ87tbWAq+slfsv7qaqYFxCVsXIyeHhICJxI8d24BsLg4hgR2MEkefnGOGcD4xSvSemMcO
 4XxmlLh5Zi8zTMvVt6egWnYxSnROamCFcN4zStxo+cMCUiUs4CGx+MdHsCUiAhoSxx8/YgQp
 YhZ4zijR9+EyWIJNQFVi4or7YDavgJ3Exbu3wZpZgOKb+z4zgdiiApES938sZ4eoEZQ4OfMJ
 WA2nQKDElxkdYL3MAuISt57MZ4Kw5SWat84Ge0JCoJdDYvnJRSwQd7tIPHr/HcoWlnh1fAs7
 hC0l8bK/jR2iYR+jxPJdJ6Gcw4wSzTubmSCqjCX2L50MZHMArdCUWL9LHyKsKLHz91xGiM18
 Eu++9rCClEgI8Ep0tAlBlChJHLt4gxHClpC4sGQiNOg9JP48O8Y8gVFxFpLfZiH5ZxaSf2Yh
 LF7AyLKKUSy1oDg3PbXYsMAQHuHJ+bmbGMGpVMt0B+PEtx/0DjEycTAeYpTgYFYS4ZWqf5Yo
 xJuSWFmVWpQfX1Sak1p8iNEUGNoTmaVEk/OByTyvJN7QxNLAxMzI2MTC0MxQSZx31bTTiUIC
 6YklqdmpqQWpRTB9TBycUg1MTCZeGT98rI8s3TB16W53d4/lHy1328VUl/HrKh457tgbt+eY
 /mKbKc97j++MnnRA4UDUxEBNZ4VVrmlThdIrd5xW1BD9mPmOeW5n6L+PIV7nPhnHb+Wd52l5
 3PH74p02EmJPi/YuUix+WKR3eOFPz2Mhc88ssXavFJmsGvBJ0fJh14kLfGZvfhzwq2PKNegR
 E6lOZJ21Uin4i+kxzlnLLFNn9R1+pF1tFiKnYde5bHvvcj7bk1kMGkK5gpUmLzp5Z3J3XfZu
 TD8946quNndX4vmwdgHZmBkCTQu3x3lfvHqMueD/zksOlhcDHot2mB98ofzhV0yZ6Gyeu3cr
 zrjs+rDW4E48++m1f2+GGQorsRRnJBpqMRcVJwIAb7iuGS4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGLMWRmVeSWpSXmKPExsWy7bCSnK72tOeJBrdeCVjcX/yZxeLK1/ds
 Fl82TWCz6Jy4hN3iUF+0xadZD5kd2DzWfrzP6vH+Riu7x+yOmawei/e8ZPK4c20Pm8f97uNM
 AWxRXDYpqTmZZalF+nYJXBnzu1tYCr6yV+y/upqpgXEJWxcjJ4eEgInE1bengGwuDiGBHYwS
 y799A3I4gBISElu2ckCYwhKHDxdDlLxllDj/aC4zSK+wgIfE4h8fweaICGhIHH/8iBGkiFng
 JaPE9t1nmEASQgLXmSTe7vUAsdkEVCUmrrgP1sArYCdx8e5tFhCbBSi+ue8zWL2oQKTEuuPL
 2CFqBCVOznwCVsMpECjxZUYHWC+zgLrEn3mXmCFscYlbT+YzQdjyEs1bZzNPYBSahaR9FpKW
 WUhaZiFpWcDIsopRMrWgODc9t9iwwCgvtVyvODG3uDQvXS85P3cTIzhqtLR2MO5Z9UHvECMT
 B+MhRgkOZiURXqn6Z4lCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeS90nYwXEkhPLEnNTk0tSC2C
 yTJxcEo1MFmuabt16dFPxdNaMzszlykqdHO5npw7S+Iup7oL36xXB6r+zZ7Txnn8yafUHd+f
 lAsd2p20UDXj2u/5mufXaPLsMu9ZdP/ilzdR004Isn6aXfGrydPcbVmf0fFv6ovXTAhZrNQg
 eeRF52NT5rqWFZmJkQvMq7mFsrs3GG3TyV70a9eiAC9bWan7ufJLfu1naXZdvTS9gZuVx+9i
 +IWjV9SM/Ts7ck791zr13C14+WYdqZcBTV1iPtZnyxWPFSYs/fnWmMU3ddkC1ob9659Wv6z5
 Ne//46NHGZ7ZxT/12+k076j8pGvKOjdOlt17wr5r2X3WCf0RXjEXSq+sP1kW4H+/ttxi6tf8
 tjLdjX6HYqcqsRRnJBpqMRcVJwIAG+kfqwkDAAA=
X-CMS-MailID: 20220119044011epcas1p2a41a76257d09da5467e227d07affaba6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220112100521epcas1p10beeb5ac3a77a212810822266badda3c
References: <20220111184347.502471-1-jagan@amarulasolutions.com>
 <CGME20220112100521epcas1p10beeb5ac3a77a212810822266badda3c@epcas1p1.samsung.com>
 <CAG3jFytb_huJfmzPxeOwwBKbRjD0KXq1X49G2ODbif_e5cYp4g@mail.gmail.com>
 <0804d45b-7ca3-1e2a-cff5-038309bea686@samsung.com>
 <CAG3jFyshPasynXvWbyoeyAWnYXwMc76TwMnw2v_diHAOEFhHxg@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

22. 1. 17. 오후 6:55에 Robert Foss 이(가) 쓴 글:
> Hi Inki,
> 
> On Fri, 14 Jan 2022 at 02:18, Inki Dae <inki.dae@samsung.com> wrote:
>>
>> Hi Robert,
>>
>> 22. 1. 12. 오후 7:05에 Robert Foss 이(가) 쓴 글:
>>> Thank you again for catching this and submitting a revert.
>>>
>>> Reviewed-by: Robert Foss <robert.foss@linaro.org
>>>
>>> Applied to drm-misc-next.
>>>
>>
>> Trivial thing I think but just notice. With this applying - original patch set and revert one, merge conflict may happen on drm-next because drm-misc-next has this patch set exynos-drm-next tree doesn't include.
>> Leaving this patch history in drm-misc-next is correct?
> 
> Thanks for paying attention to this.
> 
> If we end up seeing a conflict, the exynos patches can go in through drm-misc.
>

I mean is it correct to leave some patch set history - which is not reviewed and even not tested - exists in management tree?
Anyway, it depends on maintainer of this tree. :)

Thanks,
Inki Dae
