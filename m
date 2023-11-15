Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0BF7EC4D4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 15:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F7610E046;
	Wed, 15 Nov 2023 14:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8CCB410E046
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 14:12:56 +0000 (UTC)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
 by fd01.gateway.ufhost.com (Postfix) with ESMTP id 725DF24DB83;
 Wed, 15 Nov 2023 22:12:51 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Nov
 2023 22:12:51 +0800
Received: from [192.168.1.115] (180.164.60.184) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Nov
 2023 22:12:50 +0800
Message-ID: <e7c887a9-d08a-42e6-ac21-effa8e2e620b@starfivetech.com>
Date: Wed, 15 Nov 2023 22:12:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/fourcc: Add drm/vs tiled modifiers
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-4-keith.zhao@starfivetech.com>
 <nPUOGd5_-QuZTUXhGdmJ03Bri58JI0SeYVcBLnJG4aFuqobd5i1RUBVoi4CNP3VGg5oBdz5LAGdwHERxtMwXJyHPyVxJz4UpiBuFiA5NlkA=@emersion.fr>
 <2wq8ssA4KblYH5JfC8KxeWWoYPleN_BcH6wSZ92tkOixbiU5k2ZU_lS4lO0awCCeomkdjsEoVlUmAH7aaaR2n-bdLKu1AaSar_JW78Kw4Ik=@emersion.fr>
From: Keith Zhao <keith.zhao@starfivetech.com>
In-Reply-To: <2wq8ssA4KblYH5JfC8KxeWWoYPleN_BcH6wSZ92tkOixbiU5k2ZU_lS4lO0awCCeomkdjsEoVlUmAH7aaaR2n-bdLKu1AaSar_JW78Kw4Ik=@emersion.fr>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX161.cuchost.com
 (172.16.6.71)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
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
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Shengyang
 Chen <shengyang.chen@starfivetech.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Maxime Ripard <mripard@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, Rob
 Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Bjorn Andersson <andersson@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ok=EF=BC=8C I will do this in my next patch
Thanks your advice!

On 2023/10/25 23:44, Simon Ser wrote:
>  it seems like you could start with just simple
> enumerated modifiers like Intel does, and then only switch to more
> complicated logic with macros and fields if there is an actual need in
> the future.
