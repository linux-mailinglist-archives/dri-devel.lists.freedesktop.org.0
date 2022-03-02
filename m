Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FB24C9A12
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 01:48:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B82610E666;
	Wed,  2 Mar 2022 00:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AAE10E666
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 00:48:34 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20220302004832epoutp03961e3eaf385a41c3ae3d978f408f2078~Yaejh9OO22976429764epoutp03u
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 00:48:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20220302004832epoutp03961e3eaf385a41c3ae3d978f408f2078~Yaejh9OO22976429764epoutp03u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1646182112;
 bh=g8MoU63sw3XIixgasBMCK1cjIz737KkFB4MQNePIfdA=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=IgitYznP7RoVQTtxCLw8xUB+UzEdFrTPgAfh2Ju4nO6iEPspGr6au3DkFUxeaqiaT
 c8rWPeA2Snf51op/8dOwNQGQeZDstPBERqWb1cw6OMkXmmaQitkDCwIPiHvEPt0Krd
 aHJ5Tt3gA3qtB9+RAiVRRIlPndvbOwG5/Jql7P00=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220302004832epcas1p12cb79bab6a697a63de9402d486bf9f0f~YaejPbiyV2139221392epcas1p18;
 Wed,  2 Mar 2022 00:48:32 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.36.135]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4K7b8D12Bkz4x9Qb; Wed,  2 Mar
 2022 00:48:28 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 24.2E.64085.BDEBE126; Wed,  2 Mar 2022 09:48:27 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20220302004826epcas1p4b05a69a12945d6e146f183e98d99076e~YaeeDeNMC1998319983epcas1p4e;
 Wed,  2 Mar 2022 00:48:26 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220302004826epsmtrp29aa6be0b97fe451b296eaa6e950ec9e6~YaeeCsJt01498814988epsmtrp2X;
 Wed,  2 Mar 2022 00:48:26 +0000 (GMT)
X-AuditID: b6c32a35-9c3ff7000000fa55-57-621ebedb18fe
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F8.4E.29871.ADEBE126; Wed,  2 Mar 2022 09:48:26 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220302004826epsmtip1285db42e5eafd830033eff4f5220f0e6~Yaedyc8eQ0650106501epsmtip1c;
 Wed,  2 Mar 2022 00:48:26 +0000 (GMT)
Message-ID: <6270db2d-667d-8d6f-9289-be92da486c25@samsung.com>
Date: Wed, 2 Mar 2022 10:00:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 RESEND 21/24] drm/exynos/decon5433: add local path
 support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>
