Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB70A4E9B2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 18:46:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D36710E389;
	Tue,  4 Mar 2025 17:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="iOuR5pQS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from beeline2.cc.itu.edu.tr (beeline2.cc.itu.edu.tr [160.75.25.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A7B10E389
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 17:46:26 +0000 (UTC)
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr
 [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline2.cc.itu.edu.tr (Postfix) with ESMTPS id 5053A40891B5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 20:46:25 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr; dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=iOuR5pQS
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6gQQ1xcyzG28Q
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 19:01:02 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id 0153242725; Tue,  4 Mar 2025 19:00:21 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b=iOuR5pQS
X-Envelope-From: <linux-kernel+bounces-541317-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b=iOuR5pQS
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
 by le2 (Postfix) with ESMTP id A874841B84
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 12:56:52 +0300 (+03)
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
 by fgw2.itu.edu.tr (Postfix) with SMTP id 5CD2C2DCDE
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 12:56:52 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89ABA171B30
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 09:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1101F30CC;
 Mon,  3 Mar 2025 09:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="iOuR5pQS"
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B2B1F1520
 for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 09:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=210.118.77.12
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1740995726; cv=none;
 b=TBqoNOc/v7J4tfj7mcAmtIsmAsP9IRNrA0ahuQhq3SMRftueNBn1p0YOdZZy/uYjoradSoOb108GT8HjNV2jQZOrwE0lTYscGEv97kEop5BL3562wpWNoeImVEIDhiwwEQRjP9/cb5047Yft+ht8Mhle8m1f29ggZKth9cKCZxI=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1740995726; c=relaxed/simple;
 bh=6dFKW+lioLDu60dHVNyKGbg+VYbzqtMUAtM10HSxmKE=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
 Content-Type:References;
 b=mFhGcmHfoOMfqM+eTOU6EuPzTDKrliDUNVJLItPnRsTXyYJOsUi9l6Oi7PTSHVgeCPgNUln26uCbDUCyr4RESSck23wTaM/0vM4VecTzksQ1t+4oYv7tUVNMa93ZjuCAnb3QhXRTAgJoCUs9d0I4K/F7geP+pRB+NOWAQjeXHnk=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none)
 header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b=iOuR5pQS; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250303095522euoutp029734b3b1c192f40d4c435687fcde8bfb~pQmK1sciJ2969329693euoutp02h
 for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 09:55:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250303095522euoutp029734b3b1c192f40d4c435687fcde8bfb~pQmK1sciJ2969329693euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1740995722;
 bh=jkAx3oP1ERyW9hpWianokfe1kkMolVE+K5Ndsqy3gk0=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=iOuR5pQS7+qqFtOPV46S4Hy6dQuMPQhYuid5Ci7LELDTRFVkVQug3gKvcpxU135Mo
 1APKhmYi1jvFdS8DZZ/67aOStH8U6ztnCndaJuOAHa4dQZFCKwOmoY85IYUA/NvaMC
 bd9i0Z0/cgaARw/1oYfXFSJWfWfZ6M2GHxn1D95E=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250303095521eucas1p18b3e85146d3b4e58d374ee65443f510c~pQmKDy2hP1876818768eucas1p1H;
 Mon,  3 Mar 2025 09:55:21 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id A3.CF.20397.98C75C76; Mon,  3
 Mar 2025 09:55:21 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250303095521eucas1p24b0494320e01283259315a138346d672~pQmJhIYUQ1753017530eucas1p2w;
 Mon,  3 Mar 2025 09:55:21 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250303095521eusmtrp2a5ece5c802ffd421b11eeb5d30ebd786~pQmJgJtYD1593015930eusmtrp2I;
 Mon,  3 Mar 2025 09:55:21 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-c5-67c57c899582
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A8.7F.19920.98C75C76; Mon,  3
 Mar 2025 09:55:21 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250303095519eusmtip10a4185fb739894007312f6777ae0b061~pQmIDKL-s0171201712eusmtip1D;
 Mon,  3 Mar 2025 09:55:19 +0000 (GMT)
