Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E5DA0B359
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB66810E605;
	Mon, 13 Jan 2025 09:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="RyN/0fTy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABEA10E605
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:43:27 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-aaf8f0ea963so803884466b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 01:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1736761346; x=1737366146;
 darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RLVG7xk1BLUHNlumQdDgSHSeeficXuPL/nsVcIrRKzc=;
 b=RyN/0fTysApZsVw3qY9wM1fckywLKP30S2sYeIu+7noL67cW8zZl6OmgXsf2bVW11V
 jKnKKn9aFKeHRSlXmDeZ3JmXC81/TPrIJh7DJHAd9m5xE41MAAzTX7xmtiq8St1enF94
 brj1sMcFHFAbf5eJIlcTtPhT0rv2W9BqZOY3p0oze3xwa9gnigv3aMnEV+OK2fYIi054
 s0XlsPrK24xLT4V0iBsnntQlkHXpgC7oY6Wu62CO7aQ72Nau3MUL4QjMit/yl+32Ql+S
 FctjV+/A5/5ZpNGlQTJcssOQsKfjyYz7XWHp0WMT611z7BD1MH5s6f651v+aYKNBlcbf
 FP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736761346; x=1737366146;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RLVG7xk1BLUHNlumQdDgSHSeeficXuPL/nsVcIrRKzc=;
 b=a/Sgclv3QqJlzFwnCkwiADkvF0NxLiYvoDv5X/QiT8IrWjGn/TDRqtqdDhHof3b+fR
 h+NlaXBFNutKX6Z00Sm8cevQMH5Wh0U/63l0YaG49Vik9uBBEuP7FbDF4EJ/oKY1Beol
 8OwrvfITNsv9wrtSKHSTU330ZhwOQx8bPaXBcYxmF9hQfM6qbmrQlD5LjqPok/0AjxTd
 lMAbNvIlPMtkrjyvKSR/wGKVsx+Sj5a4dgtCA/KG1eNtLlXk4dANBWxmeVg+C507xGBk
 ClTo4NRB30IGv0ZSmyzOPR5h7LYVs7eBnwhqMxEil95bRP506QMFxI99LCaJG3/QUtlR
 0Ucw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGgF2Rduj6D5K66mnogmq2uKO4WZnxdLYRhAidLg8a8ZC9AxG+gS013sf7dgCd+z1vrslRSOI3nKs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXwisLt1O2Xy6M85jZI3JOov1UdJn6e6tbngddYKtwqKYeiAuR
 pGG3xrkwS5PzP5EiGtW5y60iQQkfkYAJqlR0M0AziGpyCbIWNAJ1sTRcTashpUaBibRilYkVX/v
 17gTYbi8i8IT99ZfJdIKoateI000bJueNgg9D0Q==
X-Gm-Gg: ASbGncuBCha06+3mc7rrKsW0f8pxD2htUmHKA/LbNZGxSv+Fx252uWSa5K0PLsR4AbI
 1B9MqwF7ClgzNqj4kLvsYd54RzQRVEDVEBX3By0U=
X-Google-Smtp-Source: AGHT+IEHqM3p3c3q5CV6s2UzPvr35j4uFGyHbpaLDpPwi8saThQtfuxy8li9V8DbsKTiK6jNw5unlcg03mGfmmQo0uc=
X-Received: by 2002:a17:907:9629:b0:aaf:ab71:bf79 with SMTP id
 a640c23a62f3a-ab2ab6a44e4mr1869996466b.19.1736761344839; Mon, 13 Jan 2025
 01:42:24 -0800 (PST)
MIME-Version: 1.0
References: <20241225020109.1051449-1-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20241225020109.1051449-1-yelangyan@huaqin.corp-partner.google.com>
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Date: Mon, 13 Jan 2025 17:42:14 +0800
X-Gm-Features: AbW1kvYnHqitLn3wMA3rVAuh519ho88Uhyl1tVwxoiyTmNATRc2EcT2AgObHDxs
Message-ID: <CA++9cvr_xcOoFD5sPkXp6eV55+cTWHMRH8RfBiRQBAEezjhQAQ@mail.gmail.com>
Subject: Fwd: [PATCH] drm/panel-edp: Add B140UAN04.4 and MNE007QS3-7
To: dianders@chromium.org, neil.armstrong@linaro.org, 
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="00000000000004eeef062b9343d4"
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

--00000000000004eeef062b9343d4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ---------
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Date: Wed, Dec 25, 2024 at 10:01=E2=80=AFAM
Subject: [PATCH] drm/panel-edp: Add B140UAN04.4 and MNE007QS3-7
To: <dianders@chromium.org>, <neil.armstrong@linaro.org>, <
quic_jesszhan@quicinc.com>, <maarten.lankhorst@linux.intel.com>, <
mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>, <
simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>, <
linux-kernel@vger.kernel.org>
Cc: <dianders@google.com>, Langyan Ye <
yelangyan@huaqin.corp-partner.google.com>


