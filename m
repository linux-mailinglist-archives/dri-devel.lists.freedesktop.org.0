Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0B150BFDC
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 20:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C7810E56E;
	Fri, 22 Apr 2022 18:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1AA10E5C3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 18:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=PkguJqeBEyMKhqwQulbiLoFk0aER6o7bTdo43bG/JKE=;
 b=HjTvdg2PUxqeH/PkcfusddnuJJ/8PL3TKzXJ86S3IESI/DheIpnPiDs+9pEeeHImYPa2AJKUEMd54
 jx5cyEHTqszCHWp5sYzOzUMivWdqKm1muwvIV5dYIkF14QBYhd94jJCFnElNsxe4o4okTXpFHfIwhk
 ziyL4TjRP/vDGOCfv77h9ER0B44tmVuEy9XfgevLHVMxf1J83kBcAvjJ5ZRhE7JlF34wHZ058OBVKS
 OLKrKfVXDHyBYcHmoIHj/oiWIGygDEz5bhqjdOlaFDTc+AiUAAls2SDBDcPXDkKXtnEotTFYZL91vO
 76RlCDYK9h5/4prmzLr84vi+cZkrApQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=PkguJqeBEyMKhqwQulbiLoFk0aER6o7bTdo43bG/JKE=;
 b=ntPn4gsSxKDEYKmRP2jeEPv0mvqQfgcTDpecUb4Suy4BIZ6DwNTND10WSQlKhaZvKTOl+fjP64nkM
 0O+MtNMDw==
X-HalOne-Cookie: b3cee4e4dfd863c7fcba000a15e8c7bbbf72f292
X-HalOne-ID: 5a4e8db1-c26b-11ec-be69-d0431ea8bb03
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 5a4e8db1-c26b-11ec-be69-d0431ea8bb03;
 Fri, 22 Apr 2022 18:38:07 +0000 (UTC)
Date: Fri, 22 Apr 2022 20:38:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: simple: Add Startek
 KD070WVFPA043-C069A panel support
Message-ID: <YmL2DoyKYsAIXzVA@ravnborg.org>
References: <20220422183614.1762470-1-festevam@gmail.com>
 <20220422183614.1762470-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422183614.1762470-2-festevam@gmail.com>
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
Cc: Fabio Estevam <festevam@denx.de>, devicetree@vger.kernel.org,
 robh+dt@kernel.org, hs@denx.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 22, 2022 at 03:36:14PM -0300, Fabio Estevam wrote:
> From: Heiko Schocher <hs@denx.de>
> 
> Add Startek KD070WVFPA043-C069A 7" TFT LCD panel support.
> 
> Signed-off-by: Heiko Schocher <hs@denx.de>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
