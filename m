Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E456B510BD
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 10:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9439610E898;
	Wed, 10 Sep 2025 08:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="bMYmS2Kd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9636110E184;
 Wed, 10 Sep 2025 08:12:22 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cMD1v1kJfz9t4r;
 Wed, 10 Sep 2025 10:12:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757491939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PPU1gnuOMTGg9FkDyjniyY5pLjGLZv6fX6GCHXIwK70=;
 b=bMYmS2Kdr2emLC7seKLyBbqkP++utFB7nXCzcbvNeVLNBxZvNbFK0S0LotGPzGI7fL5J2q
 kV0rq6MHv92XcKeFdwPt8dsO+FJw7eozHOYkrosHCl343cLCDY5s8dWnqLR+gceb4ff9CA
 EQwj/lVntuXPvPKJtgSCSIudfZzzz+wMO3wr/w/acwgllc09J9chSok4t7pCuJFp6kR3pL
 Eq7y/G1EIDbZHZyPUh4SQSD32Zkyo9Xj57YNk1LXtxl2TbRQops/aRXPWaljrM1GdWyMsR
 YBUg32Rr1Gi6EDf+hSvrq6BqMpGJVUvjNnsPGyD5QWxmo0Ys1euUIcoG3+b8aw==
Message-ID: <0671680b-842f-4771-ade5-2485c9a91356@mailbox.org>
Date: Wed, 10 Sep 2025 10:12:16 +0200
MIME-Version: 1.0
Subject: Re: evergreen_packet3_check:... radeon 0000:1d:00.0: vbo resource
 seems too big for the bo
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>, Borislav Petkov <bp@alien8.de>
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <CADnq5_Oqonrth+5T-83dnFBZ67GvykkPt-9aUepJd+fUMwnupw@mail.gmail.com>
 <20250829194044.GCaLICPKJcGJRYdSfO@fat_crate.local>
 <20250829204840.GEaLISKGTwuScnDF8Y@fat_crate.local>
 <CADnq5_MbpYmC2PSyOr0gQk7F8mVz0-LG3dZtUZS2HhV8LTgDww@mail.gmail.com>
 <20250830174810.GAaLM5WkiFc2BtQ6kW@fat_crate.local>
 <51ae551b-6708-4fcd-84f9-fc1400f02427@mailbox.org>
 <20250901101011.GAaLVxA_Ax0R-Wy2IX@fat_crate.local>
 <2764782f-d411-4142-aa56-f1af0968ecd5@mailbox.org>
 <20250908180022.GHaL8Zto-PsVsPa0e0@fat_crate.local>
 <63b7c020-e589-4644-887e-3922af939009@mailbox.org>
 <20250909161648.GAaMBS8ERsvv3NbJoF@fat_crate.local>
 <CADnq5_MOazXJ4tUNa5uMdkWY7ZCu70M49yG00JsNHB-FO7XNvA@mail.gmail.com>
 <45c973ea-22b5-4df2-8b34-a64d48cdecb2@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <45c973ea-22b5-4df2-8b34-a64d48cdecb2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e72a39f9b2a02435d57
X-MBO-RS-META: fnhwu5eyhh1rqp7fb9izdhffnppc7xe4
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

On 10.09.25 10:02, Christian König wrote:
> On 09.09.25 18:21, Alex Deucher wrote:
>> On Tue, Sep 9, 2025 at 12:17 PM Borislav Petkov <bp@alien8.de> wrote:
>>>
>>> On Tue, Sep 09, 2025 at 10:43:47AM +0200, Michel Dänzer wrote:
>>>> Then the developer needs to tell the user how to enable the debugging output
>>>> and get it to them. That's pretty standard.
>>>
>>> *IF* the user even notices anything. As said earlier, it didn't cause any
>>> anomalies on my machine besides flooding dmesg. Which I look at for obvious
>>> reasons but users probably don't.
>>
>> Right.  I think there needs to be something otherwise no one will notice at all.
> 
> Well doesn't the cause of the warning result in corrupted rendering?

Per https://gitlab.freedesktop.org/mesa/mesa/-/issues/13838#note_3088335 it would result in one dropped vertex, which might be hard to notice. That's why I agree that in this specific case, not logging anything by default might have resulted in the issue taking much longer to be discovered (if ever).

(A potential counter argument being: If it's not noticeable, does the kernel need to log anything about it by default?)


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
