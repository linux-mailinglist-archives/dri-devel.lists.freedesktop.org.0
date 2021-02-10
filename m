Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F2B3172CF
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 23:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465506ED09;
	Wed, 10 Feb 2021 22:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8969C6ED09
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 22:02:17 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id lg21so6887120ejb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 14:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9jjOZUpkahTqUXnQOW7PAoZlZoBPsvnp1v8qDymBxP8=;
 b=uZZgnFCURngv1ck7lhmeDuNY1onjVhlBocLIhOqqD+m8w0+bnAR7AfDWeS3KcyXKwu
 LlfcBsjKedkXiO/BXZe6cAXNzn6g5RNg2dnX8ZpxMAw4ws0uXp/RrLiXRF1GDreXS0AI
 psHL/DeIPS33sJTTAAxR2oSqbyiF9//8yMwRM0oVDaVEEvufsuy9C+PQFKa5KyQAeTbp
 nrJlCKRnDSN82EMLLgKxvPBqqrmTi0D0ErDU69JFkUW7rNaeEs497TyxoTUd0oRNDLvt
 EWQOkWYD6ShX45MCRJldvc+84BB0bteblyMGn2UEdpvz4k/+XliRJR7RpYbCkP0yj90I
 YbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9jjOZUpkahTqUXnQOW7PAoZlZoBPsvnp1v8qDymBxP8=;
 b=be2PHGrVa+ARHTKILltd3HVGFCSLNdfurpkYlmms6uLSSRefvw0/PJYgakO82e8nsb
 LUy1fWjlqyR+k/V2lYYBqk0btePcxcyjAMnNU2D0uEJKt5R7zWRo0lIjjki8BexKEUm7
 RD27RvJz3/wUeoKuh79391NBI55LvoOaXwsZfZr0tmjFrJFNm7Guy8FczbatvdhMdkl/
 8YpjStKnMCVCdULNOZ8qLf4vaVCwnPEsTpehNVEXxEUQsI8Iafw6Kg3iZdUIqwFSk7HS
 nKKV5KYhWbzqVJld4ZefDeONMQjICaoWyfrJejgp6IoL0b8VQCSNik+DrEO3/GogHH68
 zAEA==
X-Gm-Message-State: AOAM532XP3DKn5uZ+Pg41MzY/VfLzE9x1LofCzLVfqKLMm0HGBGCk2QZ
 zJO2Mnn2Fe+2+GC8A+Zg7N3+YMv2shpGMBwMUP8=
X-Google-Smtp-Source: ABdhPJytJPK+gNV5imTbOyMiCc+ch/iGxifq58wTAA+9v5VFjlPlAPQW+aEzXHuC12bmCDCPn24bTgSCF/OQwDFXMHI=
X-Received: by 2002:a17:906:4013:: with SMTP id
 v19mr5122152ejj.5.1612994532231; 
 Wed, 10 Feb 2021 14:02:12 -0800 (PST)
MIME-Version: 1.0
References: <20210124044010.18678-1-mario.kleiner.de@gmail.com>
 <yEq1_Ipkzm_vP4BD6cKlonRVfMbfGXrlvxOG4XDkk_wg1UkPCdLj95I8pknonGjf2Bs1zYeErr1WXerrQjprE3k1vswj3E2Nzq-imF58ytM=@emersion.fr>
 <CAEsyxyhXhJohDYuDDLoQeg-QqhnWQ953GRO0Kf6Puj=f_NkU4w@mail.gmail.com>
 <YA61Aa07PhDucMyG@intel.com>
 <-NvMjiGAV79IMWvTOWrb2u_SHe2U36XumXbITMgCCqpMVg-FcvGRJbeTHaiUwkBSxZS5XaXYziZnoTdXJENA-JYQWNi-28F01___0SsWvv0=@emersion.fr>
 <CAEsyxyiK+bDyLDsk-jG3GGYWBjkGZeFamutmtDiNYvJSm4qegg@mail.gmail.com>
 <7Zl9uZ-uolN1JkU8Muxro-A5gTSN2SmmxYhs9g2UYfTFCJIoZVMIdkcPBbR6nkTxb3gWSwqTAsCfnlrtNzH133HdIZ9dCYcwZchv0iXZCnA=@emersion.fr>
 <CAEsyxygB-VZHg9a68Qb3XJ+xULwEeCkUFfthN4H+sdoVRXmJ2Q@mail.gmail.com>
 <CAEsyxyiPCXVmD-StDm+ZgOvDPASzXHci9dTaOWNf+VYFDEo97A@mail.gmail.com>
 <n2gjLlZ27Z0RAqlk7YhAi09RO_MKDmgP8crN2oeu-4O8pivnXph2Awy1ArYl61paax544su5pq13634h3Pm9OGB9QKt-RZ7mfz49aj64xy0=@emersion.fr>
In-Reply-To: <n2gjLlZ27Z0RAqlk7YhAi09RO_MKDmgP8crN2oeu-4O8pivnXph2Awy1ArYl61paax544su5pq13634h3Pm9OGB9QKt-RZ7mfz49aj64xy0=@emersion.fr>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Wed, 10 Feb 2021 23:02:00 +0100
Message-ID: <CAEsyxyjxdqKrxkd=J9Tvi8wKQDLBMHv3yhgdu-eOQx5GXuWdbA@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix HDMI_STATIC_METADATA_TYPE1 constant.
To: Simon Ser <contact@emersion.fr>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0171190354=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0171190354==
Content-Type: multipart/alternative; boundary="0000000000001e4dfa05bb028e4e"

--0000000000001e4dfa05bb028e4e
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 10, 2021 at 10:14 PM Simon Ser <contact@emersion.fr> wrote:

> On Wednesday, February 10th, 2021 at 10:04 PM, Mario Kleiner <
> mario.kleiner.de@gmail.com> wrote:
>
> > Ping!
>
> I now understand the problem better.
>
> Reviewed-by: Simon Ser <contact@emersion.fr>
>
> I'll push to drm-misc-next in a few days if no-one complains. Ping me
> again if I forget.
>

Thanks! I'll prepare patches with the same fix for libdrm and igt as well
soon.
-mario

--0000000000001e4dfa05bb028e4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Feb 10, 2021 at 10:14 PM Simon Se=
r &lt;<a href=3D"mailto:contact@emersion.fr">contact@emersion.fr</a>&gt; wr=
ote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Wednesday, February 10th, 2021 at 10:04 PM, Mario Kleine=
r &lt;<a href=3D"mailto:mario.kleiner.de@gmail.com" target=3D"_blank">mario=
.kleiner.de@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Ping!<br>
<br>
I now understand the problem better.<br>
<br>
Reviewed-by: Simon Ser &lt;<a href=3D"mailto:contact@emersion.fr" target=3D=
"_blank">contact@emersion.fr</a>&gt;<br>
<br>
I&#39;ll push to drm-misc-next in a few days if no-one complains. Ping me<b=
r>
again if I forget.<br></blockquote><div>=C2=A0</div><div>Thanks! I&#39;ll p=
repare patches with the same fix for libdrm and igt as well soon.</div><div=
>-mario</div><div><br></div></div></div>

--0000000000001e4dfa05bb028e4e--

--===============0171190354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0171190354==--
