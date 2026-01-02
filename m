Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC346CEE7F5
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 13:21:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A6110E0E6;
	Fri,  2 Jan 2026 12:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ajr0/a2S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C8810E0E6
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 12:21:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 36C5060126;
 Fri,  2 Jan 2026 12:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56020C19421;
 Fri,  2 Jan 2026 12:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767356478;
 bh=UHlQsLcaXWnyACvrjhEb45lh4+oW0nhffnIhnMdC96I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ajr0/a2SRrlWfK1kVMdMkEN8q1r5oNniCbx5pFlwKj9+xd/p537VjL40rqq7rbNdF
 r4MmIrJVn+yZdrsWB/XqfSEXbOl2N2Lj8WcHt2Z+iMXq/AX3kDH3NKUPaPhgk61763
 8u+fOEPthswj5vlgEmD8b2YAH28tRxXZ8Kikotjut/qCcZcEvu5DVDrLEuvzHk+V1J
 obBuYzjMheibb3sqYjZ4d3zVUuKGKDGOPBmuUIKOg3To7zDOVFgUYEVh3yGvP4Ml7N
 PiOWa/7I4Q4tUOx0Fwo1tOEDxrYl3xMYVhpxq1h5MuP32XKogITy64BEozw0u1a0UU
 Sip0KeoTBqZ8g==
Date: Fri, 2 Jan 2026 13:21:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, dmitry.torokhov@gmail.com, sre@kernel.org, 
 gregkh@linuxfoundation.org, jirislaby@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, 
 jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: power: supply: google, goldfish-battery:
 Convert to DT schema
Message-ID: <20260102-stereotyped-cunning-booby-a680c8@quoll>
References: <20251230181031.3191565-1-visitorckw@gmail.com>
 <20251230181031.3191565-5-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251230181031.3191565-5-visitorckw@gmail.com>
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

On Tue, Dec 30, 2025 at 06:10:29PM +0000, Kuan-Wei Chiu wrote:
> +---
> +$id: http://devicetree.org/schemas/power/supply/google,goldfish-battery.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Android Goldfish Battery
> +
> +maintainers:
> +  - Kuan-Wei Chiu <visitorckw@gmail.com>
> +

Same comments.

Best regards,
Krzysztof