The raw edid for B140UAN04.4 panel is:

00 ff ff ff ff ff ff 00 06 af b3 a7 00 00 00 00
0c 22 01 04 a5 1e 13 78 03 cb 55 91 57 5a 91 29
1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 f4 3c 80 b8 70 b0 24 40 10 10
3e 00 2d bc 10 00 00 18 00 00 00 0f 00 00 00 00
00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 42 31 34 30 55 41 4e 30 34 2e 34 20 0a 01 46

70 20 79 02 00 22 00 14 87 61 02 85 7f 07 b7 00
0f 80 0f 00 af 04 23 00 02 00 0d 00 25 01 09 87
61 02 87 61 02 28 3c 80 81 00 15 74 1a 00 00 03
01 28 3c 00 00 53 50 53 50 3c 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 0b 90

The raw edid for MNE007QS3-7 panel is:

00 ff ff ff ff ff ff 00 0e 77 48 14 00 00 00 00
34 20 01 04 a5 1e 13 78 03 2c c5 94 5c 59 95 29
1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 ea 3d 80 c8 70 b0 2e 40 30 20
36 00 2e bd 10 00 00 1a 00 00 00 fd 00 28 3c 4b
4b 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
53 4f 54 20 54 39 0a 20 20 20 20 20 00 00 00 fe
00 4d 4e 45 30 30 37 51 53 33 2d 37 0a 20 00 df

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c
b/drivers/gpu/drm/panel/panel-edp.c
index f8511fe5fb0d..e9434a0cc37a 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1865,6 +1865,7 @@ static const struct edp_panel_entry edp_panels[] =3D =
{
        EDP_PANEL_ENTRY('A', 'U', 'O', 0xc4b4, &delay_200_500_e50,
"B116XAT04.1"),
        EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50,
"B120XAN01.0"),
        EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50,
"B140XTN07.7"),
+       EDP_PANEL_ENTRY('A', 'U', 'O', 0xa7b3, &delay_200_500_e50,
"B140UAN04.4"),

        EDP_PANEL_ENTRY('B', 'O', 'E', 0x0607, &delay_200_500_e200,
"Unknown"),
        EDP_PANEL_ENTRY('B', 'O', 'E', 0x0608, &delay_200_500_e50,
"NT116WHM-N11"),
@@ -1954,6 +1955,7 @@ static const struct edp_panel_entry edp_panels[] =3D =
{

        EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50,
"MNB601LS1-1"),
        EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50,
"MNB601LS1-4"),
+       EDP_PANEL_ENTRY('C', 'S', 'W', 0x1448, &delay_200_500_e50,
"MNE007QS3-7"),

        EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d51, &delay_200_500_e200,
"Unknown"),
        EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5b, &delay_200_500_e200,
"MB116AN01"),
--=20
2.34.1

--00000000000004eeef062b9343d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote gmail_quote_container"><=
div dir=3D"ltr" class=3D"gmail_attr">---------- Forwarded message ---------=
<br>From: <strong class=3D"gmail_sendername" dir=3D"auto">Langyan Ye</stron=
g> <span dir=3D"auto">&lt;<a href=3D"mailto:yelangyan@huaqin.corp-partner.g=
oogle.com">yelangyan@huaqin.corp-partner.google.com</a>&gt;</span><br>Date:=
 Wed, Dec 25, 2024 at 10:01=E2=80=AFAM<br>Subject: [PATCH] drm/panel-edp: A=
