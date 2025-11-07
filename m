Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F6DC3E4DC
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 04:07:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA54810E187;
	Fri,  7 Nov 2025 03:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="uPJ2hOP/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B479F10E075;
 Fri,  7 Nov 2025 03:07:38 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d2kWW3J1sz9tWy;
 Fri,  7 Nov 2025 04:07:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762484855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jx2bBAIXMGIZv7u/FcJ32DGgtD9uv0lkYEYQRNJYCc0=;
 b=uPJ2hOP/+o0SiGaTgGPIiT+z3ILPYbXujp1D/JGrbmRks3K1EDPF9/Prur54HKDJfeOyYN
 ai8+melom3FpWK8MADkv28PIXqt1gpPEy2zP0T9ULSDeGWidyWAAgWNcnys/5KRQybETMt
 pThMr/WQv7Cnp/g8DK6qgIaz9UUSGx7bwP+0kPeO0Bdl+6T1ASimqdF+RvEqqDAKTjKp1s
 tv5Rg7TG5zWtRQNLfs4rlqucoEj0F9pkbL6OC82Ji1P94A7R+WaqCce59ZuPq5VCxM4Xv7
 yOM2V0qzJ0TXTMLIC0M/zSB1WrARYS3bFFl7FnAMDLDkDhsnqS4PRjjbU1lrLQ==
Message-ID: <4ec46455-a872-45ae-963e-cb2a76f5a845@mailbox.org>
Date: Fri, 7 Nov 2025 04:07:33 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/etnaviv: add HWDB entry for GC8000 Nano Ultra VIP
 r6205
To: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Gert Wollny <gert.wollny@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250919183042.273687-1-marek.vasut@mailbox.org>
 <CAH9NwWcK_z_4CcDBRYS2nf3AxYV9-XwirvTd+O9uJtHMhyA3Og@mail.gmail.com>
 <CAH9NwWdkjpV5YHmOpuCE=f7RVm1kXzqAOgN6=Sx1s-wxO_SGGA@mail.gmail.com>
 <4ac9dd98-adc8-4be9-9f5c-4e653f656453@mailbox.org>
 <CAH9NwWd+1MSBGdn6G0zRQgmC7cHCmG3BSxeDUQV-waMG75E2KQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAH9NwWd+1MSBGdn6G0zRQgmC7cHCmG3BSxeDUQV-waMG75E2KQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 1f2d2d18baad58fb76b
X-MBO-RS-META: ptcbbyfqd96su78xegda7fk6isrd8b7f
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

On 11/5/25 2:44 PM, Christian Gmeiner wrote:

Hello everyone,

>> I _think_ I will try to respin the flop reset patchset next.
> 
> Gert told me on irc that he has reworked the series already and just
> needs to do some testing. Maybe wait another 1-2 weeks
> and/or sync with him directly.

Let me add Gert on CC . I can also do that testing and provide TB if 
that would be helpful, I already tested the previous series and have MP2 
on my desk now.

-- 
Best regards,
Marek Vasut