From: Inki Dae <inki.dae@samsung.com>
In-Reply-To: <b3c98aa3-751b-acc4-8e57-5566af27f922@canonical.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphk+LIzCtJLcpLzFFi42LZdljTQPf2Prkkg2XP2SzuL/7MYnHl63s2
 i41vfzBZzDi/j8li7ZG77A6sHrMaetk8Fu95yeRxv/s4k0ffllWMHp83yQWwRmXbZKQmpqQW
 KaTmJeenZOal2yp5B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl5gAtV1IoS8wpBQoFJBYX
 K+nb2RTll5akKmTkF5fYKqUWpOQUmBboFSfmFpfmpevlpZZYGRoYGJkCFSZkZ2xeuo+14Bt3
 xYZ3N9gaGI9wdjFyckgImEjsbf3B1sXIxSEksINR4nnjVCaQhJDAJ0aJGcs5IOxvjBJ7uuAa
 Hh5+xwIR38sosaXXBaL5PaPElIfvwRK8AnYSZ78+ZAWxWQRUJK71zmKGiAtKnJz5BKxGVCBC
 4uWRv2DLhAWCJbp3dLOD2MwC4hK3nswHi4sIpElc3P4VKl4qserCCzCbTUBVYuKK+2wgNqeA
 o8S938uhauQlmrfOZoY4tJFD4vJxOwjbReLdsz9QcWGJV8e3sEPYUhKf3+0F+15CYDKjxJ3r
 K1ggnBmMEod/XmeEqDKW2L90MtBFHEAbNCXW79KHCCtK7Pw9lxFiMZ/Eu689rCAlEgK8Eh1t
 QhAlShLHLt6AmiIhcWHJRDYI20Ni5qK1TBMYFWchBcssJO/PQvLOLITFCxhZVjGKpRYU56an
 FhsWGMLjOjk/dxMjOFlqme5gnPj2g94hRiYOxkOMEhzMSiK8F3/KJAnxpiRWVqUW5ccXleak
 Fh9iNAVGzkRmKdHkfGC6ziuJNzSxNDAxMzI2sTA0M1QS51017XSikEB6YklqdmpqQWoRTB8T
 B6dUA9PBC2vvtv46HLz0eVB4bQj7vjvdrWJN1kl5fV8qm0+cybJq9zG6N2eXqrb5l70Xi1ZO
 71h53EM1mrXLfKFQyFEzdRFx9l9OiUeuPpyfuY0v+KXGvS2szHt3L498diSnd6Ptjtx+a5e7
 gSzzE+uTAu/ty9rfcsTi7Q6Ldr6ZnKkFnI81/jid6Op+EThJqd5mO3Mwr/xuriX51Tc+1Xx7
 wmbcf3z6u3v1Kn/+fHO4fkvtfZXOxV4hq9JzPPsSinewRncyaH+4e98ptbjlcpqV4guHK/d3
 hmQzp7sdVHmR0ra2j1ulceHm6QqPLu2U9fq1fkeE6ab5/JmPt70wfWDPszr0W0OxnK2VzcSH
 bz/amiqxFGckGmoxFxUnAgC0sCIkHwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWy7bCSnO6tfXJJBp/n6lncX/yZxeLK1/ds
 Fhvf/mCymHF+H5PF2iN32R1YPWY19LJ5LN7zksnjfvdxJo++LasYPT5vkgtgjeKySUnNySxL
 LdK3S+DK2Lx0H2vBN+6KDe9usDUwHuHsYuTkkBAwkXh4+B1LFyMXh5DAbkaJGetuMXYxcgAl
 JCS2bOWAMIUlDh8uhih5yyhx69dZFpBeXgE7ibNfH7KC2CwCKhLXemcxQ8QFJU7OfAJWIyoQ
 IdG2bApYXFggWKJ7Rzc7iM0sIC5x68l8JhBbRCBNYtX93ywQ8VKJb9N/sEIs+8woMaHtPxtI
 gk1AVWLiivtgNqeAo8S938vZQY5jFlCXWD9PCKJXXqJ562zmCYxCs5CcMQvJulkIHbOQdCxg
 ZFnFKJlaUJybnltsWGCYl1quV5yYW1yal66XnJ+7iREcHVqaOxi3r/qgd4iRiYPxEKMEB7OS
 CO/FnzJJQrwpiZVVqUX58UWlOanFhxilOViUxHkvdJ2MFxJITyxJzU5NLUgtgskycXBKNTDt
 S1z5TWAfV0PG9HXR9qnxC1YHbn8XbKG3c25X/7v2QuG96w30ZkZ5mpSsP/Ex+8ahmXp7gkLu
 KJdNz+mJaXhVPdlRTd3XrUhi2XWl4Mm7l13bVuq8KOMaW5buAuFwv20mLx/38kw5finXKXFd
 TVZgnG5Vk2nehNO8URdXNWjNmrHU6M3/q8ntdh/ve3DNypWI05JfHKi/a+Mcu0irizP+/j5W
 1bL/5F2jla3befccKrnG1Hqt42mv7IxTGmddrld1lX97KOr4QmSmtVbtcsNZ9ldb55iuWTCn
 bo1eY1ntxn/hJyo67j17uZ3xr+KfQra7zCn9trOe/U6ue1I8wdrqhtqEgDeWur+OHf8YKaKl
 xFKckWioxVxUnAgAPN13vf0CAAA=
X-CMS-MailID: 20220302004826epcas1p4b05a69a12945d6e146f183e98d99076e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190325071401eucas1p10df709b256570f1aba9cbc4e875da1b3
References: <20190325071349.22600-1-a.hajda@samsung.com>
 <CGME20190325071401eucas1p10df709b256570f1aba9cbc4e875da1b3@eucas1p1.samsung.com>
 <20190325071349.22600-22-a.hajda@samsung.com>
 <b3c98aa3-751b-acc4-8e57-5566af27f922@canonical.com>
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

22. 2. 7. 01:51에 Krzysztof Kozlowski 이(가) 쓴 글:
> On 25/03/2019 08:13, Andrzej Hajda wrote:
>> GSCALERs in Exynos5433 have local path to DECON and DECON_TV.
>> They can be used as extra planes with support for non-RGB formats and scaling.
>> To enable it on DECON update_plane and disable_plane callback should
>> be modified. Moreover DSD mux should be set accordingly, and finally
>> atomic_check callback should be used to limit the number of active planes.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 80 +++++++++++++++----
>>  drivers/gpu/drm/exynos/regs-decon5433.h       |  6 ++
>>  2 files changed, 72 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ex
> Hi guys!
> 
> I am working on DRM bindings conversion to DT schema format and I found
> this set only partially applied. I merged the DTS patches ("dsd" clock),
> but I think the driver and bindings were not picked up.
> 
> Nevertheless I am going to include the "dsd" clock in the new bindings,
> so the DTS passes DT schema checks. Let me know if other approach
> (revert of DTS change) should be taken.
> 

Sorry for late response.

As of now, "dsd" is a dead property not used anywhere.
This patch series makes real user not to work correctly due to ABI change.
How about reverting it until this patch series is merged after fixing the real user problem?

Thanks,
Inki Dae

> Best regards,
> Krzysztof
> 
