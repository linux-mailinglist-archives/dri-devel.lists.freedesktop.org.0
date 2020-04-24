Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DC41B7FD9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1741A6EB28;
	Fri, 24 Apr 2020 20:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D646EAD9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 16:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1587747282;
 bh=VNIXbT3cRMcnX14jmZvaWa5tSFlwDuzaT0xQBAhqFZI=;
 h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
 b=fX8nQJU7aVavOHCaWdnInXT8xLqTxnAl3tgfbyYKS1OHY5ZvaeIv4jl/1H6sLAAnc
 p+FqRGb1D0YGZT5b1TGTxgOAGH47E1GJotj+1mYDUeGVaGNIhFFhHdQ2nbmpiSVrSa
 amdsF0klmbs5SVRECo53e46exX/lF7gNsm4xSsas=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.129.82]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lhvpu-1io29Q2Epm-00nBNg; Fri, 24
 Apr 2020 18:54:42 +0200
Subject: Re: [PATCH v3] console: newport_con: fix an issue about leak related
 system resources
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To: Dejin Zheng <zhengdejin5@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Message-ID: <20f37865-5af3-5fb9-8b8f-91f9464e4af3@web.de>
Date: Fri, 24 Apr 2020 18:54:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:m94uEAcQyHcJUYCep8wv3s6prX8/GBKobKj4HCa+ykucdKv0/2K
 ru7PFw+ZqtXmE8TfFFfaxzcBmgjF4hoL0U/Rz6Mn7zCk36I9ValfvdgTW98/9WRATzFAfMS
 gOIufYZcYgJ5Qb457FjYYcTE4ueaJpPDa++QONNIzxQjEFdwM9+Tx+T8Se3v+orWSEensXT
 GOismrBYlH0eHJS9Q4b9w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1VpdgVQe3x4=:VpBVENA9rn/3W7josS75DB
 LBzfcdRoLnDlERJyZFG22FkY3GmMGL06Whwvp3wS/HqGxKDsgBky3Tmb1rQWETvoPa0bTXcjy
 ThV7MvVHaEEJkWdoV5uEeHi2ikGENItQlpQbkCmNz+Ogyr20GyYxdZSdQTQzkA9kGdAV3YYM5
 9U5PYvsM742zG2BCSBK7a4veKo8yobI89MJGqP8dCEuNrd/TFZ1lXzr7ZX980O2rXyJkauMvV
 U51klt1Fgb4Qh7MzEN4yUGNOg8x16Gzta3NT9NJj+7UB96dmB5MxldAe40kJuce1jCcsMXyIf
 U67fnwyLhCiAzz+qIU+UqE2BZcOzAlDx0Jh1jCDOriYbX8moSRykg4o4aW2LsOfduFX0Kwqrr
 D5UyThK9NGAig3ODtJpAZBbpvFmKvlJnOEhdsI5drSLncesiEdqIpk5w2eBFarPSpBf01HOcW
 krMxeIjQLiUERvFHIkLIr/2L/xfUUf8lqXuZmfjZfDtNHpQVuP6JdM05TRPl0UUJvGhNVnAZQ
 VuLMV1CJ6grtkjhVUt7+7REa9rZFaH3BFRs8R/aiDM1SGkLo2OlxWQqyH336W8kpp6n4SqrQP
 rHrkWVuLR+t9rM9+PBboZ4905If5bwodQZAOhGWDCsDGDM/izkK5HAzvIL3IOFd1dR6hQFaAq
 DMGTByIM7jpDi82FGGkLMrB/Mf++p9CqNt0bGWTuUU4WaCFd33HXZbbkBjOP/54F1DnYk9mrt
 J17ES5qg9e2dJ/epof+aZFP1osT+oG4HGeIJTGUy2+ikArIAeW/8UTbU5REjkMet6MmgZ7YYk
 X1UbeuP2xTjAiXl+xC6Py/junhkGW3t3YU5szvNaSvnMCDQ4QitB2M8/sg7WigHvIUyPu32Sd
 IDI2+21VMItcB+MlRZrRmy1jXNhOvtSmdmF/g/WzFnjUBmdTlzT/niBUP/9ofB++c0MS+R0dC
 gGT4ZrArT0YdxCuizGUaapI+Kn4GpVRVK+IpaqKxvyhm5RSgie9GQm4lHbV3zJ3UND474b+B/
 HhVv14I41VDCW9R3XSbJJrrhSu0pOHrGaQFZeiQERSxAvULhaXMuYsZeTGBCoUrzQfl0stSyp
 RPqc+4S3GI3nHwUMenLm3m/aMp6MbR2yLkw3i2+8LriU5v4m8yksPt3Pu5211HeDRWMmlOZxP
 iWpdow7iFva4t1GWRWdptYaqxBEBWjC31GCvjzUXmHBh4bAI/JNiSg9jrLLOgygwk2C7TrE78
 DtNLgwvPbC8ow0CUC
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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
Cc: Andrew Morton <akpm@osdl.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> The corresponding system resources were not released then.

How do you think about a wording variant like the following?

   Subject:
   [PATCH v4] console: newport_con: Fix incomplete releasing of system resources

   Change description:
   * A call of the function do_take_over_console() can fail here.
     The corresponding system resources were not released then.
     Thus add a call of iounmap() and release_mem_region()
     together with the check of a failure predicate.

   * Add also a call of release_mem_region() for the completion
     of resource clean-up on device removal.


It can be nicer if all patch reviewers (including me) will be explicitly specified
as recipients for such messages, can't it?

Regards,
Markus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
