Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3AC49D4A8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 22:41:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659A710E951;
	Wed, 26 Jan 2022 21:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3000610E946
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 21:41:53 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id g145so885910qke.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 13:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YM2qWbkNc+vTbxFNO5qK8rrCclGyk48OZTrLK88G5Jw=;
 b=jC16RsIDo0fNrgt2lUj5SKJsKQ0RwYx9uEX2Klp4blFIgbZ/h8i9NEFy5WZnbwjMdT
 bf16VKIMg6BiACaO0uePLQmS+5N342XeSNMtjj6cOa1R20ZwMEz7G+HQvqjwSe7jhBZe
 6bSXGHlrxXMh91vAzAXk26sfP8+MTCRUJMf74a9gTEwr4f2hpvvFKQ0drjDMj1CsxpMG
 XrVkVEk20jU7b5k4TCdGqqEu47Ez61847WuoBCl7eyHYEeFNJAyKqXd28pHWzZrJvOVj
 pHgvEqBIlTETemEWpFSXfw1sOlrUhTPT7H4lO074ynWQYu4Wid6DlYvCBpUvK2ZdvWaL
 xsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YM2qWbkNc+vTbxFNO5qK8rrCclGyk48OZTrLK88G5Jw=;
 b=mXhlIRQdTsakUg32ohhl5ttxGQTZNgq5FdbvBEzddLj01g8hbzcwbiKsE4DF9RJZZM
 R0fnhqhUG4f0MIMI4KPGZZq4T43JEsAoJTBi6Niu3MzjiDAgmFwGI9gO9K4jkUiUwjTl
 S9+HAAVeKUwRS4brejTTPEABtCPmxsati79yHkYxhYXM3d4nkRSIfyU5fLALclP6FSZ8
 lZgiN04LO9EjcyQNNBLZQcDFa2euvI0uqeyMWtmJW+LdzNTN/y9XoC9lT+wZTEf+8rY9
 Roa0gNiQBjbcazjrkwg1F6+pXZdwguIL7JaCOkkVL9gZoQ/gmRCZUw57IAKX4xJlss7d
 OJJw==
X-Gm-Message-State: AOAM5317EzNDUWwmDMDtqbZdtbC9yoh2YWZNT23hpRoCddNjeNxdC60+
 sVXL28RlVfKQoCXretVBT5qe+PcnRU7+EbX8MZ8=
X-Google-Smtp-Source: ABdhPJw5/RKjnYkXEIOi+oTi6/Wzi7yVhb2J/UWevwZxKiNqw5YHE0EQ45Oi6Rmr/Wdb2Ijx8clBsUQpZTxIKkunVcg=
X-Received: by 2002:a05:620a:1914:: with SMTP id
 bj20mr648315qkb.56.1643233312127; 
 Wed, 26 Jan 2022 13:41:52 -0800 (PST)
MIME-Version: 1.0
References: <20211110220050.2854-1-jirivanek1@gmail.com>
 <20220106190027.1498-1-jirivanek1@gmail.com>
 <CAGWqDJ6T6EGNjoc2qfNHLMdcuwcnJArF7a7sToRXJ90Zs57E_A@mail.gmail.com>
In-Reply-To: <CAGWqDJ6T6EGNjoc2qfNHLMdcuwcnJArF7a7sToRXJ90Zs57E_A@mail.gmail.com>
From: =?UTF-8?B?SmnFmcOtIFZhbsSbaw==?= <jirivanek1@gmail.com>
Date: Wed, 26 Jan 2022 22:41:42 +0100
Message-ID: <CAECvnWLuYKrZEHZaDChSnshDQj3t_J5L67Fdn0m734ywJw-DfQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge/tc358775: Fix for dual-link LVDS
To: Vinay Simha B N <simhavcs@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000da3ea905d683111b"
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
Cc: open list <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000da3ea905d683111b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

AUO P215HVN01.0 /   AUO G215HVN01.0

=C4=8Dt 6. 1. 2022 v 20:22 odes=C3=ADlatel Vinay Simha B N <simhavcs@gmail.=
com>
napsal:

