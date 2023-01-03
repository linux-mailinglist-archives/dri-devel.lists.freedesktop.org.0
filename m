Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E791165BB85
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 09:00:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47ADB10E1ED;
	Tue,  3 Jan 2023 08:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FB510E3A5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 08:00:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D030611A1;
 Tue,  3 Jan 2023 08:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3CCFC433EF;
 Tue,  3 Jan 2023 08:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672732821;
 bh=k+5wi5z9frX8sOYIkPjKZiglFoyuOXXDW+MWwVdUbPA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R5FKI09JvGgOigo3vzIz9sHQOHNRub6zl08HPrxrK4Mk6wZRiBo3oWrBdWy8KRAW/
 q+/I8JGXse7e7bZu3gLM25doB8xjp3VIHoSU0fAln4SW/fprJ69Cp2b2SpwnHeh6e0
 J8gRPt5ADquRhLVuRUNUPXoeyuwYy1QrwGJUTRZ+VCI9prDo3CrbLhBIh3fw3lVGqG
 9Egvd0N9upyg0FPnoc58c1KsajFHiV3ELH8L38mu97CFM/LvPF97hrTG0jNozm3k5O
 sa7PT+f9NB6K/0Rxfj5Njc41r5IlYiucbQS4ufFiL/4VoHf0wttmfNTNhCLgvsDpiZ
 roD1MSB6g1BTg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pCcDr-0005fU-JS; Tue, 03 Jan 2023 09:00:35 +0100
Date: Tue, 3 Jan 2023 09:00:35 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH 1/2] drm/panel-edp: fix name for IVO product id 854b
Message-ID: <Y7PgoyhKLKCLvgR8@hovoldconsulting.com>
References: <20221231142721.338643-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221231142721.338643-1-abel.vesa@linaro.org>
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

On Sat, Dec 31, 2022 at 04:27:20PM +0200, Abel Vesa wrote:
> The actual name is R133NW4K-R0.
> 
> Fixes: 0f9fa5f58c784 ("drm/panel-edp: add IVO M133NW4J-R3 panel entry")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
