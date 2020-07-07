Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B730217673
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 20:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4618A89CF4;
	Tue,  7 Jul 2020 18:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4FB89CF4
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 18:19:05 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id lx13so28962380ejb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 11:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IJcF3lAERNl2pHWGp39A9gwQbaEBKJzdpdY4Z29brno=;
 b=GtYcI34psfamNnVZB54EG+w1stxgeDLcIFiZaiUbR3trVD0lb2aYCNtXamoiJnBwny
 ythvCZsScIhskjQWMpoOh6ln/SwwcT/25kxyMFYQhWpC/rbTe/rrmyfSZLG/cuvsxnqa
 l7MA9Xw7s15QuDh1+Ak8iN66kQHRHsaM338N3pJNQ5oTuLMt83pouJw8vSOKh7ACtsYG
 Vnp8Z7N+H1jOCVpuFx5aa1ln4a2c3CUpVW1grf23B4jd719fP/7YFBdeotJEtj0VCWc2
 bpwjzv49FPEEfKnY9vtw0lDE7jzevmJbQL6im7meQiahBIfu4NZGoL5br4zYm9nbUAv7
 iRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IJcF3lAERNl2pHWGp39A9gwQbaEBKJzdpdY4Z29brno=;
 b=BZKa1z8O2vNg50r3pqC2722ypgE15Esg970EzY6nCugniI4m0lpTf3xv+dUTJrR+nG
 pCkT+Q8WMOVbn5BIz6MS5324/FyHTGD2Cze1NCIHanP24tKN0YlFVvmUqLlyhsDJ/PJ2
 xJjFAJgzdnW5TQzBoq6kNyBErtOU7ttxqiJ+vM+95qF01vydQTjItJTiRlsQSs7Wzmmc
 rohWWgZdvPNHHPq1NnYgC/kixJrEI+Jbd1InjPDELMagUxBTi30rBC0n+/YXJvdn8BE8
 iC/PHnGiGdpWLMtCmIrXrpdWlQzSfd8N6V+o85O6RyBAK1ni2q4aBv28+dBkebZaEMYB
 jqQg==
X-Gm-Message-State: AOAM530GWyFNxUjP4nRZTVWTQywUM6ATAsMXUB6IWaE+h64Ts9dbpFwm
 DlMnYrX72h6QAi2MzbIq9yJghrXzR/hNEEoil4f/HQ==
X-Google-Smtp-Source: ABdhPJz/k1Lj7S8JXbw1qDGIHYzWAWL1RIZUAULeU0yGbiOgcHknNP96xoeVJ3D+eLW4C9y+LJcZZrAh7dTGJVMuYfE=
X-Received: by 2002:a17:907:20af:: with SMTP id
 pw15mr50524338ejb.204.1594145943817; 
 Tue, 07 Jul 2020 11:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-13-rdunlap@infradead.org>
In-Reply-To: <20200707180414.10467-13-rdunlap@infradead.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 7 Jul 2020 11:18:52 -0700
Message-ID: <CAPcyv4hsu57988v7bZq9udTTan72NYDw8TrF46LC7bT_cqex2Q@mail.gmail.com>
Subject: Re: [PATCH 12/20] Documentation: maintainer-entry-profile: eliminate
 duplicated word
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
Cc: KVM list <kvm@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, kgdb-bugreport@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Paul Cercueil <paul@crapouillou.net>,
 "open list:KEYS-TRUSTED" <keyrings@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-leds@vger.kernel.org,
 linux-s390 <linux-s390@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-scsi <linux-scsi@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Halil Pasic <pasic@linux.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Wang <james.qian.wang@arm.com>, linux-input@vger.kernel.org,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>, linux-mips@vger.kernel.org,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Wu Hao <hao.wu@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>,
 Hannes Reinecke <hare@suse.com>, linux-block@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-mm@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Jens Axboe <axboe@kernel.dk>, Michal Marek <michal.lkml@markovi.net>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, Jason Wessel <jason.wessel@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linux-integrity@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>,
 Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 7, 2020 at 11:07 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Drop the doubled word "have".
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Dan Williams <dan.j.williams@intel.com>
> ---
>  Documentation/maintainer/maintainer-entry-profile.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20200701.orig/Documentation/maintainer/maintainer-entry-profile.rst
> +++ linux-next-20200701/Documentation/maintainer/maintainer-entry-profile.rst
> @@ -31,7 +31,7 @@ Example questions to consider:
>  - What branch should contributors submit against?
>  - Links to any other Maintainer Entry Profiles? For example a
>    device-driver may point to an entry for its parent subsystem. This makes
> -  the contributor aware of obligations a maintainer may have have for
> +  the contributor aware of obligations a maintainer may have for
>    other maintainers in the submission chain.

Acked-by Dan Williams <dan.j.williams@intel.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
