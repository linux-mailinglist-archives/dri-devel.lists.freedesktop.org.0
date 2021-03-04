Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9916232CEA2
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 09:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F0D6EA07;
	Thu,  4 Mar 2021 08:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439166E47B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 04:14:20 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id c131so27035874ybf.7
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 20:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=matrixcomsec.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=D/nnFXScPC5zGFLLIQblBA+/a0krXF60vxkADct1ql4=;
 b=bmQvbxg4762RlD2gySX5hldC/Q5ZXzxAbgdFYmyQw43PZW8rgy+B0nw5G+2h3e+uKI
 N00PEImwF4yv+rk/vsEJkMHl7IyWau9FPair1yjzQDx6ppXc3GQ0GRBeZ5xSLZwhbdWe
 Ba/8Yeljy6YEiU/cgffsRvKdQ9PVkDrHVjiQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=D/nnFXScPC5zGFLLIQblBA+/a0krXF60vxkADct1ql4=;
 b=FLVLYiCn7o7VTJHHnLRA5bIW5gUM0PWn7KLCM9DSzj7oCsky0wrSwM7ghV/P/cIpXj
 XcWJOVXPMgYmOn3vkMi2chKiapC+tsC3ijkI6OoejdWDWAa3749Hpcv8INQ1Xj+9aNgn
 +Mr3brL+tGyLJmX7Bm2MRZdepiQQu2hFeC+I1qoNJeEV400U87g8cfchIiuFC7epuxHE
 5UcFGlF+WGlTGffuBHgtvYs4rp0JxhuTol3C7I2yDcjDt9rTzZQZaM60rbtH1dTHNR12
 8aoslme3zYGUWLWGXXjkOAPpKZUzfD4jG2qoKlNz4YG2LQ4Lw5HmlE8q2ih2GlGyNFnk
 QW8g==
X-Gm-Message-State: AOAM533SWlsUBMqXGu5q5D9/pW1L5coMd/FXGoG7ZAsmomW2ZWyUc01E
 l0n8Gq0AfUh45ayL8/BsJozYN7YlZ7CAvOK0xAdEPG7Nxi54Q8If
X-Google-Smtp-Source: ABdhPJzzeEvXaH3pR4BcT4f+3vD8xiudimM9OeBrauIaS8/FnkiSFUhczOUhj1E64xSQpMtolbNECbCyDqAXBJuTCOE=
X-Received: by 2002:a25:76c3:: with SMTP id r186mr3759496ybc.269.1614831258748; 
 Wed, 03 Mar 2021 20:14:18 -0800 (PST)
MIME-Version: 1.0
From: Hardik Panchal <hardik.panchal@matrixcomsec.com>
Date: Thu, 4 Mar 2021 09:43:22 +0530
Message-ID: <CAESbsVNtvJaPGSYqvgzGGeriH11vcnJrQ=nnCJ4sbfyE1Y1pmQ@mail.gmail.com>
Subject: Query regarding DRM mastership sharing between multiple process
To: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 04 Mar 2021 08:41:51 +0000
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
Content-Type: multipart/mixed; boundary="===============0821099228=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0821099228==
Content-Type: multipart/alternative; boundary="0000000000008ce9a405bcae3366"

--0000000000008ce9a405bcae3366
Content-Type: text/plain; charset="UTF-8"

Hello Sir/Madam,

I am trying to render some stuff using DRM with Qt GUI application and
decoded stream from Intel H/w decoder.

I have two applications one is for GUI content and another one is for
decoded video streams. While doing this I am facing an issue that only
singal process acquires DRM mastership while the other one is getting
error.

While wondering how to get the privilege to render stuff I came
across GET_MAGIC and AUTH_MAGIC.
Please refer to this text from the MAN page of DRM.

All DRM devices provide authentication mechanisms. Only a DRM-Master is
> allowed to perform mode-setting or modify core state and only one user can
> be DRM-Master at a time. See drmSetMaster
> <https://www.commandlinux.com/man-page/man3/drmSetMaster.3.html>(3) for
> information on how to become DRM-Master and what the limitations are. Other
> DRM users can be authenticated to the DRM-Master via drmAuthMagic
> <https://www.commandlinux.com/man-page/man3/drmAuthMagic.3.html>(3) so
> they can perform buffer allocations and rendering.
>

As per this the client which is authenticated using magic code should be
able to allocate buffer and rendering.
But while doing this I am not able to use drmModeSetPlane() for rendering
stuff on display from an authenticated client application. It is giving me
Permission Denied.

As per my understanding if the client is authenticated by using
GET/AUTH_MAGIC it should be able to set a plane and render stuff on the
display.

Is my understanding correct? Can we use this method to simultaneously
render from two applications?

Thank you in advance.

Having Addiction of Self-Dependence

