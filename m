Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B64B62830CE
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 09:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D2D6E11F;
	Mon,  5 Oct 2020 07:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B774589FC3
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Oct 2020 02:35:56 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id x14so5313726oic.9
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Oct 2020 19:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=mime-version:date:from:subject:thread-topic:in-reply-to:message-id
 :references:to:cc:content-transfer-encoding;
 bh=aEm4jD2dtJQ7AR96oyUn0SZoDPUNXtDemIzEUsjIt1o=;
 b=gU1+07g+YxfnX20rn6bZuFrNoeLcaY8by5EuS6eBB5i3OSTLRqlh2vBStAeMxrzm/m
 ZwIb2Qy6vvUH8+2wypiXmNKE/kdQa8e07aD/nMGSa2qPAhaxgOFeXmP6jCNspcEqNLlC
 qoom3cNq7uMNNC4aaGJSlUxi/x1MFFWWbmzL6ZTMOGgBQubtnGrfAS5+N/zUAI6qIQwx
 0jMkcvuptvcPy/spS1r/K5ITpWr3e5pCnnG1T9vBcbGwsJ+qeKLm4k7u2hEcju+L/4FW
 2OmODaiyyRHT2/suuE9RedBgV09aIYgNDGoVLeanvf1yxp1IqJ3T92wxzR9nh+Cr7sqe
 bMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:from:subject:thread-topic
 :in-reply-to:message-id:references:to:cc:content-transfer-encoding;
 bh=aEm4jD2dtJQ7AR96oyUn0SZoDPUNXtDemIzEUsjIt1o=;
 b=Jn9B2gHLASMd9SPU5PXrI6sSlVdnCk2Cbr/VzWdpVmWO5ni9fx0UecVHo/jU8vkz7Z
 YVtBSo1RuvgNquH+owg9DL7jnpLTCm1bBVwCyRvZt9OULxyQpvDL5S1m7w8Nk7A2NkK4
 iKmWb7Uw/nSEBRHO1VMu/rrC83jILiFjt8MNs0sOsj/E0Rpw+aOqhHfRGX+SW7/CVM16
 hEyzT3qW8FjDgX5ox+gWZ8w/M0bvzNT0jNMnKaC2IE2+uMJcm0DxIurPBmEcyqbNOpgX
 j8xPSCahcHEfi5U197Jzppn+QluBpmx2dsXWnOSIy7pLhjzpejm5RWatAZsU0oW54now
 SpaA==
X-Gm-Message-State: AOAM532pB4nUo6/57qB1XNZjIJobd4K5yCjn6MVVDovYev5dDdq9OJYC
 yqdV3/AYAzyrU1AgrlAGbHVHRA==
X-Google-Smtp-Source: ABdhPJwWCUfYdkEIx5KhpeoYUpKIS0tX3eH+qyeplZhp7/+EkbCHz9JMQzJ0znL0edWLyvRg1Lq74A==
X-Received: by 2002:a05:6808:346:: with SMTP id j6mr5258876oie.8.1601778955621; 
 Sat, 03 Oct 2020 19:35:55 -0700 (PDT)
Received: from smtp.gmail.com (cpe-173-175-113-3.satx.res.rr.com.
 [173.175.113.3])
 by smtp.gmail.com with ESMTPSA id q10sm1787951otn.27.2020.10.03.19.35.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 03 Oct 2020 19:35:55 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 3 Oct 2020 21:35:53 -0500
From: Steev Klimaszewski <steev@kali.org>
Subject: RE: [PATCH] drm/bridge: ti-sn65dsi86: Add retries for link training
Thread-Topic: RE: [PATCH] drm/bridge: ti-sn65dsi86: Add retries for link
 training
In-Reply-To: <20201002135920.1.I2adbc90b2db127763e2444bd5a4e5bf30e1db8e5@changeid>
Message-ID: <BE7E49B1-9272-4F3A-AFB9-1C93516AF990@hxcore.ol>
References: <20201002135920.1.I2adbc90b2db127763e2444bd5a4e5bf30e1db8e5@changeid>
To: Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Mon, 05 Oct 2020 07:22:30 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============0954169157=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0954169157==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DEN-US link=3Dblue vlink=3D"#954F72"><div cla=
ss=3DWordSection1><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoN=
ormal><o:p>&nbsp;</o:p></p><div style=3D'mso-element:para-border-div;border=
:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in 0in 0in'><p class=3D=
MsoNormal style=3D'border:none;padding:0in'><b>From: </b><a href=3D"mailto:=
dianders@chromium.org">Douglas Anderson</a><br><b>Sent: </b>Friday, October=
 2, 2020 4:04 PM<br><b>To: </b><a href=3D"mailto:a.hajda@samsung.com">Andrz=
