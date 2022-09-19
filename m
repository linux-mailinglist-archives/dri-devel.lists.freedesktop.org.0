Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 603955BD245
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 18:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA43B10E699;
	Mon, 19 Sep 2022 16:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10E010E69A;
 Mon, 19 Sep 2022 16:34:06 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 j17-20020a9d7f11000000b0065a20212349so986422otq.12; 
 Mon, 19 Sep 2022 09:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ZLiOCNNF7wdWCABGAiGK8/oWijAvCIwWJHaJzbioRxM=;
 b=nY+pSkSNHqCwgtOKWBI3vQ+7D3KMosqNkG9NQy+uhbnu5FMJZkFy8tjyyEXUhOBDv+
 nYPaJDkq+xFcrYLY0JkhfgmUY+NcDQQpL0Im6CoXPfPRUE8ZYzmm/q2rVBZAEldwA5wY
 JD4qMfqJrkDkjjXkUm7bQqhDzMraaOF45/LpssN8HoilzMlg10z2/G1F9aGRVva3fwSi
 2hYDZ3ECKF18w+c1Vlumuks5PYGholLxd6uMqdKLLxWQX2IVeBKvFgdIwWBOr9QvrZ+M
 +mm6RcrmwWSq/ApAM0DtxDlSd0tEtWOGUDZPHVHxq39ofhSbwjC30rR1zeVEK0Y69xUL
 nMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ZLiOCNNF7wdWCABGAiGK8/oWijAvCIwWJHaJzbioRxM=;
 b=VYfgE//YcLPxd1FcaM3Ph1ZK13HWd0LZ/xBL5DliBW7tm1q7ZGEqdEZkEM7bx22BG3
 F2M+kxzAcMMePwB6y9a2pChAqwOXnLXkIqe00GAK8aw6m1ds7O5rkr2pX897pFKDEyC6
 Ib4eGjOz7DlKOMdFGbJadDaSn9an8zLyW0TvzVDVhtTYlGRlScZ3Z1WeypK7wZGDjlCb
 5yN0LPgDbKiTvAbGrtywxXXMDYGpPAQZojB7DFolsDla1kaxF7zFub5wLnim9b0zLcNm
 v3y2p+0HXya6zqlvSxq7EJrC695UxSzk5mUPeqc/rKBTwaE8NRsWb4LDo44aroklPl3t
 IdDg==
X-Gm-Message-State: ACrzQf019o3qUdb62sVUbCszllWVLyXDveNsIxqn2HTxoZtGnmRk/0bv
 IoTVMMIyIhx620k6cRqzcUm/fc1Lp6Ni5IvzjeE=
X-Google-Smtp-Source: AMsMyM4sipQbglJKguzhieKBP2oCrd47THdmXYiXWCu3NuliJqL9QXCYcig3ahqFxzgD4GZoMeUgxmjQRxKFfln6t1Y=
X-Received: by 2002:a9d:376:0:b0:655:b4bc:fd6e with SMTP id
 109-20020a9d0376000000b00655b4bcfd6emr8479616otv.233.1663605245951; Mon, 19
 Sep 2022 09:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_O0W-ipCCy3hsub5GwirjDTM76Xn3kAxgyZT5V+vDguSA@mail.gmail.com>
 <20220918120926.10322-1-user@am64>
