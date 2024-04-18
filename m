Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EE38A9EC1
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 17:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA51410FCDF;
	Thu, 18 Apr 2024 15:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.b="lBOF4Nmx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2FD10FCDF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 15:44:08 +0000 (UTC)
Received: from localhost (unknown [10.0.8.4])
 by mail.tkos.co.il (Postfix) with ESMTP id BED6544060F;
 Thu, 18 Apr 2024 18:43:58 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1713455038;
 bh=iIKKAiCnRrAgDIHZSb5hVhvQsqE83aNLWEDnlLR6DHA=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=lBOF4Nmxa2i74GupirMIm7BEyf+CY3t4N2S9rrDdHsn+kngATbdgVLjeDCXu7S5Xf
 tmYHqi7okN2cfnBzUz0lTOLDTJUtlIcrtU/B0Em24JA30kNQ6ix5blwj3vfVB18nJ6
 chYI6pVDffiUEYenwDh4ChfDAgB+FFByfZPpeHV0+Y7Fmmla0893W7DCQK4ZpVpGMQ
 TBTC9rUViLMXfKVRQGrfILZNh5zYM81IGn/t2qsdFVhStC2jbaTxJMRdh09VSrdMqD
 QTi5MmoLVglFh5yjzYYy02U5g8jUx1C3qswHuLc3CgEagxmIBEjwiJlgswUtiN0ijc
 fmILEoXpX2NCA==
References: <505484b83fedebce3c65b10b076b34df075074b6.1713329988.git.baruch@tkos.co.il>
 <fd8d8a88-a457-40b1-b8f6-4c91c9d964da@amd.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Baruch Siach <baruch@tkos.co.il>
To: Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2] doc: dma-buf: fix grammar typo
Date: Thu, 18 Apr 2024 18:23:42 +0300
In-reply-to: <fd8d8a88-a457-40b1-b8f6-4c91c9d964da@amd.com>
Message-ID: <874jbyad6j.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Hi Christian,

On Thu, Apr 18 2024, Christian K=C3=B6nig wrote:
> Well checkpatch.pl still complained:
>
> ERROR: trailing whitespace
> #157: FILE: Documentation/driver-api/dma-buf.rst:80:
> +=C2=A0 If llseek on dma-buf FDs isn't supported the kernel will report -=
ESPIPE for
> all^M$
>
> That actually looks like you used a Windows line ending.

Interesting. I can't reproduce that here:

$ hexdump -C 0001-doc-dma-buf-fix-grammar-typo.patch
...
00000490  6f 72 74 20 2d 45 53 50  49 50 45 20 66 6f 72 20  |ort -ESPIPE fo=
r |
000004a0  61 6c 6c 0a 20 20 20 63  61 73 65 73 2e 20 55 73  |all.   cases. =
Us|

Only a single Unix style EOL character (0x0a) is shown.

Same if I dump the email from the archive:

curl https://lore.kernel.org/all/505484b83fedebce3c65b10b076b34df075074b6.1=
713329988.git.baruch@tkos.co.il/raw |hexdump -C
...
00001010  6c 20 72 65 70 6f 72 74  20 2d 45 53 50 49 50 45  |l report -ESPI=
PE|
00001020  20 66 6f 72 20 61 6c 6c  0a 20 20 20 63 61 73 65  | for all.   ca=
se|

Do you get the same blob hash (29abf1eebf9f) when running

  git hash-object -t blob Documentation/driver-api/dma-buf.rst

on the resulting file before you fixed it?

> I fixed it up and pushed the patch, but please take a bit more care next =
time.

Thanks. I'm curious to know what kind of care I should take.

baruch

> Am 17.04.24 um 06:59 schrieb Baruch Siach:
>> Use 'supported' instead of 'support'. 'support' makes no sense in this
>> context.
>>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>> v2: Add commit log message (Christian K=C3=B6nig)
>> ---
>>   Documentation/driver-api/dma-buf.rst | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver=
-api/dma-buf.rst
>> index 0c153d79ccc4..29abf1eebf9f 100644
>> --- a/Documentation/driver-api/dma-buf.rst
>> +++ b/Documentation/driver-api/dma-buf.rst
>> @@ -77,7 +77,7 @@ consider though:
>>     the usual size discover pattern size =3D SEEK_END(0); SEEK_SET(0). E=
very other
>>     llseek operation will report -EINVAL.
>>   -  If llseek on dma-buf FDs isn't support the kernel will report -ESPI=
PE
>> for all
>> +  If llseek on dma-buf FDs isn't supported the kernel will report -ESPI=
PE for all
>>     cases. Userspace can use this to detect support for discovering the =
dma-buf
>>     size using llseek.
>>=20=20=20


--=20
                                                     ~. .~   Tk Open Systems
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
