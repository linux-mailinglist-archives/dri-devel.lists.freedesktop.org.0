Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCEDB4967B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 19:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0094910E578;
	Mon,  8 Sep 2025 17:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="eezS7r1T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B1010E578;
 Mon,  8 Sep 2025 17:05:28 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cLCxw5bDjz9tHG;
 Mon,  8 Sep 2025 19:05:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757351124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s4nGyVlamX2EE0TinZz3gA/op6zky2srhucm+tgjcQM=;
 b=eezS7r1T7PDGqAn4aSGdOOyvTCevAyh2aPjHJMJiwdK3/K+0p55eqPUwhTQ3naczIGieJ8
 tZNtgynmF8BmGh+NdhX09SxcydzTFv6KNyGmGXOj/CX8qUKQEu7I9jaX+sRNVadrWg2nQL
 aJQ6DOEpG8mgLWxxt9LkOwW+1zYqWjp0pS7Cg81tr39q/kYYqhcHtSVM5+MC6tDUP8lWkD
 O6KdFmy6ROc93CHft/0GAhMFps+NqmaK01ubjdGLCLbUSO2qKqwknpz4AldhMcPloPDupN
 8GfshxSQlKAiY+eNxRLgrjWny7pqLiZnlLGoyK8INQ8h80vS56+XmZK8uoBI/A==
Message-ID: <2764782f-d411-4142-aa56-f1af0968ecd5@mailbox.org>
Date: Mon, 8 Sep 2025 19:05:17 +0200
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
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <20250901101011.GAaLVxA_Ax0R-Wy2IX@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: da7f573e369603a1316
X-MBO-RS-META: wtpeb1ieommtoi1qaank9ug6rrqq7sfg
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

On 01.09.25 12:10, Borislav Petkov wrote:
> On Mon, Sep 01, 2025 at 11:27:01AM +0200, Michel Dänzer wrote:
>> use some kind of debug output API which doesn't hit dmesg by default
> 
> You still want to be enabled by default so that normal users can see it and
> actually report it.

These messages are primarily intended for developers, not users (which will notice and report the corresponding user-space issues instead).


>> (can be a non-once variant instead, that's more useful for user-space
>> developers).
> 
> I don't see how a non-once variant can tell you anything new - it is repeating
> one cryptic message to most users so what's the point of parroting it more
> than once?

The once variant means user-space developers need to reboot after hitting it once.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
