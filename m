Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D522A0696C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 00:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAD610E1BF;
	Wed,  8 Jan 2025 23:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="ZgcAoISw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6568A10E1BF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 23:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1736379015; x=1736983815; i=deller@gmx.de;
 bh=Y8XrRWHeT4gjfJWwOIqN4ERHN1znGHVBZgBx4/uQ54c=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ZgcAoISwCEzF/fCUCv5ACwg4dMhujdVPNdUBx80cKJw7AsNAgwqJRAjjQ8EbtyB8
 cDkAY5pAMfyKBbUfDk9BOkHf3YTIjNnxgc7lAEoO2lyCWHkjVeX57wMazAcjYppuo
 TEDZJM8BEE+XEqajoCgbtt2fc46aff9XZ7Xg9tLFmnGX0B0Eh3v5D8FvcSPD2gIyH
 qlNnMWWKBFzoy7Baf+5kShNe6nqylhuLcQQLpwBGA20KgbzU6w6iPBHJABaiFBObm
 tHZM0e+AF0yjeSNgaaQhVlsB1Me0wN4FBSMPiCKevbuijDVFpZMaoxTuH1HQQbI6r
 bp3jHwwkv1xFyrfX0Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([83.135.220.169]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4Qwg-1td3oW43b4-010eIU; Thu, 09
 Jan 2025 00:30:15 +0100
Message-ID: <6af29f19-2e8d-4bc8-a9be-f3a0e229c7ff@gmx.de>
Date: Thu, 9 Jan 2025 00:30:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: efifb: Change the return value type to void
To: oushixiong1025@163.com, Peter Jones <pjones@redhat.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20250103032633.98807-1-oushixiong1025@163.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250103032633.98807-1-oushixiong1025@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9KSBuPZedUe1x3s/ybDNUzrvuSgRdsHT6ioSwhVhIPZIelYH908
 qgwXI6c7DJ78CH9Q69x7OJVlUmf5GfTlDik5uA2DAj3f/rhOIBieQEEn6YK3eEmP1thMO2M
 /VBNoCIN4yYVXQxccZRuK+bT5Mp672fNWBaDWfwfoZn+5ziro9GMmqUQAuYH1m+/0FI+3Gv
 NyfHdkm86S0aC7akY5YRA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PufQYzmlCkU=;bY/7fy605GO5du2qG6D/eyVnrBx
 UREkb2Z6E6gbs9uYz7RgAEg1IUIC1TrTPJfW83i6L2phBcrjAROZLpjAIOeTbQjJVHjZ8n3wS
 Mp98+YUGCMuB7fG42CGPFvs4IOwsINd+cZGLxU7clQ28BS2v/f6/YwUi3XCImW9OTB7xapoAG
 4uj7H4mMZ9vz1FU47NTP+QHrcaaCBlo1S16ephthTYsK9FY6L+gPnv2f/LZqCxLQzL6vVZcwg
 64mnJ78GMCwCQ2rs3chkDUGOjuhgRA88sD7zL+Gb6bSN0m+NVy7sVgVTexjGsOJzE2uQJj6Wu
 rLDh7dKyI1cW+E5jzp0dZpcpWMZqXcbeRtVl93RBHmS+YcGRyDy4Pq95c/3M+OvOgCBLj1plG
 j/5XnPARI42xB1d1MVp5uqV/fKLQXvpDuw+o5q6Dmubctmk7i2g0DxP5asSHUon1tlpGPECfG
 GLpV/dnO0D7i+EPaJQybvjVRrS7dRi/vKIz1Nk10mSVNkONuo4paYrwQxnf+xhsN00t52Bx2F
 thxkzJ9NwFWOqGqw2Jf/9+3PQLQygOn5Z53jpdje2T/9a736NUcFEWau85Xc8rNrGOWYAOAFP
 g4wir3FxaPxQGoAai0xhAnI7DyEOZ5+ipH9QBntK+CJsTqFY0juZzxLMFo/BCTy2o0Oq8PYc/
 0sz/Tdv/XVXx6WeihE9mtypSx/1phDAGe7H4zNBeLUlDOtS4pQJXpE/qaWSXXX1lTqJSd88nQ
 zogKh38M7OSEH0U0lGv4sTEl39MNdYzMPCT3D3I+737MU/r645SC+6sb8ovtNbJlqnAgrHY+S
 f2MgMnVQbNHBka74HT9xhWuQ8ACQfxwiupR54clJ67EmXK6Uq3R/yf+txI/MWYGPXDERRYxQY
 MwigDukux25ePMbJI4B5AT7+N7yPRnmZ6BQ+ohxkyoSDK3v4AWNA2EsPcNH0ADTswd65iEddu
 NEKUJHoOXiz5LD+eB2vIRsW/WuHYRjZGV3hoCZr7+KQ1VhY2QDaF2pyGFPPqj13iKpbI9sq60
 HM2LD41QffTAfPIfdfgv01EsZG5u1CWdAIi1KKMqdn6D7DmgshI8p/jThQOU5se6eFmffiTFO
 PeGaZvbJ3efFwt75lndsRruoEisF0A
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

On 1/3/25 04:26, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
>
> efifb_setup() doesn't need to return a value.
>
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>

applied.

Thanks!
Helge
