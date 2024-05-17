Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DF48C8C3A
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 20:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FF710EF51;
	Fri, 17 May 2024 18:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="AfR0tT/j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4559810E338
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 18:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1715970653; x=1716575453; i=markus.elfring@web.de;
 bh=fB7RALjxdRF1G/aDESbEsQC4h5dPoGC+cUZHy0syvLs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=AfR0tT/jPoCyn+cHq91Ed0Lm5rF1tWGof+FhwozSIakYaT6l9p+ZXDbGMI2P1FC1
 rLEAPjN79daag3Bw2ZbRXiAQJhO6sY57PGJmlondaBPs3w+q3+MYxoYRFmTbq0+se
 EwdYURlcwjIsxtOYIDpyFglh//dGC31UiJV6Z5QiQMj1LxN85roWz/QHKjW9EZCC4
 qX2mGUgRRMO4p6E2k/4l77LKCTbQ4F1yyUIxtnVRGRaXrlNOCmVag6NB/Yt+MyL0d
 6AiPrtJmbXP+ATx7/xQ+0tWh6GGJpMSmO1i/oAwfARdQIcYufgNBVAgJmsmz4l/ck
 a8RJ2wGb1LBWkciSrQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N9cLR-1sbNc00Sxx-00wGrB; Fri, 17
 May 2024 20:30:53 +0200
Message-ID: <94ef2d0b-15d0-4c40-ab52-a5d88a666b3c@web.de>
Date: Fri, 17 May 2024 20:30:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kuro Chung <kuro.chung@ite.corp-partner.google.com>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Allen Chen <allen.chen@ite.com.tw>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Kenneth Haung <kenneth.hung@ite.com.tw>,
 Kuro Chung <kuro.chung@ite.com.tw>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pin-yen Lin <treapking@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20240517021654.1034218-1-kuro.chung@ite.com.tw>
Subject: Re: [PATCH v9] drm/bridge: it6505: This patch fixes hibernate to
 resume no display issue
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240517021654.1034218-1-kuro.chung@ite.com.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ocxBC3UDqeM5nCY06kslqg/TVkMQrEhNuG0Dw/kVCwd4cxuSw2Q
 UY3HZYeg4IlBOVMNqRCOIb6/Tj75wO5vXhe+IL9ld1VtsU3G7M0uzhgWkrawRN7mNroeE9w
 XJ9WDv2uYT9Eo3XIxssXaBh89q/0hHQDYbMu8BWLEJJXRtTFJXq9wWtX/koY8zbr59j/DC4
 abhIH/nm+k+2HmFBA/jTg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KoPW+CVPpu4=;Vrm/vaXMaVmapgFQFlZG+3gmEOr
 3os8JvhsNpNNGVGNCXbFspzLxWNsVQ1Iccue17QCvrdsjQrswL1tTAH/OF9oQchU385imGUuI
 5rxArMfrNRkJszhCVUvZjpDWtEwade/FDFj0WSWtbsNolVcbukUz6UmFEwNymnynkYbStvB+0
 zQKdK83XkBTJtN54EKzfVHhe2erqZAbH8wEaqN0omlg5z3LX7qMbbxTDrvIVuQc7ElcYhh90A
 iGZcnvXiVfUDglKSn6dcgdi3pBTKL6L0EKbAzvOg5upn5vEZc5f911WJNY5aHqcHajpWrjcHX
 tkqcg34Dr57HrK8IvZ1fN1xS/BirZLuei3dijnxMXxTjUEI2F9NjMxfPtxdIDq1kSagjXjjup
 ZvmSstHm5yNf0TxSGgoguaJnCqVXdw7E61cw1cHSB/bK9U3YSV0yv//CM/T5aUpwils0pZAcl
 WUegrIePMVEJKwwECa14PoA2GKxqte3y03Awdj2ieyvZ0BVDjHqSfh4AEd1x3UWy7swaANpZU
 jqNd+gYXD5anZDc6ms1kYKRtrkts7W4HVWs6BtGhV3cvPuHTB9qv5obURM8R5o+Lb4mnmjvZg
 kLExx8yvuw9eY35jmwT1Wt4N7ArTEgJeJ3aQonwe08bDKwdcdt6FXQ+WqoQMkHGxZr+92lVSr
 JNUxc90eiOFDiVdaMcaKAj7Yn+Eymz8Y8yntVCR9iMEpdNvk5Fy4OjRikSqQ+QDcwKXWBrM1Q
 H4+vBmq4eZkrCZs1kPBzso1pEBCEWU0oB68ZAx4QsvyvC1Cv2SrTddwaMUOjQfIMCl49F5NR2
 TcpB1DqJovycZmIKeRXqrEsprYtyLI/JW8pkH9BibUPJM=
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

Please omit the word combination =E2=80=9CThis patch=E2=80=9D from the sum=
mary phrase.


=E2=80=A6
> But the input FIFO reset will also trigger error interrupts of output
> module rising.Thus, it6505 have to wait a period can clear those
> expected error interrupts caused by manual hardware reset in one
> interrupt handler calling to avoid interrupt looping.

Please improve this change description another bit.


=E2=80=A6
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 73 +++++++++++++++++++----------
=E2=80=A6

You may present version descriptions behind the marker line.

Regards,
Markus
