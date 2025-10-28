Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50925C13B5E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 10:09:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0573210E5C9;
	Tue, 28 Oct 2025 09:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=yeah.net header.i=@yeah.net header.b="mJLRAgOB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D6B10E5C1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 09:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
 s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
 Content-Type; bh=WaTABlPQzql62JP4bYpGFB1GN/KGFtKB/QnUa6OyJ+E=;
 b=mJLRAgOBFmbF4UXSo3Qm6FPpTQs8JJU8wIFm7iGmahKNMDfFafS2NaRysmcHWa
 c8NiIPAv/k9sNdIJDaFtj+1k5XDbw7Mg3OFeFAbOQz4s3DxWQpNYZoMj8xZl3jCt
 7WImln7p/K3KCn4IAmqZQKXCN+G1FpLsBEc+lhPdVs0Lc=
Received: from dragon (unknown [])
 by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXf10BiABp90vTAA--.48036S3;
 Tue, 28 Oct 2025 17:08:20 +0800 (CST)
Date: Tue, 28 Oct 2025 17:08:17 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: airlied@gmail.com, boris.brezillon@collabora.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 marek.vasut@mailbox.org, mripard@kernel.org, p.zabel@pengutronix.de,
 robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org,
 simona@ffwll.ch, sre@kernel.org, steven.price@arm.com,
 tzimmermann@suse.de, xianzhong.li@nxp.com
Subject: Re: [PATCH v3 2/2] arm64: dts: imx95: Describe Mali G310 GPU
Message-ID: <aQCIAfyUC6N5y2fB@dragon>
References: <20250925203938.169880-1-marek.vasut@mailbox.org>
 <20250925203938.169880-2-marek.vasut@mailbox.org>
 <ba95487c-ada7-48a4-90b7-fd99a0278f51@mailbox.org>
 <aP7DZCMk1pQ7wsFo@dragon> <aQB88c_AEC1RAZtH@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQB88c_AEC1RAZtH@oss.nxp.com>
X-CM-TRANSID: Ms8vCgDXf10BiABp90vTAA--.48036S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrWrAFyUKr1kGw4UJw1xGrg_yoWkAFb_uF
 4UCrs7Aw42gryUtFZ3CF4q9ryvkw15Jry3uw15JFnrZ34DAa48Ca9IkrWxZa4rCrWDArn8
 tF98XryYkr4IvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1qQ6JUUUUU==
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNwV94mkAiAXl5gAA3K
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

On Tue, Oct 28, 2025 at 04:21:05PM +0800, Rain Yang wrote:
> On Mon, Oct 27, 2025 at 08:57:08AM +0800, Shawn Guo wrote:
> >On Sat, Oct 11, 2025 at 12:53:29PM +0200, Marek Vasut wrote:
> >> On 9/25/25 10:38 PM, Marek Vasut wrote:
> >> > The instance of the GPU populated in i.MX95 is the G310, describe this
> >> > GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
> >> Is there still anything that should be changed with this patchset, or can it
> >> be applied ?
> >
> >I'm waiting binding change to be applied first.  Or is it already done?
> >
> >Shawn
> >
> Hi Shawn,
> It might be better for Marek to remove the always-on GPUAPB clock from the DTS, given that
> it's an SCMI protocol clock and the kernel expects it to be available during operations.
> 
> Also, the gpu_fix_reg appears unnecessary for the driver and could be removed[1].
> 
> [1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a8cb5ca53690aa809f4f65e14192753073e61a71,
> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=02df3543f3e0ea572e2c739605ebd6c20e1149c4

Ah, sorry! I did not know we haven't reached agreement on the change.

Shawn

