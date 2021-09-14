Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1F440B831
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 21:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8CB6E5BE;
	Tue, 14 Sep 2021 19:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5219D6E5BE
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 19:36:05 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210914193603euoutp0159dea17939081434f82e2eb5810dcf86~kx1wsltk51976719767euoutp01e
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 19:36:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210914193603euoutp0159dea17939081434f82e2eb5810dcf86~kx1wsltk51976719767euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1631648163;
 bh=yO6TItJe1NcENOeZcyNUQh54yA309MA3ALmmqNlRy0o=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=VplStY13dg4agwguqICyokJi9LsaOY7nhLNsoJCoVvXSmi/gNnTSqkczFE+Q9XjIq
 Kgcc/F7SWqTN60rTLB08psFwmgPP7e0b/EM1CWZevWRBts6gB0UUnRhMqWt4Vgqqh3
 wR61BHT3+tvc04tch6r1dA4pSlo0CIo/a+HHZFHw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210914193603eucas1p2a2c8ae97479893d144b7d46524422ae3~kx1wbm-751371713717eucas1p2B;
 Tue, 14 Sep 2021 19:36:03 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 74.57.42068.3A9F0416; Tue, 14
 Sep 2021 20:36:03 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210914193602eucas1p1d74fa1db4ac277a4c2221feb13c7a27d~kx1v4Y3GM0981409814eucas1p1B;
 Tue, 14 Sep 2021 19:36:02 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210914193602eusmtrp120614c45b6a0799e419849d024992c6b~kx1vwvXXc1212812128eusmtrp1k;
 Tue, 14 Sep 2021 19:36:02 +0000 (GMT)
X-AuditID: cbfec7f4-c89ff7000002a454-f5-6140f9a37918
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id F2.CF.20981.2A9F0416; Tue, 14
 Sep 2021 20:36:02 +0100 (BST)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210914193601eusmtip26a9c34c5bb2ba390b4c6de32f63b8efd~kx1uxaCcz2416924169eusmtip2r;
 Tue, 14 Sep 2021 19:36:01 +0000 (GMT)
Message-ID: <5af6cd50-0ed3-1a70-d7d0-66ca18a83d65@samsung.com>
Date: Tue, 14 Sep 2021 21:36:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0)
 Gecko/20100101 Thunderbird/93.0
Subject: Re: [PATCH v4 04/15] drm/edid: Use new encoded panel id style for
 quirks matching