Message-ID: <4deba4d6-b82d-4e57-bd27-f4e1523b38ea@samsung.com>
Date: Mon, 3 Mar 2025 10:55:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/21] dt-bindings: clock: thead: Add GPU clkgen
 reset property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
 m.szyprowski@samsung.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <df625379-b472-45d9-87a4-8bf52a87ea1e@kernel.org>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTVxzHc+69vffSCFyqC2dgZOsIi4sCKrKTsZnBILlbjI+5OLcxt0Zv
 ihsUbGE4ZzIYyKxWZA5BO4TizEQUYawUigUmsNYK8lRKeBSz1QYqyKuCG6+1XN347/P7/h7f
 3+/k0LioifSjD8mSOblMEi8mhYTO+Hf7RuWxP6Sh47c2otuWSxiqmlNT6HpdG4aKmtsEyNql
 xdC9J+MkuvGwg0LDdekE6im5SKEMYzmJRtRWErW3V1BoUmUVoO7aAhJNn24GSDedSaKy5kEK
 FU9WEehyTS1AWcpfBKjzTgwatN4m0Ei3CkdZam+0ZKih0GLPrwT66XEDhbSjPwiQqexDlNmQ
 S7y9jh3vPU6xoyMjBNt0wkmxdTMagtWrBylWpW8FbGWpkmQHegwkW2jezQ6dMmHsb5e/ZTPL
 jBh7ZiGUHa+/T7LZ2lLAdmVYqF2ij4VvHuTiD33FyUO2fS6M+9HyO5l0njoydyedTAMVgpPA
 g4ZMGGydzXOxkBYxJQA6G3MBHzgBtOWMknwwDaA120A8b+m351F84gqAmefsGB+MAWgqMAJ3
 lSezDRqvGnE3E0wgrHfMULzuA80XbMuTXmAC4FDf+WV9NbMP3l3KX9bXMOuhZWF2eSmcMQhg
 Xi6/Lc74wj5bEeZmktkMH1wpWtY9XGaVZ0wYXxMAq8cKcHczZDqF8OS9689OjYYdT/tInldD
 h0lL8bwWLun5oZBJhA+qpnCej0G9yvSMI+BA2z+uXtplsB6W14bwciS0VbsPoF3sBXvHfPgV
 vOBZXT7Oy57wRJaIrw6C51Sn/zNtK9FhOUCsXvEq6hVHqlcco/7fVwOIUuDLpSgSpJxii4xL
 DVZIEhQpMmnwgcSESuD65y2Lpic1oMQxGdwIMBo0Akjj4jWeh99vloo8D0q+PsrJEz+Tp8Rz
 ikbgTxNiX89LDcelIkYqSea+5LgkTv48i9EefmkYvraw0JY7ry9XGu3K+Zc3KIOkZSETX+ze
 OewRTcTZHeaKIFwYle7YsXi3r+7G94GzHRHGv0IiU9Nl/rGf5Gzfs+Vp/l5zhKg7ZuujiMG6
 AIet18/of9PLkISNbR/3i+xUWcM+iMqeeGnDq4oU7d6jh4vN9c5rpaF77Kcy9s8syg6E3Wrw
 xi500Nc+zRLtiC23pD6O0UX/+XpAt05T9lHez5p5b5vw4bubO4db1r2zqvq7qy9i4RrDe4Fn
 fWUgdml4zrkT739lf/SmNxxF/lt9ar2akiam9EcGxNmOFt+09igf+9D8o/urrN+ET7U2dV0c
 DZ/u17+F7Vu4OVcVkF+cPLhLKyYUcZJNr+FyheRfLoBNOFYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKKsWRmVeSWpSXmKPExsVy+t/xu7qdNUfTDS6dYLc4cX0Rk8XW37PY
 LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWZw/v4Hd
 4mPPPVaLy7vmsFl87j3CaLHtcwubxdojd9ktFn7cymKxZMcuRou2zmWsFhdPuVrcvXeCxeLl
 5R5mi7ZZ/Bb/9+xgt/h3bSOLxex3+9kttryZyGpxfG24Rcv+KSwOch7vb7Sye7x5+ZLF43DH
 F3aPvd8WsHjsnHWX3aNn5xlGj02rOtk87lzbw+Yx72Sgx/3u40wem5fUe7SsPcbk0f/XwOP9
 vqtsHn1bVjF6XGq+zh4gFKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9n
 k5Kak1mWWqRvl6CXMfn6AbaCGewVv081sjUwbmDtYuTkkBAwkbj9bBp7FyMXh5DAUkaJy1sW
 QCVkJK51v2SBsIUl/lzrYoMoes0oceVpJxtIglfATuLYymPMIDaLgIrEvlff2CHighInZz4B
 axYVkJe4f2sGWFxYIELi9px7YLaIgKbE9b/fWUGGMgvsYZU4vPkz1IYXTBITJrwB28AsIC5x
 68l8JhCbTcBI4sHy+WDncQJt3tR/HCjOAVSjLrF+nhBEubzE9rdzmCcwCs1CcscsJJNmIXTM
 QtKxgJFlFaNIamlxbnpusaFecWJucWleul5yfu4mRmD62nbs5+YdjPNefdQ7xMjEwXiIUYKD
 WUmEtzDoSLoQb0piZVVqUX58UWlOavEhRlNgWExklhJNzgcm0LySeEMzA1NDEzNLA1NLM2Ml
 cV63y+fThATSE0tSs1NTC1KLYPqYODilGpjWZbgu4amz51zbvclj01cdjUnB7xdYVmeqrsja
 lHJliV3H+hP8nxQuRrvencq9k2vizncTfDeoHDXxEroaIDXvaVrAp50rXHLqeb1YD5dXV65r
 OnP2V0SUxt1/7U2vJDZNPiWQeWI2v6KlFPOXpx+c/rTf3Cmafr15/9VDZ1t3Pc5kT2itOHtv
 gi/PQ9aDUk9vnv2anRFst4T7z5o7Sp8fr+TScqlPaLc6/t9e6P7aFRd4jHcy/wxgWhj587da
 MPPRuJc274uC26W89PNKEmaLttVONk4XNL0ntLT1Q6jM/EDbr4GLe9Ojj889anB45bzO3cdm
 M561sA2U4Ei78O/s/RbH6QqT/ry5Ujf/L6O0EktxRqKhFnNRcSIACJJKEugDAAA=
