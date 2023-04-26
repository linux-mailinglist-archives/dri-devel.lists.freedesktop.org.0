Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F82E6EF170
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 11:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E090210E8F9;
	Wed, 26 Apr 2023 09:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA9210E8DB;
 Wed, 26 Apr 2023 09:51:56 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Q5vKN4DmGz9shS;
 Wed, 26 Apr 2023 11:51:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1682502712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pi1+yq2ekKSgxL5M2BKRF64dsgqTeeiFapJCZNKczms=;
 b=C9OEzOCreatLMtPJ+jtDU1ggcLGqaw+2LBAr2Z0pHYomiQyvcbyAOHMEBbLXy0zPwZzLUP
 Ix88v55gwl4URqbnxFuzed96vZU8Hd55K3+upO9T4rCt9mRzgjop62aIg/KOFgYIp+rHLw
 EN3w5K2pB3VvyPOEnIXon8WRdCpNROPljbN1kWFa1VogQZJ62STMnlBj3GKK2J5/icwF2J
 jcNInKb+MO+nOejgcaudd3cxd1h2GtLlU9zGOLZoIzounzGm0iAVE8PFx7XJ78H0hi4+9w
 Zm3ijx5Va7O3hHdjEXkyO2sDhHUJztGAaCuhNn0BQyAkaRA7AYLE1BIJPFsSsw==
Message-ID: <9087ef09-e617-dcf3-343e-162f79dc3e51@mailbox.org>
Date: Wed, 26 Apr 2023 11:51:50 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/amdgpu: Mark contexts guilty for any reset type
Content-Language: de-CH-frami, en-CA
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230424014324.218531-1-andrealmeid@igalia.com>
 <d7264c5a-29b4-0fb3-153b-673a8a73d635@amd.com>
 <CAAxE2A6Soq28ACV-m1OzG8CA-_VWp+N2wapsABzm2Nda=Qe+yA@mail.gmail.com>
 <784561bb-0937-befc-3774-892d6f6a4318@mailbox.org>
 <CAAxE2A6iuuVA7zjHM8YcTGMpEWuYV=hGRR1YW6W-qXHwAg9w7w@mail.gmail.com>
 <19406ec5-79d6-e9e6-fbdd-eb2f4a872fc4@amd.com>
 <5262c73e-e77c-91f7-e49e-a9c3571e2cc9@mailbox.org>
 <f5bf590a-5d3f-03f2-531c-057cf8760000@amd.com>
 <CAAxE2A4capwpc40F49cgZBC9jJisODqNjTe0cM_pS7si5EkW3g@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <CAAxE2A4capwpc40F49cgZBC9jJisODqNjTe0cM_pS7si5EkW3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 33jn9k1t3rxidepdiwr1xgfh7r7i69ff
X-MBO-RS-ID: 5e7fcf1a1e18bd88dee
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 kernel-dev@igalia.com, "Deucher, Alexander" <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/25/23 21:11, Marek Olšák wrote:
> The last 3 comments in this thread contain arguments that are false and were specifically pointed out as false 6 comments ago: Soft resets are just as fatal as hard resets. There is nothing better about soft resets. If the VRAM is lost completely, that's a different story, and if the hard reset is 100% unreliable, that's also a different story, but other than those two outliers, there is no difference between the two from the user point view. Both can repeatedly hang if you don't prevent the app that caused the hang from using the GPU even if the app is not robust. The robustness context type doesn't matter here. By definition, no guilty app can continue after a reset, and no innocent apps affected by a reset can continue either because those can now hang too. That's how destructive all resets are. Personal anecdotes that the soft reset is better are just that, anecdotes.

You're trying to frame the situation as black or white, but reality is shades of grey.


There's a similar situation with kernel Oopsen: In principle it's not safe to continue executing the kernel after it hits an Oops, since it might be in an inconsistent state, which could result in any kind of misbehaviour. Still, the default behaviour is to continue executing, and in most cases it turns out fine. Users which cannot accept the residual risk can choose to make the kernel panic when it hits an Oops (either via CONFIG_PANIC_ON_OOPS at build time, or via oops=panic on the kernel command line). A kernel panic means that the machine basically freezes from a user PoV, which would be worse as the default behaviour for most users (because it would e.g. incur a higher risk of losing filesystem data).


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

