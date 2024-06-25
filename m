Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F3791682D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 14:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DB810E207;
	Tue, 25 Jun 2024 12:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="fZOJ29Bo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DAC10E207
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 12:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1719319254; x=1719924054; i=deller@gmx.de;
 bh=6DnJSkhTF263LRHIDsc/RuBomqMyNgJmJNDVqGHIMdk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=fZOJ29BoHEsjBpIH5Ds3yOzi87xnfkKUXyENmtXzIJVkJotPtyb/mWKbCtBEuUeD
 jGU+EoKHaUWRjlhh4RzM5MT/NKlyg5NzCFzZPaxG69f9m1gHu8ApmZSeqZXASsH+x
 Ao4QfyvFL8NyEMaBiYWoqiXvduXJKAxszXYOCqUN8ZcXnw33e+p01g3AMDLun3t/0
 EQ/0qqjM5PmaHPC1DtkLPqzDZ0mgwzZmzeEFee1lXsJe0O61eEJ0RRgXGoLTP5046
 9vHaAorG5Bd2WqyuO3hEGokicOBsejOLbtEuH1B5iJQAI1vLbPlcMgS+UFlltAni4
 g0TOmXzfig5KpB8Wzg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgeoI-1spcrq13q0-00gQI4; Tue, 25
 Jun 2024 14:40:54 +0200
Message-ID: <7a209bc9-82bc-4c3b-a9ad-6ee17280b0dc@gmx.de>
Date: Tue, 25 Jun 2024 14:40:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: mmp: Constify struct mmp_overlay_ops
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <c5c1a26fdbf0895d1b17010f1c2da44b18b4ae55.1719259171.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <c5c1a26fdbf0895d1b17010f1c2da44b18b4ae55.1719259171.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2mUriBY5Bh6IvsmIPOOVoKxrCpFOTtSxaZOZ8vNrpHn3Nd16/xY
 MHdfg8HK6bJLGKpALBi0EJbR4FmmgrnRQ9TCdHmRu9jOhfkOShSCtIP+xT9/yzYNB1fi15s
 Q4Um2Mf4EvK6YQ03aE/qbmxwqfSoeEQjg15VL9oSthWX4UBSaJGHzZScScpHC2iJMrmuTVI
 qUEDG9T+vxZBSORg/kwQw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:V5JHoB5155M=;tEDyanyxld9/6d4nMIFBNKfOm/8
 8I/Dmwa9w+nzNuWeWjBivsoamI/qk3g2hunQRj6mTJByGjZLE6Mu+DwHpo9lhzC7oqoIycsF4
 emfkqmF34iS2rLYmCSmRiROxHqC3tO1qINkWeKcLrD/b/RStdkiLw1rgmrn4CFnlbeu8pgfmP
 1qj8rbmooLxile84FK+LcWEqvWBVjfHUkq0bv1eTSoPETHhWZPFFpxmd85PXsDzYRsgTHUiqX
 MEDrZ1czKWvf9vlyewyIEawfeg09nzvvQVZAhfxrbCynwXWh6ndLzxCvEJju+lXSMz+DUw0M7
 Ko/SvRjKXVBSdU0k1ZM+Y6DoXsvbF/jWEE2SqGKXa3DZTBkH9xOX/ZOd5Cbs1ZHyQZKqkoSFz
 devtSYUYdJkVGA/5FlM4AQx9R+0NraflKCiMvJDtdYk3uw5vzv0/mEGnnHVfdqnLO5DFRFS//
 ppXi/39j0LU3h/L8vTGaNFWIDYS/PybFv+7K+OOKdBtPBOHj7cpgniSonwuJ7m+Xn8rv8pyCQ
 OqnOcISgzopz2MKSImJdgfO+kpkBxOWwL6f1UgXG2qOv8MfMNoOIUDsrNejIReLVp7ehpm/FW
 IZbnEaJMoNtxZiQOUcNGM6UzC7bkEMrfjHKe5+Iw1mpwHRDlLHSxTW7Qj55V3v90UxwoY14fr
 RrX/9AXrfDgwO3euEIMdDxKiD3DPJOD1ekAbtJTtcJmUpNmmag7oI8pgGo8VRsBnzm9tssgMP
 /Chy15SzI8VxHadpfZLDZvvFFTEZXOQJ+jEWaFW6ByYPcNV51qMpEuRnwSLRDxg7IwTX73Fn3
 merqNnvdD0FF989PBKvCxgJ9ZFEBanCpWG3wwXaAUZIqs=
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

On 6/24/24 21:59, Christophe JAILLET wrote:
> 'struct mmp_overlay_ops' is not modified in this driver.
>
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
>
> On a x86_64, with allmodconfig, as an example:
> Before:
> =3D=3D=3D=3D=3D=3D
>     text	   data	    bss	    dec	    hex	filename
>    11798	    555	     16	  12369	   3051	drivers/video/fbdev/mmp/hw/mmp_=
ctrl.o
>
> After:
> =3D=3D=3D=3D=3D
>     text	   data	    bss	    dec	    hex	filename
>    11834	    507	     16	  12357	   3045	drivers/video/fbdev/mmp/hw/mmp_=
ctrl.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested-only
> ---
>   drivers/video/fbdev/mmp/hw/mmp_ctrl.c | 2 +-
>   include/video/mmp_disp.h              | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)

applied.
Thanks!
Helge

