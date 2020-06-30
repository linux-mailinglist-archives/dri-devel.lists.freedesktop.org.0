Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 481A320F090
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 10:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477A189AB6;
	Tue, 30 Jun 2020 08:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B66D89AB9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 08:32:13 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200630083209euoutp01534b7a7e3e2986ade3a8b7dbb4424eff~dRTMuFvb42089220892euoutp01e
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 08:32:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200630083209euoutp01534b7a7e3e2986ade3a8b7dbb4424eff~dRTMuFvb42089220892euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593505929;
 bh=OrShDEn2h+7V7n/pSCbJmSQRC9bDfacS5k/0XuTGJqU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=KmSIO0W5uj3N0E1IwulAs4duzBuKnRX/1UaBO+LZFgtbKlk0zhtg08PldrQWbTZen
 ykz4368BzQDYc1j9cwGxiH3C2bYo2cstk2aCXgYvETESR0chxXCzxe+6cLgiQMFcjR
 B6FhfdbkL4mpHWIfjWICihR7dr9vxr3ErRIAM4fw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200630083208eucas1p1558a15c47073cce1b218ca7fe15b5f47~dRTMSXtRJ1712317123eucas1p1t;
 Tue, 30 Jun 2020 08:32:08 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 44.92.06456.888FAFE5; Tue, 30
 Jun 2020 09:32:08 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200630083208eucas1p1257700c209a1dcb586555e49d50aee28~dRTL-3BDg1712317123eucas1p1s;
 Tue, 30 Jun 2020 08:32:08 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200630083208eusmtrp1f2d30f34ef9d152e57d6333239e9ed3f~dRTL_7l1r1295012950eusmtrp1I;
 Tue, 30 Jun 2020 08:32:08 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-e6-5efaf888c0d8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A6.71.06314.888FAFE5; Tue, 30
 Jun 2020 09:32:08 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200630083206eusmtip10335b85cc1556d9bd2a674b2e778ef06~dRTKcfrrC2905729057eusmtip1N;
 Tue, 30 Jun 2020 08:32:06 +0000 (GMT)
Subject: Re: [PATCH v7 2/4] driver core: add deferring probe reason to
 devices_deferred property
To: Andy Shevchenko <andy.shevchenko@gmail.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <a48ab93c-0d9c-ed8b-76dd-62007826bf6f@samsung.com>
Date: Tue, 30 Jun 2020 10:32:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdS_u8h4qfBxsQRUp1-2SL_hq20=dQkpteXH7Xg7epArQ@mail.gmail.com>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjm2zk7Ow5nx2n4UmE4LCqoJV04UEiFP07+qPwXhstZh7lyJpsz
 9UdGOpma4jI117xkmhcMa3Olgl2Wl8osM6+RqRnBSlFSU5eO3M4k/z3v8z7P+z0PfCQm/sXf
 QirjE1l1vDxOQgjxJ53LH/bqlxyy/fZyKW3Pf4Xox3ca+XThxHeC7l+YIej0+40EPbBox+g3
 UwM4nWWoEtDmyUE+/anVRNC2wjZEP2wfFdC2vHN06XwhdsyH+TT4EWNmhnUCpsU4KmDu6kv4
 jLk+i2Be5/fxmOelDQJmLKeLx1iq0pi8pnrEvMgtwJk5c+AZ70jh0YtsnDKJVUtDo4Wxg84c
 PKHHJ9lYFXgdjQuzkRcJ1EHo/TpGZCMhKaZqESw2zfK5YR5Bg86Ec8McgtGm2/x1S1lXpmdR
 g6DP2uvxzyAYmqgnXCo/KgacgwZeNhKQ/pQUnie5JBiVzoeV6n73IYLaDauWEbdcRIWCdVG3
 hkkSp3bAnGOni95MRUFedYVH4gtvSr7jLokXFQHtdaSLxqjt8HTahHE4AG7M17kLAFVCQoVp
 VcBlDoPimkmMw37ws6vJw2+D7oKbOIfTYKw2A+PMegTWRy0ewxH48t7hzoatZW5slXL0cWhv
 nnTTQPnA8LQvl8EHbj0pxjhaBPpMMacOgrEeq+dgAFT3LhD5SGLcUMy4oY1xQxvj/3crEF6P
 AlitRqVgNSHx7NV9GrlKo41X7LtwRWVGa1+w29n1uxkt9MXYEEUiibco+v2yTMyXJ2lSVDYE
 JCbxF53o6ZaJRRflKams+sp5tTaO1djQVhKXBIgOVNqjxJRCnsheZtkEVr2+5ZFeW66jrMOj
 h/6etb4MXioOyU3o+BNlC7cUtEhXkkfCQ8U/Tr4bH5p0nuqsMDfcI6c2LT/7wRPqHij8sqIr
 O9Mrb1yK2GUgHDmp15TJ/kGRlraRcsvmz8Flb8Puy7Tf6A7F6ZUim1YdVN2c3qFs0ztDDUU1
 qRNUWsY356yM6I8gw1+nSXBNrDxkD6bWyP8BqGOo0n4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHIsWRmVeSWpSXmKPExsVy+t/xu7odP37FGZx+KGHxcsJhRouNM9az
 Wkx9+ITN4srX92wWzYvXs1lc/f6S2eLkm6ssFp0Tl7BbbHp8jdXi8q45bBaHpu5ltFh75C67
 xaG+aIu5X6YyO/B5XL52kdnj/Y1Wdo+ds+6ye8zumMnqsWlVJ5vHiQmXmDz2z13D7nG/+ziT
 x+Yl9R59W1Yxehzonczi8XmTXABPlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayV
 kamSvp1NSmpOZllqkb5dgl7GtX/dLAVn+SpmLZFrYHzA1cXIySEhYCIx73gbSxcjF4eQwFJG
 ia7jX9kgEuISu+e/ZYawhSX+XOtigyh6yyjx+uQmFpCEsECSxL9rE5m6GNk5RAT0JfaXgZQw
 C7SzSrw5sJ4Zor6JSeL3hkPsIPVsApoSfzffBFvAK2AnsfV7K5DNwcEioCrx+ZcaSFhUIFbi
 270tUCWCEidnPmEBKeEUCJQ4spIDJMwsYCYxb/NDZghbXmL72zlQtrhE05eVrBMYhWYh6Z6F
 pGUWkpZZSFoWMLKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECIz7bcd+bt7BeGlj8CFGAQ5G
 JR7ehHM/44RYE8uKK3MPMUpwMCuJ8DqdPR0nxJuSWFmVWpQfX1Sak1p8iNEU6LWJzFKiyfnA
 lJRXEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoExyOv8/9KD5hdm
 vN3oOsHCefZMxfzaV5ke2kv2q59+1zJtvuuhSwckKpcr+F5cdIbzudAX5tcTVblObNPuYIv/
 EGxbLtk2R9XsOdt5rlDT0O8GtWE3+3j+a224ydOw6Z1c6PkyvRl6n/oynHasu7CB027brNsn
 JasPVJk+Lgl9cDGnT4RF3KFIiaU4I9FQi7moOBEA4N7ROREDAAA=
