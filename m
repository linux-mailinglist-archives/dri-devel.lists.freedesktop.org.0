Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBAE1DA84E
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 04:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84576E3C1;
	Wed, 20 May 2020 02:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEC16E3C1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 02:57:39 +0000 (UTC)
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1D0F220842;
 Wed, 20 May 2020 02:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589943459;
 bh=wpjWTi9IWHiTI6IlVkaz+MdgzSdiyTPoZEbvWwHe4QE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nmKDjrM7rL860w0rI/ucgoamwlQ5v/haCm9TTD2QdDZNsVxlkDcHKGC8mWJMC+gS+
 xS4zFCX0quziyme6rerUCa3g/slNg9X2yGkG9mTQj37fjbZGjQNmLS4Rxea0NTPJ+y
 ltzFm0le4W8lvxu4NG6dgoBTuQfWsVU9k8EbXtc4=
Date: Wed, 20 May 2020 10:57:33 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Subject: Re: [PATCH v2 2/4] ARM: dts: ims53: Group port definitions for the
 dvi-converter
Message-ID: <20200520025732.GX11739@dragon>
References: <20200514143612.2094-1-ricardo.canuelo@collabora.com>
 <20200514143612.2094-3-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514143612.2094-3-ricardo.canuelo@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, tomi.valkeinen@ti.com,
 Laurent.pinchart@ideasonboard.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 04:36:10PM +0200, Ricardo Ca=F1uelo wrote:
> Group the port definitions of the dvi-converter in a 'ports' node to
> make it compliant with the ti,tfp410 binding.
> =

> Signed-off-by: Ricardo Ca=F1uelo <ricardo.canuelo@collabora.com>

s/ims53/imx53-cx9020 in subject.

I fixed it up and applied the patch.

Shawn
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
