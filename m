Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD6024E67D
	for <lists+dri-devel@lfdr.de>; Sat, 22 Aug 2020 11:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1046E422;
	Sat, 22 Aug 2020 09:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768436E0F4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 08:29:20 +0000 (UTC)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200821082918epoutp01892b91eed21ee015edd527d3875f852c~tOzjmcaRy1680316803epoutp01m
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 08:29:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200821082918epoutp01892b91eed21ee015edd527d3875f852c~tOzjmcaRy1680316803epoutp01m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1597998558;
 bh=757ebGkU0JEgQP6IMrgKFNdzXBLRSZo6WUgSmE8j6V0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AsFVQQfDHyDlx6781ctGurVqV4LKD0kCK0Z0KnQ1181gcQgyF1pfBbATbybdwGI6J
 G2je/DLSPs12OWDdrwyM9naNBV/RSb67OTGSe1BTqIgXXIO3z8e/qlbTe51U+L9m2M
 s3pVSajp3naIevqGz63hvV5IZFItHhj4ooWwQB/Y=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20200821082917epcas2p190e6901b795b25544147f8050b2a9d4a~tOzihz-sa2940229402epcas2p1B;
 Fri, 21 Aug 2020 08:29:17 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.190]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4BXvnR4SfzzMqYkl; Fri, 21 Aug
 2020 08:29:15 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 90.17.18874.BD58F3F5; Fri, 21 Aug 2020 17:29:15 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20200821082915epcas2p2360e0724e48af2520e98dd341985f2a4~tOzgjmXcm2923329233epcas2p2M;
 Fri, 21 Aug 2020 08:29:15 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200821082915epsmtrp164e71441c6c240cb6bbcaa42b0635653~tOzgiiO-93214632146epsmtrp1K;
 Fri, 21 Aug 2020 08:29:15 +0000 (GMT)
