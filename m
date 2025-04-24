Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 171F3A9BA84
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 00:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383F310E87B;
	Thu, 24 Apr 2025 22:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="USy1YmjJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5AC10E87B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 22:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1745533079; x=1746137879; i=deller@gmx.de;
 bh=DCFXlP1lPVF5HDKqfxdGzygoHRAILaoMhdLJkypLEAY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=USy1YmjJd4Ey7S3szIcXTD7vsRT1Ti9QijBAGV1UtL24jaNDGjC5LbmXvuNMWXNE
 M1qUlmK7YTL7fF/BOA/wHlQe5fpRQmjF3sZfoZpaEvML0/Ko7fIhyVGPmUrVxhzR6
 lhIGGhN/E76fGsJeOind+87BsEs1kKE0GcFFifYgVuHTr+xxBA3P0J6RmUBWSdAjX
 nhKUNi+4lkozAKSxzhFqX1lX/MN8D+c1+o0ZnYecFHUEPTt9HaA4RzDkuleUGPxUR
 oSTeNoojOrllYTZljSTRh+1zlUq8GLdujAhXJrX2Jz6VzXPh/qAhUl3uxypTt50qq
 2tt4jlcUfrL+fA/n+A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.181]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbRjt-1ufDhA2sJd-00b9wn; Fri, 25
 Apr 2025 00:12:25 +0200
Message-ID: <e692bdb5-ee0c-4d2f-95bd-7675c03ce78a@gmx.de>
Date: Fri, 25 Apr 2025 00:12:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] fbdev/carminefb: Fix spelling mistake of
 CARMINE_TOTAL_DIPLAY_MEM
To: Colin Ian King <colin.i.king@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250418125135.539908-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250418125135.539908-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+EGv9gmjC6p0gfCjO6+H0FLrF46ATBsWbVMsIr0pGTz986+bh0N
 FMY4oeXhFEnKQFDeg6vzY5WEUljO3/WvgT7rRW8QV7NQ6VRz8dzpee87cwtnBSTFahhSiKZ
 txI5L54G3iq7NwchIJZ+Z82hy0NkoqBZiZYPZRKW8dlbBQJZsFDQ45uzNG10RcUjnP4truM
 psqxk4omvGEjYmbW4mSaQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:35WEH205RT4=;0Ya26dF0amHhwzz58MHGVZXg+g6
 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
 utqTy5gxFfceywiWq+t8Dg=
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

On 4/18/25 14:51, Colin Ian King wrote:
> There is a spelling mistake in macro CARMINE_TOTAL_DIPLAY_MEM. Fix it.
>=20
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   drivers/video/fbdev/carminefb.c | 8 ++++----
>   drivers/video/fbdev/carminefb.h | 2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)

applied.
Thanks!
Helge
