Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B91FB132CA6
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 18:10:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB67489A98;
	Tue,  7 Jan 2020 17:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2558A89A98
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 17:10:27 +0000 (UTC)
Received: from mail-vs1-f42.google.com ([209.85.217.42]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MsqIi-1jhnLO0rvc-00t9uU; Tue, 07 Jan 2020 18:10:26 +0100
Received: by mail-vs1-f42.google.com with SMTP id v12so34354252vsv.5;
 Tue, 07 Jan 2020 09:10:25 -0800 (PST)
X-Gm-Message-State: APjAAAXcFBPJhtnAplKjHRRjLF/K5QxJWJcXvXVymcNej2rvrXx/X0fi
 wVBu6JhvdAX+IlcD7MXeTvFjRIiiBGm7+ru0Wro=
X-Google-Smtp-Source: APXvYqxwO5AyDQus85+IK5BIt7KfSsh7NvpnQb9bzWV5OgyrFYMfLh14xqWUd9CW/X7TSfP34I+W9RVMaa5KUvf/Vb8=
X-Received: by 2002:a0c:bd20:: with SMTP id m32mr365813qvg.197.1578417023930; 
 Tue, 07 Jan 2020 09:10:23 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <1578415992-24054-9-git-send-email-krzk@kernel.org>
In-Reply-To: <1578415992-24054-9-git-send-email-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Jan 2020 18:10:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1RibnRU6SiVjrOy-q+ZDdKacQgD9mrft_aHMgA9hm3PA@mail.gmail.com>
Message-ID: <CAK8P3a1RibnRU6SiVjrOy-q+ZDdKacQgD9mrft_aHMgA9hm3PA@mail.gmail.com>
Subject: Re: [RFT 06/13] arc: Constify ioreadX() iomem argument (as in generic
 implementation)
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:Wl3I5GL8oTuHF4B8uEWhwYLx8r7xgnH4MKtioAfPmsSS/JrPJvU
 TG6HFiwedNhpJ6mUOPialIISyutXK5Oog/2XhTpT6MaFdcte+//iRG9NyuQ4EvkOr6NYUOc
 J/U6C4PJ9yfOSIlagB1J0hniPJ5IBQawFd6F2t/LJUu/jofOwL6F3R/nXWUi4BUreCwiRWa
 dSsT0RysLpw37gzjP3tQQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gODU33sDVPA=:/qq9hxY92f6xRXIe6UUSpT
 UJs5Y2vXH8WbG3KwflD/hI49fxCV+zNT+KJCf637LM9D6HT1vYyRB3fsns+siEnzXIPPY4nrv
 +8WisqYq0pl21yDZOR0kgNJ6UTQLE1kCsk9bhPYj+KpntYYdEUfpHWKTfgcJzOREfGYOzvSAP
 ZWujHMVhB9cyzMJ4oGgh/0/07jZzdtvJchVNvrs9HWQ8sd3TM58alJ9cO14M+WAUZJC8Ehjny
 Yol1XXcgXtZ/dTfbwaZ8qmdz79OC9PT3Tsvb9VlUWNaL14mSVNYaQePRz8JjbJdqvkwdJV4W4
 AcWeQFalRb/23mXnn74g1XXP5EZifpNJKXxrekTpDUl+D44d8yemxxoVVA7DtF+iuTtUUsRpf
 wVyoSRmMWMG7VvB+9Dt7TfeNOydXCuCSGQpRv+jitlu0rlE0BMatzPM6agKWGUtyYqM60ulPX
 fb0saQxiHbByuHKwkMsc+CBOklRl8sav2m6QGrrtNBC034tHiwZ7YuUhfUGekmnPRBRF5vZ1N
 buLsuvmFUvpRkZ7Pjj0kzPdZEHsHG9rcZSejOmzbfxlNTEvuAHWkSBOE3kVrtRj6C92V9zPr2
 jtxKkfyln5hu4WtkntnityEUcMueAA6r5YxaFXT2FIqf+u1NF9e/+FddSuagRsv6siDAKHsTO
 sHtbPEJBMKs80FYoXuLCrugfi20GB66c4bwjuPFsqnVW5SlsA7bpYZyzEua/+XOYcF9MMtRQd
 McvJC1tZGA+F2/9iCdV8DisnjiDkSA2ckpKXv6aQzhh43a54Dxz1xxKuHbIm0/Wlea6xe1OI+
 tMJjz0BuFTJA6RDVPDhdz2BTD35JLL4tPkzAgzzDU22xf+aUFm9mb81FTJWUDKc94YvqFsrp2
 LNb/n8abEIkT4v/ZisZg==
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
> Implementations of ioreadX() do not modify the memory under the
> address so they can be converted to a "const" version for const-safety
> and consistency among architectures.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

The patch looks correct, but I would not bother here, as it has no
effect on the compiler or its output.

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
