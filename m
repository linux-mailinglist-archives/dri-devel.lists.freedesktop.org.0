Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A50FC9FA447
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 07:08:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CCB10E3E2;
	Sun, 22 Dec 2024 06:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="JHOHhvFV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A6910E3E2
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 06:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1734847677; x=1735452477; i=deller@gmx.de;
 bh=g7AGUZ1WZGlxSeuOE65nf1fN8bWjHi+egXxKLgU/v30=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=JHOHhvFVBgGsGQAnZBAwJX1xFyoDuzBukMCzb1q+ptKhvbkoqst4W8azsWUbDs1K
 BsarvdF4XYAnT2pgASe95LffEjpnIEK/DQiu+rAr+uXuEYzoJAvQvqgJ7YkPOcl5y
 El3LD7+BG7C0ZW4RydZ0TXuJ7x/GGYElLhG9VU4SO0+mh/Z/TstlRlnkFwT9iMYm3
 gVZ+Hc0NDaFV37O5ZnNFrKtUwQzzy4CAywNyWWj3NL4zl2Ie95YUjiJ/Rg679kJFu
 hWhONmNLx6uMxEBUEOrQII4MJB/alipBhQt/QuaFRA0S67yFDx/9obWBnOy9dz7v2
 NOvMqU3X5YbdUi5Rag==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.155]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M59GA-1tO8fR0oDM-00EzRr; Sun, 22
 Dec 2024 07:07:57 +0100
Message-ID: <b47d7d6c-68c9-46ae-ae7e-21289e943183@gmx.de>
Date: Sun, 22 Dec 2024 07:07:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: omapfb: Remove unused hdmi5_core_handle_irqs
To: linux@treblig.org, linux-omap@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241218015937.278817-1-linux@treblig.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241218015937.278817-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xDy9KOT19I/v4JQLjrsOykhhwWsgvprgXtVKYP94WxyEuvjzlg8
 t5yigYPmJqBFSUqLpzipZpmzKqNOrSUklxg2owaOAbcyAMfufPKLS7psjEpBE6lGdzjGe4q
 2cptNqGKzoM57POhgbT+N1VJpHeeQEN8dtjixySmlDDS6EgaQvPd3wMiEskrdBhdtTmVm/v
 WuxB9R+0aOqhN6RhZPj8g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SQqzZ2fdyNM=;l8Q8gTIKx5Iu0Hy76+5IldpFWMP
 fecHrCSY1hFdRRQkXoGylmpsQrWBF53cp3o8nAym8C/vWoYG74B4ccumQaNQ+P58kzUktD45q
 ydFKa/7Q/SapQFGBRT1bzNymWck6J5bHTaJZgHhEwOsjszvC0F84YiV7RlDnJTqiZK1HnPuo8
 21qgKc6aB9XCrLzx8GwHe/hhfr2vOk6yMX3Q6FfQXK7mdAooST4zaIGuaxeF/Ovwmb+h3pVUN
 i+yhotVbzxR7epwL3AEYutV+G1/SgWwUwL1hzj0FSsomFlvsbAjtvQLLQWASOniQA64EKdr1V
 m/e/c1/TzuyGBTeV7yS0wWTnKyLUayplHglsHXBFQw/fdan1KlypMIzCAYxcLrA+MoapLq34r
 X++1oInvlZ2SCD2tQXEIa5RNzLNlFVUJgfqzG7Xhbjiqr8PaoMJ7sWBtbQHL/HjlZlWoFcr5f
 TN4fLxLVesDWs/zcBwVWruWqouIjijEl+ig5IfG3bUP1D+gV4QarDm6oSnog2u748/NimRNKK
 IOQQXAiaCX4p1OdGRMeJHbJYSkwrfk/m1TMxm/z/V7KCwtyybuYXXbt6Ee4cl+7i/+p6965jB
 J5lovt+bMGYOiRtwqHP+8b7JtMq1M2WbyH7ea+LGqYaVhB6q8Lw9HrZ9q8Uxp0sN/b8Dnvf2l
 gSxee6TtBYx5rf42ld+CXkZtmAyPyBeymOTyTE8ODx1/s4Ob2d5BLlNel2O8c51pPdvozAgZJ
 LbqM0RbKZUri1zSedpFGIzw9MZHE87Zj97fkkKjgwffYxtEnewIyotxwKh4KpnD9skVrrLzSt
 gopw9w0lZtTYedHkASDS7Z8XDq6UmIwk+xRMYQLTS1s+4FKrSm3ImCNYV2FlUeBJEB/nSfqxC
 JLRbM5dq9reM9cvMjEP1QyPxMWMjjQ2C8nN1rbbcbEnI1WhYUrUksbMwTL9hKWTpkVplBb2u3
 tk9sHpGg3DcE6zjD7Tgh0Cmk/JJjfeEzsKgaPxKJp2myzslEjpsJp2hxtw/B/zpnVapp3H/ZH
 E5HFA5tzlFHeEzqwUnTl2fGwDgt7eSNMaMrrO/IW5gh925cxnYDjPPViVG1rNeRnXaxiB0DQ6
 Mj51zfD92IIXwtd5a45FiTWWDOJqiX
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

On 12/18/24 02:59, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> hdmi5_core_handle_irqs() has been unused since
> commit f5bab2229190 ("OMAPDSS: HDMI: Add OMAP5 HDMI support")
>
> Remove it.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>   .../video/fbdev/omap2/omapfb/dss/hdmi5_core.c   | 17 -----------------
>   .../video/fbdev/omap2/omapfb/dss/hdmi5_core.h   |  1 -
>   2 files changed, 18 deletions(-)

applied.

Thanks!
Helge
