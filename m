Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BAC65BBA7
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 09:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC0610E3A4;
	Tue,  3 Jan 2023 08:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A073510E3A2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 08:13:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 22F87611DD;
 Tue,  3 Jan 2023 08:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B67EC433D2;
 Tue,  3 Jan 2023 08:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672733616;
 bh=sLn9Vawha9eeWYWakB4rqMAL1SntsgdKCm3hJXFVaYk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t0vlRB6oMyuI9i58WGrpDb1D7p4UfDmmuYeCqyalKmLeuqtQeIuWLrPUiX8XFa9UZ
 Bqhxe1KM7cg0TT4FGjwbg0kZuqJ3kUGIVBZutS+1Mgw7jOhkS03vNkziaBpXvOHfJa
 GnLOTPrmfjlfgc1FpN40X0TGKb/fhDXpwWR90B0aaG4xWtgmNy8FeTe3QdE81V4nNT
 jhKtZdmVUYsG1FoA+LhZZO02bCnBKH4PE/QUvaGTTCWi8CHiZYEb01Eax1VVhnjlDk
 cYQcaaA6OTkcbcJxrvZWU9car6HG5ShjM0i2kcJ1ASlZRFWDoxkVYJySNMzV9ICS3H
 eFsblgRuHrJcA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pCcQl-0005q4-QA; Tue, 03 Jan 2023 09:13:55 +0100
Date: Tue, 3 Jan 2023 09:13:55 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel-edp: add IVO M133NW4J panel entry
Message-ID: <Y7Pjwxo34MJDr01+@hovoldconsulting.com>
References: <20221231142721.338643-1-abel.vesa@linaro.org>
 <20221231142721.338643-2-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221231142721.338643-2-abel.vesa@linaro.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>,
 Steev Klimaszewski <steev@kali.org>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 31, 2022 at 04:27:21PM +0200, Abel Vesa wrote:
> Add an eDP panel entry for IVO M133NW4J.
> 
> Due to lack of documentation, use the delay_200_500_p2e100 timings like
> some other IVO entries for now.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
