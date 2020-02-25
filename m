Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 065FA16BC9B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DF96EA57;
	Tue, 25 Feb 2020 08:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827266E89E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 03:01:33 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t3so12849876wru.7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 19:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7AGR8Hdf9ULi1PXVMP6eGxBqYrhaZyWo5f2BOKVt9+Q=;
 b=KoW5Ed6KwVlhTbWteTLCBz6skGEoWKQjy6nGqr8sCpgQqdsaRFf80NhCPmu3CAwsLk
 GbuDl6vE7D4M4DZn1YRwjpACKbIkjZqe+pb6CLkUq3mbOEkkbyje1qjEphiGiObcV1uS
 d9G4Q96S6Nfn1eS5oO8IElzo87S6iXr1Ilgc00j7+ZI927tBoiys6/U4VeMk0Si4enGe
 EtLXTFCeHDaz1Rw5w3FHUu6dyWVl0FX5Q+DDIj1gEzNWW3SfF3VNRu2I+3rGOri01MmJ
 2Ph8lfYUifSeLj5uCmXz+vXyVYTLTFHh96To223meQeQSK2cIi6q4YIMNTeV2LRmP+ub
 a0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7AGR8Hdf9ULi1PXVMP6eGxBqYrhaZyWo5f2BOKVt9+Q=;
 b=hcUlyzTVcOM+QdcwPnCOZhD5RAllVoCN+BOuv92Pu+19/gNKiczudm34Cszm2xIEHH
 +CaAcTuMDwtGXuf2+ta+TSEyrWQx0gsHViKVXtzKpW6ebH9rSsjoeKuI/etKM+S3j68Z
 xwQUCqBmNTy/OZmRzosps1yEHh7yNFvoLdVcwdJlqmCFlY+eqA27lAo+TaU8WMfFad0T
 lIaF/t3f1dEbfljH4/o8MC1iM/dylG3or/EulyVo25hc20SFO0/ZR+XWPi+U5SB9XW7b
 Ce+EmocJHDZpwahbf71V9yBfOIx+G+lJIRKAMlu2av+dsMQycauWofG+N8IA3dMHEe29
 Co5g==
X-Gm-Message-State: APjAAAUWPZNA4qnlAPzr2MshgCAXD6jrGy9EOHD3jdVG8M+mnbLCjXpu
 Nq2iPv1DxEGFiZozFmX+7ZoCjY2Hwy/PyyduJYz2NQ==
X-Google-Smtp-Source: APXvYqxcswYZuPxFeYhPcXf081sNdS8r3v5iw8yyFrCFSnf75BYcYVg9wbVj3AeWGJBT1McKeNcerg/Z6zU8MctbOaE=
X-Received: by 2002:a5d:51ce:: with SMTP id n14mr71249049wrv.426.1582599692231; 
 Mon, 24 Feb 2020 19:01:32 -0800 (PST)
MIME-Version: 1.0
References: <1582080707-18825-1-git-send-email-tiantao6@hisilicon.com>
 <CAKoKPbxCF_B6iPEYAcVBJgNJ72GEwHu+WEg=QTO=fGgiOOYUGw@mail.gmail.com>
In-Reply-To: <CAKoKPbxCF_B6iPEYAcVBJgNJ72GEwHu+WEg=QTO=fGgiOOYUGw@mail.gmail.com>
From: Xinliang Liu <xinliang.liu@linaro.org>
Date: Tue, 25 Feb 2020 11:01:21 +0800
Message-ID: <CAKoKPbxyG2dCD1z+22xaZOLLb7rMAE64ZBqPWfNMiW1VMxfhWQ@mail.gmail.com>
Subject: Re: [PATCH] drm/hisilicon: Set preferred mode resolution and maximum
 resolution
To: Tian Tao <tiantao6@hisilicon.com>
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linuxarm@huawei.com, kraxel@redhat.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, tglx@linutronix.de
Content-Type: multipart/mixed; boundary="===============0964340639=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0964340639==
Content-Type: multipart/alternative; boundary="0000000000007a3a82059f5db486"

--0000000000007a3a82059f5db486
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Feb 2020 at 10:19, Xinliang Liu <xinliang.liu@linaro.org> wrote:

