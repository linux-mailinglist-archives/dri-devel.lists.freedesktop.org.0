Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7082FD26A11
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 18:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC8510E7B6;
	Thu, 15 Jan 2026 17:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HaIYSOFk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A600D10E7B6
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 17:42:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A3D29601BC;
 Thu, 15 Jan 2026 17:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF17C19422;
 Thu, 15 Jan 2026 17:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768498919;
 bh=tegX0Z/kfZv1/AcKJNcGxRXv024yyTYAJnUN/qrxplY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HaIYSOFkzGOX1FELeMIxNJBCUp2pBsmJr+vWtH9c22QOuR3bWR1i9x1arvu7BpZ5M
 zJptP4/6imL6piFKD8gTvA+pOLriBbLiEyIF1E535zkpNchLbZjGjuE9UwN2CZ6cae
 MnRw1IeoleGfz0rzIy8GO81+3hjwMen29CDZ0MdvCwF5RICh/RAWZTbVX3hWhlXzZn
 bJchVcQWlc5Ar1XBcNmQtz14fBZleQsW62EVir1DibiN0LDmIb/ki5hKYI4+BISq38
 KaGiLCo3RyZBKEkf+GTUN7n2UQQ4rMpGZeGTABOhGdizM3NqxRml61QpJcjoFmrhP8
 zaXTszb+mFFXA==
Date: Thu, 15 Jan 2026 11:41:58 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 sre@kernel.org, conor+dt@kernel.org, eleanor15x@gmail.com,
 simona@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de,
 krzk+dt@kernel.org, gregkh@linuxfoundation.org,
 jserv@ccns.ncku.edu.tw, mripard@kernel.org,
 linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org,
 broonie@kernel.org, maarten.lankhorst@linux.intel.com,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 dmitry.torokhov@gmail.com, jirislaby@kernel.org,
 lgirdwood@gmail.com, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 6/6] dt-bindings: display: google, goldfish-fb: Convert
 to DT schema
Message-ID: <176849890696.935461.15138796644724079676.robh@kernel.org>
References: <20260113092602.3197681-1-visitorckw@gmail.com>
 <20260113092602.3197681-7-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113092602.3197681-7-visitorckw@gmail.com>
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


On Tue, 13 Jan 2026 09:26:02 +0000, Kuan-Wei Chiu wrote:
> Convert the Android Goldfish Framebuffer binding to DT schema format.
> Update the example node name to 'display' to comply with generic node
> naming standards.
> 
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  .../bindings/display/google,goldfish-fb.txt   | 17 ---------
>  .../bindings/display/google,goldfish-fb.yaml  | 38 +++++++++++++++++++
>  2 files changed, 38 insertions(+), 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/google,goldfish-fb.txt
>  create mode 100644 Documentation/devicetree/bindings/display/google,goldfish-fb.yaml
> 

Applied, thanks!

