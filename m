Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A3666248F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 12:48:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A92010E3E6;
	Mon,  9 Jan 2023 11:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967A910E3E6
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 11:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1673264884; bh=KMpl6S7lSlaZ+5yiGcgsKsmplZZc72cQt2PocMHQQ+4=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Ov7smU7fXXKmFQoWUwHLOAWagAYM5bIaeNpOmiTlHt6/mVfHHZUWSpGW2dWgJuTm1
 2e9fncUjJgCKiFctLNlNTrffN14v+9eaGtdH/X1idaawabbkj5LKuLgCyHa5Tqy/yy
 hPJHN8uR3PEZfKB2obxabQWnuP+RaZRwlKPr6jRaHhFyXM+PRLgXZ/lRnBz51fpza5
 +71eoygdGDXp1XbA0K8WjeL5mNGke9MVb4VLxQ4t5Bo5A/izIDIE2c88p6eW7M4HqD
 rMeGQj83JoWzXMt5lEExViIN0cfEybOck4TFy30QjluwLbarKr01MA4esMu78GKDDW
 RSEOOXe5b2N6g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.168.5]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvbBu-1oxaMc1YU2-00scLO; Mon, 09
 Jan 2023 12:48:04 +0100
Message-ID: <70764773-ee94-869c-4a08-1810789db2e9@gmx.de>
Date: Mon, 9 Jan 2023 12:48:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [GIT PULL] fbdev fixes for v6.2-rc3
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <Y7aGw/irynC61O85@ls3530>
 <CAKMK7uEnFBo_YfU8OTvMS8+YkoGS=vmpGQPMa9PKxGOB3pd7nA@mail.gmail.com>
 <CAKMK7uFijjF+px9=xDXnyfhMbkxRqinEmV_N5VX6eAuJkc1J+g@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAKMK7uFijjF+px9=xDXnyfhMbkxRqinEmV_N5VX6eAuJkc1J+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:t7aq0ObGspn1cqOYLuC2y4ZriMmnTdLAEMWFlnaY/QM58ZVYQ6M
 A+aUfYHOCxB7lFAySs07SCH8Hr5NJWFT7zI6wf0j69XuWHF53+1+SBw3X1D0R53sTATNBTn
 KxXaPaADOP+wm516nefSSazg8X/cMGsNeK7JNoRHdXYrgRN/TAOvrdS7fqB1F4/lHhY6wJp
 gGqkmZsTyQUuX5nhZR2vw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FjDXyeR7/1w=;Rlzm8dWnWnIv3YtmsaxjocevHWg
 fCWo6dlP/N48kxqGGgj9hR3OYxO2H/9DXDo7FuYfOp/ZCUP9VrgUvBbFJq0eZICVlJO01IXE+
 4/7edylkI65qOWI+YFjoc0Okq+YOs2UzMW3IaRvST+MriyM8tAOmFHpgGwhy3FdiAhXXOK+sX
 kO6oyy92vxxREwhC2Kn9CiVMBoDRfbvvD4bTNOgNVxEF6Vt+ILEfQdQHLDowtoI4BPv9fHR4M
 gmlHAY7Q0WVlmjsWZXBLP1t0eDu07JZ6CBbKJWIaoE5Xq54DOSesNI0Pvl6UVJpdiR1qfz3I6
 VE3OKMY8efXD2W/j26LTUztGm+Z/7FXDdNW4HFXaUMUt37yvIHVMpoixby6LywH6KvcYwSVXQ
 ShIedViIod5HjPvakiBF91+aiNCBtGDlmFC+uPv2/haY8G/YvOwcFBn9KyMx0rA+Sv044njcp
 yE3a/XFA0SV75NmysttRRsDkC+k7hZFM667iX0hBPbETtBFutAbJAjo9kKp7HmzC+ihK2WjiR
 yOThRYxAgXiWgJgzP9vAPa4iPKVGpAuMDeTSThxC4N9TNHTqyfs7GWcyiFhSyCs3eKOOEu+AN
 QeZ/lQFlBIjKLtpkq2+saosJY/4rg/3L+AWEUI4pQjTKQxulpvkwBpMigHs7n3UVs25uJIqIF
 oJNrw83cQgOu3pQXK9nXVEokfNaZ4CG4igf3ldtO1iYMXIp7bGRWGEdsTFMfmAMaJObZ5E7WN
 tpU6SxYQLvmTrtxi5ebwS3g06rh+sV3xKC4gtlCz5PWGEaYWC2K6bNj1+a3PJff3YfFup+ftp
 bXsx+Zfn0A0dinS1frGJHZVXFGuUY+rfmbg8yRAqyFTLyEIvFZtWP6qrucR3LsMtR7cwAxlfn
 Snh0A8c5p+68CQI8aAdvvXw1VyjpjHaLcLi4CV63CXlAPTAqfoz98BSbH1meCF5E9yAMJAkYw
 CArOz3wZYlmLbUIs0jCcPiTnxk4=
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
Cc: linux-fbdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/9/23 11:26, Daniel Vetter wrote:
> On Thu, 5 Jan 2023 at 11:22, Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> On Thu, 5 Jan 2023 at 09:14, Helge Deller <deller@gmx.de> wrote:
>>>
>>> Hi Linus,
>>>
>>> please pull the fbdev driver updates for 6.2-rc3, to receive
>>> fixes for matroxfb, offb, omapfb and fbmem.
>>>
>>> Thanks,
>>> Helge
>>>
>>> ----
>>>
>>> The following changes since commit 1b929c02afd37871d5afb9d498426f83432=
e71c2:
>>>
>>>    Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
>>>
>>> are available in the Git repository at:
>>>
>>>    http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.g=
it tags/fbdev-for-6.2-rc3
>>>
>>> for you to fetch changes up to 764043cccd7232a783753a612d628fc0cb7854b=
e:
>>>
>>>    fbdev: omapfb: avoid stack overflow warning (2023-01-04 19:09:40 +0=
100)
>>>
>>> ----------------------------------------------------------------
>>> fbdev updates for kernel 6.2-rc3:
>>>
>>> - Fix Matrox G200eW initialization failure
>>> - Fix build failure of offb driver when built as module
>>> - Optimize stack usage in omapfb
>>> - Prevent use-after-free in fbmem
>>>
>>> ----------------------------------------------------------------
>>> Arnd Bergmann (1):
>>>        fbdev: omapfb: avoid stack overflow warning
>>>
>>> Hang Zhang (1):
>>>        fbdev: fbmem: prevent potential use-after-free issues with cons=
ole_lock()
>>
>> I looked at this, and even by fbdev locking standards this makes
>> absolutely no sense to me. I think this should be dropped before we've
>> reached some sort of conclusion on what is going on, or whether this
>> is just pure static checker conjecture without fully understanding how
>> this is supposed to work really.
>
> Just to close this: Turned out to be some kind of static checker dud
> (and unfortunately the commit message didn't even explain that it was
> found through some undisclosed static checker, I asked the submitter
> to rectify this going forward since they'll likely submit more stuff
> like this).
> -Daniel

Thank you, Daniel!

Helge
