Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F300297E05E
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 08:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E477410E1E8;
	Sun, 22 Sep 2024 06:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="SRx+vsQT";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="UoXzapZM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.220])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9081E10E1E8
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 06:48:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1726987685; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=MYR4tQFr7kAQi+wJfpD94U5Kx+w+mWBb49326ETPIRoJ0gEo0J8aCuOO3WHIF9cf9g
 wjfMQj69w0wZRsIe/TZTCPLcD2wkRV8l6GI0oX7f1FoPlGm9kCwPOFVsLDe9YnN8alIJ
 51vNwD70HQkDTcqBocfwfvylaw6iv6BeYnCjVrYJuxXsZhTh+no6mHKV+cUS+8Bkn3sh
 Lc2c47YXLH/61Jq2cLMxweYM7bshcF0Ezyl9B/2aKV+XHO4428oFDMT+EBNf5We+3DaZ
 CwakSIcn/fOWe4b9tyG92nSMFVCfiXKSIUQ4G9KRpVY7bc+M0qza9rTOGQ35I2asBZ0l
 8cgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1726987685;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=/QKSFjyHMkCdT5RdiYB/Z3t/gNdAPTUMro1qIqi5+wo=;
 b=hY0/XbS5QczsCO11KJ4HwVdIoYPMo3BGRnzKVWBEvvVAb1Wp1BLiIszfFEc+JtHkF/
 i2U7tplbQs/5NGgz0pV98jQoIKO2aB4G8Ma1BLBEJKGaqefXkqOarv+us7RaRqaVcQkw
 wL5/ylWsrfHFSyrNYEeFDPlxQ06EovETL36s0vNogcV+fQRK9HO+RA0QQJY+qmDfWe7j
 Y4z9RJ3xAlITUOxddXqLvH9z/InLBLBhcNjFpBV+bMnxP3gLuDRQ6q347QsAmBkhYG/I
 22ZJhph4JWg2KuuGoaCnHpkePIQo2NZiDvRSRlAkn6xE5WLh37PLYDA9RzKcIWAfbN4y
 oESg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1726987685;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=/QKSFjyHMkCdT5RdiYB/Z3t/gNdAPTUMro1qIqi5+wo=;
 b=SRx+vsQTDwbF4BC4E9udPzJX6DhDDJRH5EGfc28onMjvV8Q6xqSZ7r7P/iQnLyack/
 ZVRh+Pc4BCNaVWxGQ4q4mIiOcNFoeKMiIFRyNPzC4X1ueSFNv6zfnESsCASz/4jc8/ne
 iTYvkgD3zgz+7lExGSgfRkVsjQZGv5QXZPOj0+wCNWbonW0Bf2bAHCe0Q/1PArQWuFyv
 lQHFio6duiKPEvHNleGIEo1p1rKPfIcbXK0fOKZoixVxzPFLvIutlYCpuks33uazoSn0
 UPettOqJfajozdKjIOy19d8zBx/jRodQW2KSiNqHdm3mq7KtXEYCRgQP8zxMAc/fD3PL
 2NAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1726987685;
 s=strato-dkim-0003; d=xenosoft.de;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=/QKSFjyHMkCdT5RdiYB/Z3t/gNdAPTUMro1qIqi5+wo=;
 b=UoXzapZMHk/XB7OjmTAzXNI3lHsqr3hTON63kgxMXXTIyrU9aF/ljM4A0cWBPHbHa4
 SCvZL0MT7hVdL1R9HWBw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr44+gKidpmhkOpz46lpM="
Received: from [192.168.178.134] by smtp.strato.de (RZmta 51.2.8 DYNA|AUTH)
 with ESMTPSA id e0da1a08M6m42Sg
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 22 Sep 2024 08:48:04 +0200 (CEST)
Message-ID: <ac6ced8f-d063-433a-8660-73ced7d18dd4@xenosoft.de>
Date: Sun, 22 Sep 2024 08:48:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Kernel doesn't boot after DRM updates (drm-next-2024-09-19)
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Cc: mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au
References: <f163bcec-e5b1-4aef-91dd-431736fd6d11@xenosoft.de>
Content-Language: de-DE
In-Reply-To: <f163bcec-e5b1-4aef-91dd-431736fd6d11@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 21 September 2024 at 06:15 am, Christian Zigotzky wrote:
> Hi All,
>
> The lastest Git kernel doesn't boot anymore after the latest DRM 
> updates (drm-next-2024-09-19). [1]
>
> I tested it with an AMD Radeon HD 6970 (Cayman XT) and with an AMD 
> Radeon HD 5870 (Cypress XT).
>
> I reverted the DRM updates and after that the kernel boots without any 
> problems.
>
> Please note: Due to a lack of time, I can't do a bisect.
>
> Please check the latest DRM updates.
>
> Thanks,
> Christian
>
>
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=de848da12f752170c2ebe114804a985314fd5a6a
>
>
>
I replaced the new Radeon DRM driver from the Git kernel with the Radeon 
DRM driver from the kernel 6.11. (cp -R 
linux-6.11/drivers/gpu/drm/radeon a/drivers/gpu/drm/)

It compiles without any problems but unfortunately the kernel doesn't 
boot either.

Have you tested the new Radeon DRM driver with AMD Radeon graphics cards?
