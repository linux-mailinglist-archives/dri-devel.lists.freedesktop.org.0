Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6642581B4EF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 12:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C6A10E035;
	Thu, 21 Dec 2023 11:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A3710E035
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 11:31:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 3CDDCB81FB9;
 Thu, 21 Dec 2023 11:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39B1C433C7;
 Thu, 21 Dec 2023 11:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703158314;
 bh=Cpk+5UE2MMyOzEMOhTnWvY78nmuIRHA/4H9/WiQCvN8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NHdEaDtjTfH4nlGctu3s2hkp5HN7vvBI+QRZgUpTDFpK5xoz9BFpT54dbd51uIFnk
 w+YWZ3v0BsMDcG1WyB1Jp5xQj3QPe0h0jY8nmkoqxlwJ1RZWbcb6PbxUAqpCPGPjDL
 Kyh1cCCSSgbKjdIHj3n84ydRiW3QYsijTcoWOMd2dfkCetwRUFkGAFzawWpwWLaOLz
 a0f8SJodbsS7kURzc1Qx0edRDgVsKYrMaNmI8bhEGXXgSLAGxziAOs1BtO8Tk9Cx6W
 3NbqzVlbocmMvx+6KiJ3zPADUE+6TwlQ03bFKOq4K/hYnUh/Cr+AXZC5fB2hhKMwto
 m9ZXscrXA3bRg==
Date: Thu, 21 Dec 2023 11:31:37 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 2/8] iio: buffer-dma: split
 iio_dma_buffer_fileio_free() function
Message-ID: <20231221113137.39911d64@jic23-huawei>
In-Reply-To: <20231219175009.65482-3-paul@crapouillou.net>
References: <20231219175009.65482-1-paul@crapouillou.net>
 <20231219175009.65482-3-paul@crapouillou.net>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>,
 dmaengine@vger.kernel.org, Alexandru Ardelean <alexandru.ardelean@analog.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Dec 2023 18:50:03 +0100
Paul Cercueil <paul@crapouillou.net> wrote:

> From: Alexandru Ardelean <alexandru.ardelean@analog.com>
> 
> This change splits the logic into a separate function, which will be
> re-used later.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> Cc: Alexandru Ardelean <ardeleanalex@gmail.com>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Harmless refactor so I'm fine taking this now to reduce noise on any
v6

Applied

Jonathan
