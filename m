Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FD45B3DD5
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 19:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1711B10ED03;
	Fri,  9 Sep 2022 17:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813C710ECF6
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 17:18:29 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id c9so3651596ybf.5
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Sep 2022 10:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=3CtywG9Y+bCDYTofbwbFJM4oQeqDfxEsccBbHYdtLVI=;
 b=5jyYpR2nQZ3UQeBi0bdqOwRSTjIbj5AN8sYWv4t3ttvfK3FeQ5Cx2Ctznd+cNdAbEv
 80yK64KC/HrIhjwIlDNfoa7kjAjelIrjluQdKRMq69hG+Lepx0zZpJBnQ1cP4ZJ2bWPn
 XP47hiPVAQO1jFqZXUmDd5A7VmJfsZrhXkk5bMTMt9fQloxG47aVW8UfNSaj//r1tX1v
 7jDaIh/gdXiq/m32ULEqw0N16IVgnPweNoxBKlXbeK8TrsBJtTrfS6qfYhCIbrVd4Vl0
 i6cRSU+/PBRTtAU3ixrJJ4Dz0Dpd82JqCgyo+Sl5b5FUJpWR8nvD5P4svHXNqwjBzHUS
 BQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=3CtywG9Y+bCDYTofbwbFJM4oQeqDfxEsccBbHYdtLVI=;
 b=SHtaQ+4rJuhXTBtbXJHiCb7SWBuPRHqgIUDDR5+14uWfCsX+zFC2HXBcGsDOond84r
 8NIaT0xwixI8ICNJ1M57kzAAzXDrVVoDsaXelsW1117xzpXeNqPi2w7BDaceWsvZBEG4
 tiUT0Dfcr+VGrd2ghdbLhU8uDpxKL+LD8U81Q0fY33FzUlTdIOuLafw71ZTVhwCvuKYI
 dh7zbVwQx1/KH9Th0oA7dx2EBGAnHpjFtnQk/coJCyULW/dAgObRPJSgbK35f/E8d+b6
 3irpV0Snr5owEKxvS/pEu0SoRJBPnO4vjhLgP4nAgL7jbJPPfe3cbuI60M7EPcl9CgUj
 Atkw==
X-Gm-Message-State: ACgBeo0Fd+mqldgsfrDA9f9OFRPfUbRjGv5ZMrFKZKCFec/+i0YG3If9
 9FYUoSSl5hPOfUhsniGNuTMSn4yYRZDQ5MwOfwHL4g==
X-Google-Smtp-Source: AA6agR7eOZDJ3yN1nR945UF9xKQN4xYbqcLQ6Bp+KIA6ylRqmYIZgSQ9Zt8nt3KCa046A6eAzpmzoN8hqKQBwMljfLo=
X-Received: by 2002:a25:cbc3:0:b0:6a8:e7a1:6941 with SMTP id
 b186-20020a25cbc3000000b006a8e7a16941mr12407567ybg.466.1662743908460; Fri, 09
 Sep 2022 10:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220829093141.45583-1-tomeu.vizoso@collabora.com>
 <20220909141528.5090-1-tomeu.vizoso@collabora.com>
In-Reply-To: <20220909141528.5090-1-tomeu.vizoso@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 9 Sep 2022 18:16:44 +0100
Message-ID: <CAPj87rMYW1xZdacZ1Y0qk+D9xpqsqE+cwbQ1j1nZ7S+RKpzOoQ@mail.gmail.com>
Subject: Re: [PATCH v8] drm: Add initial ci/ subdirectory
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: multipart/alternative; boundary="000000000000044e1505e841bcc4"
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000044e1505e841bcc4
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, 9 Sept 2022 at 15:15, Tomeu Vizoso <tomeu.vizoso@collabora.com>
wrote:

> Also include a configuration file that points to the out-of-tree CI
> scripts.
>

 I think this para is outdated given ...

v8:
>   - Move all files specific to testing the kernel into the kernel tree
>     (thus I have dropped the r-bs I had collected so far)
>   - Uprev Gitlab CI infrastructure scripts to the latest from Mesa


But equally - and sorry for not jumping on the IRC (?) discussion as I was
in the middle of other stuff when it came up - I'm don't think this is the
right plan.

Mesa having all its CI in-tree makes sense, because merges happen rapidly
to a single canonical tree. If the scripts need to be changed for whatever
reason, we can merge something in under an hour and everyone immediately
gets it. DRM is quite different though, given the forest of trees we have
and the long merge paths between them. I worry that merging the CI scripts
in-tree - especially for our initial attempt at it, when we're likely to
need to make quite a lot of changes before it settles down to become a
stable system that works for everyone - is shooting ourselves in the foot
by limiting our flexibility.

Given that it's currently very dependent on fd.o infrastructure (published
ci-templates, the registry, the specific-tag runners for Collabora/CrOS
DUTs, etc), there isn't much of a portability gain in bringing the scripts
into the tree either. It's a good goal, but not where we are today.

Cheers,
Daniel

--000000000000044e1505e841bcc4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Fri, 9 Sept 2022 at 15:15, Tomeu Vi=
zoso &lt;<a href=3D"mailto:tomeu.vizoso@collabora.com" target=3D"_blank">to=
meu.vizoso@collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Also include a configuration file that points to th=
e out-of-tree CI<br>
scripts.<br></blockquote><div><br></div><div>=C2=A0I think this para is out=
dated given ...</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
v8:<br>
=C2=A0 - Move all files specific to testing the kernel into the kernel tree=
<br>
=C2=A0 =C2=A0 (thus I have dropped the r-bs I had collected so far)<br>
=C2=A0 - Uprev Gitlab CI infrastructure scripts to the latest from Mesa</bl=
ockquote><div><br></div><div>But equally - and sorry for not jumping on the=
 IRC (?) discussion as I was in the middle of other stuff when it came up -=
 I&#39;m don&#39;t think this is the right plan.</div><div><br></div><div>M=
esa having all its CI in-tree makes sense, because merges happen rapidly to=
 a single canonical tree. If the scripts need to be changed for whatever re=
ason, we can merge something in under an hour and everyone immediately gets=
 it. DRM is quite different though, given the forest of trees we have and t=
he long merge paths between them. I worry that merging the CI scripts in-tr=
ee - especially for our initial attempt at it, when we&#39;re likely to nee=
d to make quite a lot of changes before it settles down to become a stable =
system that works for everyone - is shooting ourselves in the foot by limit=
ing our flexibility.</div><div><br></div><div>Given that it&#39;s currently=
 very dependent on fd.o infrastructure (published ci-templates, the registr=
y, the specific-tag runners for Collabora/CrOS DUTs, etc), there isn&#39;t =
much of a portability gain in bringing the scripts into the tree either. It=
&#39;s a good goal, but not where we are today.</div><div><br></div><div>Ch=
eers,</div><div>Daniel</div></div></div>

--000000000000044e1505e841bcc4--
