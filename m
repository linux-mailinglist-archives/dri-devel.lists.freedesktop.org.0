Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A809A85F2A1
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 09:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A8C10E8AE;
	Thu, 22 Feb 2024 08:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NgypQ9SH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E6B10E41E;
 Wed, 21 Feb 2024 20:53:59 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dcbf82cdf05so1225578276.2; 
 Wed, 21 Feb 2024 12:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708548838; x=1709153638; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ct++0yN+MBLZmJclodwnynVem53aQYY+rvEr+HP6S7g=;
 b=NgypQ9SHjOQidVaMtMVIq8uySNHE+GKFbLxkP0OmjZWw8gm2HcaKyLtu7ZuK9rmA70
 ignjWQgya520PoBp9EsrN/NMQT1xaFgkBiMkxrZO0yeiJJ6wudU97/sQP7S0mi2AIH15
 18LAoTjED8yGYagFm6XU2t3lEJL4nCF/K1+CsBgCbE5JUzXr9r23KRVEI4D6G6ojPKZI
 vH8dTYjhUsOs1YyedpMkmf9hXLKo996yRST7mb29bXwgaLS3EhB+eHcAx1Tc3uMzOl1k
 7WaaU2rW/BryS4Yyfwd01umIe+bdTohY37mAE6rgqkoson9eBMh/CrJM7e1zOH91SnrQ
 99/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708548838; x=1709153638;
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ct++0yN+MBLZmJclodwnynVem53aQYY+rvEr+HP6S7g=;
 b=PWToRiF/yIVN8WLeInq+pn3pJql83mctIXuuRiHeT2XXkxVdWEiOm0GOJBlglEiJsq
 as5BohM6rU/gXftQWL3zlQMnCSPK+vHUOX8+C93dzOyS1Ktx7QnYTu2au6nOQbkHAvsA
 aHa9zbBFFA3ItwqVxhMFG80Wi640wrSNXUSzXoKyFNv7O1A/mcBmsbzbHn0OpFQTJkLO
 eoBWk5Los/g857Qu2iO6Xo9nEnY1biT4yICuSifc+mYvM1p3FgailSH6s8fbvPDP5Kos
 KyeRez8tXaWS3gwSi6+iwZ2YdtjudUZ2tPEbg07Is78/bReFlsFdqjXeapvYmeSE1dJB
 8rxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSggA/RXW639DO7FZcr4mKeK+O8ovZENDfbLbcU4JrcKTbnUMdTRlqtk66dWUhCWo6+FNnHiVIodj4fTBywqkR/OfY83YvG6glnGt2cvBuAyglRJBpOc1eEogeL4/XkmdBg+Oe7KA96VnX+1dwa74=
X-Gm-Message-State: AOJu0YwqAgwMvIb0dms6npgpk4jOcb6zagqEovT1TcMlDWLN5u3Whql6
 wUEL6sfWmhi+m0YRKRLAYLdhYRPl8NeAZiuP/blEoPe976ndf2LTdzIf8Xp9sgMd30VnvxQdnN1
 sHbAXUvhS5LZPwAFHCr1ZuqCBMKM=
X-Google-Smtp-Source: AGHT+IG+zxXFQ+FAwDQOZy6BmzriG8L5pPHV0rsIP7doqMfKVxg0SN6Z8yFRoARLfAqbnDwgrr/iGejrTFaz5RkT6KM=
X-Received: by 2002:a25:874f:0:b0:dc2:470b:887e with SMTP id
 e15-20020a25874f000000b00dc2470b887emr477404ybn.21.1708548838354; Wed, 21 Feb
 2024 12:53:58 -0800 (PST)
MIME-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-5-davidgow@google.com>
In-Reply-To: <20240221092728.1281499-5-davidgow@google.com>
From: Cassio Neri <cassio.neri@gmail.com>
Date: Wed, 21 Feb 2024 20:53:47 +0000
Message-ID: <CAOfgUPggNqa9XCqGuzmEUBaZ=otPfKN6Tdx0JzpZT-Uq90AH7g@mail.gmail.com>
Subject: Re: [PATCH 4/9] time: test: Fix incorrect format specifier
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
Content-Type: multipart/alternative; boundary="0000000000009775130611ea86ea"
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