>
>
> On Wed, 19 Feb 2020 at 10:52, Tian Tao <tiantao6@hisilicon.com> wrote:
>
>> set the preferred mode resolution to 1024 * 768 and maximum
>> resolution to 1920 * 1200.
>>
>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>> Signed-off-by: Gong junjie <gongjunjie2@huawei.com>
>> ---
>>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>> index 6d98fdc..82fc7d3 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>> @@ -11,8 +11,10 @@
>>   *     Jianhua Li <lijianhua@huawei.com>
>>   */
>>
>> +#include <drm/drm_gem_vram_helper.h>
>>  #include <drm/drm_atomic_helper.h>
>>  #include <drm/drm_probe_helper.h>
>> +#include <drm/drm_crtc_helper.h>
>>  #include <drm/drm_print.h>
>>
>>  #include "hibmc_drm_drv.h"
>> @@ -20,7 +22,13 @@
>>
>>  static int hibmc_connector_get_modes(struct drm_connector *connector)
>>  {
>> -       return drm_add_modes_noedid(connector, 800, 600);
>> +       int count;
>> +
>> +       drm_connector_update_edid_property(connector, NULL);
>>
>
And as there is no edid for the connector, don't think call
drm_connector_update_edid_property is required.


> +       count = drm_add_modes_noedid(connector, 1920, 1200);
>>
>
> Hi Tao, maybe it's better like this:
> count = drm_add_modes_noedid( connector ,
>                                       conn->dev->mode_config.max_width,
>                                       conn->dev->mode_config.max_height);
>
>
>> +       drm_set_preferred_mode(connector, 1024, 768);
>> +
>> +       return count;
>>  }
>>
>>  static enum drm_mode_status hibmc_connector_mode_valid(struct
>> drm_connector *connector,
>> --
>> 2.7.4
>>
>>

--0000000000007a3a82059f5db486
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, 25 Feb 2020 at 10:19, Xinlian=
g Liu &lt;<a href=3D"mailto:xinliang.liu@linaro.org">xinliang.liu@linaro.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 19 Feb 2020 at 10:52, Tian T=
ao &lt;<a href=3D"mailto:tiantao6@hisilicon.com" target=3D"_blank">tiantao6=
@hisilicon.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">set the preferred mode resolution to 1024 * 768 and maximum<b=
r>
resolution to 1920 * 1200.<br>
<br>
Signed-off-by: Tian Tao &lt;<a href=3D"mailto:tiantao6@hisilicon.com" targe=
t=3D"_blank">tiantao6@hisilicon.com</a>&gt;<br>
Signed-off-by: Gong junjie &lt;<a href=3D"mailto:gongjunjie2@huawei.com" ta=
rget=3D"_blank">gongjunjie2@huawei.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 10 +++++++++-<br>
=C2=A01 file changed, 9 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu=
/drm/hisilicon/hibmc/hibmc_drm_vdac.c<br>
index 6d98fdc..82fc7d3 100644<br>
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c<br>
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c<br>
@@ -11,8 +11,10 @@<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0Jianhua Li &lt;<a href=3D"mailto:lijianhua@huaw=
ei.com" target=3D"_blank">lijianhua@huawei.com</a>&gt;<br>
=C2=A0 */<br>
<br>
+#include &lt;drm/drm_gem_vram_helper.h&gt;<br>
=C2=A0#include &lt;drm/drm_atomic_helper.h&gt;<br>
=C2=A0#include &lt;drm/drm_probe_helper.h&gt;<br>
+#include &lt;drm/drm_crtc_helper.h&gt;<br>
=C2=A0#include &lt;drm/drm_print.h&gt;<br>
<br>
=C2=A0#include &quot;hibmc_drm_drv.h&quot;<br>
@@ -20,7 +22,13 @@<br>
<br>
=C2=A0static int hibmc_connector_get_modes(struct drm_connector *connector)=
<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return drm_add_modes_noedid(connector, 800, 600=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int count;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_connector_update_edid_property(connector, N=
ULL);<br></blockquote></div></div></blockquote><div><br></div><div>And as t=
here is no edid for the connector, don&#39;t think call drm_connector_updat=
e_edid_property is required.=C2=A0</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0count =3D drm_add_modes_noedid(connector, 1920,=
 1200);<br></blockquote><div><br></div><div>Hi Tao, maybe it&#39;s better l=
ike this:</div><div>count =3D drm_add_modes_noedid(

connector

,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conn-&gt;dev=
-&gt;mode_config.max_width,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 conn-&gt;dev-&gt;mode_config.max_height);<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_set_preferred_mode(connector, 1024, 768);<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<br>
=C2=A0}<br>
<br>
=C2=A0static enum drm_mode_status hibmc_connector_mode_valid(struct drm_con=
nector *connector,<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--0000000000007a3a82059f5db486--

--===============0964340639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0964340639==--
