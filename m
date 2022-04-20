Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C574E509E7B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 13:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206F310F369;
	Thu, 21 Apr 2022 11:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dog.elm.relay.mailchannels.net (dog.elm.relay.mailchannels.net
 [23.83.212.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3698510E535
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 21:05:43 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|ian@linux.cowan.aero
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 22C07760EF8;
 Wed, 20 Apr 2022 17:20:18 +0000 (UTC)
Received: from pdx1-sub0-mail-a217.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 9DA27761E06;
 Wed, 20 Apr 2022 17:20:17 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1650475217; a=rsa-sha256;
 cv=none;
 b=s0RJWcnTBaikUpP2bdENAkxCaxueJhakQv3bdyStQQH4WxzxQgy1N1ckoapMzJ36h9gniC
 VELrp99uSpJPE25wRxLp2zYpnft31WGJFqyA8YRjxxsjEjezfXIX4YvZvy915Q8V5S+0z3
 1cRlQw6VTcRi2MIX+Oi+P8IExrazSd+nCyBkTZY9YJlS+1lK4d0KJaB324AEREAGexzswR
 4MtXdEOdS6MP2mSE5VOcR4UPQ/w7/2G9d96vN79vxaMg+hfsg11j8wm2h6sNCWDo+CwA3v
 hm5Ir4beM0zkxov3yCwlsW0OkHah55iM5GE+iohwiFkDckaetnTsvokb7kA77A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1650475217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:dkim-signature;
 bh=cdf9+k2VtzTYEJ/Pkh71vf3BfUPmRtgtQ3uFbGpaeMk=;
 b=8Coi8OH7XLRzpsgWiWi/u0Jl54NuXBOaTKKoRvX7VWkNi3wVoFKnNxQP4lnK97zg6mcqQ/
 DpQjIz+wa04WRxVSh8uma4IXXtKiYumHZG/Ms2Bmi9puMhAMenHkFKtML7a2dnRmiiQ+rF
 Jum3dJBRbyo/2jmis6++J2CzwF7m11NNJkDpw46tSBZrmKyxbrvTf44PobxxDGQpY7gH6Z
 SERbPog6+69HfO8nkg/neVuCjOpA7Xn9a87Wuc7zjThI3pmxORvwElKUuVU1/RKtJ0n+kN
 3KmJObns+VzaL80C1hY5D6wrYhxtuYELnCKR/hIgnQQzuLaOAtAjlGKEz8GxVQ==
ARC-Authentication-Results: i=1; rspamd-58ff8d7479-2jpfw;
 auth=pass smtp.auth=dreamhost smtp.mailfrom=ian@linux.cowan.aero
X-Sender-Id: dreamhost|x-authsender|ian@linux.cowan.aero
Received: from pdx1-sub0-mail-a217.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.115.45.25 (trex/6.7.1); Wed, 20 Apr 2022 17:20:18 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|ian@linux.cowan.aero
X-MailChannels-Auth-Id: dreamhost
X-Obese-Sponge: 1fefb2c312ac0071_1650475217954_481480763
X-MC-Loop-Signature: 1650475217954:3309040606
X-MC-Ingress-Time: 1650475217954
Received: from fedora (unknown [69.12.38.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: ian@linux.cowan.aero)
 by pdx1-sub0-mail-a217.dreamhost.com (Postfix) with ESMTPSA id 4Kk6r04fgMz1L; 
 Wed, 20 Apr 2022 10:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.cowan.aero;
 s=dreamhost; t=1650475217;
 bh=cdf9+k2VtzTYEJ/Pkh71vf3BfUPmRtgtQ3uFbGpaeMk=;
 h=Date:From:To:Cc:Subject:Content-Type:Content-Transfer-Encoding;
 b=mqNGUQzXCPkxLoMRh7xClxiLUkEU5/luuPaKDg9MNoqjy2CLqMQmGSPDhRUr6vxnC
 iyyfk78aapwEFfoRMRuXumSB5nGnhn3z10vSJChkoJv3X4NSVLtN8iuT8uvhjjL2ie
 C5GdMLBQGgIU3LTWvQtPx0kdF15SayU584FfBTTupGCzCnnS9fwgYuwBjSt+5HfXYz
 TUC9lZmN/N/GGEWZNB2v2ra2CueFGrzoAJKRGhmuFh+uWe+dqPoOqufZ1dWuKMn6cq
 MU1FDoNbXBTegPkU0kYhpAZNRwSjMyFsZ7uWPZsTUcqWJUGPf4UNsTABbv71546Cks
 0oXKM36lLudQQ==
Date: Wed, 20 Apr 2022 13:20:14 -0400
From: Ian Cowan <ian@linux.cowan.aero>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] Staging: fbtft: Fix style problem in header
Message-ID: <YmBAzpHz2qhb69Ux@fedora>
References: <20220419192128.445023-1-ian@linux.cowan.aero>
 <20220420064711.xuhuyhtgcrs3avhk@pengutronix.de>
 <YmARR6+XQeVqlusK@fedora>
 <20220420143608.yuxleiffs234dfog@pengutronix.de>
 <e4f56999-cf58-abff-edf5-ae11d024012b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e4f56999-cf58-abff-edf5-ae11d024012b@redhat.com>
X-Mailman-Approved-At: Thu, 21 Apr 2022 11:22:59 +0000
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
Cc: gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 20, 2022 at 05:47:49PM +0200, Javier Martinez Canillas wrote:
> On 4/20/22 16:36, Uwe Kleine-König wrote:
> You are just changing a header file though, did you also enable one of the
> fbtft drivers as a module to see if those build? But as said, by looking at
> the code it seems that should build correctly.

Not loading the driver was the issue. Thanks for helping me get it fixed!

---
Ian Cowan
