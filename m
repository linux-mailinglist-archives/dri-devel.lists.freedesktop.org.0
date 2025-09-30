Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BB3BAE704
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 21:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD6710E09D;
	Tue, 30 Sep 2025 19:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="Un82hIUa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527DD10E09D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 19:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1759260382; x=1759865182; i=deller@gmx.de;
 bh=zpDlAOqI+ydM8xD/T/bBmSqx0agexm/IGnVsxtsU8Vc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Un82hIUauZN7T5WEk4UtrWM45X73za12N9qdD1f395ihUuaBSvRFw8uB0vGjqsgL
 Yuzd/5n60nlKiCoAg4zW5LgNLeTgeoV6KqdEKKIPGhD/nnMOwkWsN8dfnQ0q49X5d
 tty1GK5e7ArK6MU4/0golnY9Dxvp1KNODWVZkc5M3U/WDzu/cSVV+4isEy1PQHpOt
 B3MATbm+TkwyTY5JQkAxdz8rwkPwUHtYP+Trh+J0X72THauPmYjw7PPTxLPL9GwpI
 9uAEeuYnqlzwoOium8qVevx9t+b2vLmuTY3Hw0awUW00MMVfbUYBjH2AkY9n2afhS
 3pBL5Yk6vvxUAu32yg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.4]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1fis-1uJdqw1s8e-016VZ1; Tue, 30
 Sep 2025 21:26:22 +0200
Message-ID: <9d3b575e-f426-48e1-a6d6-1f1fbb12e55d@gmx.de>
Date: Tue, 30 Sep 2025 21:26:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] fbdev/hyperv_fb: deprecate this in favor of Hyper-V
 DRM driver
To: Michael Kelley <mhklinux@outlook.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
References: <E5C2A201B1BD>
 <1758117785-20653-1-git-send-email-ptsm@linux.microsoft.com>
 <SN6PR02MB4157B55FBE271DB1B75F8FBCD416A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <SN6PR02MB4157B55FBE271DB1B75F8FBCD416A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:TP3tdbqPzi1WcnrZEaoIdZ5qQi/DBxJKxi8GL6Z1bS/vZQqPGRS
 cBtzClm9b5Bvm0bqnIDXhi9NQdDFN+HH3hESUoFpC56QGhV6/2YPP8fQR6mHj2/1ZDQmchF
 xxZvfG+DlMC0bNUzcZ25dIAgEu4ciMuvIB1gvBOaIQe+7ee/ByccApeumCR1+Bt6OvVViA0
 AjQrL7Vic/D9sHaIZ988A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+3vTUbD5B3o=;CEnJLJ/gIaG0Ak0ymZS9BHDoyT9
 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
 uHEeL6RJXkZtAw==
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

On 9/18/25 06:01, Michael Kelley wrote:
> From: Prasanna Kumar T S M <ptsm@linux.microsoft.com> Sent: Wednesday, September 17, 2025 7:03 AM
>>
>> The Hyper-V DRM driver is available since kernel version 5.14 and it
>> provides full KMS support and fbdev emulation via the DRM fbdev helpers.
>> Deprecate this driver in favor of Hyper-V DRM driver.
>>
>> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
>> ---
>>   drivers/video/fbdev/Kconfig     | 5 ++++-
>>   drivers/video/fbdev/hyperv_fb.c | 2 ++
>>   2 files changed, 6 insertions(+), 1 deletion(-)

Series applied to fbdev git tree.

Thanks!
Helge
