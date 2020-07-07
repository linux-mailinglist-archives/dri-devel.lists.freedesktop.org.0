Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3309B218073
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165D56E8A1;
	Wed,  8 Jul 2020 07:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F74A6E248
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 18:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1594146390; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQRrwbfO2C4Em9LcWxXzackWTr0tQ5tvZFSRH8pCMe0=;
 b=XzeBLZZpNrTe4Ra4qa9YkMqrcWIB6zuFg4aTH2C2kEQMTtyYB4q4KtKp/VYw3wfurq1Kn0
 L6vYSsxjiaskMjz36Jsy2DP+Y8oQPXQCS6J5S08kAw61Tz2Iuu7CBHExV7HzjcpUKs4626
 7D3ppRB7tG00QbsRFF8yeJYYsJftnrw=
Date: Tue, 07 Jul 2020 20:26:10 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 13/20] Documentation: mips/ingenic-tcu: eliminate
 duplicated word
To: Randy Dunlap <rdunlap@infradead.org>
Message-Id: <M734DQ.WGKQZ628NBB1@crapouillou.net>
In-Reply-To: <20200707180414.10467-14-rdunlap@infradead.org>
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-14-rdunlap@infradead.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Jul 2020 07:06:31 +0000
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
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
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
 Derek Kiernan <derek.kiernan@xilinx.com>, linux-mips@vger.kernel.org,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Wu Hao <hao.wu@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>,
 Hannes Reinecke <hare@suse.com>, linux-block@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-mm@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Jens Axboe <axboe@kernel.dk>, Michal Marek <michal.lkml@markovi.net>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Pierre Morel <pmorel@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, Jason Wessel <jason.wessel@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>,
 Dan Murphy <dmurphy@ti.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le mar. 7 juil. 2020 =E0 11:04, Randy Dunlap <rdunlap@infradead.org> a =

=E9crit :
> Drop the doubled word "to".
> =

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  Documentation/mips/ingenic-tcu.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> --- linux-next-20200701.orig/Documentation/mips/ingenic-tcu.rst
> +++ linux-next-20200701/Documentation/mips/ingenic-tcu.rst
> @@ -5,7 +5,7 @@ Ingenic JZ47xx SoCs Timer/Counter Unit h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =

>  The Timer/Counter Unit (TCU) in Ingenic JZ47xx SoCs is a =

> multi-function
> -hardware block. It features up to to eight channels, that can be =

> used as
> +hardware block. It features up to eight channels, that can be used as
>  counters, timers, or PWM.
> =

>  - JZ4725B, JZ4750, JZ4755 only have six TCU channels. The other SoCs =

> all


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
