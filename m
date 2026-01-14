Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF59BD1CDA0
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 08:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4355210E348;
	Wed, 14 Jan 2026 07:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pBZAJV31";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1D310E348
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:32:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C6AC540737;
 Wed, 14 Jan 2026 07:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2517FC4CEF7;
 Wed, 14 Jan 2026 07:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768375921;
 bh=orcwKbiN7UgOJj304kfxPoo8ZOOnHKD4pLKX5LgxnVM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pBZAJV31mQg2RRApzC2Efuxi+GRtdWpVi13qsQteRGqABdi0Gvl+qAUQ5j5/qexNx
 FgZZJOvq7kaTP8ZFwklFn7chW2MuDKaWSHy+suy2R/CAxv79sH1+E6HVlk72yd9YHA
 2BCMkmZCNhSX3AXHyWUxtWR82wpI9WLNJV7/d/lNeXuFYIArWCTtxB8gsRXdZ+Ox0n
 tPIG2mL6IvNkDJCq66CwVQJsjlj/sVh05AwFdW9QyXp5rF+kP36Z4P0bwh2wRA8cGY
 hGvnsO5oYQjehioerAnKzktCGy4Byjumiy8v+cSNBRYOm4t3wFPpmsbhWQRPyDDNBo
 7D/iuflB4Bbzw==
Date: Wed, 14 Jan 2026 08:31:59 +0100
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
Subject: Re: [PATCH v4 5/6] dt-bindings: sound: google,goldfish-audio:
 Convert to DT schema
Message-ID: <20260114-gainful-mutant-lemur-92ede9@quoll>
References: <20260113092602.3197681-1-visitorckw@gmail.com>
 <20260113092602.3197681-6-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260113092602.3197681-6-visitorckw@gmail.com>
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

On Tue, Jan 13, 2026 at 09:26:01AM +0000, Kuan-Wei Chiu wrote:
> Convert the Android Goldfish Audio binding to DT schema format.
> Move the file to the sound directory to match the subsystem.
> Update the example node name to 'sound' to comply with generic node
> naming standards.
> 
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  .../devicetree/bindings/goldfish/audio.txt    | 17 ---------
>  .../bindings/sound/google,goldfish-audio.yaml | 38 +++++++++++++++++++
>  2 files changed, 38 insertions(+), 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/goldfish/audio.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

