Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA18CEE7D9
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 13:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C087B10E0B9;
	Fri,  2 Jan 2026 12:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IGxSmZ+z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4411910E0B9
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 12:19:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 224C643D63;
 Fri,  2 Jan 2026 12:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 710E7C116B1;
 Fri,  2 Jan 2026 12:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767356378;
 bh=DuFbu53uVycRjhiI2jx7UQcyXapBe7nmlDM/y0cpp9E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IGxSmZ+zUXvRf71q7PeKNWNYQMFapQD1q5ly/GaqG1Ww3UgggOp5QZ2vnnqjq3my2
 uhAe9Xz/8ZxHIM5g7Or/HwCvHhlyuupVmjFSyCPnKr5iz0zb23KYZTGNyngldBd/HC
 CV6wDRsaHyIOJDAFUc6rr6sSrs8JtsOJn7hw6m9lvWmRXMuBmX516j1X8Jkmte17L2
 7xJFOYUpqA0X658Jj7Thp2/eSG9mdwbNF71soJd2Hh/CQ8WgMeZBr9iyAAJ1+mkniW
 F0TMM3LX8DtAc9vrj0IErp08x7RXlZAcVHidNAXjvKWjtBeg93Ir7vJskU42/+wM5i
 rREy+G966n/SQ==
Date: Fri, 2 Jan 2026 13:19:35 +0100
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
Subject: Re: [PATCH 2/6] dt-bindings: misc: google,android-pipe: Convert to
 DT schema
Message-ID: <20260102-unselfish-nimble-gecko-722c94@quoll>
References: <20251230181031.3191565-1-visitorckw@gmail.com>
 <20251230181031.3191565-3-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251230181031.3191565-3-visitorckw@gmail.com>
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

On Tue, Dec 30, 2025 at 06:10:27PM +0000, Kuan-Wei Chiu wrote:
> Convert the Android Goldfish QEMU Pipe binding to DT schema format.
> Move the file to the misc directory as it represents a miscellaneous
> communication device.
> Update the example node name to 'pipe' to comply with generic node
> naming standards and fix the mismatch between unit address and reg
> property in the original example.
> 
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  .../devicetree/bindings/goldfish/pipe.txt     | 17 ---------
>  .../bindings/misc/google,android-pipe.yaml    | 38 +++++++++++++++++++
>  2 files changed, 38 insertions(+), 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/goldfish/pipe.txt
>  create mode 100644 Documentation/devicetree/bindings/misc/google,android-pipe.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

