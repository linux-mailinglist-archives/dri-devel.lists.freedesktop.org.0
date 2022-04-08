Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DC84F9C11
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 19:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D27F10E6D7;
	Fri,  8 Apr 2022 17:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A4710E6D7
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 17:55:41 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E426C83A97;
 Fri,  8 Apr 2022 19:55:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1649440539;
 bh=BDWp6Jago7GfLdFMp4ltJ39tiOzPTVkDp8buYKrvTmY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=f+aidy7DKMENj2sk7/p0sIkVEtnCf94n83X5Js5WdVYofSaCk4MwCLJQZhu3ubN9h
 yprf8Htsdzc15h33iFGnJKVjx0s08x+2km883r3OlcY2hFehgJJLXZtFSEB9/YNhtk
 KuyFaz/T54LUm9l41sII6T30x18ZupUE50vfDDvUVqQGUrdUu7gCnHpOcWxolLnnhc
 skHru1TwidCoqHJ4FabIjGQlSrQtxnlaH4vOUL4LFDsHIs0mvFEtJ50etkwnXSEpu1
 mwale7OhboVJZU4gVGgRkh/kN57Xp+oYDop1wLZ8mvGBmxb9GlNp6IjO1l3r8KfJ6t
 sxA51sRNu91oA==
Message-ID: <257ef1da-dd1f-cec6-2950-42990750af43@denx.de>
Date: Fri, 8 Apr 2022 19:55:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: display: panel: mipi-dbi-spi: Make
 width-mm/height-mm mandatory
Content-Language: en-US
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20220404192105.12547-1-marex@denx.de>
 <2d4ef041-8339-006e-3e94-8ff16309cba7@tronnes.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2d4ef041-8339-006e-3e94-8ff16309cba7@tronnes.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 robert.foss@linaro.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/8/22 16:50, Noralf Trønnes wrote:
> Hi Marek,

Hi,

> I see that you have commit rights so I assume you will be applying this
> patch.

It's already in drm-misc-fixes:

https://cgit.freedesktop.org/drm/drm-misc/log/?h=drm-misc-fixes

https://cgit.freedesktop.org/drm/drm-misc/commit/?h=drm-misc-fixes&id=1ecc0c09f19f8e10a2c52676f8ca47c28c9f73c7
