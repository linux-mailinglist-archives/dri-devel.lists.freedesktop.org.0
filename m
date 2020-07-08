Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C482188A9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 15:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3600789CBA;
	Wed,  8 Jul 2020 13:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96CC89CBA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 13:14:29 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id j18so3050884wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 06:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=l8TXsMU8pcx7Tss0R/XmiW2rwe2Hix1sm/QIevQOb2M=;
 b=A1ZIjk7YGe2YSEoQCSRgqjmHR7oxja8buIPLjIhRTjdJVpAt9lG0gE7SFtVGHQLadT
 xVpcPloGsK2WSxEeeICvTCCQ1YYB1VSfUPjrX131Kkrf1ua0TB8eUFoz6BcB/ltMdxle
 g0CUQEDldKrVRBTAatDkSdjEu36OQGD68toOzC25aprt3rfyUr9rqTVrTmbAXsTUgf77
 9cR8rDocIEreQ2XYDW7IWJeD90ce47cu6PI8ZsNUWN9GnPzAGJerkmwY1TNG1BH5v+ah
 Y+0oSh28JHhB1q0lkYDfWGe+5f8BNO5h4B8RbndZgEm96Q69dP3WLG/nFIdlxkVQzXH+
 HYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l8TXsMU8pcx7Tss0R/XmiW2rwe2Hix1sm/QIevQOb2M=;
 b=XgP+pv/jxWIqhZzmjqrtqZV2orfNyWLYyDU9xiw7ULKGON/RmwJvYqciENa8uWyfh2
 Obs0b5StNy4lUEvuIoBECTVFxH2cV7XiGa/h5R/NTYt10iLqE9uymCaMWCoOBKf3Kx4Y
 ZA6aDj3tQPCIfarbyVIdIP5BGrlN3I3NS22UHdBARCS2bbtMAFZCtZTBSXhokZ6BmhvR
 ytEZ7OzMsX5I/wXUQ6kQFLIJjYgV0e0ZTqukAkjXMMjZ5SvfR9o2kw52kkwQW3uZB832
 BcDFGd8X9CIWqMXvbBLWz7ffSEC56N2TcK7g7Wv6dG++LmFTJMAExQnfmxl/xNI7s1Pa
 GShA==
X-Gm-Message-State: AOAM5331EOmRYfncr8dO3EaYmzjxJ2ul5OhsJpkkYZLCKU3iHWUtH6ZG
 Vcs2D7ZUDKacaAWAmDy26hl7Rg==
X-Google-Smtp-Source: ABdhPJwq0Oc6xY1jGe2yyxLQ3zEuUYKf/Jmuh4JKlNT9KiWq8rLJ6802Y6Ay8mTXZNr5ogQ7BAfKOg==
X-Received: by 2002:a7b:ce87:: with SMTP id q7mr9822665wmj.39.1594214068610;
 Wed, 08 Jul 2020 06:14:28 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id n16sm5779824wra.19.2020.07.08.06.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 06:14:27 -0700 (PDT)
Date: Wed, 8 Jul 2020 14:14:25 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 04/20] Documentation: kgdb: eliminate duplicated word
Message-ID: <20200708131425.iesuqtfklrsn3kam@holly.lan>
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-5-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707180414.10467-5-rdunlap@infradead.org>
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
 Paul Cercueil <paul@crapouillou.net>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, Hannes Reinecke <hare@suse.com>,
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
 linux-block@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 07, 2020 at 11:03:58AM -0700, Randy Dunlap wrote:
> Drop the doubled word "driver".
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: kgdb-bugreport@lists.sourceforge.net

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
