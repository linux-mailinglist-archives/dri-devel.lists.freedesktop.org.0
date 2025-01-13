Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA843A0B361
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7C510E2DA;
	Mon, 13 Jan 2025 09:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="2WLRAD0o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0418510E2DA
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:44:54 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-ab2aea81cd8so605435866b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 01:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1736761432; x=1737366232;
 darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qIotWzVE6s8sSdHo3yaLBnVGQ0zs47kznAQGZtA0UGo=;
 b=2WLRAD0o8qYRkL4xYfuNzZnj2s1kfnFGIl/HiR/8YAEXdbWwXo3DGO5qtyeO3esH+F
 xGpK9+SriHzr9MD1xScha2ruAtdiM3JjupiD4BriI7H+YJ5DyRHObnatk6wQhb9OYpxP
 82lHqGzeQeNMXL0WmohNGX3PBmiZDhEI6mcwdiChazvWPtOdxNi0XP9VePM/3Fhi/iPn
 /VCeW4rugVw/DWw5lhUg6qBjFaXQU55NIMFeYmAa8lZs0QaTNDlpHQlSK4eC5svnbhh6
 xXOgD2whmOSY+eKyMSSbCOXVOSMQN/fyheneBSOyge1efCaYvPEws6iXWOUM/G4hE0gQ
 d4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736761432; x=1737366232;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qIotWzVE6s8sSdHo3yaLBnVGQ0zs47kznAQGZtA0UGo=;
 b=o+Ne0vsFQKS0dHaq5ATylAb9/OlN8qDM+/yIEA4EXlNJ1fdFxpuFVGsPT7avAhsuKm
 5cYl5JlqiEz0f0pL5kO/00Y20QOOQMwyrw9nJieJ+tqrKHHekSrymvjJSD7QmTI2LzDU
 WtXjyydBWtDxGyovfhdh51p00nSDLS+Ysc3tJDTXP9uHsVRNtc6BZJplQPu526/7H9y7
 j0fmYusH0hz0E5TuNcwiEJckafGK26YL72dDBblPm0gl9oiwcW1vea5LHGTcM+hICRZJ
 vioR1L8OhF0pSCv/lUaKg1XiZjJhvpufMsUBVLRUZ2i0BgPf/rpLi4acLnM1NxE6NxQ9
 mbmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5lHbTxTM/8cgn4DCdWOCjUeWPgOTCFhNS343asrDD/ZAhHZd4+gCZU2PFZ8ms22/edQSNEpp/Y+U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjNncbcvemOO2fqZYn4Kh4kbg7fQENkId4f59Bt1/PHlVzt3AM
 KggDlZPiJZwCqtpI1FjnIewGRfqT5+7sXDOj1uncAxZLeq0dJZ1V5gafNvoE0iaCqfvAD+MUx0N
 D5WwuLb8T7D1RDGM3w0WGdmT0mYY0d0W+CghBuA==
X-Gm-Gg: ASbGncvQQRzIZivYG4tm6sm0c5eoHqMIqG/K2fDKcb5FPexh1VhT0zZlyFzpV7cTZN3
 AnT0+i9R/0cLE07kGhRA1qNHsiDTGry6I922l8pI=
X-Google-Smtp-Source: AGHT+IF/bP3XTMp11cKxtA+NpAzdOOFqCXirQEUt6QHkVabfqigBUuFEXG3KWnL1F42bOGChH8WJsGZaQiza15L/2JI=
X-Received: by 2002:a17:906:fe08:b0:aa6:9198:75a2 with SMTP id
 a640c23a62f3a-ab2abc6e25amr1636858066b.44.1736761432609; Mon, 13 Jan 2025
 01:43:52 -0800 (PST)
MIME-Version: 1.0
References: <20241227101913.1711071-1-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20241227101913.1711071-1-yelangyan@huaqin.corp-partner.google.com>
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Date: Mon, 13 Jan 2025 17:43:41 +0800
X-Gm-Features: AbW1kvaNhiYNmAWdex6hwG44G1A0ob6dtFkI8nquDnYzrtdNfbamNUbjUa_yNCY
Message-ID: <CA++9cvomH1ozs_wyHWN=wKadXThZwMj29r=6tjEe_MRnXTqWkg@mail.gmail.com>
Subject: Fwd: [PATCH] drm/panel-edp: Add CSW MNB601LS1-3
To: dianders@chromium.org, neil.armstrong@linaro.org, 
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="0000000000004032eb062b93486c"
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

--0000000000004032eb062b93486c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ---------
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Date: Fri, Dec 27, 2024 at 6:19=E2=80=AFPM
Subject: [PATCH] drm/panel-edp: Add CSW MNB601LS1-3
To: <dianders@chromium.org>, <neil.armstrong@linaro.org>, <
quic_jesszhan@quicinc.com>, <maarten.lankhorst@linux.intel.com>, <
mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>, <
simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>, <
linux-kernel@vger.kernel.org>
Cc: <dianders@google.com>, Langyan Ye <
yelangyan@huaqin.corp-partner.google.com>


Add support for the CSW MNB601LS1-3, pleace the EDID here for
subsequent reference.

