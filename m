Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0694AE8FC7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 23:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4728610E239;
	Wed, 25 Jun 2025 21:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="q6D9+mab";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C402D10E239
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 21:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1750885305; x=1751490105; i=deller@gmx.de;
 bh=V8/EzIWR/vi4b7OkzShs9MbVv9esLGpvCH0GSZvFU24=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=q6D9+mab7hWwLtQmnRONcfILyIsYk0M9k7QKKA6n/68cSpDklmYNEjdBNPrTNIiE
 oAtsiOmObgLqloJTUlg83V0V6m1P/01agqPfNlQkzKHDGMX2vhO/2CUgg08S4qcWB
 IfJECAfU5z/gEJGS+1wo+R201FcNlcODzLPKxFJ0Qt4KEST/VNUYsY7AH5aT5RpKy
 DID0D0QuD4bBG37Xs1lfebSdhxD7699jFbM0voQKNRpoIYf09V00L+yan6vIqVIrq
 vXh9MzcUpR9ztXKeDlQyIhT2cbk/YzlOKUIq89UP/C+sb51v0KpDzy3Hktr0yBtY6
 OIGHbdJlPeo+vvwaaA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.171]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MjS5A-1vAzX10X8s-00iVUQ; Wed, 25
 Jun 2025 23:01:45 +0200
Message-ID: <e4afcf95-798c-4b29-a04b-d927e28504ce@gmx.de>
Date: Wed, 25 Jun 2025 23:01:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] fbdev: remove fb_notify support
To: Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250625131511.3366522-1-arnd@kernel.org>
 <20250625152033.GA183878@ravnborg.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250625152033.GA183878@ravnborg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:M2dNYQLr9sleKrchujq2NPLmJrATByZ+0sZ/B6NDz69b593qz8u
 iih0zrEFSJAnKlLz6yjOb7e4kI7frHJErOle/utF4o8y6ARKuC+uAoiRU8BvSQE0pKoDew2
 XA+Du192uO9Q4YsHtF3d64c30oy+3rHwmbqR7RDknRlpJjiXKc9zEFj31mOMDd/97TYi3BB
 YOCwxK0hWzu1nAJuaUgHA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sPbPngiuj0M=;2suuijsSa2730ULZQyjYsxE5d6e
 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
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

Hi Arnd,

On 6/25/25 17:20, Sam Ravnborg wrote:
> Hi Arnd.
>=20
> I remember I stared at this code before, good to see it gone.
> There is a bit more tidiying up you can do.
>=20
> Also, I suggest to split it in two patches, it itches me to see the
> driver specific part mixed up with the fb_notify removal.

I assume you will send a v2 patch series.
If so, I'm happy to take it then.

Thanks!
Helge
