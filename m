Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 519A0D0A60
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 10:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96956E93A;
	Wed,  9 Oct 2019 08:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3056B6E938;
 Wed,  9 Oct 2019 08:57:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Oct 2019 01:57:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,273,1566889200"; 
 d="scan'208,217";a="184001141"
Received: from kmsmsx154.gar.corp.intel.com ([172.21.73.14])
 by orsmga007.jf.intel.com with ESMTP; 09 Oct 2019 01:57:16 -0700
Received: from pgsmsx111.gar.corp.intel.com ([169.254.2.128]) by
 KMSMSX154.gar.corp.intel.com ([169.254.12.220]) with mapi id 14.03.0439.000;
 Wed, 9 Oct 2019 16:57:15 +0800
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: "'intel-gfx@lists.freedesktop.org'" <intel-gfx@lists.freedesktop.org>,
 "'dri-devel@lists.freedesktop.org'" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915: customize DPCD brightness control for
 specific panel
Thread-Topic: RE: [PATCH] drm/i915: customize DPCD brightness control for
 specific panel
Thread-Index: AdV+f1DdGBFpEF8mQXeiCCESFx9j2Q==
Date: Wed, 9 Oct 2019 08:57:15 +0000
Message-ID: <D42A2A322A1FCA4089E30E9A9BA36AC65D6ACADD@PGSMSX111.gar.corp.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjcxNWNhODktYTBlYi00ZGUwLTk4ZGEtZGQzYWQxMjQ0ZDE0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiamNOQ0FySjRzUGRWb0FZdFJuTXdCdjV0aFRjMXBMOURlME5weXA2aHJUUzYzaUdtZHNYSHJYMnF1M3QzTitQXC8ifQ==
x-ctpclassification: CTP_NT
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Reply-To: "20191004215851.31446-1-shawn.c.lee@intel.com"
 <20191004215851.31446-1-shawn.c.lee@intel.com>
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Chiou,
 Cooper" <cooper.chiou@intel.com>, 'Gustavo Padovan' <gustavo@padovan.org>
Content-Type: multipart/mixed; boundary="===============1405778620=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1405778620==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_D42A2A322A1FCA4089E30E9A9BA36AC65D6ACADDPGSMSX111garcor_"

--_000_D42A2A322A1FCA4089E30E9A9BA36AC65D6ACADDPGSMSX111garcor_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, 08 Oct 2019, Jani Nikula <jani.nikula@intel.com> wrote:
>On Mon, 07 Oct 2019, Adam Jackson <ajax@redhat.com> wrote:
>> On Mon, 2019-10-07 at 12:08 +0300, Jani Nikula wrote:
>>
>>> The problem with the EDID quirks is that exposing the quirks sticks out
>>> like a sore thumb. Thus far all of it has been contained in drm_edid.c
>>> and they affect how the EDID gets parsed, for all drivers. Obviously
>>> this could be changed, but is it the right thing to do?
>>>
>>> What I suggested was, check the OUI only, and if it matches, do
>>> more. Perhaps there's something in the 0x300 range of DPCD offsets that
>>> you can read? Or perhaps you need to write the source OUI first, and
>>> then do that.
>>
>> My issue isn't really with identifying the panel from EDID rather than
>> DPCD, whichever identifier is most specific is probably the best thing
>> to use. It's more that this quirk is identified in common code but only
>> applied in one driver. If this panel were ever to be attached to some
>> other source, they might well want to apply the same kind of fix. My
>> (admittedly na=EFve) reading of the OUI handshake process is that when
>> the source device writes an OUI to DP_SOURCE_OUI it is telling the sink
>> "I'm about to issue commands that conform to _this_ vendor's own
>> conventions". If that convention communicates information that is
>> entirely contained within AUXCH transactions (and doesn't, for example,
>> require looking at some other strapping pin or external device) then in
>> principle it doesn't matter if the source device "matches" that OUI; it
>> would be legal for an AMD GPU to write the same sequence and expect the
>> same reaction, should that panel be attached to an AMD GPU.
>>
>> So, it would be nice to know exactly what that protocol is meant to do,
>> if it applies only to this specific panel or anything else with the
>> same TCON, how one would identify such TCONs in the wild other than
>> EDID, if it relies on an external PWM or something, etc. And it might
>> make sense for now to make this a (shudder) driver-specific EDID quirk
>> rather than match by DPCD, at least until we know if the panel is ever
>> seen attached to other source devices and if the OUI convention is
>> self-contained.
>
>Thanks for clarifying. Pretty much agreed, unfortunately also on the
>"would be nice to know more" part...
>
>If this were to be an EDID quirk after all, I wonder if it would be
>better to store the parsed quirks to, say, struct drm_display_info, and
>have a drm_connector_has_quirk() function similar to drm_dp_has_quirk().
>
>This would also allow us to not return quirks from
>drm_add_display_info(), which would arguably clean up the interface.
>
>BR,
>Jani.

