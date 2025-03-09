Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E884A58076
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 04:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB77110E1D9;
	Sun,  9 Mar 2025 03:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="tmgvnZyI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B38E10E1D9
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 03:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1741490009; x=1742094809; i=deller@gmx.de;
 bh=rjmhWO7YshVYaO3VTwGppDp8Y0zEzlqETCqjOyQNrF4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=tmgvnZyIj/4mZ3y0fjUcoIUsjxyQpNhL66biHSDXtv4Top+FoFR2eCQAlDjOls1q
 WpePaTFhiPVQ2x9bX1FSsE7aPp0GW5HRhiweMcMFCN4y0fB3MP3WXYcpj2kGnxIIS
 Y6GKuUA5QAG8nJhvGqoZmj++PUt6nNO+QLNxOkxkvuPtNolGBo8Sh/nU/15zE0xAW
 33VDySFWv+l605Q0WQtp42LeIAxNyaeppRYOaLwJ3fkIlWEnngzCVmaGL8HkmgWdK
 CcUjum2hzsgtzxnthfkBginBDCUJzlPkEDk0+eBMbZG3zE1/poqqtqPvvu3STCH0j
 3dE5wOoQ1Rm8HLr9QA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.121]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMofW-1tYTl70iIu-00PvtZ; Sun, 09
 Mar 2025 04:13:29 +0100
Message-ID: <a9e66174-c4c3-4b33-935d-5867110c6682@gmx.de>
Date: Sun, 9 Mar 2025 04:13:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] Refactoring of framebuffer drawing routines
To: Zsolt Kajtar <soci@c64.rulez.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250224205908.26336-1-soci@c64.rulez.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250224205908.26336-1-soci@c64.rulez.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:k+3+S1BiAgfuthiqOqcTejLNUHX18FJmWzghmafNv+l6FYfxHXW
 w948dnCV7QlZpeTD75wCtszQ+/MHcD1d+JRTOQ2cvr9ucH21uIQ91Ygt4dpCQHKZoDJoNEA
 0GITvlyC9VkKVx/Y/bUBhWAvrHpm1gcQVQGN7yTHgWQz1Fi/68pVYyw3o292Afw967J7OgG
 pebzb0y+De0J+8Nfs2Mag==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9CSL6djg2Ho=;nXHRfoMCfEpYLH93SVRyvYnepO0
 +QR+mgQqMhO57Sx7jGdiqUphtph8QtAdCPoNOCT+w2WViqlVkDO7zy/Rf6oJi1lsDvQBN8so6
 iNfP7UBuOuER0hK3BkPiLaL+JmJjJ934bE67S+UtAV65JwjLhmh74vbSolpP4sy+ViZnsURnm
 KyX+fBrjbTTPKQLgV81OmW3na/yGsmE5i7cswV7HzT4Tl0ZHQOF/WXmB1ft9HMk4BMlj4JOAs
 zsNcZ0QxBKqRtyKKLbV1YqjZpNHbacVZc3xewvNJmKzV3mBuUrpycC2Ap9M1tDmOHZkebZswq
 taMme3qVlKLRShGzYmHVCVvTUSmkCv416d9RWIInx6kFFEO8vLUtAO1Uzj1agXJKzLg9g460p
 qrYx8ofGdlCy8m1a7e8IRoJvtJsgVEgqnzMayMyNQYb9d1koNtFGnWn6TG1fc94TY4+wSsGgQ
 F5ScT4wQEhxz2cGas1DWfajzoVc+wuhpNvOsitZJeZSwGpbYH3N3fpJPQrEz9SFB13lKsAiVC
 3XlcJLcv1qxUfTV1RCJBu12Hf7xgyV07Gh+1GDDGzF26yyziCglUkiXlOkr10u5l210FhdVB1
 dD542rmb2/qbGhnsjoM7ZYgA13EPIUQkZi7aKh7/gbcMZ9ZtSn4JdD9nDNPK9FO1I8ppAjZfn
 6cRuCjZ7JyXGKIAjiz7S6k3CBI0HJSdImxkXLW0zIOmFh2UVbg0c0M9ROqo9bZVCsc5O9zYKJ
 C5cMvJ2OSzHQ0rscfnPHoQtAaidVkm1kE7OfGcUP9LG6D+pWy4aTWN77g7KpxxFpoOyoWQpC0
 PtBQOPRuox0Bwla3ogMMDGtyjEzaD0AmKHVMkbi6ndjPlv1YO+NIiBfUY1SqvpHRydtvqgtZu
 FXA02XbZRyJrOcLN79wOOZ+yD48+ly3HwOEqNywz7UkMoQSQApTpoH5aHmoEZ5/s2cRaxYD6h
 H+r9P+c0/zcpEcpvDPyRYiS/dWfBO3g9gUKv8yq53fYZnxX1JBj5UFp717Rp7puqiPIH0DvgZ
 nEDZ6N4q2JA5MEv4kNnVSGsd378BAcjxV18fJ8PxuALLxkTOsTtJai1v3+oGJkAvTdqBLtowJ
 soMHhbEn4Z2lMcRoB5vQHQwZqN2+jtSGQkx9NwhSQmH4SCR4pTziHQ8fSEIL8+Es9/y7ViSau
 R5A3LY2ge9b9K1hNb2Y9+Yr+KjoKOlzCmMdTpojbI16YOOOF6Ktm0PLyD5mQW5nab8+iBJUwq
 HRHfNFNCSksQlW4FlUuUKafWzribjsdBo1YIcz3q1QFe1EsHse7lUgX3HeF2MM1Zijuj74fTh
 XZ8Mcqr9T5/lXLeJqPy3no4hP6jFVboh57reGUpedxJxBcp2tLyRv3KUNBBhFQYU2bNC9NLXE
 Pz96oB+U/BAYLy55JBWgH3urLnOhj4ncDlhxO3T3eXMk7OQkh8ilG7XM5oDSdw3n3AAiJJeSg
 1/8xCmg==
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

