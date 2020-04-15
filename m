Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 681B81AA8FD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 15:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7AB6E591;
	Wed, 15 Apr 2020 13:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07A36E591
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 13:47:59 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id e5so4891600edq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 06:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mIOZ/sd96Rx46ThWOAXmWIaAK4iqfwYtds7TxEtsnA0=;
 b=GICxzsJunNjHqcI/36BYIBi1/ccEJhg1uNBamWHYeNaVUPtYinI7HrBKF0sCwrkz8H
 /fTM/5r/D4QCEe4FbMkS6cmykxoWkg1rh/w8ECktcu/e2Xq61NbY8sEhV+v91fhiISU+
 3MJgcf2p86FBFPO8pYKMaQeY6BdslLS1IzWuwkqP3Sj/0kCVa9bunJdVd5hH3+gSUQFl
 E26+Jwjskm613NJuZJDkEa3IHz7ZPxSxBu7fjU4XQ6NsLiGBOzkyzAKDpnmdrVUEVy3f
 xDmGptmRQhy2s0z9Un8+Su2mXPmaKyxw39rZt0yE7ZJ2WzRv6aBZTK846LkmIwJTH13z
 Q8uw==
X-Gm-Message-State: AGi0PuaIaTnIbzvvR0ZskylRagKQz5nLARBZbyZcQk69TpntYsHlkWtt
 0tTA5K9QI5pBH4IcZSrpfD8=
X-Google-Smtp-Source: APiQypL993rtIwMeMfH5wHZyMs+H8Y65XYCjw99y7Fo0rlwZe8pf8YowOuo4m22Vp9YytQslngDtFA==
X-Received: by 2002:aa7:c2c3:: with SMTP id m3mr18170324edp.10.1586958478322; 
 Wed, 15 Apr 2020 06:47:58 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
 by smtp.googlemail.com with ESMTPSA id gf12sm2524950ejb.62.2020.04.15.06.47.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 Apr 2020 06:47:57 -0700 (PDT)
Date: Wed, 15 Apr 2020 15:47:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v6 07/12] ARM: DTS: omap5: add sgx gpu child node
Message-ID: <20200415134754.GB21120@kozik-lap>
References: <cover.1586939718.git.hns@goldelico.com>
 <004611c9660943759b635a87484932869927cf74.1586939718.git.hns@goldelico.com>
 <CAJKOXPdEkWniffmGZmf=S6E5UxWTdVGXnycqTFftXwo_45rz3w@mail.gmail.com>
 <EFA7F2F0-96EA-45D9-B8C8-00DC8C72344D@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <EFA7F2F0-96EA-45D9-B8C8-00DC8C72344D@goldelico.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-omap@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, letux-kernel@openphoenux.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, openpvrsgx-devgroup@letux.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, kernel@pyra-handheld.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 01:46:06PM +0200, H. Nikolaus Schaller wrote:
> Hi Krzysztof,
> 
> > Am 15.04.2020 um 13:38 schrieb Krzysztof Kozlowski <krzk@kernel.org>:
> > 
> > On Wed, 15 Apr 2020 at 10:36, H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >> 
> >> and add interrupt.
> >> 
> >> Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # Pyra-Handheld.
> > 
> > Don't add your own Tested-by tags. These are implied by authorship,
> > otherwise all patches people make should have such tag.
> 
> Ok I see. AFAIR it originates in several phases of editing to report on which device it was tested.
> 
> Is there a canonical way of writing "tested-on: ${HARDWARE}"?
> 
> E.g. would this be ok?
> 
> Signed-off: H. Nikolaus Schaller <hns@goldelico.com> # tested on Pyra-Handheld

If you think tested platform is worth mentioning in the commit msg
(it will stay there forever, ever, ever) then just add a line like:

"Add SGX GPU node. Tested on Pyra-Handheld."

From time to time we add such information to note that only one platform
was actually tested.  I am not sure what benefit it brings to most
cases... but your commit msg is so short that adding one more sentence
seems reasonable. :)

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
