Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9AAC7BAB7
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 21:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442C310E901;
	Fri, 21 Nov 2025 20:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="LJy75apl";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rvVOlvHQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE16610E8FE;
 Fri, 21 Nov 2025 20:47:58 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dCnNY2R6Fz9tk6;
 Fri, 21 Nov 2025 21:47:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1763758077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aXOOBN/mtrVW7iMQyoQs66Vn5MH2mHNE5SZoKSUOyHk=;
 b=LJy75apl2bZyBU4k3+WVw/wmjrngxNROvNbFhK8C6iJgSAaClhwHvj/ZhYHQcQCuiSc3qw
 IN/eNWnGZhHAPtWCE89vZO8NN1aZ3GMy+cv5Ztbq2EKSBJOWSPKREI1IcOq49tyeTGbkvT
 kDLloXYXHM8PVZgv4hXB+/a3tXNoZfiT6bPBsv0kz1+9Ag2aJhnfB42Ke6vE/htisdAKz0
 Nh4FBI4AEuOrUMsd24VOc4peNWIjF8fjfuNdNexR3NpjMTM/t9JFzYaEkB5YjufAt6pDjb
 sOD2rOiA6uiydqp79mSJPnf7hvXJ4VnDou43+ulzDHL/rYntXTghRs4jjYNzpw==
Message-ID: <b307fa5c-ccce-4f4b-bc38-a69c6b9d6095@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1763758075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aXOOBN/mtrVW7iMQyoQs66Vn5MH2mHNE5SZoKSUOyHk=;
 b=rvVOlvHQMGL0Wa+gmPeaNsWZzNBJHWKRBKbga3KKR1z2CRkrjvmjWxbHzNOGP63b4AWLDx
 8LNN491iTEuV3Q4xMNm9AqN54FAKMRtWVBgZ2Nu1bB5SeUD0A2mk4wvd2NWkqhxIAhPRjr
 troZRGlu6IkKe5yi5IEVugc2Cu3mj4V/Qum9Gi2FtbVx/7lft7CVxzQRtR1XJkobyalmvX
 qlWKfX+95GiI0dOVa2jvfDrWaPMJAf5+EVyKVhVaNIduoT1aq6ZdtANtDLxrMPROJP1ApF
 V2grGH1JZK+5Rbo4rBN8m0lERDUDWrOlLgx3Xih36XSYlxs7AoemzfGHeh9h+Q==
Date: Fri, 21 Nov 2025 21:47:52 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/5] drm/etnaviv: Add support for running a PPU flop
 reset
To: gert.wollny@collabora.com, Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel <kernel@dh-electronics.com>
References: <20251110144625.18653-1-gert.wollny@collabora.com>
 <20251119164624.9297-1-gert.wollny@collabora.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251119164624.9297-1-gert.wollny@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: t3zykkgqxaswffweziacn9chbuyk15q3
X-MBO-RS-ID: 6e78ed1c7b9b66b2922
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

On 11/19/25 5:45 PM, gert.wollny@collabora.com wrote:

Hello Gert,

> this is the fifth version of the series to add PPU flop reset.
> 
> Changes w.r.t. the previous version are:
> 
>    * Apply all changes suggested by Christian Gmeiner:
>     - fix a memory leak that would occure when PPU data
>       initialization fails
>     - remove unneeded includes
>     - move includes to the files where they are actuall needed
>     - fix include style for "linux" headers
>     - fix typo in error message
> 
>    * add Reviewed-by tags to the according commits
For the whole series:

Tested-by: Marek Vasut <marek.vasut@mailbox.org> # STM32MP255C DHCOS DHSBC

Thank you !
