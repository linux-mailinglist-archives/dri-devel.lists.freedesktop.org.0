Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 329C5CEF3AC
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 20:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEF010E2D2;
	Fri,  2 Jan 2026 19:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="j/nHisvC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F8E10E2D2
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 19:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1767381675; x=1767986475; i=deller@gmx.de;
 bh=WymJsk01TdobLbY11hGO6JOfSf0avRd/EbjHnmlAlIk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=j/nHisvCmMMNqMgrO1BdTllKmUqb9AqPrn2VEmSB2ZXefRwDZFvmcde0ohVoASvU
 BSkTFLEmkIeC2wdNzGTaLHjMTZ08cn4vb59YsU5iezEiMFhuHaW1O786R+JkQGC11
 4efikEWiTPf+Q+DTKC2mT2/ws+8X3uZIvcnMqhywj5FPc3ZdqiHuUZxL+qclmVC4x
 BPQNI1bFZF0WNeXUYm+Qq7ADd9JUZhkAIWcb4faOMCNY3MG3w2biOIcqlFTSwifRa
 Z4jD8KjAJSpzWmd2fiQTPFuZT6M/j3SGQItE3kFJltK7FGmJEkAddjqvADfNi/bgj
 0bj4TojesLEwSZbXSg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.142.105.83] ([138.201.30.247]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGyxN-1vgzdI2MOR-00Bnbv; Fri, 02
 Jan 2026 20:21:15 +0100
Message-ID: <e7360fcd-d507-4272-8215-89b15a797b41@gmx.de>
Date: Fri, 2 Jan 2026 20:21:14 +0100
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
 <7d2fbfe3-eac9-421b-8e75-8d44b26fd2b3@gmx.de>
 <SN6PR02MB415706E623885B4173D238AFD4BBA@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <SN6PR02MB415706E623885B4173D238AFD4BBA@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vCrBymhKJWa9lAn94vag68WPkvEMVwqnVpVo9Mud4jG1UIdwSeL
 2SA5lFLtoeFJ3OJED62ZQV0AcXgrVK7+sES/KKaO90NLjuFWLgmIN5xx7MKCZ66MQRYLlC8
 3wOerWYHcB/j1q36uCdECUCslk7PbC43xC81UGci8zwV+I8VJeAWsHHlLYNR1WWGwxJUA6B
 V6IJtEPS5472jw9hTzT1w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jbfJRo6BUwQ=;jRQHPYRXJ76OOxS9GJQ3mJGy6T/
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

On 1/2/26 20:17, Michael Kelley wrote:
> From: Helge Deller <deller@gmx.de> Sent: Friday, January 2, 2026 11:11 A=
M
>>
>> On 1/2/26 18:45, Michael Kelley wrote:
>>> From: Helge Deller <deller@gmx.de> Sent: Tuesday, December 30, 2025 1:=
07 AM
>>>>
>>>> On 12/27/25 05:24, Prasanna Kumar T S M wrote:
>>>>> The HyperV DRM driver is available since 5.14. This makes the hyperv=
_fb
>>>>> driver redundant, remove it.
>>>>>
>>>>> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
>>>>> ---
>>>>>     MAINTAINERS                     |   10 -
>>>>>     drivers/video/fbdev/Kconfig     |   11 -
>>>>>     drivers/video/fbdev/Makefile    |    1 -
>>>>>     drivers/video/fbdev/hyperv_fb.c | 1388 -------------------------=
=2D-----
>>>>>     4 files changed, 1410 deletions(-)
>>>>>     delete mode 100644 drivers/video/fbdev/hyperv_fb.c
>>>>
>>>> applied to fbdev git tree.
>>>>
>>>
>>> Helge -- it looks like you picked up only this patch of the three-patc=
h series.
>>> The other two patches of the series are fixing up comments that refere=
nc
>>> the hyperv_fb driver, and they affect the DRM and Hyper-V subsystems. =
Just
>>> want to make sure those maintainers pick up the other two patches if t=
hat's
>>> your intent.
>>
>> Since the patches #2 and #3 only fix comments, I've now applied both to
>> the fbdev tree as well. If there will be conflicts (e.g. if maintainers=
 pick up too),
>> I can easily drop them again.
>>
>> Thanks!
>> Helge
>=20
> Any chance you can fix the typo in the Subject line of the 3rd patch?
> "drm/hyprev" should be "drm/hyperv".

Sure. Fixed now.

Thanks!
Helge
