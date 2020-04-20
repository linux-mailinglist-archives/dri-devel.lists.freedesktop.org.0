Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBE01B189E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 23:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5146E857;
	Mon, 20 Apr 2020 21:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8476E0E3;
 Mon, 20 Apr 2020 21:43:20 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 632E4823;
 Mon, 20 Apr 2020 21:43:17 +0000 (UTC)
Date: Mon, 20 Apr 2020 15:43:16 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2 00/33] Documentation fixes for Kernel 5.8
Message-ID: <20200420154316.28e42905@lwn.net>
In-Reply-To: <cover.1586881715.git.mchehab+huawei@kernel.org>
References: <cover.1586881715.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
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
Cc: kvm@vger.kernel.org, Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-unionfs@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 kvmarm@lists.cs.columbia.edu, linux-arch@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-rdma@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org,
 Matthias Kaehlcke <mka@chromium.org>, Sandeep Maheswaram <sanm@codeaurora.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 ecryptfs@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 Matthias Brugger <mbrugger@suse.com>, Yuti Amonkar <yamonkar@cadence.com>,
 linux-ide@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-crypto@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Apr 2020 18:48:26 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Patches 1 to 5 contain changes to the documentation toolset:
> 
> - The first 3 patches help to reduce a lot the number of reported
>   kernel-doc issues, by making the tool more smart.
> 
> - Patches 4 and 5 are meant to partially address the PDF
>   build, with now requires Sphinx version 2.4 or upper.
> 
> The remaining patches fix broken references detected by
> this tool:
> 
>         ./scripts/documentation-file-ref-check
> 
> and address other random errors due to tags being mis-interpreted
> or mis-used.
> 
> They are independent each other, but some may depend on
> the kernel-doc improvements.
> 
> PS.: Due to the large number of C/C, I opted to keep a smaller
> set of C/C at this first e-mail (only e-mails with "L:" tag from
> MAINTAINERS file).

OK, I've applied this set, minus #17 which was applied elsewhere.

Thanks,

jon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
