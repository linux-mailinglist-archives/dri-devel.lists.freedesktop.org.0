Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A8F6DE11B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 18:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB25710E5A4;
	Tue, 11 Apr 2023 16:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C74910E105
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 16:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681231106; i=markus.elfring@web.de;
 bh=KodfLgUceH7tlWIE/lBj4FeAVMbCd67EcM5rAgQ6bC0=;
 h=X-UI-Sender-Class:Date:Subject:From:To:References:Cc:In-Reply-To;
 b=ncSLNpg33w/+yGLxpXuqEKQjIF8sMjD/dStGvM3hLwghOGSzrS0oZoswUxq8273Ax
 /odn+t/Ulhd5QE9FDqPNBjBj/8nX+uJZTDinfxPnOuQsX+2rRvTX95aoLoeahIiKyN
 5lH43kIT2YUVeDqa/oeHTqKFiWs5NrEN/tIkYjACABi/02vUB/zTRQVWcE4/3pdRaq
 lE8ZUXIPNy+waArASHvdzDWQXBh02bIfKh0Q/MtG6XMk1rdqcY7CIyr1NmN8wKSk0/
 fGNeydCdrOXTtqelprPzB0ddXzXdeEkP7oS+VkaD3MwmjBlrJidGsnOsBcNTkU9tyL
 0P/w1l759iy9Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.80.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MFayw-1palVH36HW-00HVEC; Tue, 11
 Apr 2023 18:38:25 +0200
Message-ID: <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
Date: Tue, 11 Apr 2023 18:38:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH] drm/msm/dpu: Delete a variable initialisation before a null
 pointer check in two functions
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Archit Taneja <architt@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Vinod Koul <vkoul@kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
In-Reply-To: <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zjK3SgYZaTts3/DQmbn/tMUYAcK3xW8qYes08fJbQNKGfzUlL9m
 5uWvPtORkJBHASGS2jNgG8WVIgvsXC+AQSuteZtj4VjoaJFWNI8wa2uN5TBPSd6RRKigne/
 j1pErNZFJBEn4fy7mWQF/6r8oAyyMhcZ6b+u6e6glOpsVo25RWg0+iBQfEEm0ZG09EuJAGh
 X5sNGqJBRWPSLc9Fkqe3g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:l3q5fR6k0sY=;7nvV/vmOPtMbKD90qGjin3PTyFK
 n1B6dfk8P3JdVmj9jf0XvgukO7IxLqG8cpOTDR7V2i//l0/jS1QBs3W9KsbPEhkM9KN0Z8vH5
 RI4bLeqeKIHkDn1VNG0iSuwQVEkv3CeOybmzIFzDsDo2A+qL0Di65w91/5uLuP1EAJKPyJ4f5
 V6rdkNcz19kCXgJA7VuA56jToT8vYgr/twtKzG5SjJ6TR26tTh31dHXYjzcLi9c2MKhMczGPu
 zGJLkHVLnddFUajffsBkxV4qRZWvmxiIDZzXye9pCoRB8cwSD5vFIhcW2L5gmhoMG+q07KBuL
 07mdTZw2SJzdxpJXKyG/4e83l9dW4d5D7gXCeaCj33RFuNeZkJJn52GebZJNBDQ3pN0URw0re
 CHaOgqwLYrWXQ/kqk4C062w3f57itEy06LvyaTi2WcEWxBBIrxHh2B2uqXIkUcXB9gKhS05lL
 cyoFxgQNIXKj9gMbelj2otJ2/4GKjDoUoC2mMUead3TuHoemnBWZlcusjjLJzLjAO6xhU1yFz
 39GS1cSklSER+qVxBILtvxQ5lD+JOWEP4y+uFGprbwE3oE/jy5RsrMrG8daJWFZTBx0ZBhGis
 tDyH/prWGKl5tZlQuYvb1YSijBOtjurNgKysUh7WsuRsie3J+NLVS1oqFnW+EqcFr418hPvqd
 VW0gwtDWM8JAJLAB2CVtjp0Uc8nUYRLRSA7JziSlkEXVeGF5voXlO0q3aX0dBMd8fBGJphcNN
 O+GU8OzCi4k7mfV5CJ9uLO/v0A9G6eQpN0d28U2mprOljbkY20Wg9FzyMNXMPUNjg+mXJWx7g
 /8LYuy9QDPQTmyOScyNPhvk34kQ14ejC/fv34BoeCKM8Fou3OvgovGD2wno7zV3orbjw05U8v
 MEZh3YQ6iAn/xa6uUXasbc7y+E7Oah+djeZdFXUFpVTyN080hiWgvTgSk
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

Date: Tue, 11 Apr 2023 18:24:24 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the functions =E2=80=9Cdpu_hw_pp_enable_te=E2=80=9D and =E2=80=9Cdpu_hw_pp=
_get_vsync_info=E2=80=9D.

Thus avoid the risk for undefined behaviour by removing extra
initialisations for the variable =E2=80=9Cc=E2=80=9D (also because it was =
already
reassigned with the same value behind this pointer check).

This issue was detected by using the Coccinelle software.

Fixes: 25fdd5933e4c0f5fe2ea5cd59994f8ac5fbe90ef ("drm/msm: Add SDM845 DPU =
support")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 0fcad9760b6f..870ab3ebbc94 100644
=2D-- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -176,7 +176,7 @@ static int dpu_hw_pp_enable_te(struct dpu_hw_pingpong =
*pp, bool enable)
 static int dpu_hw_pp_connect_external_te(struct dpu_hw_pingpong *pp,
 		bool enable_external_te)
 {
-	struct dpu_hw_blk_reg_map *c =3D &pp->hw;
+	struct dpu_hw_blk_reg_map *c;
 	u32 cfg;
 	int orig;

@@ -221,7 +221,7 @@ static int dpu_hw_pp_get_vsync_info(struct dpu_hw_ping=
pong *pp,

 static u32 dpu_hw_pp_get_line_count(struct dpu_hw_pingpong *pp)
 {
-	struct dpu_hw_blk_reg_map *c =3D &pp->hw;
+	struct dpu_hw_blk_reg_map *c;
 	u32 height, init;
 	u32 line =3D 0xFFFF;

=2D-
2.40.0

