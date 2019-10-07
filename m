Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB08FCDE59
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 11:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA166E509;
	Mon,  7 Oct 2019 09:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61EBF6E509;
 Mon,  7 Oct 2019 09:43:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Oct 2019 02:43:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,267,1566889200"; 
 d="scan'208,217";a="192236459"
Received: from pgsmsx112-dag.png.intel.com (HELO PGSMSX112.gar.corp.intel.com)
 ([10.108.55.234])
 by fmsmga008.fm.intel.com with ESMTP; 07 Oct 2019 02:43:01 -0700
Received: from pgsmsx111.gar.corp.intel.com ([169.254.2.128]) by
 PGSMSX112.gar.corp.intel.com ([169.254.3.2]) with mapi id 14.03.0439.000;
 Mon, 7 Oct 2019 17:43:01 +0800
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: "'intel-gfx@lists.freedesktop.org'" <intel-gfx@lists.freedesktop.org>,
 "'dri-devel@lists.freedesktop.org'" <dri-devel@lists.freedesktop.org>
Subject: RE: RE: [PATCH] drm/i915: customize DPCD brightness control for
 specific panel
Thread-Topic: RE: [PATCH] drm/i915: customize DPCD brightness control for
 specific panel
Thread-Index: AdV88vsdl8Cfxm6zTQG8mTcXovO5QwAADVuQ
Date: Mon, 7 Oct 2019 09:43:01 +0000
Message-ID: <D42A2A322A1FCA4089E30E9A9BA36AC65D6AA2A5@PGSMSX111.gar.corp.intel.com>
References: <D42A2A322A1FCA4089E30E9A9BA36AC65D6AA27E@PGSMSX111.gar.corp.intel.com>
In-Reply-To: <D42A2A322A1FCA4089E30E9A9BA36AC65D6AA27E@PGSMSX111.gar.corp.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjQ2MzViMzItM2YyOS00ZmU3LTgyMzctY2JkNTJiZDZiODgzIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoieFRXVG9XZDd2V2ZiXC9KZ3pISmJsdFQ4UEVBRXBMSlhpVXRPNW1xXC9qREFiKzl5THF5VDlRWU4rOW9sdFE4aW9CIn0=
x-ctpclassification: CTP_NT
x-originating-ip: [172.30.20.206]
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
Content-Type: multipart/mixed; boundary="===============1331710496=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1331710496==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_D42A2A322A1FCA4089E30E9A9BA36AC65D6AA2A5PGSMSX111garcor_"

--_000_D42A2A322A1FCA4089E30E9A9BA36AC65D6AA2A5PGSMSX111garcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


