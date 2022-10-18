Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F357760363A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 00:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB97210F046;
	Tue, 18 Oct 2022 22:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC32C10F046
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 22:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xZx5U1KPGs1YdNHVe2U2LdloGm6+MGS2R5epmoT+tY4=; b=hT+7dfCYBEV/CtN83gk4tJ1Wmm
 c42EbKLXhm+J9niqSYbfSqHq7bWqnavNX9OtoE1+E98BUnAiEUr4boVjO+aA9a99/PBW45yqRRjeu
 6OW2wracyNo2v9PcUioh1zK2EqSL5MuYxmQ9Dhe31l94XzxlM5W3yEX65dqaCsGVmcGUHjN1Jh32K
 xOFNbi9wdqPxwgLUU/haanF9r2mi8oQSGWdsbaKyD/js1ewsvrq8VJIPs/FkxITBmA3Qsunqlhe6v
 +byeSrnQuxf/DDibYRmtC6w81AwnUpo2aLa9yDWj20pys3psBc1Rwf5hRKjeju6llbOwdJPHtIGL8
 bNAunh1g==;
Received: from [2a01:799:95a:cb00:cc2f:df30:b81e:38c0] (port=53772)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1okvNU-0004Fd-4f; Wed, 19 Oct 2022 00:48:04 +0200
Message-ID: <760f8dc6-3bd9-d63a-37e1-c9e472c09285@tronnes.org>
Date: Wed, 19 Oct 2022 00:48:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 0/2] drm/tiny: add support tft display based on
 ilitek,ili9488
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
References: <20221018164532.1705215-1-tommaso.merciai@amarulasolutions.com>
 <544c35c3-d87f-30e7-5f6b-a64ab7f894ec@tronnes.org>
 <CAOf5uwnP+hc+hDKwQJq9HZ03hHXwwCWw3HE0-W16jF3WkKuHXA@mail.gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <CAOf5uwnP+hc+hDKwQJq9HZ03hHXwwCWw3HE0-W16jF3WkKuHXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 linuxfancy@googlegroups.com, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, kamlesh.gurudasani@gmail.com,
 linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 18.10.2022 23.28, skrev Michael Nazzareno Trimarchi:
> Hi
> 
> On Tue, Oct 18, 2022 at 9:06 PM Noralf Trønnes <noralf@tronnes.org> wrote:
>>
>>
>>
>> Den 18.10.2022 18.45, skrev Tommaso Merciai:
>>> Hi All,
>>> This series  support for ilitek,ili9488 based displays like
>>> Waveshare-ResTouch-LCD-3.5 display. Tested on Waveshare-ResTouch-LCD-3.5
>>> connected to px30-evb via SPI.
>>
>> There's a generic MIPI DBI SPI driver now that should work with all
>> these panels: drivers/gpu/drm/tiny/panel-mipi-dbi.c
>>
>> More info: https://github.com/notro/panel-mipi-dbi/wiki
>>
> 
> We have seen it but it does not apply to the color output and there is
> no helper. I was a bit surprised
> to have a generic panel for spi and not for standard mipi one.
> 

Yeah, you're right the generic driver doesn't support rgb666 I assumed
it was rgb565.

Noralf.
