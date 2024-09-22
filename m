Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8233B97E06C
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 09:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD62B10E307;
	Sun, 22 Sep 2024 07:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="dHRjowmc";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="6o0N9nOr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 96777 seconds by postgrey-1.36 at gabe;
 Sun, 22 Sep 2024 07:11:15 UTC
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDC710E307
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 07:11:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1726989038; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=LwkzdSEPnPZgkpeJCgnVcpyf2T7P+D8skDgfU9PiGAZnMgMVi/TnGso+OmrPeE+tiZ
 bZ9cTx1/snAZoXWgZ3usUjz2SoIfxhlKRziBlfZemr13oY5JRyE18k3xEqLhnaz1A1FV
 5GjbL5lHWv2+t0ax9PN3LlaFN5d3m+4m9V58Jjtigs+KmVQMFuGtlq+BBV2snurvrsaj
 vDoY0E73lD84KpIV9v5AkV+IMphLT35RTClD1ru60vA244wAAoNuK1eowTmYCyafedVR
 PWRRuF+FK0eTBZ8P1zlMQllEI7y5dQt0bY5zlbVmvrt85s9pZ+eTTP5Hv87k73fWjrjQ
 W1WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1726989038;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=XT2btQo2l2+uW+7fLGuafe13KGjmlesHpzO33/mJsnw=;
 b=Ft69fqukilDJ/i6RVShemo3vhQLQL4/mQKNHCiSoCqV+Iun2KC7GiQXhgLz/G+CVd4
 NMxpxhMfQm3kv9oy1UXcWP5cxPsAnqWXlUCurWVpoTp0WIdy1VZzt4gjR7lLtshatgCg
 GBbMiyLmP2UheI7S0FPZIpzsr4/X27l9etk5nbO6v444U0c1ZzwlIRm0byD5qeKMP3qP
 SYr5er5hR2TJHcDWC+3prh8V5/6jDx5nVLud2rInfmSVWzriYCjxrDMf2BUujipR/yxc
 gheBKbQLKXk8q369NZGebDclJk97f5VfcF+2bAX07zRueJy0MGEQQBziLvcftCuo5vmU
 Yiew==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1726989038;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=XT2btQo2l2+uW+7fLGuafe13KGjmlesHpzO33/mJsnw=;
 b=dHRjowmcfLwXH9Hh7gZtcEA9vIMPSv6+stlbXeEozDHSPen/23O03A3pGLXEN/Ho2m
 6DxiOInek296UgwIXz7VKGc0EHTS/oOpkNQNMeIDbcCxlzb5niV9xSqY7cGgQWElJrhn
 YbdCe8HWewkLh3jo005wmpDSJTp7BZulXr6OgzL3mFuFWUjG8PMfCDTm7uuROhuOJqEa
 r2ik0ImKGIwxBiJ8HkcLMz8Lwqlzf1bGs9zf8GBsrele1v56LgeTdco30VnOD6LmFveB
 omo9Lm2o2gTciV60irxwLF2HhuXdf9T53rFXRbltK1Jj511UCChhFBB2vCdaoA2c4s28
 ZFvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1726989038;
 s=strato-dkim-0003; d=xenosoft.de;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=XT2btQo2l2+uW+7fLGuafe13KGjmlesHpzO33/mJsnw=;
 b=6o0N9nOreYK/jIEFOTJitb3kmAFnjiJCd2xSN+ylMcq4wUCvz8PD2qOFenSQwcZqKW
 31efDkINeEXEVlWZ3QBA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr44+gKidpmhkOpz46lpM="
Received: from [192.168.178.134] by smtp.strato.de (RZmta 51.2.8 DYNA|AUTH)
 with ESMTPSA id e0da1a08M7Aa2TW
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 22 Sep 2024 09:10:36 +0200 (CEST)
Message-ID: <7525c876-4dff-4f63-b96d-98435c24dee8@xenosoft.de>
Date: Sun, 22 Sep 2024 09:10:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PPC] Kernel doesn't boot after DRM updates (drm-next-2024-09-19)
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>
Cc: mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au
References: <f163bcec-e5b1-4aef-91dd-431736fd6d11@xenosoft.de>
 <ac6ced8f-d063-433a-8660-73ced7d18dd4@xenosoft.de>
Content-Language: de-DE
In-Reply-To: <ac6ced8f-d063-433a-8660-73ced7d18dd4@xenosoft.de>
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

On 22 September 2024 at 08:48 am, Christian Zigotzky wrote:
> On 21 September 2024 at 06:15 am, Christian Zigotzky wrote:
>> Hi All,
>>
>> The lastest Git kernel doesn't boot anymore after the latest DRM 
>> updates (drm-next-2024-09-19). [1]
>>
>> I tested it with an AMD Radeon HD 6970 (Cayman XT) and with an AMD 
>> Radeon HD 5870 (Cypress XT).
>>
>> I reverted the DRM updates and after that the kernel boots without 
>> any problems.
>>
>> Please note: Due to a lack of time, I can't do a bisect.
>>
>> Please check the latest DRM updates.
>>
>> Thanks,
>> Christian
>>
>>
>> [1] 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=de848da12f752170c2ebe114804a985314fd5a6a
>>
>>
>>
> I replaced the new Radeon DRM driver from the Git kernel with the 
> Radeon DRM driver from the kernel 6.11. (cp -R 
> linux-6.11/drivers/gpu/drm/radeon a/drivers/gpu/drm/)
>
> It compiles without any problems but unfortunately the kernel doesn't 
> boot either.
>
> Have you tested the new Radeon DRM driver with AMD Radeon graphics cards?
Maybe this is the issue (included in the latest DRM updates - 
drm-next-2024-09-19): 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/arch/powerpc/kernel/nvram_64.c?id=de848da12f752170c2ebe114804a985314fd5a6a

+ linuxppc-dev
+ Christophe Leroy
+ Michael Ellerman
