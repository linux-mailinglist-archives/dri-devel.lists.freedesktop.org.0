Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 808947971E0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 13:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE2B10E074;
	Thu,  7 Sep 2023 11:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2470510E19C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 11:40:08 +0000 (UTC)
Received: from [100.126.43.34] (fooishbar.org [176.58.101.62])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: daniels)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9191A6607303;
 Thu,  7 Sep 2023 12:40:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694086806;
 bh=x7HmtDk+/L753kx6qpsqNqd9JfrlYkvhjpKDB4v0o3c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VLmN0SF/LLpdCPr1G0Ibp2FEoaOVF19k5YefjGDuziOHGFNwwbZFk8fMTlInzwtEr
 qCVv5V09tVupfFpgYIXCE2Oi9J3a2E21gdIT2MLR5BB6gSHXUPkn8laGzk2hj0VdWn
 nIW89OkP9Th2PNol0U7Ob93GDqOTF2l8vBs/wqnWfhQDUc9Taiv0dkycu0qYwmynq+
 7JVIaARIbQX1bPe4h7bxH0iyVIeFeEBINAMhFtFOU619IdM9OW1so+s1X3g32Ptd5d
 mxzEnmAMZGjAp3sfxgfJBqN60iBixl3ohnBYi3a4nE9cidbR7CP61qMIqbRFkOXWAl
 upKAuATZbxFWA==
Message-ID: <9a2b1ad8-4359-4f12-b4f9-c1de477bc440@collabora.com>
Date: Thu, 7 Sep 2023 13:40:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11] drm: Add initial ci/ subdirectory
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Helen Koike <helen.koike@collabora.com>
References: <20230811171953.176431-1-helen.koike@collabora.com>
 <ZOTFfhtzzWkrQ23Y@phenom.ffwll.local>
 <zorvxwffshrsqx5cy76pe3gn52qrqav7qusz5acav2un2ydvwr@fwjd56qg2xve>
 <87bkeo23vs.fsf@intel.com>
 <4rpsqk4tgrdcxtxtfoum6o4oyglwkirmkh3jj4y5tays2ivb5p@uwqdf3snshkv>
 <25df6189-7b0a-b13d-e93d-c2a388fd45e3@collabora.com>
 <zmq7pz7rtz6h765azg5kl2qgjd264yafctx4q474t5tqai57og@cajbcub4yuwr>
 <5fdf9d29-3f8d-0ee0-027f-57ff3a5cecb8@collabora.com>
 <CAKMK7uGg6n322UugJwErqF_Dvsbqceqae6SVWV3ZWEOR7x36rQ@mail.gmail.com>
From: Daniel Stone <daniels@collabora.com>
In-Reply-To: <CAKMK7uGg6n322UugJwErqF_Dvsbqceqae6SVWV3ZWEOR7x36rQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: emma@anholt.net, linux-doc@vger.kernel.org, vignesh.raman@collabora.com,
 dri-devel@lists.freedesktop.org, alyssa@rosenzweig.io, jbrunet@baylibre.com,
 robdclark@google.com, corbet@lwn.net, khilman@baylibre.com,
 sergi.blanch.torne@collabora.com, david.heidelberg@collabora.com,
 linux-rockchip@lists.infradead.org, martin.blumenstingl@googlemail.com,
 robclark@freedesktop.org, anholt@google.com,
 linux-mediatek@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
 gustavo.padovan@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
 guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 04/09/2023 09:54, Daniel Vetter wrote:
> On Wed, 30 Aug 2023 at 17:14, Helen Koike <helen.koike@collabora.com>  > wrote: >> >> On 30/08/2023 11:57, Maxime Ripard wrote: >>> >>> I 
agree that we need a baseline, but that baseline should be >>> defined 
by the tests own merits, not their outcome on a >>> particular platform. 
 >>> >>> In other words, I want all drivers to follow that baseline, and 
 >>> if they don't it's a bug we should fix, and we should be vocal >>> 
about it. We shouldn't ignore the test because it's broken. >>> >>> 
Going back to the example I used previously, >>> 
kms_hdmi_inject@inject-4k shouldn't fail on mt8173, ever. That's >>> a 
bug. Ignoring it and reporting that "all tests are good" isn't >>> ok. 
There's something wrong with that driver and we should fix >>> it. >>> 
 >>> Or at the very least, explain in much details what is the >>> 
