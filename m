Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E84993FF7
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 09:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5207C10E0F3;
	Tue,  8 Oct 2024 07:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="odOyKlTR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E5010E0F3
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 07:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1728374126; x=1728978926; i=markus.elfring@web.de;
 bh=8Szi+NG/IKhAcW5Tw0m4LYzQmYTj7dnRcqmrIO8ay+A=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=odOyKlTRlH565CzAMZgEzHLtLrROr15gBYBMSHyTvrZOeNKecQZPtIACbEEu16v9
 FnIn6FPHtsJQVMOhhfv8ulM9gposJDykX40G9Wot1GMvllksKaUjCnePqfadksMDy
 3m71Ss/GleMPrlCANJ8ARIHROH6L+bEOvsJrHw/B35FUDrklA8MeR81eRv0DObMDB
 glI5Gq2JI6ePnVp4L3/Prxv6kXXi7KQAOaQUQ//x6CL5QMO372MjloKie40Iy0PMK
 3sbZ1IGGyp1yIbGVgq/DSOcBrWa80Cs6BIRuljKKJpx7MAKmgc4VmatFYRHqm/5Ph
 N9npniBj2UGK/f1/sA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N4621-1txi5n08qf-011gWh; Tue, 08
 Oct 2024 09:55:26 +0200
Message-ID: <a95532b6-381b-4b06-8f4e-9b3a6c727a60@web.de>
Date: Tue, 8 Oct 2024 09:55:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Adam Thiede <me@adamthiede.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>
References: <20241008064716.14670-2-jason-jh.lin@mediatek.com>
Subject: Re: [PATCH v10 1/5] drm/mediatek: ovl: Fix XRGB format breakage for
 blend_modes unsupported SoCs
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241008064716.14670-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bnnmry2eeH2ia82fZczbeiYSu7yQyuShiVcy/uwC9bQlbqQ3z3t
 SsiKn9mg7MOJPMDxmH/fY6itZ2HMmTmz8TBuY2VxpcF3wtRA9acBC+H12X96BHUBe0gMMKh
 AZHJjVZX8ZY3uZ+3Wbu5uydu4o4Oi6nvgFeyHKpQtgKaozaEhp0Mc9Uk5HvIQcO5tf1TPNU
 R86XZ/FytJnjg8APfhCPg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FoFlhXqQj7A=;UI1YScYjOSeNgHKN6GhiDPyLXHk
 fjqGDBqWbczkJtzQ+kyRGtBKldIOvUBenD+aOo6nOXGWZRgECBh2i47JqHKtujjIh1IfyyYyg
 Z+0oLankC+wBAsnASeDiE4vtkWIWbE/4ShPv+9G6eYjrHiesz+yHsDrOQZqD4kP56I3Vm24q9
 3JOPjtRWEnCBSQBcgOe7LlfUNdlnQiNp9jO3k1oY8ViD8ZZbVtEaGeqCaqld1JZclbv9TEOHH
 17n9rcccTLXcJFevA6mHRMSWkLWVb+q9nEwlzpOSVl3ftSBwGN/NIySXRtSN3QSgcICCAtzm1
 hjr8ODzwPJtQWT9qtbWRQBByGFYsJw2BNT8ChdzrZqYMgUFqnsghhWKsexMeGRJgf423NklR0
 vNLqRD7bOwxF62ZxMmSqvvllJLFXzbdHsHAtjwhAz8Be8te5rPqNyQKLqyK48RfeSzO8sLQo2
 at5Lnk8x545VgNG6JPDDF/190XD6EwLzug9Wgaw8zkKxblL+ExhYtsp3QkRk4brkOGNvMs61d
 hO9SszOFJ5ZISmJfcAo5MgZ0NesCr3T+iizXe0oTH6sV5Ebj1wbnmMqFInm1fv4Mpanyl0IqS
 9o4Q8G/9/4krhmX3KQ6FaH+IQG3p84X+wA17gUgTuYSXT0kRCTe4YPDtoYG0YHBZV8R7nsUQJ
 XWMdi36/eHlfy2Qqt25iOkd+Z3MN4UhifRIzuwLgNdLmqTBcLLpOp7IRIr6Xexrmcu7YPTjsX
 GC7ACFsPJ66QFV7ZdsvCHQqIZz0UzrJQcWCQT0hb6JG/78VV0OoukllJT7D/mUw4bYk3ZqVft
 Ba2SKSIXVldU07wNj5mNBmzg==
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

=E2=80=A6
> Note that ignore pixel alpha bit is not supported if the SoC is not
> supported the blend_modes.

  supporting the blending modes?


> So it will break the original setting of XRGB8888 foramt for the

                                                    format?


> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Would a personal name without a dot be preferred
according to the Developer's Certificate of Origin?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.12-rc2#n396

Regards,
Markus
