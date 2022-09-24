Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 190E85E8C20
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 14:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93EB10E18F;
	Sat, 24 Sep 2022 12:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C8110E18F;
 Sat, 24 Sep 2022 12:15:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 22F5BCE01D0;
 Sat, 24 Sep 2022 12:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31712C433D6;
 Sat, 24 Sep 2022 12:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1664021746;
 bh=XUcOAYPT02PqvzhBmsyDLO6L4I1AyvITwrxwDVOKXYE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GT7XF5teo9TGsGY/V2dwDulItuA/FYIhWCqpDTahn+3PpVd8ehYRBeVAXcbh3Ep1m
 EixctFXOoBHJrFnHrFU5o30aWGY1E3zRBEOJpDBz111iv/1UVoV/Twh9CfS/QzbFvM
 7wCewFut5NIpWn3p7Qw5RAiFDDk4oXNEJINoErJI=
Date: Sat, 24 Sep 2022 14:15:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v5 01/15] mei: add support to GSC extended header
Message-ID: <Yy7073vWCbmR8M+A@kroah.com>
References: <20220913005739.798337-1-daniele.ceraolospurio@intel.com>
 <20220913005739.798337-2-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913005739.798337-2-daniele.ceraolospurio@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Tomas Winkler <tomas.winkler@intel.com>,
 dri-devel@lists.freedesktop.org, Vitaly Lubart <vitaly.lubart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 12, 2022 at 05:57:25PM -0700, Daniele Ceraolo Spurio wrote:
> From: Tomas Winkler <tomas.winkler@intel.com>
> 
> GSC extend header is of variable size and data
> is provided in a sgl list inside the header
> and not in the data buffers, need to enable the path.
> 
> Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Vitaly Lubart <vitaly.lubart@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
