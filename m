Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FE7A1CCAE
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 17:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9060710E1F4;
	Sun, 26 Jan 2025 16:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="sr0KJfn3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0357710E1F4
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 16:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1737909500; x=1738514300; i=friedrich.vock@gmx.de;
 bh=+uNvDFJsbol9zWzOErJjvH+WZqG+4taeD/WTOcbIM10=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=sr0KJfn36XmYCdUTDR3zjUNDqdlp9lprWELaGV69OxtZF4m0L2quBPpjitx5kbQc
 /D7pakqMTdWRCF0QuIaED06ebbraNQ0hkZzIoUYTcQGJPicAbr5ZWkUP7NtBNqcOG
 8AD0sBrrj5cmRXWNwxBKafzrRRrbOzGhqohyfWTDlZ6rve3l1Y1DFtWoNCh1GJZvH
 SFFs8tTysH5KzBOxO2xWm4T2+fDoiQgCstG3bC1m0KdBDvL8UD5iekrKZG+2hIJ9e
 EyyzVx4NuHWaSxsm/vFfHxD2XZnAIQpKGzM2K9HRDVAxsgxj/F4Rmjy6zcSEATG+2
 RnNOQFx5coRcEKzZng==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.53] ([77.179.97.224]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Msq24-1tMlee0bPc-016EUs; Sun, 26
 Jan 2025 17:38:20 +0100
Message-ID: <2a5c5c05-1d54-4b23-898b-ab4ef96fa61c@gmx.de>
Date: Sun, 26 Jan 2025 17:38:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cgroup/dmem: Don't clobber pool in
 dmem_cgroup_calculate_protection
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, cgroups@vger.kernel.org
References: <20250114153912.278909-1-friedrich.vock@gmx.de>
 <ijjhmxsu5l7nvabyorzqxd5b5xml7eantom4wtgdwqeq7bmy73@cz7doxxi57ig>
 <4d6ccc9a-3db9-4d5b-87c9-267b659c2a1b@gmx.de>
 <oe3qgfb3jfzoacfh7efpvmuosravx5kra3ss67zqem6rbtctws@5dmmklctrg3x>
 <672de60e-5c10-406b-927c-7940d2fbc921@gmx.de>
 <qu3jdiik2sfstey4ecxdojndkzb5gzblg37i76p43xccnotawl@jlbafrgjad2x>
Content-Language: en-US
From: Friedrich Vock <friedrich.vock@gmx.de>
In-Reply-To: <qu3jdiik2sfstey4ecxdojndkzb5gzblg37i76p43xccnotawl@jlbafrgjad2x>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Z1HTYfykAZOaBEjxJ5iDUMZtoZp8JWVvhPUcvWSr5ohjZh0uGaY
 nBeodp3ygmyswdHi592AJvgD+DpivC95NTRYNAwj+L6D5S+RjC8GTISeKREZYx0GjrCjmZC
 k1CwbK7QkNgBSHfkGFWli9iDyHYLD/k+t29m8eUHHJsU09l9pWssRkGFtIwFZtVc+GcHePP
 hFAYuyW+qGhtEFyyOrAqQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:c/iwLNE90WE=;HZs+bHxGEadtRJIte0AXP5+8QZJ
 RuKJCTEWuhUzzWwS/GDd1FVg6UeYYCTMiYbl4Ygx0IVPBJW3MH8T+08wAm/EWbi7rKqWp7XdU
 TZgMsjeMqSitOqCVIX8s/Q9PtQ4hOLWtQo5EbBAs6ynE5W/GyRFXJpqhNudY95dKYxjfueEuz
 iLzZ46TE3Cyy2sjU7GAwb0+vCHgXJenCRVRlVZ7Z9fKs1xUVMH7lIgtTLlVzMq0ccYotJKVXQ
 Rnq028lpSwH1HQ81D4WTFpCt+Q10fYamjr2xE9L0Qa6tTMsHYPhOzfleBMHMcssqQ1Pz69IB6
 +ejGbHlx+RcqupRIcobYCEdvU67QfvKEAPPyBmKDykcMyB8u6/nBRQKt4LeyzOvfXPXwq80kq
 W/oQ1Q/jot6Ltlo9FGf1GSY5NFriJBWOem5wVEpLUfiNLLWRd8/qfHIdsHK/4HBBTJ81cfdC9
 D/z+C0ToSrjYuAGsj5Tgm6uXSX6GfhqX3r2B6wWAfUJ5AlYCywyB/H7Zn8nOcQEneVPej2BOe
 xghpOYSZT0AijcFH7jT9j7/UTe0raf2wJRKZr42tblFthNr2ILs+5lM7npZzkj4SHGtXESGq+
 POwu4qjt2BRF4rQ+cARI04JbMEwlH44eUz2orUgitrFPvM4n8jnmLPgWyG+dSa9XKt4Hp3X5y
 FFMZ/ziP+iQv2bMFfu9G3tYrEO+M+da12BtMtFpQrQoJ5Q0rt3nPItjZCsg7A4fblhlimetjk
 rqRM0PAXuxAc4/jL8KnITmekbs3IYujZ9+juXIkKZ3tBBncqCNmgPKT55RY5EaND6JcGKWDWS
 yZ+AyOYpDbjL7Lc9v+750cPhJDCqStejr2bM3F6860Hs77EvOfm+jmCa/cluQ8ASfKiIBlRqy
 CmlPqYBJJF7w7IHaSvFGBhTq2u1N94py4R16g0s5GPwDFF6d1rjddP9f4M3bfPdCOTu1TFQfK
 TMd0IpL3ZLJUTNPso7qgvAaPyWfd21KeYdgDhpYdwxHwam4bkLnsPBYNo4mAxsAgzhiPxH5ko
 oXFkbSEP4eQ4sHGI0ZtuZMQNYxIFvrmWE0xOpoRljiL+UaMc/RZPUSA+HrUEvdTnM7krmH++p
 qOnbIau4imU6J/C+Kj+byL0JXEaCjkP09uSPP/rlwm06cTCOc2LxEsnZ6yUL1Y7YHQ4esUcvD
 mQf820JT4C63J65kiDx5XNlt69fuNkOpnKV87GP97Nw==
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

On 24.01.25 10:56, Michal Koutn=C3=BD wrote:
> On Fri, Jan 17, 2025 at 08:02:55PM +0100, Friedrich Vock <friedrich.vock=
@gmx.de> wrote:
>> Yeah, there are pools for the whole path between limit_pool and
>> test_pool, but the issue is that we traverse the entire tree of cgroups=
,
>> and we don't always stay on the path between limit_pool and test_pool
>> (because we're iterating from the top down, and we don't know what the
>> path is in that direction - so we just traverse the whole tree until we
>> find test_pool).
>>
>> This means that we'll sometimes end up straying off-path - and there ar=
e
>> no guarantees for which pools are present in the cgroups we visit there=
.
>> These cgroups are the potentially problematic ones where the issue can
>> happen.
>>
>> Ideally we could always stay on the path between limit_pool and
>> test_pool, but this is hardly possible because we can only follow paren=
t
>> links (so bottom-up traversal) but for accurate protection calculation
>> we need to traverse the path top-down.
>
> Aha, thanks for bearing with me.
>
> 	css_foreach_descendant_pre(css, limit_pool->cs->css) {
> 		dmemcg_iter =3D container_of(css, struct dmemcg_state, css);
>
> 		struct dmem_cgroup_pool_state *found_pool =3D NULL;
> 		list_for_each_entry_rcu(pool, &dmemcg_iter->pools, css_node) {
> 			if (pool->region =3D=3D limit_pool->region) {
> 				found_pool =3D pool
> 				break;
> 			}
> 		}
> 		if (!found_pool)
> 			continue;
>
> 		page_counter_calculate_protection(
> 			climit, &found->cnt, true);
> 	}
>
> Here I use (IMO) more idiomatic css_foreach_descendant_pre() instead and
> I use the predicate based on ->region (correct?) to match pool's
> devices.

Good catch with ->region! That works well indeed, I think it might not
have been a thing back when I wrote this tree traversal :>

I've applied this snippet (with a few minor edits) and taken it for a
test run too - it appears to work nicely in practice as well. I'll send
out a v2 with this approach tomorrow.

Thanks,
Friedrich

>
> Would that work as intended?
>
> Michal

