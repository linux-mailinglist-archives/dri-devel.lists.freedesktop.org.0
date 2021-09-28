Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB7941A480
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 03:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB3F6E09A;
	Tue, 28 Sep 2021 01:11:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897F189D9B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 01:11:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38CBF3F1;
 Tue, 28 Sep 2021 03:11:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1632791508;
 bh=UwUX/PlPzYMUbHTHRTLSsvN1z9n+AldtWKTAxW1LiJc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=elmybGLG8cVXzHZEEPUWoArcm1GPZfOKoF/P4+Xb5B88UjX3L9i5f4ytQ/8bSGTTq
 Ai/UAXv3PPd4kVSZ/JA+y0sJLtw4mlNUCfqsjWbBJI3KMNjb8sxL7spa/zHsyor9vn
 vnyP71ST+8oPlW0d5W8ZCSCLHIslIolMHYmtv3Q4=
Date: Tue, 28 Sep 2021 04:11:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Geert Uytterhoeven <geert@glider.be>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3.1] dt-bindings: display: renesas,du: Provide bindings
 for r8a779a0
Message-ID: <YVJrzaQS+XBQO4Xg@pendragon.ideasonboard.com>
References: <20210922234726.3337265-2-kieran.bingham@ideasonboard.com>
 <20210923130138.67552-1-kieran.bingham@ideasonboard.com>
 <YVIwPnRxxO0Txm2G@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YVIwPnRxxO0Txm2G@robh.at.kernel.org>
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

On Mon, Sep 27, 2021 at 03:57:34PM -0500, Rob Herring wrote:
> On Thu, 23 Sep 2021 14:01:38 +0100, Kieran Bingham wrote:
> > From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 
> > Extend the Renesas DU display bindings to support the r8a779a0 V3U.
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 
> > ---
> > v2:
> >  - Collected Laurent's tag
> >  - Remove clock-names requirement
> >  - Specify only a single clock
> > 
> > v3:
> >  - Use clocknames: 'du.0' instead of 'du' to remain consistent
> > 
> > v3.1:
> >  - Require clock-names
> >  - Collect Geert's tag
> > 
> >  .../bindings/display/renesas,du.yaml          | 51 +++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thank you Rob, that was the missing piece for a pull request :-)

-- 
Regards,

Laurent Pinchart
