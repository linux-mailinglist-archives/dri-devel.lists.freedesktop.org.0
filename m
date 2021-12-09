Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A9546EED6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BCB10E9FE;
	Thu,  9 Dec 2021 16:53:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0856589FF6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 12:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1639052644; x=1670588644;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MAK4o+PK3ziY28c7nROFdQy4/tjx0fQJIR78lzQYWjY=;
 b=jc+8Qc3CcWuxfmn/FmFGwu0S5pgvWL2u/w0L2V2URmbwcKKE/tG/dogo
 7hUrKgYoKZ92BHE5MeDSv+s9wgwLLpr4s7i5vJrtS+52Wa4pKNCtNBSr5
 SDlKpjEqTzllZgJkwSjxJcVpzKg/fA92zapqItaIU47jVycWN66kX3hHw
 mPCHBcOk9yusZTzrWKs8F2iai7Lq/WCHYY0MLD8mEMn7ptf3DXdu2gYZV
 tgoAh/gHm7Iw55fiY27b7pF00bgAsNWAjP7LO7vix27cwNEbsQJesHKT2
 nurSgPLrX2bbdtJ7FQpI/bZ3Et0LRVinSk9tzfpMtxEe+P3pNjCqYyd+K g==;
X-IronPort-AV: E=Sophos;i="5.88,192,1635199200"; d="scan'208";a="20954244"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 09 Dec 2021 13:24:01 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 09 Dec 2021 13:24:01 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 09 Dec 2021 13:24:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1639052641; x=1670588641;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MAK4o+PK3ziY28c7nROFdQy4/tjx0fQJIR78lzQYWjY=;
 b=RKyd6IAZImR6Z50zX3A9Wj+DJgOEJQAyGW2CMUNCKFTTNLwKJTYfZyxF
 qxPVm2kFTMDX6tMlddDI2x3QtyQwHRuQvScYfvSryx/un4JWAeyaKeCx4
 XSoc3q39FjZVdV1bWlTFsyW53a0B8XcFiIfgC4ePCP0OzigRfYs3oNcHs
 UUoSaDHB57rUBU7AlHMpbZZkSedxKlIIguX5B9HGWWbmprWFP6jl7OP2m
 1+euglSA9wXL0EJosyMst93GVj5G9HTx5rsVNQRCwD0g+zpgt8rrYwBS2
 FOYFlqxGAfOIBcPU/AjOHGDJdOSYVU2mCu467XruTZLT8ZAKBh08vwaf6 g==;
X-IronPort-AV: E=Sophos;i="5.88,192,1635199200"; d="scan'208";a="20954243"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 09 Dec 2021 13:24:01 +0100
Received: from steina-w (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E5B5F280065;
 Thu,  9 Dec 2021 13:24:00 +0100 (CET)
Message-ID: <802891a3e0ddf2ce833a269df7c43f12614988b7.camel@ew.tq-group.com>
Subject: Re: (EXT) Re: [PATCH v4 1/4] dt-bindings: display: bridge:
 sn65dsi83: Make enable GPIO optional
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 09 Dec 2021 13:23:58 +0100
In-Reply-To: <CAMty3ZA7d9bSvmG4nGd9Lncw9wm6wiAq1pKSOFX03h_BU7JR-A@mail.gmail.com>
References: <20211118091955.3009900-1-alexander.stein@ew.tq-group.com>
 <20211118091955.3009900-2-alexander.stein@ew.tq-group.com>
 <CAMty3ZA7d9bSvmG4nGd9Lncw9wm6wiAq1pKSOFX03h_BU7JR-A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, dem 09.12.2021 um 12:37 +0530 schrieb Jagan Teki:
> On Thu, Nov 18, 2021 at 2:50 PM Alexander Stein
> <
> alexander.stein@ew.tq-group.com
> > wrote:
> > From: Laurent Pinchart <
> > laurent.pinchart@ideasonboard.com
> > >
> > 
> > The SN65DSI8x EN signal may be tied to VCC, or otherwise controlled
> > by
> > means not available to the kernel. Make the GPIO optional.
> 
> Sorry, I couldn't understand what it means. Does it mean VCC enabled
> designs no need to enable GPIO? I've a design that do support both EN
> and VCC.

The patches 1 & 2 are only about the "enable" gpio for the bridge, it's
unrelated to the VCC regulator introduced in patch 3 & 4.
Maybe the commit message should say:
> The SN65DSI8x EN signal may be hard-wired to VCC, or otherwise
controlled[...]
But I copied the message from bbda1704fc15 ("drm/bridge: ti-sn65dsi86:
Make enable GPIO optional").

This is for use-cases where there is no GPIO the kernel can use, to
control the EN pad of the bridge. Thus make this gpio optional in
bindings and driver.

HTH
Alexander

