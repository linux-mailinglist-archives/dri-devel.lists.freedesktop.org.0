Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC122EACE0
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:51:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF136EE0C;
	Thu, 31 Oct 2019 09:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEB36EE0C
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 09:51:38 +0000 (UTC)
Received: from localhost (lns-bzn-32-82-254-4-138.adsl.proxad.net
 [82.254.4.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7AF292086D;
 Thu, 31 Oct 2019 09:51:37 +0000 (UTC)
Date: Thu, 31 Oct 2019 10:51:03 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v2] drm: sun4i: Add support for suspending the display
 driver
Message-ID: <20191031095103.jmuwbyr6eqa4kuru@hendrix>
References: <20191029112846.3604925-1-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191029112846.3604925-1-megous@megous.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572515498;
 bh=EBq3RU5D0YquRdZnknO4EAQ5B1wcu4KvtBhrbZq1/Lg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tPXFrhI+s4MOrEa4toxMkWxb6Qtf1u6r/MeGQeFqYFISb6DMbt7UG1ZQXowz+TaOU
 5jGhmMZp1jMa5/h6us1kUe/VyWdVh0cTUSL51O/wiTwbSAqlfQJrjWeOBz1l2GHY4/
 ygZUa8NAGPivshS+StO2xHlg1o3K2tau6FKA+yeA=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 linux-sunxi@googlegroups.com,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMTI6Mjg6NDZQTSArMDEwMCwgT25kcmVqIEppcm1hbiB3
cm90ZToKPiBTaHV0IGRvd24gdGhlIGRpc3BsYXkgZW5naW5lIGR1cmluZyBzdXNwZW5kLgo+Cj4g
U2lnbmVkLW9mZi1ieTogT25kcmVqIEppcm1hbiA8bWVnb3VzQG1lZ291cy5jb20+CgpBcHBsaWVk
LCB0aGFua3MKCk1heGltZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
