Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAB649C917
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 12:53:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E985610E880;
	Wed, 26 Jan 2022 11:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30D010E880
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 11:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643197978;
 bh=F7OJttXg/1SZ0+8XJ9RiNQByJGuOFHv6GJfi8vBzmYw=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=BmLcpCzUBSLykup7cIGSUDtObsuUdvnq63pboFGQ2DPbPrvxRudA5+fwMJwM2HODc
 bY1+Bylrk3oQi4cktMU1K5x8JIABqVO/92bB3NGuUkKiH+FSeu7eNa0YDKWd49qTtQ
 rn3+65OTV/7gluAsoKD/Igz7+XA4qzGk7/3p5uoE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.143.57]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McH5Q-1mgw0T46RA-00ceIm; Wed, 26
 Jan 2022 12:52:58 +0100
Message-ID: <1d00ed48-0606-823c-58c4-e45948383c42@gmx.de>
Date: Wed, 26 Jan 2022 12:51:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
 <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
 <6f508ff0-1807-7665-6c93-7f3eea4a1bdd@gmx.de> <YfEyo2xxfFyl2ADI@kroah.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <YfEyo2xxfFyl2ADI@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZGYf5OHyO+vtorTjqz8WFu3J4v+yvqdZUvA02XGd8Gg3WJg6h54
 VohWg1nKDLCpu2ALkG9i4njJwx8Q/aW7irq0BafPPszKlHI7qYiPQaWgUJ09y1mDg8NWqio
 C29bSn/Mci4UAmVj4ifYixzvoNSdl6CaTyuZ1eZ6NvGfc5olq99d+lrA9BpkdEzgmRpHyNE
 MhcUnZ8b2ebV3f76EYsqA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:w9qrTwYOmn0=:UxpeVox+PWTxA4QnRfHa+k
 iVXHQ/nCYtI9WMoeQuHm5tszeSgZmOTGq82hL8XrRhwmioSX7lWlqvh0EN5YNqsC40C8VWUrT
 rDiEg0qCUFCrM/n0ct12Y4OGaZg0VM/LUdW4MvEODYEOPocWYcr2YFi88cIxozYxlLTHnlgN1
 5UStEUd8FVeKjgluZ9yTxv7MtqrENOCCtOndIU5XRWKH6PT2wwCq5+0pblf7iGFLWdT/xypzL
 FQQODd4qpJAPUckfDDc+tdKMPP66d7vFBKDib23CXEG3N4sZe4fMcviVUeexCCC1spikSdSTq
 /VsMT9GxNC+MPg3SG+qAb1rK/+FAsFafTlxGaUXmZK+/qVY038e9L08ui+DO0xld7wJ7r1er5
 dNhEIGqnpBD2rN3i99sk29cPzTT3x3K8b7Adx5KliVu8kMvaRur9XuM0UymBQGUi12qGveE+D
 Gk3eNJT1eWqDeJF8ku/1lQMK99k8oBA5xWUNuwxMO/QIXER49eEaoWuevjJZ/FWbzScjLn9jM
 P1vzySpRYQphcZU3WMEP9gXdPNYGkrr1BHd0BBqvFor4Xs5ZyFkttG18Mu/8Uchx6fGaYcQg7
 2/Txj5eTCKtqnweZ4Vpi6ZztMa2Pf7JVM93OU1s4T/PBCaBhyNFuGrqkzKZKhIw9TAyLfAIWD
 Fbj+/EhNa6Zh2Pn0zlfAr1dA/Pzs45H2syyCLHTg7uM0/LQ3FZ7qz7edk9VJECGLkH6IP+8wG
 5smGPqyvI7K5BDKpC99xozOad/aF03ktqBUem5aMmiwJcOWg7qWcfgTuP+2Y7FYE4HBRxkNna
 fXMfFiagItVApdQNm0dLHZJkJWleOn8xthvb1mdibJncedpImpPInC4goKdbZaqZcSSf5pFak
 v2xB6zIFeKQBBhHCNDWyWuXkNN1GVN8jVvdaL+UeEIQxd1pfcbixj32PUhGgy5EwkirwuF4C8
 Amt+iDwWEGgHqWdUCxh6klwqx77msMuT91lZrxtzVGojm9uYGS/fKx0yM10UQFwddsDx7HJE9
 435eXk1ea8I6Ws01873zGd0T1G/ft+cCc9BUJNFq0BsfWigFanusbzYU0CRUPYN59CYRo+o90
 GlkE+JYxRjuSx0=
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 linux-staging@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>,
 Phillip Potter <phil@philpotter.co.uk>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/22 12:38, Greg Kroah-Hartman wrote:
> On Wed, Jan 26, 2022 at 12:31:21PM +0100, Helge Deller wrote:
>> On 1/26/22 12:18, Javier Martinez Canillas wrote:
>>> On 1/26/22 11:59, Helge Deller wrote:
>>>> On 1/26/22 11:02, Andy Shevchenko wrote:
>>>
>>> [snip]
>>>
>>>>> P.S. For the record, I will personally NAK any attempts to remove th=
at
>>>>> driver from the kernel. And this is another point why it's better no=
t
>>>>> to be under the staging.
>>>>
>>>> I agree. Same as for me to NAK the disabling of fbcon's acceleration
>>>> features or even attempting to remove fbdev altogether (unless all
>>>> relevant drivers are ported to DRM).
>>>>
>>>
>>> But that will never happen if we keep moving the goal post.
>>>
>>> At some point new fbdev drivers should not be added anymore, otherwise
>>> the number of existing drivers that need conversion will keep growing.
>>
>> Good point, and yes you are right!
>>
>> I think the rule should be something like:
>>
>> New graphics devices (e.g. max. 3 years old from now) usually are
>> capable to be ported to DRM.
>> For those graphics cards we should put a hard stop and not include them
>> as new driver into the fbdev framework. Inclusion for those will only
>> happen as DRM driver.
>
> We made this rule 6 years ago already.

Very good.

Was there any decision how to handle drivers which can't use DRM,
or for which DRM doesn't make sense?

So the best way forward regarding those fbtft drivers is probably what
you suggested: Split them and move those DRM-capable drivers to DRM,
the others to fbdev, right?

Helge
