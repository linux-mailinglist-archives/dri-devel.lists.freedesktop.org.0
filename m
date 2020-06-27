Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E67220CA63
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 22:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217CB6E3AC;
	Sun, 28 Jun 2020 20:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0B06E0DF
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 16:04:00 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q15so11456585wmj.2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 09:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:user-agent:mime-version;
 bh=V/kNcWSsn3VamUoD9hnBR1ZDREGD7+pBJsLP9ilHYj4=;
 b=ubKOJchdEvUhS4G+9+tAYKBbYzEE59YaaYTz6VK6vDjJIU9y9tIGPgJsk4w/lcRtCt
 v+fwxtdtBxi8X8DiPhonMyN8UdZiYR2AVePDY3+baJGOaTgUkoMaLQ6NiOMxrABsK51l
 B3lnALY7cho54gWWcXqzNWa5fTbPi84l9r1zSZiO9w+HLcaU5bq+yEagIciZNTkDXTBv
 mJ1OgpezDnHfOYW7R7z5BRercCJVMBqnGG1ohQMFbQ3NC98FONMd9hrsEuqBh7RiLh5/
 R+fDnGj1qbIXUIpnJIpZZYhMzqft/HNvO3uaQZGZerICM5HUvqzgbCNa9UNVr+9odIeL
 /zag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
 :mime-version;
 bh=V/kNcWSsn3VamUoD9hnBR1ZDREGD7+pBJsLP9ilHYj4=;
 b=P43KD7e89NV4OXVlWfY4LfOEHeW8bWOoqIrhFA+mf7kXagFVsd5EZVWh31w4CDrKLJ
 ia8y8udLg1F3GYz7QPNZf8g+ItcM/pwtIgQ2C9SF15HNdh2bpHxYx1/rn4PFlV2VOTEh
 9/xqAx/tT8mfwvZWYh+e4agMOj4RcIls58W9cNWCJT+lgBewMZYiwG3AopeEI7T3a17q
 tWmWvzd8Wev32pKwHphqBwK+6PLv43U4SNDFHztP2/n7AJ2mMEzWymF7fIvz68GQG/Uo
 mnAN3ArMvAU3UaxiXKIRdgncsFnfn6T+CV5CYaMTA1pax8xBNHt5WBabsZoK3RZ31ZYT
 M0nA==
X-Gm-Message-State: AOAM533PuKAEJXMnnil9udAPTnESm7VRQJJoyJbv8sM/KrXw9LkXpLmP
 xRaM7A2c3TTY2UvNydzw5Q0=
X-Google-Smtp-Source: ABdhPJxFzd/vZF6XlUserDl8etexgcD4wdlZZRxIL/0wDLd96ZaBfZetv+Pkvcr8M0NNzAkRnlfFBA==
X-Received: by 2002:a1c:b182:: with SMTP id a124mr8325766wmf.114.1593273838875; 
 Sat, 27 Jun 2020 09:03:58 -0700 (PDT)
Received: from rolandryzen (cpe90-146-109-250.liwest.at. [90.146.109.250])
 by smtp.gmail.com with ESMTPSA id f16sm22234770wmh.27.2020.06.27.09.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jun 2020 09:03:57 -0700 (PDT)
Message-ID: <a99ef2e90d61552e7a81e4983e4dcff601f725f9.camel@gmail.com>
Subject: amdgpu freezes kernel after kernel 5.7.6 changes
From: roland.rucky@gmail.com
To: harry.wentland@amd.com
Date: Sat, 27 Jun 2020 18:03:56 +0200
Content-Type: multipart/mixed; boundary="=-qZ+U8iwZAy4lzJmyNveR"
User-Agent: Evolution 3.36.3 
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 28 Jun 2020 20:36:36 +0000
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--=-qZ+U8iwZAy4lzJmyNveR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Not sure if I am contacting the correct person,

Since I updated to kernel 5.7.6, my system started to freeze randomly.
After a couple of freezes, I noticed, that they always happen when
playing games, or during videoplayback in e.g. firefox.

I reverted to the previous kernel 5.7.5, and all issues are gone. Next
I started to revert and test single commits between the two kernel
versions, which affect amdgpu. If I revert the changes listed below,
the kernel does not freeze any more.

