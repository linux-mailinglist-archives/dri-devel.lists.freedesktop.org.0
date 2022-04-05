Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F16FD4F232A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 08:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4C210ECFA;
	Tue,  5 Apr 2022 06:34:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A534F10ECF8
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 06:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1649140440;
 bh=ko6FFCg3jTQWeYcbHsEzW71hBgUeVWbZQ08boagfVh8=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=VN1tSV6jLfLzmXOZlAnvO9bWT0yNLTouT0lzZ3D5RcATXZ8zc58gzv/lEq0zrYaTj
 45rXW+yim5nJwk0VOfy1Pu8F0y8Q1JhChF/qeztUZgrHQwscqV9/ACKW7iCMx49n/d
 m+Nv5rOBxcR8bYLmSf+EcfanK1PDHcCPHO/hn0G0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.146.134]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFKKh-1nmLCr2YW1-00FfsL; Tue, 05
 Apr 2022 08:34:00 +0200
Message-ID: <a564f6af-31fa-79a2-72c3-578f2c095b23@gmx.de>
Date: Tue, 5 Apr 2022 08:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: =?UTF-8?Q?Re=3a_=5bBUG=5d_fbdev=3a_i740fb=3a_Divide_error_when_?=
 =?UTF-8?B?4oCYdmFyLT5waXhjbG9ja+KAmSBpcyB6ZXJv?=
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <CAMhUBjmFhqTLBscHHVZ1VTSqrJBT1VEevA+KkjY+y9_ZtdRkMg@mail.gmail.com>
 <631f03bd-0fdf-9cc8-bf37-89235fb84162@gmx.de>
 <CAMuHMdUiEo8q9x0C0x5zOM=ax1=S06=s0JjcJvZYD4aMGLmEaQ@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAMuHMdUiEo8q9x0C0x5zOM=ax1=S06=s0JjcJvZYD4aMGLmEaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LAaILEqFZDZfM0xhZS/NVXXhgIYpnWNV8s/9VbcsuBDSMWLiLPU
 DZEl7WtmMPSH8cqpob7Mqcset1jUEFargB3vc4YKvgOwul/QMVs26H26NIoXislvjl1VLP8
 J/FS1DeVpDfyjSG9fT4UzIKh1PDaExH0xAGvLK9bEKiwFs46zrvxRcsZAxNpfsxBe4CULZk
 mCKNkN4TMPSo3C9/DwOwA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nNDHsF5zKgA=:Cavb9VWG0o3bgfj+/23JAG
 CdzoDSBCCiU0SixsTW+rw5khbQnIbHo+FJfWnoXrFIPeSSXXEu0dIKRuz2oHEA2hNa3QIKXpc
 Q2g8k00gZUWpw0eWPAhSvfRokkPjP9ZnnzwmfxbwGPP8YA67Mt8oPBXQJBKUM5En51U6CS8gq
 BTAWGqW7XPIo9V3fdrm/mfTXrAPz8nYqJib6racy6wvyzE6PpMMHB4zq8MTegoQ7//xhd4Jj+
 FHaMjntSB0JRAaFe+cjvjQJdhQhuxlSijnV45+8icSnweIUnqIZF9EilbF21IxnxKs/BGXDXX
 omGknPgU09/frhQ+W3f6OmfoCU/ItnUvvY1Pz2STPiBWrsLQyd2WLUW5Pr/HgBpmcfDqokGmN
 sqKbyL1q5symTfH+DNm4w0uyaBvWt1Cb9S+VpijdbyZE59cYOc9hwSXGA2XiGzUss9KYrdgSb
 Ez2iIWLRc8Mhl7HvLJR2BTLbxO3IQhSTJcRoxtgnkn5/NrJtFhpSgGAJEedvG8qZSECi7c3Q7
 xzb1SgugiVqVBJcckUVxZW90ZW3o52jghWFXbnuG5YJcbXMVmJRb/i4aFI/JnliHSMPOYHS8j
 p5LTUoViXi/ft9an9ALLb2Ewmsu7RNn/KUuUXgKDfld6BuhA5G0LsA1k6cOJh+hr3wp0aqbUG
 mjAi+IyYNfPxlfbjf/GxS+/Ch4QQH8Lie/ib109z+fdHgXMUZAbMExlfyctyqkgePdSRkf5xI
 EuotQ2sjlpU/fMyR8o9zRz0Tzo+GVFZwsUEfaydgT3NhuhvlpaGWfY/bAkVR2gBZOWTuhRYn1
 8A7yWCqfqkEICMlRwz5d/qDxxvoPAkvlNLbxmRx5UKCo9TWz+je0KPmHNjv9PVqlBe1mcvz1S
 AahcQCxp6hil3ckp33cAIY4kiAL8WHoeCwjzVyMYxxXgLK83PS7EHyKkZFpH+9Qfa/mfgQAYR
 IE7SOGZ729KudeTzoBZ87dpamju3Jrcw1X6HuM974ozniFGZGUpEIaf0mH82xilQL0s30ApAc
 5DfAZZtFWkphHE7nRqCUDsQ1D7JxC0c9oJLcsqyMQ3njOzTD++XxLr1Uot/zUYS/RXCG8QjJU
 KBd9vT9B7OM87M=
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
 Zheyu Ma <zheyuma97@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

On 4/4/22 13:46, Geert Uytterhoeven wrote:
> Hi Helge,
>
> On Sun, Apr 3, 2022 at 5:41 PM Helge Deller <deller@gmx.de> wrote:
>> On 4/3/22 13:26, Zheyu Ma wrote:
>>> I found a bug in the function i740fb_set_par().
>>
>> Nice catch!
>>
>>> When the user calls the ioctl system call without setting the value to
>>> 'var->pixclock', the driver will throw a divide error.
>>>
>>> This bug occurs because the driver uses the value of 'var->pixclock'
>>> without checking it, as the following code snippet show:
>>>
>>> if ((1000000 / var->pixclock) > DACSPEED8) {
>>>      dev_err(info->device, "requested pixclock %i MHz out of range
>>> (max. %i MHz at 8bpp)\n",
>>>          1000000 / var->pixclock, DACSPEED8);
>>>     return -EINVAL;x
>>> }
>>>
>>> We can fix this by checking the value of 'var->pixclock' in the
>>> function i740fb_check_var() similar to commit
>>> b36b242d4b8ea178f7fd038965e3cac7f30c3f09, or we should set the lowest
>>> supported value when this field is zero.
>>> I have no idea about which solution is better.
>>
>> Me neither.
>> I think a solution like commit b36b242d4b8ea178f7fd038965e3cac7f30c3f09
>> is sufficient.
>>
>> Note that i740fb_set_par() is called in i740fb_resume() as well.
>> Since this doesn't comes form userspace I think adding a check for
>> the return value there isn't necessary.
>>
>> Would you mind sending a patch like b36b242d4b8ea178f7fd038965e3cac7f30=
c3f09 ?
>
> When passed an invalid value, .check_var() is supposed to
> round up the invalid to a valid value, if possible.

I don't disagree.
The main problem probably is: what is the next valid value?
This needs to be analyzed on a per-driver base and ideally tested.
Right now a division-by-zero is tiggered which is probably more worse.

That said, currently I'd prefer to apply the zero-checks patches over
any untested patches. It's easy to revert such checks if a better solution
becomes available.

Thoughts?

> Commit b36b242d4b8ea178 ("video: fbdev: asiliantfb: Error out if
> 'pixclock' equals zero") does not do that.

Helge
