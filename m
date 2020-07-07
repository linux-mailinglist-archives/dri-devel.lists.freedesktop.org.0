Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB60217685
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 20:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B4B6E1BD;
	Tue,  7 Jul 2020 18:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87A06E1BD
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 18:21:18 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id t18so16920866ilh.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 11:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oM1DHY6yXzcZ+72qIs7pzRLVNbxrBF/RvTQpZ6AZWzE=;
 b=PhkRMCL0cOBM87z2xbKJgL3CzSg3isYeGP+IA1EMLxsIahQd9L+L+LwGrIZc7PupVR
 a64FI53GElPSGAoW7S4KRbWMtj7ZzQU/d6kavHWjiCkTTGRsPczF/Nc5eMops5qwua9F
 jGZbXWfjJB1ippmdWlpUMxsElo+5ounp092ew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oM1DHY6yXzcZ+72qIs7pzRLVNbxrBF/RvTQpZ6AZWzE=;
 b=Zt3WuN94PD16HRupPoBOC8DgrMfzx6J34mCc/Xv5KI88IdOXhH75b3EqPK1zXmhBeB
 SFpltSX4tVAHZLjacd7AlrTtEFiVrSmnCxbIDvjLTH9IKrCplCyezzSmprlIwMWazsD1
 wX9scG1qCzpsCBlqVSxrSV7NiMn7iG8OwyzvNRuHBzGSZ1kHj3K1VBQa6bPIKfCEeVdx
 Q3BcSD6vygb2tUuWtxCUZBVZ9IV2qsecI60sH9iNtn/4lKx9XTFAmW3YOQEsg90nLjrj
 CK5KorLP6A4nztpEnGwTlE6ii1nhs8bHGZgV85pCsvS86/OKmQ6xtY6aW+PghsO8VnEV
 JTgQ==
X-Gm-Message-State: AOAM531Nc8/p3wBtNzCNeUdoL67vZ0/8hY6jYf3zZ9LfTAb9UHnSOnQi
 5PjzotK64nmUT89LGMtWeoxFjSeylus=
X-Google-Smtp-Source: ABdhPJwAgt+hIE4FR/d54Juec/DoXdFAKmS9SljBRulLZqIqBX/vmxvESrEfU6Zmk4I+Rt9ZGcP7Tw==
X-Received: by 2002:a05:6e02:5c4:: with SMTP id
 l4mr37145916ils.209.1594146073910; 
 Tue, 07 Jul 2020 11:21:13 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com.
 [209.85.166.44])
 by smtp.gmail.com with ESMTPSA id g1sm13040529ilk.51.2020.07.07.11.21.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2020 11:21:13 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id q8so44228834iow.7
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 11:21:12 -0700 (PDT)
X-Received: by 2002:a5e:a60d:: with SMTP id q13mr32158974ioi.199.1594146071871; 
 Tue, 07 Jul 2020 11:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-5-rdunlap@infradead.org>
In-Reply-To: <20200707180414.10467-5-rdunlap@infradead.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 Jul 2020 11:21:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UkyZcjziOXSYkcPOdkLBJCfxrVAHUq0SfybXXJ3pQxRg@mail.gmail.com>
Message-ID: <CAD=FV=UkyZcjziOXSYkcPOdkLBJCfxrVAHUq0SfybXXJ3pQxRg@mail.gmail.com>
Subject: Re: [PATCH 04/20] Documentation: kgdb: eliminate duplicated word
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, kgdb-bugreport@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-mips <linux-mips@vger.kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 keyrings@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-i2c@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-scsi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Halil Pasic <pasic@linux.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Wang <james.qian.wang@arm.com>, linux-input@vger.kernel.org,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Wu Hao <hao.wu@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>,
 Hannes Reinecke <hare@suse.com>, linux-block <linux-block@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-mm@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Jens Axboe <axboe@kernel.dk>, Michal Marek <michal.lkml@markovi.net>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Pierre Morel <pmorel@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, Jason Wessel <jason.wessel@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linux-integrity@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>,
 Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jul 7, 2020 at 11:05 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Drop the doubled word "driver".
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: kgdb-bugreport@lists.sourceforge.net
> ---
>  Documentation/dev-tools/kgdb.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
