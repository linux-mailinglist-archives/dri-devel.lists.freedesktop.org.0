Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D919BC6D52
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 01:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC0110E89C;
	Wed,  8 Oct 2025 23:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="p7MV0I4o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B42510E89C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 23:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1759964580; x=1760569380; i=deller@gmx.de;
 bh=x9vTxoQVMIBYa4egvTWqg1s9EsIH2uXuVj8h3WxMs/4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=p7MV0I4oRFVwnrXAFQKBfmYDUQan7/41t1QFV5QysLt75ie+fiFtLqovoveE7GdE
 oNKpgsvsMjmEp9wyosz074wqVqzyt9ZRDxIM5g2lscfasPA1SCUJ9YD2Vpt3YImR6
 SC9cT11/AdFbjsBJHnzNeId7qjbQ39nvp6AAvxSoVGA03Kiz2MHvAbh7f6g8vDggr
 g+2ulgEyehK3Xuwe5IjNHG4ByThpD8KCsuEt1dri6ZXkjDOMemY875oFUhCLXC88D
 nJQHeymqJNXoj6+i4hoBYtH+idQxX4iDdn1CZ+lmnVHzVmSXOzS/ruOAdGq5ZrIzI
 Y5mpbbdS7/tqi3Pwyw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.53]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzhnN-1uKJpF0NA9-013Y1d; Thu, 09
 Oct 2025 01:03:00 +0200
Message-ID: <54ed44ef-7f89-4f56-b2c0-f36b2f0bfa63@gmx.de>
Date: Thu, 9 Oct 2025 01:02:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: Fix logic error in "offb" name match
To: Finn Thain <fthain@linux-m68k.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: stable@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <f91c6079ef9764c7e23abd80ceab39a35f39417f.1759964186.git.fthain@linux-m68k.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <f91c6079ef9764c7e23abd80ceab39a35f39417f.1759964186.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yszPytJKr1rUEp/XtQ4Bbg2NOYg2Ekx52TPQz/roI8zj0uqf5Xg
 B07UcTt9CysMkdH5e0z7BQ3kbKWn0fX8mQk/3RUu+jQwhATo0uo5IAiUTkbHcz3ceQK7+c3
 P3fnVjNGcoIFbT0Djs6Xh6Auk9Mn1THO31zxmpZ+EK9JGnCds4YVGtZnBCNDPa3VoG2MVsU
 jZXLUEtCrP8jjTjLJTNDw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PjASLaVM4L0=;MURyKVSoKhf8q5jSV9Je+CV8qjI
 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
 9bmxUBOPO7OHDKi2ZLWhcvcJEI=
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

On 10/9/25 00:56, Finn Thain wrote:
> A regression was reported to me recently whereby /dev/fb0 had disappeare=
d
> from a PowerBook G3 Series "Wallstreet". The problem shows up when the
> "video=3Dofonly" parameter is passed to the kernel, which is what the
> bootloader does when "no video driver" is selected. The cause of the
> problem is the "offb" string comparison, which got mangled when it got
> refactored. Fix it.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 93604a5ade3a ("fbdev: Handle video=3D parameter in video/cmdline.=
c")
> Reported-and-tested-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
>   drivers/video/fbdev/core/fb_cmdline.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

applied.

Thanks!
Helge
