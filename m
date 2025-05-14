Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A55AB70B9
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 18:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5D210E67B;
	Wed, 14 May 2025 16:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lCLGUS6u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AB110E67B
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 16:05:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0951CA4DF0A;
 Wed, 14 May 2025 16:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69ED3C4CEE3;
 Wed, 14 May 2025 16:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747238738;
 bh=340q/KEUN+HnJ5ZK40hUt5FGwqCMJWS2IjUF828YIIU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lCLGUS6uVGyfJZuqXNyjpToH5HFpqKPKmc1tM9Qly7soW/qwKAp3sxZnznvJLizrJ
 NbtoWYAfILYVbFwk0SZWbW56tKvefEyzc/rZM1FPOhp1n3prB6mwSWTpjFcu2usQi9
 GLnIIRuix+C2Cwxu1r9lK/RWperOwZBOsf11usHJAovZl/KQytqFm/p7UTeN47vsWu
 3W0SOqG+QbB3bNLhEEzdWWXKZmCF5NaVSSWoq99nMcTn5ZSdhruSEVgafzj632DpI3
 KvHDDoiNz2SKin+Wsau21CGNDOuXotk+KKMtvDS/bPuph7N0tSxEc0PW09ilN6+CJ7
 QNL0AJZXvMfng==
Date: Wed, 14 May 2025 11:05:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: display: panel: Document Renesas
 R69328 based DSI panel
Message-ID: <174723873634.2424508.11724723514969082170.robh@kernel.org>
References: <20250506092718.106088-1-clamor95@gmail.com>
 <20250506092718.106088-4-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506092718.106088-4-clamor95@gmail.com>
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


On Tue, 06 May 2025 12:27:17 +0300, Svyatoslav Ryhel wrote:
> R69328 is liquid crystal driver for high-definition amorphous silicon
> (a-Si) panels and is ideal for tablets and smartphones.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/panel/renesas,r69328.yaml         | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

