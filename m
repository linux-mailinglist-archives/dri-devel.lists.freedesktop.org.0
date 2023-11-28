Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6E77FBAB9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 14:01:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DC810E50C;
	Tue, 28 Nov 2023 13:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F47B10E517
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 13:01:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0CEAB61662;
 Tue, 28 Nov 2023 13:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F530C433C8;
 Tue, 28 Nov 2023 13:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701176460;
 bh=eNb/d406xgQ2BUi6ZWkdGu1qWx39Tq+M5tbfHdAGKkM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cdiir+Q2TW0rww5fa2/2e3cP5h8izbrR0u2XfDnFsYv7xNcXKv/zbISEpF975L98H
 gCzb11396ZNw8/8C5bI36zQYP6vdovckqEu4YR2RhPzuFnLeEOmsgICtymjZ7vZx3u
 B07Tdmqis+Qih87D0jTXo/BE0/mjHHUq4QDKfRgmmopVgHLx9UJKKalGeENSM2Kd0I
 1OZGS+Qmlc6ZeqHHqy7geTTNxMOWjjimOMq+p/0cS2UlBMyU4J4E4YdSw5aMW2qdZq
 M3TdpBqLzCmkNfzq+hPA5Kv5msr7cla0V6cRsuoM2dvL0ddLhNbiKp2AghqmsCzXT+
 3fgoEVnJ1sK8A==
From: Maxime Ripard <mripard@kernel.org>
To: airlied@gmail.com, daniel@ffwll.ch, frank.binns@imgtec.com, 
 donald.robson@imgtec.com, matt.coster@imgtec.com, sarah.walker@imgtec.com, 
 Danilo Krummrich <dakr@redhat.com>
In-Reply-To: <20231124233650.152653-3-dakr@redhat.com>
References: <20231124233650.152653-1-dakr@redhat.com>
 <20231124233650.152653-3-dakr@redhat.com>
Subject: Re: (subset) [PATCH drm-misc-next 2/5] drm/imagination: vm: check
 for drm_gpuvm_range_valid()
Message-Id: <170117645847.2825698.6258484637580832130.b4-ty@kernel.org>
Date: Tue, 28 Nov 2023 14:00:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 25 Nov 2023 00:36:37 +0100, Danilo Krummrich wrote:
> Extend pvr_device_addr_and_size_are_valid() by the corresponding GPUVM
> sanity checks. This includes a, previously missing, overflow check for
> the base address and size of the requested mapping.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