Sadly I can`t get any crash reports / logs. Even the magic sysrq key
does not work, when the system is frozen.

I will also attach a patch, which includes all reverted commits.


List of changes I reverted:
-----------------------------------------------------------------------

commit 6674508ba1a2ea6caca5de2bcb25bc00a050fd0a
Author: Harry Wentland <harry.wentland@amd.com>
Date:   Thu May 28 09:44:44 2020 -0400

    Revert "drm/amd/display: disable dcn20 abm feature for bring up"

    commit 14ed1c908a7a623cc0cbf0203f8201d1b7d31d16 upstream.

    This reverts commit 96cb7cf13d8530099c256c053648ad576588c387.

    This change was used for DCN2 bringup and is no longer desired.
    In fact it breaks backlight on DCN2 systems.

    Cc: Alexander Monakov <amonakov@ispras.ru>
    Cc: Hersen Wu <hersenxs.wu@amd.com>
    Cc: Anthony Koo <Anthony.Koo@amd.com>
    Cc: Michael Chiu <Michael.Chiu@amd.com>
    Signed-off-by: Harry Wentland <harry.wentland@amd.com>
    Acked-by: Alex Deucher <alexander.deucher@amd.com>
    Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
    Reported-and-tested-by: Alexander Monakov <amonakov@ispras.ru>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
    Cc: stable@vger.kernel.org
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7fc15b82fe48..f9f02e08054b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1334,7 +1334,7 @@ static int dm_late_init(void *handle)
 	unsigned int linear_lut[16];
 	int i;
 	struct dmcu *dmcu = adev->dm.dc->res_pool->dmcu;
-	bool ret = false;
+	bool ret;

 	for (i = 0; i < 16; i++)
 		linear_lut[i] = 0xFFFF * i / 15;
@@ -1350,13 +1350,10 @@ static int dm_late_init(void *handle)
 	 */
 	params.min_abm_backlight = 0x28F;

-	/* todo will enable for navi10 */
-	if (adev->asic_type <= CHIP_RAVEN) {
-		ret = dmcu_load_iram(dmcu, params);
+	ret = dmcu_load_iram(dmcu, params);

-		if (!ret)
-			return -EINVAL;
-	}
+	if (!ret)
+		return -EINVAL;

 	return detect_mst_link_for_all_connectors(adev->ddev);
 }

commit fba8f9ef7e1405ee6f422beb874791e8a5eb489c
Author: Alex Deucher <alexander.deucher@amd.com>
Date:   Tue Jun 2 17:22:48 2020 -0400

    drm/amdgpu/display: use blanked rather than plane state for sync
groups

    commit b7f839d292948142eaab77cedd031aad0bfec872 upstream.

    We may end up with no planes set yet, depending on the ordering,
but we
    should have the proper blanking state which is either handled by
either
    DPG or TG depending on the hardware generation.  Check both to
determine
    the proper blanked state.

    Bug: https://gitlab.freedesktop.org/drm/amd/issues/781
    Fixes: 5fc0cbfad45648 ("drm/amd/display: determine if a pipe is
synced by plane state")
    Cc: nicholas.kazlauskas@amd.com
    Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
    Cc: stable@vger.kernel.org
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c
b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 4a619328101c..4acaf4be8a81 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1011,9 +1011,17 @@ static void program_timing_sync(
 			}
 		}

-		/* set first pipe with plane as master */
+		/* set first unblanked pipe as master */
 		for (j = 0; j < group_size; j++) {
-			if (pipe_set[j]->plane_state) {
+			bool is_blanked;
+
+			if (pipe_set[j]->stream_res.opp->funcs-
>dpg_is_blanked)
+				is_blanked =
+					pipe_set[j]->stream_res.opp-
>funcs->dpg_is_blanked(pipe_set[j]->stream_res.opp);
+			else
+				is_blanked =
+					pipe_set[j]->stream_res.tg-
>funcs->is_blanked(pipe_set[j]->stream_res.tg);
+			if (!is_blanked) {
 				if (j == 0)
 					break;

@@ -1034,9 +1042,17 @@ static void program_timing_sync(
 				status->timing_sync_info.master =
false;

 		}
-		/* remove any other pipes with plane as they have
already been synced */
+		/* remove any other unblanked pipes as they have
already been synced */
 		for (j = j + 1; j < group_size; j++) {
-			if (pipe_set[j]->plane_state) {
+			bool is_blanked;
+
+			if (pipe_set[j]->stream_res.opp->funcs-
>dpg_is_blanked)
+				is_blanked =
+					pipe_set[j]->stream_res.opp-
>funcs->dpg_is_blanked(pipe_set[j]->stream_res.opp);
+			else
+				is_blanked =
+					pipe_set[j]->stream_res.tg-
>funcs->is_blanked(pipe_set[j]->stream_res.tg);
+			if (!is_blanked) {
 				group_size--;
 				pipe_set[j] = pipe_set[group_size];
 				j--;

commit b5232e2ee8df85891514c73472cac09921e5d51d
Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Date:   Tue Jun 2 20:42:33 2020 -0400

    drm/amd/display: Revalidate bandwidth before commiting DC updates

    [ Upstream commit a24eaa5c51255b344d5a321f1eeb3205f2775498 ]

    [Why]
    Whenever we switch between tiled formats without also switching
pixel
    formats or doing anything else that recreates the DC plane state we
    can run into underflow or hangs since we're not updating the
    DML parameters before committing to the hardware.

    [How]
    If the update type is FULL then call validate_bandwidth again to
update
    the DML parmeters before committing the state.

    This is basically just a workaround and protective measure against
    update types being added DC where we could run into this issue in
    the future.

    We can only fully validate the state in advance before applying it
to
    the hardware if we recreate all the plane and stream states since
    we can't modify what's currently in use.

    The next step is to update DM to ensure that we're creating the
plane
    and stream states for whatever could potentially be a full update
in
    DC to pre-emptively recreate the state for DC global validation.

    The workaround can stay until this has been fixed in DM.

    Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
    Reviewed-by: Hersen Wu <hersenxs.wu@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
    Signed-off-by: Sasha Levin <sashal@kernel.org>

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c
b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 47431ca6986d..4a619328101c 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -2517,6 +2517,12 @@ void dc_commit_updates_for_stream(struct dc *dc,

 	copy_stream_update_to_stream(dc, context, stream,
stream_update);

+	if (!dc->res_pool->funcs->validate_bandwidth(dc, context,
false)) {
+		DC_ERROR("Mode validation failed for stream
update!\n");
+		dc_release_state(context);
+		return;
+	}
+
 	commit_planes_for_stream(
 				dc,
 				srf_updates,

Details:

* Kernel: 5.7.6
* GPU: radeon 5700XT
* CPU: ryzen 3800X
* running on swaywm(wayland)

--=-qZ+U8iwZAy4lzJmyNveR
Content-Type: text/x-patch; name="revert-amdgpu-5.7.6.patch"; charset="UTF-8"
Content-Description: 
Content-Disposition: attachment; filename="revert-amdgpu-5.7.6.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
CmluZGV4IGY5ZjAyZTA4MDU0Yi4uN2ZjMTViODJmZTQ4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTEzMzQsNyArMTMzNCw3
IEBAIHN0YXRpYyBpbnQgZG1fbGF0ZV9pbml0KHZvaWQgKmhhbmRsZSkKIAl1bnNpZ25lZCBpbnQg
bGluZWFyX2x1dFsxNl07CiAJaW50IGk7CiAJc3RydWN0IGRtY3UgKmRtY3UgPSBhZGV2LT5kbS5k
Yy0+cmVzX3Bvb2wtPmRtY3U7Ci0JYm9vbCByZXQ7CisJYm9vbCByZXQgPSBmYWxzZTsKIAogCWZv
ciAoaSA9IDA7IGkgPCAxNjsgaSsrKQogCQlsaW5lYXJfbHV0W2ldID0gMHhGRkZGICogaSAvIDE1
OwpAQCAtMTM1MCwxMCArMTM1MCwxMyBAQCBzdGF0aWMgaW50IGRtX2xhdGVfaW5pdCh2b2lkICpo
YW5kbGUpCiAJICovCiAJcGFyYW1zLm1pbl9hYm1fYmFja2xpZ2h0ID0gMHgyOEY7CiAKLQlyZXQg
PSBkbWN1X2xvYWRfaXJhbShkbWN1LCBwYXJhbXMpOworCS8qIHRvZG8gd2lsbCBlbmFibGUgZm9y
IG5hdmkxMCAqLworCWlmIChhZGV2LT5hc2ljX3R5cGUgPD0gQ0hJUF9SQVZFTikgeworCQlyZXQg
PSBkbWN1X2xvYWRfaXJhbShkbWN1LCBwYXJhbXMpOwogCi0JaWYgKCFyZXQpCi0JCXJldHVybiAt
RUlOVkFMOworCQlpZiAoIXJldCkKKwkJCXJldHVybiAtRUlOVkFMOworCX0KIAogCXJldHVybiBk
ZXRlY3RfbXN0X2xpbmtfZm9yX2FsbF9jb25uZWN0b3JzKGFkZXYtPmRkZXYpOwogfQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKaW5kZXggNGFjYWY0YmU4YTgxLi40NzQz
MWNhNjk4NmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwpAQCAt
MTAxMSwxNyArMTAxMSw5IEBAIHN0YXRpYyB2b2lkIHByb2dyYW1fdGltaW5nX3N5bmMoCiAJCQl9
CiAJCX0KIAotCQkvKiBzZXQgZmlyc3QgdW5ibGFua2VkIHBpcGUgYXMgbWFzdGVyICovCisJCS8q
IHNldCBmaXJzdCBwaXBlIHdpdGggcGxhbmUgYXMgbWFzdGVyICovCiAJCWZvciAoaiA9IDA7IGog
PCBncm91cF9zaXplOyBqKyspIHsKLQkJCWJvb2wgaXNfYmxhbmtlZDsKLQotCQkJaWYgKHBpcGVf
c2V0W2pdLT5zdHJlYW1fcmVzLm9wcC0+ZnVuY3MtPmRwZ19pc19ibGFua2VkKQotCQkJCWlzX2Js
YW5rZWQgPQotCQkJCQlwaXBlX3NldFtqXS0+c3RyZWFtX3Jlcy5vcHAtPmZ1bmNzLT5kcGdfaXNf
YmxhbmtlZChwaXBlX3NldFtqXS0+c3RyZWFtX3Jlcy5vcHApOwotCQkJZWxzZQotCQkJCWlzX2Js
YW5rZWQgPQotCQkJCQlwaXBlX3NldFtqXS0+c3RyZWFtX3Jlcy50Zy0+ZnVuY3MtPmlzX2JsYW5r
ZWQocGlwZV9zZXRbal0tPnN0cmVhbV9yZXMudGcpOwotCQkJaWYgKCFpc19ibGFua2VkKSB7CisJ
CQlpZiAocGlwZV9zZXRbal0tPnBsYW5lX3N0YXRlKSB7CiAJCQkJaWYgKGogPT0gMCkKIAkJCQkJ
YnJlYWs7CiAKQEAgLTEwNDIsMTcgKzEwMzQsOSBAQCBzdGF0aWMgdm9pZCBwcm9ncmFtX3RpbWlu
Z19zeW5jKAogCQkJCXN0YXR1cy0+dGltaW5nX3N5bmNfaW5mby5tYXN0ZXIgPSBmYWxzZTsKIAog
CQl9Ci0JCS8qIHJlbW92ZSBhbnkgb3RoZXIgdW5ibGFua2VkIHBpcGVzIGFzIHRoZXkgaGF2ZSBh
bHJlYWR5IGJlZW4gc3luY2VkICovCisJCS8qIHJlbW92ZSBhbnkgb3RoZXIgcGlwZXMgd2l0aCBw
bGFuZSBhcyB0aGV5IGhhdmUgYWxyZWFkeSBiZWVuIHN5bmNlZCAqLwogCQlmb3IgKGogPSBqICsg
MTsgaiA8IGdyb3VwX3NpemU7IGorKykgewotCQkJYm9vbCBpc19ibGFua2VkOwotCi0JCQlpZiAo
cGlwZV9zZXRbal0tPnN0cmVhbV9yZXMub3BwLT5mdW5jcy0+ZHBnX2lzX2JsYW5rZWQpCi0JCQkJ
aXNfYmxhbmtlZCA9Ci0JCQkJCXBpcGVfc2V0W2pdLT5zdHJlYW1fcmVzLm9wcC0+ZnVuY3MtPmRw
Z19pc19ibGFua2VkKHBpcGVfc2V0W2pdLT5zdHJlYW1fcmVzLm9wcCk7Ci0JCQllbHNlCi0JCQkJ
aXNfYmxhbmtlZCA9Ci0JCQkJCXBpcGVfc2V0W2pdLT5zdHJlYW1fcmVzLnRnLT5mdW5jcy0+aXNf
YmxhbmtlZChwaXBlX3NldFtqXS0+c3RyZWFtX3Jlcy50Zyk7Ci0JCQlpZiAoIWlzX2JsYW5rZWQp
IHsKKwkJCWlmIChwaXBlX3NldFtqXS0+cGxhbmVfc3RhdGUpIHsKIAkJCQlncm91cF9zaXplLS07
CiAJCQkJcGlwZV9zZXRbal0gPSBwaXBlX3NldFtncm91cF9zaXplXTsKIAkJCQlqLS07CkBAIC0y
NTMzLDEyICsyNTE3LDYgQEAgdm9pZCBkY19jb21taXRfdXBkYXRlc19mb3Jfc3RyZWFtKHN0cnVj
dCBkYyAqZGMsCiAKIAljb3B5X3N0cmVhbV91cGRhdGVfdG9fc3RyZWFtKGRjLCBjb250ZXh0LCBz
dHJlYW0sIHN0cmVhbV91cGRhdGUpOwogCi0JaWYgKCFkYy0+cmVzX3Bvb2wtPmZ1bmNzLT52YWxp
ZGF0ZV9iYW5kd2lkdGgoZGMsIGNvbnRleHQsIGZhbHNlKSkgewotCQlEQ19FUlJPUigiTW9kZSB2
YWxpZGF0aW9uIGZhaWxlZCBmb3Igc3RyZWFtIHVwZGF0ZSFcbiIpOwotCQlkY19yZWxlYXNlX3N0
YXRlKGNvbnRleHQpOwotCQlyZXR1cm47Ci0JfQotCiAJY29tbWl0X3BsYW5lc19mb3Jfc3RyZWFt
KAogCQkJCWRjLAogCQkJCXNyZl91cGRhdGVzLAo=


--=-qZ+U8iwZAy4lzJmyNveR
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=-qZ+U8iwZAy4lzJmyNveR--

