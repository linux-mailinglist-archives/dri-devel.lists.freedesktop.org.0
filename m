Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD9D606EC9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 06:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE89110E589;
	Fri, 21 Oct 2022 04:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847E910E589
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 04:16:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8F374B8267C;
 Fri, 21 Oct 2022 04:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBBD2C433D7;
 Fri, 21 Oct 2022 04:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1666325800;
 bh=V44Fb37Gk/IRATv2q8lccI9uCOsN0rpz6zMLSHqgP/E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BywAWAlmCCAghEX2A8uiz0CFjf0AcST7LkHu7DnOAWh438XupNzsXdPLvJc638VjU
 ubvbKsYsOwp5Fv9zq5XQLLtnOyanxhRmL7Ng6n2NS5P7AGldxvq2ImiHGLDXF9jfPG
 SJZyNNYLTtXRIeaADz7AGKxYi+rI2mMm+w3+KobY=
Date: Fri, 21 Oct 2022 06:17:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Subject: Re: [PATCH v5 00/10] Driver of Intel(R) Gaussian & Neural Accelerator
Message-ID: <Y1IdWVSgWhHZJ78X@kroah.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Kiernan <derek.kiernan@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 07:53:24PM +0200, Maciej Kwapulinski wrote:
> Dear kernel maintainers,

<snip>

This really is v6, not v5, right?  Why send 2 v5 out?

greg k-h
