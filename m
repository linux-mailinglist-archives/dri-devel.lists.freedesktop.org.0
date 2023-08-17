Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D56077F46F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 12:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352E510E43A;
	Thu, 17 Aug 2023 10:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BBD10E43A;
 Thu, 17 Aug 2023 10:48:28 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4RRMDS2MTxz9sLw;
 Thu, 17 Aug 2023 12:48:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1692269304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fny/CqimyoLLetisFV/XZE9q+b3vH4Uf6+53LTeD3Xc=;
 b=hVrjAYaQqtte52ViUZbgir0d7TtghFlhbHRwegFjkkYjk7ftLkbcStF6PkuYU5A49Jqxq4
 CDX4KYQcvSK8wKjf+NiEodmAzEO9qyZjXj0RHad3XUkheEAnlE8XEAd/qXa/pefZmUQdAK
 WypLm+WOAKWdx38LERuoW8szCPw4it79som631ccxWrHlk5ZHjF+kH8Z1cWYdF1uwcVVOh
 fGFHhoRI5a5/Qjfz+6MyXJ0euq/Xxq/vLZFKifQV/OTk/5N7N+lGjwuN2vJ043546eDX1P
 sQfwYEam4UFjResU8YVAEtqYJ+bcyRbqZsWl+JGKYbcl+1BlhhUl4TcKTKKoyA==
Message-ID: <cec0fe4d-d244-d78b-ff70-e8dfba23070b@mailbox.org>
Date: Thu, 17 Aug 2023 12:48:21 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v6 6/6] drm/doc: Define KMS atomic state set
Content-Language: de-CH-frami, en-CA
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, wayland-devel@lists.freedesktop.org
References: <20230815185710.159779-1-andrealmeid@igalia.com>
 <20230815185710.159779-7-andrealmeid@igalia.com>
 <1b23576d-1649-ff5c-6273-b54729ea46d8@mailbox.org>
In-Reply-To: <1b23576d-1649-ff5c-6273-b54729ea46d8@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: s7ajxdmgaxdr1ccm97yikip8rdmjuqny
X-MBO-RS-ID: 1601beecaa62c7d6caf
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com, hwentlan@amd.com,
 christian.koenig@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/17/23 12:37, Michel Dänzer wrote:
> On 8/15/23 20:57, André Almeida wrote:
>> From: Pekka Paalanen <pekka.paalanen@collabora.com>
>>
>> Specify how the atomic state is maintained between userspace and
>> kernel, plus the special case for async flips.
>>
>> Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> 
> [...]
> 
>> +An atomic commit with the flag DRM_MODE_PAGE_FLIP_ASYNC is allowed to
>> +effectively change only the FB_ID property on any planes. No-operation changes
>> +are ignored as always. [...]
> 
> During the hackfest in Brno, it was mentioned that a commit which re-sets the same FB_ID could actually have an effect with VRR: It could trigger scanout of the next frame before vertical blank has reached its maximum duration. Some kind of mechanism is required for this in order to allow user space to perform low frame rate compensation.

That said, it doesn't make too much sense to use DRM_MODE_PAGE_FLIP_ASYNC for this, since it won't have any effect outside of vertical blank anyway.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

