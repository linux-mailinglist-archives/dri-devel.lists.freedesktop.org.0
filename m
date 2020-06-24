Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D15207409
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 15:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9046E0BC;
	Wed, 24 Jun 2020 13:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51546EB39
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 13:12:59 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200624131258euoutp014ca80dbee962277384f8070a72938617~bfQqtm1tf0428304283euoutp01-
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 13:12:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200624131258euoutp014ca80dbee962277384f8070a72938617~bfQqtm1tf0428304283euoutp01-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593004378;
 bh=y3U3Roh4wtM015Hhvwh1SxdfYjN0DfIAfBQvm4ZhhAs=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=A/MsUxfEr4VeT/BQMpGsGrhDK1xOSTZuIogWzuKIShaJwAkjDdekbtnS7KNBNwRjo
 4Ls4bLqXrRZtvL0lThN1Ud7nT1oH1NpgNyqq4hlUBRLnEVJf1HDwnRCqlmPiSExnen
 CJAGDIPxn757X00m3ht3dEYP0nQ2I2xzLrFoxvPc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200624131257eucas1p1906930dbe495bb181294a73d7c1240ec~bfQqXnmF_0191901919eucas1p1F;
 Wed, 24 Jun 2020 13:12:57 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 0B.09.06318.95153FE5; Wed, 24
 Jun 2020 14:12:57 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200624131257eucas1p2475b00b53ea2cd0c5320ead2235d7a57~bfQp9TFjt2736227362eucas1p2Y;
 Wed, 24 Jun 2020 13:12:57 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200624131257eusmtrp2ced7c8555a4c4e095ad495582b33025f~bfQp8hPnJ2228022280eusmtrp2T;
 Wed, 24 Jun 2020 13:12:57 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-4e-5ef35159d8ca
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 83.41.06017.95153FE5; Wed, 24
 Jun 2020 14:12:57 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200624131256eusmtip22bb7c84c92bec2b591b43fc10bf7425b~bfQpDKhvo2118321183eusmtip2s;
 Wed, 24 Jun 2020 13:12:56 +0000 (GMT)
Subject: Re: [RESEND PATCH v5 3/5] drivers core: allow probe_err accept
 integer and pointer types
