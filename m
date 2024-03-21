Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 818F28859D1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 14:13:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6735110E9FB;
	Thu, 21 Mar 2024 13:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YtG6PS56";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E22310E9FB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 13:13:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3B490611B4;
 Thu, 21 Mar 2024 13:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A846BC43390;
 Thu, 21 Mar 2024 13:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711026808;
 bh=wM7dULtUyZv/B/ii8vtIVtiiq8Ch3qqzcIVz2KP55DM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YtG6PS56bQ71xd/TLXqxc26Z8ZM8GilyQNwoEIcqayzSv9W07frvL09xdo7njPY7b
 m9eTL/A6k2dmlHJF4PGryebXrdAM+TNwVNv9V0HMbEC3I0t2EQfhDoVDZ0nfhT7lq+
 Zubma6NXLySBG7SPn9McGb50M3htZFl/oNuawbzMIhSClyZVBdB/OBpk1yuunTRTfX
 qRUxCm9c04TlBTxEkF3FypLTbf9XEyM2XU7wIKwxaf823KIBOaTVL01l6kUxBiw64I
 X2X53mORgWtjxXr60Vp0ypIzqyjJvYY/Bp5aWknYgRS/HeFlbJ2h3Kr30pMrdozsxb
 WkqQxc6LHzY8w==
Date: Thu, 21 Mar 2024 08:13:26 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: display: samsung,exynos5-dp: convert to
 DT Schema
Message-ID: <20240321131326.GA1593587-robh@kernel.org>
References: <20240313182855.14140-1-krzysztof.kozlowski@linaro.org>
 <20240320-reanalyze-koala-4c086a24fee0@spud>
 <90f0c8e5-01ec-4cb9-88a0-fe36d8d20443@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90f0c8e5-01ec-4cb9-88a0-fe36d8d20443@linaro.org>
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

On Thu, Mar 21, 2024 at 08:37:15AM +0100, Krzysztof Kozlowski wrote:
> On 20/03/2024 18:04, Conor Dooley wrote:
> > On Wed, Mar 13, 2024 at 07:28:55PM +0100, Krzysztof Kozlowski wrote:
> > 
> >> +  clock-names:
> >> +    items:
> >> +      - const: dp
> > 
> >> +  phy-names:
> >> +    items:
> >> +      - const: dp
> > 
> > The items lists here are redundant when you only have a single item, no?
> > Isnt it just
> > phy-names:
> >   const: dp
> 
> Somehow the convention for properties was to define the list. Unlike for
> compatible where we use shorter syntax like you propose. Shall we change
> the approach and use shorter syntax in general?

I guess the difference is -names is usually more than 1 whereas 
compatible is frequently only 1. Either way is fine I think.

Rob
