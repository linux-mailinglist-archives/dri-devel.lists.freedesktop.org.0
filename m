Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F59B64CBED
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 15:16:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29ABB10E062;
	Wed, 14 Dec 2022 14:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DE810E062
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 14:16:04 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:913a:fe5a:ffe8:c1ce] (unknown
 [IPv6:2001:861:4a40:8620:913a:fe5a:ffe8:c1ce])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: gtucker)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1A5406602C47;
 Wed, 14 Dec 2022 14:16:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1671027362;
 bh=G1zIXYhxFcc+X6E89eDdaRNsICWJY6/QzwXk8s7RwRk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fI1h3pnjOHjeIf4ELKmtA/Dajun9qn+HusMrtMn+xf0HO2o84WTTcEhyX0dH35yJG
 SgZP/gxNOVO+qXXtptTgVwN3GC+FOWvv+i1ZkV/JCVq4LXIfVvLLsQHVoQU/GeRcRQ
 zWMeLcepF083dF28fZ2qnAtLeY/M41oHs9XLB4X01caK/QgrlLzLIMdxmFX7ltNTwg
 B0Pu9fM9HK8apBsQDnhhZd5gYWlAmfLW3rfBp+7V4IYkldoA7gv+2sIFP43hZFAyc2
 hcjaAS0tJuVqDsZW5Sa0k4ajlmWdy59HgpK/8liHe3+U8sRexLSflDCmKBT87cVDX2
 W07XWF49f7W3A==
Message-ID: <fea3d246-d1d5-450f-6e9e-1ab63a91a053@collabora.com>
Date: Wed, 14 Dec 2022 15:16:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: renesas/master bisection:
 igt-kms-rockchip.kms_vblank.pipe-A-wait-forked on rk3399-gru-kevin
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <6398848e.170a0220.f8e8e.d44f@mx.google.com>
 <Y5itf0+yNIQa6fU4@sirena.org.uk>
 <CAMuHMdW4RNFspMheq1JGUkCm+s1oM90Q_4vPH1XX9ZRAxrmPdA@mail.gmail.com>
 <ea3d5e98-8901-1f9c-b27d-3c65e7969c41@collabora.com>
 <CAMuHMdVGK=WDXqtJ_NgBJf_g=wQJ0V+dQ_b0RztafpxoRW=v5Q@mail.gmail.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <CAMuHMdVGK=WDXqtJ_NgBJf_g=wQJ0V+dQ_b0RztafpxoRW=v5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Brian Norris <briannorris@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 kernelci@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/12/2022 15:03, Geert Uytterhoeven wrote:
