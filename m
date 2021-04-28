Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D3E36D96F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 16:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB836EB4E;
	Wed, 28 Apr 2021 14:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8A66EB4E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 14:19:35 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E210F82CBF;
 Wed, 28 Apr 2021 16:19:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1619619574;
 bh=1fjocKqDCefoo06SVSV8OVk190gPYOhs/98ZA4jjQoc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=m4jmP/mmZXIViVgc5gST/ZCdllYOb37MwjZJEe7aSDeb9LEZROjrCVOSckPhYJWbj
 EZxZ/gCkvPM3H2OYEeVVjUQ82hIS4Hj/Fm/gOsntWbFiuBba5bBXTIrdyQLtDb3obP
 8TdWU2/RAIT7UngU/OmSBGTI8yNt1EJ0YQH2SjUlPAPocW6wroHW4tMVVgYLTYTRQZ
 Rj11GSPkqS69EazjIltlTzUGy6mArKa2G2kcPSEfahtVgXMDYQWAGMXsIbcL0EOyAr
 sqWIgajUtG4AP/BczXDIHK96AVAUEc1qKliFxgN6mwFb0LFCNIGMqRRN6394J99q60
 p8H7xfVXAnr2A==
Subject: Re: [PATCH V2 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add TI
 SN65DSI83 and SN65DSI84 bindings
To: Frieder Schrempf <frieder.schrempf@kontron.de>,
 dri-devel@lists.freedesktop.org
References: <20210421223122.112736-1-marex@denx.de>
 <a39a107e-284d-2f4a-8b69-ff507a6a0d62@kontron.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <6126a450-e42e-8341-37c9-bd1832a6c78e@denx.de>
Date: Wed, 28 Apr 2021 16:19:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <a39a107e-284d-2f4a-8b69-ff507a6a0d62@kontron.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
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
Cc: devicetree@vger.kernel.org, ch@denx.de,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNC8yOC8yMSA5OjU2IEFNLCBGcmllZGVyIFNjaHJlbXBmIHdyb3RlOgpbLi4uXQo+PiArcHJv
cGVydGllczoKPj4gK8KgIGNvbXBhdGlibGU6Cj4+ICvCoMKgwqAgb25lT2Y6Cj4+ICvCoMKgwqDC
oMKgIC0gY29uc3Q6IHRpLHNuNjVkc2k4Mwo+PiArwqDCoMKgwqDCoCAtIGNvbnN0OiB0aSxzbjY1
ZHNpODQKPj4gKwo+PiArwqAgcmVnOgo+PiArwqDCoMKgIGNvbnN0OiAweDJkCj4gCj4gVGhlcmUg
aXMgYSBzdHJhcHBpbmcgcGluIHRvIHNlbGVjdCB0aGUgbGFzdCBiaXQgb2YgdGhlIGFkZHJlc3Ms
IHNvIGFwYXJ0IAo+IGZyb20gMHgyZCBhbHNvIDB4MmMgaXMgdmFsaWQgaGVyZS4KCkZpeGVkLCBh
bG9uZyB3aXRoIHRoZSBvdGhlciBEVCBkZXRhaWxzIHBvaW50ZWQgb3V0IGJ5IExhdXJlbnQsIHRo
YW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
