Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A1585F2A0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 09:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CF610E8AC;
	Thu, 22 Feb 2024 08:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OBomsFKV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D91E10E41E;
 Wed, 21 Feb 2024 20:54:46 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dc6d8bd612dso1217522276.1; 
 Wed, 21 Feb 2024 12:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708548885; x=1709153685; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zG/hGKUBFHTrQpCIkO4Jfe/fvPU9NU7JPEBYcirwrEY=;
 b=OBomsFKV469TI6hUf25smJHVfQG4umPEuzNPu9rSSzvLBXOszmfuiU7ptVc1hh+nv+
 tfCnrtKiwis84yzeG+EQl48RjrfpspsN7XVkzhHDz0hXKweUqvRss+XjvngD/w4Hwfc6
 CsDUx2BnEtCPspWQm03/GrQU8/9+iKHc4NOJa8AicG8640Y5A1pembTbsqfSxv7a1mVC
 YD/EsVWavT9LskwKhCPa66Q+VGxWYZtI6aIAiteir0COdIbh1K8Z7Xvrgoyq3rtxGM1+
 C7K/iZV6tnAarx5VwGAaaTuXUfp0egOhx1CkDq6LZEAhZsjbVRi/YQoLQ3OglZEah9ir
 xzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708548885; x=1709153685;
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zG/hGKUBFHTrQpCIkO4Jfe/fvPU9NU7JPEBYcirwrEY=;
 b=cfPyD7vuxPMHNZEymmbkVSBtjohmOfYEA6x4VCFXClVM5dnFzTZraiXzOj40MzLYFz
 u066e4HHfNC7l8pzvc9C3gvJrRptXz1Ga2txRxTEvhQ+ec0fRWRkztIaXiTYI+wVbXNM
 ksiyYj4yruWMf05O6NMrbYt9RsWnz/4foLpo+wZdPG51iErGM+yx4DjsizTHkp7OfV7J
 MpBe9ZS7HwoeINUNIJkqGY9NUdbOWACTiTHTN/sdpdCAXiuyqgSeSScbBH1eA3qstKko
 z6YqTdP0qoVw1vd9uy/WT6cNFPc1eANrF+b8qpY4/k8WqiyIv1d1AZVVQX/cz55ye4Zc
 4ycg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMJcIvjeXZB8kMj0n75d8ujfYuNiZibv92swqzvOqmQTabmMoBboWZ5kU32k2SV47EVnPVMg6cuwlCz2wCvlPqsCODBz5lMxv14wj/TL3oWaBwh4zArKO9uZqPIpQ1Up5rSrrURWuDnKUwzwIP7FM=
X-Gm-Message-State: AOJu0YzjpKA+nlrjIVv+L4Hlb4A0EmE2M+wb6sP+W+iusHqXrtBXxUYJ
 GOm/gpbLSbdQZ1Aj+c/Sc2x0jPDL4U+dzVLlQVj3lvHtbb4Xi+qepBWNibzrqKQrVkfQFOLk+dP
 bGjKNhc5rntZSdZSjMXhQ01dyVWM=
X-Google-Smtp-Source: AGHT+IEvLLsgVEwId+fWOD8nT0pOqOHtElda+ZjmIi5BQfmKg7nZ8CxGJCja1jw4MNJ6CdakfvPdbuuTMewiFOTry3E=
X-Received: by 2002:a25:148b:0:b0:dcb:d653:8ad9 with SMTP id
 133-20020a25148b000000b00dcbd6538ad9mr481476ybu.12.1708548885189; Wed, 21 Feb
 2024 12:54:45 -0800 (PST)
MIME-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-6-davidgow@google.com>
In-Reply-To: <20240221092728.1281499-6-davidgow@google.com>
From: Cassio Neri <cassio.neri@gmail.com>
Date: Wed, 21 Feb 2024 20:54:34 +0000
Message-ID: <CAOfgUPiOd36kZ87r2TpwhansYgYCRCgDy5yFLXzV6OPWgdo55w@mail.gmail.com>
Subject: Re: [PATCH 5/9] rtc: test: Fix invalid format specifier.
To: David Gow <davidgow@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>, 
 Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Latypov <dlatypov@google.com>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, 
 "David S . Miller" <davem@davemloft.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 netdev@vger.kernel.org
