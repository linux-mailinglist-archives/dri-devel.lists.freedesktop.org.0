Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6334F8419
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 17:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1756310EB56;
	Thu,  7 Apr 2022 15:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1972910EB1F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 15:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1649346737;
 bh=8F0t/FONcQor1dELWSbQulID3wh2RD6EgpmnVPvR4Cg=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=LH6lTAjpY2/vfJbAhwMhsLPCl5/7kNEUeo8cnzY0NdBzcCVU1yB45AhU/Ua3dIahB
 nN8WcqpDqyG/if4ubmgTdOjM4ZoX8Wfc5bgQmL4GLHgMwvLVR6W0E0WtaymfRI3djO
 jMastlx6rGqUHvMXFBVhcyCjBGyYFBe88pRMeJvg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.161.122]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MysW2-1nyAD52mPK-00vz3W; Thu, 07
 Apr 2022 17:52:17 +0200
Message-ID: <9f694b7e-4cd1-9682-76bd-d534b8b2a485@gmx.de>
Date: Thu, 7 Apr 2022 17:50:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: =?UTF-8?Q?Re=3a_=5bBUG=5d_fbdev=3a_i740fb=3a_Divide_error_when_?=
 =?UTF-8?B?4oCYdmFyLT5waXhjbG9ja+KAmSBpcyB6ZXJv?=
