Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C7AB19CDB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 09:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E0C10E406;
	Mon,  4 Aug 2025 07:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="YmCZicYT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F33B10E406
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 07:44:31 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250804074430euoutp0101c682c781971264136800f6ee634cb4~YgJ3QZdU32965929659euoutp01r
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 07:44:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250804074430euoutp0101c682c781971264136800f6ee634cb4~YgJ3QZdU32965929659euoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1754293470;
 bh=XCJ4mUS0Zqljxl+0xsR/Xtr1rtJVfd83zF4hgcLgcl0=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=YmCZicYT5HoZX3M1/LaR+Jmyyq2lLLXBPgiL3pXa9gYoHic8us3f1wyxeFENatqcb
 KAOKZqN3yiBn66HXbYLOQ+FS6Cs75FPrI+uwYu6gwNYKvezeOxWjtWyTWTXZfuWfNr
 SbZ8uE4egR1Rj07WFZGDnQAz9P+zYuyDRtuAqGZ4=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250804074429eucas1p2e907080fb8c5fb239004bcc0a2bcd7e6~YgJ2oZ12f1992219922eucas1p2x;
 Mon,  4 Aug 2025 07:44:29 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250804074428eusmtip16818df9316fcfbaa64df92efe7047970~YgJ1kJHR50614106141eusmtip1O;
 Mon,  4 Aug 2025 07:44:28 +0000 (GMT)
Message-ID: <6caeecdd-cf9a-41af-a744-40831c81fb96@samsung.com>
Date: Mon, 4 Aug 2025 09:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/4] Add TH1520 GPU support with power sequencing
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel
 <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Drew Fustini <fustini@kernel.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20250804-sociable-sceptical-snake-f5ac8d@kuoka>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250804074429eucas1p2e907080fb8c5fb239004bcc0a2bcd7e6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250801103104eucas1p1dae57601c48faae879b154f11af8a4f1
X-EPHeader: CA
X-CMS-RootMailID: 20250801103104eucas1p1dae57601c48faae879b154f11af8a4f1
References: <CGME20250801103104eucas1p1dae57601c48faae879b154f11af8a4f1@eucas1p1.samsung.com>
 <20250801-apr_14_for_sending-v10-0-e85802902a29@samsung.com>
 <20250804-sociable-sceptical-snake-f5ac8d@kuoka>
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



On 8/4/25 08:13, Krzysztof Kozlowski wrote:
> On Fri, Aug 01, 2025 at 12:31:00PM +0200, Michal Wilczynski wrote:
>>
>> v10:
>>  - Squashed the two dt-binding patches back into a single commit.
>>  - Simplified the B-series GPU rule by removing the not clause.
>>  - Reverted the removal of the items definition from the top-level
>>    power-domain-names property, per maintainer feedback.
>>
> 
> You are using b4, so where are all the lore links for each previous
> version? b4 creates proper changelog, so why are you removing them?

Hi,
When I started this series, I was also just beginning to use b4 and
wasn't aware of that feature. I didn't think it was appropriate to
rework the changelog later, so I continued with the manual method. For
newer series, like the Rust support for PWM, I am doing it as you
suggested.

> 
>> v9:
> 
> Best regards,
> Krzysztof
> 
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
