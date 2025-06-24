Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C671AE6ADC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 17:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C08310E5DE;
	Tue, 24 Jun 2025 15:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="WGFcpeIH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1CF10E5CF;
 Tue, 24 Jun 2025 15:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tS2MD2P8KTyLJPahJ0RE/sxNRohzo8cGrJIZa01FQjs=; b=WGFcpeIHWpF4LV4Qy/Md26mCSZ
 NvwXC2XrAFFndygInot91Ucu1FA3rbsQqnANOuLYsLDhOvHGSLvlCnTOx5SNzyNKoBun0yNXSaJQ6
 ubcRKm9JEK/9lM0QGFY8/7mzr58l/JsAiEXKGLKHt9ehFIFczgJpQl4CAc+Rtr+9gL4KrcGkRxfFj
 ywRWI+5gC6KX3KDOMeCbaFcmdAN4wm9RR18xd0F1IipvjStCCQjkqcrHEjD6qag5Kcgj2uNelp4jC
 q9gMNY0RA/wlToO59QhXGHAJI7v4lQAQQhehAJTXgyqUItlQsQmdyAS4X/h6l/TjW0M6TH2CTzHJ7
 MLD0YllA==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uU5YQ-0083u2-PJ; Tue, 24 Jun 2025 17:27:22 +0200
Message-ID: <f1d61291-f8b8-4646-9195-3724fdee184b@igalia.com>
Date: Tue, 24 Jun 2025 12:27:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm: amdgpu: Fix includes of <linux/export.h>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
 amd-gfx@lists.freedesktop.org
References: <20250613182651.1758760-1-andrealmeid@igalia.com>
 <4907bbe3-14e7-49cc-b5bd-78ba375bf46d@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <4907bbe3-14e7-49cc-b5bd-78ba375bf46d@amd.com>
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

Hi Alex,

Em 16/06/2025 03:59, Christian König escreveu:
> Acked-by: Christian König <christian.koenig@amd.com> for the series.
> 

Can you add this series to amd-staging-drm-next? Thanks!

> On 6/13/25 20:26, André Almeida wrote:
>> Commit 7d95680d64ac ("scripts/misc-check: check unnecessary #include
>> <linux/export.h> when W=1") and commit a934a57a42f6 ("scripts/misc-check:
>> check missing #include <linux/export.h> when W=1") added new checks for when the
>> include <linux/export.h> is missued by drivers. This patchset make drm/amd code
>> compliant to this new commits.
>>
>> See also: https://lore.kernel.org/dri-devel/20250612121633.229222-1-tzimmermann@suse.de/
>>
>> André Almeida (2):
>>    drm/amd: Do not include <linux/export.h> when unused
>>    drm/amd: Include <linux/export.h> when needed
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c      | 1 -
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c   | 1 +
>>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c     | 1 -
>>   drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c | 1 -
>>   drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c  | 1 +
>>   5 files changed, 2 insertions(+), 3 deletions(-)
>>
> 

