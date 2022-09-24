Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40EB5E8C29
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 14:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF3D10EBE9;
	Sat, 24 Sep 2022 12:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D7F10E604;
 Sat, 24 Sep 2022 12:16:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD98B60E8F;
 Sat, 24 Sep 2022 12:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDABEC433D6;
 Sat, 24 Sep 2022 12:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1664021768;
 bh=wKoKoiLYZck4ui4r+AD2GhQqn1TwZISApiz8VYKxS90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=y7e+TjUg5o1QgH4uApeJu/ENSSPYOGMagLpGSsyzqfa6v2PEHhQARiASPGglpbycB
 PSzA+XWh5eA6o0BFY14h5lUHDKxwTUjPrkFXnpcd6WuesL1dpUqwRAk35qs9zsWY8n
 0X1CDSJqKMnfAVTVM5MGD7qnOK+uUG3UgHHo7rgI=
Date: Sat, 24 Sep 2022 14:16:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v5 06/15] mei: pxp: support matching with a gfx discrete
 card
Message-ID: <Yy71BXOWPl5pYFY2@kroah.com>
References: <20220913005739.798337-1-daniele.ceraolospurio@intel.com>
 <20220913005739.798337-7-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913005739.798337-7-daniele.ceraolospurio@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>, dri-devel@lists.freedesktop.org,
 Vitaly Lubart <vitaly.lubart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 12, 2022 at 05:57:30PM -0700, Daniele Ceraolo Spurio wrote:
> From: Tomas Winkler <tomas.winkler@intel.com>
> 
> With on-boards graphics card, both i915 and MEI
> are in the same device hierarchy with the same parent,
> while for discrete gfx card the MEI is its child device.
> Adjust the match function for that scenario
> by matching MEI parent device with i915.
> 
> Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Vitaly Lubart <vitaly.lubart@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
