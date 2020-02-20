Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AB8166688
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 19:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FE289CD7;
	Thu, 20 Feb 2020 18:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F9289CD7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 18:46:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1582224390; h=Content-Type: MIME-Version: Message-ID: Date:
 Subject: To: From: Sender;
 bh=aubYGhPIepdsqXsSzHOAT4/niHaZQbjgPeotFzZIp7w=;
 b=tMoWYpRQT+cAMJ5SfHZsl6IHxftqOQGa6bx8hPNnYkxoAfpMZOQ08io2lYPoFk68CE7x+Zja
 RrXOS1Stm7yKrl8UwaBVy2C+GOW3KqVdspOm5ycdaoh1EUuQ7aNQhXuNPVijIcCbZKeOm7ch
 BdL3c6RlURN0SBVzEmK/KLHvQKA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4ed3e7.7f8252242f10-smtp-out-n02;
 Thu, 20 Feb 2020 18:45:59 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B9A8DC4479F; Thu, 20 Feb 2020 18:45:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,HTML_MESSAGE,
 SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from JEYKUMAR1 (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: jsanka)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D6CD3C43383;
 Thu, 20 Feb 2020 18:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D6CD3C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jsanka@codeaurora.org
From: <jsanka@codeaurora.org>
To: "'Sean Paul'" <seanpaul@chromium.org>, "'Rob Clark'" <robdclark@gmail.com>,
 <dri-devel@lists.freedesktop.org>
Subject: Support for early wakeup in DRM
Date: Thu, 20 Feb 2020 10:45:57 -0800
Message-ID: <00e901d5e81d$fd609ac0$f821d040$@codeaurora.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AdXoHfy9XNgzjYeuQouCBuTEDJRhEg==
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
Content-Type: multipart/mixed; boundary="===============1236610591=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multipart message in MIME format.

--===============1236610591==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00EA_01D5E7DA.EF3DCFF0"
Content-Language: en-us

This is a multipart message in MIME format.

------=_NextPart_000_00EA_01D5E7DA.EF3DCFF0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello All, 

I am seeking recommendations for DRM compatible methods of updating the HW
other than frame commit path. When exiting idle/runtime_suspend, the driver
votes for a bunch of resources including power/clk/bandwidth as a part of
first commit handling. This usually adds a few millisecond delay before
processing the frame. The requirement is to find possible ways to reduce
this delay by providing an early intimation to the framework to "prepare"
the HW by voting for the resources and keep the HW ready to process an
imminent frame commit. Especially in performance oriented Automotive world,
these delays are very time critical and we are working on ways to mitigate
them.  

 

DRM framework converges all the parameters affecting the HW in terms of DRM
properties in a single COMMIT call. To address the above issue, we need a
parallel channel which should allow the framework to make necessary changes
to the HW without violating the master access privileges. 

 

Before resorting to custom downstream ways, I want to check with the
community for folks who might have encountered and resolved such issues.

 

Thanks and Regards,

Jeykumar S

Qualcomm Inc.

 


------=_NextPart_000_00EA_01D5E7DA.EF3DCFF0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Latha;
	panose-1:2 0 4 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
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
span.EmailStyle18
	{mso-style-type:personal;
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
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal>Hello All, <o:p></o:p></p><p class=3DMsoNormal =
style=3D'text-indent:.5in'>I am seeking recommendations for DRM =
compatible methods of updating the HW other than frame commit path. When =
exiting idle/runtime_suspend, the driver votes for a bunch of resources =
including power/clk/bandwidth as a part of first commit handling. This =
usually adds a few millisecond delay before processing the frame. The =
requirement is to find possible ways to reduce this delay by providing =
an early intimation to the framework to &#8220;prepare&#8221; the HW by =
voting for the resources and keep the HW ready to process an imminent =
frame commit. Especially in performance oriented Automotive world, these =
delays are very time critical and we are working on ways to mitigate =
them. &nbsp;<o:p></o:p></p><p class=3DMsoNormal =
style=3D'text-indent:.5in'><o:p>&nbsp;</o:p></p><p class=3DMsoNormal =
style=3D'text-indent:.5in'>DRM framework converges all the parameters =
affecting the HW in terms of DRM properties in a single COMMIT call. To =
address the above issue, we need a parallel channel which should allow =
the framework to make necessary changes to the HW without violating the =
master access privileges. <o:p></o:p></p><p class=3DMsoNormal =
style=3D'text-indent:.5in'><o:p>&nbsp;</o:p></p><p class=3DMsoNormal =
style=3D'text-indent:.5in'>Before resorting to custom downstream ways, I =
want to check with the community for folks who might have encountered =
and resolved such issues.<o:p></o:p></p><p class=3DMsoNormal =
style=3D'text-indent:.5in'><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Thanks and Regards,<o:p></o:p></p><p =
class=3DMsoNormal>Jeykumar S<o:p></o:p></p><p class=3DMsoNormal>Qualcomm =
Inc.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_000_00EA_01D5E7DA.EF3DCFF0--

--===============1236610591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1236610591==--
