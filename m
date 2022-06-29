Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAC155F5EF
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 07:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AA910EB1E;
	Wed, 29 Jun 2022 05:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B22710F524
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 05:59:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA1C26182A;
 Wed, 29 Jun 2022 05:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CA2C34114;
 Wed, 29 Jun 2022 05:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1656482343;
 bh=XMyoN7X0TYQI0q///T/+MOg3sOWfMhqEPKgAL/Q93To=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QdQzN4m3seA5b/RQuleY8oI8TdkSeAOPAoBNHw4Eci1dHSQsKigMoAt3ruVHk0MG0
 bCXGs8KNUTcrmlstD2Hyhd3NUYXbMVYVLccxfDCjb046oEshOU6ShDu70cJkNQVD/x
 6pVKLf1LMpJ7X7CEYR/An4LVu3f520VduyvcJ120=
Date: Wed, 29 Jun 2022 07:59:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Jiapeng.Chong" <jiapeng.chong@linux.alibaba.com>
Subject: Re: =?utf-8?B?5Zue5aSN77yaW1BBVENI?= =?utf-8?Q?=5D?= usb: gadget:
 Fix unsigned comparison with less than zero
Message-ID: <YrvqJIsnmlol2etP@kroah.com>
References: <20220623084347.38207-1-jiapeng.chong@linux.alibaba.com>
 <YrWjCnNJohij691b@kroah.com>
 <19ba5da7-3e9d-49e1-aa7f-b0834737fbfe.jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19ba5da7-3e9d-49e1-aa7f-b0834737fbfe.jiapeng.chong@linux.alibaba.com>
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
Cc: balbi <balbi@kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 andrew <andrew@aj.id.au>, neal_liu <neal_liu@aspeedtech.com>,
 linux-usb <linux-usb@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "sumit.semwal" <sumit.semwal@linaro.org>,
 linaro-mm-sig <linaro-mm-sig@lists.linaro.org>, joel <joel@jms.id.au>,
 "christian.koenig" <christian.koenig@amd.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 29, 2022 at 01:51:01PM +0800, Jiapeng.Chong wrote:
> Sorry, we didn't see this patch.
> commit c09b1f372e746aeeb61ef8ffe0fea3970fd9273e

I am sorry, I do not understand what you mean here at all.

confused,

greg k-h
