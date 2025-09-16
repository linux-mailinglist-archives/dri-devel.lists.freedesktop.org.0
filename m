Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCF4B58CDF
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 06:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C49F10E63E;
	Tue, 16 Sep 2025 04:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="fuTrmShw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id AC76110E63E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 04:37:12 +0000 (UTC)
Received: from [10.94.176.163] (unknown [167.220.238.195])
 by linux.microsoft.com (Postfix) with ESMTPSA id C14F720154FB;
 Mon, 15 Sep 2025 21:37:08 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C14F720154FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1757997432;
 bh=TsF1tN5HktiST0NuMxgGEIwidWlEyKyRgB4CNwSS9tA=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=fuTrmShwbV6fFQYGiCQmuhPZ5N0LKvSjFtw3Ba5bmX7qOVQcGpOf70Bsb7oQr27Ok
 6hASdAh364VNgm4cAslwjWkJ7Jr3DWLWcYYDhaQp+fecg741iZUEYloJFEHuOtsG1j
 b/NvOrvrGLRnFbTqQdtaoIWpqZN7hfN4aSLmws3w=
Message-ID: <b723ad91-e1ce-4b8d-8a0f-32ace00ad619@linux.microsoft.com>
Date: Tue, 16 Sep 2025 10:07:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/3] fbdev: hyperv_fb: Remove hyperv_fb driver
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Kelley <mhklinux@outlook.com>, "deller@gmx.de" <deller@gmx.de>,
 "arnd@arndb.de" <arnd@arndb.de>, "soci@c64.rulez.org" <soci@c64.rulez.org>,
 "gonzalo.silvalde@gmail.com" <gonzalo.silvalde@gmail.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <E2D7F2119CB4>
 <1757437112-2509-1-git-send-email-ptsm@linux.microsoft.com>
 <8a958fe8-fbba-4bd6-a79d-fd310f08f8d7@suse.de>
 <SN6PR02MB415755A10BD2C9D0E7F847FCD40EA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <ccc6011c-d1bb-48b1-bf35-6fea1b1e8a49@linux.microsoft.com>
 <SN6PR02MB41578C2984A84B4D0AA17943D408A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <d452d75a-5a0a-42c2-9ea1-fcd08b09176c@suse.de>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <d452d75a-5a0a-42c2-9ea1-fcd08b09176c@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=1.7 tests=ALL_TRUSTED,BAYES_00,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU autolearn=ham autolearn_force=no
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
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

Hi Thomas,

>>> Is deprecating the driver a mandatory step?
>>>
>> I'm not aware of a mandatory requirement, at least not in the sense
>> of it being documented in Documentation/process like other aspects
>> of the Linux kernel development process. So I would say it's up to
>> the Maintainers for Hyper-V and FBDEV as to whether the Hyper-V
>> FB driver should go through a deprecation phase before being
>> removed.
>>
>> Of course, the purpose of the deprecation phase is to be "nice"
>> to users of the driver by giving them some warning that it is going
>> away. That gives them an opportunity to raise objections, and/or
>> to do any necessary migration to the replacement driver. I suspect
>> there aren't many (or any?) users of Hyper-V FB that can't just move
>> to the Hyper-V DRM driver, but who knows. We might be surprised.
> 
> Let's mark the driver as unmaintained now. There should be a kernel LTS 
> release around December [1], after which hyperv-fb could be removed. 
> Anyone with hard dependencies on hyperv-fb can remain in the LTS for a 
> few more years.

Sure, I will send patch deprecating hyperv_fb driver.

Thanks,
Prasanna
