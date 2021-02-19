Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C98631FC98
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 17:02:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC666EB5C;
	Fri, 19 Feb 2021 16:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn2070.outbound.protection.outlook.com [40.92.23.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178E36EB5C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 16:02:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbQWJldsXLhuSyeJwnUlXdNBoNT37qqVakwOT5K1c/GxEKEA6mBe27SeZI92TC31Bb0RkIAei1jse4Bet3BhUe86DwTinUEhIQ8u8oos3lul0MnLzjX9cW7qtoP9gb8YFGnfjmaVIhf8rF+3Vp/ZAo021ap0+9Z6v1cc5kZvnL2KSsL5tTPcKm6D5tUT2WtfZHzeMkZij+HTTmK7UyGHoMP8oHm+2nXRhCPuLUyrT4XfBdol+jFctVB4onrue+LdgCxNELJyaXrEZ4xA2kNxogo9v0/Ojzs3M8DzLuTK8DWkqAEhzliVF6qEONNMXBaCrU5rBb1IX786k6uX+qXbmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFskswxS7mvVbHdsESGS4Tzs/C//CpF/byvfOtwBi4Q=;
 b=MQOA0O1ss3w8cWQ1X18/fKQtHon66H06UXwrQoprd0BxFR+Pap+S0ZgHvpv3uzzrAYuH3BeYM3KKkesz/27aClbzRfmzruPW6NH47HXeX/wltRHKHS+oqyvJrvu0u9XydKqCvPBJZ7fGcekLEPbGdIYmgiXwuY90SpaRm4wG+DFY1StfYxX50UkyZ/v+KCPSPL21hIF1MhvtMCc3CEO2o1dh6CrBFDuhyoQJdV8vePi7szs7Mshz7ehwKl8CvoTvm5g2nfA3GpZAVSr18X1YBbyXXWqYXbBInTGyY1wYI6sNWud29jSedc1Jk2Yps/xoSEY+uK5eYqYuFmnBdCoWwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFskswxS7mvVbHdsESGS4Tzs/C//CpF/byvfOtwBi4Q=;
 b=XXOWvDd/Xi2d9Ki0JKGX7XJ3wAM8Hx668ryH2cinYY6YOrFz9/rulO+iYz8JauTQ/+/qxr6rDo8Vo5FpdLHEA0B6t7/F7kCOwT0wZkxucKLu262WArUyVel99mL7lZhaweHaxLTldVhmCRurU2SGqg6yv+f8uX0iAoFvonjsIyJI1+p1b9Kd/Hnn67vSKLLbNKRsxUInkNPt5GqfTOgkiC822IjD2w9RsGeiTG0V8yiEFH0RqUDolAGsiTD4yu5s+8bpUG3MQqgqRq0RcvtsWhSDVpTTob2CGWUKRU2DZJN1iE0/51MoZAh+VAq6gBJiVQkcdBSwD67SJ8s1sfr+LQ==
Received: from DM6NAM12FT030.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc64::50) by
 DM6NAM12HT012.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc64::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.8; Fri, 19 Feb
 2021 16:02:05 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:fc64::4c) by DM6NAM12FT030.mail.protection.outlook.com
 (2a01:111:e400:fc64::167) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.8 via Frontend
 Transport; Fri, 19 Feb 2021 16:02:04 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c1c9:7368:b8b3:454a]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c1c9:7368:b8b3:454a%3]) with mapi id 15.20.3846.042; Fri, 19 Feb 2021
 16:02:04 +0000
From: Christopher Morgan <macromorgan@hotmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: RE: [PATCH] drm/panel: elida-kd35t133: allow using non-continuous dsi
 clock
Thread-Topic: [PATCH] drm/panel: elida-kd35t133: allow using non-continuous
 dsi clock
Thread-Index: AQHXBm1Kpq0Hm1BMYEKnUD3E5jRCV6pfo7IAgAAAOkQ=
Date: Fri, 19 Feb 2021 16:02:04 +0000
Message-ID: <SN6PR06MB53427D87F15806039CB45F0CA5849@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <SN6PR06MB5342F273F5DAA0DD24E89EA3A5849@SN6PR06MB5342.namprd06.prod.outlook.com>,
 <CAAEAJfA6miHGaJ+u+GGj_jiNWgFRncx=toU0KEGhaZ8DV=rgvg@mail.gmail.com>
