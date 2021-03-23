Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 224F9345C85
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 12:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9F06E8A6;
	Tue, 23 Mar 2021 11:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466406E8A6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 11:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B2+tMgcaoCFSudX+eohcG6088BO8V2Amh1pwW137QDw=; b=KFMsoS5YdWAA3aBpXQQH7n6tEm
 EUDCX81a9P/mIemOcZbdYow6blrof5BXF2CnVrE+VIY+D9qIvbSYvHmUyGvZqS4RYjDyUXSK9VOUM
 U9vVql9buvIzihZJvQ1yOKQuaKGS5O6GRNiYJRpfNNRoj/XO9DXmN+tI4ccpM1At6oeZBgRegZcDW
 B56/s5d5u4GztA/4Qv4JQA7MNlNPcrAUru+OOQSxKoM7T7/xBSpW/xlkkqXe3WqjfQkbWq5EUbV4q
 R/6vsXyQx6XOW31cdycaV1fo0wNgGHtnLg75LCQMri5j6AVHJWvhjP7pOOY0soF3Wv1hrv1RCgIUP
 EjBQxgvQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1lOexg-0006oZ-Uf; Tue, 23 Mar 2021 13:12:36 +0200
Subject: Re: [PATCH v5 07/21] gpu: host1x: Introduce UAPI header
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-8-mperttunen@nvidia.com>
 <YFnIef+dDuqLv5Ek@orome.fritz.box>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <47840607-8e7c-cc02-bf9b-e001c91f7354@kapsi.fi>
Date: Tue, 23 Mar 2021 13:12:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFnIef+dDuqLv5Ek@orome.fritz.box>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com, linux-tegra@vger.kernel.org,
 digetx@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/23/21 12:52 PM, Thierry Reding wrote:
