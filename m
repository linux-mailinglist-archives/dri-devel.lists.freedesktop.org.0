Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5563D602482
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 08:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C5510EE9D;
	Tue, 18 Oct 2022 06:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 448 seconds by postgrey-1.36 at gabe;
 Mon, 17 Oct 2022 14:25:54 UTC
Received: from smtp-out-01.comm2000.it (smtp-out-01.comm2000.it [212.97.32.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C030A10E0A2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 14:25:54 +0000 (UTC)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: francesco@dolcini.it)
 by smtp-out-01.comm2000.it (Postfix) with ESMTPSA id 9411F842856;
 Mon, 17 Oct 2022 16:18:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
 s=mailsrv; t=1666016303;
 bh=byyLB/Q5qvbB+V//B3T1ZZ9p8aVBtWPiYb30AEr4b8g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=RqRaZ3o+OwIT+M71Wbow17+TaQ461unqVxyG4gdfGeCVdjpX5lLpWUVroiT99vedz
 1uBFP/QkCZms1+0DvnyQlXZozedH37I8UUUICG/53fi1J9Fg1mwjCjGEL+ZsJz9zzo
 gOEZ+/gNWZrVEyhxFdG0RVnTDPH9C3nyZn7RUkPAZECEtuMBuDNH5t4wmlBDOFngCI
 9RJt8sjdcRH/grUltkW2n2QXVJfjwvwpsyW5lgECBNgZtKH/qrJqVsDsP/DHuH4TO7
 bFO6jF2+NWubmYpQfjPPmOIQmLK6kEy15LJw6317MQaNH3BSe7YIpRpYtJjFxHMZWk
 JJPgWsSuTp2Zg==
Date: Mon, 17 Oct 2022 16:18:13 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1] drm/panel: simple: set bpc field for logic
 technologies displays
Message-ID: <Y01kJbZjkwo1A8l1@francesco-nb.int.toradex.com>
References: <20220831141622.39605-1-francesco.dolcini@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831141622.39605-1-francesco.dolcini@toradex.com>
X-Mailman-Approved-At: Tue, 18 Oct 2022 06:35:11 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Aishwarya Kothari <aishwarya.kothari@toradex.com>,
 linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 31, 2022 at 04:16:22PM +0200, Francesco Dolcini wrote:
> From: Aishwarya Kothari <aishwarya.kothari@toradex.com>
> 
> In case bpc is not set for a panel it then throws a WARN(). Add bpc to
> the panels logictechno_lt170410_2whc and logictechno_lt161010_2nh.
> 
> Fixes: 5728fe7fa539 ("drm/panel: simple: add display timings for logic technologies displays")

Hello,
just a gently ping on this. It applies cleanly on v6.1-rc1, anything I
should do?

Francesco

