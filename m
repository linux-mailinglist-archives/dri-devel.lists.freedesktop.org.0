Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A2C67B8F5
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 19:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF46210E807;
	Wed, 25 Jan 2023 18:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C83310E13E;
 Wed, 25 Jan 2023 18:01:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 965F9B81B43;
 Wed, 25 Jan 2023 18:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04ACC433EF;
 Wed, 25 Jan 2023 18:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1674669692;
 bh=jeas5NJfUtr4PzjyTNVaiu7MuOjVXR3iONcH6klGXxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oQj1ikQSByyBiP3BjABRR3JMs1BIEIjCGWbV81pfEGwrR3UmOd/z0dd/eKjkjDGwO
 Nkkqiw2Zqs9EUSgVkF3mlPrz7cKYDOkRjRKa35InOkju3pbfktUii051LlQw2Afxpx
 HV88rn477tVKgv3tD0joyrED3zsstncN+suCCSvA=
Date: Wed, 25 Jan 2023 19:01:29 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v7 3/6] mei: clean pending read with vtag on bus
Message-ID: <Y9FueZmoVZchi6zW@kroah.com>
References: <20230125082637.118970-1-alan.previn.teres.alexis@intel.com>
 <20230125082637.118970-4-alan.previn.teres.alexis@intel.com>
 <Y9FmvUujJeijwZXi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9FmvUujJeijwZXi@intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Juston Li <justonli@chromium.org>, intel-gfx@lists.freedesktop.org,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Vivi@freedesktop.org,
 Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Why are you top posting?

On Wed, Jan 25, 2023 at 12:28:29PM -0500, Rodrigo Vivi wrote:
> 
> Greg, ack on getting these 3 mei patches merged through intel-gfx?

$ mdfrm -c ~/mail/todo/
756 messages in /home/gregkh/mail/todo/

Give me a chance, what is the sudden rush?

greg k-h