dd B140UAN04.4 and MNE007QS3-7<br>To:  &lt;<a href=3D"mailto:dianders@chrom=
ium.org">dianders@chromium.org</a>&gt;,  &lt;<a href=3D"mailto:neil.armstro=
ng@linaro.org">neil.armstrong@linaro.org</a>&gt;,  &lt;<a href=3D"mailto:qu=
ic_jesszhan@quicinc.com">quic_jesszhan@quicinc.com</a>&gt;,  &lt;<a href=3D=
"mailto:maarten.lankhorst@linux.intel.com">maarten.lankhorst@linux.intel.co=
m</a>&gt;,  &lt;<a href=3D"mailto:mripard@kernel.org">mripard@kernel.org</a=
>&gt;,  &lt;<a href=3D"mailto:tzimmermann@suse.de">tzimmermann@suse.de</a>&=
gt;,  &lt;<a href=3D"mailto:airlied@gmail.com">airlied@gmail.com</a>&gt;,  =
&lt;<a href=3D"mailto:simona@ffwll.ch">simona@ffwll.ch</a>&gt;,  &lt;<a hre=
f=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.or=
g</a>&gt;,  &lt;<a href=3D"mailto:linux-kernel@vger.kernel.org">linux-kerne=
l@vger.kernel.org</a>&gt;<br>Cc:  &lt;<a href=3D"mailto:dianders@google.com=
">dianders@google.com</a>&gt;, Langyan Ye &lt;<a href=3D"mailto:yelangyan@h=
uaqin.corp-partner.google.com">yelangyan@huaqin.corp-partner.google.com</a>=
&gt;<br></div><br><br>The raw edid for B140UAN04.4 panel is:<br>
<br>
00 ff ff ff ff ff ff 00 06 af b3 a7 00 00 00 00<br>
0c 22 01 04 a5 1e 13 78 03 cb 55 91 57 5a 91 29<br>
1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01<br>
01 01 01 01 01 01 f4 3c 80 b8 70 b0 24 40 10 10<br>
3e 00 2d bc 10 00 00 18 00 00 00 0f 00 00 00 00<br>
00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41<br>
55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe<br>
00 42 31 34 30 55 41 4e 30 34 2e 34 20 0a 01 46<br>
<br>
70 20 79 02 00 22 00 14 87 61 02 85 7f 07 b7 00<br>
0f 80 0f 00 af 04 23 00 02 00 0d 00 25 01 09 87<br>
61 02 87 61 02 28 3c 80 81 00 15 74 1a 00 00 03<br>
01 28 3c 00 00 53 50 53 50 3c 00 00 00 00 00 00<br>
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
00 00 00 00 00 00 00 00 00 00 00 00 00 00 0b 90<br>
<br>
The raw edid for MNE007QS3-7 panel is:<br>
<br>
00 ff ff ff ff ff ff 00 0e 77 48 14 00 00 00 00<br>
34 20 01 04 a5 1e 13 78 03 2c c5 94 5c 59 95 29<br>
1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01<br>
01 01 01 01 01 01 ea 3d 80 c8 70 b0 2e 40 30 20<br>
36 00 2e bd 10 00 00 1a 00 00 00 fd 00 28 3c 4b<br>
4b 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43<br>
53 4f 54 20 54 39 0a 20 20 20 20 20 00 00 00 fe<br>
00 4d 4e 45 30 30 37 51 53 33 2d 37 0a 20 00 df<br>
<br>
Signed-off-by: Langyan Ye &lt;<a href=3D"mailto:yelangyan@huaqin.corp-partn=
er.google.com" target=3D"_blank">yelangyan@huaqin.corp-partner.google.com</=
a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/panel/panel-edp.c | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pane=
l-edp.c<br>
index f8511fe5fb0d..e9434a0cc37a 100644<br>
--- a/drivers/gpu/drm/panel/panel-edp.c<br>
+++ b/drivers/gpu/drm/panel/panel-edp.c<br>
@@ -1865,6 +1865,7 @@ static const struct edp_panel_entry edp_panels[] =3D =
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;A&#39;, &#39;U&#39;, &#39;=
O&#39;, 0xc4b4, &amp;delay_200_500_e50, &quot;B116XAT04.1&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;A&#39;, &#39;U&#39;, &#39;=
O&#39;, 0xd497, &amp;delay_200_500_e50, &quot;B120XAN01.0&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;A&#39;, &#39;U&#39;, &#39;=
O&#39;, 0xf390, &amp;delay_200_500_e50, &quot;B140XTN07.7&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0EDP_PANEL_ENTRY(&#39;A&#39;, &#39;U&#39;, &#39;=
O&#39;, 0xa7b3, &amp;delay_200_500_e50, &quot;B140UAN04.4&quot;),<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;B&#39;, &#39;O&#39;, &#39;=
E&#39;, 0x0607, &amp;delay_200_500_e200, &quot;Unknown&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;B&#39;, &#39;O&#39;, &#39;=
E&#39;, 0x0608, &amp;delay_200_500_e50, &quot;NT116WHM-N11&quot;),<br>
@@ -1954,6 +1955,7 @@ static const struct edp_panel_entry edp_panels[] =3D =
{<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;C&#39;, &#39;S&#39;, &#39;=
W&#39;, 0x1100, &amp;delay_200_500_e80_d50, &quot;MNB601LS1-1&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;C&#39;, &#39;S&#39;, &#39;=
W&#39;, 0x1104, &amp;delay_200_500_e50, &quot;MNB601LS1-4&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0EDP_PANEL_ENTRY(&#39;C&#39;, &#39;S&#39;, &#39;=
W&#39;, 0x1448, &amp;delay_200_500_e50, &quot;MNE007QS3-7&quot;),<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;H&#39;, &#39;K&#39;, &#39;=
C&#39;, 0x2d51, &amp;delay_200_500_e200, &quot;Unknown&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;H&#39;, &#39;K&#39;, &#39;=
C&#39;, 0x2d5b, &amp;delay_200_500_e200, &quot;MB116AN01&quot;),<br>
-- <br>
2.34.1<br>
<br>
</div></div>

--00000000000004eeef062b9343d4--
