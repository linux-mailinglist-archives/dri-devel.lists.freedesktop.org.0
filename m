Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5025BB50F5B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 09:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8130C10E870;
	Wed, 10 Sep 2025 07:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="sZBDJtvF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id F24D210E5DF
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 21:01:36 +0000 (UTC)
Received: from [192.168.0.88] (192-184-212-33.fiber.dynamic.sonic.net
 [192.184.212.33])
 by linux.microsoft.com (Postfix) with ESMTPSA id 3AF8E2119388;
 Mon,  8 Sep 2025 14:01:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3AF8E2119388
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1757365296;
 bh=8OfRFbMGWhbwHqeXODOj/IPgEc3LWLOaJehvGyq5fVY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sZBDJtvFs9Ofj7nMAu5VU8L0L4nKeDGeNVmFwTGr5mm9ZPuuOp9UCj9Btu+E1vcfa
 HB/ifrMcHgdgWOwk/crvaI47rWI+1w94qYyPAZve41oYiMcu+vkaoDgD185Gry75ro
 Z7o4crQc3sp24xFFXTYFnxdnQ96IoHTX58i70aM8=
Message-ID: <d7d7b23f-eaea-2dbc-9c9d-4bee082f6fe7@linux.microsoft.com>
Date: Mon, 8 Sep 2025 14:01:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v1 2/2] Drivers: hv: Make CONFIG_HYPERV bool
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-hyperv@vger.kernel.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-arch@vger.kernel.org, virtualization@lists.linux.dev,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jikos@kernel.org, bentiss@kernel.org,
 kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, dmitry.torokhov@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, bhelgaas@google.com,
 James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
 deller@gmx.de, arnd@arndb.de, sgarzare@redhat.com, horms@kernel.org
References: <20250906010952.2145389-1-mrathor@linux.microsoft.com>
 <20250906010952.2145389-3-mrathor@linux.microsoft.com>
 <2025090621-rumble-cost-2c0d@gregkh>
From: Mukesh R <mrathor@linux.microsoft.com>
In-Reply-To: <2025090621-rumble-cost-2c0d@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=2.1 tests=ALL_TRUSTED,BAYES_00,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A autolearn=ham
 autolearn_force=no version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
X-Mailman-Approved-At: Wed, 10 Sep 2025 07:28:22 +0000
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

On 9/6/25 04:36, Greg KH wrote:
> On Fri, Sep 05, 2025 at 06:09:52PM -0700, Mukesh Rathor wrote:
>> With CONFIG_HYPERV and CONFIG_HYPERV_VMBUS separated, change CONFIG_HYPERV
>> to bool from tristate. CONFIG_HYPERV now becomes the core Hyper-V
>> hypervisor support, such as hypercalls, clocks/timers, Confidential
>> Computing setup, PCI passthru, etc. that doesn't involve VMBus or VMBus
>> devices.
> 
> But why are you making it so that this can not be a module anymore?  You
> are now forcing ALL Linux distro users to always have this code in their
> system, despite not ever using the feature.  That feels like a waste to
> me.
> 
> What is preventing this from staying as a module?  Why must you always
> have this code loaded at all times for everyone?

This is currently not a module. I assume it was at the beginning. In
drivers/Makefile today:

obj-$(subst m,y,$(CONFIG_HYPERV))       += hv/


More context: CONFIG_HYPERV doesn't really reflect one module. It is
both for kernel built in code and building of stuff in drivers/hv.

drivers/hv then builds 4 modules:

obj-$(CONFIG_HYPERV)            += hv_vmbus.o
obj-$(CONFIG_HYPERV_UTILS)      += hv_utils.o
obj-$(CONFIG_HYPERV_BALLOON)    += hv_balloon.o
obj-$(CONFIG_MSHV_ROOT)         += mshv_root.o

Notice vmbus is using CONFIG_HYPERV because there is no 
CONFIG_HYPERV_VMBUS. We are trying to fix that here.

Thanks,
-Mukesh

> thanks,
> 
> greg k-h

