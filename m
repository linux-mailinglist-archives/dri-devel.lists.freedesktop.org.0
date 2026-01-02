Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7146CCEF387
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 20:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE3610E15B;
	Fri,  2 Jan 2026 19:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="lbY4aILq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C2810E15B
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 19:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1767381051; x=1767985851; i=deller@gmx.de;
 bh=CqxWdNNNuKJFGf7GQHrnO5nTip6NFKdpo/xr5XhRsxE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=lbY4aILqz/oDnwBMMAnzfKQ+jh4NJHcEo1B0BxrkJa7+EV82fDxgymH8r+tZSM5v
 KhFNm1BTQUV/DptRov7CMzsYN0wXnI4pTD5dS+X949uXPSTNNVHQ4T+jA1PaJAgX5
 FE6+MeIp60xXEncmazfh56Y3IYxYOcqjRAPSOkI5XEbklKCA5FbTsOhfdobquCwOj
 fFVk6qn3kd/dJbSi2k/jwTwOnfgn46TbZ3ODTfqNnBn2RRwyTqH47ss4prrG+F51h
 ZsRnN5qiqmdIiRJp6sPyuDFow0Qlinm3BfFtZ0strX5RA+Lz4IjLrMjsOx6evXuG8
 uvJevPEX+fldL6wNNA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.142.105.83] ([138.201.30.247]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9o1v-1vYiH01qkf-000jMm; Fri, 02
 Jan 2026 20:10:51 +0100
Message-ID: <7d2fbfe3-eac9-421b-8e75-8d44b26fd2b3@gmx.de>
Date: Fri, 2 Jan 2026 20:10:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drivers: video: fbdev: Remove hyperv_fb driver
To: Michael Kelley <mhklinux@outlook.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "kys@microsoft.com" <kys@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "decui@microsoft.com" <decui@microsoft.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <1766809486-24731-1-git-send-email-ptsm@linux.microsoft.com>
 <e37ef037-fb4f-418c-937b-b3deb632d0ca@gmx.de>
 <SN6PR02MB415700F34CA2A4296A542F73D4BBA@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <SN6PR02MB415700F34CA2A4296A542F73D4BBA@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:u3vcq0OaX+HmjVRBaMQ2uGl8IYVgD4wk87gv6fBfCpbA2vozIoV
 ndsPCAdmyhk2I82+MzSYpjUcfNLL42dfSDzrK8kmu+hyjM+oECjVXoiO6ZI0CMfW4yyxphr
 4WMPvbS0QuUST6/W41A4zQyz9Vc2OWtilJ3wG708h1haw+aa2x7yZkeU9Wt2Jwo6GRcsAVv
 aacVejv3HTLDDUudaP8Cg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KGsK3SzpBfY=;CLwhj3s5ktwZ6E0BrGVsuGqECA2
 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
 rkoIl4DY=
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

On 1/2/26 18:45, Michael Kelley wrote:
> From: Helge Deller <deller@gmx.de> Sent: Tuesday, December 30, 2025 1:07=
 AM
>>
>> On 12/27/25 05:24, Prasanna Kumar T S M wrote:
>>> The HyperV DRM driver is available since 5.14. This makes the hyperv_f=
b
>>> driver redundant, remove it.
>>>
>>> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
>>> ---
>>>    MAINTAINERS                     |   10 -
>>>    drivers/video/fbdev/Kconfig     |   11 -
>>>    drivers/video/fbdev/Makefile    |    1 -
>>>    drivers/video/fbdev/hyperv_fb.c | 1388 ----------------------------=
=2D--
>>>    4 files changed, 1410 deletions(-)
>>>    delete mode 100644 drivers/video/fbdev/hyperv_fb.c
>>
>> applied to fbdev git tree.
>>
>=20
> Helge -- it looks like you picked up only this patch of the three-patch =
series.
> The other two patches of the series are fixing up comments that referenc
> the hyperv_fb driver, and they affect the DRM and Hyper-V subsystems. Ju=
st
> want to make sure those maintainers pick up the other two patches if tha=
t's
> your intent.

Since the patches #2 and #3 only fix comments, I've now applied both to
the fbdev tree as well. If there will be conflicts (e.g. if maintainers pi=
ck up too),
I can easily drop them again.

Thanks!
Helge
