Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3390AD5EE2
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 21:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7CB10E27F;
	Wed, 11 Jun 2025 19:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V6+jHSbZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E9F10E27F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 19:18:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5D43AA51A01;
 Wed, 11 Jun 2025 19:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5CAC4CEE3;
 Wed, 11 Jun 2025 19:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749669479;
 bh=ixMFPUH8G0la89VryFZZwZQQgubi9L+Tr/reP0V53i0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V6+jHSbZf2qJ30VWwYEhPQo4xh+oakbO97KWLTzBkqRVFPOKjTpT38tDFJlzgHQUv
 i5SWQYgEUAiJIJ6+BmgDC+MJMfg+M8LidmiLu+nFmInp0g6ow8ABMzU3dNTxv9WU1w
 MW+0uMLguy7QsEfubvvKffhSsvz7oB7Hdk+fD+5U4VMhZ4c4NL4iG0f7CA7MqEsUKl
 I0UEshpoJCQS4NR/TCJif62mQ27Jz7zn6sOId0Rmrq17MuexRS2bdeQ9xuhGlDTfJX
 5jXr/R/bOf8Zl6i6dm6OXweRyrEvDLYkYzSCfDu4nIurrck+hT37gEcq4P+zAlGsa7
 +rFDXUr2fu9cA==
Message-ID: <5b6a642d-b9c6-4648-b1ab-1823bbcb7ea2@kernel.org>
Date: Wed, 11 Jun 2025 21:17:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: Add Apple SoC GPU
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: asahi@lists.linux.dev,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Neal Gompa <neal@gompa.dev>, Maxime Ripard <mripard@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
 <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
 <edf14a64-decc-4392-a038-08b5dd942f8d@kernel.org>
 <CAMT+MTRYybR=tFJrcUn43UK3iW-fqEH3rmCLUezq2eTrEK=nQw@mail.gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <CAMT+MTRYybR=tFJrcUn43UK3iW-fqEH3rmCLUezq2eTrEK=nQw@mail.gmail.com>
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

On 11.06.25 21:06, Sasha Finkelstein wrote:
> On Wed, 11 Jun 2025 at 20:44, Sven Peter <sven@kernel.org> wrote:
>>> +      - description: Driver-opaque calibration blob
>>> +      - description: Calibration blob
>>
>> Like Alyssa mentioned, this description also raises more questions than
>> it answers for me. Do we know what these two blobs contain or why they
>> are two separate blobs?
> 
> At some point in the gpu initialization process we give the firmware a bag
> of pointers to various stuff it needs. HwCalA and HwCalB are separate
> pointers, and they use separate gpu allocations. We do not fully know
> what is in there, but we know what some of the fields do and how to
> create the blobs based on data from apple device tree.

I looked at the driver itself and there are two comments related to
these:

HwDataA: This mostly contains power-related configuration.
HwDataB: This mostly contains GPU-related configuration.

Are they still accurate our just outdated leftovers from an early
version? If they're accurate I'd include them in the description here as
well.


Best,


Sven