X-CMS-MailID: 20200630083208eucas1p1257700c209a1dcb586555e49d50aee28
X-Msg-Generator: CA
X-RootMTR: 20200629112249eucas1p160b845444f8fbad96bdec41e9d3938da
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200629112249eucas1p160b845444f8fbad96bdec41e9d3938da
References: <CGME20200629112249eucas1p160b845444f8fbad96bdec41e9d3938da@eucas1p1.samsung.com>
 <20200629112242.18380-1-a.hajda@samsung.com>
 <20200629112242.18380-3-a.hajda@samsung.com>
 <CAHp75VdS_u8h4qfBxsQRUp1-2SL_hq20=dQkpteXH7Xg7epArQ@mail.gmail.com>
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


On 29.06.2020 18:36, Andy Shevchenko wrote:
> On Mon, Jun 29, 2020 at 2:22 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
>> /sys/kernel/debug/devices_deferred property contains list of deferred devices.
>> This list does not contain reason why the driver deferred probe, the patch
>> improves it.
>> The natural place to set the reason is dev_err_probe function introduced recently,
>> ie. if dev_err_probe will be called with -EPROBE_DEFER instead of printk the message
>> will be attached to deferred device and printed when user read devices_deferred
> to a deferred
>
> reads
OK, thx.
>
>> property.
> ...
>
>> @@ -3984,10 +3986,12 @@ int dev_err_probe(const struct device *dev, int err, const char *fmt, ...)
>>          vaf.fmt = fmt;
>>          vaf.va = &args;
>>
>> -       if (err != -EPROBE_DEFER)
>> +       if (err != -EPROBE_DEFER) {
> Why not positive conditional? (Okay, I'm fine with either in this case)


I put more natural branch 1st.


>
>>                  dev_err(dev, "error %d: %pV", err, &vaf);
>> -       else
>> +       } else {
>> +               device_set_deferred_probe_reson(dev, &vaf);
>>                  dev_dbg(dev, "error %d: %pV", err, &vaf);
>> +       }
> To reduce churn, you may move {} addition to the first patch.


But then I need to explain why it is there :)


>
> ...
>
>>          list_for_each_entry(curr, &deferred_probe_pending_list, deferred_probe)
>> -               seq_printf(s, "%s\n", dev_name(curr->device));
>> +               seq_printf(s, "%s\t%s", dev_name(curr->device),
>> +                          curr->device->p->deferred_probe_reason ?: "\n");
> Hmm... "\t" will be dangling in the latter case


Hmm, I followed your advice [1] :)

[1]: 
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1787370.html


Regards

Andrzej


>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
