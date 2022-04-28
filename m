Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1052D512B58
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 08:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA34410F623;
	Thu, 28 Apr 2022 06:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F4210F623
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 06:17:36 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220428061734euoutp01c68b337c79a75f423e5e17fe1982dcb5~p_vHCB3Mv2969029690euoutp01T
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 06:17:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220428061734euoutp01c68b337c79a75f423e5e17fe1982dcb5~p_vHCB3Mv2969029690euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1651126654;
 bh=wykqAZ/UFervqxVBBSSAX9W2b/GJHkcFhGNRgON940U=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=VdNl5m/+KBOsz6zc0R9TUCo4yq52eHRfG2aDBxWGto2gRoWW34ZuEb4QDDekPtO+A
 vsbh64sjCIj3xm9u7Pozpn/aiYveSjZXaFwZDkqUbraN3bsUKaRbMe/nI7teJPnMMo
 OrUJczd6/iNnReVbtTfmwkwe0bojijLWJfkAcWiE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220428061734eucas1p2423cc33810d043bd717eacc23adf2350~p_vGybbbI1723517235eucas1p2P;
 Thu, 28 Apr 2022 06:17:34 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id EF.8F.10260.E713A626; Thu, 28
 Apr 2022 07:17:34 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220428061733eucas1p19ef9f0a6023c9f275480f5e2cb3ea647~p_vGVDJon1079310793eucas1p1B;
 Thu, 28 Apr 2022 06:17:33 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220428061733eusmtrp27eebdf26092c1c9c314609925e4f5ad8~p_vGReLtj0938709387eusmtrp2x;
 Thu, 28 Apr 2022 06:17:33 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-51-626a317ebaa8
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 48.62.09522.D713A626; Thu, 28
 Apr 2022 07:17:33 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220428061733eusmtip22ef0ed22f08dcae97814168398878bef~p_vFhaob71636416364eusmtip2x;
 Thu, 28 Apr 2022 06:17:32 +0000 (GMT)
