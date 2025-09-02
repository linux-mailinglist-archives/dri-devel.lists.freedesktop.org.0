Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26962B40CDF
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 20:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2735E10E06A;
	Tue,  2 Sep 2025 18:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U1x6xb2X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A82F10E06A;
 Tue,  2 Sep 2025 18:10:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1419C40A80;
 Tue,  2 Sep 2025 18:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382DFC4CEED;
 Tue,  2 Sep 2025 18:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756836604;
 bh=G2Fg0D8oE/Vf7CDjk6O7tHlWOoLEPrOOvpmf7d0Nu9g=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=U1x6xb2X9OFMav2UKTzNN0yo9iE0Bsmu5l6CnzFus5X04+c0XGUBYz+Hfjdwx4POs
 44XmAKa74122cdN50jLkZsv7uh3fWcpkucwPMh7yQqcmFEUOquwa6uMSkBkcQsi7ou
 u+OcWSO/MfC8EYvDXrI62ycPlXTORmPrbB8NN+GwrVJy/W9lEWsYa5KTovJsnQfplX
 uveiPI+D1SJF2EphOx7a/5IS4iuw0F/PGrgcenmcP1yEcJ1Byn7xPQaDcDnGGvF+MA
 VtLKzbZDm6e84mVYhof4owThD1izEXXUm/t4GPgr0sBv7b7yu/ic1eyATPd8AEWqSF
 bxon9jn4wOMLg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Sep 2025 20:09:54 +0200
Message-Id: <DCIILHRHQ2SP.3MYD6KEP72GV9@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add drm-rust tree for Rust DRM drivers and
 infrastructure
Cc: <aliceryhl@google.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <acourbot@nvidia.com>, <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Maxime Ripard" <mripard@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250901202850.208116-1-dakr@kernel.org>
 <humoafx7njwhvdwarelew2bwyl34q3ls5vbrkj6psfukoroni5@z7ap6mc4lj3k>
 <DCII677CICRL.2OCMSV7ESGTQ5@kernel.org>
 <enuksb2qk5wyrilz3l2vnog45lghgmplrav5to6pd5k5owi36h@pxdq6y5dpgpt>
In-Reply-To: <enuksb2qk5wyrilz3l2vnog45lghgmplrav5to6pd5k5owi36h@pxdq6y5dpgpt>
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

On Tue Sep 2, 2025 at 7:57 PM CEST, Maxime Ripard wrote:
> On Tue, Sep 02, 2025 at 07:49:56PM +0200, Danilo Krummrich wrote:
>> On Tue Sep 2, 2025 at 7:40 PM CEST, Maxime Ripard wrote:
>> > Would it make sense to add the drm-misc maintainers as reviewers for t=
he
>> > bindings?
>>=20
>> This will get you all the driver patches in your inbox as well, maybe
>> discarding the following hunk is what we want instead?
>
> I guess we would receive just as many patches as we do today :)
>
>> 	@@ -8079,7 +8079,6 @@ F:	Documentation/devicetree/bindings/gpu/
>> 	 F:	Documentation/gpu/
>> 	 F:	drivers/gpu/drm/
>> 	 F:	drivers/gpu/vga/
>> 	-F:	rust/kernel/drm/
>> 	 F:	include/drm/drm
>> 	 F:	include/linux/vga*
>> 	 F:	include/uapi/drm/
>
> That's not really what I meant, what I meant was that rust/kernel/drm/
> is the only thing I'm really interested on, but we don't need to
> maintain it if it makes more sense to do so separately.

Yeah, the idea was to discard the hunk above and still keep rust/kernel/drm=
/ on
this new entry, so you get *only* that, but not all the driver patches.

As far as file maintainership is concerned, we have group maintainership on=
 the
commmon infrastructure anyways.

Your call, happy to add you as reviewers to the new entry too. :)

> BTW, we should probably add to drm-misc
>
> X: drivers/gpu/drm/nova

Makes sense.

> because we have a catch-all at the moment.
>
> Maxime

