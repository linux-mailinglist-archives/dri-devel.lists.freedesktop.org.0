Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09468A8468F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 16:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB0F10E118;
	Thu, 10 Apr 2025 14:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fAW0k68Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463E710E118
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 14:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TD9gJDoeIYWoLN39DzPWwvY2Y5ci8qPdXqVd0lqAifM=; b=fAW0k68YRp9bnpjKIBpwOdu8Fm
 RJr3T6YT+xnmzH+wH+8d3vLrDPSAhX2EcAoIVZ0VHhmZxODYmQUpsosCHVeZGDQHtdiauroSNCchU
 urMJeBlSY7BfJBQAzDCMXCju7dvOw6JnS/gZBQtknXzjT7X07sOSbniln07z52ox7oXhgaYSionkA
 rF4yRvU3d92FTci5d2o8Gmlxm+RSPjdnzwdV+BBHXjj8Dhv4lWkumfJBazYfgxXfq9p8g9vbGI+9F
 uxAfVh3Vnn/CXoQP72FHS9yGwEDhCmzrYzpKkp/atlWqv9FW6ByKk7jb4TTnI4UtOs/uYigVhD2ZL
 1oR6d3GQ==;
Received: from [177.134.103.112] (helo=[192.168.68.130])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u2t55-00EiHQ-KJ; Thu, 10 Apr 2025 16:40:39 +0200
Message-ID: <2266002e-372d-434c-a2f5-282166e28c70@igalia.com>
Date: Thu, 10 Apr 2025 11:40:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm/ci: Add devicetree validation and KUnit tests
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, daniel@fooishbar.org, helen.fornazier@gmail.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, lumag@kernel.org, quic_abhinavk@quicinc.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
References: <20250409061543.311184-1-vignesh.raman@collabora.com>
 <ef5b7030-c38a-44b9-b0bd-28ea6adb17c2@igalia.com>
 <a16c70e0-9078-4a21-9fa1-ca9d33823ff2@collabora.com>
Content-Language: en-US
From: Helen Koike <koike@igalia.com>
In-Reply-To: <a16c70e0-9078-4a21-9fa1-ca9d33823ff2@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/04/2025 05:07, Vignesh Raman wrote:
> Hi Helen,
> 
> On 09/04/25 23:53, Helen Koike wrote:
>> Hi Vignesh,
>>
>> Thank you for your patch.
>>
>> On 09/04/2025 03:15, Vignesh Raman wrote:
>>> Add jobs to validate devicetrees and run KUnit tests.
>>>
>>> Pipeline link,
>>> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1400550
>>
>> I see the checks are in the same stage as build, does it make sense to 
>> create another stage? Similar to what was proposed on kci-gitlab?
>>
>> Also, I don't think it make sense for kunit to be in the build stage. 
>> Maybe in software-driver? Since kunit runs on a qemu.
> 
> We can add a `test` stage for kunit and a `static-checks` stage for 
> devicetree validation and check patch. What do you think?

Ack on static-checks stage.

`test` stage confuses me, because all the other stages with driver names 
are also tests, this is why I suggested to move to `software-driver`.

Or maybe we could just have a kunit stage for now.

Helen

> 
> Regards,
> Vignesh
> 
>>
>> Helen
>>
>>>
>>> Link to v1,
>>> https://lore.kernel.org/all/20250327160117.945165-1- 
>>> vignesh.raman@collabora.com/
>>>
>>> Vignesh Raman (2):
>>>    drm/ci: Add jobs to validate devicetrees
>>>    drm/ci: Add jobs to run KUnit tests
>>>
>>>   drivers/gpu/drm/ci/check-devicetrees.yml | 43 ++++++++++++++++++++++++
>>>   drivers/gpu/drm/ci/dt-binding-check.sh   | 16 +++++++++
>>>   drivers/gpu/drm/ci/dtbs-check.sh         | 19 +++++++++++
>>>   drivers/gpu/drm/ci/gitlab-ci.yml         |  2 ++
>>>   drivers/gpu/drm/ci/kunit.sh              | 11 ++++++
>>>   drivers/gpu/drm/ci/kunit.yml             | 32 ++++++++++++++++++
>>>   6 files changed, 123 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
>>>   create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
>>>   create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
>>>   create mode 100755 drivers/gpu/drm/ci/kunit.sh
>>>   create mode 100644 drivers/gpu/drm/ci/kunit.yml
>>>
>>
> 

