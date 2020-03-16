Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9F0188738
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D32D6E5A0;
	Tue, 17 Mar 2020 14:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8086E22D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 21:08:42 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id v3so8559182iot.11
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 14:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=wo/9APspSS4rS8U7tPjTfOlMhhXQoedRA6pFf3mKLzc=;
 b=gvXxxq4eLbgX/cPLAsiokviC3qVCimOU3/1nAMTvGdeDxSt+Cc76u4X6EBYePwHGQe
 8YfPVXYkdv6iQeuvkBLtbc2X9Rckcj8geo7gjvS2ZduAZh5A6B3LSvwXFfeDHXOdx3CR
 MTIQKrXrVUOsTI2emQVK3kRMLLGWfu45536CYGCWy87/MUrYPXfH6zhkolsji+HA0zBM
 fDItfoTymm7Ysd+lM7JofWVHmyfqa202ZNhSPN6vG1VAwHR2LbjLWuQoSX9xX5TJDNt6
 8++1rWrtVuX4oGNcA/jgCrAUd0tY9+Alz5YCIKlsPHFbdU4M11rIWjvQkbb8I708p7i+
 ZctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=wo/9APspSS4rS8U7tPjTfOlMhhXQoedRA6pFf3mKLzc=;
 b=rdCeDW9YjOHgrhhZk/YGipy+PsNsvCWHPsBPczZS7IDbSy3FBXR8C/QL77zwLx/PVw
 khJz5SxVBicvyJ7TMpB3alEJOHxUeRYwFmssy//T5IteZVQ7/4xVgjsucymrM9nUSRpd
 UeIH8jGyCRxqqBZgzY5AKGbRnUFV/OpFLqALcQiTs4fIxJonAoZTbUS7Y5EpnLariFeW
 WOOttMcP8gMudlXRTAtwKifyXsicLbJlFyPtAAYCnQuO2x1se24ksV67eabP+uXjp9eW
 /DppJXMwYzIB+2IlQJi0n+e822na8trcAMqWmHQ9T2w+9q96z1HLEGY7qs7v4vkvc3KA
 s+jA==
X-Gm-Message-State: ANhLgQ19uN2xDm8rr32y0KibzO7ocmCKPUbcFKafx4j0tgqYgOE1I4HW
 oH1HwTAJv6Lgu2Xdr1L70UpS35kwUYXcz/5elGPQqOqXW80=
X-Google-Smtp-Source: ADFU+vtnZS1z06s/sRuSr1sqUdpn/OyTwqxSSRSKz51wBJptlzst9Dfi44pbvpSf+iOwfm2xByQ5ShW5wxTMT2xD1nM=
X-Received: by 2002:a02:7b13:: with SMTP id q19mr1823904jac.73.1584392921533; 
 Mon, 16 Mar 2020 14:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200316210413.2321-1-igormtorrente@gmail.com>
In-Reply-To: <20200316210413.2321-1-igormtorrente@gmail.com>
From: Igor Torrente <igormtorrente@gmail.com>
Date: Mon, 16 Mar 2020 18:08:30 -0300
Message-ID: <CAOA8r4HieupER-gW4BU9U8YYC+6eLkSzoS2z-KRrbq4XZb40Ww@mail.gmail.com>
Subject: Fwd: [PATCH] Staging: drm_gem: Fix a typo in a function comment
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Content-Type: multipart/mixed; boundary="===============0244567273=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0244567273==
Content-Type: multipart/alternative; boundary="00000000000045d1e805a0ff393d"

--00000000000045d1e805a0ff393d
Content-Type: text/plain; charset="UTF-8"

Ccing dri-devel and linux-kernel.

---------- Forwarded message ---------
From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Date: Mon, Mar 16, 2020 at 6:04 PM
Subject: [PATCH] Staging: drm_gem: Fix a typo in a function comment
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
<sean@poorly.run>, <airlied@linux.ie>, <daniel@ffwll.ch>, <
sumit.semwal@linaro.org>
Cc: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>, <
Rodrigo.Siqueira@amd.com>, <rodrigosiqueiramelo@gmail.com>, <
andrealmeid@collabora.com>


