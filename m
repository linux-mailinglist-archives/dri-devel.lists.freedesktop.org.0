Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F81B2C65C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 15:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB39810E60A;
	Tue, 19 Aug 2025 13:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ogb6q3Zx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DD910E606
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 13:58:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A670061431;
 Tue, 19 Aug 2025 13:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D132C113D0;
 Tue, 19 Aug 2025 13:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755611932;
 bh=qegJliyCwkUB9tOPFffvUwCm+VjLhHymTL03rrMDI5E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ogb6q3ZxsL3Pf7yxU+Ivavw47aEkHyn6W67vp/gW2ryEY2aT1erv92eZDsgI93gyw
 TUbV0UdJocFNzVMVDhCJBhN6TTR6kgb9CWbXmnkHDJ32h5noBnG1o+lKSfq3nzwolj
 pUv4xkFm/SjjfdGdfqCByMyTIMn455kOkLKdey9PklYOBtmSQ4+VDF0w0d6hANFkqG
 w5ER7HiAWHgexqotU6+kAkL4QK7vtp4wZSlWNxwes84YDX6Mo83TJq8hRxVv3w2MKV
 uHaWtHsVxBH3hgYtPK+5iuyE4m9x7cMtbrpgY/wqv+JUSGd61NJgonfKRg2qGUGtOC
 Cs2gCsTz96QxA==
Date: Tue, 19 Aug 2025 08:58:51 -0500
From: Rob Herring <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 devicetree@vger.kernel.org, Philippe Cornu <philippe.cornu@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 01/13] dt-bindings: display: st: add new compatible to
 LTDC device
Message-ID: <20250819135851.GA115029-robh@kernel.org>
References: <20250819-drm-misc-next-v3-0-04153978ebdb@foss.st.com>
 <20250819-drm-misc-next-v3-1-04153978ebdb@foss.st.com>
 <175560127037.3969097.6130940505156039734.robh@kernel.org>
 <e144225c-e0e6-4d3e-a4d8-e4c48cdef3f6@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e144225c-e0e6-4d3e-a4d8-e4c48cdef3f6@foss.st.com>
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

On Tue, Aug 19, 2025 at 03:17:46PM +0200, Raphael Gallais-Pou wrote:
> 
> 
> On 8/19/25 13:01, Rob Herring (Arm) wrote:
> > On Tue, 19 Aug 2025 11:15:54 +0200, Raphael Gallais-Pou wrote:
> >> The new STMicroelectronics SoC features a display controller similar to
> >> the one used in previous SoCs.  Because there is additional registers,
> >> it is incompatible with existing IPs.
> >>
> >> Add the new name to the list of compatible string.
> >>
> >> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> >> ---
> >>  .../devicetree/bindings/display/st,stm32-ltdc.yaml | 30 ++++++++++++++++++++--
> >>  1 file changed, 28 insertions(+), 2 deletions(-)
> 
> Hi Rob,
> 
> It seems several patches of this series triggered your bot without
> warnings/errors messages.
> 
> Did I missed something or is it just a glitch in the matrix ? :)

'make dt_binding_check' is broken in linux-next which is used if the 
base commit is not specified or not found. The latter was the case here. 
Should be fixed in tomorrow's linux-next.

Rob