00 ff ff ff ff ff ff 00 0e 77 03 11 00 00 00 00
00 22 01 04 95 1a 0e 78 03 a1 35 9b 5e 58 91 25
1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 09 1e 56 dc 50 00 28 30 30 20
36 00 00 90 10 00 00 1a 00 00 00 fd 00 28 3c 30
30 08 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
53 4f 54 20 54 39 0a 20 20 20 20 20 00 00 00 fe
00 4d 4e 42 36 30 31 4c 53 31 2d 33 0a 20 00 32

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c
b/drivers/gpu/drm/panel/panel-edp.c
index f8511fe5fb0d..4e6f07c299df 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1953,6 +1953,7 @@ static const struct edp_panel_entry edp_panels[] =3D =
{
        EDP_PANEL_ENTRY('C', 'S', 'O', 0x1200, &delay_200_500_e50_p2e200,
"MNC207QS1-1"),

        EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50,
"MNB601LS1-1"),
+       EDP_PANEL_ENTRY('C', 'S', 'W', 0x1103, &delay_200_500_e80_d50,
"MNB601LS1-3"),
        EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50,
"MNB601LS1-4"),

        EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d51, &delay_200_500_e200,
"Unknown"),
--=20
2.34.1

--0000000000004032eb062b93486c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote gmail_quote_container"><=
div dir=3D"ltr" class=3D"gmail_attr">---------- Forwarded message ---------=
<br>From: <strong class=3D"gmail_sendername" dir=3D"auto">Langyan Ye</stron=
g> <span dir=3D"auto">&lt;<a href=3D"mailto:yelangyan@huaqin.corp-partner.g=
oogle.com">yelangyan@huaqin.corp-partner.google.com</a>&gt;</span><br>Date:=
 Fri, Dec 27, 2024 at 6:19=E2=80=AFPM<br>Subject: [PATCH] drm/panel-edp: Ad=
d CSW MNB601LS1-3<br>To:  &lt;<a href=3D"mailto:dianders@chromium.org">dian=
ders@chromium.org</a>&gt;,  &lt;<a href=3D"mailto:neil.armstrong@linaro.org=
">neil.armstrong@linaro.org</a>&gt;,  &lt;<a href=3D"mailto:quic_jesszhan@q=
uicinc.com">quic_jesszhan@quicinc.com</a>&gt;,  &lt;<a href=3D"mailto:maart=
en.lankhorst@linux.intel.com">maarten.lankhorst@linux.intel.com</a>&gt;,  &=
lt;<a href=3D"mailto:mripard@kernel.org">mripard@kernel.org</a>&gt;,  &lt;<=
a href=3D"mailto:tzimmermann@suse.de">tzimmermann@suse.de</a>&gt;,  &lt;<a =
href=3D"mailto:airlied@gmail.com">airlied@gmail.com</a>&gt;,  &lt;<a href=
=3D"mailto:simona@ffwll.ch">simona@ffwll.ch</a>&gt;,  &lt;<a href=3D"mailto=
:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>&gt;, =
 &lt;<a href=3D"mailto:linux-kernel@vger.kernel.org">linux-kernel@vger.kern=
el.org</a>&gt;<br>Cc:  &lt;<a href=3D"mailto:dianders@google.com">dianders@=
google.com</a>&gt;, Langyan Ye &lt;<a href=3D"mailto:yelangyan@huaqin.corp-=
partner.google.com">yelangyan@huaqin.corp-partner.google.com</a>&gt;<br></d=
iv><br><br>Add support for the CSW MNB601LS1-3, pleace the EDID here for<br=
>
subsequent reference.<br>
<br>
00 ff ff ff ff ff ff 00 0e 77 03 11 00 00 00 00<br>
00 22 01 04 95 1a 0e 78 03 a1 35 9b 5e 58 91 25<br>
1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01<br>
01 01 01 01 01 01 09 1e 56 dc 50 00 28 30 30 20<br>
36 00 00 90 10 00 00 1a 00 00 00 fd 00 28 3c 30<br>
30 08 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43<br>
53 4f 54 20 54 39 0a 20 20 20 20 20 00 00 00 fe<br>
00 4d 4e 42 36 30 31 4c 53 31 2d 33 0a 20 00 32<br>
<br>
Signed-off-by: Langyan Ye &lt;<a href=3D"mailto:yelangyan@huaqin.corp-partn=
er.google.com" target=3D"_blank">yelangyan@huaqin.corp-partner.google.com</=
a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/panel/panel-edp.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pane=
l-edp.c<br>
index f8511fe5fb0d..4e6f07c299df 100644<br>
--- a/drivers/gpu/drm/panel/panel-edp.c<br>
+++ b/drivers/gpu/drm/panel/panel-edp.c<br>
@@ -1953,6 +1953,7 @@ static const struct edp_panel_entry edp_panels[] =3D =
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;C&#39;, &#39;S&#39;, &#39;=
O&#39;, 0x1200, &amp;delay_200_500_e50_p2e200, &quot;MNC207QS1-1&quot;),<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;C&#39;, &#39;S&#39;, &#39;=
W&#39;, 0x1100, &amp;delay_200_500_e80_d50, &quot;MNB601LS1-1&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0EDP_PANEL_ENTRY(&#39;C&#39;, &#39;S&#39;, &#39;=
W&#39;, 0x1103, &amp;delay_200_500_e80_d50, &quot;MNB601LS1-3&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;C&#39;, &#39;S&#39;, &#39;=
W&#39;, 0x1104, &amp;delay_200_500_e50, &quot;MNB601LS1-4&quot;),<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;H&#39;, &#39;K&#39;, &#39;=
C&#39;, 0x2d51, &amp;delay_200_500_e200, &quot;Unknown&quot;),<br>
-- <br>
2.34.1<br>
<br>
</div></div>

--0000000000004032eb062b93486c--
