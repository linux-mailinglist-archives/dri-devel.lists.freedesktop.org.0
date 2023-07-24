Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2601875F3BF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 12:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D1710E002;
	Mon, 24 Jul 2023 10:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E650C10E002;
 Mon, 24 Jul 2023 10:47:02 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4R8cKv30xJz9t3y;
 Mon, 24 Jul 2023 12:46:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1690195619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QRgDsdj4PRaBX4F+5NuwghTRwQQTxR0MoJRVxO8TmDM=;
 b=hJZVWzSGSd27nZkk+77PknK0vznvbxJ0/csknIDZKtbuqocbGowTgvDTRp5kHwHq8VTNcN
 sI6IlW31o4Bg7agxOLgIQv1FsKLi00x1uQSyGLFRClbvZZ6TctRU4GzTt+AYihA62RE90E
 8XoFTkdBXcRTITTVEEo8fa6PVq1Ug8zpqfzpnl4s/ZNyaV3lsfbncy16bsE0CGkN8y/xRp
 GPdV0do0y4x+rT3b8fXqrISxwuL1j7sA3ewktGWABKEQxBdgD5hkQ/O0FQr2vlP/cI//4b
 pRZHonfpIKk3994LbXC9WTO5Jtz06jIpRC5JGawPh2npyTY2EwJKBdM6nJ6F4A==
Message-ID: <a31d3d49-1861-19a2-2bb4-8793c8eabee9@mailbox.org>
Date: Mon, 24 Jul 2023 12:46:56 +0200
MIME-Version: 1.0
Subject: Re: [PATCH AUTOSEL 6.1 28/41] Revert "drm/amd/display: Do not set drr
 on pipe commit"
Content-Language: en-CA
To: Sasha Levin <sashal@kernel.org>
References: <20230724012118.2316073-1-sashal@kernel.org>
 <20230724012118.2316073-28-sashal@kernel.org>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <20230724012118.2316073-28-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 324e36e7dfef5be2138
X-MBO-RS-META: ugp96btdxp5iatie16dfbs8fg661iw7g
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
Cc: Wesley.Chalmers@amd.com, sunpeng.li@amd.com, qingqing.zhuo@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com, airlied@linux.ie,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Dmytro.Laktyushkin@amd.com,
 amd-gfx@lists.freedesktop.org, wayne.lin@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, stable@vger.kernel.org,
 hugo.hu@amd.com, Hamza Mahfooz <hamza.mahfooz@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/24/23 03:21, Sasha Levin wrote:
> From: Michel Dänzer <mdaenzer@redhat.com>
> 
> [ Upstream commit 8e1b45c578b799510f9a01a9745a737e74f43cb1 ]
> 
> This reverts commit 474f01015ffdb74e01c2eb3584a2822c64e7b2be.

The reverted commit is the same as patch 1 in this series...

Same issue with the autosel patches for 6.4.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