*Hardik Panchal*
SDT - Satatya Devices
Contact No. : 9924472937
Email : hardik23398@gmail.com

--0000000000008ce9a405bcae3366
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello=C2=A0Sir/Madam,<div><br></div><div>I am trying to re=
nder some stuff using DRM with Qt GUI application and decoded stream from I=
ntel H/w decoder.</div><div><br></div><div>I have two applications one is f=
or GUI content and another one is for decoded video streams. While doing th=
is I am facing an issue that only singal process acquires DRM mastership wh=
ile the other one is getting error.=C2=A0</div><div><br></div><div>While wo=
ndering how to get the privilege=C2=A0to render stuff I came across=C2=A0GE=
T_MAGIC and AUTH_MAGIC.</div><div>Please refer to this text from the MAN pa=
ge of DRM.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><span style=3D"color:rgb(51,51,51);font-family:&quot;Helvetica Neue&q=
uot;,Helvetica,Arial,sans-serif;font-size:14px">All DRM devices provide aut=
hentication mechanisms. Only a DRM-Master is allowed to perform mode-settin=
g or modify core state and only one user can be DRM-Master at a time. See=
=C2=A0</span><span style=3D"box-sizing:border-box;font-weight:700;color:rgb=
(80,32,0);font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif=
;font-size:14px"><a href=3D"https://www.commandlinux.com/man-page/man3/drmS=
etMaster.3.html" target=3D"_blank" style=3D"color:rgb(51,122,183);box-sizin=
g:border-box;background-color:transparent;text-decoration-line:none">drmSet=
Master</a></span><span style=3D"color:rgb(51,51,51);font-family:&quot;Helve=
tica Neue&quot;,Helvetica,Arial,sans-serif;font-size:14px">(3) for informat=
ion on how to become DRM-Master and what the limitations are. Other DRM use=
rs can be authenticated to the DRM-Master via=C2=A0</span><span style=3D"bo=
x-sizing:border-box;font-weight:700;color:rgb(80,32,0);font-family:&quot;He=
lvetica Neue&quot;,Helvetica,Arial,sans-serif;font-size:14px"><a href=3D"ht=
tps://www.commandlinux.com/man-page/man3/drmAuthMagic.3.html" target=3D"_bl=
ank" style=3D"color:rgb(51,122,183);box-sizing:border-box;background-color:=
transparent;text-decoration-line:none">drmAuthMagic</a></span><span style=
=3D"color:rgb(51,51,51);font-family:&quot;Helvetica Neue&quot;,Helvetica,Ar=
ial,sans-serif;font-size:14px">(3) so they can perform buffer allocations a=
nd rendering.=C2=A0</span><a name=3D"m_3527178621886524055_lbAF" style=3D"c=
olor:rgb(51,122,183);box-sizing:border-box;font-family:&quot;Helvetica Neue=
&quot;,Helvetica,Arial,sans-serif;font-size:14px">=C2=A0</a><br></blockquot=
e><div><br></div><div>As per this the client which is authenticated using m=
agic code should be able to allocate buffer and rendering.</div><div>But wh=
ile doing this I am not able to use drmModeSetPlane() for rendering stuff o=
n display from an authenticated client application. It is giving me Permiss=
ion Denied.</div><div><br></div><div>As per my understanding if the client =
is authenticated by using GET/AUTH_MAGIC it should be able to set a plane a=
nd render stuff on the display.</div><div><br></div><div>Is my understandin=
g correct? Can we use this method to simultaneously render from two applica=
tions?=C2=A0</div><div><br></div><div>Thank you in advance.</div><div><div =
dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><d=
iv dir=3D"ltr"><div><div dir=3D"ltr"><div><blockquote style=3D"margin:0px 0=
px 0px 0.8ex;padding-left:1ex;border-left:1px solid rgb(204,204,204)"><font=
 color=3D"#ff9900">Having Addiction of Self-Dependence</font></blockquote><=
/div><div><b><font color=3D"#3d85c6"><font color=3D"#ff9900"></font><font c=
olor=3D"#005000"></font><font color=3D"#b08000"></font><font color=3D"#ff99=
00"></font>Hardik Panchal</font></b></div><div><font color=3D"#3d85c6" face=
=3D"arial,helvetica,sans-serif">SDT - Satatya Devices</font></div><div><fon=
t color=3D"#3d85c6" face=3D"arial,helvetica,sans-serif">Contact No. : 99244=
72937</font></div><div><font color=3D"#3d85c6" face=3D"arial,helvetica,sans=
-serif">Email : <a href=3D"mailto:hardik23398@gmail.com" target=3D"_blank">=
hardik23398@gmail.com</a></font></div></div></div></div></div></div></div>

--0000000000008ce9a405bcae3366--

--===============0821099228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0821099228==--
