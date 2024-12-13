Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FE19F0939
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 11:15:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F04410EF91;
	Fri, 13 Dec 2024 10:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B4A10EF91
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 10:15:39 +0000 (UTC)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Y8lbF67nTz9svS;
 Fri, 13 Dec 2024 11:15:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6-COpe8Oi0vZ; Fri, 13 Dec 2024 11:15:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Y8lbB1Gh4z9svV;
 Fri, 13 Dec 2024 11:15:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 197918B773;
 Fri, 13 Dec 2024 11:15:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YjGKXVr-q2aq; Fri, 13 Dec 2024 11:15:34 +0100 (CET)
Received: from [192.168.232.97] (unknown [192.168.232.97])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 96D688B763;
 Fri, 13 Dec 2024 11:15:33 +0100 (CET)
Message-ID: <941b3560-6572-476b-9e9f-c0a6df3e9ff4@csgroup.eu>
Date: Fri, 13 Dec 2024 11:15:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 arnd@arndb.de, deller@gmx.de, simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241212100636.45875-1-tzimmermann@suse.de>
 <20241212100636.45875-2-tzimmermann@suse.de>
 <8403f989-c1de-48c9-ab48-83c1abb9e6f2@csgroup.eu>
 <5484d576-d63e-4166-85ea-0b508b0cb865@suse.de>
 <1248a2b6-71b0-4909-917f-a5605415a816@csgroup.eu>
 <690acce6-3e57-4731-9949-f8bb06d9cb58@suse.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <690acce6-3e57-4731-9949-f8bb06d9cb58@suse.de>
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



Le 13/12/2024 à 09:41, Thomas Zimmermann a écrit :
> Hi
> 
> 
> Am 13.12.24 um 09:33 schrieb Christophe Leroy:
>>
>>>
>>> The attached patch selects backlight support in the defconfigs that 
>>> also have PMAC_BACKLIGHT=y. Can you please apply it on top of the 
>>> patchset and report on the results?
>>>
>>
>> That works for the defconfig but it is still possible to change 
>> CONFIG_BACKLIGHT_CLASS_DEVICE manually.
>>
>> If it is necessary for PMAC_BACKLIGHT then it shouldn't be possible to 
>> deselect it.
> 
> Here's another patch that make it depend on BACKLIGHT_CLASS_DEVICE=y. 
> Can you please try this as well?

That looks good, no build failure anymore with BACKLIGHT_CLASS_DEVICE=m
