Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DDE2D51C0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 04:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103056E3C6;
	Thu, 10 Dec 2020 03:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F936E3C6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 03:46:00 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id w3so3631641otp.13
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 19:46:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VQx7yjIF6t40nyTfvDutQravU0D0XLMrI7K2WmuirR4=;
 b=IX/zHDglqLN3tDNOXXJbue+osdBo8OrN8fTHZ998OIpeqAnZ69P5fbN8jKkk1USdeb
 ChRmF5KMmqvJQ2AAlUfFg47wAo7AfJogwtL9Vgdu5vtICL56OTOsKzlapkQvQHrUql4F
 YXuEI0rvgNdfaYAwhUIYt/2FltKGRC6R74LQsXevGImHhB4ah3Wra4vgx3zJqypwywxY
 njsLY8QmaFpdqya4JaxoPGkL1ImYloEp5xIzIKSNWwbrWS8wDMzTc0PFfy1WalmFFvic
 Aa1Fppvswys6Di7hIjerWuslACvPUadmIXU5TWQEX7PsgMnfvZm08m6zaUwhEjpHOQEK
 D3CQ==
X-Gm-Message-State: AOAM533AojFDbaXJv4bLyFjCNZhwU3utBO4tNhuoUq9k/fufxrHEuvaV
 Vd92pDISHrl4q0regzMF5w==
X-Google-Smtp-Source: ABdhPJy3qhbxYjqjVBYxRWhar+RAWhvyTk9oVKbpg0DqpYbLOcvv/6x9snENh+uiP+/YUwc4bsosKA==
X-Received: by 2002:a05:6830:128a:: with SMTP id
 z10mr4537702otp.3.1607571959738; 
 Wed, 09 Dec 2020 19:45:59 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b82sm745563oif.49.2020.12.09.19.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 19:45:58 -0800 (PST)
Received: (nullmailer pid 1619256 invoked by uid 1000);
 Thu, 10 Dec 2020 03:45:57 -0000
Date: Wed, 9 Dec 2020 21:45:57 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v7 1/8] dt-bindings: display: simple: fix alphabetical
 order for EDT compatibles
Message-ID: <20201210034557.GA1619207@robh.at.kernel.org>
References: <20201207140939.31297-1-o.rempel@pengutronix.de>
 <20201207140939.31297-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201207140939.31297-2-o.rempel@pengutronix.de>
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
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Jander <david@protonic.nl>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 07 Dec 2020 15:09:32 +0100, Oleksij Rempel wrote:
> Reorder it alphabetically and remove one double entry.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../bindings/display/panel/panel-simple.yaml       | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
