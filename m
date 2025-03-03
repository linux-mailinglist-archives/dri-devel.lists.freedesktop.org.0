Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A1FA4B882
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 08:48:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A2110E0A4;
	Mon,  3 Mar 2025 07:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q3y/umGI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4078F10E0A4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 07:48:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 92CE3611CB;
 Mon,  3 Mar 2025 07:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D400C4CED6;
 Mon,  3 Mar 2025 07:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740988085;
 bh=4gaI9687yuFdGWUMAt8g+lkT6YXzTDhCa31bc/t4MhQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Q3y/umGI9QLdtcmAnvS8TC8XoNl9SbYnRJzDb0HMOz5VNQ0r96k5MMviUBA8NGJo6
 yaZNAgx7zT2zJwWUXB00VevFHUrIl37pqL2NLvAUAOdrA+99H8bGu9fn1basm04Jc2
 QQlDfWZyggLatMQTp0v+RZlqW285Ulckephxd5+CH437LKosj9xeZg8b4lHHK10kB8
 JmxslGQd4zK7UNc/P5u3UQEmNUGUVEfUSaJTtqsdT6mo/2Uu0s4pu8drMv7ugtoICh
 N73NibUGzyFVGPa4mkBO2M3zn2wggZXDUuxOBCavMyKbkeM0LSvw/gNuJCUFJTIj+o
 tXFjtqazLB3aA==
Date: Mon, 3 Mar 2025 08:48:03 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [PATCH 4/5] HID: Add quirk to ignore the touchscreen battery on
 OneXPlayer X1
In-Reply-To: <20250222164321.181340-5-lkml@antheas.dev>
Message-ID: <124553q7-8370-s74s-so88-079q2469orn9@xreary.bet>
References: <20250222164321.181340-1-lkml@antheas.dev>
 <20250222164321.181340-5-lkml@antheas.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Sat, 22 Feb 2025, Antheas Kapenekakis wrote:

> The X1 devices come with a pen-capable touchscreen, in which the HID
> descriptor reports there is always a battery at 100% charge. Quirk it
> to not report the battery status.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>

Let me provide

	Acked-by: Jiri Kosina <jkosina@suse.com>

so that this patch can be merged by the drm folks together with the rest 
of the enablement series.

Thanks,

-- 
Jiri Kosina
SUSE Labs

