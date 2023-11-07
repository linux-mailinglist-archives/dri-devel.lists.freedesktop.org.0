Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 569037E49FF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 21:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8677110E6A4;
	Tue,  7 Nov 2023 20:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 10796 seconds by postgrey-1.36 at gabe;
 Tue, 07 Nov 2023 20:45:17 UTC
Received: from 2.mo561.mail-out.ovh.net (2.mo561.mail-out.ovh.net
 [46.105.75.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A1510E037
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 20:45:16 +0000 (UTC)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.4.98])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 8941A28CED
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 17:07:16 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-2xd47 (unknown [10.110.171.144])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 97EB71FE72;
 Tue,  7 Nov 2023 17:07:15 +0000 (UTC)
Received: from RCM-web9.webmail.mail.ovh.net ([151.80.29.21])
 by ghost-submission-6684bf9d7b-2xd47 with ESMTPSA
 id XCnmJMNuSmUKdgAAOnoGkA
 (envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 07 Nov 2023 17:07:15 +0000
MIME-Version: 1.0
Date: Tue, 07 Nov 2023 19:07:15 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amd/display: clean up redundant conversions to bool
In-Reply-To: <CADnq5_NpMmo5SdXdStcRMGfcz0v6Nu-ZTORsSHo4_m_piAB77Q@mail.gmail.com>
References: <20231107082839.92061-1-jose.pekkarinen@foxhound.fi>
 <CADnq5_NpMmo5SdXdStcRMGfcz0v6Nu-ZTORsSHo4_m_piAB77Q@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <682272a58c1ddd564271d5828a06947c@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 23.137.251.61
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7981504442826991297
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddujedgtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihoihgtgfesthekjhdttderjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeekhfeguddufeegvdelgedtvdffgeehvddtkeevkeejvedvgeeitdefleehtdeitdenucfkphepuddvjedrtddrtddruddpvdefrddufeejrddvhedurdeiuddpudehuddrkedtrddvledrvddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdpoffvtefjohhsthepmhhoheeiuddpmhhouggvpehsmhhtphhouhht
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
Cc: sunpeng.li@amd.com, Bhawanpreet.Lakha@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 skhan@linuxfoundation.org, alexander.deucher@amd.com, christian.koenig@amd.com,
 linux-kernel-mentees@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-11-07 17:39, Alex Deucher wrote:
> On Tue, Nov 7, 2023 at 4:44 AM José Pekkarinen
> <jose.pekkarinen@foxhound.fi> wrote:
>> 
>> This patch will address the following couple of warnings retrieved by
>> using coccinelle, where there is an explicit conversion to bool that
>> are redundant.
>> 
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c:94:102-107: 
>> WARNING: conversion to bool not needed here
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c:102:72-77: 
>> WARNING: conversion to bool not needed here
>> 
>> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
> 
> Thanks for the patch, but this was already fixed by Srinivasan a while 
> ago.

     My bad for not noticing, sorry!

     Thanks though!

     José.
