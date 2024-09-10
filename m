Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AEE9726E6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 04:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11EB10E6DC;
	Tue, 10 Sep 2024 02:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=vignesh.raman@collabora.com header.b="PRrhm0nW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02D310E63D;
 Tue, 10 Sep 2024 02:03:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1725933784; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TXoxNiVPbDk4lbhMZrPXg+RshK8/GZdnXhkENKA/uhQ22/CEzDGehM+2+JmxxqLnM0z3NhjGjQspNNg+vwZhqnfcjVB+tj+idQ8oMZNC/l91JGFHZ9He5LU1ryls+2NOkpztZSJxGpO6NIS0sypm3RUd+bbu7Ge2yGhD/5kmYNw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1725933784;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=h3TZMUaQoLyvj/KrL3jJOf4MzV2N0Ix68cPt3cEiC7s=; 
 b=HS5QUVRQWlXPlpMHykzGi7Fjk+QFxZCOvS3NY3ABXuUqbTMPA6VNuf9LdWi5DX4OIFxisy6RSIFM0E0Oy7rFAloWP4sar84i9DVaEYoEHa0210n3ePk1IMa7dfyjyvcHdO9ZSRX4zEA/BdWDecvbze88gN4nAfHWAVV/c7/sVyI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=vignesh.raman@collabora.com;
 dmarc=pass header.from=<vignesh.raman@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725933784; 
 s=zohomail; d=collabora.com; i=vignesh.raman@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=h3TZMUaQoLyvj/KrL3jJOf4MzV2N0Ix68cPt3cEiC7s=;
 b=PRrhm0nW7I14wI6+t25DV6+iTO0FdQa6Dk71QdMnZQZq+ZfG9jGlOqWuSQk1iYZA
 fE4Vt1C6F+mTgHElHZBgGXpGHEszJWLh5y8Myk5q+ztfNk1d2aVN12ZbAlNXR5w2NrZ
 cs82R6TNqpYBmGOK2I7YRdFSMFa538bz0q8ctsoU=
Received: by mx.zohomail.com with SMTPS id 1725933783082952.7598237383282;
 Mon, 9 Sep 2024 19:03:03 -0700 (PDT)
Message-ID: <61f62c86-3e82-4eff-bd3c-8123fa0ca332@collabora.com>
Date: Tue, 10 Sep 2024 07:32:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm-ci: flaky tests for i915 driver testing
From: Vignesh Raman <vignesh.raman@collabora.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>
References: <af4ca4df-a3ef-4943-bdbf-4c3af2c333af@collabora.com>
 <48fb86a9-b863-468e-ae74-35423b22b76d@collabora.com>
Content-Language: en-US
In-Reply-To: <48fb86a9-b863-468e-ae74-35423b22b76d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

Hi Maintainers,

On 12/07/24 11:22, Vignesh Raman wrote:
> Hi Maintainers,
> 
> On 28/05/24 12:07, Vignesh Raman wrote:
>> Hi Maintainers,
>>
>> There are some flaky tests reported for i915 driver testing in drm-ci 
>> for the below boards.
>>
>> *)
>> # Board Name: asus-C523NA-A20057-coral
>> # IGT Version: 1.28-g0df7b9b97
>> # Linux Version: 6.9.0-rc7
>> # Failure Rate: 50
>> kms_fb_coherency@memset-crc
>>
>> *)
>> # Board Name: asus-C436FA-Flip-hatch
>> # IGT Version: 1.28-g0df7b9b97
>> # Linux Version: 6.9.0-rc7
>> # Failure Rate: 50
>> kms_plane_alpha_blend@constant-alpha-min
>>
>> *)
>> # Board Name: hp-x360-12b-ca0010nr-n4020-octopus
>> # IGT Version: 1.28-g0df7b9b97
>> # Linux Version: 6.9.0-rc7
>> # Failure Rate: 50
>> core_hotunplug@unplug-rescan
>> kms_fb_coherency@memset-crc
>>
>> *)
>> # Board Name: hp-x360-14-G1-sona
>> # IGT Version: 1.28-g0df7b9b97
>> # Linux Version: 6.9.0-rc7
>> # Failure Rate: 50
>> prime_busy@hang
>>
>> *)
>> # Board Name: dell-latitude-5400-8665U-sarien
>> # IGT Version: 1.28-g0df7b9b97
>> # Linux Version: 6.9.0-rc7
>> # Failure Rate: 50
>> kms_pm_rpm@modeset-lpsp-stress
>>
>> *)
>> # Board Name: asus-C433TA-AJ0005-rammus
>> # IGT Version: 1.28-g0df7b9b97
>> # Linux Version: 6.9.0-rc7
>> # Failure Rate: 50
>> i915_hangman@engine-engine-error
>> i915_hangman@gt-engine-hang
>> kms_async_flips@crc
>> kms_universal_plane@cursor-fb-leak
>>
>> Will add these tests in,
>> drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
>> drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
>> drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
>> drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
>> drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
>> drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70
>>
>> Please could you have a look at these test results and let us know if 
>> you need more information. Thank you.
> 
> There are some flaky tests reported for i915 driver testing in drm-ci 
> with the recent IGT uprev in drm-ci 
> (https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0e7f4e6a20d550252c4f355d5a303b1d9c8ff052)
> 
> *)
> # Board Name: asus-C433TA-AJ0005-rammus
> # Bug Report: 
> https://lore.kernel.org/intel-gfx/af4ca4df-a3ef-4943-bdbf-4c3af2c333af@collabora.com/T/#u
> # Failure Rate: 50
> # IGT Version: 1.28-gf13702b8e
> # Linux Version: 6.10.0-rc5
> kms_sysfs_edid_timing
> i915_hangman@engine-engine-hang
> kms_pm_rpm@modeset-lpsp-stress
> 
> *)
> # Board Name: asus-C436FA-Flip-hatch
> # Bug Report: 
> https://lore.kernel.org/intel-gfx/af4ca4df-a3ef-4943-bdbf-4c3af2c333af@collabora.com/T/#u
> # Failure Rate: 50
> # IGT Version: 1.28-gf13702b8e
> # Linux Version: 6.10.0-rc5
> kms_atomic_transition@plane-all-modeset-transition-internal-panels
> 
> The expectation files have been updated with these tests,
> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
> 
> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt

There are some flaky tests reported for i915 driver testing in drm-ci 
with the recent IGT uprev in drm-ci.

*)
# Board Name: asus-C433TA-AJ0005-rammus
# Failure Rate: 50
# IGT Version: 1.28-ga73311079
# Linux Version: 6.11.0-rc2
kms_pm_rpm@drm-resources-equal

*)
# Board Name: asus-C523NA-A20057-coral
# Failure Rate: 100
# IGT Version: 1.28-ga73311079
# Linux Version: 6.11.0-rc2
kms_universal_plane@cursor-fb-leak

*)
# Board Name: asus-C436FA-Flip-hatch
# Failure Rate: 100
# IGT Version: 1.28-ga73311079
# Linux Version: 6.11.0-rc2
kms_plane_alpha_blend@constant-alpha-min

# Board Name: asus-C436FA-Flip-hatch
# Failure Rate: 50
# IGT Version: 1.28-ga73311079
# Linux Version: 6.11.0-rc2
kms_async_flips@crc

The expectation files have been updated with these tests,
https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt

https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt

https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