On Mon, 07 Oct 2019, "Jani Nikula" <jani.nikula@intel.com<mailto:jani.nikul=
a@intel.com>> wrote:
>On Mon, 07 Oct 2019, "Lee, Shawn C" <shawn.c.lee@intel.com<mailto:shawn.c.=
lee@intel.com>> wrote:
>> On Fri, 04 Oct 2019, Jani Nikula <jani.nikula@intel.com<mailto:jani.niku=
la@intel.com>> wrote:
>>>On Fri, 04 Oct 2019, Adam Jackson <ajax@redhat.com<mailto:ajax@redhat.co=
m>> wrote:
>>>> On Sat, 2019-10-05 at 05:58 +0800, Lee Shawn C wrote:
>>>>> This panel (manufacturer is SDC, product ID is 0x4141) used
>>>>> manufacturer defined DPCD register to control brightness that not
>>>>> defined in eDP spec so far. This change follow panel vendor's
>>>>> instruction to support brightness adjustment.
>>>>
>>>> I'm sure this works, but this smells a little funny to me.
>>>
>>>That was kindly put. ;)
>>>
>>>>> + /* Samsung eDP panel */
>>>>> + { "SDC", 0x4141, EDID_QUIRK_NON_STD_BRIGHTNESS_CONTROL },
>>>>
>>>> It feels a bit like a layering violation to identify eDP behavior
>>>> changes based on EDID. But I'm not sure there's any obvious way to
>>>> identify this device by its DPCD. The Sink OUI (from the linked
>>>> bugzilla) seems to be 0011F8, which doesn't match up to anything in my
>>>> oui.txt...
>>>
>>>We have the DPCD quirk stuff in drm_dp_helper.c, but IIUC in this case
>>>there's only the OUI, and the device id etc. are all zeros. Otherwise I
>>>think that would be the natural thing to do, and all this could be
>>>better hidden away in i915.
>>>
>>
>> Below is what we dumped from this panel. Only sink OUI (ba-41-59) in it
>> and nothing else.
>> 00000400  ba 41 59 00 00 00 00 00  00 00 00 00 00 00 00 00  |.AY........=
.....|
>> 00000410  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |...........=
.....
>>
>> That's why the patch to identify EDID's manufacturer and product ID
>> to make sure this method applied on specific panel.
>>
>>>>
>>>>> @@ -1953,6 +1956,7 @@ static u32 edid_get_quirks(const struct edid
>>>>> *edid)
>>>>>
>>>>>    return 0;
>>>>>  }
>>>>> +EXPORT_SYMBOL(edid_get_quirks);
>>>>
>>>> If we're going to export this it should probably get a drm_ prefix.
>>
>> Yes! It will be better to have drm_ prefix for export funciton.
>>
>>>>
>>>>> +#define DPCD_EDP_GETSET_CTRL_PARAMS                         0x344
>>>>> +#define DPCD_EDP_CONTENT_LUMINANCE                        0x346
>>>>> +#define DPCD_EDP_PANEL_LUMINANCE_OVERRIDE         0x34a
>>>>> +#define DPCD_EDP_BRIGHTNESS_NITS                   0x354
>>>>> +#define DPCD_EDP_BRIGHTNESS_OPTIMIZATION               0x358
>>>>> +
>>>>> +#define EDP_CUSTOMIZE_MAX_BRIGHTNESS_LEVEL         (512)
>>>>
>>>> This also seems a bit weird, the 0x300-0x3FF registers belong to the
>>>> _source_ DP device. But then later...
>>>>
>>>>> + /* write source OUI */
>>>>> + write_val[0] =3D 0x00;
>>>>> + write_val[1] =3D 0xaa;
>>>>> + write_val[2] =3D 0x01;
>>>>
>>>> Oh hey, you're writing (an) Intel OUI to the Source OUI, so now it
>>>> makes sense that you're writing to registers whose behavior the source
>>>> defines. But this does raise the question: is this just a convention
>>>> between Intel and this particular panel? Would we expect this to work
>>>> with other similar panels? Is there any way to know to expect this
>>>> convention from DPCD instead?
>>
>> TCON would reply on source OUI to configure its capability. And these
>> DPCD registers were defined by vendor and Intel. This change should work=
s
>> with similar panels (with same TCON). Seems there is another issue so
>> vendor decide to use non standard way to setup brightness.
>>
>>>For one thing, it's not standard. I honestly don't know, but I'd assume
>>>you wouldn't find behaviour with Intel OUI in non-Intel designs... and a
>>>quirk of some sort seems like the only way to make this work.
>>>
>>>I suppose we could start off with a DPCD quirk that only looks at the
>>>sink OUI, and then, if needed, limit by DMI matching or by checking for
>>>some DPCD registers (what, I am not sure, perhaps write the source OUI
>>>and see how it behaves).
>>>
>>>That would avoid the mildly annoying change in the EDID quirk interface
>>>and how it's being used.
>>>
>>>Thoughts?
>>>
>>>
>>>BR,
>>>Jani.
>>>
>>
>> To be honest. Panel vendor did not provide enough sink info in DPCD.
>> That's why hard to recognize it and we have to confirm EDID instead of D=
PCD.
>>
>> Do you mean just confirm sink OUI only from DPCD quirk? I'm afraid it
>> may impact the other panels with the same TCON. Any suggestion?
>
>The problem with the EDID quirks is that exposing the quirks sticks out
>like a sore thumb. Thus far all of it has been contained in drm_edid.c
>and they affect how the EDID gets parsed, for all drivers. Obviously
>this could be changed, but is it the right thing to do?
>
>What I suggested was, check the OUI only, and if it matches, do
>more. Perhaps there's something in the 0x300 range of DPCD offsets that
>you can read? Or perhaps you need to write the source OUI first, and
>then do that.
>
>BR,
>Jani.
>

