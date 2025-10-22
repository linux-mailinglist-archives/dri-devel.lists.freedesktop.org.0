Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 492E0BFF987
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 09:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1232510E899;
	Thu, 23 Oct 2025 07:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="Mnn0EODK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939C510E6ED
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 08:08:54 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4712c6d9495so12447605e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 01:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1761120533; x=1761725333;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UcnB1vPCv4/5O7NSkhwvuNPMqNZtj/H/Vxellyl6lWw=;
 b=Mnn0EODKvOKn8Ha0Uea+0bCV4KdaaULZshJSq1ddLdBs9RachT4RFqnvtUcGS78ou6
 uMtOMnQLAIqTdvU1yu2xigB5rFptNOe2Pv63hU78IGuL22mvJHvaCOlBnLuMP+YxhFT5
 dMdGNGmp0mvLjArCyoYEz4c9w3FHi3paKf57cGn5YoeMdjUn1X+5+LxYxtcpPWDvhE4T
 bFrO7kmDQRRQnVgrDKg7Cd9aghK70/CRccARA48jdvFlecMEgfyzHAaOfxQJWqmUcQSM
 PfDCcBhC8iiwhg1pIyvcyneYAdDa0ue5dMCdoEqvPTYI5W1kjE0ojIX5tkt7cCZ237VO
 gDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761120533; x=1761725333;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UcnB1vPCv4/5O7NSkhwvuNPMqNZtj/H/Vxellyl6lWw=;
 b=kK9FGKRR/fqyGnQfFW4THpiJw4jGL6aE0HjeMhvqRYLWiE1yzE4pldghu2gWKn32M/
 zCmo4AI8ZUXF3v3rOMAtAc4RdHEQJId60/BAJOCJadluI783m/tEr1ez+a79KTH9N8Jy
 yvNCryJOB0HeKOhKtgd1Yt2fbTucdF5qQaHkuq1nWYSQH4Pj3E5hqsQTi/IOBZLIjfIS
 RsQ/+vdhCGX3UZXqUPr7uvAvpgvtGKjvHNzrcGOoEPaNyh1eDr4yAokvtL/KqwsWaEJd
 RddS0HbWPsZOO9pmv121wxXpxfk17ORJEEFiZKdY7hVzF/MoQ/CVK2Y1gWnIBkrpCHsg
 1Dmw==
X-Gm-Message-State: AOJu0YyreNs/KB34GDVk/a2lGqcphanom6TEuhgywwkRVdrAs4FIMGyF
 GU3bXbXob6UsVOu+BYe/MMnQqSpqmh56HMnU6zMkuUaeTAqqMdvRF+M=
X-Gm-Gg: ASbGncudeNPKTc8hG8UjxZeNOxEDviZigYyfrJ1EmgO+13w3snYKxOOo+F92RsCXl5H
 jHxLXID9MLwkNmwMh9hKgxz1DBTExwhVJbIi/xcsZMGKc0p+t/OJY9qpRxSpsV6jhTeHgS33LTG
 VyGryk0qOJrv/Dntwmdx9uniBL5QZaMkdcueKBI1i88L1xNJTconQxQL55z9E7rSuGRbIcu9v/A
 QrTNeru8Rcokdz6syh4juhwtykh6SF0Ngo/V5ELUjd8VvuLniKIRnNO/fpjhs6Ua8kqAb/FGvMa
 m0CujyeUxsuvkWj/7G0oUDkx82GiLMyv7ReN7rVOfSITNCsql4vVC/KcN+JZI2qcyHM3BIlU2xC
 V8ISI/tnoramJdIbGtqbLAKv1Bds4U86xWmCFhYNPn61KveIxWenzxVGdo6bM2oFy+eMGwYN7lr
 jczHGX/Kgrmmdvm/qFhHOWdw3SS7EuTso54cTO7WJNJbO6uYnpHqlbJF4zZSDPow==
X-Google-Smtp-Source: AGHT+IF/cCvzRlFyWOqSA/Xn2hsqVgkC6A23PcoYB3/ncn63CK7+kyxojS9N24qzW1KCsixw1CexVg==
X-Received: by 2002:a05:600c:6085:b0:471:133c:4b9a with SMTP id
 5b1f17b1804b1-4711786c79emr171726605e9.6.1761120532780; 
 Wed, 22 Oct 2025 01:08:52 -0700 (PDT)
Received: from [192.168.1.3] (p5b057850.dip0.t-ipconnect.de. [91.5.120.80])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c428a534sm35770345e9.6.2025.10.22.01.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 01:08:52 -0700 (PDT)
Message-ID: <798ba37a-41d0-4953-b8f5-8fe6c00f8dd3@googlemail.com>
Date: Wed, 22 Oct 2025 10:08:51 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [REGRESSION][BISECTED] Screen goes blank with ASpeed AST2300 in
 6.18-rc2
Content-Language: de-DE
To: Thomas Zimmermann <tzimmermann@suse.de>, regressions@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 jfalempe@redhat.com, airlied@redhat.com, dianders@chromium.org,
 nbowler@draconx.ca, Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <20251014084743.18242-1-tzimmermann@suse.de>
 <a40caf8e-58ad-4f9c-af7f-54f6f69c29bb@googlemail.com>
 <43992c88-3a3a-4855-9f46-27a7e5fdec2e@suse.de>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <43992c88-3a3a-4855-9f46-27a7e5fdec2e@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 23 Oct 2025 07:29:39 +0000
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

thanks very much for your quick response!

(adding Thorsten to CC)


Am 22.10.2025 um 08:51 schrieb Thomas Zimmermann:
> Hi
> 
> Am 22.10.25 um 05:27 schrieb Peter Schneider:
>> #regzbot introduced: 6f719373b943a955fee6fc2012aed207b65e2854
>>
>> Hi all,
>>
>> I have encountered a serious (for me) regression with 6.18-rc2 on my 2-socket Ivy Bridge Xeon E5-2697 v2 server. After 
>> booting, my console screen goes blank and stays blank. 6.18-rc1 was still fine.
>>
>> The machine has an Asus Z9PE-D16 server mainboard with an onboard ASpeed AST2300 VGA chip with 16MB VRAM. I have 
>> attached an older HP Monitor to it via old VGA jack/cable. It also has a second graphics card in a PCI-E slot; an 
>> older NVidia GTX 560. It is not connected to a monitor, but I have configured it via kernel command line for PCI-pass- 
>> through to VMs running on this server (I use Proxmox VE, i.e. QEMU/KVM virtual machines). Currently, no VMs use this 
>> yet, and also no VMs are autostarting with machine boot. So when this regression occurs, the server is idle. Pressing 
>> a key on the keyboard does not make the screen come alive. The server is running fine though, and I can access it via 
>> SSH. It just has no graphic output anymore. In case this is important, the machine also has a ASMB6 BMC (can be used 
>> via http).
>>
>> I have attached dmesg output from both 6.18-rc1 which is fine, and 6.18-rc2 which exhibits this bug. I have bisected 
>> the issue, please see attached git bisect.log.
> 
> Thanks for the detailed bug report.
> 
> Attached is a patch that partially reverts the broken commit. Could you please apply it on top of the broken kernel and 
> report on the results?
> 
> Best regards
> Thomas


Your patch applied cleanly against 6.18-rc2 and the kernel built fine, but unfortunately it did not solve the issue: my 
console screen stays blank after booting. This is regardless whether I do a soft reboot, press the reset button or power 
cycle and do a cold boot. They are all the same.


Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
