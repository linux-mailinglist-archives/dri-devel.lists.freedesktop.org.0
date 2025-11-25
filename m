Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9774C85E42
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 17:12:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B4010E42C;
	Tue, 25 Nov 2025 16:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D8DkFtrc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E88A10E42C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 16:12:38 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7b6dd81e2d4so5231943b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 08:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764087158; x=1764691958; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=TP5XvRlyQevi1mADwGCaWb8yKozUyXV1WwxhEWm3bH4=;
 b=D8DkFtrcWb4StCggBarKUPLHoX90FL7d38Or3TLgAfKW+rR1zQN0C7ny2eiKn8cyxC
 okgTU8R/5wMZ+79s0oMbsosVQVdeh8ZvQKdrrP4ge5nhubqVcfAB4t37qoMvZ17Vtdwh
 /Ij10Cxek20eVxpQPDTKZ8jvHuesj6S9M6Xpp5NzrFc+936k6t6iTLVxTr9xm6v4oCjJ
 KcTBhje/BGS65KHqGTLxxFkxcmn6PgE4IFxm/DXBStJlUdrbUHSN3VdW0oWYibbLNfRp
 3DAmSgZHnGfwPAtedPFL0HVAK9den6kcz37xD4BBp0xpese4D8qwb7MQqp6xI+xHAiRf
 Cz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764087158; x=1764691958;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TP5XvRlyQevi1mADwGCaWb8yKozUyXV1WwxhEWm3bH4=;
 b=hWw+uT/L1FSkSb5pjb5/WIDf2botnprsZYEVbPTAW4WIQGyq//5G0Cl/qC4L2oCSEP
 h9REkzlobicoKFp4yKMIVQYeOg0cFa3ETtFwkvB5L07EuahVUQqawtuRHGDJJj5k3Db7
 Ni7fuJbxnZZ3nOXkrMoTi1YSH486lBN14UIVC7la2yncWm7TwzdoZQ8vxhe4YpypFH+r
 se2lahYy7Rz2OiyO7oNicsTccYNWyWAWlJ60MvVDUEul89K5yTUVjPGFhli/xdU/vsxG
 I//Ix0LIJ2I5lC3y815KspISlikVHe8iw3fN/YECJPyr4kiiDElhhlHQhCVkkdPo4yua
 UqUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+onCyhwHayfr/kVxhJ/uHPSFNPRqTI7vOJpMrz125uDoxvbHdlX+MxfMwJQscmM7BsgUHO+iVZqw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzykpUt4afX/fjhW2tpnubHXsy7kAVkzDj1nUYRfZP/bujT5Qyn
 8f+wJPbFsYZIZPHTK80criAAhJYMLk7aRU7OfbW4Big0QYsG9NCd5LLz
X-Gm-Gg: ASbGncsr15DEXZAPiIs0KkIwGlVvrCAZ2B4UC7pNpn+Mn1+Cn7CzWlTRllYnI8dI6Mh
 JMhQ0Ml/+gmKR0TQtqEa9T+VZkEJaD5SG+JV6vuAvx0G1aUrG10TBt+dTvswoXt0aqZGm4yrGzz
 4DEqPjOB99ThyD8LaOuWd71zaAcomfC/LRcRMGZEscLpFiKsZdZMpYDikytNKYEy0ivoYGYkWgE
 jr/dq6wfgFigztey9UORWUgkb/sH3/N9bk5SM9wW5phdmr8wFC4BissaEHF5SKeVfQb9r80vq8w
 NgG9T86drgcZ9kAj/0vdVwsTMFTgfSeIpPT/HUpWxRBSKHAOmdH3Bf5EObfXFtqfHwRsrQsxvkR
 wgpJE4L1Rx3HcmeEICLK+O6W1MGyd7GgGVwQqgge7uZQvBH6Y0z8+lhJIWBZDlD/j17q1otJSFd
 b2mwOgu0V1AdjLyL2XbPFBAf1muvGwm7W74jjEZvBq6UY/k1LUQ9KGJm2zsCs=
