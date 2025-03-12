Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D90CA5D8D8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 10:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FD110E735;
	Wed, 12 Mar 2025 09:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EJy1EYmC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9FC10E735
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 09:06:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 030775C493E;
 Wed, 12 Mar 2025 09:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C3BC4CEE3;
 Wed, 12 Mar 2025 09:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741770378;
 bh=kkbvDFWNRga005awbcrJQtQriRG2GOpvG7mrXZ2nwzs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EJy1EYmCkMs32e8YbXACxGg1PW1aGvAoBvbDBkCmihb6SX2dMeFwIJ6m338Rmg7YC
 7fBCAcamEbdXF8E+2y7LKSy3fYp1pRNwhRHcBS/OEHBGNtgXor5iD2GWiLjhZDfVAP
 kqgeqCMZ5zQXw5UyXForTBnIGrWqhs9ojY+8mMECJUcFfoG5q+CGy7wayGONWUYPRv
 HMjgnECghATeGoHrw9OxR+LK3jitfjoP8MvN4xcw9NPyBbBsAFe0D8Vlf0AdoNbVLB
 B2PsLCv+5RTiODKlxw3knpsDXtoIUhBm147aJ6GhHYw7uSEeNXoB0sto7HNJoJKvPK
 ZrN2PAiGHNOhQ==
Date: Wed, 12 Mar 2025 10:06:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Rob Herring <robh@kernel.org>, Melissa Wen <mwen@igalia.com>, 
 Iago Toral <itoral@igalia.com>,
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Phil Elwell <phil@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v3 5/7] dt-bindings: gpu: v3d: Add SMS register to
 BCM2712 compatible
Message-ID: <20250312-independent-beaver-of-swiftness-1851c5@krzk-bin>
References: <20250311-v3d-gpu-reset-fixes-v3-0-64f7a4247ec0@igalia.com>
 <20250311-v3d-gpu-reset-fixes-v3-5-64f7a4247ec0@igalia.com>
 <20250311202359.GA54828-robh@kernel.org>
 <7324785d-8af9-48b4-b9c6-55ac22c82426@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7324785d-8af9-48b4-b9c6-55ac22c82426@igalia.com>
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

On Tue, Mar 11, 2025 at 07:05:31PM -0300, Ma=C3=ADra Canal wrote:
> > > +        reg-names:
> > > +          items:
> > > +            - const: hub
> > > +            - const: core0
> > > +            - const: sms
> > > +            - const: bridge
> >=20
> > This is an ABI change because previously the 3rd entry was bridge and
> > you moved it. Put new entries on the end to keep compatibility. If
> > there's no users yet, then that's fine, but the commit message needs to
> > say that.
> >=20
>=20
> Again, I'm sorry about the naive question, but "bridge" is an optional
> register. AFAIU if I add "sms" in the end, I won't be able to make
> "bridge" optional. Am I missing something?

What do you mean by "optional"? You claim the same SoC has this
registers on some boards and also does not have it on others, so is
firmware locking the region? How does this register disappear on some
boards?

>=20
> Initially, I thought about using "enum: [ bridge, sms ]", but from
> Krzysztof=E2=80=99s feedback on v2, I'm not sure if it is the correct app=
roach.

Best regards,
Krzysztof