--0000000000009775130611ea86ea
Content-Type: text/plain; charset="UTF-8"

Hi David,

Thanks for fixing kernel/time/time_test.c

Best wishes,
Cassio.

On Wed, 21 Feb 2024 at 09:28, David Gow <davidgow@google.com> wrote:

> 'days' is a s64 (from div_s64), and so should use a %lld specifier.
>
> This was found by extending KUnit's assertion macros to use gcc's
> __printf attribute.
>
> Fixes: 276010551664 ("time: Improve performance of time64_to_tm()")
> Signed-off-by: David Gow <davidgow@google.com>
> ---
>  kernel/time/time_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/time/time_test.c b/kernel/time/time_test.c
> index ca058c8af6ba..3e5d422dd15c 100644
> --- a/kernel/time/time_test.c
> +++ b/kernel/time/time_test.c
> @@ -73,7 +73,7 @@ static void time64_to_tm_test_date_range(struct kunit
> *test)
>
>                 days = div_s64(secs, 86400);
>
> -               #define FAIL_MSG "%05ld/%02d/%02d (%2d) : %ld", \
> +               #define FAIL_MSG "%05ld/%02d/%02d (%2d) : %lld", \
>                         year, month, mdday, yday, days
>
>                 KUNIT_ASSERT_EQ_MSG(test, year - 1900, result.tm_year,
> FAIL_MSG);
> --
> 2.44.0.rc0.258.g7320e95886-goog
>
>

--0000000000009775130611ea86ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,helvetica,sans-serif">Hi David,</div><div class=3D"gmail_def=
ault" style=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=
=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">Thanks =
for fixing <span class=3D"gmail_default" style=3D"font-family:arial,helveti=
ca,sans-serif"></span>kernel/time/time_test.c</div><div class=3D"gmail_defa=
ult" style=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=
=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">Best wi=
shes,</div><div class=3D"gmail_default" style=3D"font-family:arial,helvetic=
a,sans-serif">Cassio.<br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, 21 Feb 2024 at 09:28, David Gow &lt;=
<a href=3D"mailto:davidgow@google.com">davidgow@google.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">&#39;days&#39; is=
 a s64 (from div_s64), and so should use a %lld specifier.<br>
<br>
This was found by extending KUnit&#39;s assertion macros to use gcc&#39;s<b=
r>
__printf attribute.<br>
<br>
Fixes: 276010551664 (&quot;time: Improve performance of time64_to_tm()&quot=
;)<br>
Signed-off-by: David Gow &lt;<a href=3D"mailto:davidgow@google.com" target=
=3D"_blank">davidgow@google.com</a>&gt;<br>
---<br>
=C2=A0kernel/time/time_test.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/<span class=3D"gmail_default" style=3D"font-family:arial,helve=
tica,sans-serif"></span>kernel/time/time_test.c b/kernel/time/time_test.c<b=
r>
index ca058c8af6ba..3e5d422dd15c 100644<br>
--- a/kernel/time/time_test.c<br>
+++ b/kernel/time/time_test.c<br>
@@ -73,7 +73,7 @@ static void time64_to_tm_test_date_range(struct kunit *te=
st)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 days =3D div_s64(se=
cs, 86400);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#define FAIL_MSG &q=
uot;%05ld/%02d/%02d (%2d) : %ld&quot;, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#define FAIL_MSG &q=
uot;%05ld/%02d/%02d (%2d) : %lld&quot;, \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 year, month, mdday, yday, days<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 KUNIT_ASSERT_EQ_MSG=
(test, year - 1900, result.tm_year, FAIL_MSG);<br>
-- <br>
2.44.0.rc0.258.g7320e95886-goog<br>
<br>
</blockquote></div></div>

--0000000000009775130611ea86ea--
