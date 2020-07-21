Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C411C22918B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 09:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640D06E5C5;
	Wed, 22 Jul 2020 07:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DE16E040;
 Tue, 21 Jul 2020 18:36:58 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id e64so22497292iof.12;
 Tue, 21 Jul 2020 11:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=DKoqtLlCZ3xb5WBePvpj1u1JNUm5TcuvXGpT5UK2G08=;
 b=OGNxulUtSF4ynIewzetTCPyyWNFlPsCe/npBc9CT8DR+dc8tQKgB+dM+rrnpvXoDnE
 tAKKO+yh/JDOdiRKRHmCjV3Q39ZDOOhUCo7ugO+S10btdbBXNVF0i6tLFrk3MEdc2xuv
 L4S5PHK7EZFjh710wkrvs4I/7qx7H+/0EvGfSNLXx7IsOtlcvEplkKFtx9K8wieQA31F
 aRQ0QITJHNeV72WeeVcCRdy4jYTWS4aovMQYVlv5Hwh24KwYjBug493ROJpaXi2IN5Hb
 qc+3pSeZUR5+9uFQQsOTcYn8FWvhe6vFahthIufPxCPhaPbONEMAhhc7zmrWEF4LGs06
 k+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=DKoqtLlCZ3xb5WBePvpj1u1JNUm5TcuvXGpT5UK2G08=;
 b=izOCQDv07GdaGpAgrZmt4vAC5RHjONWmI9WrL/UiVUg4UHnFJ6TNQCdV1yDcx6aUi4
 yHOmtLqurW/ZHxmsYnM8vWXNXnXWO6BrxO2yCMB8ovwJYtxeGJnVHtqLa5Te3wXWC9gX
 nwT6z4ZfwU43Y9PlxHQLDemFEHa4AsXGV6wBPeiCblOsQ/NvZ3kCTZcYHN39jEE21y3d
 31tRSBLZn/6u6eP5HX6zoaWzGyA3BeY2dLk5MBHwypieYkJZdVtOW3/7OIm2vmjWax1x
 yj7a0Vr8C1DaAl5GVUhorw2gTMqyB0xwLx/T4E5no5GeakMZcYizypftXzT91vCTVl8G
 SI9g==
X-Gm-Message-State: AOAM531jaM7Aa/k07vWjnDNpOI9YtUGcFdCIWZspOzT4Z9VKhssNLHxa
 k81Uxr1+Wi83OAISGwOq6pw=
X-Google-Smtp-Source: ABdhPJyjm3x7B2weH8RJQpPYu2oZG841KdnHRI51EDjG4coHaalocFrLEryqkmen2USsZ0klb87UgA==
X-Received: by 2002:a6b:b555:: with SMTP id e82mr28464431iof.56.1595356617867; 
 Tue, 21 Jul 2020 11:36:57 -0700 (PDT)
Received: from hive64.slackware.lan (SEB-ai06-18-141.wcta.net. [64.110.18.141])
 by smtp.gmail.com with ESMTPSA id u3sm10795893iol.41.2020.07.21.11.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 11:36:57 -0700 (PDT)
Subject: Re: nouveau regression with 5.7 caused by "PCI/PM: Assume ports
 without DLL Link Active train links in 100 ms"
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
References: <CACO55tuA+XMgv=GREf178NzTLTHri4kyD5mJjKuDpKxExauvVg@mail.gmail.com>
 <20200716235440.GA675421@bjorn-Precision-5520>
 <CACO55tuVJHjEbsW657ToczN++_iehXA8pimPAkzc=NOnx4Ztnw@mail.gmail.com>
 <CACO55tso5SVipAR=AZfqhp6GGkKO9angv6f+nd61wvgAJtrOKg@mail.gmail.com>
 <20200721122247.GI5180@lahna.fi.intel.com>
 <f951fba07ca7fa2fdfd590cd5023d1b31f515fa2.camel@redhat.com>
 <20200721152737.GS5180@lahna.fi.intel.com>