Message-ID: <8cc97a1b-f03a-3303-4357-fc26abe58fcd@samsung.com>
Date: Thu, 28 Apr 2022 08:17:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] Revert
 "drm: of: Lookup if child node has panel or bridge"
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220427143410.bectqumq62qmlv5x@houat>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMKsWRmVeSWpSXmKPExsWy7djPc7p1hllJBt2bhS16z51ksji9/x2L
 xf9tE5ktrnx9z2bxZdMENovOiUvYLab8Wc5kcXnXHDaLhR+3sljM+PGP0eLy1z5Gi+cLfzBb
 fJr1kNni5655LBZb3kxkdeD3WPvxPqvHvDXVHnfOnWfz2PttAYvHzll32T1md8xk9bhzbQ+b
 x/ZvD4AqTgZ63O8+zuSx+XS1x+dNcgE8UVw2Kak5mWWpRfp2CVwZL/rWsxSsFK/4tmwfcwPj
 V6EuRk4OCQETiQWnPrOB2EICKxglpk2X6GLkArK/MErc2DOJBcL5zChx9tVFFpiO+atnMEEk
 ljNKtF/5wQbhfGSUuHJ2K1gVr4CdxNIP38DmsgioSjw8t44NIi4ocXLmE7AaUYEkibn77jGD
 2MICoRJ7n+9jArGZBcQlbj2ZD2aLCARINGy5CraNWWAZi0TPgh/sIAk2AUOJrrddYEM5gU76
 uPA7C0SzvMT2t3OYIU49xSlx7L0GhO0i0fDoITuELSzx6vgWKFtG4v9OkGUcQHa+xN8ZxhDh
 Colrr9dAjbGWuHPuFxtICbOApsT6XfoQYUeJDyf72CE6+SRuvBWEOIBPYtK26cwQYV6JjjZo
 QKtJzDq+Dm7nwQuXmCcwKs1CCpNZSH6fheSVWQh7FzCyrGIUTy0tzk1PLTbOSy3XK07MLS7N
 S9dLzs/dxAhMh6f/Hf+6g3HFq496hxiZOBgPMUpwMCuJ8H7ZnZEkxJuSWFmVWpQfX1Sak1p8
 iFGag0VJnDc5c0OikEB6YklqdmpqQWoRTJaJg1OqgalYh6PSbPrMnwt/XvaqLt/ZdWdeXfTm
 G9M4vP028FVsUbZ1aLnfnaJsci13tsHZ6Ex5/9WF+09N8i5cftXLykLlzf7K2YFFlqwBQZ8n
 8exSdioxXTp/lfb6w7ctanqrLWMEy2PNCi+tn5+/sbvueva7XtfD/EFPwrXiz3q1WF6Y37tH
 ZmKGqvL9PWLXw3I4b6+YUlh07fGvkC83r/xblv/l6cesFXtEfh9jTXhvYZwYFB4QqL/XRatU
 3e1k8vQlWVdKxd0O+Ujuee29In3Os9AHz1J2xczRzv5c9UtJ6ffz/gksJiLzL9Wa/c/XCmQ9
 9ujbKpOljx5u7zo/KfHIXWkb1SthG18x7onl7jv77qISS3FGoqEWc1FxIgCeM88I9gMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFIsWRmVeSWpSXmKPExsVy+t/xe7q1hllJBvM/61v0njvJZHF6/zsW
 i//bJjJbXPn6ns3iy6YJbBadE5ewW0z5s5zJ4vKuOWwWCz9uZbGY8eMfo8Xlr32MFs8X/mC2
 +DTrIbPFz13zWCy2vJnI6sDvsfbjfVaPeWuqPe6cO8/msffbAhaPnbPusnvM7pjJ6nHn2h42
 j+3fHgBVnAz0uN99nMlj8+lqj8+b5AJ4ovRsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyN
 zWOtjEyV9O1sUlJzMstSi/TtEvQyXvStZylYKV7xbdk+5gbGr0JdjJwcEgImEvNXz2DqYuTi
 EBJYyigxo/EbM0RCRuLktAZWCFtY4s+1LjaIoveMEtOuNzGBJHgF7CSWfvjGBmKzCKhKPDy3
 jg0iLihxcuYTFhBbVCBJ4sW254wgtrBAqMSmK1PAFjALiEvcejIfbI6IgJ/ExQf3wK5gFljG
 IjFx9myok14zS1zqWgjWzSZgKNH1tgtsAyfQ3R8XfmeBmGQm0bW1ixHClpfY/nYO8wRGoVlI
 DpmFZOEsJC2zkLQsYGRZxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJEZgIth37uXkH47xXH/UO
 MTJxMB5ilOBgVhLh/bI7I0mINyWxsiq1KD++qDQntfgQoykwNCYyS4km5wNTUV5JvKGZgamh
 iZmlgamlmbGSOK9nQUeikEB6YklqdmpqQWoRTB8TB6dUA9NOr4wTUVtbfpfN3G5zN/PpgtWt
 5054Bz/OtHAVmKX0kS2inuHuPT3vXTK12ZW3DtRYlqf0z7rKxuoa9GrmK5k7KX7VNx84JYSc
 OnpW9uhaP8+ev7MPRbOkfQrk27cgxWnFBc6ddbefLa6Y9ke7+pqdoKKPwt0KqRenOdd//fL/
 zL6V8587hEwJZ51+4pEc9wb/9//v72G4kBqsxj2/Q/brNUejrov+xZ0TPtXw1q/71mnRpCi/
 6r/xrJlJRqaTlk+qf8WxY6vwi9boR3GngpPenlbhLVntpH1X6bfBQ8Hp7XpsGgynla/Hr8ws
 e5Z0sspxj4fqY7G7Pb3K7AJqfxlbL3b3T9e9X6p/cGLDhXolluKMREMt5qLiRAAC3F3xjQMA
 AA==
