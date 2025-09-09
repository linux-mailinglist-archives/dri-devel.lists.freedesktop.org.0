Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12547B4A5B4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 10:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F7710E65E;
	Tue,  9 Sep 2025 08:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="cqKp2gZk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C281010E2BA;
 Tue,  9 Sep 2025 08:43:53 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cLcmk3Zybz9tPJ;
 Tue,  9 Sep 2025 10:43:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757407430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EaY/kealtZvFpNFt6fUyL37ikAIiwkIr3pKJQ+3EQjw=;
 b=cqKp2gZkoXmHMVfyuVUNbB1AnUsKy3A/wuZ2WhXODSwOWG6N9G4f6mkKpOv85ygyKE9NrA
 /NS0PXVwjLhSt4edvYJ3MReZ4DDY4rAEDiWLh/BY29CAYIfIc+uVBw2Yd1Y51dTSnhxqAA
 pOoa/Z/ZzV1QM1JE3kUepGo7DMGOqFOsmWC7asRWHDhFPmTdvnANIW87Enj23PwTV61l5q
 q7NyZzxDKybtulcgd7PhUXdg+eISlcSq9+a+kk3uXDKPU0M9DHf+k1UghZkAiIb+eXJYFK
 17ypjFLgS/vXLBakz2WRETspdDoaUDUzYNrUhVfmkGibk+G1rMtAcW5csVdURw==
Message-ID: <63b7c020-e589-4644-887e-3922af939009@mailbox.org>
Date: Tue, 9 Sep 2025 10:43:47 +0200
MIME-Version: 1.0
Subject: Re: evergreen_packet3_check:... radeon 0000:1d:00.0: vbo resource
 seems too big for the bo
To: Borislav Petkov <bp@alien8.de>
Cc: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250829171655.GBaLHgh3VOvuM1UfJg@fat_crate.local>
 <CADnq5_Oqonrth+5T-83dnFBZ67GvykkPt-9aUepJd+fUMwnupw@mail.gmail.com>
 <20250829194044.GCaLICPKJcGJRYdSfO@fat_crate.local>
 <20250829204840.GEaLISKGTwuScnDF8Y@fat_crate.local>
 <CADnq5_MbpYmC2PSyOr0gQk7F8mVz0-LG3dZtUZS2HhV8LTgDww@mail.gmail.com>
 <20250830174810.GAaLM5WkiFc2BtQ6kW@fat_crate.local>
 <51ae551b-6708-4fcd-84f9-fc1400f02427@mailbox.org>
 <20250901101011.GAaLVxA_Ax0R-Wy2IX@fat_crate.local>
 <2764782f-d411-4142-aa56-f1af0968ecd5@mailbox.org>
 <20250908180022.GHaL8Zto-PsVsPa0e0@fat_crate.local>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <20250908180022.GHaL8Zto-PsVsPa0e0@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f89cfc3521c7b81e5ef
X-MBO-RS-META: 3t8pstzkshjkqsm3uqswjhq43agsk8i9
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

On 08.09.25 20:00, Borislav Petkov wrote:
> On Mon, Sep 08, 2025 at 07:05:17PM +0200, Michel Dänzer wrote:
>> These messages are primarily intended for developers, not users
> 
> But everybody sees them! And they're flooding the console.

There's no question that dev_warn_ratelimited is wrong here, I'm just saying dev_warn_once isn't quite right either.


BTW, the same arguments apply to the other dev_warn calls in evergreen_cs.c. Their conditions can be controlled by user space, so they must not generate any dmesg output by default.


> And if those messages are only for developers, they better be not visible by
> default but behind a CONFIG_DEBUG or a similar switch.

Hence my suggestion to use a dbg variant, which isn't visible by default but can be enabled (and disabled again) at runtime.


> And developers don't have every hw to test on. So you need to rely on users to
> report issues to you. Because those messages probably don't fire on your hw
> but someone else would hit them. And the chances are high that someone else is
> a user.

Then the developer needs to tell the user how to enable the debugging output and get it to them. That's pretty standard.


>> (which will notice and report the corresponding user-space issues instead).
> 
> The case due to which we're having this conversation didn't manifest itself
> into anything - it was only flooding my dmesg.

The message is logged if the kernel needs to fix up invalid data passed in by user space. That may have had no noticeable effect in your case, it certainly could in other cases though.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
