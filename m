Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6379057FF3D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 14:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67739AC924;
	Mon, 25 Jul 2022 12:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FF4AC909
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 12:47:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0446FB80E7E;
 Mon, 25 Jul 2022 12:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26BAC341C8;
 Mon, 25 Jul 2022 12:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1658753223;
 bh=gG70nkexN6R7rwhZbK7zPzM/h4w2zfhGvxObm6YIeIc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2MmEMBkhDaPYKBOsckNO7rs8nAwmvC4NddHh3ez0D31mowqKbqiVtOedbV6raS4bL
 /Yme7QUrqrEZmhRWYIwNKKw0gwXO1LHWEcoj5MxB8dblyHt4VG25F5zT3LyZrPGw75
 SbhrKqEeA2kZFURSoLHCEx8+S4QE1ZsC0OH6QsQk=
Date: Mon, 25 Jul 2022 14:46:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Subject: Re: [PATCH v2 0/5] Add Toshiba Visconti DNN image processing
 accelerator driver
Message-ID: <Yt6Qw/r0FQ0ElYdn@kroah.com>
References: <20220722082858.17880-1-yuji2.ishikawa@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722082858.17880-1-yuji2.ishikawa@toshiba.co.jp>
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
Cc: linaro-mm-sig@lists.linaro.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Rob Herring <robh+dt@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 05:28:53PM +0900, Yuji Ishikawa wrote:
> This series is the DNN image processing accelerator driver for Toshiba's ARM SoC, Visconti[0].
> This provides DT binding documentation, device driver, MAINTAINER files and documents.
> 
> Best regards,
> Yuji
> 
> [0]: https://toshiba.semicon-storage.com/ap-en/semiconductor/product/image-recognition-processors-visconti.html
> 
> dt-bindings: soc: visconti: Add Toshiba Visconti DNN image processing accelerator bindings
>   v1 -> v2:
>     - No update
> 
> soc: visconti: Add Toshiba Visconti image processing accelerator common source
>   v1 -> v2:
>     - checked with checkpatch.pl --strict
> 
> soc: visconti: Add Toshiba Visconti DNN image processing accelerator
>   v1 -> v2:
>     - checked with checkpatch.pl --strict
>     - removed unused code
> 
> MAINTAINERS: Add entries for Toshiba Visconti DNN image processing
>   v1 -> v2:
>     - No update
> 
> Documentation: driver-api: visconti: add a description of DNN driver.
>   v1 -> v2:
>     - newly added documents
> 
> Yuji Ishikawa (5):
>   dt-bindings: soc: visconti: Add Toshiba Visconti DNN image processing
>     accelerator bindings
>   soc: visconti: Add Toshiba Visconti image processing accelerator
>     common source
>   soc: visconti: Add Toshiba Visconti DNN image processing accelerator
>   MAINTAINERS: Add entries for Toshiba Visconti DNN image processing
>     accelerator
>   Documentation: driver-api: visconti: add a description of DNN driver.
> 
>  .../soc/visconti/toshiba,visconti-dnn.yaml    |  54 ++
>  Documentation/driver-api/visconti/common.rst  | 115 ++++
>  Documentation/driver-api/visconti/dnn.rst     | 394 +++++++++++++
>  MAINTAINERS                                   |   2 +
>  drivers/soc/Kconfig                           |   1 +
>  drivers/soc/Makefile                          |   1 +
>  drivers/soc/visconti/Kconfig                  |   7 +
>  drivers/soc/visconti/Makefile                 |   8 +
>  drivers/soc/visconti/dnn/Makefile             |   6 +
>  drivers/soc/visconti/dnn/dnn.c                | 523 ++++++++++++++++++
>  drivers/soc/visconti/dnn/hwd_dnn.c            | 183 ++++++
>  drivers/soc/visconti/dnn/hwd_dnn.h            |  68 +++
>  drivers/soc/visconti/dnn/hwd_dnn_reg.h        | 228 ++++++++
>  drivers/soc/visconti/ipa_common.c             |  55 ++
>  drivers/soc/visconti/ipa_common.h             |  18 +
>  drivers/soc/visconti/uapi/dnn.h               |  77 +++
>  drivers/soc/visconti/uapi/ipa.h               |  90 +++

Why is this in drivers/soc/?

And uapi files belong in the correct include path, not burried in a
driver subdirectory where they will never be picked up correctly by the
build system.  How did you test these?

thanks,

greg k-h
