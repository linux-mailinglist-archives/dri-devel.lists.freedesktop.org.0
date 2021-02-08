Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD767313A63
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 18:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4496E958;
	Mon,  8 Feb 2021 17:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A84A6E957;
 Mon,  8 Feb 2021 17:04:34 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id s11so7012860qtq.10;
 Mon, 08 Feb 2021 09:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=yYHPuLQhqg2/MO19O/qWpBtGYxCZFateYeKjTwt0Dnk=;
 b=bzfE6+5Uh4qjhv+w5v7WiHOrC8k0ZpP8cK1kc15ZwowEtd0szq+YbU/7wtIBZ7FMhX
 R5aLREt2XWhvHyE7X9IzgF6l8Jhav+ykblIOB6tZXkFxJsEK0Xxg0dAz5e1njb0DcjjY
 uA7NAl5Fj60mcsCn3xhwG1C8hM2+XykChH2wNnw4VYM0FhZgaTiDxSb8cA6c7a/ScewO
 uojltY2pP14lb/DsXGjzp9A6LQz5jzNkCn17RmryxPqaX9lL0n/6XRzCmkns/QfSfGBV
 0VCoIj+gza/KM37gJ1Sh4hCFlGSMTMXk7Bdt0N4XyaFxMJ1tgGij8+UUxYrHMf1Inrsk
 oeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=yYHPuLQhqg2/MO19O/qWpBtGYxCZFateYeKjTwt0Dnk=;
 b=sR5CVjEh15Hr5Z6/hr8G8OVgHK4N7SVZb7WsSOu9HDyB3QXeLDW2t5L138tl29VZsS
 3BMId+M0A3sMP0LWVad6vSzHEm06Qxl04bACPRNuh3WEJI6gjmBWLPm6MnoT2ke/c33n
 KFof/m8QnCdGqC16Uofo+kowXKXgmgffF1rFJxCdxzW+Spc3q5dFa7HFVa8bGUBkNGph
 /ZI1dP5Bt2u0a2/Ulckk75LLOsk24siS1R6Sd7aRDBH9AimZbd+oftUftYtqSNMrNlDZ
 rn8VvilWjbYwgqHYsqOukhzbCRc0hZ9c+Tt4I79qMIKLRreyd4jlufuYh32ci4XYS4j7
 Hmpg==
X-Gm-Message-State: AOAM5334/fUFNmrJMF8HUTyp8EbOYVvJgnB8OAJkeLbOM/vLZ2JHhrS5
 XACSYHACxAiW/76pYWplHx8=
X-Google-Smtp-Source: ABdhPJwQ30vNvWbh2hoYyP7v8aMU5Iz5/oSn/2CudaWEdhPF2k+/Q+m0GYdn4aKtYID+BGi/WN0iSA==
X-Received: by 2002:ac8:5c0a:: with SMTP id i10mr15472576qti.239.1612803873575; 
 Mon, 08 Feb 2021 09:04:33 -0800 (PST)
Received: from ?IPv6:2601:5c0:c200:27c6:15d6:ef8f:290b:734a?
 ([2601:5c0:c200:27c6:15d6:ef8f:290b:734a])
 by smtp.gmail.com with ESMTPSA id i23sm2713366qtq.42.2021.02.08.09.04.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Feb 2021 09:04:32 -0800 (PST)
From: Tong Zhang <ztong0001@gmail.com>
Message-Id: <892A3995-415A-42DC-B0F3-0EA9B6C0AEB5@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] drm/qxl: properly handle device init failures
Date: Mon, 8 Feb 2021 12:04:31 -0500
In-Reply-To: <20210208104149.423758-1-kraxel@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210208104149.423758-1-kraxel@redhat.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: multipart/mixed; boundary="===============0542683378=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0542683378==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_AF31141D-4A04-4B2C-9A7E-1AD23DB21A42"


--Apple-Mail=_AF31141D-4A04-4B2C-9A7E-1AD23DB21A42
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Does this patch fix an issue raised previously? Or should they be used =
together?
=
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2466541.html =
<https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2466541.html=
>=20

IMHO using this patch alone won=E2=80=99t fix the issue --

Best,
- Tong

