Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4823A501CB3
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 22:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D07710E2C6;
	Thu, 14 Apr 2022 20:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32B810E213
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 20:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1649968678;
 bh=TH68cw0yAw4HKgOCoqtJycb5tXT+WeVSIGdb/V6cqnM=;
 h=X-UI-Sender-Class:Date:To:From:Subject;
 b=HG2HrLo9wio3erouLzZqzWvMBuOTvscPAH9Pp8GufwN3okk2ropbPk9oMa4FBdnmm
 O52roUK1y8fZGeufB4KeSR2aLmDinBmeKd0KRdwCKwOL/RVoefua3eJneuwlayhS8M
 JQhVj20GV2rxtnzrW3MpDKV+Axy+8mxzpszA/0So=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.186.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MY6Cb-1nRCXI3s33-00YTHp; Thu, 14
 Apr 2022 22:37:57 +0200
Message-ID: <c79789fb-642d-ee9e-32a6-fc7f79d9e3b4@gmx.de>
Date: Thu, 14 Apr 2022 22:37:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Subject: dim question: How to revert patches?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:x7AtGWJ8s0hayBt82t4dnWEK8T5FkcGDljWjkJr7j7V/khYpk20
 vjcnRa6C/Ew+KXg+YEs3w13WNqWcDIB4gXy5BrvDLTmpxRyIvM460aaPGbNk7uax0lnRdeq
 p9eDlF8kaXIxV9iRQLK/FVaLDU4Naxz+Kkj8/Zpmgg/pbYs/ihZ+9mwk3EF9xkumziPDldW
 Gig2bo16wKKxto7mgZzDw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vxPYGa1rL/o=:bzsvcIf6yTTlGGKQXdGgii
 eVPZq2vZG02GwmXbKb8huQs2PNPR65WIA03z+/+bDYJ+9au4mWF0o+1YYYd9/mVVw03vNTp5G
 QuZIcXzwn5/cgc1UwepdIhXLYOFl2CHuBH5hlSdCwe38eoo7yGqA3/03XdmbSxHHg1WORbU/F
 V+/JiTVwfv5K/ZKQXMxyYFYfJgU4FEdwZ6hme8i33CYeNX9dFHJdwCZEE0Ch5CrrDXL2YGxw1
 ZXpMVyi17sRXsvlEl7HQst49SgluvHUvCgy++/9iWVWO//FkqXzEpECs0OxKt1Yj8mEk+xD8m
 fW8sjK9knFb6XEGvPu+R7pn/R3Smnq91wp08h/m1MhaUCXa/Yt7pJfE5RL5lZhp7UcfanMBA+
 QZvXuu3R4dvZs4rF4vhuSYFZie6tZZeFY9rXvOtWWQ9ODwmYdq+uiY0Q4VNTi3kNvoApB0Seu
 1aZ4vyI8nvpfO4GFAfrrqS09xu3jSmTezSVaF/9dHhA0O+oelLYXG8WzLgE/w46Rab52yaxwp
 51qGEpo3AU0ePV+prYyeDMMhPiY04S8J1+0gwxHiSVT1XyRXP4vtnzTpts8Ji6UBecEQsEIDT
 iBno73oTZxknFau33egRApKn6ou5PqoK7A6h+n1JBcpjXmNkKMWYzrJQuzObHIivCH4bvS0H0
 KzQtQSHC9fkhXLWbVhh8liWkMvKb9IP0r0RPrPl1JbY3V6dCAiG1csmKmPf66+0opo/u0ZU4Q
 aKN+HF+xDgpb8C+p6aPf0i4Hkf9YLcKSU6pNLxo3Mk7y9gAmQBgqqIxrkhIfDyxbmYjmFANQK
 EfHyFXd0Qsqj03k2sGsfDvEpYELnMorBik4YvLrn2o5krLID1bBCNrH1GcfogFmoPE+zC9zA0
 qVyyKpQcCN5H03GFfy8XSoMXnJR8IXW6SBev3KqVolZ+VjGcpqnuTr+rK6KiU+09jIAxS+7N2
 G2ruUJsn7mbhXy4yp8Fy60fb0wmiM4KGVbAxDIW6/XCxMO1v9lRPbSnEHBRPPoPkVSAbV4dgH
 N73FqwqySay96Dl34478XJSvTid01EyAO8tSDdyqbf4eR/9PmL3nUcAi4/uQrieJxbshYgZVo
 RZF+n9inN5Yw6w=
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

Hello dri-devel & dim users,

I committed this patch to the drm-misc-next branch:

commit d6cd978f7e6b6f6895f8d0c4ce6e5d2c8e979afe
    video: fbdev: fbmem: fix pointer reference to null device field

then I noticed that it was fixed already in another branch which led to th=
is error:

Merging drm-misc/drm-misc-next... dim:
dim: FAILURE: Could not merge drm-misc/drm-misc-next
dim: See the section "Resolving Conflicts when Rebuilding drm-tip"
dim: in the drm-tip.rst documentation for how to handle this situation.

I fixed it by reverting that patch above with this new commit in the drm-m=
isc-next branch:

commit cabfa2bbe617ddf0a0cc4d01f72b584dae4939ad (HEAD -> drm-misc-next, dr=
m-misc/for-linux-next, drm-misc/drm-misc-next)
Author: Helge Deller <deller@gmx.de>
    Revert "video: fbdev: fbmem: fix pointer reference to null device fiel=
d"

My question (as "dim" newbie):
Was that the right solution?
Is there a possibility to drop those two patches from the drm-misc-next br=
anch before it gets pushed upstream?

TIA,
Helge
