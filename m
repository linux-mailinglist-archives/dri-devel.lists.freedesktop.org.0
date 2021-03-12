Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7770339CA8
	for <lists+dri-devel@lfdr.de>; Sat, 13 Mar 2021 08:55:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9F36E0C8;
	Sat, 13 Mar 2021 07:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2141 seconds by postgrey-1.36 at gabe;
 Fri, 12 Mar 2021 15:38:30 UTC
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6BBDF6E158
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 15:38:30 +0000 (UTC)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1lKjJN-0002Tu-01; Fri, 12 Mar 2021 16:02:45 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 4C6A6C2118; Fri, 12 Mar 2021 16:00:28 +0100 (CET)
Date: Fri, 12 Mar 2021 16:00:28 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2] MIPS: ingenic: gcw0: SPI panel does not require
 active-high CS
Message-ID: <20210312150028.GB3743@alpha.franken.de>
References: <20210307192830.208245-1-paul@crapouillou.net>
 <20210307192830.208245-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210307192830.208245-2-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 13 Mar 2021 07:54:56 +0000
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
Cc: devicetree@vger.kernel.org, od@zcrc.me, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 07, 2021 at 07:28:30PM +0000, Paul Cercueil wrote:
> The NT39016 panel is a fun beast, even though the documentation states
> that the CS line is active-low, it will work just fine if the CS line is
> configured as active-high, but it won't work if the CS line is forced
> low or forced high.
> 
> Since it did actually work with the spi-cs-high property, this is not a
> bugfix, but we should nonetheless remove that property to match the
> documentation.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/boot/dts/ingenic/gcw0.dts | 1 -
>  1 file changed, 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