breakage, how we noticed it, why we can't fix it, and how to >>> 
reproduce it. >>> >>> Because in its current state, there's no chance 
we'll ever go >>> over that test list and remove some of them. Or even 
know if, if >>> we ever fix a bug somewhere, we should remove a flaky or 
failing >>> test. >>> >>> [...] >>> >>>> we need to have a clear view 
about which tests are not >>>> corresponding to it, so we can start 
fixing. First we need to >>>> be aware of the issues so we can start 
fixing them, otherwise >>>> we will stay in the "no tests no failures" 
ground :) >>> >>> I think we have somewhat contradicting goals. You want 
to make >>> regression testing, so whatever test used to work in the 
past >>> should keep working. That's fine, but it's different from >>> 
"expectations about what the DRM drivers are supposed to pass in >>> the 
IGT test suite" which is about validation, ie "all KMS >>> drivers must 
behave this way". >> >> [...] >> >> >> We could have some policy: if you 
want to enable a certain device >> in the CI, you need to make sure it 
passes all tests first to force >> people to go fix the issues, but 
maybe it would be a big barrier. >> >> I'm afraid that, if a test fail 
(and it is a clear bug), people >> would just say "work for most of the 
cases, this is not a priority >> to fix" and just start ignoring the CI, 
this is why I think >> regression tests is a good way to start with. > > 
I think eventually we need to get to both goals, but currently > driver 
and test quality just isn't remotely there. > > I think a good approach 
would be if CI work focuses on the pure sw > tests first, so kunit and 
running igt against vgem/vkms. And then we > could use that to polish a 
set of must-pass igt testcases, which > also drivers in general are 
supposed to pass. Plus ideally weed out > the bad igts that aren't 
reliable enough or have bad assumptions. > > For hardware I think it 
will take a very long time until we get to a > point where CI can work 
without a test result list, we're nowhere > close to that. But for 
virtual driver this really should be > achievable, albeit with a huge 
amount of effort required to get > there I think.
Yeah, this is what our experience with Mesa (in particular) has taught us.

Having 100% of the tests pass 100% of the time on 100% of the platforms 
is a great goal that everyone should aim for. But it will also never happen.

Firstly, we're just not there yet today. Every single GPU-side DRM 
driver has userspace-triggerable faults which cause occasional errors in 
GL/Vulkan tests. Every single one. We deal with these in Mesa by 
retrying; if we didn't retry, across the breadth of hardware we test, 
I'd expect 99% of should-succeed merges to fail because of these 
intermittent bugs in the DRM drivers. We don't have the same figure for 
KMS - because we don't test it - but I'd be willing to bet no driver is 
100% if you run tests often enough.

Secondly, we will never be there. If we could pause for five years and 
sit down making all the current usecases for all the current hardware on 
the current kernel run perfectly, we'd probably get there. But we can't: 
there's new hardware, new userspace, and hundreds of new kernel trees. 
Even without the first two, what happens when the Arm SMMU maintainers 
(choosing a random target to pick on, sorry Robin) introduce subtle 
breakage which makes a lot of tests fail some of the time? Do we refuse 
to backmerge Linus into DRM until it's fixed, or do we disable all 
testing on Arm until it's fixed? When we've done that, what happens when 
we re-enable testing, and discover that a bunch of tests get broken 
because we haven't been testing?

Thirdly, hardware is capricious. 'This board doesn't make it to u-boot' 
is a clear infrastructure error, but if you test at sufficient scale, 
cold solder or failing caps surface way more often than you might think. 
And you can't really pick those out by any other means than running at 
scale, dealing with non-binary results, and looking at the trends over 
time. (Again this is something we do in Mesa - we graph test failures 
per DUT, look for outliers, and pull DUTs out of the rotation when 
they're clearly defective. But that only works if you actually run 
enough tests on them in the first place to discover trends - if you stop 
at the first failed test, it's impossible to tell the difference between 
'infuriatingly infrequent kernel/test bug?' and 'cracked main board 
maybe?'.)

What we do know is that we _can_ classify tests four ways in 
expectations. Always-passing tests should always pass. Always-failing 
tests should always fail (and update the expectations if you make them 
pass). Flaking tests work often enough that they'll always pass if you 
run them a couple/few times, but fail often enough that you can't rely 
on them. Then you just skip tests which exhibit catastrophic failure 
i.e. local DoS which affects the whole test suite.

By keeping those sets of expectations, we've been able to keep Mesa 
pretty clear of regressions, whilst having a very clear set of things 
that should be fixed to point to. It would be great if those set of 
things were zero, but it just isn't. Having that is far better than the 
two alternatives: either not testing at all (obviously bad), or having 
the test always be red so it's always ignored (might as well just not test).


Cheers,

Daniel