On 2/24/25 21:59, Zsolt Kajtar wrote:
> Proper refactoring of the framebuffer drawing routines. This time it's
> not only the merging of duplicated code. It isn't half finished either
> so the various combinations of foreign endianness, pixel reversing, bits
> per pixel, cpu word sizes and byte order should work.
>
> Added myself to look after this code. Based on the time spent on proving
> it I don't expect a busy inbox. Famous last words.
>
> Zsolt Kajtar (1):
>    Refactoring of framebuffer drawing routines

I'd like to give this patch a chance to live in for-next for a few days, a=
lthough
I don't like such a big rewrite as one patch. But in this case it's probab=
ly necessary
to make an exception.

Important: please add a proper commit message to your patch!
Explain why you do that, and what advantages it gives.
Describe what should be different. Is something maybe faster or slower?

Then, the patch did not applied for me and git mentioned that the patch
was corrupt. Not sure yet, if the problem is on my side...

Helge


>   MAINTAINERS                             |  16 +
>   drivers/video/fbdev/core/Kconfig        |  10 +-
>   drivers/video/fbdev/core/cfbcopyarea.c  | 428 +-------------------
>   drivers/video/fbdev/core/cfbfillrect.c  | 362 +----------------
>   drivers/video/fbdev/core/cfbimgblt.c    | 357 +----------------
>   drivers/video/fbdev/core/cfbmem.h       |  43 ++
>   drivers/video/fbdev/core/fb_copyarea.h  | 405 +++++++++++++++++++
>   drivers/video/fbdev/core/fb_draw.h      | 274 ++++++-------
>   drivers/video/fbdev/core/fb_fillrect.h  | 280 ++++++++++++++
>   drivers/video/fbdev/core/fb_imageblit.h | 495 ++++++++++++++++++++++++
>   drivers/video/fbdev/core/syscopyarea.c  | 369 +-----------------
>   drivers/video/fbdev/core/sysfillrect.c  | 324 +---------------
>   drivers/video/fbdev/core/sysimgblt.c    | 333 +---------------
>   drivers/video/fbdev/core/sysmem.h       |  39 ++
>   14 files changed, 1480 insertions(+), 2255 deletions(-)
>   create mode 100644 drivers/video/fbdev/core/cfbmem.h
>   create mode 100644 drivers/video/fbdev/core/fb_copyarea.h
>   create mode 100644 drivers/video/fbdev/core/fb_fillrect.h
>   create mode 100644 drivers/video/fbdev/core/fb_imageblit.h
>   create mode 100644 drivers/video/fbdev/core/sysmem.h
>

