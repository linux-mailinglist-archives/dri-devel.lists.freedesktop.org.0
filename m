Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7512CD212D2
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 21:27:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B451510E686;
	Wed, 14 Jan 2026 20:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jBUv0zxu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B29E10E686
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 20:27:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E2FAF44172;
 Wed, 14 Jan 2026 20:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA60C4CEF7;
 Wed, 14 Jan 2026 20:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768422434;
 bh=eV4ndeTq5LWYE9boQjw7KvAeUJ9TpCAcZkHCoVpVQWA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jBUv0zxuoGaNzDy21D4G1u4AI8LjtJ4MetoZmUuzHcAkxtfSbW48qy3gPZVw7BBCj
 VbRMzhUZZTXgMRPKm3af84TvB1+SxK+CUl8d43rIsstnU8OcwvJgEqWQMyPw9kUE2A
 78JTx3T5Z3mxdDTMJLFGKkxCMxyboANnyakdiIu2t8ggaz8+Sfv5fF//hY6sxHZJ2d
 mNRFlVPj2JbuoeYKb/EWwwSz1XUqMY2pwVGtudZUwO5fzGaI08nbPF01pAJTsTA5ww
 /IXFR7fza1SWaUHqFzb5wLDKHRaZPLbxJjfLm23YNIo8OnOlKVfxwjmdikvccRvGWt
 UI1928JIH1ljQ==
Date: Wed, 14 Jan 2026 14:27:13 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, conor+dt@kernel.org,
 linux-serial@vger.kernel.org, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, eleanor15x@gmail.com,
 airlied@gmail.com, linux-pm@vger.kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, mripard@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-sound@vger.kernel.org, gregkh@linuxfoundation.org,
 jserv@ccns.ncku.edu.tw, krzk+dt@kernel.org,
 dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
 jirislaby@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, sre@kernel.org
Subject: Re: [PATCH v4 2/6] dt-bindings: misc: google,android-pipe: Convert
 to DT schema
Message-ID: <176842243303.3160426.3438138297635940140.robh@kernel.org>
References: <20260113092602.3197681-1-visitorckw@gmail.com>
 <20260113092602.3197681-3-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113092602.3197681-3-visitorckw@gmail.com>
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


On Tue, 13 Jan 2026 09:25:58 +0000, Kuan-Wei Chiu wrote:
> Convert the Android Goldfish QEMU Pipe binding to DT schema format.
> Move the file to the misc directory as it represents a miscellaneous
> communication device.
> Update the example node name to 'pipe' to comply with generic node
> naming standards and fix the mismatch between unit address and reg
> property in the original example.
> 
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> Changes in v4:
> - Use decimal format for interrupts in the example.
> 
>  .../devicetree/bindings/goldfish/pipe.txt     | 17 ---------
>  .../bindings/misc/google,android-pipe.yaml    | 38 +++++++++++++++++++
>  2 files changed, 38 insertions(+), 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/goldfish/pipe.txt
>  create mode 100644 Documentation/devicetree/bindings/misc/google,android-pipe.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