Content-Language: pl
To: Jani Nikula <jani.nikula@linux.intel.com>, Doug Anderson
 <dianders@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Steev Klimaszewski
 <steev@kali.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie
 <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, LKML
 <linux-kernel@vger.kernel.org>
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <87y27zyodw.fsf@intel.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAKsWRmVeSWpSXmKPExsWy7djPc7qLfzokGrw/yWHRe+4kk8Xp/e9Y
 LP5vm8hsMf/IOVaLs8sOsllc+fqezWL55fWMFlP+LGeymLj/LLvF5V1z2CwWftzKYtHWuYzV
 onXvEXaLFT+3Mlr8vN7GbPFz1zwWiy1vJrI6CHrMbrjI4rH32wIWj52z7rJ7zFl0g9lj06pO
 No871/aweWz/9oDVY97JQI/73ceZPJZMu8rmsfl0tcfnTXIBPFFcNimpOZllqUX6dglcGW2n
 9zMW7JCouD9/KmsD4yzhLkZODgkBE4lj69ewdjFycQgJrGCUuLhlAQuE84VR4sOU/VCZz4wS
 n+5/YYdp2bTiM1RiOaPE6s27mUASQgLvGSVWbJcFsXkF7CQW/D/J2MXIwcEioCpxqtUQIiwo
 cXLmExYQW1QgQeL1vU1sILawQIzE6YNzmUFsZgERiRuPWhhBbBGBMIkbDRfZQXYxC8xmlbjc
 8B+sgU1AU+Lv5ptgNqeAusSbvqksEM3yEs1bZzODNEgI3OOU2LxhLSPE1S4SLw4/YoOwhSVe
 Hd8C9Y2MxOnJPSwQdr3E/RUtUM0djBJbN+xkhkhYS9w594sN5BtmoM3rd+lDhB0lLpw+APak
 hACfxI23ghA38ElM2jadGSLMK9HRJgRRrShx/+xWqIHiEksvfGWbwKg0CylYZiF5fxaSb2Yh
 7F3AyLKKUTy1tDg3PbXYKC+1XK84Mbe4NC9dLzk/dxMjMFGe/nf8yw7G5a8+6h1iZOJgPMQo
 wcGsJMK77Y1tohBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHepC1r4oUE0hNLUrNTUwtSi2CyTByc
 Ug1MYXrSj5dlLnvMbXWvsmXBC4EHTfZTjzmJiHq+fau7amblxKctRTGs05MMarclrrvYVyvI
 tKaM/4za67uvvf715NVNq+foTn4s4rcgOPNl1LbPH1hyl723D5rate2nR9WzrZN1+C3rehZf
 28JQOElMYn62lXP6mbtfBIRSeo5+ij9Y1hv71UfSs11L5cR/t7r/z4Xml5pdkOfJl+eTm1//
 ZNlyhTj+mNC7t53faycf4Or+9WFB/M2lVpPrrouF9n1Ij61VWSm60GOJXh7f7dqNedHHpJds
 v/Xyr0Pnb4tq69WbnB6lzp2VZNZ5+U6AoqDwpcS1+6NjJ9nduBI+4VSN3Pnmk94nHAvZ9AX5
 Jd8osRRnJBpqMRcVJwIAdYy/0gMEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmleLIzCtJLcpLzFFi42I5/e/4Pd1FPx0SDQ78kbXoPXeSyeL0/ncs
 Fv+3TWS2mH/kHKvF2WUH2SyufH3PZrH88npGiyl/ljNZTNx/lt3i8q45bBYLP25lsWjrXMZq
 0br3CLvFip9bGS1+Xm9jtvi5ax6LxZY3E1kdBD1mN1xk8dj7bQGLx85Zd9k95iy6weyxaVUn
 m8eda3vYPLZ/e8DqMe9koMf97uNMHkumXWXz2Hy62uPzJrkAnig9m6L80pJUhYz84hJbpWhD
 CyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jLbT+xkLdkhU3J8/lbWBcZZwFyMn
 h4SAicSmFZ9Zuxi5OIQEljJKnFl6lw0iIS6xe/5bZghbWOLPtS6wuJDAW0aJmavAmnkF7CQW
 /D/J2MXIwcEioCpxqtUQIiwocXLmExYQW1QgQWLyzXmsILawQIzE6YNzwUYyC4hI3HjUwghi
 iwiESWzat5UR5AZmgfmsEk9X3WWBOOg2k8T04wfAOtgENCX+br4JdgSngLrEm76pLBCTzCS6
 tnYxQtjyEs1bZzNPYBSaheSQWUgWzkLSMgtJywJGllWMIqmlxbnpucVGesWJucWleel6yfm5
 mxiBqWHbsZ9bdjCufPVR7xAjEwfjIUYJDmYlEd5tb2wThXhTEiurUovy44tKc1KLDzGaAgNj
 IrOUaHI+MDnllcQbmhmYGpqYWRqYWpoZK4nzmhxZEy8kkJ5YkpqdmlqQWgTTx8TBKdXA1NFi
 EhZtqO9v9PI0Z/ulNQtFgzdM3NC6Nf2bLf98LfWZBx/cSfj5QTLpgYXwhbYL3373P43+EZ7B
 H5B3Iqckz1i9nL/y6cRPk0oKHu3/2qj6/WRn/4pInmtv5zfX9Fet3tOZrrK8aNEHG5tGPdXF
 O/Zfnh8Qn9UV0GG2/IXUI4XND15Js7/btIHh1PmMjhtTJgSkXpqiv1IwKT7ZZlamwKnc1M3H
 P+h8Zz7VMLX6eoftrmtLtfUb7tlxpPxUP77Mt81NpeP9lxytZNPJJu8KxIP/GB2NuMjFENp2
 WPxge8eU95MnhXtwf77lpJ6z/2lYlc5GH6/Wkyx3JLrFc7lKea6enz6l6sg9lo3zOGx2KrEU
 ZyQaajEXFScCAK4oI72WAwAA
