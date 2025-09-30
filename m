Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EC4BAE7AC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 21:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF2A10E2D2;
	Tue, 30 Sep 2025 19:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="XwQJisaV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B47A10E2D2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 19:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1759261917; x=1759866717; i=deller@gmx.de;
 bh=POcVmySXbsQZwgsqh5lhGUSy0JSHOTZTc9scBP4FmPE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=XwQJisaVgdZZKT6XJimlabcmEKDdlOctLBp58vs3phSpRJSFewHjHLfVZyem9Lnv
 eVzie6XuGmKYBqJkb4MzTfUWdfbsDQ1KUj5+cbk7ZVvGitLPl4zf6qY5m/XlRgC4c
 euchC1judc4G/2oCFpsSVTv3MGPTstPMfjqWrhbucHBuzYN9xy6PjJFCKdbf8pwLj
 cz1MOedJ5jpkQS8BUJecCfIISszL/hJtTMggAXL/Dm4eDvyMiwGK+jGFlI08uCfnA
 iCWZKhjlTgVw6hXlGt2w5pqCyFKUXn/SgndtPxrtCvoUs2wAQLLrGVxEBkXfgRsmy
 xHGDzn6iFIn+gIPZ7w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.4]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuDc7-1uA4Wm2vjJ-00yUlv; Tue, 30
 Sep 2025 21:51:57 +0200
Message-ID: <e75353bb-222c-48ad-87b8-685573e660ce@gmx.de>
Date: Tue, 30 Sep 2025 21:51:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbdev/radeon: Remove stale product link in
 Kconfig/FB_RADEON
To: Sukrut Heroorkar <hsukrut3@gmail.com>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>
References: <20250923171409.25927-1-hsukrut3@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250923171409.25927-1-hsukrut3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aj/Klpo5n8VYtzgUa6RjociLgjEcUpSiyI14pP0EAcVFdY2FYMV
 Lko2Bm8tAfb28YPH9bklSnlw5LPn/NjlsoMBYjuTL3ru+SBz+Nkqq21Cl3ZukqDD3rMoN08
 lB/54UD/3tpCN0A2ig3LSt+E93JyXxTox+6ls1wP7TCuPSoJNAI3HZncca3kBifSnmrmAL2
 gcop7ovBWAG6g1CDwgZgw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pbRHDVPCvyw=;3V7V1byHotmPV0m9Z3Q519CtF5R
 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
 61dnNRK4j9gNzg==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/23/25 19:14, Sukrut Heroorkar wrote:
> The product page referenced in the FB_RADEON is no longer valid.
> Remove it to avoid pointing to an invalid link.
>=20
> Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>
> ---
> Changes since v1:
> - Dropped the link entirely as suggested
> (See: https://lore.kernel.org/all/CADnq5_NHu5=3DesJZrgy_S80jF68ZapRRYX4_=
L70DwDDSN3VXitQ@mail.gmail.com/)
>=20
>   drivers/video/fbdev/Kconfig | 3 ---
>   1 file changed, 3 deletions(-)

applied.

Thanks!
Helge
