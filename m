Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C726749C8B2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 12:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E45210E8D5;
	Wed, 26 Jan 2022 11:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FAA10E8D5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 11:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643196752;
 bh=ueVSIcxpI4wb87mye8wIz8iKVZJedVj2OTFb34Zb6YY=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=iDR5QdDImtHs4b+EWGN4Zlac4jhNsWxQW2CHzY244RoHnNlw1Kfnvtr355ihZwCkO
 D1Pk2jxF20/VBlvONGeoKlzInC9SXwQHJxGM2yJurYSTFMPVuVN9jgxUOXB+7mwBz+
 3DvzE9/k23CnCZtWBzSX2zV6BUeH4X1807J+4pcc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.143.57]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRmfi-1mp57i2cag-00TGEp; Wed, 26
 Jan 2022 12:32:32 +0100
Message-ID: <6f508ff0-1807-7665-6c93-7f3eea4a1bdd@gmx.de>
Date: Wed, 26 Jan 2022 12:31:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
 <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4HZA8Qd20gmrmhW2cpUf8m+vF9K5egFJXwowyq7nggCgVsSvkVX
 tPf8ABG1TX7j0jk6Ed7SW/E9sDrSMdvJUwy62XuqffmOcS9Vlgi96RiwbEIGs7zq3v0KabM
 Khfh4zMbE+MPXnKyCRBqnEwaPoRxSJN3Fin1OQU4D5C2JmA6cgw/CMquGJwW5c5KxMseV6Y
 vnG0xxDTiukhiSyrKNzwg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Dpvrygk+4eI=:fJrjPI5s8+iZM9bBt9xy71
 RkTAg+MmJ/clyv2eDy/O5ilyfJD7lhdTeMmV/YqDaAvE2qCQCQ8J7hDqOuQfHt9cw9P13V177
 HXDQym0myRQptV3yXW06Ggyl2t6W58ecl9jyxPgL5Zy8xXfJU2dZp+XAAcbY7jyMDapSAnnKK
 2Jz0JUdjHS1I1TwkpWxZVUbIT6AgNc6C1OGN7wejb4rot/CtAjZLBWVr+55gyNQfVk0fE5r7E
 auBYm3ronpYAs7LmyWl00bUVLFn3xnHrpeI1r55HVnYUUcfS08xv0kEoDWSevlXg1ZdTHbBYW
 AQlIkQLBV3vIdACrPt80JQI73+mxD9tkWt7+TlBqHdgW8LQohHGlwqte+/FNTUfY2vdZ/eqiv
 hvFV0FvSyBmc44ZzSKDHLCeUax3i/MLrvu6t74+xSl/gbowszAQGjsocY+SrOqZDdo5bTh5Un
 PGtIqDjvYBm4YJKqGRFotv5M/OtLwJ7jOVxhczyy/j2EEs/WoOu9on923QehNJY2waeZKkGVT
 EXuH+cSvT5jSNTLbNx7ILxvZ2W6rKJWT9KNeVGY5OmF4sgI0rbvEsfdOOmnnNew42zGCU8t+I
 Uql8KEQUOqJmRHX98KanolZzF7JcuGTLZOt0C41wPkMyk11GbobIMyg7b1R4TDDC69PIoyM0C
 P2u22f+nh0Bruq0ij5jwmcyvpQ0iOkTJJJv2q2yg40mkXXVM8M+T2a3JFkUD2vEdsIMxzAT4T
 IMzbu7dl7yNBbncfiYHc9XvAWqHC9U4fNtmVzECGap5rG1y2e7NV7X1JHrfsGU92+/YRCHvy3
 d9uE37ZPIegM8pQKYLvpT+TTGVhb9HiNEIgUi+GxW4X1nGS39+1vzjl0UBepYnrgsKEkgu6RJ
 DQ5GhNrIYKFxUynvCkZf/Co3ItER4DnoeE+wRw17PLKN2UGWunq0J1wB5Hd0P1tiOA862SMQx
 qbbPTxfAqEtkgFjoFr/OEVbbhVc1ahDNQ7RqPtIR917k2biWwl8T3pAWTONDhBJUW9yBVAdTf
 O1xZXT8RPaqy/MtUwux8QMyunc4OTUisOTsDDRFTmHlhVYJMTo3p1WpHXKdreNqJk1W/GXXNR
 NKdyWyFoZRbM8E=
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phillip Potter <phil@philpotter.co.uk>, Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/22 12:18, Javier Martinez Canillas wrote:
> On 1/26/22 11:59, Helge Deller wrote:
>> On 1/26/22 11:02, Andy Shevchenko wrote:
>
> [snip]
>
>>> P.S. For the record, I will personally NAK any attempts to remove that
>>> driver from the kernel. And this is another point why it's better not
>>> to be under the staging.
>>
>> I agree. Same as for me to NAK the disabling of fbcon's acceleration
>> features or even attempting to remove fbdev altogether (unless all
>> relevant drivers are ported to DRM).
>>
>
> But that will never happen if we keep moving the goal post.
>
> At some point new fbdev drivers should not be added anymore, otherwise
> the number of existing drivers that need conversion will keep growing.

Good point, and yes you are right!

I think the rule should be something like:

New graphics devices (e.g. max. 3 years old from now) usually are
capable to be ported to DRM.
For those graphics cards we should put a hard stop and not include them
as new driver into the fbdev framework. Inclusion for those will only
happen as DRM driver.

In the same manner there are old graphic cards or very specific devices
(e.g. more than 3 years old or only used in niche-use cases)
which have limitations and thus can't easily be ported to DRM.
For those it's still acceptable to include them as legacy fbdev driver,
because the work needed in DRM to support such cards or to be able that
they run fast enough with DRM just doesn't pay off the efforts which are
needed to keep them as DRM driver.

Would that be acceptable?

Helge