Replace "pionter" with "pointer" in the
drm_gem_handle_create description.

Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 6e960d57371e..c356379f5e97 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -432,7 +432,7 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
  * drm_gem_handle_create - create a gem handle for an object
  * @file_priv: drm file-private structure to register the handle for
  * @obj: object to register
- * @handlep: pionter to return the created handle to the caller
+ * @handlep: pointer to return the created handle to the caller
  *
  * Create a handle for this object. This adds a handle reference to the
object,
  * which includes a regular reference count. Callers will likely want to
-- 
2.20.1

--00000000000045d1e805a0ff393d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ccing dri-devel and linux-kernel.<br><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">---------- Forwarded messag=
e ---------<br>From: <b class=3D"gmail_sendername" dir=3D"auto">Igor Matheu=
s Andrade Torrente</b> <span dir=3D"auto">&lt;<a href=3D"mailto:igormtorren=
te@gmail.com">igormtorrente@gmail.com</a>&gt;</span><br>Date: Mon, Mar 16, =
2020 at 6:04 PM<br>Subject: [PATCH] Staging: drm_gem: Fix a typo in a funct=
ion comment<br>To:  &lt;<a href=3D"mailto:maarten.lankhorst@linux.intel.com=
">maarten.lankhorst@linux.intel.com</a>&gt;,  &lt;<a href=3D"mailto:mripard=
@kernel.org">mripard@kernel.org</a>&gt;,  &lt;sean@poorly.run&gt;,  &lt;<a =
href=3D"mailto:airlied@linux.ie">airlied@linux.ie</a>&gt;,  &lt;<a href=3D"=
mailto:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt;,  &lt;<a href=3D"mailto:sum=
it.semwal@linaro.org">sumit.semwal@linaro.org</a>&gt;<br>Cc: Igor Matheus A=
ndrade Torrente &lt;<a href=3D"mailto:igormtorrente@gmail.com">igormtorrent=
e@gmail.com</a>&gt;,  &lt;<a href=3D"mailto:Rodrigo.Siqueira@amd.com">Rodri=
go.Siqueira@amd.com</a>&gt;,  &lt;<a href=3D"mailto:rodrigosiqueiramelo@gma=
il.com">rodrigosiqueiramelo@gmail.com</a>&gt;,  &lt;<a href=3D"mailto:andre=
almeid@collabora.com">andrealmeid@collabora.com</a>&gt;<br></div><br><br>Re=
place &quot;pionter&quot; with &quot;pointer&quot; in the<br>
drm_gem_handle_create description.<br>
<br>
Signed-off-by: Igor Matheus Andrade Torrente &lt;<a href=3D"mailto:igormtor=
rente@gmail.com" target=3D"_blank">igormtorrente@gmail.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/drm_gem.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c<br>
index 6e960d57371e..c356379f5e97 100644<br>
--- a/drivers/gpu/drm/drm_gem.c<br>
+++ b/drivers/gpu/drm/drm_gem.c<br>
@@ -432,7 +432,7 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,<=
br>
=C2=A0 * drm_gem_handle_create - create a gem handle for an object<br>
=C2=A0 * @file_priv: drm file-private structure to register the handle for<=
br>
=C2=A0 * @obj: object to register<br>
- * @handlep: pionter to return the created handle to the caller<br>
+ * @handlep: pointer to return the created handle to the caller<br>
=C2=A0 *<br>
=C2=A0 * Create a handle for this object. This adds a handle reference to t=
he object,<br>
=C2=A0 * which includes a regular reference count. Callers will likely want=
 to<br>
-- <br>
2.20.1<br>
<br>
</div></div>

--00000000000045d1e805a0ff393d--

--===============0244567273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0244567273==--
