Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC697565AE9
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C95D10E6BB;
	Mon,  4 Jul 2022 16:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E39F10E103
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 19:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=HRTHbdEC25JTA3hhXk6GM1ejYcGnX3MDfn1vFAY7xy4=;
 b=TiE6BfYu9zZBfTX3VDz8QgM2QWlNmjwGH2w6WWqmFmgnnV3p7LdmJpqZnlopZ8Dnq75BZ8pUm2UUw
 5Enozos34l11xBsILyUKYZSHtLmgu3gsvUrKcFl9IQ8LYWqFmnsa7q/Aqse04vzXEkJFiyGFXdFvnr
 WtlvEd1NXR0jrnK3lrvNzlAMIY1j7U5Ga5EuLlbHqVo0I4eI6aoZvokKCsYhWfuhkRoQS9ishTgzIq
 wVqC6EBVCfwU7xkfdS8YMynYeXP6EMkMl4svbOKyQiP6NKv/42gggbBSpfhDOE1hqvnkPaTEwid3Yb
 /mPPjiYcP0HCid8qvE7PKK5wBmO3D6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=HRTHbdEC25JTA3hhXk6GM1ejYcGnX3MDfn1vFAY7xy4=;
 b=VwEBqW74E4mZC0dwzG+CO0d2R5U3ZIkYVji1XlpBIASWd0fNU1fOz0cJZjC+VN7biCoGV7jxBXN87
 j6LyNLRAA==
X-HalOne-Cookie: a74eb6fc82b130e0f59d2fba78d5128a6abedfd9
X-HalOne-ID: 56558546-fb03-11ec-a917-d0431ea8a290
Received: from mailproxy2.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 56558546-fb03-11ec-a917-d0431ea8a290;
 Sun, 03 Jul 2022 19:07:09 +0000 (UTC)
Date: Sun, 3 Jul 2022 21:07:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jiang Jian <jiangjian@cdjrlc.com>
Subject: Re: [PATCH] drm/panel: nt35510: Remove duplicate 'the' in two places.
Message-ID: <YsHo3Km5clGdUk/S@ravnborg.org>
References: <20220621140151.14404-1-jiangjian@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621140151.14404-1-jiangjian@cdjrlc.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jiang,

On Tue, Jun 21, 2022 at 10:01:51PM +0800, Jiang Jian wrote:
> file: ./drivers/gpu/drm/panel/panel-novatek-nt35510.c
> line: 193,214,253
> * amplification for the the step-up circuit:
> changed to
> * amplification for the step-up circuit:
> 
> Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>

Thanks - applied to drm-misc (drm-misc-next).

	Sam
