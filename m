Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AB76C44A6
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 09:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FFD10E87B;
	Wed, 22 Mar 2023 08:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1117310E87B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 08:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679472670; x=1711008670;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=spovA4JXKaZ5IUF6+66tTlvo4jyXkdm34KKyQgnokfU=;
 b=ZrUYobKeZd/21N6kRurzGG+w7wajGdAdR8poQ+FgI5kE/8WxcO2xGiFb
 b/9z+ZpLu8AImwWY3Y6H4WkYPRBRmC19UcQ842g9ahw/KMuLRBF+JJcD9
 zEwE5rVIUFfgGJCHY3jlnN9vubPzcjew+5gr6kpMZAAYWNoW4PeLihtjf
 WYZyr29siVUT2Y0NojukxBIlINuFIrEDhNnWJ8nMrJBp5eNq066/rKG9y
 SUAQebe5QIevr7x9v6X/OFJIV/uAFPbmh9wSjWxgYYy5cWkDn5rLZ3CJK
 ey1sSDt8CGfnqKFw3Wkr6kwTmc+WKlhHOvtYII/th1G9wI3SrEWkXqLQi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="339193959"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="339193959"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 01:11:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792444122"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="792444122"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.146.128])
 ([10.249.146.128])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 01:11:06 -0700
Message-ID: <d79799c4-6ed3-c7ec-8061-3e5a6bf42d43@linux.intel.com>
Date: Wed, 22 Mar 2023 09:11:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 6/8] accel/qaic: Add mhi_qaic_cntl
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, ogabbay@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, stanislaw.gruszka@linux.intel.com
References: <1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com>
 <1679325074-5494-7-git-send-email-quic_jhugo@quicinc.com>
 <8571460d-17eb-bc76-6d07-58bd036ff0d0@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <8571460d-17eb-bc76-6d07-58bd036ff0d0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: dafna@fastmail.com, linux-doc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_ajitpals@quicinc.com, quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Hi,

On 20.03.2023 20:06, Jeffrey Hugo wrote:
> On 3/20/2023 9:11 AM, Jeffrey Hugo wrote:
>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>
>> Some of the MHI channels for an AIC100 device need to be routed to
>> userspace so that userspace can communicate directly with QSM. The MHI
>> bus does not support this, and while the WWAN subsystem does (for the same
>> reasons), AIC100 is not a WWAN device. Also, MHI is not something that
>> other accelerators are expected to share, thus an accel subsystem function
>> that meets this usecase is unlikely.
>>
>> Create a QAIC specific MHI userspace shim that exposes these channels.
>>
>> Start with QAIC_SAHARA which is required to boot AIC100 and is consumed by
>> the kickstart application as documented in aic100.rst
>>
>> Each AIC100 instance (currently, up to 16) in a system will create a
>> chardev for QAIC_SAHARA. This chardev will be found as
>> /dev/<mhi instance>_QAIC_SAHARA
>> For example - /dev/mhi0_QAIC_SAHARA
>>
>> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
>> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>> ---
>>   drivers/accel/qaic/mhi_qaic_ctrl.c | 571 +++++++++++++++++++++++++++++++++++++
>>   drivers/accel/qaic/mhi_qaic_ctrl.h |  12 +
>>   2 files changed, 583 insertions(+)
>>   create mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.c
>>   create mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.h
>>
>> diff --git a/drivers/accel/qaic/mhi_qaic_ctrl.c b/drivers/accel/qaic/mhi_qaic_ctrl.c
>> new file mode 100644
>> index 0000000..a46ba1d
>> --- /dev/null
>> +++ b/drivers/accel/qaic/mhi_qaic_ctrl.c
>> @@ -0,0 +1,571 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/* Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved. */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/mhi.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/poll.h>
>> +#include <linux/version.h>
> 
> Will remove this.
> 
> Jacek, I think I've got all of your comments addressed.  Do you see anything more?  I'm hopeful that we are just looking at one more spin.

Yeah, I don't have any additional comments.
The whole patchset looks OK to me :)

Regards,
Jacek


