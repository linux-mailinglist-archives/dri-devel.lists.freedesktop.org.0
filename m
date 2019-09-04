Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 654D6A7C72
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 09:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4D8892FF;
	Wed,  4 Sep 2019 07:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 719 seconds by postgrey-1.36 at gabe;
 Wed, 04 Sep 2019 01:38:54 UTC
Received: from mail3-167.sinamail.sina.com.cn (mail3-167.sinamail.sina.com.cn
 [202.108.3.167])
 by gabe.freedesktop.org (Postfix) with SMTP id E71BE8997E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 01:38:54 +0000 (UTC)
Received: from unknown (HELO [IPv6:::ffff:192.168.199.155])([114.254.173.51])
 by sina.com with ESMTP
 id 5D6F109B00037295; Wed, 4 Sep 2019 09:17:17 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 294774676470
MIME-Version: 1.0
To: Daniel Vetter <daniel@ffwll.ch>, 
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
From: Hillf Danton <hdanton@sina.com>
Subject: Re: gnome-shell stuck because of amdgpu driver [5.3 RC5]
Date: Wed, 4 Sep 2019 09:17:16 +0800
Importance: normal
X-Priority: 3
In-Reply-To: <CAKMK7uH9q09XadTV5Ezm=9aODErD=w_+8feujviVnF5LO_fggA@mail.gmail.com>
References: <20190830032948.13516-1-hdanton@sina.com>
 <CABXGCsNywbo90+wgiZ64Srm-KexypTbjiviwTW_BsO9Pm11GKQ@mail.gmail.com>
 <5d6e2298.1c69fb81.b5532.8395SMTPIN_ADDED_MISSING@mx.google.com>
 <CABXGCsMG2YrybO4_5jHaFQQxy2ywB53pY63qRfXK=ZKx5qc2Bw@mail.gmail.com>
 <CAKMK7uH9q09XadTV5Ezm=9aODErD=w_+8feujviVnF5LO_fggA@mail.gmail.com>
X-Mailman-Approved-At: Wed, 04 Sep 2019 07:14:38 +0000
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux kernel <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0147402429=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Message-Id: <20190904071441.5F4D8892FF@gabe.freedesktop.org>


--===============0147402429==
Content-Type: multipart/alternative;
	boundary="_FEA7D873-6F97-49AA-B05D-696E54FDDE7C_"


--_FEA7D873-6F97-49AA-B05D-696E54FDDE7C_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Daniel Vetter <daniel@ffwll.ch>
>>
>> Now 11:01pm and "gnome shell stuck warning" not appear since 19:17. So
>> looks like issue happens only when computer blocked and monitor in
>> power save mode.
>
> I'd bet on runtime pm or some other power saving feature in amdgpu
> shutting the interrupt handling down before we've handled all the
> interrupts. That would then result in a stuck fence.
>
> Do we already know which fence is stuck?

It is welcomed to shed a thread of light on how to collect/print that info.
Say line:xxx-yyy in path/to/amdgpu/zzz.c

Thanks
Hillf


--_FEA7D873-6F97-49AA-B05D-696E54FDDE7C_
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
--></style></head><body lang=3DZH-CN link=3Dblue vlink=3D"#954F72"><div cla=
ss=3DWordSection1><p class=3DMsoNormal><span class=3DDefaultFontHxMailStyle=
><span lang=3DEN-US>Daniel Vetter &lt;daniel@ffwll.ch&gt;<o:p></o:p></span>=
</span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt;&gt;<o:p>&nbsp;</o:p=
></span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt;&gt; Now 11:01pm an=
d &quot;gnome shell stuck warning&quot; not appear since 19:17. So</span></=
p><p class=3DMsoNormal><span lang=3DEN-US>&gt;&gt; looks like issue happens=
 only when computer blocked and monitor in</span></p><p class=3DMsoNormal><=
span lang=3DEN-US>&gt;&gt; power save mode.</span></p><p class=3DMsoNormal>=
<span lang=3DEN-US>&gt;<o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><sp=
an lang=3DEN-US>&gt; I'd bet on runtime pm or some other power saving featu=
re in amdgpu</span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; shuttin=
g the interrupt handling down before we've handled all the</span></p><p cla=
ss=3DMsoNormal><span lang=3DEN-US>&gt; interrupts. That would then result i=
n a stuck fence.</span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt;<o:p=
>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; Do we =
already know which fence is stuck?</span></p><p class=3DMsoNormal><span lan=
g=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-=
US>It is welcomed to shed a thread of light on how to collect/print that in=
fo.</span></p><p class=3DMsoNormal><span lang=3DEN-US>Say line:xxx-yyy in p=
ath/to/amdgpu/zzz.c</span></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>=
&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>Thanks</span=
></p><p class=3DMsoNormal><span lang=3DEN-US>Hillf</span></p><p class=3DMso=
Normal><span class=3DDefaultFontHxMailStyle><span lang=3DEN-US><o:p>&nbsp;<=
/o:p></span></span></p></div></body></html>=

--_FEA7D873-6F97-49AA-B05D-696E54FDDE7C_--



--===============0147402429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0147402429==--


