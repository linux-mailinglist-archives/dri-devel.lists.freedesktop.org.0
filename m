Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E954A76EB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 18:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF28910E364;
	Wed,  2 Feb 2022 17:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1393610E364
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 17:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643823377;
 bh=nuthtyGtekh1QQHr3+HkARKWphnDMvJGe0AUmpkrc7A=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=UgorUlyfz1L7WX1XD13Rv/Kw0rRnC9vqv2dHLJvt/P/wv1/f+JJtRmZjPr04+y3pj
 FIQDAjc1uBefyweGFLCsd0LpgYX8qFACQ9ZHgdeGgMn5hNN+rfopzVyDjBsmgPYdqo
 pcxVJwU+35jRbzkqIZdGBMA/Jx3omzQ7H56ifRck=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.163.171]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWRRZ-1mi2Bu1TXH-00XvtJ; Wed, 02
 Feb 2022 18:36:17 +0100
Message-ID: <882bfe4e-a5b6-2b2c-167b-eda8c08419e3@gmx.de>
Date: Wed, 2 Feb 2022 18:36:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] fbdev: fbmem: Fix the implicit type casting
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220131065719.1552958-1-yzhai003@ucr.edu>
 <b1c1f68d-4620-2429-66bd-33d806d31457@gmx.de> <Yfq+/dVOgDVbhjRJ@ravnborg.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <Yfq+/dVOgDVbhjRJ@ravnborg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VX0YPkte7zZH09cDCCwSMR6sYdUsNWLLA8YgeJOkgJgQF/e0Hdr
 ulgvAE4VODuPwDya1YKqtltqlyixywIGsh3K/ABDEZWxl2aUbWw7MesYYL0dyZsEFoyBzY4
 fMXhQKFj6nB7PIZMmz0F44mQGcF3UKOml4d/JksZQguJNYL4ityt/xqwcFWn46dkY8dISrc
 k4ju0v0v+e5pmBFX/T6UA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:S5DAjWZKd3M=:+qoyAW62vM1CXB8ZyHhb5o
 oIVMSe7TaTUcNwMjlf9qGfxSkF3iJc4s8xuXYgd/Yap6jWcNAIdZBj055VI5t2AbHFZpyF3pq
 N0A35aRyx6odqViUui0AvTYshmX6/XXAUW+eFNp3NNbLsV4vqPXMqOGO5ZxA7Ue+L0ebIfCIv
 wIvlxM95WA8nCtjKnBBA1L6opujM+lSm4pOleyGcSPjngL8daqTf5B92k/ViuoAnM9A+wilTU
 tFu4F3E/KKhp3hf3wnJHhcQEjeT7c9k1jjDnwu4U9/pB1XI5Ymvog/TYf+PtCRPpH1rQhn2de
 OZ8S6bMjaJPT7OW+nwSIefQpFsbVMdrdu5BDgaplKIaYf8G8ZbTkKx0ZQybl/lAnBbo89Z0xm
 GMCMH3mC/ef8l+1/uFgOpruVJrPXR3eLEKwzkwsyQjwGXCnsktx1C8Eqfm5XIW52sV0PkoecA
 TkxrhiQ7kQt4M4Ks7RoXZPtevYsp91w/9ewt1J0k2YwTfiz59mLDmw1IkaNlzkqRsQbuW1+C/
 2CvyQt42GZlq7zAbYFrYbiRwb5K3pRiFq/O1dgPN9ajWt6l3I+CGO6JZAF9IpcaOHswXnTnKo
 /U49eL7/FgAicyIH94BNBXmqyi9XrRXgS1PA4PkheWFcVyv0Oo4xIQd95JREfCfLNhdRF5L3Z
 Ew1y6ISsL/nZ7LX7Y3VjjOa8w0zzA5Q5zCXYZXxE+zeo1AlF+hOCWLOdDqtEGQms2E5FD9Inn
 s2AuwWgDsGzvWkIxkVJrD4rtvnpXNqb/8k0aqvOINQ5USEkJd6s7m3rgX7m8DvtNrUidJbIce
 ZDHI4XDjGn+WMu+pXjkujVKhF4e0qSyWa/lBIsnEk3El0TLakOQrb/Vl27M+COledZTvZ5u4/
 ++5D3tz+daxmrNzfEFPeuXTaZ3lF2+EfvCgLuZoSfZJKSma7KO85IdB6QoJNXgHY9nhMOpOMM
 k8c5lfcYekwgp8rrTPug1FrW3aCRLK0GII3tpxAfTEWj+fTOebogrXHinEb5ikVdxVypZm/XI
 RAyQKkVgoQ0N2h4Dxu/T33Q7+QykG8WGD/xnjLJ1nLXBBpaQcVj3v3BGBPOV+kX6V9BwLTlYr
 Hi7AoBrK2dfhN4=
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
Cc: linux-fbdev@vger.kernel.org, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Zheyu Ma <zheyuma97@gmail.com>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Yizhuo Zhai <yzhai003@ucr.edu>, dri-devel@lists.freedesktop.org,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/2/22 18:27, Sam Ravnborg wrote:
> Hi Helge,
>
> On Tue, Feb 01, 2022 at 04:02:40PM +0100, Helge Deller wrote:
>> On 1/31/22 07:57, Yizhuo Zhai wrote:
>>> In function do_fb_ioctl(), the "arg" is the type of unsigned long,
>>
>> yes, because it comes from the ioctl framework...
>>
>>> and in "case FBIOBLANK:" this argument is casted into an int before
>>> passig to fb_blank().
>>
>> which makes sense IMHO.
>>
>>> In fb_blank(), the comparision if (blank > FB_BLANK_POWERDOWN) would
>>> be bypass if the original "arg" is a large number, which is possible
>>> because it comes from the user input.
>>
>> The main problem I see with your patch is that you change the behaviour=
.
>> Let's assume someone passes in -1UL.
>> With your patch applied, this means the -1 (which is e.g. 0xffffffff on=
 32bit)
>> is converted to a positive integer and will be capped to FB_BLANK_POWER=
DOWN.
>> Since most blank functions just check and react on specific values, you=
 changed
>> the behaviour that the screen now gets blanked at -1, while it wasn't b=
efore.
>>
>> One could now argue, that it's undefined behaviour if people
>> pass in wrong values, but anyway, it's different now.
>
> We should just plug this hole and in case an illegal value is passed
> then return -EINVAL.
>
> Acceptable values are FB_BLANK_UNBLANK..FB_BLANK_POWERDOWN,
> anything less than or greater than should result in -EINVAL.

Yes, that's the best solution.
Yizhuo Zhai, would you mind to resend with that solution?

Helge

> We miss this kind or early checks in many places, and we see the effect
> of this in some drivers where they do it locally for no good.
>
> 	Sam
