Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A2F4B4A1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 11:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1EE6E320;
	Wed, 19 Jun 2019 09:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763E06E320
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 09:06:10 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id d17so18548695oth.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 02:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u3kWunp1yg8qsBlz075d3zHcl3e5zCJuL+usdOTYmOc=;
 b=AOI8ckKVRfDBkd3M0T+6KR9oLhQzU5KHlEwwhgoJqA7O8V7iBadMFUebUJYLFTdNu4
 uJLxVpGzrXOuYmhY3pFh+hB5+UBh1U4HrgkNNZRBPrE0CHRE1UUQd3bwqaygr31sgOSI
 I/xXwV8PtYUBYBJuharfA+xj+t1CLc61H559JyY3H9J5NmrR0Ay6s7YNh6+wnHY6awlJ
 Rw23ZWrPvyzYNxgVEamkkg1a25BYgztpRlyXoEEq0NkNwVtPvbi5tRqlSy1Ou5XvHeAl
 OIf+SHtZf5dLssLQLi3c8kD+FbSGL+miLzNnmuc/5zfthZT0039dtX38Fb/eyiCN/uC2
 zP4g==
X-Gm-Message-State: APjAAAVUkUApOf550dX2uJ35GN3tZpOjp0hyAwsUpx7IhP5qArYV6ib+
 RdP9lHgHdF6Tie8Zx+3kYKSv3CI79WT+WWDbvhOjwA==
X-Google-Smtp-Source: APXvYqzG/v8GSMVQIarAoClCL4IFuEHrrKyRFYYJXnbvihoMS3DzXDAwuocRw/1b+9yFPJR2Hoa9o9P/lmOprXYAeyI=
X-Received: by 2002:a9d:4b95:: with SMTP id k21mr21462009otf.281.1560935169757; 
 Wed, 19 Jun 2019 02:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560890771.git.mchehab+samsung@kernel.org>
 <b0d24e805d5368719cc64e8104d64ee9b5b89dd0.1560890772.git.mchehab+samsung@kernel.org>
In-Reply-To: <b0d24e805d5368719cc64e8104d64ee9b5b89dd0.1560890772.git.mchehab+samsung@kernel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 19 Jun 2019 11:05:57 +0200
Message-ID: <CAKMK7uGM1aZz9yg1kYM8w2gw_cS6Eaynmar-uVurXjK5t6WouQ@mail.gmail.com>
Subject: Re: [PATCH v1 12/22] docs: driver-api: add .rst files from the main
 dir
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=u3kWunp1yg8qsBlz075d3zHcl3e5zCJuL+usdOTYmOc=;
 b=gnP9HHMGYKwK9IsnAHwypqrW+QHPyyxL5VsMOQFqOBt9sxJJN5Q28pik6LLPgli2C3
 8U4+LuFuA2pG4azWksKAC4dzSQH2hr74fm1ub0T1PmruwOzmCDKQaqlsvoLqIxDcuIwv
 c4hN54DM8GwFFMGvP3sPTRofnN8sE6FGqYkHE=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Kernel Hardening <kernel-hardening@lists.openwall.com>,
 Farhan Ali <alifm@linux.ibm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jaroslav Kysela <perex@perex.cz>,
 Evgeniy Polyakov <zbr@ioremap.net>,
 "open list:GENERIC INCLUDE/A..." <linux-arch@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Alan Stern <stern@rowland.harvard.edu>, Jiri Slaby <jslaby@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Ohad Ben-Cohen <ohad@wizery.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Boqun Feng <boqun.feng@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-crypto@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-s390@vger.kernel.org, Alex Shi <alex.shi@linux.alibaba.com>,
 Corey Minyard <minyard@acm.org>, "David S. Miller" <davem@davemloft.net>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Daniel Lustig <dlustig@nvidia.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Eric Farman <farman@linux.ibm.com>, linux-watchdog@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 linux-gpio <linux-gpio@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Johannes Thumshirn <morbidrsa@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Andrea Parri <andrea.parri@amarulasolutions.com>,
 Linux PCI <linux-pci@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 platform-driver-x86@vger.kernel.org,
 "Paul E. McKenney" <paulmck@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Emese Revfy <re.emese@gmail.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Darren Hart <dvhart@infradead.org>, Jade Alglave <j.alglave@ucl.ac.uk>,
 linux-pwm <linux-pwm@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Luc Maranget <luc.maranget@inria.fr>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Rodolfo Giometti <giometti@enneenne.com>, Harry Wei <harryxiyou@gmail.com>,
 Stuart Hayes <stuart.w.hayes@gmail.com>, Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-remoteproc@vger.kernel.org,
 Jerry Hoemann <jerry.hoemann@hpe.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Howells <dhowells@redhat.com>, Linux MM <linux-mm@kvack.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Ingo Molnar <mingo@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, netdev <netdev@vger.kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 openipmi-developer@lists.sourceforge.net, Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMTA6NTUgUE0gTWF1cm8gQ2FydmFsaG8gQ2hlaGFiCjxt
Y2hlaGFiK3NhbXN1bmdAa2VybmVsLm9yZz4gd3JvdGU6Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZ3B1L2RybS1tbS5yc3QgYi9Eb2N1bWVudGF0aW9uL2dwdS9kcm0tbW0ucnN0Cj4gaW5k
ZXggZmEzMGRmY2ZjM2M4Li5iMGY5NDhkODczM2IgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9ncHUvZHJtLW1tLnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZ3B1L2RybS1tbS5yc3QKPiBA
QCAtMzIwLDcgKzMyMCw3IEBAIHN0cnVjdCA6Yzp0eXBlOmBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25z
IDxmaWxlX29wZXJhdGlvbnM+YCBnZXRfdW5tYXBwZWRfYXJlYQo+ICBmaWVsZCB3aXRoIGEgcG9p
bnRlciBvbiA6YzpmdW5jOmBkcm1fZ2VtX2NtYV9nZXRfdW5tYXBwZWRfYXJlYWAuCj4KPiAgTW9y
ZSBkZXRhaWxlZCBpbmZvcm1hdGlvbiBhYm91dCBnZXRfdW5tYXBwZWRfYXJlYSBjYW4gYmUgZm91
bmQgaW4KPiAtRG9jdW1lbnRhdGlvbi9ub21tdS1tbWFwLnJzdAo+ICtEb2N1bWVudGF0aW9uL2Ry
aXZlci1hcGkvbm9tbXUtbW1hcC5yc3QKClJhbmRvbSBkcml2ZS1ieSBjb21tZW50OiBDb3VsZCB3
ZSBjb252ZXJ0IHRoZXNlIGludG8gaHlwZXJsaW5rcyB3aXRoaW4Kc3BoaW54IHNvbWVob3csIHdp
dGhvdXQgbWFraW5nIHRoZW0gbGVzcyB1c2VmdWwgYXMgcmF3IGZpbGUgcmVmZXJlbmNlcwood2l0
aCB2aW0gSSBjYW4ganVzdCB0eXBlICdnZicgYW5kIGl0IHdvcmtzLCBlbWFjcyBwcm9iYWJseSB0
aGUgc2FtZSkuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwu
Y2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
