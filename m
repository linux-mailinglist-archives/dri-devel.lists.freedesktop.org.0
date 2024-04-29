Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A808B5DB7
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 17:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC53D10E6F2;
	Mon, 29 Apr 2024 15:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="ZMUgHpAK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3A910E6F2;
 Mon, 29 Apr 2024 15:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=/TMieuIYSHO4gvXYmD/QV218MQNhKby9ucs7zLNNfzE=;
 t=1714404615; x=1714836615; b=ZMUgHpAKkHdLYt1Cbg+iFC0cp5DmcXHiZgWqepiCwHheyS4
 Iq1TlksdFYG4YU6hDnQjjiMxY6vPdxgqF3NWXJw3jK58ZSIzXCAQrNmhmhO99ghj6gsO3QR3+EG5b
 CaC5HtoeVXB9/6tPpoixSMYlDaUqFNqwA6ZHoZ0iFxJgeuohy/B992bIW1e/xWSkTYEvmWz/6jSqe
 TS9o3E/Qgx4h2XewNFQBRAFL7u0hOsaqnsKXNymcjHQTkkrRLpcMDfWir/8lidEa9f9dhgbNQfGtS
 SnORICJK3hAHwvTQp0uXivUJ/N8Ws39RvWa4d3sayn8TtMWwucMo1xq9e6fIuMUw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1s1SxD-00069R-Fy; Mon, 29 Apr 2024 17:30:07 +0200
Message-ID: <c819df1c-4215-41bb-b24b-563a912d160f@leemhuis.info>
Date: Mon, 29 Apr 2024 17:30:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: nouveau: r535.c:1266:3: error: label at end of compound statement
 default: with gcc-8
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 lkft-triage@lists.linaro.org, Linux Regressions
 <regressions@lists.linux.dev>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>,
 Anders Roxell <anders.roxell@linaro.org>
References: <CA+G9fYu7Ug0K8h9QJT0WbtWh_LL9Juc+VC0WMU_Z_vSSPDNymg@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <CA+G9fYu7Ug0K8h9QJT0WbtWh_LL9Juc+VC0WMU_Z_vSSPDNymg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1714404615;
 01e90d93; 
X-HE-SMSGID: 1s1SxD-00069R-Fy
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 29.04.24 17:06, Naresh Kamboju wrote:
> Following build warnings / errors noticed on Linux next-20240429 tag on the
> arm64, arm and riscv with gcc-8 and gcc-13 builds pass.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Commit id:
>  b58a0bc904ff nouveau: add command-line GSP-RM registry support
> 
> Buids:
> --
>   gcc-8-arm64-defconfig - Fail
>   gcc-8-arm-defconfig - Fail
>   gcc-8-riscv-defconfig - Fail
> 
> Build log:
> ----
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c: In function 'build_registry':
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1266:3: error: label at
> end of compound statement
>    default:
>    ^~~~~~~
> make[7]: *** [scripts/Makefile.build:244:
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.o] Error 1

TWIMC, there is another report about this in this thread (sadly some of
its post did not make it to lore):

https://lore.kernel.org/all/162ef3c0-1d7b-4220-a21f-b0008657f8a5@redhat.com/

Ciao, Thorsten

> metadata:
>   git_describe: next-20240429
>   git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>   git_short_log: b0a2c79c6f35 ("Add linux-next specific files for 20240429")
>   arch: arm64, arm, riscv
>   toolchain: gcc-8
> 
> Steps to reproduce:
> ----
> # tuxmake --runtime podman --target-arch arm64 --toolchain gcc-8
> --kconfig defconfig
> 
> Links:
>  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2flcoOuqVJfhTvX4AOYsWMd5hqe/
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240429/testrun/23704376/suite/build/test/gcc-8-defconfig/history/
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240429/testrun/23705756/suite/build/test/gcc-8-defconfig/details/
> 
> 
> --
> Linaro LKFT
> https://lkft.linaro.org
> 
> 
