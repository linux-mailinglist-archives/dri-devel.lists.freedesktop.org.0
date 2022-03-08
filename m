Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3124D1F27
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 18:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D25C10E2E1;
	Tue,  8 Mar 2022 17:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B897810E4EE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 17:31:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 01C2EB81BA6;
 Tue,  8 Mar 2022 17:31:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C025C340EB;
 Tue,  8 Mar 2022 17:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1646760682;
 bh=DPaHHODJw37ZjDh+BSPlItIzqNKqgIIACjIGnEaa5a8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EdjAvS9vBfEV6MfOfeSOjtG1h8Mgq0tbFDNqJx7NqMxTpChlWhrRZFiSrMPOqreag
 QhMlMJ80iK5EhoB9ZFgNOBx7aQfnRO6ynrvrdhFWohCv0yVoZT4VpqAT3oZObYR7Pp
 +ne6782yQqgOsDCxhTcvP0t8UPL7Sp5KTr43trDc=
Date: Tue, 8 Mar 2022 18:31:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH] drm/mgag200: Fix PLL setup for g200wb and g200ew
Message-ID: <YieS530V0nGYydGa@kroah.com>
References: <20220308171111.220557-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220308171111.220557-1-jfalempe@redhat.com>
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
Cc: stable@vger.kernel.org, michel@daenzer.net, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 08, 2022 at 06:11:11PM +0100, Jocelyn Falempe wrote:
> commit f86c3ed55920ca1d874758cc290890902a6cffc4 ("drm/mgag200: Split PLL
> setup into compute and update functions") introduced a regression for
> g200wb and g200ew.

No need for all those digits in the sha1, see below:

> The PLLs are not set up properly, and VGA screen stays
> black, or displays "out of range" message.
> 
> MGA1064_WB_PIX_PLLC_N/M/P was mistakenly replaced with
> MGA1064_PIX_PLLC_N/M/P which have different addresses.
> 
> Patch tested on a Dell T310 with g200wb
> 
> Fixes: f86c3ed55920ca1d874758cc290890902a6cffc4

As per the documentation that line should read:

Fixes: f86c3ed55920 ("drm/mgag200: Split PLL setup into compute and update functions")

thanks,

greg k-h
