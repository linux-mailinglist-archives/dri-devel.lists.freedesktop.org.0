Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 902874BC24
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 16:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82E46E41B;
	Wed, 19 Jun 2019 14:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689A06E3B4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 12:50:44 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d18so3285528wrs.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 05:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Xtb4b1kSnmdV6z5RW+KhyWhbk8J0VV+tx8yXGWcbZHU=;
 b=SGXHMYMGYYUIRmUEaHv1mNvk5WdSwKilKOP7/8KG7SxA6CVDpMH1nuCdleixi4lfD+
 T2AX3sRdfyR7YsBDgExkB5pfOlG79aHhN1X3JxYIoOmuQVEMnavnVkHUvvU/RL5D/sGn
 v7+FFlQ8Ys0xwxv4WRwrcgWGojoZOBELsgO0dB8kD9GMoH8pZvti6UrUqlIlR5AR33gX
 5damBGohNQcEs+savTXBJHq955MNCptO8tOBAvmxYrqGcDSY5yqEY3vqfRHZPoTRoGzs
 0WOS6CxxdjxmzJXoJpNc/A/zkmc2Xqea+XtWU+bzDyXSbOHCyDPftl0oaSbSRh8ifKcG
 Vyww==
X-Gm-Message-State: APjAAAWpEOjbICTNNxuLfGdJu70I/Fwos9BDPSfOz2Zy3TnCNat4A+RF
 gRbsa/g3Nmf4Zm7ThxOzFlV/mQ==
X-Google-Smtp-Source: APXvYqwrwhHdCyqZaSphz++F46CL3btA19KM3IT0OW+E8P4zQsLmtEh4sw1cdFoR2IThHvbCs9vwSA==
X-Received: by 2002:a5d:40ca:: with SMTP id b10mr26804056wrq.171.1560948642938; 
 Wed, 19 Jun 2019 05:50:42 -0700 (PDT)
Received: from andrea (86.100.broadband17.iol.cz. [109.80.100.86])
 by smtp.gmail.com with ESMTPSA id 32sm36970395wra.35.2019.06.19.05.50.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jun 2019 05:50:41 -0700 (PDT)
Date: Wed, 19 Jun 2019 14:50:34 +0200
From: Andrea Parri <andrea.parri@amarulasolutions.com>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v1 12/22] docs: driver-api: add .rst files from the main
 dir
Message-ID: <20190619125034.GA8909@andrea>
References: <cover.1560890771.git.mchehab+samsung@kernel.org>
 <b0d24e805d5368719cc64e8104d64ee9b5b89dd0.1560890772.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b0d24e805d5368719cc64e8104d64ee9b5b89dd0.1560890772.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Wed, 19 Jun 2019 14:58:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Xtb4b1kSnmdV6z5RW+KhyWhbk8J0VV+tx8yXGWcbZHU=;
 b=dW6rwWu/BxDcyY37Sf4zZHhk/BxlkdwN5gN343V7zBSAZ0SXuKFyO6NPG58mQ5ktr7
 PN+pIt0Tf0P/O3MDbO5prUrx8y576kfXAtnvM1ptZXz6JvVYc9biiGzrxZO4uaaDBgpE
 KAE0I5m0k/ivEF/VdemPUpTQTc+0vGOjxKUGU=
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
Cc: kernel-hardening@lists.openwall.com, Farhan Ali <alifm@linux.ibm.com>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Evgeniy Polyakov <zbr@ioremap.net>,
 linux-arch@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, Alan Stern <stern@rowland.harvard.edu>,
 Jiri Slaby <jslaby@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Ohad Ben-Cohen <ohad@wizery.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fbdev@vger.kernel.org,
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
 Mauro Carvalho Chehab <mchehab@infradead.org>, linaro-mm-sig@lists.linaro.org,
 linux-gpio@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel@lists.infradead.org, Johannes Thumshirn <morbidrsa@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, linux-pci@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 platform-driver-x86@vger.kernel.org,
 "Paul E. McKenney" <paulmck@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Emese Revfy <re.emese@gmail.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Darren Hart <dvhart@infradead.org>, Jade Alglave <j.alglave@ucl.ac.uk>,
 linux-pwm@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Luc Maranget <luc.maranget@inria.fr>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Rodolfo Giometti <giometti@enneenne.com>, Harry Wei <harryxiyou@gmail.com>,
 Stuart Hayes <stuart.w.hayes@gmail.com>, Logan Gunthorpe <logang@deltatee.com>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-remoteproc@vger.kernel.org,
 Jerry Hoemann <jerry.hoemann@hpe.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Ingo Molnar <mingo@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, netdev@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>,
 openipmi-developer@lists.sourceforge.net, Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAgcmVuYW1lIERvY3VtZW50YXRpb24veyA9PiBkcml2ZXItYXBpfS9hdG9taWNfYml0b3BzLnJz
dCAoOTklKQoKU2FtZSBoZXJlOiBOQUssIHRoaXMgZG9jdW1lbnQgZG9lcyBub3QgYmVsb25nIHRv
IGRyaXZlci1hcGkuCgpJIGFsc28gcmVhbGl6ZSB0aGF0LCBkZXNwaXRlIHByZXZpb3VzIG5vdGlj
ZXMsIHlvdSBrZWVwIHRvdWNoaW5nCmRvY3VtZW50YXRpb24gd2l0aG91dCBldmVuIENDLWluZyB0
aGUgcGVvcGxlIHdobyBjYXJlLi4uCgogIEFuZHJlYQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
