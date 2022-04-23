Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202FE50C65B
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 04:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF4E10E025;
	Sat, 23 Apr 2022 02:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E13C10E025
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 02:09:07 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 51D57839B9;
 Sat, 23 Apr 2022 04:09:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650679745;
 bh=eJKZzpCs6mdzACpHc7mFd5mf6sMhAM84s8dDtcqir5E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=xfTfV5gLVEt1ahC5fAmhonlO+EKT7plqt6MLIHGg85YSPKKZETiesRrsgkH+cLmNh
 zHPxXbKxLwVynmp/p0btbSP9rx3T8snFsbdJWiYH6fO9e8bN/j1mv00c5MK6r3Qm4I
 kIxcvx6nSEG8r49bvscM4/sWhwtbXarTALXBR5B7gq33OYoB1HzmGZgoZCuyD0t4iT
 UdpUqazcdytgyUi76X2doDeCNT9n5sXRjZoDruHw7LjtZ413c8abm3tG6O/1vEDZZD
 Kfkddoz0catYk2RHIR2z9tIxDyt+BDG8LKTkFhifuD/rzZuR62wObM/usrYVAtbSgA
 Fnyzr50jRt/Kg==
Message-ID: <241e0068-67bf-c6e2-129d-5b689e17182d@denx.de>
Date: Sat, 23 Apr 2022 04:09:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: ldb: Implement
 simple NXP i.MX8M LDB bridge
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220418145105.76986-1-marex@denx.de>
 <YmLzXDtZ9WNhTX2x@ravnborg.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <YmLzXDtZ9WNhTX2x@ravnborg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robby Cai <robby.cai@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/22/22 20:26, Sam Ravnborg wrote:
> Hi Marek, I read the patch once more.
> 
> On Mon, Apr 18, 2022 at 04:51:04PM +0200, Marek Vasut wrote:
>> The i.MX8MP contains two syscon registers which are responsible
> 
> Here it says i.MX8MP

Fixed, this and the bindings.
