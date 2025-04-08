Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7397A80EFA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 16:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB1210E241;
	Tue,  8 Apr 2025 14:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M6weDvw/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4579110E147
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 14:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744124124; x=1775660124;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=o8ReBQljhmpMI3FPMcUculst+xOm6O19xdXnTHZtiY8=;
 b=M6weDvw/tGd5L+wOJSAAM6vZ+VNt+i6Cb5gb6KB6hlSJBgjtXpI3EFF5
 PJvJboc+9rUmO4XXkWzsxUMEEnVcTgq/ni/+QgaI8eIFGgZL2A6CIlj71
 jW1Oj985KgdmiH2eL1H3Z7dl/0iWxj9GxKG1g4o89J8366PQrlP/Ms2gK
 4af4ieznKcQM2JZLeokA6t6SZD0CR39SVie4QsCiCbMZZOzzOVgyWIn+v
 6F4kwo8iwK1l+KD1NTo46pJl51QHvtKbPs4Yi0hWrBN5BO3X0IP8+Ce6V
 idn8i0lGRgs9EZverqV03HlYkzlcVDdnmCw6fMZtbGi3AsPs4LkfZEOQ1 A==;
X-CSE-ConnectionGUID: 8LqMPKwST9qZIzixaUiZIA==
X-CSE-MsgGUID: PwSPjB0sTDC+30y/GK4jhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="55744801"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208,217";a="55744801"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 07:55:23 -0700
X-CSE-ConnectionGUID: 8DuRXhMMS6u/ghoER8+jHw==
X-CSE-MsgGUID: muETkjt7StyLf9jE0ySZrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
 d="scan'208,217";a="165514707"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.245.121.109])
 ([10.245.121.109])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 07:55:22 -0700
Content-Type: multipart/alternative;
 boundary="------------aVSzgYYiFcpnfNTYNGSFm5yN"
Message-ID: <07d3558d-54c9-45b9-9945-fb948d37e84f@linux.intel.com>
Date: Tue, 8 Apr 2025 16:55:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] accel/ivpu: Show NPU frequency in sysfs
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jacek.lawrynowicz@linux.intel.com,
 lizhi.hou@amd.com, Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
References: <20250401155912.4049340-1-maciej.falkowski@linux.intel.com>
 <20250401155912.4049340-3-maciej.falkowski@linux.intel.com>
 <464ccbb4-3c72-4ecf-a0cf-35d2ad9d04a4@oss.qualcomm.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <464ccbb4-3c72-4ecf-a0cf-35d2ad9d04a4@oss.qualcomm.com>
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

This is a multi-part message in MIME format.
--------------aVSzgYYiFcpnfNTYNGSFm5yN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/4/2025 5:13 PM, Jeff Hugo wrote:

> On 4/1/2025 9:59 AM, Maciej Falkowski wrote:
>> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>>
>> Add sysfs files that show maximum and current
>> frequency of the NPU's data processing unit.
>> New sysfs entries:
>> - npu_max_frequency_mhz
>
> Don't you have an ioctl to get this, which is fixed in patch 1 of the 
> series?  Why duplicate that with a sysfs?

We added this to keep it consistent with sysfs entry for current frequency.
This is more for a convenience but ioctl is still required as user-mode 
driver requires this.
Do you think it is justified having this consideration?

>
>> - npu_current_frequency_mhz
>
> Do you have userspace code that consumes these?

We do have a support for two device monitors in a userspace - 
resources[1] and  btop[2].
I develop myself a btop support and have already frequency included, I 
will also include it in resources.

[1]: https://github.com/nokyan/resources/blob/main/src/utils/npu/intel.rs
<https://github.com/nokyan/resources/blob/main/src/utils/npu/intel.rs>[2]: 
https://github.com/m-falkowski/btop

>
>>
>> Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/ivpu_hw.h      |  5 ++++
>>   drivers/accel/ivpu/ivpu_hw_btrs.c |  8 +++++
>>   drivers/accel/ivpu/ivpu_hw_btrs.h |  1 +
>>   drivers/accel/ivpu/ivpu_sysfs.c   | 49 ++++++++++++++++++++++++++++++-
>
> Missing uapi documentation.
>
> Also, should the sysfs maintainers be included in the review?
>
Thank you for point this out. I included recipients using 
get_maintainers script.

