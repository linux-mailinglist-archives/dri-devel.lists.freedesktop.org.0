Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB5B742AF2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 19:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F37710E19E;
	Thu, 29 Jun 2023 17:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7A4B610E19E;
 Thu, 29 Jun 2023 17:00:21 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:48394.1297546617
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 05A4C10020D;
 Fri, 30 Jun 2023 01:00:13 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-xp9j7 with ESMTP id
 2713aa1564624f348fd6c097b85f39d9 for helgaas@kernel.org; 
 Fri, 30 Jun 2023 01:00:17 CST
X-Transaction-ID: 2713aa1564624f348fd6c097b85f39d9
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <bcfdc77d-a94d-bca1-56e3-5e14e91f6fd9@189.cn>
Date: Fri, 30 Jun 2023 01:00:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 6/8] PCI/VGA: Introduce is_boot_device function
 callback to vga_client_register
To: Bjorn Helgaas <helgaas@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>
References: <20230629155436.GA397963@bhelgaas>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230629155436.GA397963@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-fbdev@vger.kernel.org, Pan Xinhui <Xinhui.Pan@amd.com>,
 kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 Lijo Lazar <lijo.lazar@amd.com>, dri-devel@lists.freedesktop.org,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Yi Liu <yi.l.liu@intel.com>, Karol Herbst <kherbst@redhat.com>,
 amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Ben Skeggs <bskeggs@redhat.com>, linux-pci@vger.kernel.org,
 Kevin Tian <kevin.tian@intel.com>, Bokun Zhang <Bokun.Zhang@amd.com>,
 intel-gfx@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>,
 Abhishek Sahu <abhsahu@nvidia.com>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/29 23:54, Bjorn Helgaas wrote:
> On Thu, Jun 22, 2023 at 01:08:15PM +0800, Sui Jingfeng wrote:
>> Hi,
>>
>>
>> A nouveau developer(Lyude) from redhat send me a R-B,
>>
>> Thanks for the developers of nouveau project.
>>
>>
>> Please allow me add a link[1] here.
>>
>>
>> [1] https://lore.kernel.org/all/0afadc69f99a36bc9d03ecf54ff25859dbc10e28.camel@redhat.com/
> 1) Thanks for this.  If you post another version of this series,
>     please pick up Lyude's Reviewed-by and include it in the relevant
>     patches (as long as you haven't made significant changes to the
>     code Lyude reviewed).

Yes, no significant changes. Just fix typo.

I also would like to add support for other DRM drivers.

But I think this deserve another patch.

>   Whoever applies this should automatically
>     pick up Reviewed-by/Ack/etc that are replies to the version being
>     applied, but they won't go through previous revisions to find them.
>
> 2) Please mention the commit to which the series applies.  I tried to
>     apply this on v6.4-rc1, but it doesn't apply cleanly.

Since I'm a graphic driver developer, I'm using drm-tip.

I just have already pulled, it still apply cleanly on drm-tip.

> 3) Thanks for including cover letters in your postings.  Please
>     include a little changelog in the cover letter so we know what
>     changed between v6 and v7, etc.

No change between v6 and v7,

it seems that it is because the mailbox don't allow me to sending too 
many mails a day.

so some of the patch is failed to delivery because out of quota.


> 4) Right now we're in the middle of the v6.5 merge window, so new
>     content, e.g., this series, is too late for v6.5.  Most
>     maintainers, including me, wait to merge new content until the
>     merge window closes and a new -rc1 is tagged.  This merge window
>     should close on July 9, and people will start merging content for
>     v6.6, typically based on v6.5-rc1.

I'm wondering

Would you will merge all of the patches in this series (e.g. including 
the patch for drm/amdgpu(7/8) and drm/radeon(8/8)) ?

Or just part of them?

Emm, I don't know because my patch seems across different subsystem of 
Linux kernel.

There is also a developer for AMDGPU (Mario) give me a R-B for the 
patch-0002 of this series.

So, at least, PATCH-0001, PATCH-0002, PATCH-0003, PATCH-0004, PATCH-0006 
are already OK(got reviewed by).

Those 5 patch are already qualified to be merged, I think.

I means that if you could merge those 5 patch first, then there no need 
to send another version again.

I will refine the rest patch with more details and description.

I'm fear of making too much noise.

> Bjorn
