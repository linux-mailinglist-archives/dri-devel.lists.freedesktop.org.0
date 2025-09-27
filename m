Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6CFBA5B9A
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 10:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C226B10E180;
	Sat, 27 Sep 2025 08:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="MvPFTkSA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128AB10E180
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 08:51:16 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cYh4x4YY7z9tN7;
 Sat, 27 Sep 2025 10:51:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758963073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eHEGtUp6HlJTQppi1F7t2MLuqfkDw8zddrEibIWOy2E=;
 b=MvPFTkSAuNXfAh5T3jIu+C53qs7lyPSKAAY49jLirJ6B8DdhdW0QqcJXivZi73D1vD/LW1
 xDUc5gdio5nNsphOGCyJJiETOUunJI+aSMA7DHpneXgsOqeKuisLF3mFb+uUIizh7/g7L8
 ubgOoMr0jqHlaMrQ8SLIy8sxzi8wWRBSbMQYwVRB08CdcEjjG8bhcjx+lUsAu7CED1reHe
 p40kAKHtBCa3HOQztcM4XCK1K+zH+dOtf3up4RhcCqtw17tU645F/Wps/Ta01uKpEFZKI0
 miLGusKaCAc9EiOGjp0mXLlvKm6dorMq389yWutF6LzR1B/ywEOaSHLPNllTvw==
Message-ID: <e3e525e1-d803-4e49-9740-9ef33dcf3f4a@mailbox.org>
Date: Sat, 27 Sep 2025 10:51:11 +0200
MIME-Version: 1.0
Subject: Re: [RFC PATCH] drm/uapi: Indroduce a VRR Range Control Interface
To: Xaver Hugl <xaver.hugl@gmail.com>, Leo Li <sunpeng.li@amd.com>
Cc: Derek Foreman <derek.foreman@collabora.com>,
 Chuanyu Tseng <Chuanyu.Tseng@amd.com>, harry.wentland@amd.com,
 Mario.Limonciello@amd.com, victoria@system76.com, seanpaul@google.com,
 dri-devel@lists.freedesktop.org
References: <20250912073305.209777-1-Chuanyu.Tseng@amd.com>
 <010201993e2cb26f-089ce007-9e30-4b79-b487-c16c360309fd-000000@eu-west-1.amazonses.com>
 <d8694d69-62b3-4418-9fcb-d37c1daa1f9f@mailbox.org>
 <58a6e042-1890-4d1c-88cc-29f500b0a407@mailbox.org>
 <1b09ec41-0f82-49c2-9adf-66f4fd537b9f@amd.com>
 <CAFZQkGx-OFbfFyV3-bB4ufOMSMtSAXd=E4Vkgg5sQjEe=wbRWw@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <CAFZQkGx-OFbfFyV3-bB4ufOMSMtSAXd=E4Vkgg5sQjEe=wbRWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: de9260811ecea805e01
X-MBO-RS-META: beu5766yowr6c6356ecottyg8x6ye6pb
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

On 26.09.25 16:19, Xaver Hugl wrote:
>> 2) Kernel does LFC/ramping
> 
> I don't think that would be a good idea. The kernel doing ramping
> would mean the user can't (easily) configure it, and it would
> complicate the compositor doing ramping with a different strategy
> (like reducing the allowed change at lower refresh rates).

What exactly would that mean when the min & max values differ though? If the kernel wants to change the refresh rate, it must not do any ramping but must switch to the new refresh rate immediately? That seems a bit weird as well.

If the compositor doesn't want the kernel to do any ramping, it can set min == max always.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
