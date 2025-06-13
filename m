Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6473AD8C0B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 14:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1F510E1D9;
	Fri, 13 Jun 2025 12:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Phzua/MZ";
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="hkuf7FyK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6438110E0B0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 10:54:24 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bJbqt749Wz9st4;
 Fri, 13 Jun 2025 12:54:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1749812059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N0Kfqegru7jYVQbYJA0pKc1PaRPyLscZ8dgU88no3B0=;
 b=Phzua/MZzd8rJ5dHRZ5/pMcr25SR77Mqp+215l+ViEuUM+dSLXzi2I0LozZYIY9aVSmGmS
 EHfgiOnwaStzIOJGaALwS3+C4I2zNkQFy3lMIdNLKaoI8grl2X0P7MIqGVcKCMU0FgY2T6
 tUInNcnK0wz+4LpxhxOod7cPEwu26E6auB9bprkrw41o+jviM/NxE0m2xRrb3mTKVG9xwg
 KSxkzsWTcRD0f17Erw2G3qTJ2QDrgJ4gn2y8mcbwbVlBgF9GqXYPi0nhzO+gbnmXt2oYUm
 DnWqPqTZEuzVQDoJAvm9Mcb4dMUEgJpsbXZxzJVpZq84pF+WvT6hgwhAmg0cRg==
Message-ID: <a263d600-4f62-4d40-864c-e0b0c42f6863@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1749812057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N0Kfqegru7jYVQbYJA0pKc1PaRPyLscZ8dgU88no3B0=;
 b=hkuf7FyKnUjAMgshJqb0mYHhKGD/IPfrwSomz2gDPu+NtqJIkDnRw4I1nhTiD5Qlq/sq66
 8WNDso1NOl9fi+tYTXkw0s/QPtPMCShR3w8nZDZ/5+ySuv5xVt0IIagxDrGmh6Lmn0UMob
 Q7WndU9DeCP5oBV1Gf0sa1xowFvNVIKkKymJatPVRyR14ZWPky6SZUaOlGSDNstzCGMMkF
 oRBVAG48NrFVR+pHWPr/6bMUGTzEnYw1gCgX2PUaWIeC8hTPyqPCZniPXdQv6WZkVg1nK5
 X4/QbuJk3hiPfCHdj81Jj11HvjlaiHGeG7gfE90W8DcQnlSmm1euX6vT+Q5Tmw==
Date: Fri, 13 Jun 2025 12:54:13 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/panel: ilitek-ili9881c: Use u8 for lane count
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-renesas-soc@vger.kernel.org
References: <20250611234913.161861-1-marek.vasut+renesas@mailbox.org>
 <109b5c25-f54c-4413-aa62-8e2ae621c8e6@linaro.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <109b5c25-f54c-4413-aa62-8e2ae621c8e6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: opjts94mt51m91na447nh8aotdwfk4rd
X-MBO-RS-ID: 4f504fa37568c5974bf
X-Mailman-Approved-At: Fri, 13 Jun 2025 12:27:25 +0000
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

On 6/13/25 11:29 AM, Neil Armstrong wrote:
> On 12/06/2025 01:49, Marek Vasut wrote:
>> Use u8 to hold lane count in struct ili9881c_desc {} to avoid
>> alignment gap between default_address_mode and lanes members.
>> The ili9881c controller can only operate up to 4 DSI lanes, so
>> there is no chance this value can ever be larger than 4. No
>> functional change.
> 
> The u8 will still take at least 4 bytes and cpu will still
> do at least a 32bit memory access, so there's no point to change
> it to u8.
Assuming this layout:

   40 struct ili9881c_desc {
   41         const struct ili9881c_instr *init;
   42         const size_t init_length;
   43         const struct drm_display_mode *mode;
   44         const unsigned long mode_flags;
   45         u8 default_address_mode;
   46         u8 lanes;
   47 };

I wrote a quick test:

$ cat test.c
#include <stdio.h>
#include <stdint.h>

struct foo {
	void *a;
	size_t b;
	void *c;
	unsigned long d;

	uint8_t x;
	unsigned long y; // ~= lanes
};

struct bar {
	void *a;
	size_t b;
	void *c;
	unsigned long d;

	uint8_t x;
	uint8_t y; // ~= lanes
};

int main(void)
{
	printf("%d %d\n", sizeof(struct foo), sizeof(struct bar));
	return 0;
}

With which I get these results on x86-64:

$ gcc -o test test.c && ./test
48 40

And on x86 32bit:

$ i686-linux-gnu-gcc -o test test.c && ./test
24 20

Maybe there is some improvement ?