X-CMS-MailID: 20250303095521eucas1p24b0494320e01283259315a138346d672
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219140301eucas1p249b17ca44832eb8caad2e9ad0e4f8639
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140301eucas1p249b17ca44832eb8caad2e9ad0e4f8639
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140301eucas1p249b17ca44832eb8caad2e9ad0e4f8639@eucas1p2.samsung.com>
 <20250219140239.1378758-10-m.wilczynski@samsung.com>
 <20250221-imaginary-ebony-macaque-aace8d@krzk-bin>
 <7296ddb3-2096-4414-bfa4-28fc5bb8ec86@samsung.com>
 <df625379-b472-45d9-87a4-8bf52a87ea1e@kernel.org>
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for
 more information
X-ITU-Libra-ESVA-ID: 4Z6gQQ1xcyzG28Q
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741715097.34757@b9Ic/+gcwNFRhNquGfUXyw
X-ITU-MailScanner-SpamCheck: not spam
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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



On 3/3/25 09:52, Krzysztof Kozlowski wrote:
> On 03/03/2025 09:42, Michal Wilczynski wrote:
>>>> +allOf:
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: thead,th1520-clk-vo
>>>> +    then:
>>>> +      required:
>>>> +        - resets
>>>
>>> else:
>>> ? What's there? Also reset or no?
>>
>> If the else: case the reset is not required, as it's only required in
>> the th1520clk-vo, so there is no need for else:.
> That's not the question. I know it is not required, I can read code.
> What is in the hardware?

I noticed the register SW_GMAC1_GRST_N in section 5.4.2.2.66 of the
manual (GMAC1_SWRST [2]), which indicates a GMAC1 CLKGEN soft reset.
Although this could theoretically reset part of the AP clock, it is not
actually used by the AP clock driver or needed for initialization.

> 
> Best regards,
> Krzysztof
> 