ej Hajda</a>; <a href=3D"mailto:narmstrong@baylibre.com">Neil Armstrong</a>=
; <a href=3D"mailto:sam@ravnborg.org">Sam Ravnborg</a><br><b>Cc: </b><a hre=
f=3D"mailto:robdclark@chromium.org">Rob Clark</a>; <a href=3D"mailto:bjorn.=
andersson@linaro.org">Bjorn Andersson</a>; <a href=3D"mailto:steev@kali.org=
">Steev Klimaszewski</a>; <a href=3D"mailto:dianders@chromium.org">Douglas =
Anderson</a>; <a href=3D"mailto:daniel@ffwll.ch">Daniel Vetter</a>; <a href=
=3D"mailto:airlied@linux.ie">David Airlie</a>; <a href=3D"mailto:jernej.skr=
abec@siol.net">Jernej Skrabec</a>; <a href=3D"mailto:jonas@kwiboo.se">Jonas=
 Karlman</a>; <a href=3D"mailto:Laurent.pinchart@ideasonboard.com">Laurent =
Pinchart</a>; <a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@=
lists.freedesktop.org</a>; <a href=3D"mailto:linux-kernel@vger.kernel.org">=
linux-kernel@vger.kernel.org</a><br><b>Subject: </b>[PATCH] drm/bridge: ti-=
sn65dsi86: Add retries for link training</p></div><p class=3DMsoNormal><o:p=
>&nbsp;</o:p></p><p class=3DMsoNormal>On some panels hooked up to the ti-sn=
65dsi86 bridge chip we found that</p><p class=3DMsoNormal>link training was=
 failing.=C2=A0 Specifically, we'd see:</p><p class=3DMsoNormal><o:p>&nbsp;=
