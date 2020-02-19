Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA233164E56
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 20:04:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB9C6EC7C;
	Wed, 19 Feb 2020 19:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F8E6EC7C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 19:03:59 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 6so572408pgk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 11:03:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
 :references:in-reply-to;
 bh=DiJoVOfQs//1PaWZFtx2QcGxz7nAwr47TsQFS3rNJQE=;
 b=obOPZzdKumckIWGETvQYqaGO6MiKSIH0i5KbKI9YDtHLd+4BnYJkuR6v01JG4bcjtY
 jElwzC4SsRi4mVCKUUXx6M/BkOYQ0fLCG7RD0Za5aY1bIrZGH3os5T3cGvSCI6iHyfjD
 HgOU4hNJsStaeFfy8xDswaAVtAcZNBJG/E5GSiJQzuCYk8O32P39/WWIYtbEMUfzHnfJ
 xWTnU9ZlcgPWfzmEcUWWR7YcViRhElL4lxuWike5A/O2WRBhusA7+GTf8yFoDV7MHF+Q
 2etV+JufSkhklbfe40czfNfie+H6QtS+V/q5EXRqYApE2tXd89O/Q/JykADrOpejvLIt
 Bthw==
X-Gm-Message-State: APjAAAWw/6Gqawn6P/AITitdYY4DornHKMcwSJEzZEchHRe/5du5rfAj
 Re3B9hpDuQDfQi6rxNH1yQE=
X-Google-Smtp-Source: APXvYqx7/YKjuAjwK+VacNMDKFITTSWWqrTmLtv3O6oHG+s4MiEScrKPPtXEjw473ZTHkP0IX51N7Q==
X-Received: by 2002:a63:ec07:: with SMTP id j7mr28908332pgh.187.1582139038703; 
 Wed, 19 Feb 2020 11:03:58 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
 by smtp.gmail.com with ESMTPSA id p23sm428286pgn.92.2020.02.19.11.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 11:03:57 -0800 (PST)
Message-ID: <5e4d869d.1c69fb81.aa02.151b@mx.google.com>
Date: Wed, 19 Feb 2020 11:03:52 -0800
From: Paul Burton <paulburton@kernel.org>
To: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH v2 0/3] Improve MIPS Magnum support
References: <cover.1581030073.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1581030073.git.fthain@telegraphics.com.au>
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
Cc: linux-fbdev@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>,
 =?utf-8?q?Philippe_Math?= =?utf-8?q?ieu-Daud=C3=A9?= <f4bug@amsat.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0775271792=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0775271792==
Content-Type: text/plain

Hello,

Finn Thain wrote:
> A few minor patches are needed to more easily boot a MIPS Magnum build
> under QEMU. This series fixes a build failure in the g364fb driver and
> modifies jazz_defconfig for use with 'qemu-system-mips64el -M magnum'.
> 
> Note that QEMU's dp8393x implementation has bugs, one of which prevents
> the Linux jazzsonic driver from probing the chip. I have fixed the bugs
> that I know of in a series of patches at,
> https://github.com/fthain/qemu/commits/sonic
> 
> Changed since v1:
>  - Added reviewed-by and tested-by tags from Philippe Mathieu-Daudé.
>  - Rebased.
> 
> 
> Finn Thain (3):
>   fbdev/g364fb: Fix build failure
>   mips/jazz: Remove redundant settings and shrink jazz_defconfig
>   mips/jazz: Update jazz_defconfig for MIPS Magnum

Series applied to mips-next.

> fbdev/g364fb: Fix build failure
>   commit c584f9532115
>   https://git.kernel.org/mips/c/c584f9532115
>   
>   Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>   Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>   Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>   Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>   Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> mips/jazz: Remove redundant settings and shrink jazz_defconfig
>   commit a7047b8dd098
>   https://git.kernel.org/mips/c/a7047b8dd098
>   
>   Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>   Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> mips/jazz: Update jazz_defconfig for MIPS Magnum
>   commit 91f40e896444
>   https://git.kernel.org/mips/c/91f40e896444
>   
>   Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>   Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>   Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]

--===============0775271792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0775271792==--