To: Andy Shevchenko <andy.shevchenko@gmail.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <bbc5ad3e-0e0a-83e1-ed64-e5275b605174@samsung.com>
Date: Wed, 24 Jun 2020 15:12:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CAHp75Vf5ANVRb8ghzdWa1F5U3JaRv9J2mVF8AQ+WwBahQM9Y5A@mail.gmail.com>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA02SWUwTURSGvZ3pzNC0OBa0J2g0NtEEDeD2MHEhbtGJUWPjg1FjseAEiS1g
 Cwhq0Agqi2DRVKWIiIIsEdmXYhRbFUSsglBEhFSjJoBio5TgBsowGHn7zvaf/9xcCpP3iX2o
 sPAoTh+u0SoJCV7T+OOF327VkHpJS4KS6Tc+REz5lVIxY3r3gWA6hl0Ek3CzlGAcI/0Y0/zZ
 gTPJGXkkU/G+U8y0118lGJvpHmJKHvWSjC19L5PtNmFrPdn2zjaMdXWdJlmLuZdks5IyxWxF
 cTLBPjG+FLEN2bdJ1pnaJGIr806w6VXFiH2QdhFnhyrm7pDukaw+wGnDYjh9QOB+yUHnW7/I
 b5LY7Nxu8iTKoVIQRQG9AtxFO1OQByWnCxG8qfNPQZJxdiPoyS0SC8EQguTHJQTfxQ80nMmY
 LBQgGBkewYXAheDaHyfiZb3oELCkLUtBJOVNB0BDDN+B0Qli+J3fIeZ1CNoXRitfE3y3jA4E
 YyrFp3F6AdzKf0HyPJPeB+ecAxjPMnoGNGd+wHn2oFXQ8/H8BGP0PKgdvIoJrIBTbsEz0CYK
 Pg08m/S8Ea6l5ooE9oKBpipS4Dnwx5IzmT8BzsJETBhOQlBdZsGEwiroef5zwig2brq0PkB4
 uHVgsW4R0BO6BmcIFjzhQs1lTEjLIOmMXNCYD0579aSeAvJbhwkjUpqnHGaecox5yjHm/2uv
 I7wYKbhogy6UMywP5474GzQ6Q3R4qH9IhK4Cjf+/lrGm4Tp0/3ewDdEUUkplZW+/quViTYwh
 TmdDQGFKb9l6e4taLjugiTvK6SOC9NFazmBDsylcqZAtv9G/T06HaqK4QxwXyen/VUWUh89J
 tHP7WatUdT/Q5L2rvnmlzn3snSmuIWdJ1sDdr/bpO1LnOAv6+6yBqujO2g05EduC8+j0KMWa
 7wtw6xt12yyj77R4nTTDHuRCrbFhHZscdkedVFQw5jh86VXivKJbXPnTzMat57ziYy/+GtSW
 JHX3qpI9qr9pFh7v2rz4+p3RrC8mJW44qFm6CNMbNH8BiT5GYHsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHIsWRmVeSWpSXmKPExsVy+t/xe7qRgZ/jDHbcZ7N4OeEwo8XGGetZ
 LaY+fMJmceXrezaL5sXr2Syufn/JbHHyzVUWi86JS9gtNj2+xmpxedccNotDU/cyWqw9cpfd
 4lBftMXcL1OZHfg8Ll+7yOzx/kYru8fOWXfZPWZ3zGT12LSqk83jxIRLTB77565h97jffZzJ
 Y/OSeo++LasYPQ70Tmbx+LxJLoAnSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbK
 yFRJ384mJTUnsyy1SN8uQS/j/gPdgk9cFXMX3mJvYJzP0cXIySEhYCKxv20iaxcjF4eQwFJG
 icPLTrFDJMQlds9/ywxhC0v8udbFBlH0llHiZ/t0IIeDQ1ggWWJnr1EXIzuHiIC+xP4ykApm
 gXZWiTcH1jNDlDcwSZzb3cgEModNQFPi7+abYK28AnYSE7rBbmARUJVYtvQ82FpRgViJ7sU/
 wGxeAUGJkzOfsIDYnAKBEnee9oPZzAJmEvM2P2SGsOUltr+dA2WLSzR9Wck6gVFoFpL2WUha
 ZiFpmYWkZQEjyypGkdTS4tz03GIjveLE3OLSvHS95PzcTYzAuN927OeWHYxd74IPMQpwMCrx
 8G548DFOiDWxrLgy9xCjBAezkgiv09nTcUK8KYmVValF+fFFpTmpxYcYTYGem8gsJZqcD0xJ
 eSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUaGP2+1n13+vCyof87
 +0rBVSz1dbxLTkzmDp5umzLptaRzVXqr3vtNzPyf3iVLLZmhoMhruzHRzepi6c75ThMY7k58
 M4XFieGu+TT/iq3nm93mxF8131ly/u4lT40XubMkM9yOFIV+m7/8894LJfXXopUYhII3WGdN
 yFydp8Pa77muod1kn8FnGSWW4oxEQy3mouJEABSPGSARAwAA
X-CMS-MailID: 20200624131257eucas1p2475b00b53ea2cd0c5320ead2235d7a57
X-Msg-Generator: CA
X-RootMTR: 20200624114136eucas1p1c84f81b1d78e2dbad7ac1b762f0a4b4f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200624114136eucas1p1c84f81b1d78e2dbad7ac1b762f0a4b4f
References: <CGME20200624114136eucas1p1c84f81b1d78e2dbad7ac1b762f0a4b4f@eucas1p1.samsung.com>
 <20200624114127.3016-1-a.hajda@samsung.com>
 <20200624114127.3016-4-a.hajda@samsung.com>
 <CAHp75Vf5ANVRb8ghzdWa1F5U3JaRv9J2mVF8AQ+WwBahQM9Y5A@mail.gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24.06.2020 14:53, Andy Shevchenko wrote:
> On Wed, Jun 24, 2020 at 2:41 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
>> Many resource acquisition functions return error value encapsulated in
>> pointer instead of integer value. To simplify coding we can use macro
>> which will accept both types of error.
>> With this patch user can use:
>>          probe_err(dev, ptr, ...)
>> instead of:
>>          probe_err(dev, PTR_ERR(ptr), ...)
>> Without loosing old functionality:
>>          probe_err(dev, err, ...)
> ...
>
>> + * This helper implements common pattern present in probe functions for error
>> + * checking: print message if the error is not -EPROBE_DEFER and propagate it.
>> + * In case of -EPROBE_DEFER it sets defer probe reason, which can be checked
>> + * later by reading devices_deferred debugfs attribute.
>> + * It replaces code sequence:
>> + *     if (err != -EPROBE_DEFER)
>> + *             dev_err(dev, ...);
> Btw, we have now %pe. Can you consider to use it?


OK, I haven't noticed it finally appeared.


>
>> + *     return err;
>> + * with
>> + *     return probe_err(dev, err, ...);
>> + *
>> + * Returns @err.
>> + *
>> + */
>> +#define probe_err(dev, err, args...) __probe_err(dev, (long)(err), args)
> Can't we use PTR_ERR() here?


Nope, I want to accept both types: int and pointer.


Regards

Andrzej


>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
