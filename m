Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D2286E4F6
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 17:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B1E10E3F7;
	Fri,  1 Mar 2024 16:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NbLuOXWL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF95F10E406
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 16:06:00 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-7c495be1924so7029839f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Mar 2024 08:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1709309159; x=1709913959;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GUbUE7aHZo3BLjOSoTSY6Sj6NCxr1dF8uNficZHUOxs=;
 b=NbLuOXWLbvNX7fyUqY846/yAQs1a2ndTq88xP/SE4Llh/2Y9T0wo1oXTKi6X6LHvIp
 nQA+YIB7MeNZoqIhp3dGbDv95gJJVMhYcBRRmnPhUwhwWPbmPVsre8z+nkEZjAXmOaFu
 fEpoBVqpKRBKbo939w0VNfq3/mYWVrk/c/rBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709309159; x=1709913959;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GUbUE7aHZo3BLjOSoTSY6Sj6NCxr1dF8uNficZHUOxs=;
 b=I0qUZFEct907xmAJ8yArgdWahD4VkiLGbxW2N7jWFNKUnXkYZ0/o9iCZW0hJhxMFvO
 Et35Yzo4ntkIGH2eSheu8KZ9stwzozu7VUu2Tg1/7aNYXUdD8B71BNXiAPBDc9F+2xuy
 W1ehlPJl9+hVbmW13gtTnF2SiJKYzVvgbQwvprxsPvBI1XWOP1CcIlIpHHMbuI6jP3pF
 AtcxHOFT+xGtMr8sgxYeEo4rhMw1dnUxNhgBg77gOf7n2QlOtb++UP5gnllr6b19SPvO
 h+tRmAvhHK9YMFDXZHgXNWY1TxhVJJWlM0SOsWii9PYofQltFFiKFNCsYJNwC2KAJ4wO
 XRMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4jQ4llqGUOckt1eeAksZKDLxHBVR/z1d2mxnw9bckVDBXPvtTmwlVjSNQyyefVmgCzY8I8Tw0N38FxjD6aLZTHRkxmtU7EY83B87P+5cD
X-Gm-Message-State: AOJu0Yy1/F906PIea0uwdSdxY0m+pqJFrkZV6IdfRF3zuTGSFRrfbYii
 A3xjggaRw5AG2OaoaXiu9DtDrja+oGwSOL1/Nxro3HeHj69bXx0wtDk1gmYyVoI=
X-Google-Smtp-Source: AGHT+IGLKG/dlw1Pu3A6/meWaV0By6c320QkCU8gs6LdvRo4CGlpb1xlzzuSAIl6HVYSrqxP9Zte7g==
X-Received: by 2002:a05:6e02:1bea:b0:365:2f19:e58e with SMTP id
 y10-20020a056e021bea00b003652f19e58emr2334918ilv.3.1709309159574; 
 Fri, 01 Mar 2024 08:05:59 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
 by smtp.gmail.com with ESMTPSA id
 fw20-20020a0566381d9400b004747c7f22bdsm866787jab.74.2024.03.01.08.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 08:05:59 -0800 (PST)
Message-ID: <86d87830-100f-4f29-bb7f-9a612b90866a@linuxfoundation.org>
Date: Fri, 1 Mar 2024 09:05:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the kunit-next tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Gow <davidgow@google.com>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240229152653.09ecf771@canb.auug.org.au>
 <be2e812c-3898-4be8-8a9d-e221acb837c3@linuxfoundation.org>
 <CABVgOSmAmkOcY8hFnpPSgz5WZXFkez_BDGhKjBepbWFpKykfUg@mail.gmail.com>
 <20240301214358.7fdecd66@canb.auug.org.au>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240301214358.7fdecd66@canb.auug.org.au>
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

On 3/1/24 03:43, Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 1 Mar 2024 15:15:02 +0800 David Gow <davidgow@google.com> wrote:
>>
>> On Thu, 29 Feb 2024 at 23:07, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>
>>> I can carry the fix through kselftest kunit if it works
>>> for all.
>>
>> I'm happy for this to go in with the KUnit changes if that's the best
>> way to keep all of the printk formatting fixes together.
> 
> I am pretty sure that the proper fix has been applied to the drm-fixes
> tree today (in the merge of the drm-misc-fixes tree).
> 

What's the commit id for this fix? I Would like to include the details
in my pull request to Linus.

If this fix is going before the merge window - we are all set.

thanks,
-- Shuah