Thanks for advice! I've already update patch V2. Driver will check sink OUI
and confirm TCON's capability to decide to enable this method or not.
It depends on TCON's feature description and does not export EDID quirk.

Best regards,
Shawn


--_000_D42A2A322A1FCA4089E30E9A9BA36AC65D6ACADDPGSMSX111garcor_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">On Tue, 08 Oct 2019, Jani Nikula &lt;jani.nikula@int=
el.com&gt; wrote:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;On Mon, 07 Oct 2019, Adam Jackson &lt;ajax@redha=
t.com&gt; wrote:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; On Mon, 2019-10-07 at 12:08 &#43;0300, Jani=
 Nikula wrote:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; The problem with the EDID quirks is tha=
t exposing the quirks sticks out<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; like a sore thumb. Thus far all of it h=
as been contained in drm_edid.c<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; and they affect how the EDID gets parse=
d, for all drivers. Obviously<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; this could be changed, but is it the ri=
ght thing to do?<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; What I suggested was, check the OUI onl=
y, and if it matches, do<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; more. Perhaps there's something in the =
0x300 range of DPCD offsets that<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; you can read? Or perhaps you need to wr=
ite the source OUI first, and<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt; then do that.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; My issue isn't really with identifying the =
panel from EDID rather than<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; DPCD, whichever identifier is most specific=
 is probably the best thing<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; to use. It's more that this quirk is identi=
fied in common code but only<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; applied in one driver. If this panel were e=
ver to be attached to some<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; other source, they might well want to apply=
 the same kind of fix. My<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; (admittedly na=EFve) reading of the OUI han=
dshake process is that when<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; the source device writes an OUI to DP_SOURC=
E_OUI it is telling the sink<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; &quot;I'm about to issue commands that conf=
orm to _this_ vendor's own<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; conventions&quot;. If that convention commu=
nicates information that is<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; entirely contained within AUXCH transaction=
s (and doesn't, for example,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; require looking at some other strapping pin=
 or external device) then in<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; principle it doesn't matter if the source d=
evice &quot;matches&quot; that OUI; it<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; would be legal for an AMD GPU to write the =
same sequence and expect the<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; same reaction, should that panel be attache=
d to an AMD GPU.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; So, it would be nice to know exactly what t=
hat protocol is meant to do,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; if it applies only to this specific panel o=
r anything else with the<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; same TCON, how one would identify such TCON=
s in the wild other than<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; EDID, if it relies on an external PWM or so=
mething, etc. And it might<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; make sense for now to make this a (shudder)=
 driver-specific EDID quirk<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; rather than match by DPCD, at least until w=
e know if the panel is ever<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; seen attached to other source devices and i=
f the OUI convention is<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; self-contained.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;Thanks for clarifying. Pretty much agreed, unfor=
tunately also on the<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&quot;would be nice to know more&quot; part...<o=
:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;If this were to be an EDID quirk after all, I wo=
nder if it would be<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;better to store the parsed quirks to, say, struc=
t drm_display_info, and<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;have a drm_connector_has_quirk() function simila=
r to drm_dp_has_quirk().<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;This would also allow us to not return quirks fr=
om<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;drm_add_display_info(), which would arguably cle=
an up the interface.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;BR,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;Jani.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks for advice! I've already update patch V2. Dri=
ver will check sink OUI<o:p></o:p></p>
<p class=3D"MsoNormal">and confirm TCON's capability to decide to enable th=
is method or not.<o:p></o:p></p>
<p class=3D"MsoNormal">It depends on TCON's feature description and does no=
t export EDID quirk.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Shawn<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_D42A2A322A1FCA4089E30E9A9BA36AC65D6ACADDPGSMSX111garcor_--

--===============1405778620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1405778620==--