X-CMS-MailID: 20210914193602eucas1p1d74fa1db4ac277a4c2221feb13c7a27d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210914185943eucas1p145cf1b087572ec1c4da1f1e269c6f11b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210914185943eucas1p145cf1b087572ec1c4da1f1e269c6f11b
References: <20210909210032.465570-1-dianders@chromium.org>
 <20210909135838.v4.4.I6103ce2b16e5e5a842b14c7022a034712b434609@changeid>
 <87ee9r10qw.fsf@intel.com>
 <CAD=FV=XgLcOBOOp9kgShE4+T8g8UZcO_Ff3hhAbGTyLkdE7HNA@mail.gmail.com>
 <CGME20210914185943eucas1p145cf1b087572ec1c4da1f1e269c6f11b@eucas1p1.samsung.com>
 <87y27zyodw.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


W dniu 14.09.2021 o 20:59, Jani Nikula pisze:
> On Tue, 14 Sep 2021, Doug Anderson <dianders@chromium.org> wrote:
>> Hi,
>>
>> On Tue, Sep 14, 2021 at 11:16 AM Jani Nikula
>> <jani.nikula@linux.intel.com> wrote:
>>> On Thu, 09 Sep 2021, Douglas Anderson <dianders@chromium.org> wrote:
>>>> In the patch ("drm/edid: Allow the querying/working with the panel ID
>>>> from the EDID") we introduced a different way of working with the
>>>> panel ID stored in the EDID. Let's use this new way for the quirks
>>>> code.
>>>>
>>>> Advantages of the new style:
>>>> * Smaller data structure size. Saves 4 bytes per panel.
>>>> * Iterate through quirks structure with just "==" instead of strncmp()
>>>> * In-kernel storage is more similar to what's stored in the EDID
>>>>    itself making it easier to grok that they are referring to the same
>>>>    value.
>>>>
>>>> The quirk table itself is arguably a bit less readable in the new
>>>> style but not a ton less and it feels like the above advantages make
>>>> up for it.
>>> I suppose you could pass vendor as a string to EDID_QUIRK() to retain
>>> better readability?
>> I would love to, but I couldn't figure out how to do this and have it
>> compile! Notably I need the compiler to be able to do math at compile
>> time to compute the final u32 to store in the init data. I don't think
>> the compiler can dereference strings (even constant strings) and do
>> math on the result at compile time.
> Ah, right.


What about:

+#define drm_edid_encode_panel_id(vend, product_id) \
+	((((u32)((vend)[0]) - '@') & 0x1f) << 26 | \
+	 (((u32)((vend)[1]) - '@') & 0x1f) << 21 | \
+	 (((u32)((vend)[2]) - '@') & 0x1f) << 16 | \
+	 ((product_id) & 0xffff))


Regards

Andrzej


>
>> I _think_ you could make it work with four-character codes (only
>> specifying 3 characters), AKA single-quoting something like 'AUO' but
>> I think four-character codes are not dealt with in a standard enough
>> way between compilers so they're not allowed in Linux.
>>
>> If you like it better, I could do something like this:
>>
>> #define ACR_CODE 'A', 'C', 'R'
>> #define AUO_CODE 'A', 'U', 'O'
>> ...
>> ...
>>
>> ...then I could refer to the #defines...
> Nah.
>
>>
>>> Just bikeshedding, really. ;)
>> I'll take this comment (without any formal tags) as:
>>
>> * You've seen this patch (and the previous ones) and wouldn't object
>> to it merging.
>>
>> * You're not planning on any deeper review / testing, so I shouldn't
>> wait for more stuff from you before merging. Please yell if this is
>> not the case. I'm happy to wait but I don't want to wait if no further
>> review is planned.
> I have now reviewed the ones where my review is relevant, and certainly
> don't expect me to comment on the rest. ;)
>
> BR,
> Jani.
>
>>
>> In general I'm still planning to give this series at least another
>> week for comments before merging. ${SUBJECT} patch also is the only
>> one lacking any type of Review / Ack tags so I'll see if I can find
>> someone to give it something before merging, too.
>>
>>
>> -Doug