> Reviewed-by: Vinay Simha BN <simhavcs@gmail.com>
>
> Jiri Vanek,
> Could you please share the part number or datasheet of the dual-link LVDS
> display/panel used.
>
>
> On Fri, Jan 7, 2022 at 12:30 AM Jiri Vanek <jirivanek1@gmail.com> wrote:
>
>> Fixed wrong register shift for single/dual link LVDS output.
>>
>> Tested-by: Jiri Vanek <jirivanek1@gmail.com>
>> Signed-off-by: Jiri Vanek <jirivanek1@gmail.com>
>>
>> ---
>> v1:
>> * Initial version
>>
>> v2:
>> * Tested-by tag added
>>
>> ---
>>  drivers/gpu/drm/bridge/tc358775.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/tc358775.c
>> b/drivers/gpu/drm/bridge/tc358775.c
>> index 2272adcc5b4a..1d6ec1baeff2 100644
>> --- a/drivers/gpu/drm/bridge/tc358775.c
>> +++ b/drivers/gpu/drm/bridge/tc358775.c
>> @@ -241,7 +241,7 @@ static inline u32 TC358775_LVCFG_PCLKDIV(uint32_t va=
l)
>>  }
>>
>>  #define TC358775_LVCFG_LVDLINK__MASK                         0x00000002
>> -#define TC358775_LVCFG_LVDLINK__SHIFT                        0
>> +#define TC358775_LVCFG_LVDLINK__SHIFT                        1
>>  static inline u32 TC358775_LVCFG_LVDLINK(uint32_t val)
>>  {
>>         return ((val) << TC358775_LVCFG_LVDLINK__SHIFT) &
>> --
>> 2.30.2
>>
>>
>
> --
> regards,
> vinaysimha
>

--000000000000da3ea905d683111b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:13px">AUO P215HVN01.0 /=C2=A0=C2=
=A0</span>

<span style=3D"font-size:13px">AUO G215HVN01.0</span><br><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=C4=8Dt 6. 1. 2022 v=C2=
=A020:22 odes=C3=ADlatel Vinay Simha B N &lt;<a href=3D"mailto:simhavcs@gma=
il.com">simhavcs@gmail.com</a>&gt; napsal:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div dir=3D"ltr"><div>Reviewed-by: Vinay Simha BN &lt;<a href=3D"ma=
ilto:simhavcs@gmail.com" target=3D"_blank">simhavcs@gmail.com</a>&gt;</div>=
<div><br></div><div>Jiri Vanek,<br></div><div>Could you please share the pa=
rt number or datasheet of the dual-link LVDS display/panel used.</div></div=
><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Fri, Jan 7, 2022 at 12:30 AM Jiri Vanek &lt;<a href=3D"mailto:jirivanek1@=
gmail.com" target=3D"_blank">jirivanek1@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Fixed wrong register shift=
 for single/dual link LVDS output.<br>
<br>
Tested-by: Jiri Vanek &lt;<a href=3D"mailto:jirivanek1@gmail.com" target=3D=
"_blank">jirivanek1@gmail.com</a>&gt;<br>
Signed-off-by: Jiri Vanek &lt;<a href=3D"mailto:jirivanek1@gmail.com" targe=
t=3D"_blank">jirivanek1@gmail.com</a>&gt;<br>
<br>
---<br>
v1:<br>
* Initial version<br>
<br>
v2:<br>
* Tested-by tag added<br>
<br>
---<br>
=C2=A0drivers/gpu/drm/bridge/tc358775.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc3=
58775.c<br>
index 2272adcc5b4a..1d6ec1baeff2 100644<br>
--- a/drivers/gpu/drm/bridge/tc358775.c<br>
+++ b/drivers/gpu/drm/bridge/tc358775.c<br>
@@ -241,7 +241,7 @@ static inline u32 TC358775_LVCFG_PCLKDIV(uint32_t val)<=
br>
=C2=A0}<br>
<br>
=C2=A0#define TC358775_LVCFG_LVDLINK__MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00000002<br>
-#define TC358775_LVCFG_LVDLINK__SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
+#define TC358775_LVCFG_LVDLINK__SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
=C2=A0static inline u32 TC358775_LVCFG_LVDLINK(uint32_t val)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ((val) &lt;&lt; TC358775_LVCFG_LVDLINK__=
SHIFT) &amp;<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">regards,<b=
r>vinaysimha</div>
</blockquote></div></div>

--000000000000da3ea905d683111b--
