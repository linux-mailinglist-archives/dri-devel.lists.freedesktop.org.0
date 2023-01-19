Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB1067379D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 12:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D002610E91A;
	Thu, 19 Jan 2023 11:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A972710E91A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 11:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674129498; x=1705665498;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WpspsDo0haQd9y9UL8rrG6L4IQJdPfU9iFssPJKQlJ8=;
 b=PqjRxJIAosdU5DrEauAun4GTds8WlZ16Nhj646j2h7SBj+h613OlRchw
 ns8WJm+nFsLzk3QMiatUcOUS6QwMVN5c0ukBi0N2g1/VY3TDWtAecplc/
 kT5jaNxgnygXcaXZSl2qpTCWGqDqyijeel/yHfkV0dVRD8DC0+L2VfrUn
 2TRqInfjWc2DkAoTyM7YOvAL7nrWFzkZx3H/YxA/Uh4yBNedH/K2tbk0G
 5mcG7ZKDMh0gq7NcEgM5hAc5ooXmIQ81cMStlE0/Y5iKh2YNT6O+pxAhI
 iSwf/rYIxIIl8DxoSLswvMsojprfDZJulggXzRVcJ5AHFpScYs09ErAlu Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="352521713"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="352521713"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 03:57:59 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="833967498"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="833967498"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.133.117])
 ([10.249.133.117])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 03:57:57 -0800
Message-ID: <9d842026-ca50-b629-b1af-57b23718bc5a@linux.intel.com>
Date: Thu, 19 Jan 2023 12:57:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 0/7] New DRM accel driver for Intel VPU
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230117092723.60441-1-jacek.lawrynowicz@linux.intel.com>
 <Y8klRchivhW/Mki8@phenom.ffwll.local>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Y8klRchivhW/Mki8@phenom.ffwll.local>
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
Cc: stanislaw.gruszka@linux.intel.com, quic_jhugo@quicinc.com,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 andrzej.kacprowski@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 19.01.2023 12:11, Daniel Vetter wrote:
> On Tue, Jan 17, 2023 at 10:27:16AM +0100, Jacek Lawrynowicz wrote:
>> Hi,
>>
>> This patchset contains a new Linux* Kernel Driver for Intel® VPUs.
>>
>> VPU stands for Versatile Processing Unit and it is an AI inference accelerator
>> integrated with Intel non-server CPUs starting from 14th generation.
>> VPU enables efficient execution of Deep Learning applications
>> like object detection, classification etc.
>>
>> The whole driver is licensed under GPL-2.0-only except for two headers imported
>> from the firmware that are MIT licensed.
>>
>> User space stack is open source and available at:
>>   - UMD driver: https://github.com/intel/linux-vpu-driver
>>   - Compiler and OpenVINO plugin: https://github.com/openvinotoolkit/vpux-plugin
>>
>> The firmware for the VPU will be distributed as a closed source binary in
>> the UMD driver repo.
>>
>> This is hopefully the last revision of the patchset with minor changes outlined
>> below.
> Entire series pushed to drm-misc-next, thanks a lot and apologies that
> this all got hold up for longer than usual with the drivers/accel
> transition. But hopefully bright future ahead!

Sure. Thanks for guidance and support.
The driver got definitely a lot better because of the upstreaming process.

Regards,
Jacek

