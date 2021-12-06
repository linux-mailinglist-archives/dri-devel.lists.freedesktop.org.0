Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB9546A4E4
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 19:47:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22F56E532;
	Mon,  6 Dec 2021 18:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 587 seconds by postgrey-1.36 at gabe;
 Mon, 06 Dec 2021 18:47:35 UTC
Received: from mr85p00im-zteg06021901.me.com (mr85p00im-zteg06021901.me.com
 [17.58.23.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465156E532
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 18:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1638815868; bh=sqvjzgCXRetKbkjTCZ/X/6rGpI021b8PMdhVmZzAFGc=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=rlATcOG7JcsaTfLaye6D4zGMCGyqQxH0uuN7K6yOwCexx3GsUmQGU3vLz2l4eWamx
 im6veWMrHVjJ38/oosW4ACqNyCRqNi8us/IO4QoPZga6K9S4s9ymg3Y2mQ6EgAPnmX
 Dd0fV74kpUx7g/GLfxcRbOwDyZ8/nHqKVSAnWesXbc1nuCYG8Y6+x1b0JtKx2OHrO5
 apKo7+mD65JMAjCckNXZnwTl9iCu/mYiu/yeO4nZQwzZ4K721/iKe+RvGf18SEj64g
 EHbfZp08tG3dkHlaV7/EjJ02YnF7v7zgllcDzya3EaYVCN0CZzgCsg8+gSURLUh595
 y0mX0/FSuf2Kw==
Received: from hitch.danm.net (c-73-98-236-45.hsd1.ut.comcast.net
 [73.98.236.45])
 by mr85p00im-zteg06021901.me.com (Postfix) with ESMTPSA id 6756B7200D2;
 Mon,  6 Dec 2021 18:37:47 +0000 (UTC)
From: Dan Moulding <dmoulding@me.com>
To: regressions@leemhuis.info
Subject: Re: [Nouveau] Regression in 5.15 in nouveau
Date: Mon,  6 Dec 2021 11:37:21 -0700
Message-Id: <20211206183721.6495-1-dmoulding@me.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <5dafba25-5424-3fe2-5046-ae1d4320f9c1@leemhuis.info>
References: <5dafba25-5424-3fe2-5046-ae1d4320f9c1@leemhuis.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.790,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-12-06=5F07:2021-12-06=5F02,2021-12-06=5F07,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 phishscore=0
 clxscore=1011 adultscore=0 spamscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2112060111
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
Cc: regressions@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com, sf@sfritsch.de,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04.12.21 17:40, Stefan Fritsch wrote:
> Hi,
> 
> when updating from 5.14 to 5.15 on a system with NVIDIA GP108 [GeForce
> GT 1030] (NV138) and Ryzen 9 3900XT using kde/plasma on X (not wayland),
> there is a regression: There is now some annoying black flickering in
> some applications, for example thunderbird, firefox, or mpv. It mostly
> happens when scrolling or when playing video. Only the window of the
> application flickers, not the whole screen. But the flickering is not
> limited to the scrolled area: for example in firefox the url and
> bookmark bars flicker, too, not only the web site. I have bisected the
> issue to this commit:
> 
> commit 3e1ad79bf66165bdb2baca3989f9227939241f11 (HEAD)

I have been experiencing this same issue since switching to 5.15. I
can confirm that reverting the above mentioned commit fixes the issue
for me. I'm on GP104 hardware (GeForce GTX 1070), also running KDE
Plasma on X.

Cheers,

-- Dan
