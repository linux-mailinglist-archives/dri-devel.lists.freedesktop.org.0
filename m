Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5AE3486FB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 03:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFFE6EB22;
	Thu, 25 Mar 2021 02:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356B36EB94
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 02:37:29 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so593225otn.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 19:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:date:message-id:in-reply-to:references:user-agent
 :subject:mime-version;
 bh=QSn/zkJepdPwUHelbiyZocPST5IqzKdMW6YgKaOz6+s=;
 b=GOp+xZ4DjOl3+AHobiHkXxb1mG39iPHnm3ffIVjYPzOHxoe3fbdR1rytavywxyvCSP
 dLX9JxuXCTAr1xq9nc5sUP8kzHqIIZOQ9FPTyVTxDo9tWV7OmNHO7BZWoRg1JJMee62/
 vvGFLH0nuuTttLK0RKk0BzmVNbbVajXJDiB3Y3vtqnWPWdTINAs66AMmrNnqYO2iAp+v
 nO5bx25VucqRSrR6n7dtUzi3yyFEpEXzwADQM5+PJLT7LPVFsCQGsOcwozkHL0KL50B+
 06VTsR4ZDAnSxWKMUR+P6Wy8T5XavJGQYrlDub/q6GY7xWPo0YYxAX2/o8tLPZRCmfBC
 Y4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:subject:mime-version;
 bh=QSn/zkJepdPwUHelbiyZocPST5IqzKdMW6YgKaOz6+s=;
 b=CC0tp3rT+0/DWC/DT/HLgMNmEsvvmmT9yks+HodThLhwyc265g1+q+cr98Js/zBvIm
 weOukF23dUZSdjGdaEh06Av5sxOc5yi+zDdnzznt1Iio5qx1gxJVslu7lQns8gW2hReV
 QYzGqmDJjHjBXRpeVdgN05XHkIafsK5ususWoBJ3/dtVItn3AHZTEvO3Hi1tAaKodvPE
 L9/JB+lvOFmwu4rsmMs6y/CorpO9AgeR0fw90tzvbQHwxniuvv84rGrlPheBaNPYL69c
 5hWdpe+X+IQyOWjdG6BHQ2ELJt058oVEZnqrf/k6JHMy9cPbK30Q10msCU0dYSNBXn6v
 7etg==
X-Gm-Message-State: AOAM531+eOyN67H1l7mKFBvHSF0AiSIi8THR1iPTfnqBWJXrhR9FtP14
 9I2uhaB1s7G9cRenMKpoPnJ/2w==
X-Google-Smtp-Source: ABdhPJz21B5p4n/e7JOO+A+PkZjqf5oTGe+Hoc6yJ9w8/tbux2GqJjj3RCp6HBj9rA1f07C2DNIzrw==
X-Received: by 2002:a9d:470b:: with SMTP id a11mr5395886otf.254.1616639848301; 
 Wed, 24 Mar 2021 19:37:28 -0700 (PDT)
Received: from [100.64.64.27] ([209.107.186.2])
 by smtp.gmail.com with ESMTPSA id l71sm834665oib.30.2021.03.24.19.37.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Mar 2021 19:37:27 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Date: Wed, 24 Mar 2021 21:37:25 -0500
Message-ID: <178673e5ea0.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
In-Reply-To: <20210324211041.1354941-2-daniel.vetter@ffwll.ch>
References: <20210324211041.1354941-1-daniel.vetter@ffwll.ch>
 <20210324211041.1354941-2-daniel.vetter@ffwll.ch>
User-Agent: AquaMail/1.28.1-1760 (build: 102800003)
Subject: Re: [PATCH 2/2] drm/doc: Add RFC section
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>
Content-Type: multipart/mixed; boundary="===============2121073890=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============2121073890==
Content-Type: multipart/alternative; boundary="----------178673e628c2c3a281724f19f4"

This is a multi-part message in MIME format.
------------178673e628c2c3a281724f19f4
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

Acked-by: Jason Ekstrand <jason@jlekstrand.net>

On March 24, 2021 16:10:48 Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> Motivated by the pre-review process for i915 gem/gt features, but
> probably useful in general for complex stuff.
>
> v2: Add reminder to not forget userspace projects in the discussion
> (Simon, Jason)
>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Dave Airlie <airlied@redhat.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Acked-by: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
> Documentation/gpu/index.rst |  1 +
> Documentation/gpu/rfc.rst   | 17 +++++++++++++++++
> 2 files changed, 18 insertions(+)
> create mode 100644 Documentation/gpu/rfc.rst
>
> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
> index c9a51e3bfb5a..df58cb826d68 100644
> --- a/Documentation/gpu/index.rst
> +++ b/Documentation/gpu/index.rst
> @@ -16,6 +16,7 @@ Linux GPU Driver Developer's Guide
>    vga-switcheroo
>    vgaarbiter
>    todo
> +   rfc
>
> .. only::  subproject and html
>
> diff --git a/Documentation/gpu/rfc.rst b/Documentation/gpu/rfc.rst
> new file mode 100644
> index 000000000000..a8621f7dab8b
> --- /dev/null
> +++ b/Documentation/gpu/rfc.rst
> @@ -0,0 +1,17 @@
> +===============
> +GPU RFC Section
> +===============
> +
> +For complex work, especially new uapi, it is often good to nail the high level
> +design issues before getting lost in the code details. This section is 
> meant to
> +host such documentation:
> +
> +* Each RFC should be a section in this file, explaining the goal and main 
> design
> +  considerations. Especially for uapi make sure you Cc: all relevant project
> +  mailing lists and involved people outside of dri-devel.
> +
> +* For uapi structures add a file to this directory with and then pull the
> +  kerneldoc in like with real uapi headers.
> +
> +* Once the code has landed move all the documentation to the right places in
> +  the main core, helper or driver sections.
> --
> 2.31.0