From: Patrick Volkerding <volkerdi@gmail.com>
Autocrypt: addr=volkerdi@gmail.com; prefer-encrypt=mutual; keydata=
 mQGiBD5dIFQRBADB31WinbXdaGk/8RNkpnZclu1w3Xmd5ItACDLB2FhOhArw35EAMOYzxI0g
 RtDNWN4pn9n74q4HbFzyRWElThWRtBTYLEpImzrk7HYVCjMxjw5A0fTr88aiHOth5aS0vPAo
 q+3TYn6JDSipf2bR03G2JVwgj3Iu066pX4naivNm8wCgldHGF3y9vT3UPYh3QFgEUlCalt0D
 /3n6NopRYy0hMN6BPu+NarXwv6NQ9g0GV5FNjEErigkrD/htqCyWAUl8zyCKKUFZZx4UGBRZ
 5guCdNzwgYH3yn3aVMhJYQ6tcSlLsj3fJIz4LAZ3+rI77rbn7gHHdp7CSAuV+QHv3aNanUD/
 KGz5SPSvF4w+5qRM4PfPNT1hLMV8BACzxiyX7vzeE4ZxNYvcuCtv0mvEHl9yD66NFA35RvXa
 O0QiRVYeoUa5JOQZgwq+fIB0zgsEYDhXFkC1hM/QL4NccMRk8C09nFn4eiz4dAEnwKt4rLCJ
 KhkLl1DWTSoXHe/dOXaLnFyLzB1J8hEYmUvw3SwPt//wMqDiVBLeZfFcdLQwU2xhY2t3YXJl
 IExpbnV4IFByb2plY3QgPHNlY3VyaXR5QHNsYWNrd2FyZS5jb20+iF8EExECAB8ECwcDAgMV
 AgMDFgIBAh4BAheABQJQPlypBQlBo7MrAAoJEGpEY8BAECIzjOwAn3vptb6K1v2wLI9eVlnC
 dx4m1btpAJ9sFt4KwJrEdiO5wFC4xe9G4eZl4rkBDQQ+XSBVEAQA3VYlpPyRKdOKoM6t1SwN
 G0YgVFSvxy/eiratBf7misDBsJeH86Pf8H9OfVHOcqscLiC+iqvDgqeTUX9vASjlnvcoS/3H
 5TDPlxiifIDggqd2euNtJ8+lyXRBV6yPsBIA6zki9cR4zphe48hKpSsDfj7uL5sfyc2UmKKb
 oSu3x7cAAwUD/1jmoLQs9bItbTosoy+5+Uzrl0ShRlv+iZV8RPzAMFuRJNxUJkUmmThowtXR
 aPKFI9AVd+pP44aAJ+zxCPtS2isiW20AxubJoBPpXcVatJWi4sG+TM5Z5VRoLg7tIDNVWsyH
 GXPAhIG2Y8Z1kyWwb4P8A/W2b1ZCqS7Fx4yEhTikiEwEGBECAAwFAlA+XL8FCUGjs2IACgkQ
 akRjwEAQIjMsbQCgk59KFTbTlZfJ6FoZjjEmK3/xGR4AniYT+EdSdvEyRtZYkqWzp1ayvO1b
Message-ID: <d3253a47-09ff-8bc7-3ca1-a80bdc09d1c2@gmail.com>
Date: Tue, 21 Jul 2020 13:37:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721152737.GS5180@lahna.fi.intel.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 22 Jul 2020 07:02:50 +0000
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
Cc: Sasha Levin <sashal@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Linux PCI <linux-pci@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/21/20 10:27 AM, Mika Westerberg wrote:
> On Tue, Jul 21, 2020 at 11:01:55AM -0400, Lyude Paul wrote:
>> Sure thing. Also, feel free to let me know if you'd like access to one of the
>> systems we saw breaking with this patch - I'm fairly sure I've got one of them
>> locally at my apartment and don't mind setting up AMT/KVM/SSH
> Probably no need for remote access (thanks for the offer, though). I
> attached a test patch to the bug report:
>
>   https://bugzilla.kernel.org/show_bug.cgi?id=208597
>
> that tries to work it around (based on the ->pm_cap == 0). I wonder if
> anyone would have time to try it out.


Hi Mika,

I can confirm that this patch applied to 5.4.52 fixes the issue with
hybrid graphics on the Thinkpad X1 Extreme gen2.

Thanks,

Pat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
