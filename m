Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9979987C2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 15:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E769510E8F7;
	Thu, 10 Oct 2024 13:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QjbIEkvU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA5F10E297
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 13:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r3qvZmqLRgW8IBIRaKLLbOxF84DYrbprXM82KhBJTzc=; b=QjbIEkvUsxI3pdNmlLwDztYl6M
 XWhJxmfhHvLWHq1iqrpzqo4Q5NM1jxd2FOxyFG5zpHvmAGCv5/+rJaV6c2wK2bIUlNJrPM1trmpxJ
 R5al0wkgvokTHw5XA6fDzEZBEswLYPooRBW0+jmeemrEiuoB/LIpmsxs9aiKjPmnYf17EzXH+YuNo
 QCzRWgs66+igMB/Tha8a1dm0pVpzMwNZ2nT05aHJXnCNW47u/Vz1IQgg/fIcGqX2axAaDotxASCKw
 ex2pFcUNcLqZppjmDtrTV8+wvYvbnDDpaE2o6saMlReArRZobHMM27q5SrAXCe7eI5kIYsFhrIavz
 2HXFl6pQ==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sytGc-007LQH-BE; Thu, 10 Oct 2024 15:31:46 +0200
Message-ID: <70bf0835-78a1-466e-9484-93e542c59393@igalia.com>
Date: Thu, 10 Oct 2024 10:31:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] MAINTAINERS: Fix VC4's mailing lists
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241009141240.1948482-1-mcanal@igalia.com>
 <20241009141240.1948482-2-mcanal@igalia.com>
 <CAPY8ntA4PwVbUUTiDxez7ooUegOKc=Hj1PnrXYP2KNrYJ2uLQA@mail.gmail.com>
 <20241010-majestic-pronghorn-of-genius-d24067@houat>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <20241010-majestic-pronghorn-of-genius-d24067@houat>
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

Hi Dave & Maxime,

On 10/10/24 04:36, Maxime Ripard wrote:
> On Wed, Oct 09, 2024 at 04:13:01PM GMT, Dave Stevenson wrote:
>> Hi Maíra
>>
>> On Wed, 9 Oct 2024 at 15:12, Maíra Canal <mcanal@igalia.com> wrote:
>>>
>>> VC4 has two relevant mailing list: kernel-list@raspberrypi.com and
>>> dri-devel@lists.freedesktop.org. Therefore, list those two mailing
>>> lists in the VC4 section.
>>
>> dri-devel@lists.freedesktop.org is automatically picked up by
>> get_maintainer.pl due to vc4 living under /drivers/gpu/drm. Likewise
>> the DT bindings are covered. AIUI that means we don't need to list it
>> explicitly.
>>
>>> Actually, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
>>> was already listed in the VC4 section, but it was listed as a reviewer.
>>> List it as a mailing list.
>>
>> I had this debate with Maxime in v1 when I added this [1].

I agree with the point that Maxime brought in [1]. Usually, "maintainers
(and reviewers) should be explicit."

For me, it is hard to understand why a list would be listed as a 
maintainer or reviewer, as from my PoV, all lists are used to gather
review.

>> It's not an open list as most L: entries are. The top of MAINTAINERS

By grepping lists in the MAINTAINERS file, we can see that not only
open-lists are listed there. There are also moderated lists.

>> lists as "L: *Mailing list* that is relevant to this area". That
>> mailing list is dri-devel.
>> You also get "Broadcom internal kernel review list
>> <bcm-kernel-feedback-list@broadcom.com>" listed as R: in various
>> MAINTAINERS entries.
>>
>> I don't know the definitive answer here, but it seemed to fit reasonably as R:.
> 
> Yeah, I told you last time, it's going to be a recurring discussion
> because it's super unusual :)

I don't have an issue in keeping it the way it is. But I agree that it's
unusual.

Best Regards,
- Maíra

> 
> Maxime
