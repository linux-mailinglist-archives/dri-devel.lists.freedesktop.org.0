Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E71C442A86
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 10:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2F772D4D;
	Tue,  2 Nov 2021 09:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E72D72D4C;
 Tue,  2 Nov 2021 09:37:39 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id o12so7529594qtv.4;
 Tue, 02 Nov 2021 02:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:reply-to:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=U01pN62IGxw0wEpHz7rt+oSLBB7OIWJHCo+M1XzRL6w=;
 b=VBZaVCIldmEEkz48+ooyclOD1v/J5MfydE0imu0dPjkGygs9LKzzAcQFyk3Z2FfUo1
 3x0AWt+EiFAKZt/Z2lZfIL4FScRwyiosy9cO+pjCQgzeyRMOFr5/re2vNMqOZiGPjb0w
 tymARzDm7vcfMzf66gdiKtomuDo9sAsV68n134C0/AqqqGZLHdZi/Cd7Vxu/LhIL2Nn8
 SQw6tCucSfAO/0tNKIIGZ7QTKMTmOAb9uOCHivv4vwb4HjCLsY2PLirvFNn/ZdK5HwF0
 OsqxSRkKhojPuU3Ab7zCDz8gihGC93ltLJ9NkqGYUnbeZtmPP1RXk7YFEVA8sDMPLwDH
 OwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=U01pN62IGxw0wEpHz7rt+oSLBB7OIWJHCo+M1XzRL6w=;
 b=msQaDoLvJC/Z3euEzGzKWSfEAZr/sJphTz+47at67fjU36yOZ/dGlHzGeTOJ5mrjp7
 5ER34136qH72/7HSBBNYkZRf/j24ibMKjBSEM/Fl6lqrKrg6h+lst/105IkprJsBeaHo
 ELNcQBOH6e97NFksFtVmN/7OPQ/SopSU1a5o5VDvAH83BzV/OjY0iTrLBqh6DtWrJ4Qn
 mNf2PHJRhAQTavShJQhMANcsXEx5iQHq5hMIKGPzbB+Tv6ubAf9URWv34/bJU8+wWEnw
 YOkxD+hsnjZLdQWwKwmq+RluiWZ1rYn0Mb3UFnlPzNeJGqzn6K91BAEYiknCiSNAlFfR
 sV+A==
X-Gm-Message-State: AOAM532hlGLJ2z1NObflD56JawFN504D8kb9e8ac791LDHCT4izOaZ5o
 uA1ll8Rr1OxXEhlm16nhCpnjrp2PEKQ=
X-Google-Smtp-Source: ABdhPJxWSprHXCHYj6XNl0eEfQLli8nXmJXT0KpDQazoSAjnuCaeM3VhAEghSHMZcZlQmRxx7y8bFw==
X-Received: by 2002:ac8:7d13:: with SMTP id g19mr37678225qtb.178.1635845858242; 
 Tue, 02 Nov 2021 02:37:38 -0700 (PDT)
Received: from mua.localhost ([2600:1700:e380:2c20::49])
 by smtp.gmail.com with ESMTPSA id n15sm5269212qkp.102.2021.11.02.02.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 02:37:37 -0700 (PDT)
Message-ID: <0feee174-1ecf-0ab4-407f-67bdaac8b2e6@gmail.com>
Date: Tue, 2 Nov 2021 05:37:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.0
Subject: Re: amdgpu on Ryzen 5600G -- 'purple' background [WAS: Re: amdgpu
 "Fatal error during GPU init"; Ryzen 5600G integrated GPU + kernel 5.14.13}
Content-Language: en-US
From: PGNet Dev <pgnet.dev@gmail.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <b4adea1b-9a21-75d2-7ee7-25d4f28ef6f8@gmail.com>
 <2303555f-42cd-180c-7a67-1d104bceea7d@gmail.com>
 <CADnq5_PsKDreYH0aNNzfR_TbfMMsfVK=-hCCB0ThZ0PzcLPCpw@mail.gmail.com>
 <c08a4b33-ac3a-ef52-57d3-f55a4c2843c7@gmail.com>
In-Reply-To: <c08a4b33-ac3a-ef52-57d3-f55a4c2843c7@gmail.com>
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
Reply-To: pgnet.dev@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/30/21 11:24, PGNet Dev wrote:
> Is that kernel/modconfig config incorrect?
> Not relevant to the problem?
> Something else(where) needed?

fwiw,

AMD Global Customer Care's response to question about this 'purple' issue:

"...
Please be informed that Ryzen 5600G APU is supported only on Windows 10, 11, RHEL and Ubuntu OS. Also, this might vary depending on the manufacturer in your case AsRock.

https://www.amd.com/en/products/apu/amd-ryzen-5-5600g

I suggest you try installing Ubuntu 20.04.3 and update to latest version and check the status.
"
