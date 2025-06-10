Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E125AD41A4
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 20:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8366E88DE5;
	Tue, 10 Jun 2025 18:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="U++k3vvn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 369 seconds by postgrey-1.36 at gabe;
 Tue, 10 Jun 2025 18:06:52 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A958988DE5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 18:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1749578807; x=1750183607; i=deller@gmx.de;
 bh=wbZXuH2tOA/Eusj7lw6da7edYMjoXVbcpmt/w4nzDtc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=U++k3vvnS15wEycckm6Gg/8ghMH24fNqTSXCyuoaZuuYUFiKF7lP6heciys8SC+N
 LyXUl6kG/wP28P8TVhl+ShnfLBotemU0jOEB9oZ0sLLdBSIbFmb2mF8pa6AEBD5h5
 xyV3MmiV+yEoGuTPTBpFENydpzIhzttIimpmPPniiNrApo7pynhtsauqJ2+X7qTCl
 Gvwt4NNU4/OZV+GGQrxIrJil8nKQWJ/Zasd/RJrKc1XDdSnrSExvus1OWzoVz4qle
 rP9vyvUlg16lki42waRKpPM6defsjlkVio0fqFDDQmnYY9w968aJPb1LEqPj5FIZH
 zSked5kEkniAFOPiug==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.171]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N49h5-1uplLy22Wf-012Rvs; Tue, 10
 Jun 2025 20:06:47 +0200
Message-ID: <abf99998-6779-4152-844e-85c9873e6bdf@gmx.de>
Date: Tue, 10 Jun 2025 21:53:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] fbdev: Remove trailing whitespaces
To: Thomas Zimmermann <tzimmermann@suse.de>, soci@c64.rulez.org,
 simona@ffwll.ch, linux@armlinux.org.uk, FlorianSchandinat@gmx.de,
 alchark@gmail.com, krzk@kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250610105948.384540-1-tzimmermann@suse.de>
 <20250610105948.384540-2-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250610105948.384540-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+DkJ6FR+Km5D/WhgpvvOXa79/D5abjFVeGE77zLuGdeghkehmmK
 njKpk7MF//n6D9iFXauiQcynDyj3PXQoTRn85oPHEbmanFi3U65LjZ2thKIESgm1wRXXEbm
 aY7pvfx6o3AtSqmDUclo4j61v6vVBaSChbIs5rV8PQo9IZi0e41cM+gCniNc9ShLvr91WDO
 aDHSUJXDTiZ0Fptf5C/Uw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RDgaSaUxPoE=;y+gBCxn6ZhdHxCcishqhgFbjGb8
 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
 fb0M=
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

On 6/10/25 12:56, Thomas Zimmermann wrote:
> Fix coding style.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/fbdev/macmodes.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Helge Deller <deller@gmx.de>