These bytes are RO. Seems we can used it to identify this panel
as well. I will use DPCD quirk and renew this patch again.

>
>>
>>>
>>>--
>>>Jani Nikula, Intel Open Source Graphics Center
>>>


--_000_D42A2A322A1FCA4089E30E9A9BA36AC65D6AA2A5PGSMSX111garcor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
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
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">On Mon, 07 Oct 2019, &quot;Jani Nikula&quot; &lt;<a =
href=3D"mailto:jani.nikula@intel.com">jani.nikula@intel.com</a>&gt; wrote:<=
o:p></o:p></p>
<p class=3D"MsoNormal">&gt;On Mon, 07 Oct 2019, &quot;Lee, Shawn C&quot; &l=
t;<a href=3D"mailto:shawn.c.lee@intel.com">shawn.c.lee@intel.com</a>&gt; wr=
ote:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; On Fri, 04 Oct 2019, Jani Nikula &lt;<a hre=
f=3D"mailto:jani.nikula@intel.com">jani.nikula@intel.com</a>&gt; wrote:<o:p=
></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;On Fri, 04 Oct 2019, Adam Jackson &lt;<a=
 href=3D"mailto:ajax@redhat.com">ajax@redhat.com</a>&gt; wrote:<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; On Sat, 2019-10-05 at 05:58 &#43;08=
00, Lee Shawn C wrote:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt; This panel (manufacturer is SDC=
, product ID is 0x4141) used
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt; manufacturer defined DPCD regis=
ter to control brightness that not
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt; defined in eDP spec so far. Thi=
s change follow panel vendor's
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt; instruction to support brightne=
ss adjustment.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; I'm sure this works, but this smell=
s a little funny to me.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;That was kindly put. ;)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt; &#43; /* Samsung eDP panel */<o=
:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt; &#43; { &quot;SDC&quot;, 0x4141=
, EDID_QUIRK_NON_STD_BRIGHTNESS_CONTROL },<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; It feels a bit like a layering viol=
ation to identify eDP behavior
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; changes based on EDID. But I'm not =
sure there's any obvious way to
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; identify this device by its DPCD. T=
he Sink OUI (from the linked<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; bugzilla) seems to be 0011F8, which=
 doesn't match up to anything in my
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; oui.txt...<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;We have the DPCD quirk stuff in drm_dp_h=
elper.c, but IIUC in this case
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;there's only the OUI, and the device id =
etc. are all zeros. Otherwise I<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;think that would be the natural thing to=
 do, and all this could be<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;better hidden away in i915.<o:p></o:p></=