> Hi Guillaume,
> 
> On Wed, Dec 14, 2022 at 1:54 PM Guillaume Tucker
> <guillaume.tucker@collabora.com> wrote:
>> On 14/12/2022 11:06, Geert Uytterhoeven wrote:
>>> On Tue, Dec 13, 2022 at 5:58 PM Mark Brown <broonie@kernel.org> wrote:
>>>> On Tue, Dec 13, 2022 at 05:56:30AM -0800, KernelCI bot wrote:
>>>> The KernelCI bisection bot found regressions in at least two KMS tests
>>>> in the Renesas tree on rk3399-gru-kevin just after the Renesas tree
>>>> merged up mainline:
>>>>
>>>>    igt-kms-rockchip.kms_vblank.pipe-A-wait-forked
>>>>    igt-kms-rockchip.kms_vblank.pipe-A-query-busy
>>>>
>>>> which it bisected to ca871659ec16 ("drm/bridge: analogix_dp: Support
>>>> PSR-exit to disable transition").  I'm not *100%* sure I trust the
>>>> bisection but it sure is suspicous that two separate bisects for related
>>>> issues landed on the same commit.
>>>
>>> ... which is an old commit, added in v5.19-rc2, and which did not
>>> enter through the renesas tree at all?
>>
>> Do you mean this report shouldn't have been sent to you?
> 
> Exactly.

OK.

Mark, how did you get the list of recipients?

There's a command for this btw, which was used when the reports
were automatically sent to the recipients before we reverted to
manual filtering to reduce the noise:

$ ./kci_bisect get_recipients --kdir ~/src/linux --commit ca871659ec1606d33b1e76de8d4cf924cf627e34
To:
  Douglas Anderson <dianders@chromium.org>
  Brian Norris <briannorris@chromium.org>
  Sean Paul <seanpaul@chromium.org>
Cc:
  Miaoqian Lin <linmq006@gmail.com>
  Andrzej Hajda <a.hajda@samsung.com>
  Jonas Karlman <jonas@kwiboo.se>
  Daniel Vetter <daniel@ffwll.ch>
  Robert Foss <robert.foss@linaro.org>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Heiko Stuebner <heiko@sntech.de>
  Sasha Levin <sashal@kernel.org>
  linux-kernel@vger.kernel.org
  dri-devel@lists.freedesktop.org
  Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
  Neil Armstrong <narmstrong@baylibre.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  David Airlie <airlied@linux.ie>

As you can see, Geert is not listed there.

>> FYI The renesas tree got rebased and inherited a regression which
>> got bisected.
> 
> Renesas/master is (usually) never rebased.
> So when did this rebase happen, and why is it relevant?

Sorry then I guess it wasn't rebased but if mainline was merged
into the branch then it inherited the regressions from mainline
at that point.

>>  The same thing probably happened to other trees.
> 
> Indeed, I expect any tree that merged v5.19-rc2 or later to contain
> this regression.  That doesn't mean it's a good idea to tell all
> consumers of v5.19-rc2 and later they got a regression (and make it
> sound like the problem was introduced in their trees).

No, the issues aren't reported more than once.  And again, the
tree used to do the bisection is not relevant as what matters is
the commit that it found.

>> Yes it would be good to have 2nd order regressions based on a
>> reference branch (e.g. mainline in this case) in KernelCI but
> 
> Sorry, I don't know what is a "2nd order regression".

Regressions are basically a delta between results in a given
revision and the previous one on the same branch (new failures).
What I call "2nd order" regressions are a delta of these
regressions compared to another reference branch.  For example,
regressions that are in a particular tree and aren't also in
mainline such as the one at hand which isn't specific to renesas.

>> that's for next year.  Regardless, it found a commit and the
>> bisection looks legit.
> 
> Good. So please report it to the relevant parties.
> 
> While bisecting, as soon as you happen to arrive at a commit
> that is already upstream...
> 
>     > git bisect start
>     > # good: [997b2d66ff4e40ef6a5acf76452e8c21104416f7] Merge branch
> 'renesas-next' into renesas-devel
>     > git bisect good 997b2d66ff4e40ef6a5acf76452e8c21104416f7
>     > # bad: [710ce3a8a6fbfcd81d8ad361dc9d43c6a785f25e] Merge tag
> 'v6.1' into renesas-devel
>     > git bisect bad 710ce3a8a6fbfcd81d8ad361dc9d43c6a785f25e
>     > # bad: [044610f8e4155ec0374f7c8307b725b7d01d750c] Merge tag
> 'ata-6.0-rc2' of
> git://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata
>     > git bisect bad 044610f8e4155ec0374f7c8307b725b7d01d750c
> (which happens here  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^)
> 
> ... there is no point in "blaming" any of the bisection points before.
> 
> The git command to check this is (assumed "linus" is a remote pointing
> to Linus' tree):
> 
>     git branch -a --contains 044610f8e4155ec0374f7c8307b725b7d01d750c
> linus/master
> 
> You can use similar commands to find the maintainer's tree for commits
> that are in linux-next and in a for-next branch, but not yet upstream.

I think it won't be to implement this as soon as we start
tracking regressions specific to each tree since we'll have valid
good/bad revisions that are relevant to the tree in the first
place (if I understand correctly what you mean here).

Thanks,
Guillaume
