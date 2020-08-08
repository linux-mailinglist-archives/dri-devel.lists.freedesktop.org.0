Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 136EE2402CF
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 09:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE806E09A;
	Mon, 10 Aug 2020 07:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598206EAC3;
 Sat,  8 Aug 2020 04:28:33 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id f26so2860365ljc.8;
 Fri, 07 Aug 2020 21:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=9uPb1LglrnQf0TOx6C6j+FpM79Brg7e9GdL7QKGrvQM=;
 b=DUY1v2RxINATzNQZVAzSS+9AvazKsqfoI/NQktRiWvKK4KM1ypS22XmVGIY0AM9WM1
 FlnjM1F1V9Dktux80LVq7WA8Hrofki36IZLDHNH6cep1Jf99HxEMpb+NGBTeIUNnc6AY
 Lv0GucNPT/9+vwD86uoC5OmaczUyRX1u4OR+uJ9+I2WPplzF7wNm5Mr54W+2lWQIdeJj
 ebMLyK2pY2OL2IuEUR/PQe3kNUbdVucIfzHgp71rsZcDxew7KdwXXbINoaNDxFJWmVI6
 V/ARBQmZdP+ieQiqZnGlQYgnXhKNR13OBwcRL4EyeZQQx7nQWAWqdE3AAQq3cT1VMiGQ
 RzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9uPb1LglrnQf0TOx6C6j+FpM79Brg7e9GdL7QKGrvQM=;
 b=HfxNXQ6XxNk8IcXVjLhGBZVF6jQUllWzF7GqGBNumUL9zpFXGhs0Mmrhag1FNOO5pp
 t0BRCNfCQjTA0hxMp5y1PRseNOdFrbuHyjJp3N3ULyBbvu5v5UK9Z0c8I8zi2LD8WK9Y
 RzZvuebfywPar2z9VAg3jXYnMsdf/dIh/BYNROEM2sD1ItQeN6sNQFrOagBdH3Onmpsl
 ld5trEW1sUXKJ0ugBZG6Gcehe3OwmWYcyTRRrwMoICTSzWvmCGulFYipstPqJ/zhN5K7
 eubXTt59SFGZbXC9FnXqbo5wmXA8LQ4Mu5yBiuFfj9odTdu7iSbEnM9HN1LQZDbaTEB7
 XhUA==
X-Gm-Message-State: AOAM532Enm0Hf/cv39ybsq5StT+S7ApEkXjXvyqjmZyUyxO3BZReMdFE
 UySRtOlotKCoNfa/qXvdFThIULE/pzcND+zJLs01J9W7dAI=
X-Google-Smtp-Source: ABdhPJzZfPVSoZ565+JcbHvVNWwwXvqx6w5a2e6WQg/yav3oNuzhBKZ39B9anqeHwpF2gMWkuKc/WWjpam5hkQ0gcrI=
X-Received: by 2002:a2e:898d:: with SMTP id c13mr6948914lji.236.1596860911227; 
 Fri, 07 Aug 2020 21:28:31 -0700 (PDT)
MIME-Version: 1.0
From: vivek pandya <vivekvpandya@gmail.com>
Date: Sat, 8 Aug 2020 09:58:19 +0530
Message-ID: <CAHYgpoJFTLCuK97F92cH6YyHmPWSOgz8yYHgLr-npO+QaJg+9Q@mail.gmail.com>
Subject: Questions related to NIR, LLVMPipe
To: dri-devel@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
X-Mailman-Approved-At: Mon, 10 Aug 2020 07:35:59 +0000
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
Content-Type: multipart/mixed; boundary="===============0192969137=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0192969137==
Content-Type: multipart/alternative; boundary="0000000000005e972805ac562734"

--0000000000005e972805ac562734
Content-Type: text/plain; charset="UTF-8"

Hello,

According to https://en.wikipedia.org/wiki/Mesa_(computer_graphics)
LLVMPipe driver is supposed to use NIR instead of TGSI.  Is there any
status update page?

Is there any code for NIR parser/reader which can read text of NIR?

Sincerely,
Vivek

--0000000000005e972805ac562734
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>According to <a href=
=3D"https://en.wikipedia.org/wiki/Mesa_(computer_graphics)">https://en.wiki=
pedia.org/wiki/Mesa_(computer_graphics)</a></div><div>LLVMPipe driver is su=
pposed to use NIR instead of TGSI.=C2=A0 Is there any status update page?</=
div><div><br></div><div>Is there any code for NIR parser/reader which can r=
ead text of NIR?</div><div><br></div><div>Sincerely,</div><div>Vivek<br></d=
iv><div><br></div></div>

--0000000000005e972805ac562734--

--===============0192969137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0192969137==--