------------178673e628c2c3a281724f19f4
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto">Acked-by: Jason Ekstrand &lt;jason@jlekstrand.net&gt;</di=
v><div dir=3D'auto'><br></div>
<div id=3D"aqm-original" style=3D"color: black;">
<div dir=3D"auto">On March 24, 2021 16:10:48 Daniel Vetter &lt;daniel.vette=
r@ffwll.ch&gt; wrote:</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">Motivated by the pre-review process for i915 gem/gt featu=
res, but</div>
<div dir=3D"auto">probably useful in general for complex stuff.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">v2: Add reminder to not forget userspace projects in the =
discussion</div>
<div dir=3D"auto">(Simon, Jason)</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Cc: Simon Ser &lt;contact@emersion.fr&gt;</div>
<div dir=3D"auto">Cc: Jani Nikula &lt;jani.nikula@linux.intel.com&gt;</div>
<div dir=3D"auto">Cc: Joonas Lahtinen &lt;joonas.lahtinen@linux.intel.com&g=
t;</div>
<div dir=3D"auto">Cc: Rodrigo Vivi &lt;rodrigo.vivi@intel.com&gt;</div>
<div dir=3D"auto">Cc: Jason Ekstrand &lt;jason@jlekstrand.net&gt;</div>
<div dir=3D"auto">Cc: Dave Airlie &lt;airlied@redhat.com&gt;</div>
<div dir=3D"auto">Acked-by: Rodrigo Vivi &lt;rodrigo.vivi@intel.com&gt;</di=
v>
<div dir=3D"auto">Acked-by: Dave Airlie &lt;airlied@redhat.com&gt;</div>
<div dir=3D"auto">Signed-off-by: Daniel Vetter &lt;daniel.vetter@intel.com&=
gt;</div>
<div dir=3D"auto">---</div>
<div dir=3D"auto">&nbsp;Documentation/gpu/index.rst | &nbsp;1 +</div>
<div dir=3D"auto">&nbsp;Documentation/gpu/rfc.rst &nbsp; | 17 +++++++++++++=
++++</div>
<div dir=3D"auto">&nbsp;2 files changed, 18 insertions(+)</div>
<div dir=3D"auto">&nbsp;create mode 100644 Documentation/gpu/rfc.rst</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">diff --git a/Documentation/gpu/index.rst b/Documentation/=
gpu/index.rst</div>
<div dir=3D"auto">index c9a51e3bfb5a..df58cb826d68 100644</div>
<div dir=3D"auto">--- a/Documentation/gpu/index.rst</div>
<div dir=3D"auto">+++ b/Documentation/gpu/index.rst</div>
<div dir=3D"auto">@@ -16,6 +16,7 @@ Linux GPU Driver Developer's Guide</div=
>
<div dir=3D"auto">&nbsp; &nbsp; vga-switcheroo</div>
<div dir=3D"auto">&nbsp; &nbsp; vgaarbiter</div>
<div dir=3D"auto">&nbsp; &nbsp; todo</div>
<div dir=3D"auto">+ &nbsp; rfc</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">&nbsp;.. only:: &nbsp;subproject and html</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">diff --git a/Documentation/gpu/rfc.rst b/Documentation/gp=
u/rfc.rst</div>
<div dir=3D"auto">new file mode 100644</div>
<div dir=3D"auto">index 000000000000..a8621f7dab8b</div>
<div dir=3D"auto">--- /dev/null</div>
<div dir=3D"auto">+++ b/Documentation/gpu/rfc.rst</div>
<div dir=3D"auto">@@ -0,0 +1,17 @@</div>
<div dir=3D"auto">+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div dir=3D"auto">+GPU RFC Section</div>
<div dir=3D"auto">+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+For complex work, especially new uapi, it is often good =
to nail the high level</div>
<div dir=3D"auto">+design issues before getting lost in the code details. T=
his section is meant to</div>
<div dir=3D"auto">+host such documentation:</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+* Each RFC should be a section in this file, explaining =
the goal and main design</div>
<div dir=3D"auto">+ &nbsp;considerations. Especially for uapi make sure you=
 Cc: all relevant project</div>
<div dir=3D"auto">+ &nbsp;mailing lists and involved people outside of dri-=
devel.</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+* For uapi structures add a file to this directory with =
and then pull the</div>
<div dir=3D"auto">+ &nbsp;kerneldoc in like with real uapi headers.</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+* Once the code has landed move all the documentation to=
 the right places in</div>
<div dir=3D"auto">+ &nbsp;the main core, helper or driver sections.</div>
<div dir=3D"auto">--&nbsp;</div>
<div dir=3D"auto">2.31.0</div>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

------------178673e628c2c3a281724f19f4--


--===============2121073890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2121073890==--

