Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 651BCBF8F5D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 23:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F88510E358;
	Tue, 21 Oct 2025 21:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="M2qf1d6p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A0810E34D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 21:41:54 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4crm3369nhz9sdm;
 Tue, 21 Oct 2025 23:41:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761082911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IHMfHGscns/uuf0cbZ28f9BJPu1+JO7oqC4JQfoPKi4=;
 b=M2qf1d6pG7sRd3Kw3/HNrD7lWnKFcmuM9ZWl/hwoKOCaoAV/+kcP5SPJfZKPzo+7uGaf27
 HAHfrmE+tXWGC+POfg+gLmC/Y4EjhVZ2ej+d8SMcEBCl5dnoJ0FzMJbgKgiUEu/9/XzN6K
 cKLZcboaSenOvoNJSN6DQRWjwKhNdWrQ7g5m5cshAVYX2DLdHRrJf5HLbOzsyIsA/D6fAv
 qyte6jJNIK5IrX7SFMlo6HcH/mu7AlCsxASyGRUUvja9KJT3W2rvM1DJQaK3vYfcug08Mm
 L1xe0mlUOuVnV4Cr4cJwTKqqngJBnxLCDy507p/2icGoG9Hzf7zMua712vqGag==
Message-ID: <fd7a144c-cb3e-4d6c-af13-8a63160759ac@mailbox.org>
Date: Tue, 21 Oct 2025 13:29:04 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] dt-bindings: gpu: img, powervr-rogue: Rework the allOf
 section
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
 <20251018130147.12831-2-marek.vasut+renesas@mailbox.org>
 <a6d42c7e-1146-4bda-baf6-be04f3185c5a@imgtec.com>
 <2e12fed7-21c0-48bf-94c4-a3d2850a3f0c@mailbox.org>
 <47a4b178-87cb-4137-ac2f-0c9e9f0ea9db@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <47a4b178-87cb-4137-ac2f-0c9e9f0ea9db@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 34531d245c5084c9ddf
X-MBO-RS-META: ykcgya5zhihkawricyazh644j9nc91co
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

On 10/21/25 10:39 AM, Matt Coster wrote:
> On 20/10/2025 16:25, Marek Vasut wrote:
>> On 10/20/25 5:12 PM, Matt Coster wrote:
>>
>> Hello Matt,
>>
>>> On 18/10/2025 14:00, Marek Vasut wrote:
>>>> Rework the current allOf: section such that all handling of
>>>> clocks/clock-names properties happens first, and all handling
>>>> of power-domains/power-domain-names happens second.
>>>
>>> The original layout of the allOf: section was power-domains first, then
>>> clock-domains. The actual ordering really doesn't matter, but I wonder
>>> if it would make for a slightly cleaner patch to do it that way round?
>>
>> It would, but I also wanted to sort this DT part alphabetically.
>>
>> If you want, I can split this patch in two, one which does this
>> splitting, and one which does alphabetical sorting.
>>
>> [...]
> 
> That's fair enough, I missed the alphabetical part! It's probably not
> worth splitting, the change isn't that large. This one is also:
> 
> Reviewed-by: Matt Coster <matt.coster@imgtec.com>
> 
> And I'll take these via drm-misc-next later today if there are no
> objections.
Thank you
