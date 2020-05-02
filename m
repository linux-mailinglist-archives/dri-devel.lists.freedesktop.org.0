Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389261C2C88
	for <lists+dri-devel@lfdr.de>; Sun,  3 May 2020 14:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADAAF6E176;
	Sun,  3 May 2020 12:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3A08933D
 for <dri-devel@lists.freedesktop.org>; Sat,  2 May 2020 10:14:48 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id d16so9215768edv.8
 for <dri-devel@lists.freedesktop.org>; Sat, 02 May 2020 03:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iiguvZ9CmiPXzf+RDN+fnUF3bvehS4R+9XRTB3iuwCE=;
 b=rRD+cGeL1zps3PTaN+yoVGTTVLgUKMrMgbnKzTikRFmpEoOLGA2197pwK3OkLUwOIV
 EGqkbb0pAqStr6Tq8yS9thjKOlKORmASTsl/kyxVUjHcXINKVWRak9HdQIrsvctppyTq
 3fhg1/vExzHby6miRAxoNvSa6A2+yZQseyYgF7mN6zJImbqu4/ZVu65E3O25LK/BOjW8
 m1qZSCYTcAN0OVaBc58x7ULMg0VDISa2XCQAdWV4tid73kCWzWCJYinJYDDb99ApoIIM
 F2drkNKVefeoYiP1819inmymPs163ZuGxrekfG+YcBxT03SmtvsERBdALLcTUxPTaKW0
 MS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iiguvZ9CmiPXzf+RDN+fnUF3bvehS4R+9XRTB3iuwCE=;
 b=nzxFy35QFug5jVxoZldnusz9UbZ0VoQHUGMLYph6KdHu/ooqmEbP1vJX10vOLYhJvy
 YXWC7aQx7XVhLxQcuJEDe6RoZHElFJvdXWM0g/IZuDUGWr5+nVLQIVHlUxJI5RgFVb82
 zOj74MGTlz8uACBPKgEzbrtsZGXBLwEgUB8ETS7NCjU27dn4+Qctk6LE6R7s02fBMK8S
 y7Qbs5dETyEOAbNKLBEbVNeAYV/ZgOD9yiI2lrfm1w/s/KZHRU/6XANtkR76HjN6kPSx
 y/cu/2m66H9HnLmzh9a7r81+D8XYn/7ebDsj5Vx1xjDdBLnoQwMQe8O/qjyHvbgGFL53
 3b1Q==
X-Gm-Message-State: AGi0PuZU3tZDNFd7x47Jg6IEltjhgz4W44yJTZl7t5o/JUcxZOBW7wu7
 308JstEcGdVmyfN6UTS9IW4/eGqzSYBwENgr/w8=
X-Google-Smtp-Source: APiQypLbWbawGO0ZSvEvHmRtWYvbkoqt7OletAZUF05iYCMnpKdXAZc3DrJLLjyHMi0rL8gEs2GZwjLvpvAAidhNKHM=
X-Received: by 2002:aa7:db0b:: with SMTP id t11mr6500380eds.304.1588414487052; 
 Sat, 02 May 2020 03:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200501204825.146424-1-konradybcio@gmail.com>
 <20200501204825.146424-2-konradybcio@gmail.com>
 <20200502070531.GA11754@ravnborg.org>
In-Reply-To: <20200502070531.GA11754@ravnborg.org>
From: Konrad Dybcio <konradybcio@gmail.com>
Date: Sat, 2 May 2020 12:14:34 +0200
Message-ID: <CAMS8qEW9sHPNbPdKGJS5DVNFi5D1Wm2PBxVvvO7q8ypOAPga9A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drivers: drm: panel: Add TM5P5 NT35596 panel driver
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Sun, 03 May 2020 12:54:36 +0000
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
Cc: devicetree@vger.kernel.org, skrzynka@konradybcio.pl,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: multipart/mixed; boundary="===============1092205500=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1092205500==
Content-Type: multipart/alternative; boundary="00000000000041c6da05a4a791e6"

--00000000000041c6da05a4a791e6
Content-Type: text/plain; charset="UTF-8"

Disclaimer: sorry if you see it twice, I got a response saying something
was wrong when I first tried to send this.

Hi,

Thanks for your review. I'll send a v2 soon, however we need to solve the
compat string issue first.

How should I document tm5p5? I think it's rather some kind of a model no.
along with the nt35596 IC than a vendor name.. Or should we call it
something like "unknown,tm5p5-nt35596", perhaps "asus,z00t-tm5p5-n35596"
[1]?

[1] Z00T is the model number of the smartphone that uses this panel

Konrad

--00000000000041c6da05a4a791e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Disclaimer: sorry if you see it twice, =
I got a response saying something was wrong when I first tried to send this=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Hi,</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Thanks for your review. I&#39;ll send a v2=
 soon, however we need to solve the compat string issue first.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">How should I document tm5p5? I think=
 it&#39;s rather some kind of a model no. along with the nt35596 IC than a =
vendor name.. Or should we call it something like &quot;unknown,tm5p5-nt355=
96&quot;, perhaps &quot;asus,z00t-tm5p5-n35596&quot; [1]?</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">[1] Z00T is the model number of the smart=
phone that uses this panel</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Konrad</div></div>

--00000000000041c6da05a4a791e6--

--===============1092205500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1092205500==--