X-Google-Smtp-Source: AGHT+IFa/kGNhO8Ich5FWxCX4ebrNs4SBqHfcY2revmJ6C0v3QpTqtWbEcqedCUsdLVwqCHJKHp1mA==
X-Received: by 2002:a05:6a00:2293:b0:7ad:1e4:bef0 with SMTP id
 d2e1a72fcca58-7c58c2ab11fmr14589949b3a.4.1764087157926; 
 Tue, 25 Nov 2025 08:12:37 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5?
 ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7c3ed471060sm18636346b3a.15.2025.11.25.08.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 08:12:36 -0800 (PST)
Message-ID: <6c749a78-2c98-45a8-b9d4-47f79b56c918@roeck-us.net>
Date: Tue, 25 Nov 2025 08:12:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/13] PCI: Add devres helpers for iomap table
 [resulting in backtraces on HPPA]
To: Philipp Stanner <pstanner@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Sam Ravnborg <sam@ravnborg.org>,
 dakr@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
References: <20240613115032.29098-1-pstanner@redhat.com>
 <20240613115032.29098-3-pstanner@redhat.com>
 <16cd212f-6ea0-471d-bf32-34f55d7292fe@roeck-us.net>
 <414bc2c721bfc60b8b8a1b7d069ff0fc9b3e5283.camel@redhat.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <414bc2c721bfc60b8b8a1b7d069ff0fc9b3e5283.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 11/25/25 07:48, Philipp Stanner wrote:
