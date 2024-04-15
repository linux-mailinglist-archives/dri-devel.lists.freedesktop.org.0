Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6205D8A56AB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 17:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31C310ECF3;
	Mon, 15 Apr 2024 15:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.b="Q3MaPRE1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533941126B9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 15:42:40 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id EEFED44004B;
 Mon, 15 Apr 2024 18:42:33 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1713195754;
 bh=fwixS4nFBF1jNtEMQEKZ/7kqdaGWx06GVfLH7Qx1JZM=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=Q3MaPRE1vyRTl9ny96uVxXeDR6uBYb4HoMYbTcD2+0EvpntNpYqnvc6H9cpCEDjJM
 7k5sJRl/acc0qJOUztsw+6fWCXSu8racocXWCTtfC1U4ZYUjbu2HQmBUZV+HaPa6bj
 9SIl/ZzLrJznr3qSIlVZ1E4S+wHB+923SzcJxyhr4nXAAVvVdWgHty2IsJKEptvzcE
 OOEMyVpLpETH4o15W1b9Q0uDbZEOBe5NPeKJjQbmArm7+lfK1833HvLhnqVRVofkNn
 NMUSA0auWkRTVEcSn/yzB5oaNv1caexHj+8Dk8bCyIxX8GQqZAVT//XXJBWS2+gxmY
 s5cUEgmtB9hkw==
References: <d242a446258e34b2db8990561e51f145df748f83.1713100057.git.baruch@tkos.co.il>
 <cba06e6f-06cb-4b0e-88df-d25d278fb4f2@amd.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Baruch Siach <baruch@tkos.co.il>
To: Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] doc: dma-buf: fix grammar typo
Date: Mon, 15 Apr 2024 18:40:25 +0300
In-reply-to: <cba06e6f-06cb-4b0e-88df-d25d278fb4f2@amd.com>
Message-ID: <8734rmws2b.fsf@tarshish>
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

On Mon, Apr 15 2024, Christian K=C3=B6nig wrote:
> Am 14.04.24 um 15:07 schrieb Baruch Siach:
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
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
>
> Looks valid of hand, but checkpatch.pl complains about 2 errors (missing
> commit message for example) and a warning.
>
> Please fix and resend.

I only get the checkpatch.pl output listed below with one warning. What
parameters do you use?

WARNING: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 8 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplac=
e.

Commit d242a446258e ("doc: dma-buf: fix grammar typo") has style problems, =
please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.

Thanks,
baruch

--=20
                                                     ~. .~   Tk Open Systems
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
