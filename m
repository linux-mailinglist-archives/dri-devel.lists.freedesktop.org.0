Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F60449F72
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 01:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F4989F4A;
	Tue,  9 Nov 2021 00:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing-stata.csail.mit.edu (outgoing-stata.csail.mit.edu
 [128.30.2.210])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8BA4D89F4A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 00:22:24 +0000 (UTC)
Received: from c-24-16-8-193.hsd1.wa.comcast.net ([24.16.8.193]
 helo=srivatsab-a02.vmware.com)
 by outgoing-stata.csail.mit.edu with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
 (Exim 4.82) (envelope-from <srivatsa@csail.mit.edu>)
 id 1mkEu2-000R2P-5t; Mon, 08 Nov 2021 19:22:18 -0500
To: Joe Perches <joe@perches.com>, jgross@suse.com, x86@kernel.org,
 pv-drivers@vmware.com
References: <163640336232.62866.489924062999332446.stgit@srivatsa-dev>
 <163640339370.62866.3435211389009241865.stgit@srivatsa-dev>
 <5179a7c097e0bb88f95642a394f53c53e64b66b1.camel@perches.com>
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Subject: Re: [PATCH 2/2] MAINTAINERS: Mark VMware mailing list entries as
 private
Message-ID: <cb03ca42-b777-3d1a-5aba-b01cd19efa9a@csail.mit.edu>
Date: Mon, 8 Nov 2021 16:22:14 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <5179a7c097e0bb88f95642a394f53c53e64b66b1.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: amakhalov@vmware.com, Ronak Doshi <doshir@vmware.com>,
 linux-scsi@vger.kernel.org, anishs@vmware.com,
 Vishal Bhakta <vbhakta@vmware.com>, netdev@vger.kernel.org, sdeep@vmware.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, keerthanak@vmware.com,
 linux-rdma@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-graphics-maintainer@vmware.com, srivatsab@vmware.com,
 linux-input@vger.kernel.org, Nadav Amit <namit@vmware.com>,
 Vivek Thampi <vithampi@vmware.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Greg, Thomas

Hi Joe,

On 11/8/21 3:37 PM, Joe Perches wrote:
> On Mon, 2021-11-08 at 12:30 -0800, Srivatsa S. Bhat wrote:
>> From: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
>>
>> VMware mailing lists in the MAINTAINERS file are private lists meant
>> for VMware-internal review/notification for patches to the respective
>> subsystems. So, in an earlier discussion [1][2], it was recommended to
>> mark them as such. Update all the remaining VMware mailing list
>> references to use that format -- "L: list@address (private)".
> []
>> diff --git a/MAINTAINERS b/MAINTAINERS
> []
>> @@ -6134,8 +6134,8 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>>  F:	drivers/gpu/drm/vboxvideo/
>>  
>>  DRM DRIVER FOR VMWARE VIRTUAL GPU
>> -M:	"VMware Graphics" <linux-graphics-maintainer@vmware.com>
>>  M:	Zack Rusin <zackr@vmware.com>
>> +L:	linux-graphics-maintainer@vmware.com (private)
> 
> This MAINTAINERS file is for _public_ use, marking something
> non-public isn't useful.
> 
> private makes no sense and likely these L: entries shouldn't exist.
> 
> 

Well, the public can send messages to this list, but membership is
restricted.

In many ways, I believe this is similar to x86@kernel.org, which is an
email alias that anyone can post to in order to reach the x86
maintainer community for patch review. I see x86@kernel.org listed as
both L: and M: in the MAINTAINERS file, among different entries.

Although the @vmware list ids refer to VMware-internal mailing lists
as opposed to email aliases, they serve a very similar purpose -- to
inform VMware folks about patches to the relevant subsystems.

Is there a consensus on how such lists should be specified? One
suggestion (from Greg in the email thread referenced above) was to
mark it as private, which is what this patch does. Maybe we can find a
better alternative?

How about specifying such lists using M: (indicating that this address
can be used to reach maintainers), as long as that is not the only M:
entry for a given subsystem (i.e., it includes real people's email id
as well)? I think that would address Greg's primary objection too from
that other thread (related to personal responsibility as maintainers).

Regards,
Srivatsa