</o:p></p><p class=3DMsoNormal>=C2=A0 ti_sn65dsi86 2-002d: [drm:ti_sn_bridg=
e_enable] *ERROR* Link training failed, link is off (-5)</p><p class=3DMsoN=
ormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>The panel was hooked up to =
a logic analyzer and it was found that, as</p><p class=3DMsoNormal>part of =
link training, the bridge chip was writing a 0x1 to DPCD</p><p class=3DMsoN=
ormal>address 00600h and the panel responded NACK.=C2=A0 As can be seen in =
header</p><p class=3DMsoNormal>files, the write of 0x1 to DPCD address 0x60=
0h means we were trying to</p><p class=3DMsoNormal>write the value DP_SET_P=
OWER_D0 to the register DP_SET_POWER.=C2=A0 The</p><p class=3DMsoNormal>pan=
el vendor says that a NACK in this case is not unexpected and means</p><p c=
lass=3DMsoNormal>&quot;not ready, try again&quot;.</p><p class=3DMsoNormal>=
<o:p>&nbsp;</o:p></p><p class=3DMsoNormal>In testing, we found that this pa=
nel would respond with a NACK in</p><p class=3DMsoNormal>about 1/25 times.=
=C2=A0 Adding the retry logic worked fine and the most</p><p class=3DMsoNor=
mal>number of tries needed was 3.=C2=A0 Just to be safe, we'll add 10 tries=
</p><p class=3DMsoNormal>here and we'll add a little blurb to the logs if w=
e ever need more</p><p class=3DMsoNormal>than 5.</p><p class=3DMsoNormal><o=
:p>&nbsp;</o:p></p><p class=3DMsoNormal>Signed-off-by: Douglas Anderson &lt=
;dianders@chromium.org&gt;</p><p class=3DMsoNormal>---</p><p class=3DMsoNor=
mal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal> drivers/gpu/drm/bridge/ti-sn=
65dsi86.c | 40 +++++++++++++++++++--------</p><p class=3DMsoNormal> 1 file =
changed, 29 insertions(+), 11 deletions(-)</p><p class=3DMsoNormal><o:p>&nb=
sp;</o:p></p><p class=3DMsoNormal>diff --git a/drivers/gpu/drm/bridge/ti-sn=
65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c</p><p class=3DMsoNormal>i=
ndex ecdf9b01340f..6e12cda69b54 100644</p><p class=3DMsoNormal>--- a/driver=
s/gpu/drm/bridge/ti-sn65dsi86.c</p><p class=3DMsoNormal>+++ b/drivers/gpu/d=
rm/bridge/ti-sn65dsi86.c</p><p class=3DMsoNormal>@@ -106,6 +106,8 @@</p><p =
class=3DMsoNormal> #define SN_NUM_GPIOS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4</p>=
<p class=3DMsoNormal> #define SN_GPIO_PHYSICAL_OFFSET=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1</p><p class=3DMsoNormal> </p><p class=3DMsoNorma=
l>+#define SN_LINK_TRAINING_TRIES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 10</p><p class=3DMsoNormal>+</p><p class=3DMsoNorm=
al> /**</p><p class=3DMsoNormal>=C2=A0 * struct ti_sn_bridge - Platform dat=
a for ti-sn65dsi86 driver.</p><p class=3DMsoNormal>=C2=A0 * @dev:=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Pointer to our device.</p><p =
class=3DMsoNormal>@@ -673,6 +675,7 @@ static int ti_sn_link_training(struct=
 ti_sn_bridge *pdata, int dp_rate_idx,</p><p class=3DMsoNormal> {</p><p cla=
ss=3DMsoNormal> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsi=
gned int val;</p><p class=3DMsoNormal> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 int ret;</p><p class=3DMsoNormal>+=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 int i;</p><p class=3DMsoNormal> </p><p class=3D=
MsoNormal>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* s=
et dp clk frequency value */</p><p class=3DMsoNormal> =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regmap_update_bits(pdata-&gt;regmap, SN_D=
ATARATE_CONFIG_REG,</p><p class=3DMsoNormal>@@ -689,19 +692,34 @@ static in=
t ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,</p><p cl=
ass=3DMsoNormal> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto exit;<=
/p><p class=3DMsoNormal> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 }</p><p class=3DMsoNormal> </p><p class=3DMsoNormal>-=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Semi auto link training mode */<=
/p><p class=3DMsoNormal>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 regmap_write(pdata-&gt;regmap, SN_ML_TX_MODE_REG, 0x0A);</p><p class=
=3DMsoNormal>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =
=3D regmap_read_poll_timeout(pdata-&gt;regmap, SN_ML_TX_MODE_REG, val,</p><=
p class=3DMsoNormal>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 val =3D=3D ML_TX_MAIN_LINK_OFF ||</p><p class=3DMsoNormal>-=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D=3D ML_TX_NORMAL_M=
ODE, 1000,</p><p class=3DMsoNormal>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 500 * 1000);</p><p class=3DMsoNormal>-=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {</p><p class=3DMsoNormal>=
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *last_err_str =3D &quot;Training=
 complete polling failed&quot;;</p><p class=3DMsoNormal>-=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (val =3D=3D ML_TX_MAIN_LINK_=
OFF) {</p><p class=3DMsoNormal>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *l=
ast_err_str =3D &quot;Link training failed, link is off&quot;;</p><p class=
=3DMsoNormal>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -EIO;</p><p =
class=3DMsoNormal>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*</p><=
p class=3DMsoNormal>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  * We=
'll try to link train several times.=C2=A0 As part of link training</p><p c=
lass=3DMsoNormal>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  * the b=
ridge chip will write DP_SET_POWER_D0 to DP_SET_POWER.=C2=A0 If</p><p class=
=3DMsoNormal>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  * the panel=
 isn't ready quite it might respond NAK here which means</p><p class=3DMsoN=
ormal>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  * we need to try a=
gain.</p><p class=3DMsoNormal>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0  */</p><p class=3DMsoNormal>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 for (i =3D 0; i &lt; SN_LINK_TRAINING_TRIES; i++) {</p><p class=
=3DMsoNormal>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Semi auto link tr=
aining mode */</p><p class=3DMsoNormal>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 regmap_write(pdata-&gt;regmap, SN_ML_TX_MODE_REG, 0x0A);</p><p class=
=3DMsoNormal>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_read_=
poll_timeout(pdata-&gt;regmap, SN_ML_TX_MODE_REG, val,</p><p class=3DMsoNor=
mal>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 val =3D=3D ML_TX_MAIN_LINK_OFF ||</p><p class=3DMsoNorma=
l>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 val =3D=3D ML_TX_NORMAL_MODE, 1000,</p><p class=3DMsoNormal=
>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 500 * 1000);</p><p class=3DMsoNormal>+=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (ret) {</p><p class=3DMsoNormal>+=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 *last_err_str =3D &quot;Training complete polling failed&quot;=
;</p><p class=3DMsoNormal>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else i=
f (val =3D=3D ML_TX_MAIN_LINK_OFF) {</p><p class=3DMsoNormal>+=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 *last_err_str =3D &quot;Link training failed, link is of=
f&quot;;</p><p class=3DMsoNormal>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D =
-EIO;</p><p class=3DMsoNormal>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;</=
p><p class=3DMsoNormal>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</p><p cla=
ss=3DMsoNormal>+</p><p class=3DMsoNormal>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 break;</p><p class=3DMsoNormal> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }</p><p class=3DMsoNormal> </p><p class=3DMsoNormal>+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* If we saw quite a few retr=
ies, add a note about it */</p><p class=3DMsoNormal>+=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ret &amp;&amp; i &gt; SN_LINK_TRAINING_TRI=
ES / 2)</p><p class=3DMsoNormal>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DR=
M_DEV_INFO(pdata-&gt;dev, &quot;Link training needed %d retries\n&quot;, i)=
;</p><p class=3DMsoNormal>+</p><p class=3DMsoNormal> exit:</p><p class=3DMs=
oNormal> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Disable =
the PLL if we failed */</p><p class=3DMsoNormal> =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)</p><p class=3DMsoNormal>-- </p><p c=
lass=3DMsoNormal>2.28.0.806.g8561365e88-goog</p><p class=3DMsoNormal><o:p>&=
nbsp;</o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNorm=
al>Tested on the Lenovo C630, and haven=E2=80=99t seen the message, althoug=
h I hadn=E2=80=99t seen the described issue before either.</p><p class=3DMs=
oNormal>Tested-By: Steev Klimaszewski &lt;steev@kali.org&gt;</p></div></bod=
y></html>=


--===============0954169157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0954169157==--
