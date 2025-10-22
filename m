Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63395BFF972
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 09:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C540210E896;
	Thu, 23 Oct 2025 07:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="WkeB2RIW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4BD710E70D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 09:16:58 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b85so8547186f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 02:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1761124617; x=1761729417;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0d1OtznxSM+pdxcYthlznRVSRSBvTGMBZ9iBozHqpE0=;
 b=WkeB2RIWzhEaSE9oJNak4rJq0dWylIDNcVftWsXuD4R2VrvfBGb35HtZwyxPRl8bbv
 zxV/Rz6CsDc+lPQbSuu6eTymGegZTasIkdrs3VYAfUCuy0o6tuJ64Ensrr720hL2vodu
 UuQ3PEfXpeYJU8BRSDS/9K0x/+eUPkk3XEw+1T6JYxRHS7Q29WOUaaKjDJ4WPXwnT6zv
 shL8MbHu0OOaP+SKphiTbn4Z6CERImx/jt10ZVDNxTalnaJomy/P6zTHQ0MBGvNSGRvW
 z75SNSqIL/0LqeXyrAJ5Yf1lPL8HzW/Xj6OYlAmnH3lhZRUknhpafAmzhw97sHhElbHH
 9FPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761124617; x=1761729417;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0d1OtznxSM+pdxcYthlznRVSRSBvTGMBZ9iBozHqpE0=;
 b=MqjEHMTXhLbgu+MSPafcjZNZ2RF+UNe8QTYMyto9g0E+0WJcFEo42331dohqDLWo3Q
 s3Sc3Kj1HGtrDYs7kfeddBvmwnaN7yBeUDc7UO/wYsbj8NC6I1ZN8Gs3XM35Z6G+chRk
 9eHUWt2Hu+ohCNqWHzmWwpp86FtSdhPTdL9XJUuuDNXw2c2eIVvGTYLmNmDUVN8ApDDp
 G4kfbfrmKaEr9lUb9ndfZ/rPJBekhKgj4BfptQQu4ft5n+9uaNyFNc1yql13BPFKF/jn
 0VElXR9JYXxjz46tQKxIa3VOh5oN2thChFAq/LSe35LjVS4uvVqI+a9lwhvoIziWMwju
 5OFg==
X-Gm-Message-State: AOJu0YyxxlLVhFmuTzmp6zQv7ELUk0u4C1VkxdRsr5VTrMJtBOpzwzhN
 3RvmxMWKGJVLfoxGY6Ky2LahntNCv/VwNVTtbe5gptzofBnjd2MIuCw=
X-Gm-Gg: ASbGncu3Zxm5yRGnRR/AzBdH+RTrw1qxHT1TSqNOWzrfwGQAXuuzUdu6kqPfE9EvwTH
 cmbL1jXghpXI4s8ztKEk9X3RzBwDA2PnfJnXOcGIpk0lH7kutfETJL4PAceN1VBsQlwZRJdetcf
 OD+ftNwgzKvJ84n1B2UpLJJXmnQ4oneoL3ACM3mFG512ptRECYWVMq0mutGY8yzoht2BQfM6ctQ
 Rc1rlU/iM167YgzizES7/JHnI2G8JpRNaBPpI98zbqpjNIUl5yDhBZpSP4Ms+k8b7lj+d/tdT4x
 ak/vZyBm1yir48YCbkL3nUPFBZNBkJisMKyEYUkTNu0a6Qbw/rh1lNrruCrWzuXKKkR7oTO4tX4
 vr3GROX5BiKMwgUqidwz2F0C42bwxbA4KlB8IxuNudyQE6/9LPkRDZFfybor12j37Eo38bpESK0
 Kq6c3CaPwVmO6FNXiDeGFr5EOMq1Xw6IA27goIAJijYJs56/XUs/XndLRMl6kpgg==
X-Google-Smtp-Source: AGHT+IHa35nbyTK6Dmlfdg41+HIA1hn/cBaTOnRlZDC5R3mjJeMyTqjZs96LilY2c+rKxD8zCB0KXg==
X-Received: by 2002:a05:6000:26ce:b0:3eb:5e99:cbb9 with SMTP id
 ffacd0b85a97d-42704d7eaa2mr12913918f8f.10.1761124616882; 
 Wed, 22 Oct 2025 02:16:56 -0700 (PDT)
Received: from [192.168.1.3] (p5b057850.dip0.t-ipconnect.de. [91.5.120.80])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5a0f88sm23394732f8f.7.2025.10.22.02.16.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 02:16:56 -0700 (PDT)
Message-ID: <5f8fba3b-2ee1-4a02-9b41-e6e1de1a507a@googlemail.com>
Date: Wed, 22 Oct 2025 11:16:56 +0200
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
 <798ba37a-41d0-4953-b8f5-8fe6c00f8dd3@googlemail.com>
 <bf827c5c-c4dd-46f1-962d-3a8e2a0a7fdf@suse.de>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <bf827c5c-c4dd-46f1-962d-3a8e2a0a7fdf@suse.de>
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

Am 22.10.2025 um 11:11 schrieb Thomas Zimmermann:
> Hi
> 
> Am 22.10.25 um 10:08 schrieb Peter Schneider:
>>
>> Your patch applied cleanly against 6.18-rc2 and the kernel built fine, but unfortunately it did not solve the issue: 
>> my console screen stays blank after booting. This is regardless whether I do a soft reboot, press the reset button or 
>> power cycle and do a cold boot. They are all the same.
> 
> Just to be sure: you do see output at the early boot stages (BIOS, boot loader). It's at some later point during boot, 
> the driver loads and the display blanks out?

Yes, that's correct.

> There's another patch attached. does this make a difference?

Do I have to apply that against base 6.18-rc2 or against 6.18-rc2 + your previous patch?


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
