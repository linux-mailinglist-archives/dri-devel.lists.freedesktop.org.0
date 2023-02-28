Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBC36A5942
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 13:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D0410E69F;
	Tue, 28 Feb 2023 12:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578EE10E4CA;
 Tue, 28 Feb 2023 12:43:07 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id cy6so39349771edb.5;
 Tue, 28 Feb 2023 04:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nJVEIhPKLgTn+f8VRs4bEIhn760RPkrg51g9quDiRIM=;
 b=KpZe4kRNteu5U7jRkBjLAJrNgdsosHyBUOuWkSDOiYhDSEZemMAlXs2A+5/nOeRwbc
 gHZLzrN99Fd9HyEHt51MNyySoE7+SZURVC7mJ8oOiNQnn6aBoziCZBV1fNWH8AtOmD8s
 eFb2FIrOIQriuUuE67S8xs1yVBfkjpVYCd2VsZeMprVlawBTMKdJphmhGMR9gTDUTHei
 OzB2SE8gxRX9HYbWukfQrEapjCVClDWL2hNQyRubzjNahdqBpmK33OvtOCffI/8jQl2q
 +dbrlazx2m8MBhSDeAgQfTlTJPRaUOzUzdcC7JsWgV8kn3SF1k3sGsZm8kJ2RIXhLppT
 q07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nJVEIhPKLgTn+f8VRs4bEIhn760RPkrg51g9quDiRIM=;
 b=Vp8rN/Tmb1/eu3HKc1q1TbTInXbpZJlBQz5nPANzsHAaYZ09J7AC9kLs+5bTmj6mYl
 R3tV01ghq1cunudL550SaEdKgbFLlkQqn5cpnarlEAD6GH5vjLSiurJZ30u92bOt2Yup
 iDMiS3yuaEC0vFKMk7uPM6rxNKoGh1CXiMksnUXET6EtJWyU3tumThRXtPwwv06GtS51
 WhBeHevvWt9OrPR7VwjaNs+YOlBQs24Y2qMM+RfEL4c2MVME816f4/uXxCa/9vU/YNop
 O7k8mU9CmHqZvuDxTBpJ2Cab6Ant7FrnmceDT/Gri4LogOBzaRap+2JVtdCLoA8LvJmc
 RwFg==
X-Gm-Message-State: AO0yUKVbpUTrYMTbthpV2zGdwjIrZXGinwhJgpFwRAQ/w/9iky455cE0
 skCR+9+OIIP+JAF+k6+RFyA=
X-Google-Smtp-Source: AK7set/OhVedFmU/CFmt9qtLTMgyTFaxY8xIf1FUKl3A+f66bTfFrn3M6y8ruONLxxA3A6be+MD9yw==
X-Received: by 2002:a17:906:b851:b0:872:b17a:9b59 with SMTP id
 ga17-20020a170906b85100b00872b17a9b59mr2493027ejb.38.1677588185729; 
 Tue, 28 Feb 2023 04:43:05 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 h23-20020a50cdd7000000b004af64086a0esm4371314edj.35.2023.02.28.04.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 04:43:05 -0800 (PST)
Message-ID: <5cbba992-c4ce-01c1-2691-ed65ce66aad5@gmail.com>
Date: Tue, 28 Feb 2023 13:43:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: amdgpu didn't start with pci=nocrs parameter, get error "Fatal
 error during GPU init"
Content-Language: en-US
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
References: <CABXGCsMbqw2qzWSCDfp3cNrYVJ1oxLv8Aixfm_Dt91x1cvFX4w@mail.gmail.com>
 <a99e6def-68be-3f2b-4e01-ac26cdb80f49@gmail.com>
 <CABXGCsM7JPxtQm6B7vk+ZcXfphgQm=ArJZKiDUdbk9hujyRtmg@mail.gmail.com>
 <43016018-4d0a-94dc-ce93-b4bff2dce71c@gmail.com>
 <90b1c9f8-1674-e9ec-e6d8-2fa1967439b3@gmail.com>
 <CABXGCsN2NutEmi==JBDD5G2Bj=DJ6vm87_Cbubycz-WowUOh5w@mail.gmail.com>
 <e2975d53-840c-a104-8b2d-c302f502c894@gmail.com>
 <CABXGCsOJkF=c4B+oQm7cuEO7Fr_oknmH2iB6e6OCzmFy=KYtAw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CABXGCsOJkF=c4B+oQm7cuEO7Fr_oknmH2iB6e6OCzmFy=KYtAw@mail.gmail.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.02.23 um 10:52 schrieb Mikhail Gavrilov:
> On Mon, Feb 27, 2023 at 3:22 PM Christian König
>> Unfortunately yes. We could clean that up a bit more so that you don't
>> run into a BUG() assertion, but what essentially happens here is that we
>> completely fail to talk to the hardware.
>>
>> In this situation we can't even re-enable vesa or text console any more.
>>
> Then I don't understand why when amdgpu is blacklisted via
> modprobe.blacklist=amdgpu then I see graphics and could login into
> GNOME. Yes without hardware acceleration, but it is better than non
> working graphics. It means there is some other driver (I assume this
> is "video") which can successfully talk to the AMD hardware in
> conditions where amdgpu cannot do this.

The point is it doesn't need to talk to the amdgpu hardware. What it 
does is that it talks to the good old VGA/VESA emulation and that just 
happens to be still enabled by the BIOS/GRUB.

And that VGA/VESA emulation doesn't need any BAR or whatever to keep the 
hw running in the state where it was initialized before the kernel 
started. The kernel just grabs the addresses where it needs to write the 
display data and keeps going with that.

But when a hw specific driver wants to load this is the first thing 
which gets disabled because we need to load new firmware. And with the 
BARs disabled this can't be re-enabled without rebooting the system.

> My suggestion is that if
> amdgpu fails to talk to the hardware, then let another suitable driver
> do it. I attached a system log when I apply "pci=nocrs" with
> "modprobe.blacklist=amdgpu" for showing that graphics work right in
> this case.
> To do this, does the Linux module loading mechanism need to be refined?

That's actually working as expected. The real problem is that the BIOS 
on that system is so broken that we can't access the hw correctly.

What we could to do is to check the BARs very early on and refuse to 
load when they are disable. The problem with this approach is that there 
are systems where it is normal that the BARs are disable until the 
driver loads and get enabled during the hardware initialization process.

What you might want to look into is to find a quirk for the BIOS to 
properly enable the nvme controller.

Regards,
Christian.

