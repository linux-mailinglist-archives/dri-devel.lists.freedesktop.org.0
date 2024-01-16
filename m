Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA2E82F03D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 15:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7806B10E00A;
	Tue, 16 Jan 2024 14:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A81F10E00A
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 14:06:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id BFACBB80DDA;
 Tue, 16 Jan 2024 14:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92B3C43394;
 Tue, 16 Jan 2024 14:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705413926;
 bh=wdApqMu8yNYkMKGqd22mtZ0Ag75N+acHPwxyLZRbFs4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oqdtqpaj8keG80MKofmm+/4W4Imz2FHtS+o4CtqoQFnORrJaBPQXFHSqAw6kv3hDM
 ViUfbpY+8ck27mkQ4RLJwiBuocuBWeziLRRo2jNaNgrw2USxSPXw1MpWOtljGkSs1X
 WMizARNn/x7T2EfytvIxcaqLiTfWkOMzh9QkKFOUdklooT9mZUGGw5BSe+zvISlS9Y
 m5RsO6yw8QSNeQ9zuzNqgS055j2xowU/qKoFaGAcUj09VbVagiUqIWrYGGV3WI+tIZ
 cu3xzO7jg2xfwnEDgiD8rp2iBnIyfX0UGlnKZd17B/M3ZpJtlUwISM9Hswdmp0CPFh
 /cLrpGPjrmw9g==
Date: Tue, 16 Jan 2024 08:05:23 -0600
From: Rob Herring <robh@kernel.org>
To: Devarsh Thakkar <devarsht@ti.com>
Subject: Re: [DO NOT MERGE PATCH 2/2] arm64: dts: ti: Add common1 register
 space for AM62x and AM65x SoCs
Message-ID: <20240116140523.GA3809602-robh@kernel.org>
References: <20240115125716.560363-1-devarsht@ti.com>
 <20240115125716.560363-3-devarsht@ti.com>
 <20240115-penpal-pluck-d156ccf21b2f@spud>
 <4c5cb4ed-96a3-7bd8-f660-2a3bb041ca09@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c5cb4ed-96a3-7bd8-f660-2a3bb041ca09@ti.com>
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
Cc: nm@ti.com, devicetree@vger.kernel.org, conor+dt@kernel.org, j-luthra@ti.com,
 tzimmermann@suse.de, krzysztof.kozlowski+dt@linaro.org, praneeth@ti.com,
 tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org,
 jyri.sarha@iki.fi, Conor Dooley <conor@kernel.org>,
 linux-kernel@vger.kernel.org, mripard@kernel.org, daniel@ffwll.ch,
 a-bhatia1@ti.com, airlied@gmail.com, kristo@kernel.org, vigneshr@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 02:48:53PM +0530, Devarsh Thakkar wrote:
> Hi Conor,
> 
> Thanks for the review.
> 
> On 15/01/24 21:44, Conor Dooley wrote:
> > On Mon, Jan 15, 2024 at 06:27:16PM +0530, Devarsh Thakkar wrote:
> >> This adds common1 register space for AM62x and AM65x SoC's which are using
> >> TI's Keystone display hardware and supporting it as described in
> >> Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml.
> >>
> >> This region is documented in respective Technical Reference Manuals [1].
> >>
> >> [1]:
> >> AM62x TRM:
> >> https://www.ti.com/lit/pdf/spruiv7 (Section 14.8.9.1 DSS Registers)
> >>
> >> AM65x TRM:
> >> https://www.ti.com/lit/pdf/spruid7 (Section 12.6.5 DSS Registers)
> >>
> >> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> >> ---
> > 
> > "[DO NOT MERGE PATCH 2/2]" but no rationale here as to why this cannot
> > be merged? What's the problem with it?
> > 
> 
> No problem as such from my point of view, but this is the process I follow
> since maintainer trees for device-tree file and bindings are different. I
> generally mark a [DO NOT MERGE] tag for device-tree file patches until binding
> patch gets merged so that the device-tree patches don't get applied by mistake
> if binding patch has some pending comments.

RFC is the tag for "don't merge". Don't make-up your own tags.

Rob