X-AuditID: b6c32a46-503ff700000049ba-e0-5f3f85db7c11
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 04.98.08303.AD58F3F5; Fri, 21 Aug 2020 17:29:14 +0900 (KST)
Received: from KEI (unknown [12.36.155.227]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200821082914epsmtip1c3e5b525457ad31f66f448869bbe8921~tOzgTHiAH2591325913epsmtip1A;
 Fri, 21 Aug 2020 08:29:14 +0000 (GMT)
Date: Fri, 21 Aug 2020 17:21:42 +0900
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/3] dma-heap: Devicetree binding for chunk heap
Message-ID: <20200821082120.GA191570@KEI>
MIME-Version: 1.0
In-Reply-To: <20200818164812.GA3602349@bogus>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te1STdRjH+73b3ncg6Ato/FydgJkZ6IBhw58XTHPRS6DQkTxdtDXhjXEc
 29qYpv+I3EFuWpguhHkiEg4GLgjOAA22BBc3AbmEQCCI2iFsRNghoY0Xz+G/73P5/J7n9zzn
 4bJcCwkeN1YRT6sVUjkfd2T/ZPIWCQZT3pT4VyR5omnLOQIVVJTjKLHJgqMxSydAUyN1HFRk
 buegntlpHJWeTcLRnH6MhVrnBai0/imG/u4ZxVC3sQBHWZXVHDRcvshButu9GCqZnSbQQnYj
 QCkNZgIt1tcSyDI0Q6Avu/Q4+uZMDtjjTqV0PcOp8sJyQHXnZGOU3qClDGUZOGWwnieozKke
 jLrXW49TLRfn2dTI2WaMGly4z6Kmb9zFqZyqMkC16s0E1dxfg1EzhlciyI/ku2S0NJpWe9KK
 KGV0rCImiB96ULJPIgr0FwqE29E2vqdCGkcH8cVhEYLgWLltFnzP41K51uaKkGo0fL/du9RK
 bTztKVNq4oP4tCparhIKVb4aaZxGq4jxjVLG7RD6+weIbJmfymVl9//DVMOrv2g3X8cSwKRT
 JnDgQvIN2PGdiZ0JHLmuZC2Ac+e7AWNYAeyqvYkxxgyAhusz4DmSlDyxjBgB7E6sWzZGAWyZ
 zcLtWWxyI+x9mMeya5zcBFuqSpbotaQXnE+9wLEDLLKIDa39SZg94EaK4XjX6BLgTHrD6qJB
 nNEu8PalcbZdO5ACWHr1ii2Hy11HvgofN562vwNJkwNMaMggmPbE8Ou+Sg6j3eDj5qplPw8+
 yk1d1idgW/IYh4GTAbxz4S7OBLZC3YO0pU5ZpAxmXGtk24tBcgM0/8Zm3KthuukZwbidYXqq
 K0NugDdLCtmMXg/HrqVxmBQKZkz5MfP5HcCnN9LwPOChW/Ez3YpijN4C9XVWXGfDWeRL8PsF
 LiO9YYXRTw84ZeBFWqWJi6E1AaqAlds2gKVD8QmuBV9NPfFtAhgXNAHIZfHXOmc37JS4OkdL
 T56i1UqJWiunNU1AZNvTORZvXZTSdmmKeIlQFBAY6L9dhESBAYjv7nzaq/MTVzJGGk8fo2kV
 rX7OYVwHXgLmLr0y8K5lY3589eaysG/7Iktm20dO3vNnR+a3pjiFhxbntjkShtxVilXle+cq
 TIVvf3gw60SNJXyr+uEjomDY0D8hjj6useSeGn1vKtHN0vPakWTfSpcHicbCEJLIWzSJu97P
 7Z04FFG8+bMDNS+vqegw/psvmHDp8G37vD7FGDHwjon/hB9+4NhVXtjswMeHftmBzO1vxd46
 cpSX4rSeTpscnZf9Iav6a2fB60arWebx5yW9IqTTq7h3yOeHZN9QJDk8vqlly+5tv8bcekHj
 Whudbt579LLhTP1inu6D/dI9gr6QegXRenHKOlmjDf8xkvQQ3yH3rbn8z8/EkHW/YCj4sJnP
 1sikQh+WWiP9H3I5ewSxBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRmVeSWpSXmKPExsWy7bCSnO6tVvt4gw+7rSzen5rIbjFn/Ro2
 i6ZDp9gsHp26wGjx9v5uVov5R86xWlz5+p7NYmV3M5vF9wWPmC3O/Na1WLnnB5PFlysPmSwu
 75rDZtGzYSurxb01/1ktZp28xmSx7Ot7dot/vQcZLVr3HmG3+L9nB7vFqbuf2S0mX1rAZjG7
 sY/RQdyj9dJfNo8189Ywelzu62XyWLCp1GPTqk42j02fJrF7dL29wuRx59oeNo8TM36zeNzv
 Ps7kcfvfY2aP9/uusnn0bVnF6HFmwRF2j+M3tjN5fN4kFyAQxWWTkpqTWZZapG+XwJWx/NIm
 1oJ5PBV9N1ezNjAe4Opi5OSQEDCRaG55ytLFyMUhJLCDUWLlzeVsEAlJiVmfTzJB2MIS91uO
 sEIU3WeUOPJlNgtIgkVAVeLaiwnMIDabgLrEiS3LGEFsEQFFid9t08AamAXms0h83vsTrEFY
 wEXiyaWHYA28ApoSW+ffBtsmJPCAUeJfFyNEXFDi5MwnYPXMAloSN/69BLqCA8iWllj+jwMk
 zCmgK7FyxUJmkLCogIrEq4P1ExgFZyFpnoWkeRZC8wJG5lWMkqkFxbnpucWGBUZ5qeV6xYm5
 xaV56XrJ+bmbGMHJQEtrB+OeVR/0DjEycTAeYpTgYFYS4e3dax0vxJuSWFmVWpQfX1Sak1p8
 iFGag0VJnPfrrIVxQgLpiSWp2ampBalFMFkmDk6pBibGaN/29428hfa7lOIL7Z/2826V+iQm
 vCnbMFGi241nXeD/b/NFZkfU70wSLWr8vatqfWvl6S82176b5ZQ/3nlnife5l2cMXi7IUEy+
 NfeHvWK5AddzvtlvuzKDr3VcK2C993nTeRGhtvexHgKTrj/Z+/paf0d02oa9Pluuy9nsNX1k
 XFvgElajuqHxWfWz0O/LVu3IXyPnN581P4XHYKuzo8YUl01/n8teYly9QSpl3fmP+ydMcbko
 w7K76JgYk2hD4IZI+Z/pDzvPTfk/hW96rcz9hb77+H/dlt/s+db0edLVgm/aZudfv5gygS2K
 fUPm7bJ9O28ZPOr70SFUluYZpu6n8ePlpXb3Dp7U74VKLMUZiYZazEXFiQC4OSUDdQMAAA==
