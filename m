Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 220177F9401
	for <lists+dri-devel@lfdr.de>; Sun, 26 Nov 2023 17:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D075F10E130;
	Sun, 26 Nov 2023 16:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442C910E130
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 16:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1701016928; x=1701621728; i=deller@gmx.de;
 bh=WN1/vGIyIzfeMYUSrFmn0h7VFc58s1AGK8ifBAiMsM4=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=nZ+hOs33Gio/bi7RX5THhyss/cn7vRLMri2xUWCR9LXuAvNX+7InyfgNU1HB4vkT
 zMFhoI1jVkMpFZW7R9MidTuY947AOVY46stDG2UjfkLJI9ftfnlalWFeLgKEJcbOY
 jIStV96oBmEl9sHXicicJSmAeYf7k8fmYF4m5sYKb6lkwwTY+CUow++gdk2BO3Pmu
 yy3cXv9bHJ2M1D5mzgCittZqMZGvqbi9f0XeEa+pZo2xRxgvq7XV9vSJN3IVV+XtQ
 oLPiKIINvCJoAurgxjZCkOiyHManPg0ecXq9GPVBv4CT6sgJkYrfMyjuM+iFo5PU5
 yEjfocgvRKlbsMyLMw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.150.238]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mnaof-1rYc8T2vmn-00je0z; Sun, 26
 Nov 2023 17:42:08 +0100
Message-ID: <e47c68f7-20ee-487a-9c94-61eeeb014333@gmx.de>
Date: Sun, 26 Nov 2023 17:42:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] fbdev fixes and updates for v6.7-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <ZWLsgGku7j_7_eVE@ls3530>
 <CAHk-=wiR5yLK6-n5p=F97unF1bf3DuPdGcv0MZcO51aiik4T0w@mail.gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <CAHk-=wiR5yLK6-n5p=F97unF1bf3DuPdGcv0MZcO51aiik4T0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7yxFEY8HLvI15PlZ2q2kHJgUneNp1y4KdcQp2BYszoNiARXdaYf
 x1XDYnrRvxztgOIWiubusvnhqvjfExHYhfLZNzpLroGheUJQuOkO6dNOcxKctlLcl9SJPcI
 d59Jeti1MPWFAzD+oytxm9Yr5Z7zjgyDJir5KDAzDuFJxNsLP1yXfR1qxjBAT1wZSEkaCV1
 q3XNwpwDtggyX8zeoxqaQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DqBV8juuqkA=;7brZ+H/g5HM7y1s6YOfIUvwrDwE
 Y6Xilvr7cDjFWI7zgKrbfJknrifM2WUTH9ctuXJj9BDPlJedB5LFF9s7FM1nECLqCR1phFiWH
 RgUjh45WR+STYkJhxtYBDeo3AzfNlqQzmeIv96CLODviWUdGY0O8ITOlwvZZKNRIjXlodZAnF
 jPFdMhZRjgercAeXNWQAMvz4RlCOj8apZgDy9CYkD+cJRLDre+Q/Hetb2YdU5fyD/sfPI4v/E
 yrEOn+Zt8VO7hnLJ+JC/jzc7JsLjFa0nOXXlYY/N6260YK4fthdrD/u8d8gxcw1o+6PscnmM9
 QwWzzisD3UgC5Ay1mxUYZq4SMI5TfVx5sUgUqwM25LqUw7QZSP/reWN2xOgQ4xZRJQ3YBJVd/
 6Aij7wIDQ0tIkMrekk3BJInnYSnW5huM7UbNx5fi40ooMeNtsDkIyj12bIuiziJ3e0S1Yif3W
 wrfjfUF4xRx7M39lLeFIFutIsZAfrzswIAhd4HS8/gih2GgQF1Qo+UNwBaqgXYVKDc/iUuix3
 mZFLLztEnZ6qGpqRVtoq4gl3/FHRT4fpFXOYkIhKIgpg69yTZRi32rxwKIUTC14jxXWNcUXeS
 OM336rA+N+Fqhg+35I37Ul2ehyEkoUXFQOeDBq4u5PkP8l/2S5xqzc4mzOzG6CLrxIRWMZrDO
 UH+0tMNkPB6pHnVTzbvp0YwXHcE31pgsIZrwAzMXQPxdoW2BiMqZWZLkw/kKJHe1kB6vnTVLi
 UsiWezN4lTOgQzkG4H308RKLIHJ0Y1y+JfB+wC6XtLdik1RR8/QlONZcyaTfHJEwVeKfn4iV/
 SYld8ylvOOZT346BYBkgGlj5L63F4MO3JwybRvhrKE68eeV43OjCox9EFDBXCshTxiOgPvlQl
 O1/Tw9jJP9fcJG7u1cItMRjEVNyrOoFaHMpHTM0VvG0e41OEHlyaCje22VUNbH2S9URINKQ+0
 xOZ5/Doahgn5hBZsJTrg0jhVHV4=
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/26/23 17:29, Linus Torvalds wrote:
> On Sat, 25 Nov 2023 at 22:58, Helge Deller <deller@gmx.de> wrote:
>>
>> please pull some small fbdev fixes for 6.7-rc3.
>
> These all seem to be pure cleanups, not bug fixes.

Well, at least:
- fbdev: imxfb: fix left margin setting
is a bug fix,

and:
- fbdev: fsl-diu-fb: Fix sparse warning due to virt_to_phys() prototype ch=
ange
pops up in in multiple sparse reports.

> Please resend during the merge window.

I'll do.

Thanks!
Helge
