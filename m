Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10967A41D91
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 12:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B76910E391;
	Mon, 24 Feb 2025 11:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="Vx+OKc8d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 449 seconds by postgrey-1.36 at gabe;
 Sun, 23 Feb 2025 01:27:58 UTC
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C393210E03F
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 01:27:58 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 7C9A725BD1;
 Sun, 23 Feb 2025 02:20:27 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n66v7EwL05kj; Sun, 23 Feb 2025 02:20:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1740273623; bh=x219kO9/TY6esmGdDOm2ZSMAJh5cKoy0bTXUTRMdpi0=;
 h=Date:From:Subject:To:Cc;
 b=Vx+OKc8dTwitGMgNarf5gOllSDkihJeUlTgc3HO/QKGcsNXRrS04qi96TZGFVyT93
 14y9TgCkMxyLrC/SO5gxq1nY/Q27ijzQbk9ciM87nWuj9TPXIoIsWUAY1Ag70ogI9f
 SEfhiLoM8y+xV9Jec9/69NM1DuuB1+2PGRqmhQP47wg3uJezPxfptUbzXxcnliVpUa
 FWoI4x+8Cye7GAaZbhcCFYaYpWUs8SnXImgwLL4AsKUj0rnuaN6N1b4jh7hsZFilI8
 5cca66mjpsMcBOuQ18bvtSJR3Brs9FOihnEqIK1u6+aXlvKNTsHNifAfEz9xkH8r99
 /1qrY94yOYx0g==
Message-ID: <bfd2258b-9bbe-42e6-89aa-1bd77a58983b@disroot.org>
Date: Sun, 23 Feb 2025 02:20:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: NoisyCoil <noisycoil@disroot.org>
Subject: Please backport "drm: select DRM_KMS_HELPER from
 DRM_GEM_SHMEM_HELPER" to 6.13.x
To: stable@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 24 Feb 2025 11:51:02 +0000
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

Hello.

The build (actually, linking) failure described in [1] affects current 
stable (6.13.4). Could the commit that fixes it in mainline, namely, 
c40ca9ef7c5c9bbb0d2f7774c87417cc4f1713bf ("drm: select DRM_KMS_HELPER 
from DRM_GEM_SHMEM_HELPER") be backported to 6.13.x, please?

Thank you.


[1] 
https://lore.kernel.org/all/20250121-greedy-flounder-of-abundance-4d2ee8-mkl@pengutronix.de/
