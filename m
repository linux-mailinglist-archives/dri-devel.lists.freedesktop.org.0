Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A02C31CDC
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 16:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9E010E626;
	Tue,  4 Nov 2025 15:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="AMQBiX6x";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DNTl9Vzb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D6610E639
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 15:21:23 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4d1BxY5y00z9tsS;
 Tue,  4 Nov 2025 16:21:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762269681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iyw2a6XGrVsDBi+ogcdblT77R4F5a2qgkSqZJ6Q4CEk=;
 b=AMQBiX6xFZmcOncbHcyQ7z5bWygUWTzLAQc9ScI5DoR8WB2yM7OVRybP4riyHquQeTzRrd
 mnNWOFAeyEOX1wrRHd0J9ZNlnghIuLmwFmQJNdNlftDV7nye3dGWJzAvqtrMy/igEDDSh8
 7awOjrvcYo5jGPEamJZq4VTs2p7qxIhk8VZyspINdyhWvhFDPzZsrxne9aQ52giWq26bP9
 aDkfm2DFbHBirF8aJq+rqeOm5eMzQYR42D+6DN4rvHFmb49lJMDPblJxCmiZUidac2pGQO
 yerbz7/AttZb+yUXo9KK70V6eSfeQ5iJpes4ltktGO0iSSIFN3xtzawuy1BJ1g==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=DNTl9Vzb;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <d37adc12-4ba8-4f0d-aa9a-9071e153917f@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762269679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iyw2a6XGrVsDBi+ogcdblT77R4F5a2qgkSqZJ6Q4CEk=;
 b=DNTl9VzbnMDKEG5USWEmX8/muXmK0aVd1LEOgDS+SbEUWHnql/Ft1diJV4ig6Z0VoDwoQ/
 D0HWfETWpmc6NcmUeWfhyHV56Ls2or9E35CX9vQFRMp4AV190d703EuO8BPHB3bApp4I4y
 77HD78UA849bddwVTApTilR5PJ6bNsFwZlhzhHVOfEqTMLiJpf7rXTgWTbta+bvAmyIrcH
 NivudVHkKiKDhbBVwkt9Ojh2sMk1RjobQU6HnyCtqfvuUe2UVSDmUXvyU/dwHpPydvnAx2
 jk8COqU7wpQd8fwJL7/oa7DVwGVfwh1yWXTP+PZuaVNmJcFLOHcKB8jyIchnXQ==
Date: Tue, 4 Nov 2025 15:23:08 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] dt-bindings: gpu: img,powervr-rogue: Document
 GE7800 GPU in Renesas R-Car M3-N
To: Matt Coster <Matt.Coster@imgtec.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
 <20251104135716.12497-2-marek.vasut+renesas@mailbox.org>
 <5e2ea623-1e41-4cf3-a81e-2ab7d288c013@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <5e2ea623-1e41-4cf3-a81e-2ab7d288c013@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: fy383rnxybucsoo939z786g6im7yf389
X-MBO-RS-ID: 3280eb3815e7cec32ef
X-Rspamd-Queue-Id: 4d1BxY5y00z9tsS
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

On 11/4/25 3:06 PM, Matt Coster wrote:
> On 04/11/2025 13:56, Marek Vasut wrote:
>> Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
>> present in Renesas R-Car R8A77965 M3-N SoC.
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Reviewed-by: Matt Coster <matt.coster@imgtec.com>
> 
> I'll take this and P1 via drm-misc-next later today.
Thank you
