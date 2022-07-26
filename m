Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A82E581638
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 17:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A403C14A203;
	Tue, 26 Jul 2022 15:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F71810F2C3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 15:15:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 33028B80FF0;
 Tue, 26 Jul 2022 15:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B62C433C1;
 Tue, 26 Jul 2022 15:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1658848536;
 bh=JdYLPvm15DCGWDloUpXmxYYLmSi+V/FEw3vBEoaF+Jw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xBokB72rddFLxtHSosxuv3alJqsdn0oyulNn4jSAaE2unHKS0UIM1wLxL2J8T16L0
 k39NRaycdo4vXVxUP4FOVG+nE53iMehPLaex58j9lRVfL0OQ2uKPiGgF5dJfnEg16i
 sBHsTSPvke7L3MCKx6Puv+grQDjTJVYq56eH/DFk=
Date: Tue, 26 Jul 2022 17:15:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: yuji2.ishikawa@toshiba.co.jp
Subject: Re: [PATCH v2 3/5] soc: visconti: Add Toshiba Visconti DNN image
 processing accelerator
Message-ID: <YuAFEvKLnavheZMn@kroah.com>
References: <20220722082858.17880-1-yuji2.ishikawa@toshiba.co.jp>
 <20220722082858.17880-4-yuji2.ishikawa@toshiba.co.jp>
 <Yt6Rryi4SHVc4DR4@kroah.com>
 <TYAPR01MB62013C42CB26FD456929C0D592949@TYAPR01MB6201.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYAPR01MB62013C42CB26FD456929C0D592949@TYAPR01MB6201.jpnprd01.prod.outlook.com>
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
Cc: linaro-mm-sig@lists.linaro.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, hverkuil@xs4all.nl, robh+dt@kernel.org,
 nobuhiro1.iwamatsu@toshiba.co.jp, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 26, 2022 at 06:10:37AM +0000, yuji2.ishikawa@toshiba.co.jp wrote:
> Hi Greg
> 
> Thank you for your comments.
> 
> > -----Original Message-----
> > From: Greg KH <gregkh@linuxfoundation.org>
> > Sent: Monday, July 25, 2022 9:51 PM
> > To: ishikawa yuji(石川 悠司 ○ＲＤＣ□ＡＩＴＣ○ＥＡ開)
> > <yuji2.ishikawa@toshiba.co.jp>
> > Cc: Rob Herring <robh+dt@kernel.org>; Hans Verkuil <hverkuil@xs4all.nl>;
> > iwamatsu nobuhiro(岩松 信洋 □ＳＷＣ◯ＡＣＴ)
> > <nobuhiro1.iwamatsu@toshiba.co.jp>; Jonathan Corbet <corbet@lwn.net>;
> > Sumit Semwal <sumit.semwal@linaro.org>; Christian König
> > <christian.koenig@amd.com>; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; linux-media@vger.kernel.org;
> > dri-devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org
> > Subject: Re: [PATCH v2 3/5] soc: visconti: Add Toshiba Visconti DNN image
> > processing accelerator
> > 
> > On Fri, Jul 22, 2022 at 05:28:56PM +0900, Yuji Ishikawa wrote:
> > > --- /dev/null
> > > +++ b/drivers/soc/visconti/uapi/dnn.h
> > > @@ -0,0 +1,77 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > > +/* Toshiba Visconti DNN Accelerator Support
> > > + *
> > > + * (C) Copyright 2022 TOSHIBA CORPORATION
> > > + * (C) Copyright 2022 Toshiba Electronic Devices & Storage
> > > +Corporation  */
> > > +
> > > +#ifndef _UAPI_LINUX_DNN_H
> > > +#define _UAPI_LINUX_DNN_H
> > > +
> > > +#include <linux/ioctl.h>
> > > +#include <linux/types.h>
> > > +#include "ipa.h"
> > > +
> > > +#define DRV_DNN_BIT_CONFIG_DESC_FINAL (0x8000U)
> > > +#define DRV_DNN_BUFFER_INDEX_MAX      (15)
> > > +
> > > +#define DRV_DNN_BASE_ADDR_NUM (8U) /* DNN number of base
> > address */
> > > +
> > > +#define DRV_DNN_BASE_ADDR_PURPOSE_INPUT	    (1U)
> > > +#define DRV_DNN_BASE_ADDR_PURPOSE_OUTPUT    (2U)
> > > +#define DRV_DNN_BASE_ADDR_PURPOSE_AWB	    (3U)
> > > +#define DRV_DNN_BASE_ADDR_PURPOSE_TEMPORARY (4U)
> > > +
> > > +/**
> > > + * struct drv_dnn_status - DNN IPA status for IOC_IPA_GET_STATUS
> > > + *
> > > + * @state:     State of driver
> > > + * @eer_cmd:   Execution error command
> > > + * @eer:       Execution error
> > > + * @reserved:  Padding
> > > + * @eer_flags: Execution error flags
> > > + */
> > > +struct drv_dnn_status {
> > > +	enum drv_ipa_state state;
> > > +	__u32 eer_cmd;
> > > +	__u32 eer : 1;
> > > +	__u32 reserved : 31;
> > 
> > bitfields will not work like this for uapi files, sorry.
> 
> I'll change the type of the member eer from bitfield to bool.

bool will not work for a user/kernel api structure at all, sorry.

> > > +	__u32 eer_flags[32];
> > 
> > What endian is all of these?  Big?  Little?  Unknown?
> 
> The processors and accelerators are little endian in Visconti SoC.
> Do I have to use more specific type such as __le32 ?

Of course, this has to be defined as to how the hardware sees it.  Why
wouldn't you specify this?

> > > +};
> > > +
> > > +struct drv_dnn_base_addr {
> > > +	__u32 purpose;
> > > +	union {
> > > +		struct drv_ipa_addr ipa_addr;
> > > +		uintptr_t list_addr;
> > 
> > You really do not ever want a uintptr_t in a uapi file, that's not going to be
> > portable at all.  It's also not a valid kernel type :(
> 
> I understand. The member list_addr should be typed "struct drv_ipa_addr*".

No, not at all, that too will not work and is not portable.  Please read
the documentation in the kernel for how to write correct user/kernel
apis with ioctl structures.  It is all documented there, please do not
ignore it and create an api that will be broken.

> > > + * @config_done:          Flags of called configuration
> > > + * @buffer_info:          Table of buffer information
> > > + * @buffer_info_num:      Number of buffer_info
> > > + */
> > > +struct drv_dnn_descriptor {
> > > +	struct drv_ipa_addr configuration;
> > > +	__u32 configuration_offset;
> > 
> > What endian are any of these?
> 
> They are little endian as processors and accelerators are LE.
> Do I have to use specific type such as __le32?

Yes, as that is defined by your hardware, not the processor the kernel
is running as.

> Do we need special care for endianness	when userland and kernel are sharing data (a drv_dnn_descriptor instance) ?

Yes, why wouldn't you?

> I thought there're no endianness problem when the driver is reading/writing HW's 32bit registers.

Is that what you are doing here?  It's impossible to tell.

For data that only crosses the user/kernel boundry, you can use the
native processor endian, but when it crosses the kernel/hardware
boundry, you HAVE to specify it as to what the hardware expects.

thanks,

greg k-h