p>
<p class=3D"MsoNormal">&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; Below is what we dumped from this panel. On=
ly sink OUI (ba-41-59) in it<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; and nothing else. <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; 00000400&nbsp; ba 41 59 00 00 00 00 00&nbsp=
; 00 00 00 00 00 00 00 00&nbsp; |.AY.............|<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; 00000410&nbsp; 00 00 00 00 00 00 00 00&nbsp=
; 00 00 00 00 00 00 00 00&nbsp; |................<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; That's why the patch to identify EDID's man=
ufacturer and product ID<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; to make sure this method applied on specifi=
c panel.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt; @@ -1953,6 &#43;1956,7 @@ stati=
c u32 edid_get_quirks(const struct edid
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt; *edid)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt;&nbsp; &nbsp; return 0;<o:p></o:=
p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt; &#43;EXPORT_SYMBOL(edid_get_qui=
rks);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; If we're going to export this it sh=
ould probably get a drm_ prefix.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; Yes! It will be better to have drm_ prefix =
for export funciton.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt; &#43;#define DPCD_EDP_GETSET_CT=
RL_PARAMS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0x344<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt; &#43;#define DPCD_EDP_CONTENT_L=
UMINANCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x3=
46<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt; &#43;#define DPCD_EDP_PANEL_LUM=
INANCE_OVERRIDE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x34a<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt; &#43;#define DPCD_EDP_BRIGHTNES=
S_NITS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x354<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt; &#43;#define DPCD_EDP_BRIGHTNES=
S_OPTIMIZATION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0x358<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt; &#43;#define EDP_CUSTOMIZE_MAX_=
BRIGHTNESS_LEVEL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (512)<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; This also seems a bit weird, the 0x=
300-0x3FF registers belong to the
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; _source_ DP device. But then later.=
..<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt; &#43; /* write source OUI */<o:=
p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt; &#43; write_val[0] =3D 0x00;<o:=
p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt; &#43; write_val[1] =3D 0xaa;<o:=
p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt; &#43; write_val[2] =3D 0x01;<o:=
p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; Oh hey, you're writing (an) Intel O=
UI to the Source OUI, so now it
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; makes sense that you're writing to =
registers whose behavior the source
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; defines. But this does raise the qu=
estion: is this just a convention
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; between Intel and this particular p=
anel? Would we expect this to work
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; with other similar panels? Is there=
 any way to know to expect this
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt; convention from DPCD instead?<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; TCON would reply on source OUI to configure=
 its capability. And these<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; DPCD registers were defined by vendor and I=
ntel. This change should works<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; with similar panels (with same TCON). Seems=
 there is another issue so<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; vendor decide to use non standard way to se=
tup brightness.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;For one thing, it's not standard. I hone=
stly don't know, but I'd assume<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;you wouldn't find behaviour with Intel O=
UI in non-Intel designs... and a<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;quirk of some sort seems like the only w=
ay to make this work.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;I suppose we could start off with a DPCD=
 quirk that only looks at the<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;sink OUI, and then, if needed, limit by =
DMI matching or by checking for<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;some DPCD registers (what, I am not sure=
, perhaps write the source OUI<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;and see how it behaves).<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;That would avoid the mildly annoying cha=
nge in the EDID quirk interface<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;and how it's being used.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;Thoughts?<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;BR,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;Jani.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; To be honest. Panel vendor did not provide =
enough sink info in DPCD.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; That's why hard to recognize it and we have=
 to confirm EDID instead of DPCD.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; Do you mean just confirm sink OUI only from=
 DPCD quirk? I'm afraid it<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; may impact the other panels with the same T=
CON. Any suggestion?<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;The problem with the EDID quirks is that exposin=
g the quirks sticks out<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;like a sore thumb. Thus far all of it has been c=
ontained in drm_edid.c<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;and they affect how the EDID gets parsed, for al=
l drivers. Obviously<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;this could be changed, but is it the right thing=
 to do?<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;What I suggested was, check the OUI only, and if=
 it matches, do<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;more. Perhaps there's something in the 0x300 ran=
ge of DPCD offsets that<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;you can read? Or perhaps you need to write the s=
ource OUI first, and<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;then do that.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;BR,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;Jani.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">These bytes are RO. Seems we can used it to identify=
 this panel<o:p></o:p></p>
<p class=3D"MsoNormal">as well. I will use DPCD quirk and renew this patch =
again.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;--<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;Jani Nikula, Intel Open Source Graphics =
Center<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_D42A2A322A1FCA4089E30E9A9BA36AC65D6AA2A5PGSMSX111garcor_--

--===============1331710496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1331710496==--
