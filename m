Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E98604F13
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 19:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A088010E3A4;
	Wed, 19 Oct 2022 17:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 457 seconds by postgrey-1.36 at gabe;
 Wed, 19 Oct 2022 17:42:23 UTC
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADB710E36A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 17:42:23 +0000 (UTC)
Received: from darkstar.musicnaut.iki.fi (85-76-8-144-nat.elisa-mobile.fi
 [85.76.8.144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: aaro.koskinen)
 by meesny.iki.fi (Postfix) with ESMTPSA id 6C68C205A6;
 Wed, 19 Oct 2022 20:34:39 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
 t=1666200880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gIG98sURNpqYREMByDWj4WJbfZaVepdUxI0t705Dn24=;
 b=woiIGA7CBhVDCbqWL3ENjdTY8ljs/hXL9GUXVqyjFDRzgEwnu3SVbMH5801mKj1q+zd+UP
 N8rZe/AK3Sfp7582bAFaZBDbbHjgUGyyATnri0WDt2Xc+egBIbWWIKEjYKFdAGUncOPmQE
 +nOwqfjDcO4y1VYws8vGoHQ+SA/A2to=
Date: Wed, 19 Oct 2022 20:34:37 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 14/17] ARM: omap1: remove dead code
Message-ID: <20221019173437.GB41568@darkstar.musicnaut.iki.fi>
References: <20221019144119.3848027-1-arnd@kernel.org>
 <20221019150410.3851944-1-arnd@kernel.org>
 <20221019150410.3851944-14-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019150410.3851944-14-arnd@kernel.org>
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1666200880; a=rsa-sha256; cv=none;
 b=I/pBm0aTzCNCuLzHN+MVr6kleAVil0QyuIhK/c2YWJJr+BvybOpZ58a/l4FP0KbR0/NBPv
 Ic8ehOpxamVv3kgysU1E9+j1nDAFiOiDoVrwmi6Rqr2BPo59v4GrJMCmgerqovuv5t8+8K
 qwvvucjEMGPxjNOYrMLoyFq1Ebao1EM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=meesny; t=1666200880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gIG98sURNpqYREMByDWj4WJbfZaVepdUxI0t705Dn24=;
 b=Whocu0i/zmCyeCVGAmHY1hls48Sp7JYvAxZLb/yypsH236nuxpWrTHSMBrzQpgp30xSXZQ
 fzjgRMTOc1KsGUITFPPPcjB4pzIqxl+ByucCf1NgsAuFJf+AA2aYX9LBBE/skOPLtfnFi7
 iwPCUqDnzXGIFdpaXoN0ArUtBtc2QAY=
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
Cc: Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
 Tony Lindgren <tony@atomide.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-usb@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Bin Liu <b-liu@ti.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Oct 19, 2022 at 05:03:36PM +0200, Arnd Bergmann wrote:
>  drivers/usb/phy/phy-isp1301-omap.c | 91 +-----------------------------

This driver and config option ISP1301_OMAP can be deleted altogether as
there are no users after H2/H3 boards are gone.

A.
