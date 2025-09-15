Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CB7B58136
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 17:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B6C10E4F8;
	Mon, 15 Sep 2025 15:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="uOlOVn7j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846CD10E507
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 15:49:23 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cQTww1BvMz9tG0;
 Mon, 15 Sep 2025 17:49:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757951360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QOIWkI4QOQ9j8Iws5jNxL21N1foSCJpJfBzhdvqjZqs=;
 b=uOlOVn7jMOk+194QE3PIcHI7U+cBs2WMuta4W4UFwfIRlOftzF6QtNhyYdZcszzBXM2u+i
 zg6e7uaa0Xi0EJWY3E6vSWCOj9j1LKwAKFxy7+qRQuj/Dw1N1YASPYQSZaPfW5PnlW/EKK
 wW++I7868cisOk74l8oc9EpgGuX+PFYQXyXmz5rLAifBJwSP9AmCs3nc3/mI2F+Z2qnTtM
 QdEup/dFEAVkr/JQNtdHAwTCZTp2WiglCx/KTrxFQ5HQccaZ2wCw1RTFBSjEAyvcj6tCD8
 M+CuWnxliPFoVdN7Mhw11A15CXU/0BllAEMhvgLmB89raVmhNAVwQEHh+jJlUQ==
Message-ID: <d52ec8d7-cc5e-4801-bc04-096504a131b7@mailbox.org>
Date: Mon, 15 Sep 2025 17:49:17 +0200
MIME-Version: 1.0
Subject: Re: [RFC PATCH] drm/uapi: Indroduce a VRR Range Control Interface
To: Derek Foreman <derek.foreman@collabora.com>,
 Chuanyu Tseng <Chuanyu.Tseng@amd.com>
Cc: harry.wentland@amd.com, Mario.Limonciello@amd.com, xaver.hugl@gmail.com,
 victoria@system76.com, seanpaul@google.com, Sunpeng.Li@amd.com,
 dri-devel@lists.freedesktop.org
References: <20250912073305.209777-1-Chuanyu.Tseng@amd.com>
 <010201993e2cb26f-089ce007-9e30-4b79-b487-c16c360309fd-000000@eu-west-1.amazonses.com>
 <d8694d69-62b3-4418-9fcb-d37c1daa1f9f@mailbox.org>
 <010201994e05ce63-85ad5afd-fc09-48fc-bd6e-f3716c8ba09f-000000@eu-west-1.amazonses.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <010201994e05ce63-85ad5afd-fc09-48fc-bd6e-f3716c8ba09f-000000@eu-west-1.amazonses.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 5a78c802f17117ac464
X-MBO-RS-META: 9oqpaduyzwarapacafe74xdd19g1neth
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

On 15.09.25 17:37, Derek Foreman wrote:
> On 9/15/25 5:01 AM, Michel Dänzer wrote:
>> On 12.09.25 15:45, Derek Foreman wrote:
>>> On 9/12/25 2:33 AM, Chuanyu Tseng wrote:
>>>> Introduce a DRM interface for DRM clients to further restrict the
>>>> VRR Range within the panel supported VRR range on a per-commit
>>>> basis.
>>>>
>>>> The goal is to give DRM client the ability to do frame-doubling/
>>>> ramping themselves, or to set lower static refresh rates for power
>>>> savings.
>>> I'm interested in limiting the range of VRR to enable HDMI's QMS/CinemaVRR features - ie: switching to a fixed rate for media playback without incurring screen blackouts/resyncs/"bonks" during the switch.
>>>
>>> I could see using an interface such as this to do the frame rate limiting, by setting the lower and upper bounds both to a media file's framerate. However for that use case it's not precise enough, as video may have a rate like 23.9760239... FPS.
>>>
>>> Would it be better to expose the limits as a numerator/denominator pair so a rate can be something like 24000/1001fps?
>> I was thinking the properties could allow directly specifying the minimum and maximum number of total scanlines per refresh cycle, based on the assumption the driver needs to program something along those lines.
> 
> Surprisingly, this would also not be precise enough for exact media playback, as the exact intended framerate might not result in an integer number of scan lines. When that happens a QMS/CinemaVRR capable HDMI source is expected to periodically post a frame with a single extra scan line to minimize the error.

Interesting, maybe your suggestion of numerator / denominator properties is better then.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
