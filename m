Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07351500FCB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 15:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B5310FDC7;
	Thu, 14 Apr 2022 13:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2395D10FDC9;
 Thu, 14 Apr 2022 13:57:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 92C24B8299D;
 Thu, 14 Apr 2022 13:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE3D5C385AB;
 Thu, 14 Apr 2022 13:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1649944644;
 bh=0qaZLey80GwRxkbnpELNNiiu04Z1tGmUnvBYVBn6HLo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RkJwBjEPV04YrtZCp+NB0wsr+vR3Yyui3vsao0OEAesgcZ7S5YaL1G9kU7+BRz8eG
 hnU7Q41bkx9pSsGPe+xSLyCqg6EwC+mA9czIPVmBSEveBXYp553m4i5INTL+iNL0jr
 MQUMviaf2RkOG2kuluKkCQNmX4JZ4v6A2WFUK99M=
Date: Thu, 14 Apr 2022 15:19:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 0/1] add support for enum module parameters
Message-ID: <YlgfXxjefuxiXjtC@kroah.com>
References: <20220414123033.654198-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414123033.654198-1-jani.nikula@intel.com>
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
Cc: Andrew Morton <akpm@linux-foundation.org>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 14, 2022 at 03:30:32PM +0300, Jani Nikula wrote:
> Hey, I've sent this before, ages ago, but haven't really followed
> through with it. I still think it would be useful for many scenarios
> where a plain number is a clumsy interface for a module param.
> 
> Thoughts?

We should not be adding new module parameters anyway (they operate on
code, not data/devices), so what would this be used for?

thanks,

greg k-h
