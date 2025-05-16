Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8600EAB9F3A
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 17:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDA910EAFF;
	Fri, 16 May 2025 15:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="gE8AicAt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F03310EAFC;
 Fri, 16 May 2025 15:02:53 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZzVgY6tY2z9sp5;
 Fri, 16 May 2025 17:02:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1747407770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RIDO3oVnldJayGm/2eNWvs3elXTQtF0sU6jz8f532EQ=;
 b=gE8AicAtcnnkNx/Jz95Ho681LZDefdIFhDi+JZTYdFlGgn5dsS7Hj7lG9bN3EQoTdPdJpe
 /IwxUn0125vR3/p4AhHpxeBbpMCvNhO2IUnC7TwGHrXeSo+QpED974G3I0RJPFsfNgJA/5
 0ZTWsGy/3tX5GrP3fQIGBj22Pq2CLkEd3Kq1YBrMmQ88cNm/w5iJ70ApyOyREAdS3IZSEK
 wVzd8dlEn1oo3SxvdLOTwF3WDhKhCOrtC4zVYE3laehSAX82XeAHkP6ftKkmvrc3+kwQBv
 fCjlLSVvSRmR8GPYe7cwy3HTMSZGUi3XstqUGI1q+SmjALSFpsZi3PiEwiDZtg==
Message-ID: <ba97cecf-d820-4ae7-98ae-2cf57db228fb@mailbox.org>
Date: Fri, 16 May 2025 17:02:47 +0200
MIME-Version: 1.0
Subject: Re: Kernels >= 6.3 disable video output
To: Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>, Steven J Abner <pheonix.sja@att.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <6DWYVS.BXJ4YUZ0KN5B3.ref@att.net> <6DWYVS.BXJ4YUZ0KN5B3@att.net>
 <CADnq5_Pk41iOvibFSjt7+Wjj=FXWR--XMt+OCqmkWWveLfU_ig@mail.gmail.com>
 <GXXZVS.Q1GIIU1M9VBL1@att.net>
 <CADnq5_NvoPfgTxOxjBCc-iGR7k8w7oR7VKkXQtWga8VP7vBViQ@mail.gmail.com>
 <1Q10WS.BHBZBX486I3M2@att.net> <EWZ5WS.K2DTZM5DEZCL2@att.net>
 <CADnq5_PbeZCPD7WWO0i5HSVMepka7Ao6byfkx3zHkiBfg4amwg@mail.gmail.com>
 <OY8BWS.OAO65CCC74TY1@att.net>
 <CADnq5_NqAQPO1NRbzQJzR+tZnOSqrhTmZj4z-B54X-hRxo3b4w@mail.gmail.com>
 <df6872b3-1048-416b-82d7-63f732cb6b4d@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <df6872b3-1048-416b-82d7-63f732cb6b4d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e2c69a454b74a523c61
X-MBO-RS-META: 1y8pf99hm13nhgxj733fsu3dm9ouxhdd
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

On 2025-05-15 19:59, Harry Wentland wrote:
> Hi Steven,
> 
> thanks for the bisect.
> 
> In order to avoid display artifacts (especially for HDR) we had to
> allow higher bit depth color output on the wire. The driver should
> fallback to a lower resolution as needed but looks like there's a
> bug with this particular TV. Are you able to share the specific
> TV model? We haven't seen this bug in internal testing but if we
> know which device shows the issue we might be able to find one
> for testing.
> 
> It would probably be good if we had a module parameter to force
> limit the output bpc in order to unblock users (like you) that see
> issues.
FWIW, with GNOME the "max bpc" property value can be set per monitor in the ~/.config/monitors.xml file. Other DEs might have something similar (with Xorg, it should even be possible to set it with xrandr).


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
