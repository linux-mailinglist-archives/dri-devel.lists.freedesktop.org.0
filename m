Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C99AA2D51C2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 04:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3646E527;
	Thu, 10 Dec 2020 03:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78676E527
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 03:46:56 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id y24so3654444otk.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 19:46:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sHVoDtmCmY/s7TtdCaLwKYidKDoDMHp/1AUTvPprfnI=;
 b=qWKGGOOczlhJy58HkLniXg/WH74pn1t9FeJWwkLTVmrU5nlkDEAWN0yNulN5cI8kNI
 y+kbKv96ap7I3DIpyX10BrHt9IyBZ9H9pO4kqMxEVmirnu5HedZFMa9FsA8r38TJl/gb
 OlY/w3CwSY1+TQPpczgbkXYWZbWxQkLbWaZZAaVo8KutVKT1apUBwXtB5Z7YCYffOvUe
 BraMGUkfzUNCd6CXjKdSVtw3I+3kpc92Gfrw/ycT1+b+K9L5JvpE4FEyBrCnUNEMHAp2
 PgaER4Ar3ejHJv4iwj3k6krkaXSk02ETwWjhGC2zaXBkm51KfQswsyZwKfiPkJlncQhZ
 zqPA==
X-Gm-Message-State: AOAM531363RcAEsDlKA7JuSLP4G+cm1NF2qbF4fYkxroJF/jzn/HcQh3
 8zgZNYbYwqz/9cDSerdJ9w==
X-Google-Smtp-Source: ABdhPJzWuYu9FVgLu39IVoGiJfqULyAoakhMQ/p22q2ukeNf2GuZ7WnTHG308B8SK2U05TfRG0xBnA==
X-Received: by 2002:a9d:6aca:: with SMTP id m10mr4567204otq.26.1607572016318; 
 Wed, 09 Dec 2020 19:46:56 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x66sm742500oig.56.2020.12.09.19.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 19:46:55 -0800 (PST)
Received: (nullmailer pid 1620662 invoked by uid 1000);
 Thu, 10 Dec 2020 03:46:54 -0000
Date: Wed, 9 Dec 2020 21:46:54 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v7 3/8] dt-bindings: display: simple: Add Kyocera
 tcg070wvlq panel
Message-ID: <20201210034654.GA1620633@robh.at.kernel.org>
References: <20201207140939.31297-1-o.rempel@pengutronix.de>
 <20201207140939.31297-4-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201207140939.31297-4-o.rempel@pengutronix.de>
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
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 David Jander <david@protonic.nl>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 07 Dec 2020 15:09:34 +0100, Oleksij Rempel wrote:
> So far, this panel seems to be compatible with "lg,lb070wv8", on other
> hand it is better to set this compatible in the devicetree. So, let's
> add it for now only to the dt-binding documentation to fix the
> checkpatch warnings.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