In-Reply-To: <20220918120926.10322-1-user@am64>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 19 Sep 2022 12:33:54 -0400
Message-ID: <CADnq5_Py+dgAxa5Y1tzbWx6xRt1g2LQ1JsiJD6ewYYTzjjaPcw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: use dirty framebuffer helper
To: root <arthur.marsh@internode.on.net>
Content-Type: multipart/mixed; boundary="000000000000bb74c905e90a4789"
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
Cc: guchun.chen@amd.com, airlied@linux.ie, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 aurabindo.pillai@amd.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, greenfoo@u92.eu, hamza.mahfooz@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000bb74c905e90a4789
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 18, 2022 at 8:09 AM root <arthur.marsh@internode.on.net> wrote:
>
> Hi, I recently experienced lock-ups that only responded to magic sysreq
> reboots when the amdgpu module was loading on my pc (Athlon II X4 640 CPU,
> with Radeon R7 250 - Cape Verde).
>
> .config has:
>
> CONFIG_DRM_AMDGPU=m
> CONFIG_DRM_AMDGPU_SI=y
> # CONFIG_DRM_AMDGPU_CIK is not set
> # CONFIG_DRM_AMDGPU_USERPTR is not set
>
> kernel command line has:
>
> amdgpu.audio=1 amdgpu.si_support=1 radeon.si_support=0 page_owner=on \
> amdgpu.gpu_recovery=1
>
> Bisecting lead to:
>
> commit 66f99628eb24409cb8feb5061f78283c8b65f820
> Author: Hamza Mahfooz <hamza.mahfooz@amd.com>
> Date:   Tue Sep 6 15:01:49 2022 -0400
>
>     drm/amdgpu: use dirty framebuffer helper
>
>     Currently, we aren't handling DRM_IOCTL_MODE_DIRTYFB. So, use
>     drm_atomic_helper_dirtyfb() as the dirty callback in the amdgpu_fb_funcs
>     struct.
>
>     Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>     Acked-by: Alex Deucher <alexander.deucher@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index c20922a5af9f..5b09c8f4fe95 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -38,6 +38,7 @@
>  #include <linux/pci.h>
>  #include <linux/pm_runtime.h>
>  #include <drm/drm_crtc_helper.h>
> +#include <drm/drm_damage_helper.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_fb_helper.h>
> @@ -496,6 +497,7 @@ bool amdgpu_display_ddc_probe(struct amdgpu_connector *amdgpu_connector,
>  static const struct drm_framebuffer_funcs amdgpu_fb_funcs = {
>         .destroy = drm_gem_fb_destroy,
>         .create_handle = drm_gem_fb_create_handle,
> +       .dirty = drm_atomic_helper_dirtyfb,
>  };
>
>  uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
>
> After doing a git bisect reset, git pull and reverting the patch above, I
> rebuilt the kernel and am successfully running with the amdgpu module loaded
> and using the Radeon R7 250 GPU.
>
> I am happy to supply any further configuration details.

Does the attached patch help?

Alex


>
> Arthur Marsh.

--000000000000bb74c905e90a4789
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amdgpu-don-t-register-a-dirty-callback-for-non-a.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amdgpu-don-t-register-a-dirty-callback-for-non-a.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l88zlnu70>
X-Attachment-Id: f_l88zlnu70

RnJvbSA1ZTQ5YzY4YzFhYzFmYmI5OGIxYzg0NDA3NDg1YWJmYjdkMzA5NzgzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IE1vbiwgMTkgU2VwIDIwMjIgMTI6MjY6MjAgLTA0MDAKU3ViamVjdDogW1BBVENI
XSBkcm0vYW1kZ3B1OiBkb24ndCByZWdpc3RlciBhIGRpcnR5IGNhbGxiYWNrIGZvciBub24tYXRv
bWljCgpTb21lIGFzaWNzIHN0aWxsIHN1cHBvcnQgbm9uLWF0b21pYyBjb2RlIHBhdGhzLgoKRml4
ZXM6IDY2Zjk5NjI4ZWIyNDQwICgiZHJtL2FtZGdwdTogdXNlIGRpcnR5IGZyYW1lYnVmZmVyIGhl
bHBlciIpClJlcG9ydGVkLWJ5OiBBcnRodXIgTWFyc2ggPGFydGh1ci5tYXJzaEBpbnRlcm5vZGUu
b24ubmV0PgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXkuYyB8
IDExICsrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
aXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jCmlu
ZGV4IDViMDljOGY0ZmU5NS4uMjM5OThmNzI3YzdmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMKQEAgLTM5LDYgKzM5LDcgQEAKICNpbmNsdWRlIDxsaW51
eC9wbV9ydW50aW1lLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9jcnRjX2hlbHBlci5oPgogI2luY2x1
ZGUgPGRybS9kcm1fZGFtYWdlX2hlbHBlci5oPgorI2luY2x1ZGUgPGRybS9kcm1fZHJ2Lmg+CiAj
aW5jbHVkZSA8ZHJtL2RybV9lZGlkLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fZnJhbWVidWZm
ZXJfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9mYl9oZWxwZXIuaD4KQEAgLTQ5Nyw2ICs0
OTgsMTEgQEAgYm9vbCBhbWRncHVfZGlzcGxheV9kZGNfcHJvYmUoc3RydWN0IGFtZGdwdV9jb25u
ZWN0b3IgKmFtZGdwdV9jb25uZWN0b3IsCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9mcmFtZWJ1
ZmZlcl9mdW5jcyBhbWRncHVfZmJfZnVuY3MgPSB7CiAJLmRlc3Ryb3kgPSBkcm1fZ2VtX2ZiX2Rl
c3Ryb3ksCiAJLmNyZWF0ZV9oYW5kbGUgPSBkcm1fZ2VtX2ZiX2NyZWF0ZV9oYW5kbGUsCit9Owor
CitzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9mcmFtZWJ1ZmZlcl9mdW5jcyBhbWRncHVfZmJfZnVu
Y3NfYXRvbWljID0geworCS5kZXN0cm95ID0gZHJtX2dlbV9mYl9kZXN0cm95LAorCS5jcmVhdGVf
aGFuZGxlID0gZHJtX2dlbV9mYl9jcmVhdGVfaGFuZGxlLAogCS5kaXJ0eSA9IGRybV9hdG9taWNf
aGVscGVyX2RpcnR5ZmIsCiB9OwogCkBAIC0xMTAyLDcgKzExMDgsMTAgQEAgc3RhdGljIGludCBh
bWRncHVfZGlzcGxheV9nZW1fZmJfdmVyaWZ5X2FuZF9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsCiAJaWYgKHJldCkKIAkJZ290byBlcnI7CiAKLQlyZXQgPSBkcm1fZnJhbWVidWZmZXJfaW5p
dChkZXYsICZyZmItPmJhc2UsICZhbWRncHVfZmJfZnVuY3MpOworCWlmIChkcm1fZHJ2X3VzZXNf
YXRvbWljX21vZGVzZXQoZGV2KSkKKwkJcmV0ID0gZHJtX2ZyYW1lYnVmZmVyX2luaXQoZGV2LCAm
cmZiLT5iYXNlLCAmYW1kZ3B1X2ZiX2Z1bmNzX2F0b21pYyk7CisJZWxzZQorCQlyZXQgPSBkcm1f
ZnJhbWVidWZmZXJfaW5pdChkZXYsICZyZmItPmJhc2UsICZhbWRncHVfZmJfZnVuY3MpOwogCWlm
IChyZXQpCiAJCWdvdG8gZXJyOwogCi0tIAoyLjM3LjMKCg==
--000000000000bb74c905e90a4789--
