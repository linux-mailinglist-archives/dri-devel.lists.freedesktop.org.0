Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA6D3199C9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 06:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9E96E516;
	Fri, 12 Feb 2021 05:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F0F6E516
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 05:49:21 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id w1so13655456ejf.11
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 21:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ohW53ZS15iS/Ei9WADcfW7SbnF0sBlxvXJWPtRJjsLA=;
 b=VcKhQU1UQOFI9YMXPtT99QxksrO4Ea2GIhlil4kWNeopT6Ol4kP1zh8PkZtZCjjzaU
 OhftRJQQJalHAqszZtodFLKEPkTWfQKMHtLwMcqgEhXytXHYphVFokvxcLJaaOllpzx+
 uINoNVOFTRVpRqTlspguwTzLvvShyZHgL2M2eOTV/wiEjF+yj9PSa6unf3eOZPhr+EPy
 XONZQrsXdp58ZUpnnQmJXw8tjDWWhzxP2cHP16WlEWZVAVOQAQWxsRnMyjUzpAlookI4
 d5gTXp+rkPPIcWUlXL5Nj0SULmzloKQy9yhdIsYQLyh4mo5MemCdLr2V2PzH0boEAhcl
 eBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ohW53ZS15iS/Ei9WADcfW7SbnF0sBlxvXJWPtRJjsLA=;
 b=AwxAVNqYdgFWbF31FwProuMpw4tut2WRuK9KGzmu6C3kuaIWDXK22YrIWcm8I8/DZY
 08QsAvGqH4GVkNtsaxQVEo0zxPRBpLF8FW8DPk0TrFvrQjHYcpd3GdnhrIuwro4lAqJK
 QHhNUN58WGiCYsTZKCwInslUnyTSEvQNb/lqY+ID6ypyN3IZJAfDaTZw7WGja8n41vy3
 3YibLXgguIpM4t67wfcXOozuO76ZXh/a4KMydkHeYyR4t90MfHCawMqh+BcStjcqWNdJ
 9SbB6GMoT6uXT7h8ookIT7naL+GFmWBxI254oJoIlApqw6HIrVYEtwx9oJ0sKPLram1S
 jGgQ==
X-Gm-Message-State: AOAM533vTyNr+Nbj4SZFeTgsOrXyOZrMEBcs4mUjsi6Q90HVG+ngiNP8
 VpBMJrGD5Zf0sRBMImJszYS/HbiXLC/5KTg6HYI=
X-Google-Smtp-Source: ABdhPJzkuxwXoapqZk73dboe6XNB0L5iu7129vT9md+7mmiWzVzSiQdUs6SPQX8S3X+JgGrD3h3vrjc+EsHw6N+vd/k=
X-Received: by 2002:a17:906:4013:: with SMTP id
 v19mr1398930ejj.5.1613108960701; 
 Thu, 11 Feb 2021 21:49:20 -0800 (PST)
MIME-Version: 1.0
References: <20210124044010.18678-1-mario.kleiner.de@gmail.com>
 <YA61Aa07PhDucMyG@intel.com>
 <-NvMjiGAV79IMWvTOWrb2u_SHe2U36XumXbITMgCCqpMVg-FcvGRJbeTHaiUwkBSxZS5XaXYziZnoTdXJENA-JYQWNi-28F01___0SsWvv0=@emersion.fr>
 <CAEsyxyiK+bDyLDsk-jG3GGYWBjkGZeFamutmtDiNYvJSm4qegg@mail.gmail.com>
 <7Zl9uZ-uolN1JkU8Muxro-A5gTSN2SmmxYhs9g2UYfTFCJIoZVMIdkcPBbR6nkTxb3gWSwqTAsCfnlrtNzH133HdIZ9dCYcwZchv0iXZCnA=@emersion.fr>
 <CAEsyxygB-VZHg9a68Qb3XJ+xULwEeCkUFfthN4H+sdoVRXmJ2Q@mail.gmail.com>
 <CAEsyxyiPCXVmD-StDm+ZgOvDPASzXHci9dTaOWNf+VYFDEo97A@mail.gmail.com>
 <n2gjLlZ27Z0RAqlk7YhAi09RO_MKDmgP8crN2oeu-4O8pivnXph2Awy1ArYl61paax544su5pq13634h3Pm9OGB9QKt-RZ7mfz49aj64xy0=@emersion.fr>
 <CAEsyxyjxdqKrxkd=J9Tvi8wKQDLBMHv3yhgdu-eOQx5GXuWdbA@mail.gmail.com>
 <i1dksO6waKRbZE3gZaRpbDVEqdzpI10SrgvB9bEO2fbDeKQXUonBwCNEgtFHDn-lirZN52seQQusGiKDtRUGKRxG8WY2x46QnNRw_cd2FKg=@emersion.fr>
In-Reply-To: <i1dksO6waKRbZE3gZaRpbDVEqdzpI10SrgvB9bEO2fbDeKQXUonBwCNEgtFHDn-lirZN52seQQusGiKDtRUGKRxG8WY2x46QnNRw_cd2FKg=@emersion.fr>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Fri, 12 Feb 2021 06:49:09 +0100
Message-ID: <CAEsyxygtkP4-bGTA8c9_XWewNS0UAVv1VPYiat3-c+nh3MJxDg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1624991354=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1624991354==
Content-Type: multipart/alternative; boundary="000000000000962e4f05bb1d3220"

--000000000000962e4f05bb1d3220
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 11, 2021 at 11:44 AM Simon Ser <contact@emersion.fr> wrote:

> On Wednesday, February 10th, 2021 at 11:02 PM, Mario Kleiner <
> mario.kleiner.de@gmail.com> wrote:
>
> > I'll prepare patches with the same fix for libdrm and igt as well soon.
>
> Please don't submit patches for drm_fourcc.h to downstream if they vendor
> the
> whole file. Instead, update it from the kernel once your patch is merged to
> drm-next. For instance, see [1] for libdrm.
>
> Simon
>
> [1]:
> https://gitlab.freedesktop.org/mesa/drm/-/blob/master/include/drm/README
>

Ok. Thanks for the info,
-mario

--000000000000962e4f05bb1d3220
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Feb 11, 2021 at 11:44 AM Simon Se=
r &lt;<a href=3D"mailto:contact@emersion.fr">contact@emersion.fr</a>&gt; wr=
ote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Wednesday, February 10th, 2021 at 11:02 PM, Mario Kleine=
r &lt;<a href=3D"mailto:mario.kleiner.de@gmail.com" target=3D"_blank">mario=
.kleiner.de@gmail.com</a>&gt; wrote:<br>
<br>
&gt; I&#39;ll prepare patches with the same fix for libdrm and igt as well =
soon.<br>
<br>
Please don&#39;t submit patches for drm_fourcc.h to downstream if they vend=
or the<br>
whole file. Instead, update it from the kernel once your patch is merged to=
<br>
drm-next. For instance, see [1] for libdrm.<br>
<br>
Simon<br>
<br>
[1]: <a href=3D"https://gitlab.freedesktop.org/mesa/drm/-/blob/master/inclu=
de/drm/README" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesk=
top.org/mesa/drm/-/blob/master/include/drm/README</a><br></blockquote><div>=
<br></div><div>Ok. Thanks for the info,</div><div>-mario</div><div><br></di=
v></div></div>

--000000000000962e4f05bb1d3220--

--===============1624991354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1624991354==--