In-Reply-To: <CAAEAJfA6miHGaJ+u+GGj_jiNWgFRncx=toU0KEGhaZ8DV=rgvg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:B512B557B217711DBF545037A98B61C4074E810ECB341CC80EEA07BA6051C7F0;
 UpperCasedChecksum:6FDA793A23C35D8F8C3D885120943C43AA4E193A6DAAE459229A579E4F012B3B;
 SizeAsReceived:7454; Count:45
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [WUlHvr5dDG2R+789j8l7g4emGfNlxOhMMCxI6LtE34O39qgE35xI/P2NWwE+C45T]
x-ms-publictraffictype: Email
x-incomingheadercount: 45
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 761358ef-84f5-4975-94c1-08d8d4efb3ad
x-ms-traffictypediagnostic: DM6NAM12HT012:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eirEGFfla6HSHAh/9OD0DuDofDslaGpo3DVVAcF/FRZpkMcpUiQguuIobAEeyeiibdXwhyOJBbj2TTi9uLBVI4JyNqx4F+h+h+4srhggQ0Kla2xyShWMJcIBL4jOxdT+7zw1h0UsInDj2wZlMSAMnif2t0hb0VTysKHb0gUJodq5kPmHZRtez00tce+J3IZtR6NMpuTTBoMu+5EBRy6+D77U0WLBB1u4s0vs3feMPMbrsT+J16FLS4Kd57JDO2bbmC0IUzFw/au2+2J3OS9RAeu/t9ttESu2gC0SteY1a7dJfeqs5mQWlfpepqiL5QH7wHcrbEo+mc0Rh7P1Q1hQxFerEKXNvUVGSzUR//U6y4Wk5JHm92kKSwNCUhgmOuJatzdEtXEJjOyN45LyEgyoVJ0y50kQAOdCcOexvIbwYuppBofm+dkDiWC6Fv97hwXT
x-ms-exchange-antispam-messagedata: SqbFGBWTQ1L4YpPJPfW8mRzeySg2zeT5ZOnGDByKvqxt3UeWnS2vuyFrL3wxFWUSWVSdDXo9AyYswbgiqdA/Q1YQNmIGXB6sAqompogNiDU5etcw7v0gDpqE+Tum1/XjYvqKK3acX9Ys0YSqiPLZ9FR183MXml1ngKhm4t6hz0TdteBtswXS6oPmz0Wx46CbLhcqRYYcLWJhKOgZyZAMLw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT030.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 761358ef-84f5-4975-94c1-08d8d4efb3ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2021 16:02:04.8635 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM12HT012
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
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1616778478=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1616778478==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN6PR06MB53427D87F15806039CB45F0CA5849SN6PR06MB5342namp_"

--_000_SN6PR06MB53427D87F15806039CB45F0CA5849SN6PR06MB5342namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, I just spoke with him via email.  I can confirm his fix/my fix/whichev=
er fix solves the issue on the latest 5.11 kernel.


From: Ezequiel Garcia<mailto:ezequiel@vanguardiasur.com.ar>
Sent: Friday, February 19, 2021 10:00 AM
To: Chris Morgan<mailto:macromorgan@hotmail.com>
Cc: tzimmermann@suse.de<mailto:tzimmermann@suse.de>; Thierry Reding<mailto:=
thierry.reding@gmail.com>; Sam Ravnborg<mailto:sam@ravnborg.org>; David Air=
lie<mailto:airlied@linux.ie>; Daniel Vetter<mailto:daniel@ffwll.ch>; dri-de=
vel<mailto:dri-devel@lists.freedesktop.org>; Heiko Stuebner<mailto:heiko@sn=
tech.de>
Subject: Re: [PATCH] drm/panel: elida-kd35t133: allow using non-continuous =
dsi clock

