Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D5C81A1F4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 16:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EA910E5CD;
	Wed, 20 Dec 2023 15:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2582 seconds by postgrey-1.36 at gabe;
 Wed, 20 Dec 2023 12:14:04 UTC
Received: from mail.ilande.co.uk (mail.ilande.co.uk
 [IPv6:2001:41c9:1:41f::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C427510E579
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 12:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GBu1n9UpyML9mPKHRNKgeB/lPZsYhYwtT2qsPKyKuGY=; b=K4rOhtXNRKWVmxV0llTM7dnZsY
 a5GANgYDnciw+6ZWjS+skyHpGk91DIAlmaarwlBbb1X5UT3ny7H4IlLaaP+fzIQBlb9iP+3egf9LA
 PCm7wOcCzLv8eEkUq0DwJUJivmiljxDtnFrFZJAtWCS4Shs2mwDpGCnUD9r1OJu32InVs1pAa/ilY
 iw31f3POMfg0BPCqi+ShKuq/+zA4Nnta11MaL9iiDoJtEqDJOTrHRQnCCvkNcpE6XPTylTPBMh/aa
 OPHtTyuaiTGrtfZTTHAkvcolLkRbjPpvSTNyjz2sbjvvPNPLtbtKa/No4qPbAfkuxgc9fPh6NSl/Z
 msJlceVxXDgM1RmALlMct5KarAd4dcPticS5/0UHkcpOHdzaTVKfHu5jcHhiVjXq/ns0FzgYIodmh
 VRimbch9Sewd3ihByxbBTw1DSsNLT9ncgB6cpJXXRNiBTbGQlZK33GCqCGw9vWI7YFlTRVm3n1QaL
 1VSQ8t5pY1ud7HtyQ4UBL8WdS92n5TtCDSKw6oOkczPfrNvm3kghN9O+TNUT28V6Yo9Cej0eY7VT5
 U+zBtstEtmUhOVttm8CyS77H0yE5AwbCoctHfNkSNE+gCNC1uX3xjWRRwycUD2RFB0ch51FDY9Mg9
 11RrIwwR8pWtRZunRG5Go7GNmhiqqKnON7G/Xh8rs=;
Received: from host86-147-134-9.range86-147.btcentralplus.com ([86.147.134.9]
 helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1rFum5-0001H0-9f; Wed, 20 Dec 2023 11:30:09 +0000
Message-ID: <3d733b57-884a-4755-a32a-74061b48e182@ilande.co.uk>
Date: Wed, 20 Dec 2023 11:30:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Sam Ravnborg <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
 <01ea8c41-88cd-4123-95c7-391640845fc3@app.fastmail.com>
 <e897e6d5a88ec2f9024c62f7bee5c13bfb2cab55.camel@physik.fu-berlin.de>
 <dbb60b13-565f-43b8-8cb8-6f8cd98b06df@app.fastmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
 xsBNBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
 3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
 E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
 PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
 PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
 AAHNME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPsLA
 eAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
 NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
 mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
 z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
 T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
 DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63M7ATQRUCbs8AQgA
 y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
 2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
 14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
 YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
 Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABwsBfBBgBAgAJ
 BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
 opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
 NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
 Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
 KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
 imgcU9TTGC5qd9g=
In-Reply-To: <dbb60b13-565f-43b8-8cb8-6f8cd98b06df@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.147.134.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 mail.default.ilande.bv.iomart.io
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED,URIBL_SBL_A autolearn=no autolearn_force=no version=3.4.2
Subject: Re: [PATCH 00/27] sparc32: sunset sun4m and sun4d
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
X-Mailman-Approved-At: Wed, 20 Dec 2023 15:13:50 +0000
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Alan Stern <stern@rowland.harvard.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/12/2023 10:47, Arnd Bergmann wrote:

> On Wed, Dec 20, 2023, at 09:54, John Paul Adrian Glaubitz wrote:
>> On Wed, 2023-12-20 at 08:36 +0000, Arnd Bergmann wrote:
>>> All of these were found through inspection rather than testing,
>>> so there is a good chance that other fatal kernel bugs prevent
>>> testing in qemu, at least until the fixes from Andreas' tree
>>> are included.
>>
>> Andreas has fixes for these issues?
> 
> Not sure, all I know is that
> 
> - Andreas has some fixes for Leon in his tree
> - Sam is unable to boot mainline in qemu
> - There is an unknown set of bugs in sparc32 since it has not
>    been tested for many years without Andreas' patches
> 
> it appears that the qemu developers are still testing the sun4m
> model against old Linux and Solaris installations [1], but
> failure to run the leon3 model could still be any combination
> of kernel, qemu or configuration problems.
> 
>          Arnd
> 
> [1] https://wiki.qemu.org/Documentation/Platforms/SPARC#Compatibility

Hi all: I'm one of the QEMU sun4m and sun4u maintainers so thought it would be worth 
a few comments here.

My SPARC work on QEMU is unsponsored, so of course it is reliant upon me finding time 
between work and family to fix various bugs. This means that I simply don't have the 
time to constantly build and test the latest kernels: what generally happens is that 
someone pings me a regression bug report when something breaks and provides a test 
kernel/rootfs for me to look at. In the past both Rob Landley and Guenter Roeck have 
often flagged regressions and kindly provided these for me.

Other than that I just assume that everything is still working against the upstream 
kernel.

The leon3_generic machine is maintained by different people so I'd suggest contacting 
them: see [1] for their contact details. I see there is an avocado boot test for the 
leon3_generic machine included within the QEMU source tree, but it uses a 
downloadable image of HelenOS rather than Linux.


ATB,

Mark.

[1] https://gitlab.com/qemu-project/qemu/-/blob/master/MAINTAINERS?ref_type=heads#L1696

