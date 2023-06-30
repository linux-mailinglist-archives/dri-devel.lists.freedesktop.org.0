Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2987433B2
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 06:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4527A10E0FE;
	Fri, 30 Jun 2023 04:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id CA1AE10E0EC;
 Fri, 30 Jun 2023 04:43:10 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:36042.36167694
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id C76A010013F;
 Fri, 30 Jun 2023 12:43:02 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-6d8594f54d-zsdp9 with ESMTP id
 5b3173dd4b264e9cbf3fad1bf2583dd6 for mario.limonciello@amd.com; 
 Fri, 30 Jun 2023 12:43:06 CST
X-Transaction-ID: 5b3173dd4b264e9cbf3fad1bf2583dd6
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <b7528e1d-7f71-016c-f0ef-a044586b7765@189.cn>
Date: Fri, 30 Jun 2023 12:42:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 6/8] PCI/VGA: Introduce is_boot_device function
 callback to vga_client_register
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>
References: <20230629155436.GA397963@bhelgaas>
 <bcfdc77d-a94d-bca1-56e3-5e14e91f6fd9@189.cn>
 <MN0PR12MB6101CDB6FF9DC8F8EDEF5F45E225A@MN0PR12MB6101.namprd12.prod.outlook.com>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <MN0PR12MB6101CDB6FF9DC8F8EDEF5F45E225A@MN0PR12MB6101.namprd12.prod.outlook.com>
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Chai,
 Thomas" <YiPeng.Chai@amd.com>, "Gao, Likun" <Likun.Gao@amd.com>,
 Yi Liu <yi.l.liu@intel.com>, Karol Herbst <kherbst@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Kevin Tian <kevin.tian@intel.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Zhang,
 Bokun" <Bokun.Zhang@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Abhishek Sahu <abhsahu@nvidia.com>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/30 01:44, Limonciello, Mario wrote:
> I think what you can do is pick up all the tags in your next version.  Once the
> whole series has tags we can discuss how it merges.

Yes, you are right.

I will prepare the next version.

But I think, I should only gather the reverent part together.

I means that I probably should divide the 8 patches in V7 into 4 + 4.

The first four patch form a group, and the last four patch form another 
group.


Certainly, I will pick up the precious tags I got in the next version.

Thanks you!

