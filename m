Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126D32862F9
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 18:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECC56E0DD;
	Wed,  7 Oct 2020 16:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E558F6E0DD
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 16:01:30 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id w141so2997115oia.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 09:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Axwk9GoxRz4cVaj0ajd90BMmeePspqdRR76uedy1D64=;
 b=EfSd/arsLLFPHxsQd1ZTDOxbZ6LSJNZyKPMYHZUgcS4NQsyjX964oHwfd05xNeEmY9
 ANaxM9AbdeZ01P/bBg9aHiFz3zUPhUA5uF1AkAaNMuB0g3OkNliOtjvAmdtv8UqdT20W
 yYnYqtxej3nClDHQrfGRz53brynrBCdvjaiQttUV1f4i41RMgiKsfGfDaQGAuig+ZA6b
 +CyixvMBw08WbSjAD6X+j2wkx2uWn4qq6Hn4E9e+lHLXGYfMIzA3YgF7UzBRh53p0vf6
 Y4+mjCjvKn+nLd8IMJF53xu+Q0sFX8B3m1bWNItoKG/UmS3yvlTL8P8MWsifvl4SZ4Gm
 r6LA==
X-Gm-Message-State: AOAM531jHwB1UZcB/buOsWpyoS+qSfH/uxMpH3mjBAgdS43fouz3/3y/
 60nklUHoYxuukloCQ5HGMg==
X-Google-Smtp-Source: ABdhPJzIaAxOFImu6KIcREPogpBm7IpydCMinXp9HgSwRPyqWBrai4uXEJMCCsYNy9azaDeTVrarVg==
X-Received: by 2002:aca:35c6:: with SMTP id c189mr2183759oia.171.1602086490266; 
 Wed, 07 Oct 2020 09:01:30 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t5sm1809907otl.22.2020.10.07.09.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 09:01:29 -0700 (PDT)
Received: (nullmailer pid 299118 invoked by uid 1000);
 Wed, 07 Oct 2020 16:01:28 -0000
Date: Wed, 7 Oct 2020 11:01:28 -0500
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: display: mxsfb: Add and fix
 compatible strings
Message-ID: <20201007160128.GA299084@bogus>
References: <20201007012438.27970-1-laurent.pinchart@ideasonboard.com>
 <20201007012438.27970-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201007012438.27970-3-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 07 Oct 2020 04:24:33 +0300, Laurent Pinchart wrote:
> Additional compatible strings have been added in DT source for the
> i.MX6SL, i.MX6SLL, i.MX6UL and i.MX7D without updating the bindings.
> Most of the upstream DT sources use the fsl,imx28-lcdif compatible
> string, which mostly predates the realization that the LCDIF in the
> i.MX6 and newer SoCs have extra features compared to the i.MX28.
> 
> Update the bindings to add the missing compatible strings, with the
> correct fallback values. This fails to validate some of the upstream DT
> sources. Instead of adding the incorrect compatible fallback to the
> binding, the sources should be updated separately.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> Changes since v1:
> 
> - Fix indentation under enum
> ---
>  .../devicetree/bindings/display/fsl,lcdif.yaml | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
