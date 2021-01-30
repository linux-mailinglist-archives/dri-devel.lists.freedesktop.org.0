Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EB330982B
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 21:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B946E102;
	Sat, 30 Jan 2021 20:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFC76E102
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 20:08:03 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id b20so6772663ljo.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 12:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=DwgcfeyNbeeYVnPrppUqIKbObotchGFU53qsUYRK8ps=;
 b=gDlN/bAMHIQyeDcLknGsdc4HyCOkg7CbJkIwIZTnUuOiMsflBb9a6DmF82L8ASj7th
 VM4YeqE/RDDbWzA4GEsNVQtWbwDCOGJ1yCMwjYZTaqUP9/Z9YIlH3Sd3PK+UoXWxBEQy
 A6hGkuczeC+Nb3rRO0UfeAfKxd0D7OP/su6Iu4cYVRvodpu3MfTh1ZbzARRf3+etif4k
 x1Lcdy3pEmPGuQ563Ow80L07fJgBNV2RW/lMRq8n4qtbg2ETwWgHm207RY4KIYDCao2K
 Pw6HoSOSb/USMQaYz6HXkYpcmVd7aohhUe/+7BpVPPay/GLnWqXst9fFQ4FnXY1nZ93O
 qfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DwgcfeyNbeeYVnPrppUqIKbObotchGFU53qsUYRK8ps=;
 b=e/1WWJaICfUYNq2dvU3/tcW/uLCk2mtaHK+gA1Zu3Ao01APMW9WPANDErYjzcrQnzG
 3/+Yh3u5HsBQeCi9pEe+N5bRvniwPVvDACJUhOFPXO/qUtPyzgGi5dwipKeqBHSlGPGU
 SN17Fb/rxZmXiAlTDPgM5QbAs4TKsB1AgE3PcdLH5HhVtNGyvLgvjzYtWfWXlwzg/c8x
 Z73iSs1eiG2qc57xeiJ4bR47onTNy2MH5aeH3VxxlZzXni1Un37cLYOae3EB3TQqNFjU
 XL0+wJc8X9ib+Hg065A7QWaYEfmzmEjMPP6E6N0++RAazVPGMlM7sVQh+T6FOiSYn3uj
 es8w==
X-Gm-Message-State: AOAM531gVBPt+KDGuvzomINfOrfgcxezCwrSkp/lQ2IZ/emVfKvXr5fW
 eTQm4IfBp7KGTinmRF85g07d9C3oe9Fe5CBoJEDORzaaVG3JHlRd
X-Google-Smtp-Source: ABdhPJxOI0qp7FpKYV/p9jqL1kp4H4V3ayJ+PzeBGMUuzf16BCp0KBrLRJJgmIM8vGUijqwXjULPgeE0bQu4ikm34uc=
X-Received: by 2002:a2e:9188:: with SMTP id f8mr5681898ljg.462.1612037281723; 
 Sat, 30 Jan 2021 12:08:01 -0800 (PST)
MIME-Version: 1.0
From: Muhamad Moghadam <msm1365@gmail.com>
Date: Sat, 30 Jan 2021 23:37:50 +0330
Message-ID: <CAHw=+OQ9ZnMdX3H6o2nLqiZX_P+DnvB7eRtVjSguDCQgmqO5Tw@mail.gmail.com>
Subject: intel gpu hang solved in fedora
To: dri-devel@lists.freedesktop.org
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
Content-Type: multipart/mixed; boundary="===============1925025160=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1925025160==
Content-Type: multipart/alternative; boundary="0000000000008ab8de05ba23adc4"

--0000000000008ab8de05ba23adc4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everybody,

After 6 month Intel gpu hang on fedora (drm), with the introduction of 5.11
kernel this problem was solved. Now you can update to 5.11 kernel
for Liberation.

--=20
=D9=85=D8=AC=D9=84=D9=87 =DA=A9=D8=A7=D9=85=DB=8C=D9=88=D9=86 <http://www.t=
ruckdriver.ir/> =D8=B3=D9=84=D8=B7=D8=A7=D9=86 =D8=AC=D8=A7=D8=AF=D9=87
Persian Trucking <http://www.truckdriver.ir/> Mag

--0000000000008ab8de05ba23adc4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:tahoma,s=
ans-serif;font-size:large">Hello everybody,<br><br>After 6 month Intel gpu =
hang on fedora (drm), with the introduction of 5.11 kernel this problem was=
 solved. Now you can update to 5.11 kernel for=C2=A0Liberation.</div><div><=
br></div>-- <br><div dir=3D"rtl" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"rtl">=D9=85=D8=AC=D9=84=
=D9=87 <a href=3D"http://www.truckdriver.ir/" target=3D"_blank">=DA=A9=D8=
=A7=D9=85=DB=8C=D9=88=D9=86</a> =D8=B3=D9=84=D8=B7=D8=A7=D9=86 =D8=AC=D8=A7=
=D8=AF=D9=87<br>Persian <a href=3D"http://www.truckdriver.ir/" target=3D"_b=
lank">Trucking</a> Mag<br></div></div></div></div>

--0000000000008ab8de05ba23adc4--

--===============1925025160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1925025160==--
