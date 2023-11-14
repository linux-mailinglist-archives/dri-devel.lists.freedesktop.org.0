Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EE37EB378
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 16:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8399D10E44C;
	Tue, 14 Nov 2023 15:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B92310E209;
 Tue, 14 Nov 2023 15:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699975564; x=1731511564;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=ASxF03DcAzu3fn+b7RZlKupPgSYZkB6oAZkuLs8GoTY=;
 b=PeWHMiuCQ1rqcOg0VNAO10oU05KelqiMnbrJggCzNHvWD2yrR7nnFScG
 3F4ETrQZ+rm2f6DqMB7DapKnkQ3uc6hC+gXCYv8RnBo4JitxIzpSaXFBN
 t+EdlrOdcRD3YquqaLK3/nFUSrTS+qO3KPzLQdK3aShmyQ2kbXq0wFa96
 1YCjrPOrQhtDAGcICAgglcN0pokJpwvQRDmgjp0TTw6e+19lK+81axZ1q
 88qL7N/O2zAAThsFhAvFSZsXVh0IHzkciOJgWHpToymBvHHUD/0i59psc
 FdpX8K6ZxT3RIqomT+0BLsfZLmzWAq+Rp3eTnLRHzg9QWJ0Q60gkksORU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381072335"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
 d="scan'208,217";a="381072335"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 07:26:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="830636312"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
 d="scan'208,217";a="830636312"
Received: from shari19x-mobl1.gar.corp.intel.com (HELO [10.249.254.120])
 ([10.249.254.120])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 07:26:00 -0800
Content-Type: multipart/alternative;
 boundary="------------rV2RH1PU6jmIsiATj8ngsS94"
Message-ID: <716d4ec8-4c03-8eb5-a244-93bd1b89aced@linux.intel.com>
Date: Tue, 14 Nov 2023 16:25:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-xe] [PATCH v3] Documentation/gpu: VM_BIND locking document
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20231022180236.5170-1-thomas.hellstrom@linux.intel.com>
 <ZUKw5DxOb5T48F+Q@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZUKw5DxOb5T48F+Q@intel.com>
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
Cc: Francois Dugast <francois.dugast@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------rV2RH1PU6jmIsiATj8ngsS94
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, Rodrigo

On 11/1/23 21:11, Rodrigo Vivi wrote:
>> Add the first version of the VM_BIND locking document which is
>> intended to be part of the xe driver upstreaming agreement.
>>
>> The document describes and discuss the locking used during exec-
>> functions, evicton and for userptr gpu-vmas. Intention is to be using the
>> same nomenclature as the drm-vm-bind-async.rst.
>>
>> v2:
>> - s/gvm/gpu_vm/g (Rodrigo Vivi)
>> - Clarify the userptr seqlock with a pointer to mm/mmu_notifier.c
>>    (Rodrigo Vivi)
>> - Adjust commit message accordingly.
>> - Add SPDX license header.
>>
>> v3:
>> - Large update to align with the drm_gpuvm manager locking
>> - Add "Efficient userptr gpu_vma exec function iteration" section
>> - Add "Locking at bind- and unbind time" section.
>>
>> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
>> Signed-off-by: Thomas Hellström<thomas.hellstrom@linux.intel.com>

Thanks for the review comments. I'll address all these in a v4 shortly.

/Thomas


--------------rV2RH1PU6jmIsiATj8ngsS94
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi, Rodrigo<br>
    </p>
    <div class="moz-cite-prefix">On 11/1/23 21:11, Rodrigo Vivi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ZUKw5DxOb5T48F+Q@intel.com">
      <blockquote type="cite" style="color: #007cff;">
        <pre class="moz-quote-pre" wrap="">Add the first version of the VM_BIND locking document which is
intended to be part of the xe driver upstreaming agreement.

The document describes and discuss the locking used during exec-
functions, evicton and for userptr gpu-vmas. Intention is to be using the
same nomenclature as the drm-vm-bind-async.rst.

v2:
- s/gvm/gpu_vm/g (Rodrigo Vivi)
- Clarify the userptr seqlock with a pointer to mm/mmu_notifier.c
  (Rodrigo Vivi)
- Adjust commit message accordingly.
- Add SPDX license header.

v3:
- Large update to align with the drm_gpuvm manager locking
- Add "Efficient userptr gpu_vma exec function iteration" section
- Add "Locking at bind- and unbind time" section.

Cc: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com" moz-do-not-send="true">&lt;rodrigo.vivi@intel.com&gt;</a>
Signed-off-by: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com" moz-do-not-send="true">&lt;thomas.hellstrom@linux.intel.com&gt;</a></pre>
      </blockquote>
    </blockquote>
    <p>Thanks for the review comments. I'll address all these in a v4
      shortly.</p>
    <p>/Thomas</p>
    <p><br>
    </p>
  </body>
</html>

--------------rV2RH1PU6jmIsiATj8ngsS94--