X-CMS-MailID: 20220428061733eucas1p19ef9f0a6023c9f275480f5e2cb3ea647
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220427143420eucas1p1aa7dff284512e1c48c3db414633237ea
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220427143420eucas1p1aa7dff284512e1c48c3db414633237ea
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
 <20220420231230.58499-2-bjorn.andersson@linaro.org>
 <CAMty3ZAw7DUSnBePC05qC8Gn6ESKiu+FHw4a-HPPc05VX1hqhg@mail.gmail.com>
 <20220421082358.ivpmtak3ednvddrc@houat> <YmEdAVwZuA7Wo1Ch@aptenodytes>
 <YmelPCcWCCjALtRU@aptenodytes>
 <CAMty3ZBwguzvC8A9xA5c0enfoFRGS=4wWCzpfakTUXrsRS9GyA@mail.gmail.com>
 <CGME20220427143420eucas1p1aa7dff284512e1c48c3db414633237ea@eucas1p1.samsung.com>
 <20220427143410.bectqumq62qmlv5x@houat>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 27.04.2022 16:34, Maxime Ripard wrote:
> On Tue, Apr 26, 2022 at 01:40:31PM +0530, Jagan Teki wrote:
>> On Tue, Apr 26, 2022 at 1:24 PM Paul Kocialkowski
>> <paul.kocialkowski@bootlin.com> wrote:
>>> On Thu 21 Apr 22, 10:59, Paul Kocialkowski wrote:
>>>> On Thu 21 Apr 22, 10:23, Maxime Ripard wrote:
>>>>> On Thu, Apr 21, 2022 at 01:15:54PM +0530, Jagan Teki wrote:
>>>>>> + Linus
>>>>>> + Marek
>>>>>> + Laurent
>>>>>> + Robert
>>>>>>
>>>>>> On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson
>>>>>> <bjorn.andersson@linaro.org> wrote:
>>>>>>> Commit '80253168dbfd ("drm: of: Lookup if child node has panel or
>>>>>>> bridge")' attempted to simplify the case of expressing a simple panel
>>>>>>> under a DSI controller, by assuming that the first non-graph child node
>>>>>>> was a panel or bridge.
>>>>>>>
>>>>>>> Unfortunately for non-trivial cases the first child node might not be a
>>>>>>> panel or bridge.  Examples of this can be a aux-bus in the case of
>>>>>>> DisplayPort, or an opp-table represented before the panel node.
>>>>>>>
>>>>>>> In these cases the reverted commit prevents the caller from ever finding
>>>>>>> a reference to the panel.
>>>>>>>
>>>>>>> This reverts commit '80253168dbfd ("drm: of: Lookup if child node has
>>>>>>> panel or bridge")', in favor of using an explicit graph reference to the
>>>>>>> panel in the trivial case as well.
>>>>>> This eventually breaks many child-based devm_drm_of_get_bridge
>>>>>> switched drivers.  Do you have any suggestions on how to proceed to
>>>>>> succeed in those use cases as well?
>>>>> I guess we could create a new helper for those, like
>>>>> devm_drm_of_get_bridge_with_panel, or something.
>>>> Oh wow I feel stupid for not thinking about that.
>>>>
>>>> Yeah I agree that it seems like the best option.
>>> Should I prepare a patch with such a new helper?
>>>
>>> The idea would be to keep drm_of_find_panel_or_bridge only for the of graph
>>> case and add one for the child node case, maybe:
>>> drm_of_find_child_panel_or_bridge.
>>>
>>> I really don't have a clear idea of which driver would need to be switched
>>> over though. Could someone (Jagan?) let me know where it would be needed?
>> sun6i_mipi_dsi
> It doesn't look like sun6i_mipi_dsi is using devm_drm_of_get_bridge at all?
>
>> exynos_drm_dsi
> If you reference 711c7adc4687, I don't see why we would need to switch
> it back to the old behaviour. It wasn't iterating over its child node
> before, so what does the switch to drm_of_get_bridge broke exactly?

It broke getting the panel if it is a direct child of the DSI device 
node. It worked before because it used following code:

dsi->panel = of_drm_find_panel(device->dev.of_node);

which got replaced by devm_drm_of_get_bridge().

>> mcde_dsi (as of now)
> Yeah, we do need to revert 3730bc6147b0 and 3d7039e1e649
>
> Maxime
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

