Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA00C21535
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 17:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B406B10E2A7;
	Thu, 30 Oct 2025 16:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="feigzhIk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001C210E2A1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:56:57 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cy9J662Stz9trP;
 Thu, 30 Oct 2025 17:56:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761843414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Ttz6snmnsibBpd8X+iGhr07gb4gBMz15P5Dl1gpIdA=;
 b=feigzhIknOmJCiqSJntXwgtVUgYp+r3hUJ4AiIcY0POzP7JnwQo9z2DLGjw01rPIMDmfFK
 WQXhIu7xz9Sg+FveiulwNoogOsngd6yh4zDNYteFIXTt3Vs5CLlwhnOQybhKmR5Mp3GI0j
 c7ehmYIMRkvxCnTGqnRriLbZlgzzh80fD1rG8stC4qCwiAHVBzpySjOJEiRhMxAaqOAeZU
 emAuLGoGDmRc9nwFhYiqQ75JnHT1HzqSanwNkB4k4OwT222oicJM7SMvrxD2nnC8N6Pk03
 AVPsEiSlpZFo3lMXdFVmKUVAY+dvArxQSgl/uD9m4Lb4x4TcvOTlXEaExIryeQ==
Message-ID: <bff8815c-e708-4573-a6f8-7fdec160a78f@mailbox.org>
Date: Thu, 30 Oct 2025 14:51:22 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: gpu: img,powervr-rogue: Drop duplicate
 newline
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251029194210.129326-1-marek.vasut+renesas@mailbox.org>
 <50c29b53-64b5-4ad4-a502-286248cbedfd@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <50c29b53-64b5-4ad4-a502-286248cbedfd@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 05f1c39c062893a7db8
X-MBO-RS-META: h7kpnyktco16tquosm7bezq1bnxciiwo
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

On 10/30/25 1:08 PM, Matt Coster wrote:

Hello Matt,

> On 29/10/2025 19:42, Marek Vasut wrote:
>> Fix the following DT schema check warning:
>>
>> ./Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml:103:1: [warning] too many blank lines (2 > 1) (empty-lines)
>>
>> One newline is enough. No functional change.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Good catch! Thanks for sending a fix. Does this also need:

Got a hint from Rob how to better scan bindings before sending patches, 
so the credit really goes there.

> Fixes: 18ff1dc462ef ("dt-bindings: gpu: img,powervr-rogue: Document GX6250 GPU in Renesas R-Car M3-W/M3-W+")
I am not sure about this one, I would say no because it has no 
functional impact on the kernel and/or does not fix any functional bug.
