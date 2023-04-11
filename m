Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60C06DDCCD
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 15:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D351110E245;
	Tue, 11 Apr 2023 13:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D1810E245;
 Tue, 11 Apr 2023 13:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681221015; i=markus.elfring@web.de;
 bh=QqBrh1iOG7Q4T2t0pkmEGvdBD1d8O9i9GYWCZGAT47g=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=K6zzEBWXsxSPB8XPajfrExmE1NNHZ4KP6iVFmus2wBQ0rmBPTYdrSxaYi4RfKihpT
 rzCLvMmAorDLVby9zT5RYHOE+dSSyqgk9LrId8SMeFeYMjQlhP573CDN3INoyyIZj6
 u0R37cj2oLma2/CrLudYSsPsvyaA+4fYB8MuFG6jhjgm8VNNRU9ATuCMjzzPyr7jk/
 Uyi9s2X3+kBQRXeeqhwqkCLipnTZTofM3CQrpxeKcOlIgrrORwxS2pjEA950Fi2UcP
 p1gnJruNKzQVT4jBK0pofhiBjYpJiDf9FGEIu3/9kP6oyyR+38Eub90LFSZJfat+D3
 WQl7n6Wl9t43Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.80.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Ml4B6-1qDpud2ScO-00ld3e; Tue, 11
 Apr 2023 15:50:15 +0200
Message-ID: <5341f677-4192-3c17-fb76-faddcf5ac9a1@web.de>
Date: Tue, 11 Apr 2023 15:50:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH 5/5] drm/amd/display: Move an expression into a return
 statement in dcn201_link_encoder_create()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alan Liu <HaoPing.Liu@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Candice Li <candice.li@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>, Eryk Brol <eryk.brol@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Jun Lei <jun.lei@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Stanley Yang <Stanley.Yang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Tom Rix <trix@redhat.com>, Victor Zhao <Victor.Zhao@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Zhan Liu <zhan.liu@amd.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <2258ce64-2a14-6778-8319-b342b06a1f33@web.de>
In-Reply-To: <2258ce64-2a14-6778-8319-b342b06a1f33@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:k4el8X+ATWGE1XAQw5UGkyMRjJ5All74JHlKkerIl79dJWrOxCn
 7GN2s7L3Bvap3zkoSW9jkSUD0g6BSw0Sa4NTWMnH5XbYYHjAIJCwwnbFL+XV9YqjBwygSjh
 mNWO47vTH33VRRqJkPvREbx3aMRa1p9BjYk8Y6QhmznUv/ILmPjx15aeWJGkUxGPKZ1Tygh
 DNk3+P8IesUjo0hDhbIgA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mnPqPBJJIHA=;7vxqSL+DR2zreZ5Xn4j6gBqu/AK
 DMOoX/QPTVG+hJiJmivXNmZuT8zEItsJcIjU3IiSZ1OM9mJOxXM9EhQXsW7ToYgeq9oU1KBW4
 mTOf5gV64BQDYYsaZ9GLoHYnuPKAJIETUJqLuuQFHe1vgm4sy5aSr5X5WTorUsZC8FI4D41yy
 DeaO3JSlhp5N9oZJ4f+qq6XErgTAQ3DlSBmc3BeVPeFs0WhzfZ+Fpe31XddgK8ewSvbguV2NH
 4XCG3I1FJzfEFPjzxwHFq0oAjLZEKr44/8A8VHW6yFqxYLD2vZWXRPo2KVhgTwpeeJOR9FvFf
 wcW2pbE+cxi0+QvU09wAUS+Zx2SKoHDfmVqw03//OF1CxDaDMozyKWAt93Yy2NsTzTgF5z1S0
 jZlN1dKaXYSgqvTXtEWFBF3s4eyZ8Al9jbSxcIwveD7uNUCilQ68TQ7jbX1MV/R55OloxjtNr
 4QoUDBVzwOuiqrKCyU61wPz5Kxhg2gActZ+5pzRmWQrKTTd6iTz1+rD9hMJeVTWTo6mjaVKqx
 0tikWwuKjlmWiV8nRmtFOOXIE0yeRLrZXOQg1r+7h+InOsXw1YF3HjorVds/gxW2QGcMPOZxw
 A5afSj5swu+5Fg9CURpmoZFx9oFxNEroxfPyYXINzroxnsbQ3mHApGf3jvJFpWa5SjEPb4EV2
 7pCYdbDDpP/KxCJ0NKakpIWFkL+KcplkMzeceZG6ycQ3ICAQTGJHCo1soKR4C3KnxYceH8T5v
 hlYXvrk1Txpw3sLOrufAO2Qu4KMOlm5ExH4og/tMjPOW/PzsXT/atRzXtqcrp6YaOurkaRsfk
 HMEsRaEw+UPmHeLIBtv85qV0VExXp6iftOtHL8mxijJYoW0BtqGURRsv5SxMdzWuTY8Yls1mj
 nipN0UQBsh3CW+SyCVU1h6tIhyKN7oXfAUv1awug4DRDnAw1VH+jmOVRs
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Date: Tue, 11 Apr 2023 14:04:57 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the function =E2=80=9Cdcn201_link_encoder_create=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the usage
of an expression into a return statement.

This issue was detected by using the Coccinelle software.

Fixes: 3f68c01be9a2227de1e190317fe34a6fb835a094 ("drm/amd/display: add cya=
n_skillfish display support")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c b/dri=
vers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c
index 6ea70da28aaa..a1b44c7bd34b 100644
=2D-- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c
@@ -791,7 +791,6 @@ static struct link_encoder *dcn201_link_encoder_create=
(
 {
 	struct dcn20_link_encoder *enc20 =3D
 		kzalloc(sizeof(struct dcn20_link_encoder), GFP_ATOMIC);
-	struct dcn10_link_encoder *enc10 =3D &enc20->enc10;

 	if (!enc20)
 		return NULL;
@@ -804,8 +803,7 @@ static struct link_encoder *dcn201_link_encoder_create=
(
 			&link_enc_hpd_regs[enc_init_data->hpd_source],
 			&le_shift,
 			&le_mask);
-
-	return &enc10->base;
+	return &enc20->enc10.base;
 }

 static struct clock_source *dcn201_clock_source_create(
=2D-
2.40.0

