Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D8160679D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 20:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F6010E151;
	Thu, 20 Oct 2022 18:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8FF10E151
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 18:00:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6B52B61B4B;
 Thu, 20 Oct 2022 18:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB06BC433D6;
 Thu, 20 Oct 2022 18:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1666288836;
 bh=D5JDtraM5oIqlp1dCkevIC+UUF5W0hIt1BS/GoCJUhw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hBxVwrpRUwXLcGlGrs4pHE6jkQaNzQZgQLZEb91y8x+DqmP86tLnf26MnJrWgEPrc
 9P4kLjae8qwgiAmiDKbk+aRYQelbJRAGmn2jKEeTyuC7ub21Q+5SYzdexhaTCmg8sv
 XK+HYIokFikQ1+WQ1wTO1fGzlm8qVz77h+dz4A/w=
Date: Thu, 20 Oct 2022 20:00:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Subject: Re: [PATCH v4 01/10] gna: add PCI driver module
Message-ID: <Y1GMwP1OUlhwAp03@kroah.com>
References: <20221020133525.1810728-1-maciej.kwapulinski@intel.com>
 <20221020133525.1810728-2-maciej.kwapulinski@intel.com>
 <Y1FcCDhWiQG2p3wW@kroah.com>
 <f3e777c5-c61c-4820-83dd-9bc33932e9c8@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3e777c5-c61c-4820-83dd-9bc33932e9c8@linux.intel.com>
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
 David Airlie <airlied@linux.ie>, Dragan Cvetic <dragan.cvetic@xilinx.com>,
 linux-doc@vger.kernel.org, Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 06:11:49PM +0200, Maciej Kwapulinski wrote:
> 
> On 10/20/2022 4:32 PM, Greg Kroah-Hartman wrote:
> > On Thu, Oct 20, 2022 at 03:35:16PM +0200, Kwapulinski, Maciej wrote:
> >> Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
> >> This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.
> > This ensures that we can not do anything with these patches.
> >
> > Now deleted.
> >
> > greg k-h
> 
> 
> indeed,
> 
> sorry about that. When I'm done with smtp server footer I'll send 'PATCH v5' unless you have other suggestion for best practice in this case.

I am not even allowed to look at any of this at the moment with that
footer.  Actually I wasn't even supposed to tell you this, I should have
been forced to just delete it and move on to contributions that don't
have legal entraptments in them :(

greg k-h
