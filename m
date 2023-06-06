Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05623723F65
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 12:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330F210E32B;
	Tue,  6 Jun 2023 10:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 714A410E21B;
 Tue,  6 Jun 2023 10:27:17 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:56328.1404265272
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id EFA0E1002A9;
 Tue,  6 Jun 2023 18:27:10 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-7vx9t with ESMTP id
 b5e6b79af1f8443dafae01c9526be680 for suijingfeng@loongson.cn; 
 Tue, 06 Jun 2023 18:27:14 CST
X-Transaction-ID: b5e6b79af1f8443dafae01c9526be680
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <680cea2e-7984-5f26-c440-46047f4733fa@189.cn>
Date: Tue, 6 Jun 2023 18:27:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH v2 1/2] vgaarb: various coding style and
 comments fix
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <20230604205831.3357596-1-15330273260@189.cn>
 <ZH5epG6rfTOWT6CS@ashyti-mobl2.lan>
 <f9e67fe9-a93b-75ab-1fdb-87d3783fe5fc@loongson.cn>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <f9e67fe9-a93b-75ab-1fdb-87d3783fe5fc@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Yi Liu <yi.l.liu@intel.com>,
 kvm@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Kevin Tian <kevin.tian@intel.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, loongson-kernel@lists.loongnix.cn,
 Alex Williamson <alex.williamson@redhat.com>,
 Abhishek Sahu <abhsahu@nvidia.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Li Yi <liyi@loongson.cn>,
 Pan Xinhui <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/6 10:06, Sui Jingfeng wrote:
> Originally, I also want to express the opinion. 


Originally,  I want to express the same opinion as you told me.

Because vga_iostate_to_str() function is taking unsigned int parameter.

so, I think, using 'unsigned int *' type as the third parameter 
vga_str_to_iostate() function is more suitable.


But this patch is too trivial, so I smash them into one patch.