Content-Type: multipart/alternative; boundary="0000000000006219860611ea8981"
X-Mailman-Approved-At: Thu, 22 Feb 2024 08:14:51 +0000
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
Reply-To: cassio.neri@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000006219860611ea8981
Content-Type: text/plain; charset="UTF-8"

Hi David,

Thanks for fixing drivers/rtc/lib_test.c

Best wishes,
Cassio.

On Wed, 21 Feb 2024 at 09:28, David Gow <davidgow@google.com> wrote:

> 'days' is a s64 (from div_s64), and so should use a %lld specifier.
>
> This was found by extending KUnit's assertion macros to use gcc's
> __printf attribute.
>
> Fixes: 1d1bb12a8b18 ("rtc: Improve performance of rtc_time64_to_tm(). Add
> tests.")
> Signed-off-by: David Gow <davidgow@google.com>
> ---
>  drivers/rtc/lib_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/rtc/lib_test.c b/drivers/rtc/lib_test.c
> index d5caf36c56cd..225c859d6da5 100644
> --- a/drivers/rtc/lib_test.c
> +++ b/drivers/rtc/lib_test.c
> @@ -54,7 +54,7 @@ static void rtc_time64_to_tm_test_date_range(struct
> kunit *test)
>
>                 days = div_s64(secs, 86400);
>
> -               #define FAIL_MSG "%d/%02d/%02d (%2d) : %ld", \
> +               #define FAIL_MSG "%d/%02d/%02d (%2d) : %lld", \
>                         year, month, mday, yday, days
>
>                 KUNIT_ASSERT_EQ_MSG(test, year - 1900, result.tm_year,
> FAIL_MSG);
> --
> 2.44.0.rc0.258.g7320e95886-goog
>
>

--0000000000006219860611ea8981
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,helvetica,sans-serif"><div class=3D"gmail_default" style=3D"=
font-family:arial,helvetica,sans-serif">Hi David,</div><div class=3D"gmail_=
default" style=3D"font-family:arial,helvetica,sans-serif"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">Than=
ks for fixing <span class=3D"gmail_default" style=3D"font-family:arial,helv=
etica,sans-serif"></span>drivers/rtc/lib_test.c</div><div class=3D"gmail_de=
fault" style=3D"font-family:arial,helvetica,sans-serif"><br></div><div clas=
s=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">Best w=
ishes,</div><div class=3D"gmail_default" style=3D"font-family:arial,helveti=
ca,sans-serif">Cassio.</div></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, 21 Feb 2024 at 09:28, David Gow &=
lt;<a href=3D"mailto:davidgow@google.com">davidgow@google.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&#39;days&#39;=
 is a s64 (from div_s64), and so should use a %lld specifier.<br>
<br>
This was found by extending KUnit&#39;s assertion macros to use gcc&#39;s<b=
r>
__printf attribute.<br>
<br>
Fixes: 1d1bb12a8b18 (&quot;rtc: Improve performance of rtc_time64_to_tm(). =
Add tests.&quot;)<br>
Signed-off-by: David Gow &lt;<a href=3D"mailto:davidgow@google.com" target=
=3D"_blank">davidgow@google.com</a>&gt;<br>
---<br>
=C2=A0drivers/rtc/lib_test.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/rtc/lib_test.c b/drivers/rtc/lib_test.c<br>
index d5caf36c56cd..225c859d6da5 100644<br>
--- a/<span class=3D"gmail_default" style=3D"font-family:arial,helvetica,sa=
ns-serif"></span>drivers/rtc/lib_test.c<br>
+++ b/drivers/rtc/lib_test.c<br>
@@ -54,7 +54,7 @@ static void rtc_time64_to_tm_test_date_range(struct kunit=
 *test)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 days =3D div_s64(se=
cs, 86400);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#define FAIL_MSG &q=
uot;%d/%02d/%02d (%2d) : %ld&quot;, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#define FAIL_MSG &q=
uot;%d/%02d/%02d (%2d) : %lld&quot;, \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 year, month, mday, yday, days<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 KUNIT_ASSERT_EQ_MSG=
(test, year - 1900, result.tm_year, FAIL_MSG);<br>
-- <br>
2.44.0.rc0.258.g7320e95886-goog<br>
<br>
</blockquote></div></div>

--0000000000006219860611ea8981--