Best regards,
Maciej

--------------aVSzgYYiFcpnfNTYNGSFm5yN
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>On 4/4/2025 5:13 PM, Jeff Hugo wrote:</p>
    <blockquote type="cite"
      cite="mid:464ccbb4-3c72-4ecf-a0cf-35d2ad9d04a4@oss.qualcomm.com">On
      4/1/2025 9:59 AM, Maciej Falkowski wrote:
      <br>
      <blockquote type="cite">From: Andrzej Kacprowski
        <a class="moz-txt-link-rfc2396E" href="mailto:Andrzej.Kacprowski@intel.com">&lt;Andrzej.Kacprowski@intel.com&gt;</a>
        <br>
        <br>
        Add sysfs files that show maximum and current
        <br>
        frequency of the NPU's data processing unit.
        <br>
        New sysfs entries:
        <br>
        - npu_max_frequency_mhz
        <br>
      </blockquote>
      <br>
      Don't you have an ioctl to get this, which is fixed in patch 1 of
      the series?  Why duplicate that with a sysfs?<br>
    </blockquote>
    <p>We added this to keep it consistent with sysfs entry for current
      frequency.<br>
      This is more for a convenience but ioctl is still required as
      user-mode driver requires this.<br>
      Do you think it is justified having this consideration?</p>
    <blockquote type="cite"
      cite="mid:464ccbb4-3c72-4ecf-a0cf-35d2ad9d04a4@oss.qualcomm.com">
      <br>
      <blockquote type="cite">- npu_current_frequency_mhz
        <br>
      </blockquote>
      <br>
      Do you have userspace code that consumes these?<br>
    </blockquote>
    <p>We do have a support for two device monitors in a userspace -
      resources[1] and  btop[2].<br>
      I develop myself a btop support and have already frequency
      included, I will also include it in resources.</p>
    <p>[1]: <a
href="https://github.com/nokyan/resources/blob/main/src/utils/npu/intel.rs"
        rel="noreferrer noopener"
title="https://github.com/nokyan/resources/blob/main/src/utils/npu/intel.rs"
        target="_blank">https://github.com/nokyan/resources/blob/main/src/utils/npu/intel.rs<br>
      </a>[2]: <a href="https://github.com/m-falkowski/btop"
        rel="noreferrer noopener"
        title="https://github.com/m-falkowski/btop" target="_blank"
        class="moz-txt-link-freetext">https://github.com/m-falkowski/btop</a></p>
    <blockquote type="cite"
      cite="mid:464ccbb4-3c72-4ecf-a0cf-35d2ad9d04a4@oss.qualcomm.com">
      <br>
      <blockquote type="cite">
        <br>
        Signed-off-by: Andrzej Kacprowski
        <a class="moz-txt-link-rfc2396E" href="mailto:Andrzej.Kacprowski@intel.com">&lt;Andrzej.Kacprowski@intel.com&gt;</a>
        <br>
        Signed-off-by: Maciej Falkowski
        <a class="moz-txt-link-rfc2396E" href="mailto:maciej.falkowski@linux.intel.com">&lt;maciej.falkowski@linux.intel.com&gt;</a>
        <br>
        ---
        <br>
          drivers/accel/ivpu/ivpu_hw.h      |  5 ++++
        <br>
          drivers/accel/ivpu/ivpu_hw_btrs.c |  8 +++++
        <br>
          drivers/accel/ivpu/ivpu_hw_btrs.h |  1 +
        <br>
          drivers/accel/ivpu/ivpu_sysfs.c   | 49
        ++++++++++++++++++++++++++++++-
        <br>
      </blockquote>
      <br>
      Missing uapi documentation.
      <br>
      <br>
      Also, should the sysfs maintainers be included in the review?
      <br>
      <br>
    </blockquote>
    Thank you for point this out. I included recipients using
    get_maintainers script.<br>
    <br>
    Best regards,<br>
    Maciej<br>
    <br>
  </body>
</html>

--------------aVSzgYYiFcpnfNTYNGSFm5yN--
