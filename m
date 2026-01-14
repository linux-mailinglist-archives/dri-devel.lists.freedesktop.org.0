Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E15D1CD91
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 08:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADFD10E5CC;
	Wed, 14 Jan 2026 07:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DeiWhp5f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85E510E5CC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:31:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9118640737;
 Wed, 14 Jan 2026 07:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A3CC4CEF7;
 Wed, 14 Jan 2026 07:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768375904;
 bh=AxjtDJogjMYny70/S8/oxhn7AfCM+IcApWCwD5ErivI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DeiWhp5fkC0+BtXDSTUOmHf1fewucLdNdSB5+3y2UtMzLKAH/iJXBEPkO/ISPnYer
 p5Oe6X3e1gDz0ZkuzUPtCisUecIoLFuYv72qZI0eBjaKFoEDHEXuASHMFPoxJsm05J
 03uvqRX1gX3zqKM4YKRVsWR6KPD+RyAhtaiAUYmeKda/7NGakzpCWi6L9c6dq4lDl1
 +faqr/N8Ille+S9R4cblNRJWJTKOb2zJcElVWWej0rrIFODYRLfZUsMpm9EN6uBNZf
 enzscCRmgeR6Cm0KVtMTiALQVt3pvk7AZMw2155YMoU7qG9tKmH1ANh3Wgl5jrdA7C
 1tn+tQ6nNjZ5w==
Date: Wed, 14 Jan 2026 08:31:41 +0100
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
Subject: Re: [PATCH v4 4/6] dt-bindings: power: supply:
 google,goldfish-battery: Convert to DT schema
Message-ID: <20260114-blazing-mantis-of-advance-ddd6fc@quoll>
References: <20260113092602.3197681-1-visitorckw@gmail.com>
 <20260113092602.3197681-5-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260113092602.3197681-5-visitorckw@gmail.com>
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

On Tue, Jan 13, 2026 at 09:26:00AM +0000, Kuan-Wei Chiu wrote:
> Convert the Android Goldfish Battery binding to DT schema format.
> Move the file to the power/supply directory to match the subsystem.
> Update the example node name to 'battery' to comply with generic node
> naming standards.
> 
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

