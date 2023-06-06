Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 114A072405A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 13:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7B510E234;
	Tue,  6 Jun 2023 11:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7963810E21E;
 Tue,  6 Jun 2023 11:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686049231; x=1717585231;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3b3vmHcNenRMEV+YtNGwUxporwj/nTLjEg7K71x0dfQ=;
 b=AcRdxOI+9OebY+UyY0Q/mUlWqU3+9MNwRzRFfYEikRRnqDf6aK6XfxMh
 E161QxvJJ0SmtkHicbucZ1ZOzInRnZjnE+KXu22hZcULNpLyDEgtclyfo
 mBc9rXdRJaQ7/g93RU8Y4CsWsfKPG9HQ4o91lV8LBCMiGP3+x7OgFUTVe
 cMcy+oi1UTGiydlQa0exKeItvuqgnK7q5bLl8gVVAWqY4dSkE/Vg4wfLy
 Z3rWZxx4+M0R/YotpWOMR7AFgoHvKcZ6WmV00zwaivls0I52G/Jhf/Okk
 QaU7uIk9Q6rdjXEhTBZVRy/zyEFYZxhkTnkzXi5VWR1vvyQ2Z4twhPQNV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="384944996"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="384944996"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 04:00:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="703119390"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="703119390"
Received: from yuguen-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.252.57.68])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 04:00:08 -0700
Date: Tue, 6 Jun 2023 13:00:02 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [Intel-gfx] [PATCH v2 1/2] vgaarb: various coding style and
 comments fix
Message-ID: <ZH8RslOfwIVf527x@ashyti-mobl2.lan>
References: <20230604205831.3357596-1-15330273260@189.cn>
 <ZH5epG6rfTOWT6CS@ashyti-mobl2.lan>
 <f9e67fe9-a93b-75ab-1fdb-87d3783fe5fc@loongson.cn>
 <680cea2e-7984-5f26-c440-46047f4733fa@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <680cea2e-7984-5f26-c440-46047f4733fa@189.cn>
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
 Andi Shyti <andi.shyti@linux.intel.com>, linux-pci@vger.kernel.org,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Kevin Tian <kevin.tian@intel.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, Bokun Zhang <Bokun.Zhang@amd.com>,
 intel-gfx@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 loongson-kernel@lists.loongnix.cn,
 Alex Williamson <alex.williamson@redhat.com>,
 Abhishek Sahu <abhsahu@nvidia.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Li Yi <liyi@loongson.cn>,
 Pan Xinhui <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

On Tue, Jun 06, 2023 at 06:27:05PM +0800, Sui Jingfeng wrote:
> Hi,
> 
> On 2023/6/6 10:06, Sui Jingfeng wrote:
> > Originally, I also want to express the opinion.
> 
> 
> Originally,  I want to express the same opinion as you told me.
> 
> Because vga_iostate_to_str() function is taking unsigned int parameter.
> 
> so, I think, using 'unsigned int *' type as the third parameter
> vga_str_to_iostate() function is more suitable.
> 
> 
> But this patch is too trivial, so I smash them into one patch.

it does not matter. Please keep patches separated. A trivial
patch can be ignored, however lots of trivial patches in a bigger
series might be appreciated.

Have fun!

Andi