On Fri, 19 Feb 2021 at 00:14, Chris Morgan <macromorgan@hotmail.com> wrote:
>
> This fixes an issue with the panel not working after
> commit c6d94e37bdbb ("drm/bridge/synopsys: dsi: add support for non-conti=
nuous HS clock").
> With this change the panel inits successfully and displays an image.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/d=
rm/panel/panel-elida-kd35t133.c
> index bc36aa3c1123..fe5ac3ef9018 100644
> --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> @@ -265,7 +265,8 @@ static int kd35t133_probe(struct mipi_dsi_device *dsi=
)
>         dsi->lanes =3D 1;
>         dsi->format =3D MIPI_DSI_FMT_RGB888;
>         dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BUR=
ST |
> -                         MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
> +                         MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET |
> +                         MIPI_DSI_CLOCK_NON_CONTINUOUS;
>
>         drm_panel_init(&ctx->panel, &dsi->dev, &kd35t133_funcs,
>                        DRM_MODE_CONNECTOR_DSI);
> --
> 2.25.1
>

I kindly appreciate you taking the time to debug this one.
It looks good, but also seems like Heiko already sent the same fix:

https://na01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.spin=
ics.net%2Flists%2Fkernel%2Fmsg3824932.html&amp;data=3D04%7C01%7C%7Cbdecc3cd=
75554c2ad3bb08d8d4ef7324%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C63749=
3472196595230%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DoBQtE63GEcbqIPxEtO%2BotZEa=
UnwrRD52OynUoBB%2FNp4%3D&amp;reserved=3D0

Thanks,
Eze


--_000_SN6PR06MB53427D87F15806039CB45F0CA5849SN6PR06MB5342namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
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
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Yes, I just spoke with him via email.&nbsp; I can co=
nfirm his fix/my fix/whichever fix solves the issue on the latest 5.11 kern=
el.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0in 0in 0in">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><b>From: </b><a hr=
ef=3D"mailto:ezequiel@vanguardiasur.com.ar">Ezequiel Garcia</a><br>
<b>Sent: </b>Friday, February 19, 2021 10:00 AM<br>
<b>To: </b><a href=3D"mailto:macromorgan@hotmail.com">Chris Morgan</a><br>
<b>Cc: </b><a href=3D"mailto:tzimmermann@suse.de">tzimmermann@suse.de</a>; =
<a href=3D"mailto:thierry.reding@gmail.com">
Thierry Reding</a>; <a href=3D"mailto:sam@ravnborg.org">Sam Ravnborg</a>; <=
a href=3D"mailto:airlied@linux.ie">
David Airlie</a>; <a href=3D"mailto:daniel@ffwll.ch">Daniel Vetter</a>; <a =
href=3D"mailto:dri-devel@lists.freedesktop.org">
dri-devel</a>; <a href=3D"mailto:heiko@sntech.de">Heiko Stuebner</a><br>
<b>Subject: </b>Re: [PATCH] drm/panel: elida-kd35t133: allow using non-cont=
inuous dsi clock</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">On Fri, 19 Feb 2021 at 00:14, Chris Morgan &lt;macro=
morgan@hotmail.com&gt; wrote:<br>
&gt;<br>
&gt; This fixes an issue with the panel not working after<br>
&gt; commit c6d94e37bdbb (&quot;drm/bridge/synopsys: dsi: add support for n=
on-continuous HS clock&quot;).<br>
&gt; With this change the panel inits successfully and displays an image.<b=
r>
&gt;<br>
&gt; Signed-off-by: Chris Morgan &lt;macromorgan@hotmail.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/panel/panel-elida-kd35t133.c | 3 ++-<br>
&gt;&nbsp; 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gp=
u/drm/panel/panel-elida-kd35t133.c<br>
&gt; index bc36aa3c1123..fe5ac3ef9018 100644<br>
&gt; --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c<br>
&gt; +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c<br>
&gt; @@ -265,7 +265,8 @@ static int kd35t133_probe(struct mipi_dsi_device *=
dsi)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dsi-&gt;lanes =3D 1;<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dsi-&gt;format =3D MIP=
I_DSI_FMT_RGB888;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dsi-&gt;mode_flags =3D=
 MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET |<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 MIPI_DSI_CLOCK_NON_CONTINUOUS;<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_panel_init(&amp;ct=
x-&gt;panel, &amp;dsi-&gt;dev, &amp;kd35t133_funcs,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_MOD=
E_CONNECTOR_DSI);<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
<br>
I kindly appreciate you taking the time to debug this one.<br>
It looks good, but also seems like Heiko already sent the same fix:<br>
<br>
<a href=3D"https://na01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fwww.spinics.net%2Flists%2Fkernel%2Fmsg3824932.html&amp;amp;data=3D04%7C0=
1%7C%7Cbdecc3cd75554c2ad3bb08d8d4ef7324%7C84df9e7fe9f640afb435aaaaaaaaaaaa%=
7C1%7C0%7C637493472196595230%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DoBQtE63=
GEcbqIPxEtO%2BotZEaUnwrRD52OynUoBB%2FNp4%3D&amp;amp;reserved=3D0">https://n=
a01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.spinics.net%2=
Flists%2Fkernel%2Fmsg3824932.html&amp;amp;data=3D04%7C01%7C%7Cbdecc3cd75554=
c2ad3bb08d8d4ef7324%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C6374934721=
96595230%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DoBQtE63GEcbqIPxEtO%2BotZEaU=
nwrRD52OynUoBB%2FNp4%3D&amp;amp;reserved=3D0</a><br>
<br>
Thanks,<br>
Eze<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SN6PR06MB53427D87F15806039CB45F0CA5849SN6PR06MB5342namp_--

--===============1616778478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1616778478==--
