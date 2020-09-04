Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 636D525E4B6
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 02:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90656ED14;
	Sat,  5 Sep 2020 00:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F516EC01
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 14:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1599231010;
 bh=ODT7HpTlapjg5CzOuoOTo8SJPHHlMe4W9upOfVEYdWw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=f39O04PVwAFnb1Bob0H9dxvF/DnWuFN1q8xkj+8Wkh0b3eMeMngyTGLEW3+oTejQg
 MJ3TkykQJWhSDpzkVXQW0g5ApKk4ezdT6ExBgXaWrsr6pbTAVNH7NEYNHFUM0P7it5
 JTkTAN0GpTM6Nm+K36BBBBTrZGjqFf3rD+o3YrRc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.147.193] ([217.61.147.193]) by web-mail.gmx.net
 (3c-app-gmx-bs07.server.lan [172.19.170.56]) (via HTTP); Fri, 4 Sep 2020
 16:50:10 +0200
MIME-Version: 1.0
Message-ID: <trinity-3825f323-0deb-4f60-8cd5-b673f02e7115-1599231010390@3c-app-gmx-bs07>
From: Frank Wunderlich <frank-w@public-files.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Aw: Re: [PATCH v5 0/4] Move Mediatek HDMI PHY driver from DRM
 folder to PHY folder
Date: Fri, 4 Sep 2020 16:50:10 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAAOTY_9ELMBK7zPeeBQ39QjJ9g4PsOhpHXsTBHgcq=kNk8bRxA@mail.gmail.com>
References: <20200823014830.15962-1-chunkuang.hu@kernel.org>
 <CAAOTY_9ELMBK7zPeeBQ39QjJ9g4PsOhpHXsTBHgcq=kNk8bRxA@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:KpMzbqOqM5q/mCTt5CedCNkbKG9MoqFurTCaE2fv8zT3Jk8FbuztfGPNDkS8ZIUwmmNrm
 swZAg1L3OfhnPQLicSZu+5aaVonS5O/nItBgBB+usLTMycfJOW18FzbM9RCje9Utso/6tA7juSxI
 T+0UDN8w7zuiLir2AEBDU/V/PyIYpPu3JDa8M4RmPcYKcvaWqYGqq7Iu+HFPnUVzoeijhQxaybZc
 AMXQYTBxTNsOVIb3mLGWVjy+BnELcjsMLl9ZLG6WQ2BCNSwAuct87WWOTrTWN8/iqJaKhoG8Af95
 mA=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VovrIiqRHMg=:Jf4VyMXmDkJ+Zb8YSms9vv
 FCrWc5umJho7FI4+1cf+y4MkTyHPeK9QYyuN7q3Vc6bvRqvQJpQ0AIRf5w+4cM+ciAVhTLVm0
 jv4fZraZIrhEfLcT0+tE4uOcmCPUv7oC8Go45FvNBPawdjk1cvmgvdPi7HcuC/zS3fCp79vcd
 Q2xFhBf/HavzeTGMP4DaktTl0u3GWR4/TuoDFqJAHgaG6xeA7t+wFSqgfSVQkr4kf+s/6chqn
 M8955iV3ALgndLhlmpvmpMeC6IkhfsEHRUyHcCfo9HfWu8Mf9H2xPSXmJVvxjKv04O+/mfFGR
 iTH0B20dGcRhoR56ALdMmFuJXko8ep+rToBM/zQ+oBkBTy4pbwvWtt4Ij5l5f3BgZp9Jzolsa
 NC2hzqkWuQe531EI+ywftwXEQPdOJZKMrcKphP0Skj3/mlmRnMrN+1omDa3C2+uH12q6N8aK8
 nUk51rS91dFnlZ4bpcGla3NgeHtlHjsce0g301aFlGLgn/ZO/adBslpNvePYTYxr+GFQSQxmv
 z0aClCGUeev3OzvKfrP2Uhly3k59YYgbEbO/GBrdBOLcwRCeP/VK3ZHxgDT/wwa16BP2Usu4V
 /2yTNLYrITX3cp0Ik+adt7qJ1ZZubfkUsQuHVK5i5XQjbZX4JACo0nWVYGmMed+isUIO7YPdz
 BO/iB7sHSYz3sqvMpJVDrcPEcvjfRlRFDYqo105/4RpGQYt6SSy8yA1FjzQ38nQcnj2Y=
X-Mailman-Approved-At: Sat, 05 Sep 2020 00:35:27 +0000
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
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tested-By: Frank Wunderlich <frank-w@public-files.de>

regards Frank
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
