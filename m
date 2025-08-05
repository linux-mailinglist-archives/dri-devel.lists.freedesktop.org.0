Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A06EEB1B158
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 11:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29C310E23F;
	Tue,  5 Aug 2025 09:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XJtxUTRg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE13310E140;
 Tue,  5 Aug 2025 09:40:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9B63D5C5E54;
 Tue,  5 Aug 2025 09:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59FD6C4CEF0;
 Tue,  5 Aug 2025 09:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754386856;
 bh=DqHY1zpYzzlz5LVeO4yvFF7rlaI5zemWDo4Gh7Yy+8Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XJtxUTRgWICQJuEfunk6SYkBwD+O9agYgwZooEmbAq2/axb780y6J0JHecmQ2bQRC
 967/GBiEp8Gs/lgibUWq23iqdLsLhXiKXF/IaG+xfmShgRpTyJGDXU1wUBp4AN1xqY
 LSUfC8eHpDMafw1X9CTN1ZopUKuRArhQVq/jyymsk3/0ZWmlR5QpZ1uKt/JWSqMFCe
 ozJHnQ0Oikn6LKdSsTHGrEACmXfQ32JOkn3hnjJbOvLbdCtgZUQ5sRsmaUE8/yX3uE
 PD/SAfBWBKZeNvvI5LeaazA2jqoconhxkC2N8hr06DFibDT0DF3igIrO7g6DmZBFxY
 QaIxIbSBYLhtQ==
Message-ID: <5c67e4eb-9e27-44fa-b027-cd08c10d986a@kernel.org>
Date: Tue, 5 Aug 2025 11:40:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/25] drm/gpuvm: Pass map arguments through a struct
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Caterina Shablia <caterina.shablia@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
 <20250730130050.1001648-2-himal.prasad.ghimiray@intel.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250730130050.1001648-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

This series is a bit of a mess on my end, can you please Cc me on all GPUVM
patches with my kernel.org address? Currently, some patches go to my Red Hat 
one, some to kernel.org and some to both.
