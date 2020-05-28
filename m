Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3022C1E6BCB
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 21:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08AA6E202;
	Thu, 28 May 2020 19:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279EF6E202
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 19:59:17 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id d5so22013117ios.9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 12:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kknKsSMTJoI8gmLeG3qit6ojGRVqNCU1BTs8KXTSykU=;
 b=Z/rYuIz6sfhclyFDF5Ld7mMGNp2IpjWNgaQvRJPMeq6jrcg3pKWDtBtkv68KK0s3+K
 ercZfWqG6UmHdefZxR/NrIA8IiV8eRfZ43PfCqd4xxiJLlLuFwv/o9LR5zBbU+KMEC/B
 uz0fvz8waNp1lV2a0DUO0IOFHtCwwDLSCrpVZVqwJEGDjiEQ4WVNcWMQonY+7Af4FVt4
 Kys7n3lcacWIGAlqTU7P5FEry2eAcYhgXFVUZZxBP1L6rqqxvDdW1MEBkaxnBcDSn3aL
 rr/RQXkc61Vngu8JMPoM/h/oTck3XlL4cHt1Fpe4eTBOfNkSmUit1sqxuGHcY6uSiSC0
 gXIA==
X-Gm-Message-State: AOAM532etekBdOGPKOuOFRBHzoxyfz3zJF04BqLuV3ewvUTmVMmVyGoV
 Qsfq7bIylM4B1aCVYajGDg==
X-Google-Smtp-Source: ABdhPJxIPzW5HlNlbXXVKKRYIMx6e5UuSWAm/HfNNltKTsPfZADYYFbEPTL1adrf1g+L4+tiTXXJjw==
X-Received: by 2002:a6b:8b51:: with SMTP id n78mr3726080iod.120.1590695956580; 
 Thu, 28 May 2020 12:59:16 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id h28sm3829573ild.53.2020.05.28.12.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 12:59:16 -0700 (PDT)
Received: (nullmailer pid 583331 invoked by uid 1000);
 Thu, 28 May 2020 19:59:14 -0000
Date: Thu, 28 May 2020 13:59:14 -0600
From: Rob Herring <robh@kernel.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [RFC PATCH 3/6] dt-bindings: display/bridge/nwl-dsi: Drop mux
 handling
Message-ID: <20200528195914.GB568887@bogus>
References: <cover.1589548223.git.agx@sigxcpu.org>
 <9884c56219e9bdbeec179c27ea2b734dbb5f1289.1589548223.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9884c56219e9bdbeec179c27ea2b734dbb5f1289.1589548223.git.agx@sigxcpu.org>
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Anson Huang <Anson.Huang@nxp.com>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>,
 Leonard Crestez <leonard.crestez@nxp.com>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 15, 2020 at 03:12:12PM +0200, Guido G=FCnther wrote:
> No need to encode the SoC specifics in the bridge driver. For the
> imx8mq we can use the mux-input-bridge.

You can't just change bindings like this. You'd still have to support =

the "old" way. But IMO, this way is the right way.

> =

> Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> ---
>  .../devicetree/bindings/display/bridge/nwl-dsi.yaml         | 6 ------
>  1 file changed, 6 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