> On Sun, 2025-11-23 at 08:42 -0800, Guenter Roeck wrote:
>> Hi,
>>
>> On Thu, Jun 13, 2024 at 01:50:15PM +0200, Philipp Stanner wrote:
>>> The pcim_iomap_devres.table administrated by pcim_iomap_table() has its
>>> entries set and unset at several places throughout devres.c using manual
>>> iterations which are effectively code duplications.
>>>
>>> Add pcim_add_mapping_to_legacy_table() and
>>> pcim_remove_mapping_from_legacy_table() helper functions and use them where
>>> possible.
>>>
>>> Link: https://lore.kernel.org/r/20240605081605.18769-4-pstanner@redhat.com
>>> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
>>> [bhelgaas: s/short bar/int bar/ for consistency]
>>> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
>>> ---
>>>   drivers/pci/devres.c | 77 +++++++++++++++++++++++++++++++++-----------
>>>   1 file changed, 58 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
>>> index f13edd4a3873..845d6fab0ce7 100644
>>> --- a/drivers/pci/devres.c
>>> +++ b/drivers/pci/devres.c
>>> @@ -297,6 +297,52 @@ void __iomem * const *pcim_iomap_table(struct pci_dev *pdev)
>>>   }
>>>   EXPORT_SYMBOL(pcim_iomap_table);
>>>   
>>> +/*
>>> + * Fill the legacy mapping-table, so that drivers using the old API can
>>> + * still get a BAR's mapping address through pcim_iomap_table().
>>> + */
>>> +static int pcim_add_mapping_to_legacy_table(struct pci_dev *pdev,
>>> +					    void __iomem *mapping, int bar)
>>> +{
>>> +	void __iomem **legacy_iomap_table;
>>> +
>>> +	if (bar >= PCI_STD_NUM_BARS)
>>> +		return -EINVAL;
>>> +
>>> +	legacy_iomap_table = (void __iomem **)pcim_iomap_table(pdev);
>>> +	if (!legacy_iomap_table)
>>> +		return -ENOMEM;
>>> +
>>> +	/* The legacy mechanism doesn't allow for duplicate mappings. */
>>> +	WARN_ON(legacy_iomap_table[bar]);
>>> +
>>
>> Ever since this patch has been applied, I see this warning on all hppa
>> (parisc) systems.
>>
>> [    0.978177] WARNING: CPU: 0 PID: 1 at drivers/pci/devres.c:473 pcim_add_mapping_to_legacy_table.part.0+0x54/0x80
>> [    0.978850] Modules linked in:
>> [    0.979277] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc6-64bit+ #1 NONE
>> [    0.979519] Hardware name: 9000/785/C3700
>> [    0.979715]
>> [    0.979768]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
>> [    0.979886] PSW: 00001000000001000000000000001111 Not tainted
>> [    0.980006] r00-03  000000000804000f 00000000414e10a0 0000000040acb300 00000000434b1440
>> [    0.980167] r04-07  00000000414a78a0 0000000000029000 0000000000000000 0000000043522000
>> [    0.980314] r08-11  0000000000000000 0000000000000008 0000000000000000 00000000434b0de8
>> [    0.980461] r12-15  00000000434b11b0 000000004156a8a0 0000000043c655a0 0000000000000000
>> [    0.980608] r16-19  000000004016e080 000000004019e7d8 0000000000000030 0000000043549780
>> [    0.981106] r20-23  0000000020000000 0000000000000000 000000000800000e 0000000000000000
>> [    0.981317] r24-27  0000000000000000 000000000800000f 0000000043522260 00000000414a78a0
>> [    0.981480] r28-31  00000000436af480 00000000434b1680 00000000434b14d0 0000000000027000
>> [    0.981641] sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> [    0.981805] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> [    0.981972]
>> [    0.982024] IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040acb31c 0000000040acb320
>> [    0.982185]  IIR: 03ffe01f    ISR: 0000000000000000  IOR: 00000000436af410
>> [    0.982322]  CPU:        0   CR30: 0000000043549780 CR31: 0000000000000000
>> [    0.982458]  ORIG_R28: 00000000434b16b0
>> [    0.982548]  IAOQ[0]: pcim_add_mapping_to_legacy_table.part.0+0x54/0x80
>> [    0.982733]  IAOQ[1]: pcim_add_mapping_to_legacy_table.part.0+0x58/0x80
>> [    0.982871]  RP(r2): pcim_add_mapping_to_legacy_table.part.0+0x38/0x80
>> [    0.983100] Backtrace:
>> [    0.983439]  [<0000000040acba1c>] pcim_iomap+0xc4/0x170
>> [    0.983577]  [<0000000040ba3e4c>] serial8250_pci_setup_port+0x8c/0x168
>> [    0.983725]  [<0000000040ba7588>] setup_port+0x38/0x50
>> [    0.983837]  [<0000000040ba7d94>] pci_hp_diva_setup+0x8c/0xd8
>> [    0.983957]  [<0000000040baa47c>] pciserial_init_ports+0x2c4/0x358
>> [    0.984088]  [<0000000040baa8bc>] pciserial_init_one+0x31c/0x330
>> [    0.984214]  [<0000000040abfab4>] pci_device_probe+0x194/0x270
>>
>> Looking into serial8250_pci_setup_port():
>>
>>          if (pci_resource_flags(dev, bar) & IORESOURCE_MEM) {
>>                  if (!pcim_iomap(dev, bar, 0) && !pcim_iomap_table(dev))
>>                          return -ENOMEM;
> 
> Strange. From the code I see here the WARN_ON in
> pcim_add_mapping_to_legacy_table() should not fire. I suspect that it's
> actually triggered somewhere else.
> 

pcim_iomap() calls pcim_add_mapping_to_legacy_table() which triggers the traceback.
The caller uses the returned error to determine that it needs to call pcim_iomap_table()
instead. As you point out below, that may not be necessary, but then it is already
too late and the warning was triggered.

>>
>> This suggests that the failure is expected. I can see that pcim_iomap_table()
>> is deprecated, and that one is supposed to use pcim_iomap() instead. However,
>> pcim_iomap() _is_ alrady used, and I don't see a function which lets the
>> caller replicate what is done above (attach multiple serial ports to the
>> same PCI bar).
> 
> Is serial8250_pci_setup_port() invoked in a loop somewhere? Where does
> the "attach multiple" happen?
> 

It is called for multiple serial ports, each of which are in the same bar but
with different offset into the bar.

>>
>> How would you suggest to fix the problem ?
> 
> I suggest you try to remove the `&& pcim_iomap_table(dev)` from above
> to see if that's really the cause. pcim_iomap() already creates the
> table, and if it succeeds the table has been created with absolute
> certainty. The entries will also be present. So the table-check is
> surplus.
> 

How would that fix anything ? The warning would still be triggered from the
failed call to pcim_iomap() for the 2nd and subsequent serial port on the
same bar.

Guenter

