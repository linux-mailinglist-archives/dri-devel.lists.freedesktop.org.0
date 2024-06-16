Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C139909AE6
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2024 03:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BA310E072;
	Sun, 16 Jun 2024 01:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="YBijmTXK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8782810E072
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2024 01:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:To:From:Date:From:Sender:Reply-To:Subject:Date:
 Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=UgZuhckA4p+XwquMniU0ZCZJXZSNdwe4LEu1KmZDzzs=; b=YBijmTXKln3H3WysHSl6eFQTvD
 7NaOk9ZOZy5kH+fiH+AMkgIz6sNg3F33/VkFmT+mWseBh7K9zbJlOrTEKaQJ9iJSZ3M1SYF8lo87l
 Eh63XcYpyTDKl2704V+B8ZYDurmvMSwsSMSTXvFONCG64FRhoc34ENeld5usSdE5fnQ0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sIeJw-0009pt-MD; Sun, 16 Jun 2024 03:04:36 +0200
Date: Sun, 16 Jun 2024 03:04:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Joe Damato <jdamato@fastly.com>, Omer Shpigelman <oshpigelman@habana.ai>,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ogabbay@kernel.org, zyehudai@habana.ai
Subject: Re: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Message-ID: <990a55b5-4a98-47bb-bea6-9b85f061a788@lunn.ch>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-10-oshpigelman@habana.ai>
 <ZmzIy3c0j8ubspIM@LQ3V64L9R2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmzIy3c0j8ubspIM@LQ3V64L9R2>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 14, 2024 at 03:48:43PM -0700, Joe Damato wrote:
> On Thu, Jun 13, 2024 at 11:22:02AM +0300, Omer Shpigelman wrote:
> > This ethernet driver is initialized via auxiliary bus by the hbl_cn
> > driver.
> > It serves mainly for control operations that are needed for AI scaling.
> > 
> > Signed-off-by: Omer Shpigelman <oshpigelman@habana.ai>
> > Co-developed-by: Abhilash K V <kvabhilash@habana.ai>
> > Signed-off-by: Abhilash K V <kvabhilash@habana.ai>
> > Co-developed-by: Andrey Agranovich <aagranovich@habana.ai>
> > Signed-off-by: Andrey Agranovich <aagranovich@habana.ai>
> > Co-developed-by: Bharat Jauhari <bjauhari@habana.ai>
> > Signed-off-by: Bharat Jauhari <bjauhari@habana.ai>
> > Co-developed-by: David Meriin <dmeriin@habana.ai>
> > Signed-off-by: David Meriin <dmeriin@habana.ai>
> > Co-developed-by: Sagiv Ozeri <sozeri@habana.ai>
> > Signed-off-by: Sagiv Ozeri <sozeri@habana.ai>
> > Co-developed-by: Zvika Yehudai <zyehudai@habana.ai>

Hi Joe

Please trim emails to include just the relevant context when
replying. It is hard to see your comments, and so it is likely some
will be missed, and you will need to make the same comment on v2.

     Andrew
