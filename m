Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C50A1E1A68
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 06:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5490F89D67;
	Tue, 26 May 2020 04:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E7E89D67
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 04:31:36 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id c17so6785528uaq.13
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 21:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3ZpeBWjCf+OcJ9a5jQ9wWMdGQQcirzNtwzBIdZQq1D0=;
 b=uk8EuRAX7EfVulooAIVSd2QBJ4MgeJyFo7/UwReydzUh99iXNCgW8U4jbLoEUTKNwm
 sFpOpc67Fjhl/ST7qb1TYnXAojj0DOn6nsYVBvOx73OCllrSJtK3wQlYY9gvCTX4g584
 RQopn1tBEO2cnwrlT2gsdiPIEnBtuM9MJDEuDyKIAnxNNkC7+PlE5xUfyJz3w2Jhi9ZI
 yT3srooMfSLP+06nhSgFomrz6/ypTb9mOnmuSmZU5+DOmMEwNVSdXOzBZvbS0Eflsjx3
 r30xLwcvo1lMI3VvfViHBPLnx5oj1Zed9GbnTT5PAs4Hz2ML0kHBv5VFUCXVoOIn6V8O
 cmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3ZpeBWjCf+OcJ9a5jQ9wWMdGQQcirzNtwzBIdZQq1D0=;
 b=UKYqm6wLbr032eZD9bgtkhH5XCzyzYA4rFLA/29JEpdWUt/wnL7VuQt17uJ45fBxVW
 UsQue5JydNezbv4EUF0fJsuXgqntQpVDJqxJqaJP37drTZ8tKwXXVCFGK9AQJvbkL1J3
 dY+WFFQDSzqvk3Km2y0VxhNX6ybqvHuY+G+dbcI9yMQbLmgKYbCVg5Sf5kqnhoXb3VZv
 XKsX4khIZO9NGcQuOlAyPmuLX9/VI1TLo67lVxEC5s6i5LovEJrl9G7n6ricxFdOH4XO
 AQf8tStGyMboN7o5OdEUsent5p3q5ISmUs9no//gEDuJGG6djgMB+hNWs5jm0yeG4oAy
 rkMw==
X-Gm-Message-State: AOAM530G5Yf/r0kOiHBcLQgrcN3ZukkrpWHpDlJhj9SN0oQ9CzXmMkFY
 W0H7OWwvpFEVTqz96cnpoaTFcdhpXzdkIeQ+8PJAucUW3e8=
X-Google-Smtp-Source: ABdhPJyp/lCUASe9Ev/I1nHnl9RUaEGKjhRLWLmPonc+CdERX/Kwqm3CVE87v0LKnbl5kSd16tajgr+CDk1bNRT8rH4=
X-Received: by 2002:a9f:3603:: with SMTP id r3mr19654096uad.102.1590467494289; 
 Mon, 25 May 2020 21:31:34 -0700 (PDT)
MIME-Version: 1.0
From: Yogish Kulkarni <yogishkulkarni@gmail.com>
Date: Tue, 26 May 2020 10:01:23 +0530
Message-ID: <CAL3Fm-JJbjCby5_HojTf9dWKurw+CECN7LDqamtf53c9L-0jtw@mail.gmail.com>
Subject: Dynamically change enumeration list of DRM enumeration property
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
Content-Type: multipart/mixed; boundary="===============0915909772=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0915909772==
Content-Type: multipart/alternative; boundary="00000000000006248b05a6859287"

--00000000000006248b05a6859287
Content-Type: text/plain; charset="UTF-8"

Hi,

Is it possible to dynamically change enumeration list of  DRM enumeration
property ? Motivation behind this question is to understand whether it is
possible to create connector enum property (e.g a property which will list
supported output encodings -  like yuv420, yuv422 etc) whose list of
supported enum values could be changed dynamically e.g. based on which sink
is connected.

I think there is existing EDID connector property whose value changes based
on connected sink. EDID is a BLOB property, I am trying to understand if
this is also possible for ENUM type property. There is
"drm_property_replace_blob" to replace blob but I wasn't able to find any
API which could replace list of supported enums. Alternatively, would it be
good idea to destroy custom enum property created by a driver and create
new enum property with new list of supported enums e.g when there is a
HOTPLUG event.

Thanks,
-Yogish

--00000000000006248b05a6859287
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div></div><div>Is it possibl=
e to dynamically change enumeration list of =C2=A0DRM enumeration property =
? Motivation behind this question is to understand whether it is possible t=
o create connector enum property (e.g a property which will list supported =
output encodings -=C2=A0 like yuv420, yuv422 etc) whose list of supported e=
num values could be changed dynamically e.g. based on which sink is connect=
ed.</div><div><br></div><div> I think there is existing EDID connector prop=
erty whose value changes based on connected sink. EDID is a BLOB property, =
I am trying to understand if this is also possible for ENUM type property. =
There is &quot;drm_property_replace_blob&quot; to replace blob but I wasn&#=
39;t able to find any API which could replace list of supported enums. Alte=
rnatively, would it be good idea to destroy custom enum property created by=
 a driver and create new enum property with new list of supported enums e.g=
 when there is a HOTPLUG event.<br></div><div></div><div><br></div><div>Tha=
nks,</div><div>-Yogish<br></div></div>

--00000000000006248b05a6859287--

--===============0915909772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0915909772==--
