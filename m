Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F285D986F37
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 10:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BBE10EB17;
	Thu, 26 Sep 2024 08:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="W7qGOs/W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB0210E065;
 Thu, 26 Sep 2024 08:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727340457;
 bh=Vvzgd1LgiFFFjFTb0+aUplSVjTmllj9XrlLOmFGWpvw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=W7qGOs/WXTcXx3RVTvEB2eSz0bFlxfIYGcY9VZKLpS7wzZyyKhJEQKdhfCBCZWKv9
 9M5yQ2aIMD9mnlwpL3oETbnJqGqSCa7DWtGW9smRY1pQ9sA2H6SXCxDrGePgnGnV6B
 G7LV/i6hn/yhLeyBfU5SgJw4bZrVOAfBb/FVNK2qn08z9tV1PotXjmwBrJxNjvEv+O
 C0DoHfqKT8zEw7l+OIobUsRFyHZTP5RgvXDTRAmsqOnK8I+f4QN33YFAnmdJL8ykb+
 X8sROyY544rjCZ5yvcOvQdlCNze3jQuNlxypIAGUuOIi+k4iULFsbHZFUgYhmh4Qn/
 sPYjix2VxY4Vg==
Received: from [192.168.50.250] (unknown [171.76.80.165])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 50E1317E1048;
 Thu, 26 Sep 2024 10:47:34 +0200 (CEST)
Message-ID: <9470f582-7873-42c6-b5a5-35f841e4f693@collabora.com>
Date: Thu, 26 Sep 2024 14:17:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/gpu: ci: update flake tests requirements
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 dmitry.baryshkov@linaro.org, rodrigo.vivi@intel.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240926070653.1773597-1-vignesh.raman@collabora.com>
 <20240926-athletic-gregarious-markhor-cc78ac@houat>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <20240926-athletic-gregarious-markhor-cc78ac@houat>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 26/09/24 12:56, Maxime Ripard wrote:
> On Thu, Sep 26, 2024 at 12:36:49PM GMT, Vignesh Raman wrote:
>> Update the documentation to require linking to a relevant GitLab
>> issue for each new flake entry instead of an email report. Added
>> specific GitLab issue URLs for i915, xe and other drivers.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>> - Add gitlab issue link for msm driver.
>>
>> ---
>>   Documentation/gpu/automated_testing.rst | 16 +++++++++++-----
>>   1 file changed, 11 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
>> index 2d5a28866afe..f918fe56f2b0 100644
>> --- a/Documentation/gpu/automated_testing.rst
>> +++ b/Documentation/gpu/automated_testing.rst
>> @@ -67,20 +67,26 @@ Lists the tests that for a given driver on a specific hardware revision are
>>   known to behave unreliably. These tests won't cause a job to fail regardless of
>>   the result. They will still be run.
>>   
>> -Each new flake entry must be associated with a link to the email reporting the
>> -bug to the author of the affected driver, the board name or Device Tree name of
>> -the board, the first kernel version affected, the IGT version used for tests,
>> -and an approximation of the failure rate.
>> +Each new flake entry must include a link to the relevant GitLab issue, the board
>> +name or Device Tree name, the first kernel version affected, the IGT version used
>> +for tests and an approximation of the failure rate.
>>   
>>   They should be provided under the following format::
>>   
>> -  # Bug Report: $LORE_OR_PATCHWORK_URL
>> +  # Bug Report: $GITLAB_ISSUE
>>     # Board Name: broken-board.dtb
>>     # Linux Version: 6.6-rc1
>>     # IGT Version: 1.28-gd2af13d9f
>>     # Failure Rate: 100
>>     flaky-test
>>   
>> +The GitLab issue must include the logs and the pipeline link. Use the appropriate
>> +link below to create an issue.
>> +https://gitlab.freedesktop.org/drm/i915/kernel/-/issues for i915 driver
>> +https://gitlab.freedesktop.org/drm/xe/kernel/-/issues for xe driver
>> +https://gitlab.freedesktop.org/drm/msm/-/issues for msm driver
>> +https://gitlab.freedesktop.org/drm/misc/kernel/-/issues for other drivers
>> +
> 
> I can't comment for the others, but drm-misc at least still requires
> reporting issues by mail, so, no, sorry, we can't switch to gitlab only
> for now.

In https://gitlab.freedesktop.org/drm/ we have xe, i915, msm, nouveau, 
and amd (only for issues). In drm-ci we test i915, msm and amd.
So I will add GitLab links for these and for other drivers use email 
reporting. I will reword this section. Thanks.

Regards,
Vignesh
