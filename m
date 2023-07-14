Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C000A7531EF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 08:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED2610E1AA;
	Fri, 14 Jul 2023 06:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B5C10E7C5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 06:28:55 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R2M4h5nSBzBJYck
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 14:28:52 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-type:message-id:user-agent:references:in-reply-to
 :subject:to:from:date:mime-version; s=dkim; t=1689316132; x=
 1691908133; bh=Ol3IQhKgzBCZGmKOlNmHOWX70IJ9sMdt+5yAfWpkd9I=; b=S
 0AhCtCE0qM1Vl/csHzzcyfUB36+meeCQUTnV+a2D+tWLsauhgl836ROMpLtthVzA
 a4AilcpHbHV0OstKSg3jfalUPb6C57wD2CtU2htw3JGP+LGVu8zGVGLYmaapWAMw
 tWjOKb8tCIFAczKyVG4CJk0eKnSOo7ZWZLYMgVnD/ypArBXz377WKYkpwoxZW5gK
 87+mFKCCEd13pk/zVerT4W/szj+7ahdVb42WxSwLxkhpMl/0PcBY3gkbanIDAEvM
 NsEJgNsGf2ZtsU1hfBghU+211T+ROleJFHX7QkvxSkyeS+K/xzj6k6Nl2+C10c2h
 w8Tan1mI4PbxC7atwWBdA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id qLXeIiAdf3Dt for <dri-devel@lists.freedesktop.org>;
 Fri, 14 Jul 2023 14:28:52 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R2M4h3RbWzBJFS7;
 Fri, 14 Jul 2023 14:28:52 +0800 (CST)
MIME-Version: 1.0
Date: Fri, 14 Jul 2023 14:28:52 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/amd/amd_shared.h: remove spaces after '*'
In-Reply-To: <20230714062731.13857-1-xujianghui@cdjrlc.com>
References: <20230714062731.13857-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <440c92f473b90edfb32b46888f3291f8@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: multipart/alternative;
 boundary="=_f5b9982a35447fc2e1a1f4b8779a8da5"
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=_f5b9982a35447fc2e1a1f4b8779a8da5
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed


Fix four occurrences of the checkpatch.pl error:

ERROR: trailing whitespace

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/include/amd_shared.h 
b/drivers/gpu/drm/amd/include/amd_shared.h
index f175e65b853a..46ed216f04bf 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -60,7 +60,7 @@ enum amd_apu_flags {
  * acquires the list of IP blocks for the GPU in use on initialization.
  * It can then operate on this list to perform standard driver 
operations
  * such as: init, fini, suspend, resume, etc.
-*
+*
  *
  * IP block implementations are named using the following convention:
  * <functionality>_v<version> (E.g.: gfx_v6_0).
--=_f5b9982a35447fc2e1a1f4b8779a8da5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 12pt; font-family: Verdana,Gen=
eva,sans-serif'>
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
Fix four occurrences of the checkpatch.pl error:<br /><br />ERROR: trailing=
 whitespace<br /><br />Signed-off-by: Ran Sun &lt;sunran001@208suo.com&gt;<=
br />---<br />&nbsp;drivers/gpu/drm/amd/include/amd_shared.h | 2 +-<br />&n=
bsp;1 file changed, 1 insertion(+), 1 deletion(-)<br /><br />diff --git a/d=
rivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_s=
hared.h<br />index f175e65b853a..46ed216f04bf 100644<br />--- a/drivers/gpu=
/drm/amd/include/amd_shared.h<br />+++ b/drivers/gpu/drm/amd/include/amd_sh=
ared.h<br />@@ -60,7 +60,7 @@ enum amd_apu_flags {<br />&nbsp;* acquires th=
e list of IP blocks for the GPU in use on initialization.<br />&nbsp;* It c=
an then operate on this list to perform standard driver operations<br />&nb=
sp;* such as: init, fini, suspend, resume, etc.<br />-* <br />+*<br />&nbsp=
;*<br />&nbsp;* IP block implementations are named using the following conv=
ention:<br />&nbsp;* &lt;functionality&gt;_v&lt;version&gt; (E.g.: gfx_v6_0=
).</div>

</body></html>

--=_f5b9982a35447fc2e1a1f4b8779a8da5--
