Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E708549C832
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 12:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F4910E6DB;
	Wed, 26 Jan 2022 11:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A0B10E6DB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 11:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643194865;
 bh=uymom++AR8s55d1uh5nbU+HZwmHUw4VPjm694+wj/XM=;
 h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
 b=BcqbZJRuXuAfSiIa8cgTBhpiingjbvzeVpxUg0E4UsxzUHT/7CnEszHtA9nEy0g4j
 tgwYnGr35Ed5Mh674mbCqwLNk268bmuFvRRgrcUDwSOu/QzUZ1skXRkwBLqBNh/xCS
 +JCw5rhHr3zORNvqhgJb9oTxJyzjm3bMYCcYeS4s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.143.57]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuUnK-1mMdco47eM-00rZo2; Wed, 26
 Jan 2022 12:01:05 +0100
Message-ID: <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
Date: Wed, 26 Jan 2022 11:59:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
In-Reply-To: <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8NQorOHRDOeHezX4LE3v2ty5WxtXOwxHqCdYTIFvRNufvqoA9Sx
 AV4uZg3ef5HfUsHv+4KrqKzb5X56ReOwUHJub0J8c8/ECShoS0zZsYeOFASWAfD1yH5qxkp
 3AoSGKzSbEL0LQiiOVfHGHmBsXHwd7QXuj0u6JGWoFju5mq0nSsA7vYJivv4jcwzFwEbpsX
 ylO27UqmSCmTzIJHVLIlQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vHW26HAwWkM=:3WTENPNKJ5r5rcEdtBn/o+
 l5dstyuPg3VtWXE2nFRr6MAbE4WtpY9VZOUyHD4FNIC19JcL+9fRHIR2OI1tFV/KJ6RM5tdtW
 rx7XzebFQn3D7mwVrQWNm0qH2KG8ozRLPpk8E/Y5rp2lAA3Xiv+5CqDlm32B+6/tbmV6qTe35
 mAb15+o4WJpHv5nKcKuEHc1pO2r2JF1R6DM2WCE6y3L7Ez6bTPOl0mUzzujKAOMuMdHpMAdtA
 AYwtXaYKarlSOGL5IZVy0z8O9WfL06DgkuPpfNGSXe/+ZMQIzOhGN07wZExlJT4xTXKr6SGEv
 4aOV8I/MWetOOh3wUmCqjnGf6MRyypMulexVMm/Rko41L7bCKYVuCoMLKdmhXtH0uyTHb7e7j
 8Dqbc9t6hBZiy0pyVygcIKH/BRF3wIMGiXvBcexok+lL4l/fHGBokOpe9lNgqPu7XD0d+NObe
 uuD2XbA89Hy2vkX9YB4JZEIP7nNhEUh0Icc041vrfJHcSOFV34xHtJ5yEkh8xlk/4qN/6I3/y
 +4d7Rk0M/Qr9LwyIgDvQmLy6WIsFkxn+YCZglAABGI4D/MzqaYnipKDHPdZLLRUYzt4v+2+wQ
 j7ax61UI+nRC1j+ci1UFiFlRVRtQChaLJO1Adl1WQ40tcq6I12AgBv1n783bjpPLElm0FeLkv
 vHkHTsa4wolYqO6r25Vf9UkC3Z5VjxEt/8qBrD2V3Qur1+BV8cKlHW52UDiQ6WJihtF76MY7E
 iVT/z7xsLpkeIG1ydKpQhWiUbmZltEu5Y63+5mPqYBmHk9pL5l+ziELbG9BLMTQivE8z2Q1kH
 wZeD5UFiqiTdKtJp1jQSPLLAp+ibEUQCJR1RpT7hdbFS+p9T8QKXnRWZbQTSJ9EbFfkwvmEZ2
 6QXjcWgjoUQ8pC0113DZwNzMwF6xtgSrc9qvaCgQjSxqg7m2E/U8js9PCNG3ZnrZirvB2XxoI
 5XgTcHdg4U0KKgniKUmzfFRQWH9MrKdYpCSu1fSjpBNkrraXf2fhc1R9Mt0fek8ile4K5QU9k
 KNkXkegY7NIPL40WofOxOkghiRKT2VxBSVRdwQBLs1ucSmtCtJC/ke1locRSQ47p/RA5XOKC0
 XEGoA5np3CU8/w=
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phillip Potter <phil@philpotter.co.uk>, Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/22 11:02, Andy Shevchenko wrote:
> On Wed, Jan 26, 2022 at 10:52 AM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>> Am 25.01.22 um 21:21 schrieb Andy Shevchenko:
>>> Since we got a maintainer for fbdev, I would like to
>>> unorphan fbtft (with the idea of sending PRs to Helge)
>>> and move it out of staging since there is no more clean
>>> up work expected and no more drivers either.
>>>
>>> Thoughts?

Personally I'm in favour of this proposal and would be happy
to take patches for it through the fbdev git tree.
Reasoning below...

>> But why? We already have DRM drivers for some of these devices.
>
> No, we do not (only a few are available).

seems to be 2 out of 10 (according to the other mails)
>> Porting the others to DRM is such a better long-term plan.  OTOH,
>> as no one has shown up and converted them, maybe they should be
>> left dead or removed entirely.
>
> As I mentioned above there are devices that nobody will take time to
> port to a way too complex DRM subsystem. But the devices are cheap and
> quite widespread in the embedded world. I'm in possession of 3 or 4
> different models and only 1 is supported by tiny DRM.
>
> On top of that the subtle fact people forgot about FBTFT is that it
> does support parallel interface (yes, I know that it's not performant,
> but one of the displays I have is with that type of interface).

I don't know those devices, but it seems they are still being used.

And the reasons why they have not been ported to DRM yet is
likely because either lack of man-power, a slow-down with DRM (due to
slow bus connections or increased memory usage with DRM), or
simply that it's used in embedded-like scenarios with a limited
set of userspace applications for which existing fbdev access is sufficien=
t.

Again, I don't know the reason for this specific devices, but I know
of other devices for which those reasons above are valid.
Just the example I posted yesterday where a simple "time dmesg" needed
unaccelerated 19 seconds compared to 2 seconds with acceleration.
So, as long as acceleration isn't possible with that driver in
DRM, DRM isn't a preferred target where the driver should be ported.

So, I'd be fine to take it into fbdev tree.

Interestingly there is another fbdev driver in staging (sm750fb) with
similiar issues. The TODO mentions a porting to DRM which happens at
https://gitlab.com/sudipm/sm750/tree/sm750
but the last commit there is 3 years ago. I don't know why it wasn't
continued yet.

> P.S. For the record, I will personally NAK any attempts to remove that
> driver from the kernel. And this is another point why it's better not
> to be under the staging.

I agree. Same as for me to NAK the disabling of fbcon's acceleration
features or even attempting to remove fbdev altogether (unless all
relevant drivers are ported to DRM).

Helge
