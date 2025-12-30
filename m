Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5D1CE924A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 10:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7617D10E87A;
	Tue, 30 Dec 2025 09:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="SYEtH0Wt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D395910E5E4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 09:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1767085606; x=1767690406; i=deller@gmx.de;
 bh=UYTthbqv87PcJYGWmq49/Q+i3e6V/KQdQOU3fVJiFFk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=SYEtH0WtqspHsC63yDDY5IO3Mo+M4MagNYlM4v7byY2K8ay0KH+edgn6pjW/OlfV
 FUiUTBO7Mz3HU3TxjhrglNLzKlnEb6sjwGa85OiU2uL8SpbPO9+P+HjneFVJ6gCQj
 lw53/fzxBxnIuDPPSZbfoo28h1yhUAfXOATuo5TpPLo7xRM5T+m5hlQ1OQmpJKOSV
 A8spDEVbpoLfhenmMjHsnp9v9UgQh9+K4EtrpEjw6Rz6sxkBK9ygkRCixoOdYXWi5
 uOzpQXrahvnm9THehAhZ1xHXtbQag5b3RnKYM+V7/ZWI0vcP/V4fxq7A4WYl3wZxm
 25z+vpi7/DsmFeoQFA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.253]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTzf6-1vRGIG1fiU-00Y1MZ; Tue, 30
 Dec 2025 10:06:46 +0100
Message-ID: <e37ef037-fb4f-418c-937b-b3deb632d0ca@gmx.de>
Date: Tue, 30 Dec 2025 10:06:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drivers: video: fbdev: Remove hyperv_fb driver
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, ssengar@linux.microsoft.com,
 mhklinux@outlook.com, wei.liu@kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, decui@microsoft.com
Cc: linux-kernel@vger.kernel.org
References: <1766809486-24731-1-git-send-email-ptsm@linux.microsoft.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <1766809486-24731-1-git-send-email-ptsm@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MeEDMYW4+fo6IE1TOf/hGs+ScfOOpvAi8qPZh+OD/wN5NUVap8C
 ctl7le+vWiXoel3IkcHfQ/0x9zOrMvH0FTAn6z8rWukllPVOYJduaoQ/772ZWMV6F+dXwMt
 dPSBySAk1cYH3XXVRCk4IywIkR3N4tJg1OGC7EQktf/7nHCvHKPB7j1/C6ndZXhzk+iZSXT
 Otc5cqoeJagS/W5bcf1ow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:b22fajR1TCk=;dTDmnR+2TxtR9PhQrQyekYBXFca
 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
 nPNz6xh4bOUm7plTA5ObjY7+/7E0+0oS291VfM
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

On 12/27/25 05:24, Prasanna Kumar T S M wrote:
> The HyperV DRM driver is available since 5.14. This makes the hyperv_fb
> driver redundant, remove it.
>=20
> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> ---
>   MAINTAINERS                     |   10 -
>   drivers/video/fbdev/Kconfig     |   11 -
>   drivers/video/fbdev/Makefile    |    1 -
>   drivers/video/fbdev/hyperv_fb.c | 1388 -------------------------------
>   4 files changed, 1410 deletions(-)
>   delete mode 100644 drivers/video/fbdev/hyperv_fb.c

applied to fbdev git tree.

Thanks!
Helge
