Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A418A9B0F2B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 21:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10ED510EB77;
	Fri, 25 Oct 2024 19:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="PV0jINXS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C3210EB77
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 19:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1729884959; x=1730489759; i=deller@gmx.de;
 bh=CvEd4BjvEcsGDhB00d/C010UbokeoWkjDXb+3VQ5SD0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=PV0jINXS3eCqz0UPYr52slRhDn5GE4xvhzLRvd6J/oLBDJCUbJygDpjtSzn2cjPJ
 rzeVWn+71g8nozgPuOX9UFVNQA6ElP6/JTXG+JdpsWhV2Q5pJsOg1vgfhOMkGhSJL
 /AYP3NXyAqKGWHweoNnbQnkDkN319WP60Nb83FR30raiAXQo3PvEdvdjyeA2zkEqb
 xK05K2UkxZ9ELhdy1c+FlyB9HraqjpemyHokldIeUvramECxHjDhOvgpPmnsEI2HV
 LyKhm5SiSK2jMv3yDbcPwHotP5SLAfLV/4b4M+4O2ELqqc6ZDKERj5Tt36CCw4ER6
 HS8gDONi9zTlIspq5g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeU4y-1teaKZ1Ok8-00nzYF; Fri, 25
 Oct 2024 21:35:59 +0200
Message-ID: <e3debf69-0507-41bd-999c-b3de79c809b5@gmx.de>
Date: Fri, 25 Oct 2024 21:35:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] fbdev late fixes for v6.12-rc5
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Helge Deller <deller@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <ZxvBfDuqSC_TEM78@carbonx1>
 <CAHk-=wjKouRizUF97ZABtCmijjKR+sAOmWA4uiYhhSOwhxCT3w@mail.gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <CAHk-=wjKouRizUF97ZABtCmijjKR+sAOmWA4uiYhhSOwhxCT3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IHXV6sz3cX8PJiWpCG62UsbjB8J+3ctP9JsvXkb4nUoKixJn9/A
 imzFvn6wBnETZvivmIpDS37CTAZvNZX24hqdDpsyzd/zikIrJMKzGCAqh4pfshyckikHKWx
 /kJiFEWWNVKSa23ONc/hxSmWQTTZRbNMMqHZ1tScHzeoJeIOz/Oqap9yg4fSiIVS95Qu0CP
 3TS5D6OhsvTwNXmIretRQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Eq/JKMByQ5Y=;uzV5lNY7c+ib+PzRvvRRZJUSjky
 7wdME/vQpxQCLXJQdhGru2aqaSxnO86nd3BCvWQPB0X3cdIFi9nhZjKoDfXKzUXcTmMqDoYTr
 gWxuvq3qCeelHwxEegS9Z40PPqtaugtRFeJL2ShmAP/WqDxc4NVAYsFXh4hlYXO3fGPMFU96T
 FEDNLCqEZ/96zJBlaTOVNuZDR2dawWdUaU0M1CzMpw0YpQQ3C+hxkBBSP/5+cMhkG/dI2ijqZ
 soqxi0CKYx8ELrPZnqBEBkoymcYu1VHi8STF3smabHmf426XAoR2HymYucqWnjj3qbDSvTXGc
 QCbSiRaiiZiXawlK6lIyvoKoXBGkgLIv8/s5mGDpE4X/FC3Wt5frRKoAjJNNaV3FlhSHj4f7s
 ZIJwASFcQvNe2vgOZwTgaVcpYkJnMNb/Af4Vk/SffMq4utxh7vNiftk4q6gw2C2uPw4tWenWx
 qzLZH5OTmWAdZdPmB/uS4Bwq4cQMivQMqNr3DAK9eB+laRzc7pmUAbHrs7fbj3yTdrpr5E7VV
 wwMTzwf8uP+rwd7yC9HJuV8luTG2YHMwaH8/MJar2fZkJ3HE5vpoHIY4hh5+Z8RIZoEigyHmT
 ktffzogGRP/SVItCIfdsxikq/xON9Sr5sfFPyQ5jYWFo/2zdSuB4uEH5IwDIdt7YRLfTDXMWj
 vYJ2n2UZn7QzuPzI0HmlIwVmvzYAvQdgsFYi7DY0siD2B3YYspt8l3Fnz93WiRUeyy4AtRiON
 ISx0t9jeb4bVuYbnqdv6fm67DM/p/WsCsKto8ZK2xxTU2nbSZRJAdMMBV5Bvs4pYJfSOM/ffi
 hbMJKE1XqxiDGfIPB/ng5Qew==
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

Hi Linus,

On 10/25/24 20:31, Linus Torvalds wrote:
> On Fri, 25 Oct 2024 at 09:04, Helge Deller <deller@kernel.org> wrote:
>>
>> It's mostly about build warning fixes with cornercase CONFIG settings
>> and one big patch which removes the now unused da8xx fbdev driver.
>
> So I pulled this, but only later noticed that some of the Kconfig
> "fixes" are anything but.
>
> At least commit 447794e44744 ("fbdev: sstfb: Make CONFIG_FB_DEVICE
> optional") is not fixing anything, and very questionable.
>
> For no reason at all does it seem to enable 30-year old hardware in a
> new configuration.
>
> There were no build issues before, the build issues that existed were
> *introduced* by broken early versions of this patch.

That patch was the one I meant with "fixes [for] cornercase CONFIG setting=
s".
But you are right that there aren't any issues fixed by this patch.

> Does anybody even *have* that hardware?

I do have a few of those (Voodoo2). Actually one is built-into one of my p=
arisc
machines.

> Why were those pointless changes made?

When I accepted this patch I did not find it useless.
Maybe there are people who really enables Voodoo driver although
they prefer DRM. Maybe they don't even know the difference.
I applied it because I don't want compilation to fail at all
(which I see I was wrong in).

> Sure, the Voodoo1 was the bomb back in 1996 if you wanted to run
> hw-accelerated Quake, but in 2024, this change should have had more
> explanation for why anybody would care about the CONFIG_FB_DEVICE
> dependency.

Ok.

Btw, you will be astonished if you check the prices of those cards
on ebay nowadays.

> And in no case should it have been marked as a "fix".

Ok.
Do you want me to send a revert for this specific patch?

FWIW, just a few hours before I sent the pull request I did complain
about a similar patch (which I did not apply):
https://lore.kernel.org/linux-fbdev/7aabca78-dd34-4819-8a63-105d1a4cb4ba@g=
mx.de/T/#m070c6ba1047d26b856b0d6ac43592fc7b6f95518

Helge
