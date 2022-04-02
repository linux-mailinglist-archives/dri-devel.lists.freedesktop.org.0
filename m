Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C7B4F0620
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 22:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F4110E09B;
	Sat,  2 Apr 2022 20:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C728D10E09B
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 20:19:26 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id F3387808BA;
 Sat,  2 Apr 2022 22:19:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648930759;
 bh=X9am6kwb2hWq84iy+3Afgbz8P1Wwfca1KRLHKXHKQZs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Dbmjv6aGjfhuEiNth9w+n1hfBDMergbUMq4yQ/9kib/VuSsDEw46Bdcu0I4Gf82xC
 aQfzysl2dZwaDURFDlRNvy23rS3C9Q0GIBp4fi9jO4TzHQA6+GRfvMPSFVMKcxYLYj
 Wl2/I0uxCinDQZusv6RHrskdXoQmD8fOa6BEiSZsVAziJ+m4HvriTL2UEnepw1GnIp
 ngj1rpZpM2ppcDPRQGQ3wGc5QXFIIlHkT+KjK+dKrUUDhdP877CdSWc3Px/xkyf9FB
 3uY1834py5z586XIiqU0y2vO1EfkwO0zSehh9O7UUaK3PKyxdu9oYjGJvYw7KLHQm9
 1D6exxn84xGTg==
Message-ID: <7952a5c9-01f1-ca8d-9ffb-e3e91bf0a0c5@denx.de>
Date: Sat, 2 Apr 2022 22:19:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC][PATCH 1/3] dt-bindings: display: panel: mipi-dbi-spi: Make
 width-mm/height-mm mandatory
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>
References: <20220401163755.302548-1-marex@denx.de>
 <CAL_JsqKVkc51sXWE6Sh5yHxLX0vJWgFpn8cmjjKSBx4dYzA8qA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAL_JsqKVkc51sXWE6Sh5yHxLX0vJWgFpn8cmjjKSBx4dYzA8qA@mail.gmail.com>
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/1/22 20:36, Rob Herring wrote:
> On Fri, Apr 1, 2022 at 11:38 AM Marek Vasut <marex@denx.de> wrote:
>>
>> Make the width-mm/height-mm panel properties mandatory
>> to correctly report the panel dimensions to the OS.
> 
> Adding required properties is an ABI break.

Per discussion with Noralf in 2/3, these bindings entered in 5.18 merge 
window, so maybe there is still chance to fix them before rc1/rc2 ? I.e. 
they were not shipped in any kernel release yet.
