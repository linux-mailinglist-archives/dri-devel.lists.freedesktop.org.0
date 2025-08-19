Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D93D5B2C07A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 13:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F79910E2C2;
	Tue, 19 Aug 2025 11:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n6OYW1j2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3548210E2C2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 11:32:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D0B5D4375A;
 Tue, 19 Aug 2025 11:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A1EC4CEF1;
 Tue, 19 Aug 2025 11:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755603120;
 bh=xk21yYxTPrpJlQW1zpMfkatIUVFMuWMI1dlu7eQZ/Ds=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=n6OYW1j2RqLKw6TyxArRNH26G93qpiwO6sRXgeCNldIveXwLltxRkGLtMabet3CkR
 wQunkdQE7q5QiwMJCbpYdt8O6DObyoAjcwi+NUpVdD1LWVLiRvR3Xl04sBvA9cOdwe
 zALJ2IKZK7SnG+TPAJ+dQ47ImZU51W9t4818hC0egbkeKD7mpoRahPNYYsyY3JMv6e
 abDHF2GE5nEXgrC8hNA2fepVnxx3yAFN86vfXmymXazAq0XpeJ5sKLI/6aAUdQuEie
 wcQZDTNNUFjyWbFVjQ0iBGgEZmTJhzc7j8DRl84kLsy1FvRZs7s4Icfd17Eq2CoDLv
 ZsuAuvAhyxUSQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org, 
 sumit.semwal@linaro.org, christian.koenig@amd.com, 
 thierry.escande@linaro.org, quic_vgattupa@quicinc.com, 
 Ling Xu <quic_lxu5@quicinc.com>
Cc: quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250807100420.1163967-1-quic_lxu5@quicinc.com>
References: <20250807100420.1163967-1-quic_lxu5@quicinc.com>
Subject: Re: [PATCH v3 0/4] Add missing fixes to FastRPC driver
Message-Id: <175560311807.1303568.7881475983315661805.b4-ty@kernel.org>
Date: Tue, 19 Aug 2025 12:31:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Thu, 07 Aug 2025 15:34:16 +0530, Ling Xu wrote:
> This patch series adds the listed bug fixes that have been missing
> in upstream fastRPC driver.
> - Store actual size of map and check it against the user passed size.
> - Consider map buf for map lookup.
> - Fix possible map leak in fastrpc_put_args.
> - Skip refcount increment for DMA handles.
> Patch [v2]: https://lore.kernel.org/linux-arm-msm/20250806115114.688814-1-quic_lxu5@quicinc.com/
> 
> [...]

Applied, thanks!

[1/4] misc: fastrpc: Save actual DMA size in fastrpc_map structure
      commit: 69fb36431c5e1bd09981f931b3030296cdc6c7b5
[2/4] misc: fastrpc: Fix fastrpc_map_lookup operation
      commit: a8b2a851e3f9a8497ff857d9a152659988612af4
[3/4] misc: fastrpc: fix possible map leak in fastrpc_put_args
      commit: ba7a9771f1e3a622d51f95a1f5a4ff9958ca5c64
[4/4] misc: fastrpc: Skip reference for DMA handles
      commit: cbf27dd4e98e5a3b71dbe89972461ce5bb4c188c

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

