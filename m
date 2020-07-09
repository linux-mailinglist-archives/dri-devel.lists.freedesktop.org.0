Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEE921A3EA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 17:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024846EAAD;
	Thu,  9 Jul 2020 15:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 386 seconds by postgrey-1.36 at gabe;
 Thu, 09 Jul 2020 15:42:22 UTC
Received: from condef-03.nifty.com (condef-03.nifty.com [202.248.20.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF9E6EAB0
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 15:42:22 +0000 (UTC)
Received: from conssluserg-04.nifty.com ([10.126.8.83])by condef-03.nifty.com
 with ESMTP id 069FWHZk005029
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 00:32:17 +0900
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id 069FVmH9032492
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 00:31:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 069FVmH9032492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1594308708;
 bh=OtxKPGTO/pZbwYh7E0pVV6aQCW7rvgzMKyprc/l7uvw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Zm05RQOKC4UC9n7Xn1ZXjbCqDmkS1TdKFlXP6HiaUyy8+P271atINtnP5ZMkoKA/I
 dKdB8AqlMTXV/IhPEiGfkV+MbBtccqvbt2rPj+6JBq85vK2vd4wMCE6iyCDwG0yIQR
 BpRbrz6NawuDmo+bfDRGercgEe8Y8igi5wmYqOkK58b0JNw19pNRLoHsob8kyqESP5
 pxiIRDy6QyDHgtv8T0TKdzMO2ShaRs+ILfMw2UrYKqjSEwI63lKn49rsBUpa3Ki4gw
 znnyKl9VA4WZyZ6QdfOV7khrO36QOGxJNYmS0V49ktOjdNCICWDXkOUGT1TfqkSUs1
 wjwCRksM9ApSQ==
X-Nifty-SrcIP: [209.85.222.43]
Received: by mail-ua1-f43.google.com with SMTP id q15so853905uap.4
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 08:31:48 -0700 (PDT)
X-Gm-Message-State: AOAM530EwXsvhnLZaZrkEVmgTSS4A2CFhHiv45bqFGO5+k7OdcQ8olCV
 KSVcSvFxNnYppoeIzq7UO4BSvSM5KGlN6wbMSp0=
X-Google-Smtp-Source: ABdhPJxAnxTJNTtnQtFovYQkrUal1o80dMPa969JqVz6oQaG8jBDcy1jbc08IXGNVNtiEaHsg2cPflWUKNAmtElJid0=
X-Received: by 2002:ab0:71d3:: with SMTP id n19mr46109137uao.25.1594308707342; 
 Thu, 09 Jul 2020 08:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-11-rdunlap@infradead.org>
In-Reply-To: <20200707180414.10467-11-rdunlap@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 10 Jul 2020 00:31:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQB6DCw3CZyViCOWCZURfHQKm2JFx0Ypfhai9ecX6T9GQ@mail.gmail.com>
Message-ID: <CAK7LNAQB6DCw3CZyViCOWCZURfHQKm2JFx0Ypfhai9ecX6T9GQ@mail.gmail.com>
Subject: Re: [PATCH 10/20] Documentation: kbuild/kconfig-language: eliminate
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
Cc: kvm@vger.kernel.org, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, kgdb-bugreport@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Paul Cercueil <paul@crapouillou.net>,
 keyrings@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-i2c@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-leds@vger.kernel.org,
 linux-s390 <linux-s390@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-scsi <linux-scsi@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Matthew Wilcox <willy@infradead.org>,
 Halil Pasic <pasic@linux.ibm.com>,
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
 Dan Williams <dan.j.williams@intel.com>,
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

On Wed, Jul 8, 2020 at 3:06 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Drop the doubled word "the".
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Masahiro Yamada <masahiroy@kernel.org>



I guess this series will go in via the doc sub-system.

If so, please feel free to add:

Acked-by: Masahiro Yamada <masahiroy@kernel.org>






> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> ---
>  Documentation/kbuild/kconfig-language.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20200701.orig/Documentation/kbuild/kconfig-language.rst
> +++ linux-next-20200701/Documentation/kbuild/kconfig-language.rst
> @@ -681,7 +681,7 @@ translate Kconfig logic into boolean for
>  find dead code / features (always inactive), 114 dead features were found in
>  Linux using this methodology [1]_ (Section 8: Threats to validity).
>
> -Confirming this could prove useful as Kconfig stands as one of the the leading
> +Confirming this could prove useful as Kconfig stands as one of the leading
>  industrial variability modeling languages [1]_ [2]_. Its study would help
>  evaluate practical uses of such languages, their use was only theoretical
>  and real world requirements were not well understood. As it stands though



--
Best Regards
Masahiro Yamada
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
