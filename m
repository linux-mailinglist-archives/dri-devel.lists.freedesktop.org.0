Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCF95B2E8C
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 08:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BBF10E9DF;
	Fri,  9 Sep 2022 06:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4554A10E9D1;
 Fri,  9 Sep 2022 06:12:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B6FA161E93;
 Fri,  9 Sep 2022 06:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1968C433D7;
 Fri,  9 Sep 2022 06:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1662703946;
 bh=KIZ8dCzPHmOIZqKMIbRid9P1jdWOShRBSjhGGtsFzOc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xT529zMiV1c2KAQq8oshZQONhafmhAOQOndsjgT8lwbLOTIU961XS3wOsn9S1AO6p
 C4XUd0hKagXJztY5S8h61f+CwU3OMiC57ZvtEyO/pskArvIoitsH3HWw7Oa7voGZwb
 Y57hMeWzhAoAh1eg9ikoV23WfFMu60HFg565ajXw=
Date: Fri, 9 Sep 2022 08:12:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v4 03/15] mei: adjust extended header kdocs
Message-ID: <YxrZR+oUkGXve++P@kroah.com>
References: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
 <20220909001612.728451-4-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909001612.728451-4-daniele.ceraolospurio@intel.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 08, 2022 at 05:16:00PM -0700, Daniele Ceraolo Spurio wrote:
> From: Tomas Winkler <tomas.winkler@intel.com>
> 
> Fix kdoc for struct mei_ext_hdr and mei_ext_begin().

Shouldn't this go in the function that made the changes in the first
place?

> 
> V4: New in the series

Again, below the --- line please.

thanks,

greg k-h
