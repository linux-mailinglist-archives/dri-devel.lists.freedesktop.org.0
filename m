Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84712132C8F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 18:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBBE6E82C;
	Tue,  7 Jan 2020 17:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9E86E82C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 17:08:38 +0000 (UTC)
Received: from mail-qt1-f176.google.com ([209.85.160.176]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N4eOd-1jo5yt39WR-011iUd; Tue, 07 Jan 2020 18:08:36 +0100
Received: by mail-qt1-f176.google.com with SMTP id e12so383065qto.2;
 Tue, 07 Jan 2020 09:08:36 -0800 (PST)
X-Gm-Message-State: APjAAAXqTVI9wmEOoULoNlRQy3R9GNmCICUVYlUn8yBG7qDMh+EO8x9j
 mcjhreC9V3O3I+qznkNXp9QBMZed/SfwiFv6ZzI=
X-Google-Smtp-Source: APXvYqzRk52Ew2lmsQMfvghk3ylFHcEIR88yL70qbdC0HVK9etbYRWgu7fgyXH4+189J3IyWZY+dkJGnvq1XjVlLM+A=
X-Received: by 2002:a05:620a:a5b:: with SMTP id
 j27mr335658qka.286.1578416914895; 
 Tue, 07 Jan 2020 09:08:34 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <1578415992-24054-6-git-send-email-krzk@kernel.org>
In-Reply-To: <1578415992-24054-6-git-send-email-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Jan 2020 18:08:18 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2eMB34Qd=U_9vGBCN3m5Zh4qDhyEpGH6M=M4e22aPQLQ@mail.gmail.com>
Message-ID: <CAK8P3a2eMB34Qd=U_9vGBCN3m5Zh4qDhyEpGH6M=M4e22aPQLQ@mail.gmail.com>
Subject: Re: [RFT 03/13] sh: Constify ioreadX() iomem argument (as in generic
 implementation)
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:IDMrLgC3H0ekmK6SwU9PMUPDAlZ6fljKTY5XMWA8Myz/jUHSKWE
 pXwUQZK18iHBuQPyaE7xSxkyKwdHREvojqcA9MEODrB/MbXHbg85sr+aRj/zFD4vz53ck5J
 FWTz9ZovYLhMwd21BkrUqaYI4DcqD19BcLadoJ45YmK9GH0tK/vVTscAqoPrzAkd9yBShIg
 t6XFKKvd4xI7+zETbAxkg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mR/c4lj8xd8=:Ncy4Vv6lgUVoMBjg+pvFIx
 rvJhbWimU8pv0OWpqelzbkmfEb8GypCJZVwEQcflUfgsn6poAN5ltQw4UWr1VLZajhpIfQLgt
 26L4BzxOuzUX4pP6vhS+C3p2PSTxspu6i7I/cYPbkRMZWNv/+vgQsX1BQjy38+0RCee3EXZaJ
 2sxAqgf6yCLCcgUjC5FyttUdPSIALicyPBGq/e7bhnht1cCuunP9ucOrsitSn3nVdqlBv+COd
 2ByLRWl41vMPrv+cJ5h31jQzl/A42B1qpnJ72AGbrvoCnUIb7Bv8uaOo9KxxEc+hjH0tBOuYS
 VFfWu4/D89snYQygPGIxajO63Wvz11lIQAEJG4WpMxYQskqVJCx6xHCh8D6j9slewTUzDLRf8
 7oxrztwudLzhy96QvSgL4fM2OV9TtgFkFnOkbylRp96emFjx0RQQ+LrhBqCfRyD1VZfP5upDY
 NRkRahONsaah53v8o2hVjtu84pvXT01GIiX2dplWboz+69Ioy+s3TII6HW45szsuQAk12qtlJ
 LSoj4lAe+YNVVXGu8JPwaO2ifPwPFAion7NNO9OrHVAGE4LgYYEJBCroNz7gZ5g5sTL12LSp6
 OjQfbRMTYYoca6xEs2feADrOk1g3W6gGQLw4rjOkouINhi139FUtNOvIWFJTxG+u3OAECiKiF
 qGi3PpKfl3TqvWgZbjmDi/C/ZWeNh7uWEPt7dH03aI7tpaJ3C0MxSP3GBCXHWvvxbDchHWu03
 v8IoJImYtPj3XcvdzpSIGcnq1ufIPHh4RUBqSwUPBpOF9jdUD8gTXhSvSXqIbRoDQBap6NurC
 oqUrxImD958kzip88Y8lw505r46OEbOfAfphmQ0plTPE+bNrBunzX3K9s5CnNjYfmO/Q4UPhs
 60QT3OGoJfOmuFxbqqJw==
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
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Networking <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 ML nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 alpha <linux-alpha@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 7, 2020 at 5:54 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The ioreadX() helpers have inconsistent interface.  On some architectures
> void *__iomem address argument is a pointer to const, on some not.
>
> Implementations of ioreadX() do not modify the memory under the address
> so they can be converted to a "const" version for const-safety and
> consistency among architectures.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

The patch looks good, but I think this has to be done together with the powerpc
version and the header that declares the function, for bisectibility.

       Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
