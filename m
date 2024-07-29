Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2140B93FBE5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 18:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAFBE10E449;
	Mon, 29 Jul 2024 16:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=holm.dev header.i=@holm.dev header.b="PqEKLtsl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 527 seconds by postgrey-1.36 at gabe;
 Mon, 29 Jul 2024 13:30:31 UTC
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com
 [95.215.58.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D77910E3DB
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 13:30:31 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=holm.dev; s=key1;
 t=1722259302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G1Agd5vRjGskPC+jhoG7bLdcvURz2aFKxK/qDcooy8Y=;
 b=PqEKLtsleFSFZPHLbs8jFKP/lXcMKZuWAJLaMSv+BmPZ0SDnt9m8rVAX6HVrpbVRUINwUp
 qMAD26NOhMKIvW/RATtyDc1Rw9gV0wj+fSbZVAZjLXwpxwe7vjkX9v8jinHYHITGdyk+uE
 yu3qx0YUXuFiSe19j5OAfRtkFuchIFScLlHUyU74Hbzy3qlIo+C0rvrOVHtP253xX18/mM
 mrALJB3DFkl/+mcjwhoPEP7Ag6P7R0PCvQ7Q4/Str/2gD9n0N3SonW4FSo9yHBMHzmzTga
 Fuy9oIT4WMFRYp2jh6qgPDRWeBa4/cJc7TsnYs28kBK5SsHYOEq+z+RE2lhezQ==
Date: Mon, 29 Jul 2024 13:21:40 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: kevin@holm.dev
Message-ID: <7bf26283474fbb6ea915f93f4db0bc614a627617@holm.dev>
TLS-Required: No
Subject: Re: [REGRESSION] No image on 4k display port displays connected
 through usb-c dock in kernel 6.10
To: "Linux regressions mailing list" <regressions@lists.linux.dev>,
 "Christian Heusel" <christian@heusel.eu>
Cc: "Greg KH" <gregkh@linuxfoundation.org>, "Lin, Wayne" <Wayne.Lin@amd.com>, 
 stable@vger.kernel.org, "LKML" <linux-kernel@vger.kernel.org>, "ML
 dri-devel" <dri-devel@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, "Wu, Hersen" <hersenxs.wu@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
In-Reply-To: <ca007d54-c204-4f7f-9eca-5a282324b941@leemhuis.info>
References: <d74a7768e957e6ce88c27a5bece0c64dff132e24@holm.dev>
 <9ca719e4-2790-4804-b2cb-4812899adfe8@leemhuis.info>
 <fd8ece71459cd79f669efcfd25e4ce38b80d4164@holm.dev>
 <CO6PR12MB54897CE472F9271B25883DF6FCB72@CO6PR12MB5489.namprd12.prod.outlook.com>
 <e2050c2e-582f-4c6c-bf5f-54c5abd375cb@leemhuis.info>
 <b7f0f3e1-522b-4763-be31-dcee1948f7b3@heusel.eu>
 <ca007d54-c204-4f7f-9eca-5a282324b941@leemhuis.info>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 29 Jul 2024 16:55:27 +0000
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

July 29, 2024 at 11:15 AM, "Linux regression tracking (Thorsten Leemhuis)=
" <regressions@leemhuis.info> wrote:



>=20
>=20On 29.07.24 10:47, Christian Heusel wrote:
>=20
>=20>=20
>=20> On 24/07/29 10:35AM, Linux regression tracking (Thorsten Leemhuis) =
wrote:
> >=20
>=20> >=20
>=20> > [+Greg +stable]
> > >=20
>=20> >  On 29.07.24 10:16, Lin, Wayne wrote:
> > >=20
>=20>=20
>=20>  Thanks for the report.
> >=20
>=20>  Patch fa57924c76d995 ("drm/amd/display: Refactor function dm_dp_ms=
t_is_port_support_mode()")
> >=20
>=20>  is kind of correcting problems causing by commit:
> >=20
>=20>  4df96ba6676034 ("drm/amd/display: Add timing pixel encoding for ms=
t mode validation")
> >=20
>=20>  Sorry if it misses fixes tag and would suggest to backport to fix =
it. Thanks!
> >=20
>=20> >=20
>=20> > Greg, seem it would be wise to pick up fa57924c76d995 for 6.10.y =
as
> > >=20
>=20> >  well, despite a lack of Fixes or stable tags.
> > >=20
>=20> >  Ciao, Thorsten
> > >=20
>=20>=20
>=20>=20=20
>=20>=20
>=20>  The issue is that the fixing commit does not apply to the 6.10 ser=
ies
> >=20
>=20>  without conflict and the offending commit does not revert cleanly
> >=20
>=20>  aswell.
> >=20
>=20
> Hah, many thx, I should have checked that.
>=20
>=20Lin, Wayne: could you maybe help out here and provide something for 6=
.10.y?
>=20
>=20Ciao, Thorsten
>

I reverted 4df96ba6676034 from v6.10.2 from the stable/linux git, resolvi=
ng the conflict by removing everything that git marked as from the curren=
t branch and kept everything marked as from before the branch to merge. T=
hat resulted in a patch that is fixing the problem on my machine. Since I=
 don't understand what the code is actually doing it might break things o=
n other machines.

From cd1674a469cede83f6b0907f320b6af08c3c8950 Mon Sep 17 00:00:00 2001
From: Kevin Holm <kevin@holm.dev>
Date: Mon, 29 Jul 2024 13:24:38 +0200
Subject: [PATCH] Test patch

---
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 33 +++----------------
 1 file changed, 5 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index a5e1a93ddaea..5c555a37e367 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -1599,7 +1599,7 @@ enum dc_status dm_dp_mst_is_port_support_mode(
     struct amdgpu_dm_connector *aconnector,
     struct dc_stream_state *stream)
 {
-    int pbn, branch_max_throughput_mps =3D 0;
+    int bpp, pbn, branch_max_throughput_mps =3D 0;
     struct dc_link_settings cur_link_settings;
     unsigned int end_to_end_bw_in_kbps =3D 0;
     unsigned int upper_link_bw_in_kbps =3D 0, down_link_bw_in_kbps =3D 0=
;
@@ -1649,34 +1649,11 @@ enum dc_status dm_dp_mst_is_port_support_mode(
             }
         }
     } else {
-        /* Check if mode could be supported within max slot
-         * number of current mst link and full_pbn of mst links.
-         */
-        int pbn_div, slot_num, max_slot_num;
-        enum dc_link_encoding_format link_encoding;
-        uint32_t stream_kbps =3D
-            dc_bandwidth_in_kbps_from_timing(&stream->timing,
-                dc_link_get_highest_encoding_format(stream->link));
-
-        pbn =3D kbps_to_peak_pbn(stream_kbps);
-        pbn_div =3D dm_mst_get_pbn_divider(stream->link);
-        slot_num =3D DIV_ROUND_UP(pbn, pbn_div);
-
-        link_encoding =3D dc_link_get_highest_encoding_format(stream->li=
nk);
-        if (link_encoding =3D=3D DC_LINK_ENCODING_DP_8b_10b)
-            max_slot_num =3D 63;
-        else if (link_encoding =3D=3D DC_LINK_ENCODING_DP_128b_132b)
-            max_slot_num =3D 64;
-        else {
-            DRM_DEBUG_DRIVER("Invalid link encoding format\n");
+        /* check if mode could be supported within full_pbn */
+        bpp =3D convert_dc_color_depth_into_bpc(stream->timing.display_c=
olor_depth) * 3;
+        pbn =3D drm_dp_calc_pbn_mode(stream->timing.pix_clk_100hz / 10, =
bpp << 4);
+        if (pbn > aconnector->mst_output_port->full_pbn)
             return DC_FAIL_BANDWIDTH_VALIDATE;
-        }
-
-        if (slot_num > max_slot_num ||
-            pbn > aconnector->mst_output_port->full_pbn) {
-            DRM_DEBUG_DRIVER("Mode can not be supported within mst links=
!");
-            return DC_FAIL_BANDWIDTH_VALIDATE;
-        }
     }
=20
=20    /* check is mst dsc output bandwidth branch_overall_throughput_0_m=
ps */
--=20
2.45.2


Regards,
Kevin
