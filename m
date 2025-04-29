Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 260C8AA1BED
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 22:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE2E10E040;
	Tue, 29 Apr 2025 20:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="GQ9pi4lc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B298110E040
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 20:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1745957848; x=1746562648; i=deller@gmx.de;
 bh=Iowk4z8QtWkm4Y0YZCudQi3a8iJL7SyIX74+qCqJ5JY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=GQ9pi4lcu5J0lZxU5aw/2jpoKMS6q9j1vV0YEJFkGcbrVN7seuWV7hTH3FlrFrm/
 T10XqhfnpKp7TZFZt8x6Yrt5CiBYKmiDL/QfZThA6ZNFr9iFQ1mPl94Ibr3X1X7Cc
 1p1tVmHdsFnZlVH+RRtvX8kDpy8AvE2uHCqY/Fgsl8z2SAWBvAQeF3HEU0gZ5urMb
 18eHeP+msw2sfMb0ZshEggVsdFNumbVZQoGR7RotGmWOFYhBpxtIbievEvazARSfg
 qKoGTb3I8XIqNjx00v/NPm1oM8KomG2e/B4WqDQL8r9dCY7mfdG1HJql1GmUsOdWJ
 dZLTgr20FvWiLb981w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.181]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYvY2-1uVsMK1tJ2-00Xq2X; Tue, 29
 Apr 2025 22:17:28 +0200
Message-ID: <e68c6218-6055-45a6-b96e-9c8381a4b409@gmx.de>
Date: Tue, 29 Apr 2025 22:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video: fbdev: arkfb: Cast ics5342_init() allocation type
To: Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook <kees@kernel.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zheyu Ma <zheyuma97@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250426062305.work.819-kees@kernel.org>
 <b982d4f1-6ed8-490b-8d47-6dc5231913e7@gmx.de>
 <CAMuHMdVY1_gEqULGD0BzdTd05OAkodhk+RXKRAy-T-0+RJt7yQ@mail.gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <CAMuHMdVY1_gEqULGD0BzdTd05OAkodhk+RXKRAy-T-0+RJt7yQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OD3iOLWk7bbSwxeCWT3VGHi1hyS4DZIvlVShNIzJqeeJmM+HjLy
 ehQQmTvkg8wqUAnyL+ObCFaxRWjtUvoFBf8KtPMLsZc+pnhf+G3KqR+zAOfOu6bUHBA5B7W
 80sGo7htpuyJ+pUZ7j2KtgjWAdh8yRsrgS5xkiW6Sr0vXZFdyeSnpFBQuUvFCI7fL1VIhvQ
 QFzr3Nfuj1Q+D5s5tqZhA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oKxxmtUB4NI=;2Hq7UhfBDuuwJzLSfqtaxRLznMd
 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
 iQQXUFQNy4SUM20mTc00y8=
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

On 4/28/25 08:36, Geert Uytterhoeven wrote:
> Hi Kees,
>=20
> On Sat, 26 Apr 2025 at 13:33, Helge Deller <deller@gmx.de> wrote:
>> On 4/26/25 08:23, Kees Cook wrote:
>>> In preparation for making the kmalloc family of allocators type aware,
>>> we need to make sure that the returned type from the allocation matche=
s
>>> the type of the variable being assigned. (Before, the allocator would
>>> always return "void *", which can be implicitly cast to any pointer ty=
pe.)
>>>
>>> The assigned type is "struct dac_info *" but the returned type will be
>>> "struct ics5342_info *", which has a larger allocation size. This is
>>> by design, as struct ics5342_info contains struct dac_info as its firs=
t
>>> member. Cast the allocation type to match the assignment.
>>>
>>> Signed-off-by: Kees Cook <kees@kernel.org>
>=20
> Thanks for your patch, which is now commit 8d2f0f5bbac87b9d ("fbdev:
> arkfb: Cast ics5342_init() allocation type") in fbdev/for-next.
>=20
>> I applied your patch, but wouldn't this untested patch be cleaner and f=
ulfill the
>> same purpose to match a kzalloc return type?
>>
>> diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
>> index 7d131e3d159a..a57c8a992e11 100644
>> --- a/drivers/video/fbdev/arkfb.c
>> +++ b/drivers/video/fbdev/arkfb.c
>> @@ -431,7 +431,8 @@ static struct dac_ops ics5342_ops =3D {
>>
>>    static struct dac_info * ics5342_init(dac_read_regs_t drr, dac_write=
_regs_t dwr, void *data)
>>    {
>> -       struct dac_info *info =3D (struct dac_info *)kzalloc(sizeof(str=
uct ics5342_info), GFP_KERNEL);
>> +       struct ics5342_info *ics_info =3D kzalloc(sizeof(struct ics5342=
_info), GFP_KERNEL);
>=20
> sizeof(*ics_info)?
>=20
>> +       struct dac_info *info =3D &ics_info->dac;
>=20
> Exactly my thought when I noticed this commit.  Adding casts makes
> it harder to notice any future discrepancies.

I've changed it accordingly.

Helge