> On Feb 8, 2021, at 5:41 AM, Gerd Hoffmann <kraxel@redhat.com> wrote:
>=20
> Specifically do not try release resources which where
> not allocated in the first place.
>=20
> Cc: Tong Zhang <ztong0001@gmail.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
> drivers/gpu/drm/qxl/qxl_display.c | 3 +++
> drivers/gpu/drm/qxl/qxl_kms.c     | 4 ++++
> 2 files changed, 7 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c =
b/drivers/gpu/drm/qxl/qxl_display.c
> index c326412136c5..ec50d2cfd4e1 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -1183,6 +1183,9 @@ int qxl_destroy_monitors_object(struct =
qxl_device *qdev)
> {
> 	int ret;
>=20
> +	if (!qdev->monitors_config_bo)
> +		return 0;
> +
> 	qdev->monitors_config =3D NULL;
> 	qdev->ram_header->monitors_config =3D 0;
>=20
> diff --git a/drivers/gpu/drm/qxl/qxl_kms.c =
b/drivers/gpu/drm/qxl/qxl_kms.c
> index 66d74aaaee06..4dc5ad13f12c 100644
> --- a/drivers/gpu/drm/qxl/qxl_kms.c
> +++ b/drivers/gpu/drm/qxl/qxl_kms.c
> @@ -288,6 +288,10 @@ void qxl_device_fini(struct qxl_device *qdev)
> {
> 	int cur_idx;
>=20
> +	/* check if qxl_device_init() was successful (gc_work is =
initialized last) */
> +	if (!qdev->gc_work.func)
> +		return;
> +
> 	for (cur_idx =3D 0; cur_idx < 3; cur_idx++) {
> 		if (!qdev->current_release_bo[cur_idx])
> 			continue;
> --=20
> 2.29.2
>=20


--Apple-Mail=_AF31141D-4A04-4B2C-9A7E-1AD23DB21A42
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Does =
this patch fix an issue raised previously? Or should they be used =
together?<div class=3D""><a =
href=3D"https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg24665=
41.html" =
class=3D"">https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg24=
66541.html</a>&nbsp;<br class=3D""><div><br class=3D""></div><div>IMHO =
using this patch alone won=E2=80=99t fix the issue --</div><div><br =
class=3D""></div><div>Best,</div><div>- Tong</div><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On Feb =
8, 2021, at 5:41 AM, Gerd Hoffmann &lt;<a =
href=3D"mailto:kraxel@redhat.com" class=3D"">kraxel@redhat.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">Specifically do not try release resources which where<br =
class=3D"">not allocated in the first place.<br class=3D""><br =
class=3D"">Cc: Tong Zhang &lt;<a href=3D"mailto:ztong0001@gmail.com" =
class=3D"">ztong0001@gmail.com</a>&gt;<br class=3D"">Signed-off-by: Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" =
class=3D"">kraxel@redhat.com</a>&gt;<br class=3D"">---<br class=3D""> =
drivers/gpu/drm/qxl/qxl_display.c | 3 +++<br class=3D""> =
drivers/gpu/drm/qxl/qxl_kms.c &nbsp;&nbsp;&nbsp;&nbsp;| 4 ++++<br =
class=3D""> 2 files changed, 7 insertions(+)<br class=3D""><br =
class=3D"">diff --git a/drivers/gpu/drm/qxl/qxl_display.c =
b/drivers/gpu/drm/qxl/qxl_display.c<br class=3D"">index =
c326412136c5..ec50d2cfd4e1 100644<br class=3D"">--- =
a/drivers/gpu/drm/qxl/qxl_display.c<br class=3D"">+++ =
b/drivers/gpu/drm/qxl/qxl_display.c<br class=3D"">@@ -1183,6 +1183,9 @@ =
int qxl_destroy_monitors_object(struct qxl_device *qdev)<br class=3D""> =
{<br class=3D""> <span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>int ret;<br class=3D""><br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(!qdev-&gt;monitors_config_bo)<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
0;<br class=3D"">+<br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>qdev-&gt;monitors_config =3D =
NULL;<br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>qdev-&gt;ram_header-&gt;monitors_config =3D 0;<br class=3D""><br =
class=3D"">diff --git a/drivers/gpu/drm/qxl/qxl_kms.c =
b/drivers/gpu/drm/qxl/qxl_kms.c<br class=3D"">index =
66d74aaaee06..4dc5ad13f12c 100644<br class=3D"">--- =
a/drivers/gpu/drm/qxl/qxl_kms.c<br class=3D"">+++ =
b/drivers/gpu/drm/qxl/qxl_kms.c<br class=3D"">@@ -288,6 +288,10 @@ void =
qxl_device_fini(struct qxl_device *qdev)<br class=3D""> {<br class=3D""> =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>int cur_idx;<br class=3D""><br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>/* check =
if qxl_device_init() was successful (gc_work is initialized last) */<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if (!qdev-&gt;gc_work.func)<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return;<br class=3D"">+<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>for =
(cur_idx =3D 0; cur_idx &lt; 3; cur_idx++) {<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(!qdev-&gt;current_release_bo[cur_idx])<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>continue;<br class=3D"">-- <br class=3D"">2.29.2<br class=3D""><br =
class=3D""></div></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_AF31141D-4A04-4B2C-9A7E-1AD23DB21A42--

--===============0542683378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0542683378==--
