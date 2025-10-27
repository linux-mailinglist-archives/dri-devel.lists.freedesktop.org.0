Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9970CC0F015
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 16:39:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF12E10E4D8;
	Mon, 27 Oct 2025 15:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="tam5WpRc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA9610E4D8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 15:39:44 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cwHkP0p64z9ssx;
 Mon, 27 Oct 2025 16:39:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761579581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6/ET+471hNYv512nd52lPnng3Az3u5HXWsjlK/2SSkU=;
 b=tam5WpRc+zzWVZV4PbTXOzPSo3dL811nvFxYUwwU/uZDmSL/DXOsQncZ3r2ldGd0sZIYYx
 BLThdTJMrogxTkEJCimnO3hExPdrcoorOr/mSfghdXJ/FBeilKM9xzLMTzstRB4TltLD1A
 z+UNT5uK50CGJJ7bsGCARHVGRPOiULBWIP/FmBpnaJdclKOJ7ksmvqITgk3DNtyST0rcKW
 eOH0CyDJNwimw8PnQcrOSAGzlf6g0qDrLgnJw7f4wr3cVCiZPLUl+eIMTlhyssOZ6AyhUc
 2nJZRHrWOpMQ6pqApTB2D+bG2JrfC5lBcRe6KhsUDhGrchpniBFyjWJkRagZhQ==
Message-ID: <86de57c6-94e9-43b7-8e6a-d301ce73b0ba@mailbox.org>
Date: Mon, 27 Oct 2025 16:39:33 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Adam Ford
 <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org>
 <6bc264c2-0c1c-492b-ba58-8c7609cfc565@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <6bc264c2-0c1c-492b-ba58-8c7609cfc565@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 0afc5b27525a69b226e
X-MBO-RS-META: dd664fa9dm8z1eoh4j8a8wtz7xqgzsi8
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

On 10/27/25 3:08 PM, Matt Coster wrote:
> Hi Marek,

Hello Matt,

> Apologies for the delayed response, I was on holiday for the rest of
> last week – I'll apply this to drm-misc-next now.
No worries. Thank you for your help !
