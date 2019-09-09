Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F64EAE424
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 08:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D776E827;
	Tue, 10 Sep 2019 06:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-166.sinamail.sina.com.cn (mail3-166.sinamail.sina.com.cn
 [202.108.3.166])
 by gabe.freedesktop.org (Postfix) with SMTP id C796489722
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 07:16:13 +0000 (UTC)
Received: from unknown (HELO [IPv6:::ffff:172.20.10.2])([61.148.244.178])
 by sina.com with ESMTP
 id 5D75FBAB0002BC5A; Mon, 9 Sep 2019 15:13:48 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 92381354923368
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>
From: Hillf Danton <hdanton@sina.com>
Subject: Re: Xorg indefinitely hangs in kernelspace
Date: Mon, 9 Sep 2019 15:13:48 +0800
Importance: normal
X-Priority: 3
In-Reply-To: <20190909055219.q44k27cczwkuio3z@sirius.home.kraxel.org>
References: <20190906055322.17900-1-hdanton@sina.com>
 <20190909055219.q44k27cczwkuio3z@sirius.home.kraxel.org>
X-Mailman-Approved-At: Tue, 10 Sep 2019 06:57:58 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 Jaak Ristioja <jaak@ristioja.ee>, Dave Airlie <airlied@redhat.com>
Content-Type: multipart/mixed; boundary="===============1714248832=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Message-Id: <20190910065807.68D776E827@gabe.freedesktop.org>


--===============1714248832==
Content-Type: multipart/alternative;
	boundary="_AD05A452-BEFD-47CB-8E14-119A02D5DF11_"


--_AD05A452-BEFD-47CB-8E14-119A02D5DF11_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

On Mon, 9 Sep 2019 from Gerd Hoffmann <kraxel@redhat.com>
>
> Hmm, I think the patch is wrong.  As far I know it is the qxl drivers's
> job to call ttm_eu_backoff_reservation().  Doing that automatically in
> ttm will most likely break other ttm users.
>
Perhaps.

>So I guess the call is missing in the qxl driver somewhere, most likely
>in some error handling code path given that this bug is a relatively
>rare event.
>
>There is only a single ttm_eu_reserve_buffers() call in qxl.
>So how about this?
>
No preference in either way if it is a right cure.

BTW a quick peep at the mainline tree shows not every
ttm_eu_reserve_buffers() pairs with ttm_eu_backoff_reservation()
without qxl being taken in account.

Hillf

--_AD05A452-BEFD-47CB-8E14-119A02D5DF11_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:DengXian;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	text-indent:21.0pt;
	font-size:10.5pt;
	font-family:DengXian;}
span.DefaultFontHxMailStyle
	{mso-style-name:"Default Font HxMail Style";
	font-family:DengXian;
	color:windowtext;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1496729359;
	mso-list-type:hybrid;
	mso-list-template-ids:-1873276564 -1 67698691 67698693 67698689 67698691 6=
7698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0D8;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:18.0pt;
	text-indent:-18.0pt;
	font-family:Wingdings;
	mso-fareast-font-family:DengXian;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:\F06E;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:42.0pt;
	text-indent:-21.0pt;
	font-family:Wingdings;}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F075;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:63.0pt;
	text-indent:-21.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F06C;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:84.0pt;
	text-indent:-21.0pt;
	font-family:Wingdings;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F06E;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:105.0pt;
	text-indent:-21.0pt;
	font-family:Wingdings;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F075;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:126.0pt;
	text-indent:-21.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F06C;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:147.0pt;
	text-indent:-21.0pt;
	font-family:Wingdings;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F06E;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:168.0pt;
	text-indent:-21.0pt;
	font-family:Wingdings;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F075;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:189.0pt;
	text-indent:-21.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style></head><body lang=3DZH-CN link=3Dblue vlink=3D"#954F72"><div cla=
ss=3DWordSection1><p class=3DMsoNormal><span lang=3DEN-US>Hi,</span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=
=3DMsoNormal><span lang=3DEN-US>On Mon, 9 Sep 2019 from Gerd Hoffmann &lt;k=
raxel@redhat.com&gt;<o:p></o:p></span></p><p class=3DMsoNormal><span lang=
=3DEN-US>&gt;<o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3D=
EN-US>&gt; Hmm, I think the patch is wrong.=C2=A0 As far I know it is the q=
xl drivers's</span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; job to =
call ttm_eu_backoff_reservation().=C2=A0 Doing that automatically in</span>=
</p><p class=3DMsoNormal><span lang=3DEN-US>&gt; ttm will most likely break=
 other ttm users.</span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt;<o:=
p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>Perhaps.</=
span></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></=
p><p class=3DMsoNormal><span lang=3DEN-US>&gt;So I guess the call is missin=
g in the qxl driver somewhere, most likely</span></p><p class=3DMsoNormal><=
span lang=3DEN-US>&gt;in some error handling code path given that this bug =
is a relatively</span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt;rare =
event.</span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt;<o:p>&nbsp;</o=
:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt;There is only a s=
ingle ttm_eu_reserve_buffers() call in qxl.</span></p><p class=3DMsoNormal>=
<span lang=3DEN-US>&gt;So how about this?</span></p><p class=3DMsoNormal><s=
pan lang=3DEN-US>&gt;<o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span=
 lang=3DEN-US>No preference in either way if it is a right cure.</span></p>=
<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p clas=
s=3DMsoNormal><span lang=3DEN-US>BTW a quick peep at the mainline tree show=
s not every</span></p><p class=3DMsoNormal><span lang=3DEN-US>ttm_eu_reserv=
e_buffers() pairs with ttm_eu_backoff_reservation()</span></p><p class=3DMs=
oNormal><span lang=3DEN-US>without qxl being taken in account.</span></p><p=
 class=3DMsoNormal><span class=3DDefaultFontHxMailStyle><span lang=3DEN-US>=
<o:p>&nbsp;</o:p></span></span></p><p class=3DMsoNormal><span class=3DDefau=
ltFontHxMailStyle><span lang=3DEN-US>Hillf<o:p></o:p></span></span></p></di=
v></body></html>=

--_AD05A452-BEFD-47CB-8E14-119A02D5DF11_--



--===============1714248832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1714248832==--


