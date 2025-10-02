Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DE5BB2A40
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 08:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0609D10E78F;
	Thu,  2 Oct 2025 06:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="XFSjCfCF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 43526 seconds by postgrey-1.36 at gabe;
 Thu, 02 Oct 2025 06:42:22 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EC810E78F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 06:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1759387310; x=1759992110; i=deller@gmx.de;
 bh=weHtQUu4s37i804L0XdRLpMZNzGEZ3I+ZUlKrQx8htQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=XFSjCfCF9dFDgedBMlwJWY1rsZTbfb2o8xOuf6+bucxx/HHkdKrrtw1XtlQ3tKjr
 8Mr+v+LaAsi1fGqDkbhAmtxc4pKKnqtyKjwcOGeoZEnQ+npJITm8oIj87uxbcJARj
 RMsmm9WJq3PxRQIDNeojW0y2AJMIiSKGzw3YURAIiCKyGKS7kRK59FzXaJV2mLSJb
 mhCw1FsgwlA5/qiTJla11a5amnsE04ii2Id1tLlmLJIs61fXBRviOI7QfBbh0wpAk
 Q2+U4lYwjDaMKbPmilLOyLGQpnMOh2bVlw1arwZrhncogto4ONrHo6NittwGzpeP5
 +YQ73meHKTI++OYF7g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.64]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MowKc-1uVhSq1Bde-00ptSq; Thu, 02
 Oct 2025 08:41:50 +0200
Message-ID: <edccab86-321b-4e6e-998f-3ce320ee0193@gmx.de>
Date: Thu, 2 Oct 2025 08:41:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: udlfb: make CONFIG_FB_DEVICE optional
To: sukrut heroorkar <hsukrut3@gmail.com>,
 David Hunter <david.hunter.linux@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Bernie Thompson <bernie@plugable.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Zsolt Kajtar <soci@c64.rulez.org>,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, skhan@linuxfoundation.org
References: <20250924175743.6790-1-hsukrut3@gmail.com>
 <202509272320.3K8kdDCw-lkp@intel.com>
 <bb9d90ca-aa4d-4168-bdc5-543109c74493@gmail.com>
 <CAHCkknrZ-ieNKeg-aj3-NVqgGSk770jJpUpCvn_SuffkPu+ZrQ@mail.gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <CAHCkknrZ-ieNKeg-aj3-NVqgGSk770jJpUpCvn_SuffkPu+ZrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CTMmM95R5Lvu+QxHew8fZp1BvbBOUnFZMFuVq3AOClpLTZizESo
 PVJwPpv1FVWzrdKk5j0TJT6eGL7GpxtG7uYMuTr86DKe80jO16MPc7sz8AlDlte91JaXXWf
 WeIywvIlyV6OdkfzndrwnIxbyy3OeHZjmh9qaWyO7850gQcmCf/RCKuyQD1h4htOkNolipq
 RktzUgxfc9iCedxtm8FPA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eDrXRK8+vSM=;1EFATY7lnti8G4nbuds1K5PuCRl
 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
 Uahmg==
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

>>> kernel test robot noticed the following build errors:
>>
>> Did you compile and test this code before submitting this patch?
>=20
> Yes, I had compiled & loaded the udlfb module with no errors. Please
> let me know how to proceed in this case.

Look at the reported build error, which seems to happen in dev_dbg().
So, maybe in your testing you did not have debugging enabled?
The report contains the .config file with which you can test.

Helge
