Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CEE9D84A4
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 12:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A93E10E616;
	Mon, 25 Nov 2024 11:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="TeBz95p6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 354 seconds by postgrey-1.36 at gabe;
 Mon, 25 Nov 2024 11:41:03 UTC
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA37910E616
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 11:41:03 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4XxkCF5Dtgz9sZP;
 Mon, 25 Nov 2024 12:35:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1732534505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7iJeUKBPm/FEIhTBZ51JqJOYigpfXL5/NXhpGKBiNNc=;
 b=TeBz95p6cf7Ct6vYtjTYoNNTt0mFiiExDSGKJQ1D6rkpLEjeZpbqJkUEZzcYDWQb809e7M
 fre9lO4RTINwKTPv1YHNi31zg0tMDZIHgJbOW5883ympi32P/WUtU+qis3haLMXaZTigEk
 9995aOZDR3l/vdFSc5OKxnlenPaT2grlIMyXfiZ7ovPV+rc2x6c+8lXNqfAW/lTC1IbEz7
 EaOtrHJokKEKRErtd30tnfvB/eshZOyQYSu9K1Fo5ioqFoNWVc7pw/Ep54UqOCsLJynt0X
 xDmPm8TCje9fyXLATTsGkcc6M1Mp8WyoqJHHevAUSmgofXYoWuL2LF7WnKqThQ==
Message-ID: <b3a64de3-353c-4214-a876-f44d3f1de07b@mailbox.org>
Date: Mon, 25 Nov 2024 12:35:04 +0100
MIME-Version: 1.0
Subject: Re: [PATCH AUTOSEL 6.12 079/107] Revert "drm/amd/display: Block UHBR
 Based On USB-C PD Cable ID"
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20241124133301.3341829-1-sashal@kernel.org>
 <20241124133301.3341829-79-sashal@kernel.org>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <20241124133301.3341829-79-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 7748cd16edbb6a14f78
X-MBO-RS-META: 49edaesm5ea51jryu1wbphehxgxtgeya
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

On 2024-11-24 14:29, Sasha Levin wrote:
> From: Ausef Yousof <Ausef.Yousof@amd.com>
> 
> [ Upstream commit d7b86a002cf7e1b55ec311c11264f70d079860b9 ]
> 
> This reverts commit 4f01a68751194d05280d659a65758c09e4af04d6.

Which was patch 16 in this series...


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
