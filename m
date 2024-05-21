Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0098CB261
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 18:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D485610E00D;
	Tue, 21 May 2024 16:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fD3WuYjy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B40B89065;
 Tue, 21 May 2024 16:43:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4BB5162394;
 Tue, 21 May 2024 16:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84422C2BD11;
 Tue, 21 May 2024 16:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716309822;
 bh=v3vUZ+fHxZKCGYbCtA6MhT3zouHQA1W2ZrEaVPPX2wU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=fD3WuYjyxftV84YDlFyx0rHHTQPYLwkdScP/TVe8uhOVyRY8hYjADrHxi9HNgS5B+
 893r8/GtQFk8ymSVU0nEV9qKemeLHETQUrDB/c7C6hb6JUHnfQPA0zOZCNPheHHd1I
 chm4F1aeFEnpcJtrDi/yo2feyb+iBTDsP7WT+8w8uMUhJ9exH2ImPw4+1tjWgV5tzr
 Bzg45VOtNnuXseepEaMAPtGhr0zMtElXJY/HCX/ybN0wzqU9vgLVDTF/+sScV9py4W
 M9X2nM8nVL+aLFWmdjVeu4PPiWAkjIFSbJxc9swExy9RUin4ZpHCDHF3ZIZ5stukmG
 Db1stfMy3ODFw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: kernel test robot <lkp@intel.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, bpf@vger.kernel.org,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arch@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [linux-next:master] BUILD REGRESSION
 124cfbcd6d185d4f50be02d5f5afe61578916773
In-Reply-To: <202405220033.NXFpd4Af-lkp@intel.com>
References: <202405220033.NXFpd4Af-lkp@intel.com>
Date: Tue, 21 May 2024 18:43:38 +0200
Message-ID: <87wmnncdz9.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kernel test robot <lkp@intel.com> writes:

> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-n=
ext.git master
> branch HEAD: 124cfbcd6d185d4f50be02d5f5afe61578916773  Add linux-next spe=
cific files for 20240521

[...]

> Error/Warning ids grouped by kconfigs:
>
> gcc_recent_errors

[...]

> |-- riscv-randconfig-r054-20240521
> |   `--
> drivers-irqchip-irq-riscv-imsic-early.c:error:too-many-arguments-to-funct=
ion-riscv_ipi_set_virq_range

FWIW, discussion/patch here [1]


Bj=C3=B6rn

[1] https://lore.kernel.org/linux-riscv/mhng-10b71228-cf3e-42ca-9abf-5464b1=
5093f1@palmer-ri-x1c9/
