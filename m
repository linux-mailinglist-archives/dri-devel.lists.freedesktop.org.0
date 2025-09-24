Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0C7B9C8E8
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 01:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9827F10E231;
	Wed, 24 Sep 2025 23:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bleJ9iDL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5295D10E231
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 23:28:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 60F76602F1;
 Wed, 24 Sep 2025 23:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38963C4CEE7;
 Wed, 24 Sep 2025 23:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758756505;
 bh=SuoB9sZhksbewmGXecNjDA+OjKmrNNui2aAeVmieggE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bleJ9iDLYM+J0S+ycta0qXg6EIrysrTMakzFjjnT3JboXKQU6VnkWqZc1WQiTe5EH
 NRoLW5xsiRvjScnxtlRD2GkVaa0ryFVIspQ4fbohDTb+k3JeKXNFAbgDxzDVQq6NqX
 PgA3yGMUq3QmUUlkxNzFj+5ViHdC7FCYvPLUaQg7N+iRjQczjFqGKTS0CZsU2bGULL
 yyledXuJ9S2/rRWHEuS7g1toAVGhNciqJ7H3yWsYQm99c72/e5HgsHYxlEoF0h2n+A
 sJAvgPH5d0sLvjJpllNR0fN9jYgR4jz+yewLhJLqy1QaG0CFO2viwi6rNd7xax4q5u
 ZTjIkzBgIsx3Q==
Date: Thu, 25 Sep 2025 01:28:21 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 Viken Dadhaniya <quic_vdadhani@quicinc.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v7 RESEND 0/2] i2c: i2c-qcom-geni: Add Block event
 interrupt support
Message-ID: <eobfxgtssuiom2cuc2zlsvc2hhyi2jk7qb7zydgo4k5wwvxjlz@nksb3x6p5ums>
References: <20250923073752.1425802-1-quic_jseerapu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923073752.1425802-1-quic_jseerapu@quicinc.com>
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

Hi Jyothi,

I'm sorry, but this is not a resend, but this is a v8. Other
than:

1. commit log in patch 1: removed duplicate sentence
2. use proper types when calling geni_i2c_gpi_unmap() inside
   geni_i2c_gpi_multi_desc_unmap()

is there anything else?

Please, next increase the version even for tiny changes.

> Jyothi Kumar Seerapu (2):
>   dmaengine: qcom: gpi: Add GPI Block event interrupt support

We still need Vinod's comments here...

>   i2c: i2c-qcom-geni: Add Block event interrupt support

... and Mukesh and Viken's ack here.

Thanks,
Andi
