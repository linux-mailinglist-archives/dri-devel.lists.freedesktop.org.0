Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E9EC13897
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 09:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C036B10E02E;
	Tue, 28 Oct 2025 08:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icloud.com header.i=@icloud.com header.b="UrqCBb6x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 600 seconds by postgrey-1.36 at gabe;
 Tue, 28 Oct 2025 04:12:53 UTC
Received: from outbound.ms.icloud.com
 (p-west3-cluster5-host9-snip4-1.eps.apple.com [57.103.72.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FCF10E1D1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 04:12:53 +0000 (UTC)
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-west-3a-100-percent-11 (Postfix) with ESMTPS id
 ED6411800136; Tue, 28 Oct 2025 03:55:28 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai;
 bh=kfzmDUudgcYgslE2D+aQT5SupO/GODxP7mjb+lhmStE=;
 h=Date:From:Subject:To:Message-Id:MIME-Version:Content-Type:x-icloud-hme;
 b=UrqCBb6x5t7VcDfho+vxOYmVfbQ+7c0ziuZiW5mg2oP+uEuJ3t5B1T/gIbb54MOKiPRT+VfYHkoWbgMN4diXzngz341pz5ZAhsju7kjlGOr4ANJLXKVb/WccVpqMYNYc6RxV86Zp0Qo6WG5dmu9mzJOGUD6gKiYgaU4xfM9VqJdlh6gaeiHEhJBSvYXc3GgoQwTIi6LYs0rScylaSdt1WTAi38ibsMZq3N3e48/avXcqNUSjoIQvA80gRQ0hL9XkaNMTRTHtTpnmWPLA7TrDIOq+yPIsra5VN6FWqUMMg5inS+C6SxT6DFJUKUxuePLgPgfACct93moWtmELugdL1g==
Received: from [192.168.4.116] (unknown [17.57.154.37])
 by p00-icloudmta-asmtp-us-west-3a-100-percent-11 (Postfix) with ESMTPSA id
 34A521800125; Tue, 28 Oct 2025 03:55:28 +0000 (UTC)
Date: Mon, 27 Oct 2025 22:55:21 -0500
From: Zoe Gates <zoe.blair.gates@icloud.com>
Subject: [PATCH 3/3] drm/plane: Correct typo in update_plane docs
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-Id: <9KPT4T.68U20D71JV7G1@icloud.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-fbUhIRA+wzrznKii2nvt"
X-Proofpoint-GUID: O2dOjfcIROuasycjoPfE0RJmPFIe8Hzb
X-Proofpoint-ORIG-GUID: O2dOjfcIROuasycjoPfE0RJmPFIe8Hzb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDAzMiBTYWx0ZWRfX1BsqcaT1GoAc
 hnLemOng+6NTwa9cyWsdsE6BSPJjrZLoGVsT+Fq2ON/G7nL9faLQMTRklQTCXI9acXyNfOMYoVp
 tkgJ6e1H1yeJ46wtGLS1cZQfuFfK7SulqziCfa+RAKY9WK9vgZjpFJh5rcmtv8lyuq7KsLBMQZ7
 BnxkKVcetNJ4uEO21zYIsVzOakzUv5e1RFVJL+w7lJCXqjgZDzjNdKF2AkZIsnja316uAX0VznK
 kSbMmLl2TjK7QNGShpYIiQXHQyyYIArupGvkA6G9NQQgqGe26Ra5dnHfyRvWzm3miybGhwV5U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2510280032
X-JNJ: AAAAAAABLhTJaFpP/fH8OCJmQmonn8c1CgPtp13srPYAFdsuL76NAxjTx8HT/uQe4fefxNChCVAKUjV5wCfo/Mgoon1uCmA4m7A2UMOOTFEut250VgzEJvTcUq0/wPHX8JzKq+w1S0L0uThGdV1rORlxE3T/QLCY06PwWWFCDdhWbb4f/WnG6zHOZiZG68XIggjF+l0QFiy0eqDkLH1m9NNEjUHyfY2iHnygkFNX/NAfGqJuwBxKg60X1QKNsBKo7scfJCO3qDJIQ0CH1rQVXsTIAQu7GE5QsI5QuEq8c/qE0mH/08/ZrqYrzvi0ytbY8W15vABmLFMcbxrb8eDZglAEZVz1i7Cjqi4UCGapuGKXql555dA4MkoibhhGbL2pd/8VNpxCyg+g87DZSd09NojMiDOmfIKmdBMrcvpu/a9pdMiroj6pEQ5ajz3vZSkAssOrcMGMGuYlinxyVjMHknEos8GAu4AZluNzV3cEO6zarny+T+AxrArws++D7YFnspZ6sC5mpSudTshyR1jR6WpOFfnh9uCRM0GXiUs5qISPhlw/t99h+TVAry478jOwnYcz8PJSfwA8q9uHwOoYfFzVOcgC297yQA2yz6S4uAX+motG1ZRcvjEWD0XizBK7Yn5pcT0Xs6hLGmN7KnUF2VX+k8ekvQIL0KbuEZr8qvydUvMXN6AvDanov19V53DrqeIFw49JavNDZMlW4G5gWcsCJF/CZNatyYd4JvQJhan3SSYkm1nRBDKcqSV+kre7
X-Mailman-Approved-At: Tue, 28 Oct 2025 08:28:06 +0000
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

--=-fbUhIRA+wzrznKii2nvt
Content-Type: text/plain; charset=us-ascii; format=flowed

 From 931f0f259c881c892e78df75a7bcd1263a838d5b Mon Sep 17 00:00:00 2001
 From: Zoe Gates <zoe@zeocities.dev>
Date: Mon, 27 Oct 2025 22:15:11 -0500
Subject: [PATCH 3/3] drm/plane: Correct typo in update_plane docs

Fix the kernel-doc spelling so the update_plane parameter description
uses the proper wording.

Signed-off-by: Zoe Gates <zoe@zeocities.dev>
---
 include/drm/drm_plane.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 01479dd94e76..90006a811d57 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -295,7 +295,7 @@ struct drm_plane_funcs {
 	 *
 	 * This is the legacy entry point to enable and configure the plane 
for
 	 * the given CRTC and framebuffer. It is never called to disable the
-	 * plane, i.e. the passed-in crtc and fb paramters are never NULL.
+	 * plane, i.e. the passed-in crtc and fb parameters are never NULL.
 	 *
 	 * The source rectangle in frame buffer memory coordinates is given by
 	 * the src_x, src_y, src_w and src_h parameters (as 16.16 fixed point
-- 
2.51.1



--=-fbUhIRA+wzrznKii2nvt
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><div>From 931f0f259c881c892e78df75=
a7bcd1263a838d5b Mon Sep 17 00:00:00 2001</div><div>From: Zoe Gates &lt;zoe=
@zeocities.dev&gt;</div><div>Date: Mon, 27 Oct 2025 22:15:11 -0500</div><di=
v>Subject: [PATCH 3/3] drm/plane: Correct typo in update_plane docs</div><d=
iv><br></div><div>Fix the kernel-doc spelling so the update_plane parameter=
 description</div><div>uses the proper wording.</div><div><br></div><div>Si=
gned-off-by: Zoe Gates &lt;zoe@zeocities.dev&gt;</div><div>---</div><div>&n=
bsp;include/drm/drm_plane.h | 2 +-</div><div>&nbsp;1 file changed, 1 insert=
ion(+), 1 deletion(-)</div><div><br></div><div>diff --git a/include/drm/drm=
_plane.h b/include/drm/drm_plane.h</div><div>index 01479dd94e76..90006a811d=
57 100644</div><div>--- a/include/drm/drm_plane.h</div><div>+++ b/include/d=
rm/drm_plane.h</div><div>@@ -295,7 +295,7 @@ struct drm_plane_funcs {</div>=
<div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span=
> *</div><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre=
">	</span> * This is the legacy entry point to enable and configure the pla=
ne for</div><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:=
pre">	</span> * the given CRTC and framebuffer. It is never called to disab=
le the</div><div>-<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span> * plane, i.e. the passed-in crtc and fb paramters are never NULL.<=
/div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span=
> * plane, i.e. the passed-in crtc and fb parameters are never NULL.</div><=
div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>=
 *</div><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre"=
>	</span> * The source rectangle in frame buffer memory coordinates is give=
n by</div><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pr=
e">	</span> * the src_x, src_y, src_w and src_h parameters (as 16.16 fixed =
point</div><div>--&nbsp;</div><div>2.51.1</div><div><br></div></div></div>
--=-fbUhIRA+wzrznKii2nvt--

