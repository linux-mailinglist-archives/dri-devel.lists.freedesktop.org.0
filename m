Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 860563BD72B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 14:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D796E499;
	Tue,  6 Jul 2021 12:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 6360 seconds by postgrey-1.36 at gabe;
 Tue, 06 Jul 2021 11:40:50 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EEB6E3B7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 11:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1625571632;
 bh=nqG/g6YoDQ3Cr6IxntXpO3+qXORMb4BY7rzWo7WkW9o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=haLyWBq6yDhdsV/Q8xdjm6fBgWn/t3ksynspjmENMTeuHGb5Uzwo5j4RPF5mHfNxS
 4au58c6cmTHlmIHRvOFUA2DF2oC6diDlxOmUw815274B0GEwkCEfDQ7CNP7oxfwcLF
 yUOrNteHuAfno2sJCoD+AHJEXY5Or3zO+j4+2S+s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.79.159] ([80.245.79.159]) by web-mail.gmx.net
 (3c-app-gmx-bs60.server.lan [172.19.170.144]) (via HTTP); Tue, 6 Jul 2021
 13:40:32 +0200
MIME-Version: 1.0
Message-ID: <trinity-9886112a-f7f2-4ae8-8e09-39c73c04b751-1625571632221@3c-app-gmx-bs60>
From: Frank Wunderlich <frank-w@public-files.de>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Aw: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 6 Jul 2021 13:40:32 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <YOQ8ktv1MypezrEy@phenom.ffwll.local>
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
 <YOQ8ktv1MypezrEy@phenom.ffwll.local>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:yBMlpo5tuOYEw1oNXBnbTgKo35sOzSkMHe7TQ5KITpGJHZSzeG9nbJyWqN2crVp5Kun95
 iDAZMR3ksjB1FOOG7jTfcLf2PaLG1r6mMQMqkehqP2CmMQbypxlhiBAwNna1RC/fIrUGVfmmZYvc
 zEzmMQBMXJXAWobQC6V1eQpx59exnwB5OMMzFJ3N3QLLW/+hTgPs/UYWD7mtNztam/U08x6AIagq
 HCpD+dagdZSWrcnGhkqrnlsU4vBFCRZ6prJO7Hk+giFEg5QPyvXu1bgWzuwuty9dWNhsXRUoQI4y
 0E=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tYmr9KS/Xi4=:y+LSVYu6FHQ3Uj/c1nBL+0
 i8gmTBwUqt5qT7+JHRE7g48bjKq4nN7bmgyoCGu2qai3m8b3eMdWYicjKYAXUJhTVdkOjZMzF
 n/XVeOQYbf6Xi4shHYCpKoeQicTBip0oU/vvdgOBj+qRNvhM+F7DqVsjVGmbzD1VCjUdRikjg
 EFa2Gbz4JoqVTO5U/xSXUdsVZZF46QHLYJVHQSAGVpyDaBNdLBLe+jkwrbXJfpSV07ZRtatvp
 FHcCc3XwHAHDROi7lmggHYN89uMUGLRF/D5YlHOrpNHXWMgWGmLAAhxvwbDkchS+XNxKZoha+
 IET89GuVOzwf/w61ak2Ldq1SkLOHo54xjBHg6qWSbw5pBEgfjjZncfCs7teotZy2Ie/zjO5M/
 AxZb8glCxYn2KxXf48PwExuqTrV321lL7ClIJoLblTodnxy/Cw27RSXwgcJViDnDOLXO880Uu
 m5pGw16Cf16PNxN0VYELg1NBxmxZN7BYKGoaiFYLHfstql7RSKPCHFo+YJB30Daw5d3u6Vsu5
 ZZj4XMmoWZ7KlA4jJFOnzTBPCPnL7TELmT4/hRuUBUDC8zN2AosOHR0lmDQvvK8ccFvRCgM/U
 IPEdkHcdURy8GpKiNNk6z+X9Y2aF4FkRIY5lYNFsfWeMOhyQyQ9wDESeTXyZmFucY5O4NN9ZY
 TK20+pICP6TubkS/8F8B7Pq7S1i7P7GK2Rs4WLf2RWAoXMcv//VEsauGJg+3dMQ8iQ+jnlEmk
 svZDS2u8DSRVlFaRmPADBcMuB0o/CAbo0KgzxFyvRgdARMIdIFdFrG1CWOzzRmGY/i/t7TGMQ
 wGaGG+c7MnRvi/4L+6MWwstbuvttKHjplmetsHuLFydHMUKqL4=
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 06 Jul 2021 12:50:24 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel

> Gesendet: Dienstag, 06. Juli 2021 um 13:20 Uhr
> Von: "Daniel Vetter" <daniel@ffwll.ch>
> An: "Frank Wunderlich" <frank-w@public-files.de>
> Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Rip=
ard" <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Dav=
id Airlie" <airlied@linux.ie>, "Daniel Vetter" <daniel@ffwll.ch>, dri-deve=
l@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Chun-Kuang Hu" <ch=
unkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, linux-me=
diatek@lists.infradead.org, "Matthias Brugger" <matthias.bgg@gmail.com>
> Betreff: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
>
> On Tue, Jul 06, 2021 at 11:54:39AM +0200, Frank Wunderlich wrote:
> > Hi,
> >
> > i've noticed that HDMI is broken at least on my board (Bananapi-r2,mt7=
623) on 5.13.
> >
> > after some research i noticed that it is working till
> >
> > commit 2e477391522354e763aa62ee3e281c1ad9e8eb1b
> > Author: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > Date:   Tue Mar 30 13:09:02 2021 +0200
> >
> >     drm/mediatek: Don't support hdmi connector creation
> >
> >
> > which is the last of mtk-drm-next-5.13 [1] so i guess a problem with c=
ore-patches
> >
> > dmesg shows the following:
> >
> > [    7.071342] mediatek-drm mediatek-drm.1.auto: bound 14007000.ovl (o=
ps mtk_dis
> > p_ovl_component_ops)
> > [    7.080330] mediatek-drm mediatek-drm.1.auto: bound 14008000.rdma (=
ops mtk_di
> > sp_rdma_component_ops)
> > [    7.089429] mediatek-drm mediatek-drm.1.auto: bound 1400b000.color =
(ops mtk_d
> > isp_color_component_ops)
> > [    7.098689] mediatek-drm mediatek-drm.1.auto: bound 14012000.rdma (=
ops mtk_di
> > sp_rdma_component_ops)
> > [    7.107814] mediatek-drm mediatek-drm.1.auto: bound 14014000.dpi (o=
ps mtk_dpi
> > _component_ops)
> > [    7.116338] mediatek-drm mediatek-drm.1.auto: Not creating crtc 1 b=
ecause com
> > ponent 9 is disabled or missing
> > ....
> > [   38.403957] Console: switching to colour frame buffer device 160x64
> > [   48.516398] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
> > [   48.516422] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [=
CRTC:41:cr
> > tc-0] commit wait timed out
> > [   58.756384] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
> > [   58.756399] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [=
CONNECTOR:
> > 32:HDMI-A-1] commit wait timed out
> > [   68.996384] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
> > [   68.996399] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [=
PLANE:33:p
> > lane-0] commit wait timed out
> > [   68.996423] [drm:mtk_drm_crtc_atomic_begin] *ERROR* new event while=
 there is
> > still a pending event
> > [   69.106385] ------------[ cut here ]------------
> > [   69.106392] WARNING: CPU: 2 PID: 7 at drivers/gpu/drm/drm_atomic_he=
lper.c:151
> > 1 drm_atomic_helper_wait_for_vblanks.part.0+0x2a0/0x2a8
> > [   69.106414] [CRTC:41:crtc-0] vblank wait timed out
> >
> > so i guess the breaking commit may be this:
> >
> > $ git logone -S"drm_crtc_commit_wait" -- drivers/gpu/drm/
> > b99c2c95412c 2021-01-11 drm: Introduce a drm_crtc_commit_wait helper
> >
> > in drivers/gpu/drm/drm_atomic{,_helper}.c
> >
> > but i cannot confirm it because my git bisect does strange things (aft=
er
> > defining 5.13 as bad and the 2e4773915223 as good, second step is befo=
re
> > the good commit till the end, last steps are 5.11...). sorry, i'm stil=
l
> > new to bisect.
>
> drm history runs in parallel with the main tree, so occasionally the
> version that's reported as baseline is confusing and older than what you
> might expect. Just trust git bisect, it's doing the right thing, and mak=
e
> sure you test exactly the kernel you're supposed to test. Compiling with
> CONFIG_LOCALVERSION_AUTO helps a lot to make sure you're really booting
> into the right sha1.

my build-script adds sha1 to filename (for tftp-usage) and kernelinfo (una=
me -a)

> > the fix is targeting to 5.12-rc2, is guess because CK Hu's tree is bas=
ed
> > on this...but the fix was not included in 5.12-rc2 (only after
> > 5.12.0...got it by merging 5.12.14)
>
> Yeah that can also happen because of all the non-linear trees involved i=
n
> linux development.

how to find the real breaking commit?

> > maybe you can help me?
>
> So now I'm confused, you're talking about a fix, or is it still broken i=
n
> latest upstream?
> -Daniel

it is still broken, as i did not found the root cause...only a guess based=
 on errors in dmesg...git bisect points me afair to mt76 wifi-driver which=
 is completely unrelated...as i said, the fix i defined as "last good" was=
 no more there after 2nd bisect step.

The fix i set as last good was fixing 5.12 issue (handling connector/creat=
ing bridge without it), but 5.13 has a new one (atomic timeout,drivers/gpu=
/drm/drm_atomic{,_helper}.c) which i cannot trace to the breaking commit.

regards Frank
