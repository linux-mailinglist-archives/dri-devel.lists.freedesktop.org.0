Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B74975E8C2B
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 14:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573DF10E60A;
	Sat, 24 Sep 2022 12:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E1310E5F8;
 Sat, 24 Sep 2022 12:15:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1791E60FB5;
 Sat, 24 Sep 2022 12:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EDDBC433C1;
 Sat, 24 Sep 2022 12:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1664021753;
 bh=1hSQh1hOy8yLyUi1ESewTVtFoGRIhxp/d4BYlx1v17k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EZ5fA3Nm7ny8qjn1Ey9QgIO9hNf31zjsRD17ZbzLvu6LPD7xouGhTfyOVbItSaCGb
 mlGKWWhwvjDciAD0Z7Pn2Xp3y1h8jh3w0/JaYhO42I9PfWcbq+wtk5N60eQJWDR1Nq
 IWKNuMtjsmex6Ti0ifIaLrWiRNibXEwqXDvPG2Cg=
Date: Sat, 24 Sep 2022 14:15:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v5 02/15] mei: bus: enable sending gsc commands
Message-ID: <Yy709lo4KXOMRrwA@kroah.com>
References: <20220913005739.798337-1-daniele.ceraolospurio@intel.com>
 <20220913005739.798337-3-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913005739.798337-3-daniele.ceraolospurio@intel.com>
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

On Mon, Sep 12, 2022 at 05:57:26PM -0700, Daniele Ceraolo Spurio wrote:
> From: Tomas Winkler <tomas.winkler@intel.com>
> 
> GSC command is and extended header containing a scatter gather
> list and without a data buffer. Using MEI_CL_IO_SGL flag,
> the caller send the GSC command as a data and the function internally
> moves it to the extended header.
> 
> Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Vitaly Lubart <vitaly.lubart@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
