Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDC63BEC69
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 18:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96336E0CB;
	Wed,  7 Jul 2021 16:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 324 seconds by postgrey-1.36 at gabe;
 Wed, 07 Jul 2021 16:39:19 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29D96E150
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 16:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1625675958;
 bh=8mAyWsKkiUfu+lXYr++kx/mC3UJs7bAlIX5p6N4REPI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Nubxd40srAFJynsghJkzhMAKI/SGtFgreoiA9rswgBEZf1K+vnCc65czvntPvAmWY
 NXuqHYXrulSsfHdz5W/RuLrayNa19kfd9LZ/n/VuL7wq+4R2kXmHcQWp4XjMsTCOVO
 k0OFeEobnlRpj3U4coCA26wYbfuhKQO3kLn4MJbc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.74.52] ([80.245.74.52]) by web-mail.gmx.net
 (3c-app-gmx-bap38.server.lan [172.19.172.108]) (via HTTP); Wed, 7 Jul 2021
 18:33:44 +0200
MIME-Version: 1.0
Message-ID: <trinity-367176f1-e245-430c-9dd8-cfde43635714-1625675624216@3c-app-gmx-bap38>
From: Frank Wunderlich <frank-w@public-files.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Aw: Re: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 7 Jul 2021 18:33:44 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAAOTY__5H_0QfDs5RZ5eq193f1tTLJ3D6D+jyPA5nW_xtSrt6g@mail.gmail.com>
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
 <YOQ8ktv1MypezrEy@phenom.ffwll.local>
 <trinity-9886112a-f7f2-4ae8-8e09-39c73c04b751-1625571632221@3c-app-gmx-bs60>
 <CAAOTY__5H_0QfDs5RZ5eq193f1tTLJ3D6D+jyPA5nW_xtSrt6g@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Xl9I5gidymKofQQvCNU8bnJD8rC6N4iGEajW/yAm23Z2qh+FEutrr5F9hst8O+r+0Ee+E
 s/k4dtdUUXaM9JuxaPdYZBkvNDhp+6nJrk/L37F/bQwFPLXQ3AIc47DNQMXfMeZKc1hp8SKAO9r4
 APhgJNXZJD7dQdmNlf10YcnbL3Apll/5CPMKjv+vEEfFiisSsJTYaLo4b4s4BKbp2elm4bYnIFjl
 iL3z3QjxSb6yatxafYZnqSvIQfRjZGlkcNIiM8/nCJz1GxbsKMhoX8jA3qM43kR+Tnjl88BPX5kf
 l8=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ha5nEiEd/Qc=:FRDbbMuNnso4CV51YjiV+K
 A2ESI1Sadu+zODGmo0qMmGk/2GXh8KYf7JI9b+79Rf73WozFQMn3xMle4E8dSBL1qMQx1Iflf
 3YTgknW53e8b1o0EqU8EgxgGszw6kV11rTiRBFL+fpLDBX6uQqWuLKpINXH98AOQcUaHRYszE
 p5KKy/REW9NTuHcirEIFR/emCMiCpNRWA0QBhEL3rwUwDc0zxPawRI0Q/AAf/kv6Zqttw86vv
 gPVkbIHpDeLOpkSt4fuVP0/Cx+wdx2wXkNYknEUKwjPQTRc9Yu74hws6f0vyct9UBzhxZEvFi
 FBBzeGg902vNbtDNl/JvDcnHlLmPa3AH4SWBaiVLdasBQbMQaX+vNS0soXAX6huZ9zyPv47Pr
 wdwEFHin/syl53HGtJh0UKhJ8djpb4sz9iSV0I8RFD3ewmBU/n9eFlX1VT5o00xL40NJLX6Ki
 iJUxwJpPgU08ZTTbedj3m6veYFMjZbljukzM0y4U1torqKBd5EwjTQ9p1Qd+4auieQHv9n9/U
 Msac4dqIA4P1tKGQy536rdEDWgN4+fBOScxdE71OTO7SyCIicyIqzWQaR96ECKfRb7wr33RN4
 9IXmC9gCMxpi3VPudjo81Wed+zhbUaRslyVn4MZJ9PSEAGkwLPkMMrMV3QSuoIoIZX/dNcd5G
 VaLwRyG787cFc+lQNtdVneD/F3/vXyHBSlqx0VdSYuZn6e0Nteca1bHIicFWAbtVmZ5r+5tjq
 FleyutYcElfUCz3qjcTP+orntx915Dpxq/yFYBOOniO/yZqXy8kQoBinJeg7ddkz1gvd5Xtqu
 gTEGP8ntE7AOoB4jvKBFRSircqxE5S1GUHlQNnAXcIQaTJRn2Q=
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> Gesendet: Mittwoch, 07. Juli 2021 um 17:03 Uhr
> Von: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>

> I think you have done many experiment [1] and you bisect between
> 2e4773915223 (good) and be18cd1fcae2 (bad), and you are confused by
> merge commit.
> You may refer to [2] and it may help you to understand git bisect.

thanks for confirming the strange behaviour is caused by merge-commit. that was i'm thinking about...if the merge-commit is not in actual bisect "tree" then all commits linked to it disappear. basicly i understand bisect (binary search - checkout a commit by splitting commits in 2 halfes and then splitting the bad half again and again till only 1 commit is detected).

Imho the simplest solution may be flatten the tree (at least from good..HEAD) by rebasing, right?

tried simple rebasing (from 5.12-rc2 sha1 ~17823 commits), but failed somewhere in usb-subsystem ;(

i guess this happens if changes made in mergecommit...also tried with --rebase-merges and --preserve-merges but all do not make the history complete flat without conflicts

set the merge itself as good is not a solution, as there are many merges and in one is the breaking commit

other examples in your link do not change current history, only give tips for merging without these merge-commits

i have git v2.25.1

btw. i have done many more experiments as public visible, reverting commits that may break (many i can't revert as they have depencies-code changed in same block after the commit to be reverted - e.g.) by reading commit-message, and adding some debug-messages in the drm_atomic_helper.c (drm_atomic_helper_wait_for_vblanks,drm_atomic_helper_wait_for_flip_done where the WARN() is done), but i have not yet nailed down the issue

> [1] http://forum.banana-pi.org/t/bpi-r2-hdmi-4k-tv-fail/12307/4
> [2] https://stackoverflow.com/questions/17267816/git-bisect-with-merged-commits

