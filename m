Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA82A9310A0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 10:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FB910E30E;
	Mon, 15 Jul 2024 08:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OrX7BcEL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A174B10E1CB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 08:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721033558; x=1752569558;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=l4FdFEWG4RNG+NPOkvNxdL+rwE31rUQQHAk9mqAM9Q8=;
 b=OrX7BcELnHx5tr+bX2f2VLUln4Tu4EX1CICwErM4ooODlXnm3JuCnh7d
 g8NRJIvfzMp+MsYlSzICaZTkRUUrzs8YJyxJpMId5Fm3wRG086L5hSszX
 aqvZw4ZC+KH0JSSUVvuKu2pxlRanHvYXSJdclHJnB0ABlhAGAlvySULEw
 6AaG1eQB3AKBZmAGELtq+u7rE0FX8jOJS5l8lEg2ZQsLD0RypdKkKvdQU
 G4XtWgEpUehz/WYhoEKSsjC2wZHQMSSj+5l14zPpPIgNuoFvgvX/J31Eb
 +30kFz4DGXtC9dHzyYBCtjQhAyXEJe5K895UlzCI6QWDsjFlLwelpVg6v w==;
X-CSE-ConnectionGUID: 2T32tEL9Rmu6EEgcfBbalQ==
X-CSE-MsgGUID: 4fwILBY2QgCqC+kzW8tlnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="18597596"
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; d="scan'208";a="18597596"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 01:52:37 -0700
X-CSE-ConnectionGUID: 4qvkgtWIQ1O4yX1BjGm7kA==
X-CSE-MsgGUID: nbMlS/uLQti9hpgO7w39Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; d="scan'208";a="50194907"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.246.3.118])
 ([10.246.3.118])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 01:52:35 -0700
Message-ID: <117fa0e0-5945-44e2-910b-6fd478b32968@linux.intel.com>
Date: Mon, 15 Jul 2024 10:52:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] accel/ivpu: Add missing MODULE_FIRMWARE metadata
To: "Alexander F. Lent" <lx@xanderlent.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240709-fix-ivpu-firmware-metadata-v3-1-55f70bba055b@xanderlent.com>
 <35a7963e-e92b-4c73-b03d-a846e93adf5a@linux.intel.com>
 <ZpTgnNxSNbbeEWQ8@phenom.ffwll.local>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ZpTgnNxSNbbeEWQ8@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 15.07.2024 10:41, Daniel Vetter wrote:
> On Wed, Jul 10, 2024 at 12:23:06PM +0200, Jacek Lawrynowicz wrote:
>> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> 
> I'm assuming you'll also apply this one?
> -Sima

Sure

>> On 09.07.2024 13:54, Alexander F. Lent wrote:
>>> Modules that load firmware from various paths at runtime must declare
>>> those paths at compile time, via the MODULE_FIRMWARE macro, so that the
>>> firmware paths are included in the module's metadata.
>>>
>>> The accel/ivpu driver loads firmware but lacks this metadata,
>>> preventing dracut from correctly locating firmware files. Fix it.
>>>
>>> Fixes: 9ab43e95f922 ("accel/ivpu: Switch to generation based FW names")
>>> Fixes: 02d5b0aacd05 ("accel/ivpu: Implement firmware parsing and booting")
>>> Signed-off-by: Alexander F. Lent <lx@xanderlent.com>
>>> ---
>>> Hi Jacek,
>>>
>>> Thanks for catching the error, and for the more succinct comment.
>>> Please find v3 attached.
>>> ---
>>> Changes in v3:
>>> - Simplify comment, per review.
>>> - Fix typo in 40xx firmware path, per review.
>>> - Link to v2: https://lore.kernel.org/r/20240708-fix-ivpu-firmware-metadata-v2-1-78b953172026@xanderlent.com
>>>
>>> Changes in v2:
>>> - Only annotate the module with the production firmware paths, per review.
>>> - Drop macros for de-duping firmware fileames, just use string literals, per review.
>>> - Link to v1: https://lore.kernel.org/r/20240705-fix-ivpu-firmware-metadata-v1-1-704b73852d92@xanderlent.com
>>> ---
>>>  drivers/accel/ivpu/ivpu_fw.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
>>> index 1457300828bf..ef717802a3c8 100644
>>> --- a/drivers/accel/ivpu/ivpu_fw.c
>>> +++ b/drivers/accel/ivpu/ivpu_fw.c
>>> @@ -58,6 +58,10 @@ static struct {
>>>  	{ IVPU_HW_40XX, "intel/vpu/vpu_40xx_v0.0.bin" },
>>>  };
>>>  
>>> +/* Production fw_names from the table above */
>>> +MODULE_FIRMWARE("intel/vpu/vpu_37xx_v0.0.bin");
>>> +MODULE_FIRMWARE("intel/vpu/vpu_40xx_v0.0.bin");
>>> +
>>>  static int ivpu_fw_request(struct ivpu_device *vdev)
>>>  {
>>>  	int ret = -ENOENT;
>>>
>>> ---
>>> base-commit: 22a40d14b572deb80c0648557f4bd502d7e83826
>>> change-id: 20240704-fix-ivpu-firmware-metadata-3d02bd60768d
>>>
>>> Best regards,
> 
