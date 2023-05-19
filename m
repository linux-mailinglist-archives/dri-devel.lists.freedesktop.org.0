Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FEC709F34
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 20:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A92A10E5FF;
	Fri, 19 May 2023 18:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E9710E5FF
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 18:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1684521649; i=deller@gmx.de;
 bh=b+2AGrbT2iCTCz3OFlX/jcH1rlY52mlE7sdXnwb37J0=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=D63Jx5htebFUiCuP0eHJDQ2JalzBrzn5N05/n3wXx50DobMiodLI01Czz+IZOdimb
 sPABCBOw+G98zrfJQ0vRIOwdJA0ThcackLAKzoMk8XvA872A4eBFLgm2b8sn+enB2A
 bdcQZIdsdBIgfmmUppiIEbkQzWyi5oR77XxASlNkxRm6nEgoUz8WMsZ0PDkmjPmN3o
 1BU31b2h7BgmsZtUz84Gzl8ngojNNbfG9noSXluxvSeo20f373AdiDMgE1X76gL/q+
 aaZBs+YjSmxx9xCg2/z0yFbSt8TL3EpkXDF0vABxgt6DNB0vAUfb0rK5NScphBI/NQ
 R96s+viwRUSuQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.152.232]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1My32F-1qMAzG2kXv-00zaOV; Fri, 19
 May 2023 20:40:49 +0200
Message-ID: <eff05b97-6cf0-7688-15cb-08b5b4d9276f@gmx.de>
Date: Fri, 19 May 2023 20:40:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [syzbot] [fbdev?] [usb?] WARNING in
 dlfb_submit_urb/usb_submit_urb (2)
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>
References: <0000000000004a222005fbf00461@google.com> <ZGXVANMhn5j/jObU@ls3530>
 <4cd17511-2b60-4c37-baf3-c477cf6d1761@rowland.harvard.edu>
 <be824fbc-cde4-9a2a-8fb4-1ca23f498dca@gmx.de>
 <2905a85f-4a3b-4a4f-b8fb-a4d037d6c591@rowland.harvard.edu>
 <ZGZ3JPLqxCxA2UB6@ls3530>
 <c7b8e69a-cabe-4e17-a511-66179259d1d7@rowland.harvard.edu>
 <6e93305a-2d70-d411-3e36-c536449295dd@gmx.de>
 <c1cf7ff1-c204-4afc-aa9d-890e07d5ec72@rowland.harvard.edu>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <c1cf7ff1-c204-4afc-aa9d-890e07d5ec72@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4OSxPdmlj77MjVIkbZlxVMdcdHlkd7bQa5kIjxoT5UkSSavXw8P
 r/1MvPs6oFo7/9oJ1tZ/vn1qp33N5lgNVmW430/JnQbM/tc142tE8mqtWChgfWHhVTuXa6J
 3at1vK6qbrH/XHrChM5qim8oE5Rx+rXsOCWF6EjbN5mYVpldlNxjQifWTHf3+R+Lm9jZVAo
 MIKOpaxzikMhn1/iRP2sQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:61dTdC5bWHo=;zjMSoS1U0kXpSMcGr82RaoSzznO
 zkG4jMkeN8aPFM7PgBR/hk+wI9KhLRHbV8YUx9/ekIywlmHNk++HbGu0jsvWFsSDqGipt32pT
 b6QrAj29Y6WsDLurgq1udmnbADM+bWp8ad8jcZ1o6mhUAGgw3TUuRPuzgamovQB+n/EX+UsoK
 aAudo94B3OxrJk9feX2NcfIk0bZwbQMY27k0a0ycwLqvplIGXROeo+ayHjFXtA0sXIW8nliXv
 ecR+A/SxjU2906nq0IkMB6XHXTyX6NeCeVEorekGHwdxLflu7h6d8H+gzDROXkM/JNd03BgBM
 eyD+2xQgih2CBo92XGM5AC1oLD4/7Ckk1iFirDBrMErocnDHNYx0F/DPn12Cux3g4n4dojuq1
 JsDL/ZM88cIJA0Dn8x8ETQhGIOajxV4Q4YSNLKI/qEyfnIZVeOSMnBK7Hf/V4qFbfKU1EHUp8
 MrGEezMTRHxqwy4p8v/mLJlpY0L6dFXsEFGbAn+5LNNjgCPUnT5Fhz3wb0E2gKBSnTQYckg/T
 U1Sz9r/4b8Im3q4XlX8Ot2FWdA+fe3I1S1paxvmOGWK0dL48gTfEm9vU2Hqxkgc27XZuBfH4C
 d2DdibSJkVuhJ/CMuBqJlCC7SFHKGEP5F6ogwhTjz7p66tWQcBpQhEcA5bFStsEA6hD/AWojX
 KUXFOY+yhGSJ20ZogQsJqs9ngKRytnEBMMvWypFtiSNNniBCjqwIAd4DgNiADFJ2u8R4p+9vB
 QvO+WCDihnE5g5iivaNYru73VQxzXyxoZdL0BpPa4agv9rKkGZ1kbOqw2e2h7sVcfZ+61pwzn
 /LbXZZMdvSdnLKtlt120Uz76qut7/oA25Q9LVqMXHfmWuVPZ0vBgrJKkdEK/mf8HSOqE31fBx
 L/U+RGakcuPREMsUeqxZpHGEUbaA5InQlTGglZ06BFB1nUQxtdb7drVq48LSi7HMV57Gc9Szd
 CxjcyS1QxUJO+le8HNF2fYZkA14=
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
Cc: linux-fbdev@vger.kernel.org,
 syzbot <syzbot+0e22d63dcebb802b9bc8@syzkaller.appspotmail.com>,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 bernie@plugable.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/19/23 17:42, Alan Stern wrote:
> On Fri, May 19, 2023 at 12:38:15PM +0200, Helge Deller wrote:
>> Patch looks good and survived the test.
>>
>> Will you send a proper patch to the fbdev mailing list, so that I can
>> include it?
>
> Will do.

Great! Thanks!

> While you're working on this driver,

I'm not working on that driver. Just looked into it because of this
sysbot issue. I even don't have that hardware to test.

> here's a suggestion for another
> improvement you can make.  The temporary buffer allocations and calls to
> usb_control_msg() in dlfb_get_edid() and dlfb_select_std_channel() can
> be replaced with calls to usb_control_msg_recv() and
> usb_control_msg_send() respectively.

Ok, I'll look into it.

Helge