Content-Language: en-US
To: Zheyu Ma <zheyuma97@gmail.com>
References: <CAMhUBjmFhqTLBscHHVZ1VTSqrJBT1VEevA+KkjY+y9_ZtdRkMg@mail.gmail.com>
 <CAMuHMdUiEo8q9x0C0x5zOM=ax1=S06=s0JjcJvZYD4aMGLmEaQ@mail.gmail.com>
 <a564f6af-31fa-79a2-72c3-578f2c095b23@gmx.de>
 <202204051946.43277.linux@zary.sk>
 <527a8c23-609f-5f8a-e076-a8a59da59865@gmx.de>
 <CAMhUBjmBm3=CY=cCZuH0+ZeemNVT=9XywSoYiR7WLcYOUGu9VQ@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAMhUBjmBm3=CY=cCZuH0+ZeemNVT=9XywSoYiR7WLcYOUGu9VQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:j7cwFdDjfVpmsMjtwyB3OUO3MWVOnbnSkDpNGxr2ahnxJ0HapcD
 seqSeH1J65LYC2zINMl3QQ3kUlVW2w6Uy48vibjsCLuRB52GKJK8RSoJq1MbSo7epPtt1S4
 sSmiyqwW1P25PnRxxd7gdDNSny94/LFpndPKFc+zmcZwatijIwkiknxWGlQLWJbUtWeiccX
 kf1GHJVmQ01X1HeAZxxnA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SJimqgsyAOI=:yRiGBCv6dGeOAaSZuVtb4t
 mU7w2KeSgRPfrLmWIYGVPVhFoUdFXe94WqSEHnCZezoZAd2WeLXUUfj4QCEV6yQYga7jtzqnO
 AanGJRCNxtza0lHWJHC6VUd+Fi+2wN4QKMT4vpHQemGery8sWHEfrmnRE8YAatEFJrW08/BIr
 j5mUUFoLSEgp0HCOjOuKmf0CP/E9zYUpseBKUiZd/7dsRmsibT5Cbs21fklzJd6hikmPYFIjx
 Wi42YAdxiPFm9FK6XMFg/WkTljqPRLXFrHgzZ2qthY3CshUdr9o5Ev2D2rzwYeKj/PrGXLDV/
 A908ImudFpb7OdyH0PCywCudum30manYCDxEaxCL06eeWlPOW80BqZkOcIldFj3Q2IQVh+e5/
 wUznNDbCNhcDKRIoKgBS+cw//4CPAq8V/NfvrMDbR/1T/1MQDIL+2EMbQUh2Oakk0Dwz8ENII
 Y6fPmT8UMq+9f+7LDDzFBoJtOtpPMylM/xIkiN55HLYMztNmjQFvAza8wfS+xv+mubZvnWwPw
 7upJhKUlrj4XQmgk2mtp2SEjWWNKOJimbUMe9ruQpl0XDk6VnvHFaN51eATWHGHGJ2JQosHzv
 +WvO64XmS3MkyeGTkCxMQ3TRSysAeR7j8G/p155s0v07nkpKtvBzLMlCtGA6/3AFFrgfHU7i+
 ZczJXv4Yl4ZCHag7KTbxIe/oG56kdH0A9FsJq1Ded+NZeWQLsZEdAP/neiKokhDKEqmU98Ogn
 xDgyeSfiKAdTZSiFATJyGXQ9K3cuswmKmTOXUs4D+Sx0ZRD5dtCsvin/jfiXiSOwhAG28irx0
 S3Z/+OJzYiFahYA2PVNkYUDavkhi+g83FZ79WTiUriggR8+R8nzhN0M/KT69ruvpIj26ul8/b
 u3LvavI89dl6hzJ/EV3F9brJVJch50NXOvLwFJdldJXTiFnzaHdh+Axi7p9FiGqJfJpSXlZ+K
 XsqPDqbwJQri8LrTrh2ugGKzL+OIe+4fm8tqPb6b2GxPW95PMHxEa5csy4rQVJ6c1aYe2dUTE
 1/lSyaGB0/M9G1lkgHI2l4gvq88B0e0jm997O5oURNMoHYXHAKkXTrvltPDv+uDRAwuTv/2/s
 8unlWpwiWn3YJA=
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, Ondrej Zary <linux@zary.sk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/6/22 03:24, Zheyu Ma wrote:
> On Wed, Apr 6, 2022 at 2:23 AM Helge Deller <deller@gmx.de> wrote:
>>
>> On 4/5/22 19:46, Ondrej Zary wrote:
>>> On Tuesday 05 April 2022 08:33:57 Helge Deller wrote:
>>>> Hello Geert,
>>>>
>>>> On 4/4/22 13:46, Geert Uytterhoeven wrote:
>>>>> Hi Helge,
>>>>>
>>>>> On Sun, Apr 3, 2022 at 5:41 PM Helge Deller <deller@gmx.de> wrote:
>>>>>> On 4/3/22 13:26, Zheyu Ma wrote:
>>>>>>> I found a bug in the function i740fb_set_par().
>>>>>>
>>>>>> Nice catch!
>>>>>>
>>>>>>> When the user calls the ioctl system call without setting the valu=
e to
>>>>>>> 'var->pixclock', the driver will throw a divide error.
>>>>>>>
>>>>>>> This bug occurs because the driver uses the value of 'var->pixcloc=
k'
>>>>>>> without checking it, as the following code snippet show:
>>>>>>>
>>>>>>> if ((1000000 / var->pixclock) > DACSPEED8) {
>>>>>>>      dev_err(info->device, "requested pixclock %i MHz out of range
>>>>>>> (max. %i MHz at 8bpp)\n",
>>>>>>>          1000000 / var->pixclock, DACSPEED8);
>>>>>>>     return -EINVAL;x
>>>>>>> }
>>>>>>>
>>>>>>> We can fix this by checking the value of 'var->pixclock' in the
>>>>>>> function i740fb_check_var() similar to commit
>>>>>>> b36b242d4b8ea178f7fd038965e3cac7f30c3f09, or we should set the low=
est
>>>>>>> supported value when this field is zero.
>>>>>>> I have no idea about which solution is better.
>>>>>>
>>>>>> Me neither.
>>>>>> I think a solution like commit b36b242d4b8ea178f7fd038965e3cac7f30c=
3f09
>>>>>> is sufficient.
>>>>>>
>>>>>> Note that i740fb_set_par() is called in i740fb_resume() as well.
>>>>>> Since this doesn't comes form userspace I think adding a check for
>>>>>> the return value there isn't necessary.
>>>>>>
>>>>>> Would you mind sending a patch like b36b242d4b8ea178f7fd038965e3cac=
7f30c3f09 ?
>>>>>
>>>>> When passed an invalid value, .check_var() is supposed to
>>>>> round up the invalid to a valid value, if possible.
>>>>
>>>> I don't disagree.
>>>> The main problem probably is: what is the next valid value?
>>>> This needs to be analyzed on a per-driver base and ideally tested.
>>>> Right now a division-by-zero is tiggered which is probably more worse=
.
>>>
>>> I still have an i740 card so I can test it.
>>
>> Good. Someone wants to come up with a proposed patch?
>
> I have submitted patches for the i740fb driver and other drivers which
> have similar bugs as follows:
> https://lore.kernel.org/all/20220404084723.79089-1-zheyuma97@gmail.com/

Yes, I know.
But Ondrej offered to test a patch which would round an invalid pixclock u=
p
instead of just returning EINVAL (which is what your patch does).
So, if someone comes up with such a patch it'd be the preferred solution.

Helge