X-CMS-MailID: 20200821082915epcas2p2360e0724e48af2520e98dd341985f2a4
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----lWUYs60uNheWdrlwd5Sxb-jVEnyT8vPvqGqUNsoxLEsY2Otg=_4fc00_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200818074554epcas2p2702e648ba975ea6fbe33c84396b152a9
References: <20200818080415.7531-1-hyesoo.yu@samsung.com>
 <CGME20200818074554epcas2p2702e648ba975ea6fbe33c84396b152a9@epcas2p2.samsung.com>
 <20200818080415.7531-4-hyesoo.yu@samsung.com>
 <20200818164812.GA3602349@bogus>
X-Mailman-Approved-At: Sat, 22 Aug 2020 09:02:00 +0000
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
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org, afd@ti.com,
 labbott@redhat.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org, pullip.cho@samsung.com,
 surenb@google.com, akpm@linux-foundation.org, vbabka@suse.cz,
 linux-kernel@vger.kernel.org, lmark@codeaurora.org, minchan@kernel.org,
 joaodias@google.com, iamjoonsoo.kim@lge.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

------lWUYs60uNheWdrlwd5Sxb-jVEnyT8vPvqGqUNsoxLEsY2Otg=_4fc00_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

On Tue, Aug 18, 2020 at 10:48:12AM -0600, Rob Herring wrote:
> On Tue, 18 Aug 2020 17:04:15 +0900, Hyesoo Yu wrote:
> > Document devicetree binding for chunk heap on dma heap framework
> > 
> > Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> > ---
> >  .../devicetree/bindings/dma-buf/chunk_heap.yaml    | 46 ++++++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/dma-buf/chunk_heap.yaml
> > 
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/dma-buf/chunk_heap.example.dt.yaml: chunk_default_heap: 'alignment', 'memory-region' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> 
> See https://protect2.fireeye.com/v1/url?k=66da9090-3b1117ae-66db1bdf-0cc47a31309a-d3f5cc0866799e96&q=1&e=d42ef5a6-e7ba-494d-8f6b-faf451118f84&u=https%3A%2F%2Fpatchwork.ozlabs.org%2Fpatch%2F1346687
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://protect2.fireeye.com/v1/url?k=c99eded1-945559ef-c99f559e-0cc47a31309a-bcc831610d2ce1c6&q=1&e=d42ef5a6-e7ba-494d-8f6b-faf451118f84&u=https%3A%2F%2Fgithub.com%2Fdevicetree-org%2Fdt-schema.git%40master --upgrade
> 
> Please check and re-submit.
> 
> 

Thanks for reply. I missed alignment and memory-region on property.
I added and ran dt_binding_check, and all passed.

I will re-submit the patch v2.

Regards.
Hyesoo yu.

------lWUYs60uNheWdrlwd5Sxb-jVEnyT8vPvqGqUNsoxLEsY2Otg=_4fc00_
Content-Type: text/plain; charset="utf-8"


------lWUYs60uNheWdrlwd5Sxb-jVEnyT8vPvqGqUNsoxLEsY2Otg=_4fc00_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

------lWUYs60uNheWdrlwd5Sxb-jVEnyT8vPvqGqUNsoxLEsY2Otg=_4fc00_--
