Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D8431BA85
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 14:49:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6766E1A4;
	Mon, 15 Feb 2021 13:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D516E81E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 13:49:27 +0000 (UTC)
Date: Mon, 15 Feb 2021 13:49:13 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: ITE66121 HDMI driver
To: Neil Armstrong <narmstrong@baylibre.com>
Message-Id: <12PKOQ.VHHQXI5140HU2@crapouillou.net>
In-Reply-To: <499fa56b-f808-41f9-aa41-8c959cc4699a@baylibre.com>
References: <DRRHOQ.EW1770YWN4DN@crapouillou.net>
 <828487f5-1cbf-1763-94c3-f0c722fcf2aa@baylibre.com>
 <U2KKOQ.KC88EH9WAG4I@crapouillou.net>
 <499fa56b-f808-41f9-aa41-8c959cc4699a@baylibre.com>
MIME-Version: 1.0
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
Cc: Phong LE <ple@baylibre.com>, od@zcrc.me, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le lun. 15 f=E9vr. 2021 =E0 14:39, Neil Armstrong =

<narmstrong@baylibre.com> a =E9crit :
> On 15/02/2021 13:01, Paul Cercueil wrote:
>> =

>> =

>>  Le lun. 15 f=E9vr. 2021 =E0 10:05, Neil Armstrong =

>> <narmstrong@baylibre.com> a =E9crit :
>>>  Hi,
>>> =

>>>  On 14/02/2021 00:54, Paul Cercueil wrote:
>>>>   Hi Phong and Neil,
>>>> =

>>>>   I see you sent a patchset to support the ITE66121 HDMI =

>>>> transmitter, last version being the V2 back in March 2020.
>>>> =

>>>>   Do you still plan to mainline it?
>>> =

>>>  Yes, we still plan to mainline it.
>> =

>>  Ok, great!
>> =

>>>> =

>>>>   I do have a device with a ITE66121 chip, so I can help to clean =

>>>> the driver and have it mainlined. But right now I cannot get the =

>>>> driver to work, while the chip is properly detected and correct =

>>>> DDC data is read,, my PC monitor does not detect any signal.
>>> =

>>>  Having DDC read working is a good point...
>>> =

>>>  Did you check the DPI data setup ? the chip supports dual data =

>>> rate input, and the last version only supported it via a DT =

>>> property.
>> =

>>  If "dual data rate" means two pixels per pixclock tick, then my SoC =

>> does not support it. I did try both modes though.
>> =

>>  The other thing is that my SoC has no VDE/HDE pins, so (according =

>> to the manual) I have to have the chip recreate these signals from =

>> videomode information. Which I did, and I get the "video stable" =

>> status bit, but I still cannot get anything on screen.
> =

> What is the mode you're trying to achieve ?

For now 720p in single data rate, RGB888, with VSYNC/HSYNC available =

but no DE.

> let me send a v3 with all the comments from v2 fixed and re-start a =

> discussion from this patchset.

Alright, please Cc me for the V3.

Cheers,
-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