> On Mon, Jan 11, 2021 at 03:00:05PM +0200, Mikko Perttunen wrote:
>> Add the userspace interface header, specifying interfaces
>> for allocating and accessing syncpoints from userspace,
>> and for creating sync_file based fences based on syncpoint
>> thresholds.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>>   include/uapi/linux/host1x.h | 134 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 134 insertions(+)
>>   create mode 100644 include/uapi/linux/host1x.h
> 
> What's the number of these syncpoints that we expect userspace to
> create? There's a limited amount of open file descriptors available by
> default, so this needs to be kept reasonably low.
> 
>> diff --git a/include/uapi/linux/host1x.h b/include/uapi/linux/host1x.h
>> new file mode 100644
>> index 000000000000..9c8fb9425cb2
>> --- /dev/null
>> +++ b/include/uapi/linux/host1x.h
>> @@ -0,0 +1,134 @@
>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>> +/* Copyright (c) 2020 NVIDIA Corporation */
>> +
>> +#ifndef _UAPI__LINUX_HOST1X_H
>> +#define _UAPI__LINUX_HOST1X_H
>> +
>> +#include <linux/ioctl.h>
>> +#include <linux/types.h>
>> +
>> +#if defined(__cplusplus)
>> +extern "C" {
>> +#endif
>> +
>> +struct host1x_allocate_syncpoint {
>> +	/**
>> +	 * @fd: [out]
>> +	 *
>> +	 * New file descriptor representing the allocated syncpoint.
>> +	 */
>> +	__s32 fd;
>> +
>> +	__u32 reserved[3];
>> +};
>> +
>> +struct host1x_syncpoint_info {
>> +	/**
>> +	 * @id: [out]
>> +	 *
>> +	 * System-global ID of the syncpoint.
>> +	 */
>> +	__u32 id;
>> +
>> +	__u32 reserved[3];
>> +};
> 
> Given that this has only out parameters, I expect this will be called on
> the FD returned by HOST1X_IOCTL_ALLOCATE_SYNCPOINT? It might be worth
> pointing that out explicitly in a comment.
> 

Correct.

>> +
>> +struct host1x_syncpoint_increment {
>> +	/**
>> +	 * @count: [in]
>> +	 *
>> +	 * Number of times to increment the syncpoint. The syncpoint can
>> +	 * be observed at in-between values, but each increment is atomic.
>> +	 */
>> +	__u32 count;
>> +};
> 
> This seems like it would have to be called on the FD as well...

Yep.

> 
>> +
>> +struct host1x_read_syncpoint {
>> +	/**
>> +	 * @id: [in]
>> +	 *
>> +	 * ID of the syncpoint to read.
>> +	 */
>> +	__u32 id;
>> +
>> +	/**
>> +	 * @value: [out]
>> +	 *
>> +	 * Current value of the syncpoint.
>> +	 */
>> +	__u32 value;
>> +};
> 
> ... but then, all of a sudden you seem to switch things around and allow
> reading the value of an arbitrary syncpoint specified by ID.
> 
> Now, I suspect that's because reading the syncpoint is harmless and does
> not allow abuse, whereas incrementing could be abused if allowed on an
> arbitrary syncpoint ID. But I think it's worth spelling all that out in
> some documentation to make this clear from a security point of view and
> from a usability point of view for people trying to figure out how to
> use these interfaces.

Yeah. The model is that reading any syncpoint is OK but writing is not. 
I think these things were mentioned in the original proposal text but I 
did not carry them over to the comments. Will fix (however see below)

> 
>> +
>> +struct host1x_create_fence {
>> +	/**
>> +	 * @id: [in]
>> +	 *
>> +	 * ID of the syncpoint to create a fence for.
>> +	 */
>> +	__u32 id;
>> +
>> +	/**
>> +	 * @threshold: [in]
>> +	 *
>> +	 * When the syncpoint reaches this value, the fence will be signaled.
>> +	 * The syncpoint is considered to have reached the threshold when the
>> +	 * following condition is true:
>> +	 *
>> +	 * 	((value - threshold) & 0x80000000U) == 0U
>> +	 *
>> +	 */
>> +	__u32 threshold;
>> +
>> +	/**
>> +	 * @fence_fd: [out]
>> +	 *
>> +	 * New sync_file file descriptor containing the created fence.
>> +	 */
>> +	__s32 fence_fd;
>> +
>> +	__u32 reserved[1];
>> +};
> 
> Again this takes an arbitrary syncpoint ID as input, so I expect that
> the corresponding IOCTL will have to be called on the host1x device
> node? Again, I think it would be good to either point that out for each
> structure or IOCTL, or alternatively maybe reorder these such that this
> becomes clearer.
> 
>> +
>> +struct host1x_fence_extract_fence {
>> +	__u32 id;
>> +	__u32 threshold;
>> +};
>> +
>> +struct host1x_fence_extract {
>> +	/**
>> +	 * @fence_fd: [in]
>> +	 *
>> +	 * sync_file file descriptor
>> +	 */
>> +	__s32 fence_fd;
>> +
>> +	/**
>> +	 * @num_fences: [in,out]
>> +	 *
>> +	 * In: size of the `fences_ptr` array counted in elements.
>> +	 * Out: required size of the `fences_ptr` array counted in elements.
>> +	 */
>> +	__u32 num_fences;
>> +
>> +	/**
>> +	 * @fences_ptr: [in]
>> +	 *
>> +	 * Pointer to array of `struct host1x_fence_extract_fence`.
>> +	 */
>> +	__u64 fences_ptr;
>> +
>> +	__u32 reserved[2];
>> +};
> 
> For the others it's pretty clear to me what the purpose is, but I'm at a
> complete loss with this one. What's the use-case for this?

This is needed to process incoming prefences for userspace-programmed 
engines -- mainly, the GPU with usermode submit enabled.

To align with other upstream code, I've been thinking of removing this 
whole UAPI; moving the syncpoint allocation part to the DRM UAPI, and 
dropping the sync_file stuff altogether (if we have support for job 
submission outputting syncobjs, those could still be converted into 
sync_files). This doesn't support usecases like GPU usermode submit, so 
for downstream we'll have to add it back in, though. Would like to hear 
your opinion on it as well.

Mikko

> 
> In general I think it'd make sense to add a bit more documentation about
> how all these IOCTLs are meant to be used to give people a better
> understanding of why these are needed.
> 
> Thierry
> 
>> +
>> +#define HOST1X_IOCTL_ALLOCATE_SYNCPOINT  _IOWR('X', 0x00, struct host1x_allocate_syncpoint)
>> +#define HOST1X_IOCTL_READ_SYNCPOINT      _IOR ('X', 0x01, struct host1x_read_syncpoint)
>> +#define HOST1X_IOCTL_CREATE_FENCE        _IOWR('X', 0x02, struct host1x_create_fence)
>> +#define HOST1X_IOCTL_SYNCPOINT_INFO      _IOWR('X', 0x03, struct host1x_syncpoint_info)
>> +#define HOST1X_IOCTL_SYNCPOINT_INCREMENT _IOWR('X', 0x04, struct host1x_syncpoint_increment)
>> +#define HOST1X_IOCTL_FENCE_EXTRACT       _IOWR('X', 0x05, struct host1x_fence_extract)
>> +
>> +#if defined(__cplusplus)
>> +}
>> +#endif
>> +
>> +#endif
>> -- 
>> 2.30.0
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
