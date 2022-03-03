Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DBE4CBB1C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 11:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7501F10EF78;
	Thu,  3 Mar 2022 10:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A591910EF75
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 10:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646302675;
 bh=yNu5aV72kAVxWE9AEOpRwhvXEvz9REi7V2L5i8b9h3s=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=jqnKQY8QLOza54CSQbVUOmiQNlvoH/SQ3tAXO3JCVh1otqSL05CaQe7NMWApUEI2P
 PouLUKOwI8kjcNnVO98rScBjHK1x7721Iu+pmTOX+yUMA4n9YhOE2vNPXgYDeqCDLp
 ZzC/aUE9MkCTBwO9KVvb9oE7Q9eQYs3lwXUHPFeM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.242.61] ([80.187.120.72]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mj8mb-1o4WrG29AL-00f7DI; Thu, 03
 Mar 2022 11:17:55 +0100
Message-ID: <3c08fd49-75e6-7016-a686-06a761cc679a@gmx.de>
Date: Thu, 3 Mar 2022 11:16:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] video: fbdev: sm712fb: Fix crash in smtcfb_write()
Content-Language: en-US
To: Zheyu Ma <zheyuma97@gmail.com>
References: <20220302143311.2109322-1-zheyuma97@gmail.com>
 <666d1565-0467-bb21-916b-073392129e1a@gmx.de>
 <CAMhUBj=P82_f6LdhWqEbe06SRPrMU2jxquNzgWkrttGDy6C4Kg@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAMhUBj=P82_f6LdhWqEbe06SRPrMU2jxquNzgWkrttGDy6C4Kg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sAuAfXYVTz6VzBrsH0AZ6HYOL+QvuzH6C6VJQMmPCQOOf7g6N8V
 8fkZrdNxVTACopONE1EiqqXi4q0t4n1GveqG93hk6YSmhwZirDXLAarWnen/abTWi9qfYI4
 zlTaMeHpviWUsI+OYubD/B5rTs/Co0x1YEwJAM4ZLzsBf5WtKMa614rthfCexDC5wVtPFFD
 vNfnoyjY+0Kl52myht5Wg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0Z+A3Af0e4Y=:BO1NxRaM9pV41v0I9lTPln
 JOPxRf0O6EL7ElB7OoTlW4bET6INglJZiTidgeVP4thMMeirpfSdHoZ26DbSVer8qq06OtfVy
 RtL5IEdtAzS0RSkne6SNYm4UJyG2eX1X0Qu2YPFQN6Btf5+qRbz1UVGqM+GQimVtajaubMA2Z
 CVKje8ENX2nbbSkBCUn1gmae2dczvB2+t+qukd2v7E692w1M1N1dAvvmevXmaOlcJ1aeImnTT
 ECP71SL2grzMFGdgmwVwNEkLHAFVDDCCGCbAulPxK3KCAdjW0uOjAfVOvZ+zXXCnEWLcVktzQ
 Q7zVQuvTSpKSatdt1ejgwKmgDYA08C9qLLujmTVssxpY86Vn063vR7BGvvYfKcQzEKPAH4bR8
 xmdGGREub7/VhIzGXKxtfmuk6+Q/gqBdnadu8vwdp0hoSYkdoaaLIr8PKtCQ/PwBh6D4yVoPu
 cwAATba8u9ftOc6hucQ5/byfC7GeEnmhsMa+7MKHVghFrPE/SrxlwkqdsKWojIhjJd5O/idty
 7yBPegqYvQyqzDMJxe+1x63CDYjQgRekl3yZ7FBMockfZyHHgKF5MBI3iA+MfJ+6os1k2wt1T
 JVFgNS4jVTPW0DNy6t2I20xp3dNf7NDL5peHr3xRt7OX4+EwuJ+iH83EDauBemxlhPs2ol2ID
 +EIm5Z/ahVx1+6u1qCrzhIcHqnWPEbMyFJ2cyancsOz11AMUAsUWOK/kb6+4VEdrrxgrW0wwl
 f4un8VCMenf34zIIZVhmiC2pvgr+H8j6/74lC2SX5zuqXAAQN0UT56WjnUolbry8nXwovOQNZ
 cCrhP0DuK3A57wKiaXrcHcjT1ill94A8qM3ClJ9K+xBlFAEteFN1tcM3n4/KH7w2fZ5Nb5O3c
 +h+sJy/t+VUTWaKtG2YPi7/Wv173MBfBUs5KK9IH1JvDaUungVe4sKfZzxkFO9a9uqHrW8Wbb
 L/Wq4H8/oDLIx4CpGcJAoJMJgdp2uwR3Bc/maPw2Yq3Y5B98GhfDYd+72smv4q/Ssd1r+SGiZ
 4P90OY6QTe8cQrChV5L7nRLjNoqv8OB8eFmIRFCtsMut2VWrKkbW7c2PcbieTuAHakiZxhBxZ
 P8JUPgbpvREqPY=
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-fbdev@vger.kernel.org, sudipm.mukherjee@gmail.com,
 dri-devel@lists.freedesktop.org, teddy.wang@siliconmotion.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/3/22 02:34, Zheyu Ma wrote:
> Hi,
>
> On Thu, Mar 3, 2022 at 12:49 AM Helge Deller <deller@gmx.de> wrote:
>>
>> On 3/2/22 15:33, Zheyu Ma wrote:
>>> When the sm712fb driver writes three bytes to the framebuffer, the
>>> driver will crash:
>>>
>>>     BUG: unable to handle page fault for address: ffffc90001ffffff
>>>     RIP: 0010:smtcfb_write+0x454/0x5b0
>>>     Call Trace:
>>>      vfs_write+0x291/0xd60
>>>      ? do_sys_openat2+0x27d/0x350
>>>      ? __fget_light+0x54/0x340
>>>      ksys_write+0xce/0x190
>>>      do_syscall_64+0x43/0x90
>>>      entry_SYSCALL_64_after_hwframe+0x44/0xae
>>>
>>> Fix it by removing the open-coded endianness fixup-code.
>>>
>>> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
>>
>> Thanks... it's already in the fbdev git tree and queued up for v5.18...
>> https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/=
commit/?h=3Dfor-next&id=3Dbd771cf5c4254511cc4abb88f3dab3bd58bdf8e8
>
> This patch fixes the crash in smtcfb_read(), but there is a similar
> bug in smtcfb_write(), and I mocked up your patch a wrote a new patch
> for it.
> So we should fix two bugs with two patches.

Right, I missed the read() code.

I applied your patch now to the fbdev for-next git tree.

Thanks!
Helge


>
> Regards,
> Zheyu Ma

