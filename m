Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C907F182A84
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13E66EA52;
	Thu, 12 Mar 2020 08:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5156E59D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 08:41:34 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id i1so1066084oie.8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 01:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=232Zb9ixiFhseUD04jSDvMn/Fua6FgCSLsxhX6wGVhk=;
 b=Cjjg6hRXHFNShJRxiSEcBY9eJbZ0Fapg2hR5aa0lYuZLfhE8s797PU0/pXuYGVrJ7q
 OPhsdINdiyNHMTQFxPNVknHN2PP+u2M893zcXmR8hbu7pbFcbiLEH0A2K30CvIGTfqjE
 Z2SH9zXnNhWjuWpYh/ttARCIKbWtOy/kdG9EnHjElydb0Py/V5jYcD4vBH44ClJlsEuC
 c3YAv8ULkIpi2PsUhZROseH+uJTQWPSvPprNY3tucIOyDLmvsVZqPyC1FJo8nG/ngWvL
 TyV7tx4d4AwqLIhN0aIsX9EHpHKq06kOlYOe1tJbXiSNMTFld8l4As92iSg1KXPQGF/l
 z4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=232Zb9ixiFhseUD04jSDvMn/Fua6FgCSLsxhX6wGVhk=;
 b=iWSzwEDELPPpH62IHk0UNjlVTQN9NrmwWSLem6MRNctiwTDcVD9OmyfclhZF75LA7E
 7Jpd72T+lnCphGjb4r8fRta/uIrqAdvuDVNNnVvQTv3u9z36/vTHIabtATtWCUS/Vhja
 fu5PKaFvWdKRG4Kg5Et/0s9U8Bul6BZQB5rpXRDzbeTvn9YXeAm2YUSJDru2edxoo/ce
 qEqKpreqMZ0vNqwv1dzyj+84RIJXpaaEuWefWmAmLguBCxLVKAHzRRyCtkt+UYFOLqW8
 q0jaMkkqQZ8Gj1XKBQp9viTxsGibWzky2zxNRsvRpfpxLt0YP6M6IJal8J5WotaqLd9g
 tSAQ==
X-Gm-Message-State: ANhLgQ2ONDFP3xV9Vlg1aqlbV+KZJ/YVI8Q9zw6OjpzE/BG9ZjKbwr8x
 BUk2dlHJC7XRS++Fqz96WH84Hpj2fsovOoqCmkQdRpMUVSI=
X-Google-Smtp-Source: ADFU+vucAJeGiLj43fsEW8jlRL8+E1M8+UkFuyDlNlEXv3T8FKSEcDVEBkZhhBu3aU3N89xVNiVqQu03pIKK/rox27s=
X-Received: by 2002:aca:ed44:: with SMTP id l65mr1140163oih.63.1583916093682; 
 Wed, 11 Mar 2020 01:41:33 -0700 (PDT)
MIME-Version: 1.0
From: Vikas Patil <vikasmpatil@gmail.com>
Date: Wed, 11 Mar 2020 09:41:22 +0100
Message-ID: <CA+kt3u3CV-kyY-ha=Xcj4UEtvX19hP2PGRxF1Tb1J3K4rPiz+A@mail.gmail.com>
Subject: How to wait for DRM_MODE_CONNECTED status?
To: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
Content-Type: multipart/mixed; boundary="===============0844530271=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0844530271==
Content-Type: multipart/alternative; boundary="0000000000001e36b505a090347e"

--0000000000001e36b505a090347e
Content-Type: text/plain; charset="UTF-8"

Dear All,

What is the most effective/optimal/recommended way to wait for
DRM_MODE_CONNECTED status?

This is to make sure when disply manager (uses drm apis) starts and if it
do not get the DRM_MODE_CONNECTED status as some dependent driver is still
loading and setting up (e.g. serializer driver) in that case what is the
best way to wait for it?

Should I poll the state repeatedly in a loop? Will this value be
automatically get updated?
Should I close() the DRM device and re-open() it again?
Is there any interrupt/callback we can register for to receive updated for
this connector state?

Thank  you.

Best Regards,
Vikash

--0000000000001e36b505a090347e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear All,</div><div><br></div><div>
















<span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans-serif" l=
ang=3D"EN-US">What is the most effective/optimal/recommended way to wait fo=
r DRM_MODE_CONNECTED status?</span></div><div><span style=3D"font-size:11pt=
;font-family:&quot;Calibri&quot;,sans-serif" lang=3D"EN-US"><br></span></di=
v><div><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans-s=
erif" lang=3D"EN-US">This is to make sure when disply manager (uses drm api=
s) starts and if it do not get the=20
DRM_MODE_CONNECTED status as some dependent driver is still loading and set=
ting up (e.g. serializer driver) in that case what is the best way to wait =
for it?</span></div><div><span style=3D"font-size:11pt;font-family:&quot;Ca=
libri&quot;,sans-serif" lang=3D"EN-US"><br></span></div><div><span style=3D=
"font-size:11pt;font-family:&quot;Calibri&quot;,sans-serif" lang=3D"EN-US">=
Should I poll the state repeatedly in a loop? Will this value be automatica=
lly get updated?<br>Should I close() the DRM device and re-open() it again?=
<br>Is there any interrupt/callback we can register for to receive updated =
for this connector state?</span>



</div><div><br></div><div>Thank=C2=A0 you.</div><div><br></div><div>Best Re=
gards,</div><div>Vikash<br></div></div>

--0000000000001e36b505a090347e--

--===============0844530271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0844530271==--
