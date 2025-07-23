Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C6CB0EC99
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 10:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A00110E039;
	Wed, 23 Jul 2025 08:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cYnkiFGQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71EA310E039
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 08:03:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 35A13439E7;
 Wed, 23 Jul 2025 08:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9CBC4CEF4;
 Wed, 23 Jul 2025 08:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753257804;
 bh=DZ9PwQBYoEqa9gBIc5ARW3ABA005LYABoXfIdegGZbc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cYnkiFGQLE1z1N9S1N2HbWs7qM/3m6g05DiejT5t9Q4SbTTpj1a1JuZgFYA/ytMO6
 AQN7Ox4iETKRel5CvXUe9Q3m3ZdY28WliNgiWId08kyp+3dkB5h2rQRySjzxxzfyeW
 AohOCn3P+eTLk9bZg6EykMrvw0wE1MCdmCNY/8k17S4OkGr+5y6dJNc9RgV6lwY9Xu
 v1jPUZNoMKG2ZcCebPB7KF/PF8hDpiKHJd0WWvqF3miPkG0eipWA36kFttA3rnt16U
 r/RaCxdM6VvevsCUpH4j9kGvXQlGpqBvA1m9S42r7UFrdPtP+NRjsY4JONf8KRhOOd
 +TrhqVh1W/Ltw==
Date: Wed, 23 Jul 2025 10:03:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Kevin Tang <kevin.tang@unisoc.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/15] dt-bindings: display: sprd: allow attaching a
 DSI panel
Message-ID: <20250723-wine-numbat-of-persistence-bf43f3@kuoka>
References: <20250722-ums9230-drm-v2-0-054276ec213d@abscue.de>
 <20250722-ums9230-drm-v2-3-054276ec213d@abscue.de>
 <20250723-dark-modest-mole-480bff@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250723-dark-modest-mole-480bff@kuoka>
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

On Wed, Jul 23, 2025 at 09:54:57AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Jul 22, 2025 at 04:41:05PM +0200, Otto Pfl=C3=BCger wrote:
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +            description: The output endpoint, usually connected to the=
 panel
>=20
> I never remember if the output should be a "port" here or a panel@ child
> (as described by dsi-controller.yaml). Various users do it differently.
>=20
> Syntax looks fine to me, so happy to get second opinion on above point.

I got now explanation from Neil, so all is fine.

>=20
> Anyway:
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
