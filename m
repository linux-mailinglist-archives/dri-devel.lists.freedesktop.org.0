Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDE912FF68
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 01:10:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713476E384;
	Sat,  4 Jan 2020 00:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4F86E384
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2020 00:10:00 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id k24so12746532ioc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2020 16:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XfXHkBnCjci39X5Yh6SUYp5n6eoGbtDoP20HblyPxEY=;
 b=VNYYzNT13ddYIPz8czehHr8Uo3G60yI3xf1l23q3ONnX7QNr+IMMPlDIXer2LPTi8/
 E+JlbhT0W86flUh+4BcZRBfk13NJqLlu07XkmhiXtUXeKCkDU7NqIRmH+a+2/vsdvS7t
 QSjRQRRK4hjgqpTHpwRmbxosMO4yIYeQv/HOjhd4qH5X6qu7wQ+g6n0nRHh7gmgCiMDz
 PgRJpMmgG1fSxZW7D3DRmxa8AW6JnwW67EMul1En/mvpPRsmyv7Egku5NDNGJTAW3UpA
 8s9Nrwe9hFXYOtnGXCFaGePuURHLuCmiYLVtx6Ds9BX7cDuztmcFsrXSBb2q7MJmMzmN
 nDKQ==
X-Gm-Message-State: APjAAAWz4wNBKwM9ivP069MzeAsRGZNFFBl/ZgySxFXV/pZPtApkadKI
 8xBj0V2Gu/rXgtkHHY04v5OFrkU=
X-Google-Smtp-Source: APXvYqzZgLOY+lh/Juv1F4eS3cydoB/7dTuZ22p2eVJxMgRJiD4aTWcdwNYO8E0zvmszozvwGKZDpw==
X-Received: by 2002:a6b:f206:: with SMTP id q6mr60737398ioh.264.1578096599740; 
 Fri, 03 Jan 2020 16:09:59 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id z20sm14885709iof.48.2020.01.03.16.09.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 16:09:58 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 2219a5
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Fri, 03 Jan 2020 17:09:57 -0700
Date: Fri, 3 Jan 2020 17:09:57 -0700
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: display: Add Satoz panel
Message-ID: <20200104000957.GA17750@bogus>
References: <20191224141905.22780-1-miquel.raynal@bootlin.com>
 <20191224141905.22780-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191224141905.22780-2-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 24, 2019 at 03:19:04PM +0100, Miquel Raynal wrote:
> Satoz is a Chinese TFT manufacturer.
> Website: http://www.sat-sz.com/English/index.html
> 
> Add (simple) bindings for its SAT050AT40H12R2 5.0 inch LCD panel.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> 
> Changes since v2:
> * None.
> 
> Changes since v1:
> * New patch
> 
>  .../display/panel/satoz,sat050at40h12r2.yaml  | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/satoz,sat050at40h12r2.yaml

Note that this may become obsolete if we move all simple panels to a 
single schema.

> 
> diff --git a/Documentation/devicetree/bindings/display/panel/satoz,sat050at40h12r2.yaml b/Documentation/devicetree/bindings/display/panel/satoz,sat050at40h12r2.yaml
> new file mode 100644
> index 000000000000..567b32a544f3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/satoz,sat050at40h12r2.yaml
> @@ -0,0 +1,27 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/satoz,sat050at40h12r2#

Missing '.yaml'

Run 'make dt_binding_check' which will check this and other things.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Satoz SAT050AT40H12R2 panel
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +description: |+
> +  LCD 5.0 inch 800x480 RGB panel.

Any public spec for this panel?

> +
> +  This binding is compatible with the simple-panel binding, which is specified
> +  in simple-panel.txt in this directory.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    contains:

Drop 'contains'. It must be exactly the below string, not the below 
string and *any* other strings.

> +      const: satoz,sat050at40h12r2
> +
> +required:
> +  - compatible
> -- 
> 2.20.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
