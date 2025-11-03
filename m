Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F4225C2BBE8
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 13:41:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A7B10E3C8;
	Mon,  3 Nov 2025 12:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="i140ABhj";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="w/beTkws";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76E310E3CA
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 12:41:44 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d0WRq29Wjz9tDy;
 Mon,  3 Nov 2025 13:41:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762173703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/2H1aGiNw5Da4wq5CBM5AFBjI+wBcWi8K6i1q6sCyMs=;
 b=i140ABhjZLKRRqPndBGIzrA6VLBXnugMJJzCqRSYnzLYje8xijskLVNv3lcrwzO94kfRXz
 xMv7V4cOZms0rRij8mf6janBijqUiBs9QqRJp6Op/PhT3ef2uu9QHrT7d3POUSjlaRAZUF
 bUIarCmzSS/GXv6tZ9x5x8JupfmKd7/w+rukbNxzkakd/y7ZVDsWSD9eqjEtq/h3H5jAXR
 RntUqMfvAJR9lTvbLlx+KHz1NcKFjx2TZ5oQHps374xeAhhlqflC08lL5y+lpqSxFmpA/D
 MIjveAS1ar+RHvsfZR2nOcLSDjYPpNwtnKmJDXjm1/ROi5r7DKhEVkum3m15uQ==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="w/beTkws";
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <6281df4d-0389-42a8-8a40-cd5d09c591db@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762173701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/2H1aGiNw5Da4wq5CBM5AFBjI+wBcWi8K6i1q6sCyMs=;
 b=w/beTkwsE9BzGglNX4zJXmqfPgbBl35GICQDilWTMpnb4nMnJqCyyI2hrv2ISg9sGcgqhg
 KGM7D6M9FTRIlCB1d1sjZcbMHZHoNtrGrzaHo4/azgX7wFxpz4nk4NdXL7m2g2coyAPjBX
 bGAVzzIN2ciwXv6NO6Kry4GJSjC3j8mP1bERyh/a4mLEZ7mre7N2mO3k488g/kwttPuzj+
 3GTuSryJvqN6RJDR60H7GGnKSZ5ioPHMKIRtBlWnkTcLUoN+MpyzeobtOv26+9XSy+n6eL
 DfDtF1qbU5zSbCYOZPKjcrJrnehysVgC8eVT5S0U/sAfDqbKSPYtyCDMaD4wnQ==
Date: Mon, 3 Nov 2025 13:41:37 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/imagination: Depend on power sequencing
To: Matt Coster <Matt.Coster@imgtec.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251102184158.264378-1-marek.vasut+renesas@mailbox.org>
 <b9625d6d-93bf-4c33-a20b-044e680f81af@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <b9625d6d-93bf-4c33-a20b-044e680f81af@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: b5d90a5daf3f635d002
X-MBO-RS-META: yyjzhofw6o361swna9gdd98nzt4upgm5
X-Rspamd-Queue-Id: 4d0WRq29Wjz9tDy
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

On 11/3/25 11:36 AM, Matt Coster wrote:

Hello Matt,

> On 02/11/2025 18:41, Marek Vasut wrote:
>> Since commit e38e8391f30b ("drm/imagination: Use pwrseq for TH1520 GPU
>> power management"), the driver calls power sequencing functions. Add
>> missing dependency on POWER_SEQUENCING, otherwise the kernel may fail
>> to build if the driver is built-in and POWER_SEQUENCING is a module
>> with these linker errors:
>>
>> aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
>> aarch64-linux-gnu-ld: drivers/gpu/drm/imagination/pvr_power.o: in function `pvr_power_off_sequence_pwrseq':
>> pvr_power.c:(.text+0x70): undefined reference to `pwrseq_power_off'
>> aarch64-linux-gnu-ld: drivers/gpu/drm/imagination/pvr_power.o: in function `pvr_power_on_sequence_pwrseq':
>> pvr_power.c:(.text+0x88): undefined reference to `pwrseq_power_on'
>> aarch64-linux-gnu-ld: drivers/gpu/drm/imagination/pvr_power.o: in function `pvr_power_init_pwrseq':
>> pvr_power.c:(.text+0xb4): undefined reference to `devm_pwrseq_get'
> 
> Thanks for the fix! I did send a similar patch[1] last month in response
> to a test bot report[2], but it slipped my mind to chase an Rb for it so
> it's never been applied.
> 
> Do you mind if I take the earlier patch instead of this one, since it
> doesn't add a hard dependency on POWER_SEQUENCING?
Either fix is fine by me, thank you.
