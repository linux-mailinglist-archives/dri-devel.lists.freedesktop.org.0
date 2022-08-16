Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9D759524B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 08:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36677DD333;
	Tue, 16 Aug 2022 06:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9D3DD2E4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 06:01:36 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id d20so8495058pfq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 23:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc;
 bh=PZ595QoZa8bP4cwqIpnehML+1Dy9UIuh1b9whHG0gKs=;
 b=u9BM4+Epak9V7r5+nRp7i6doaBYYNXUgmKtK1bR2jmbtBhbJNAK4MNZGKiEVCHcQ5D
 3OCeY2DENTd3RtccQtzsBX6sh/QWIzx4jWyOM6R1V1Ik95WQsGIXp396BJkAvCJ6rMOY
 yPWA+MT6uI7a8+9rsTtzLpyITnlOzosW2VDtEf5GXaIWjUSdycf/ch3l/islQduIPzb/
 Juhx4mMH/rsnmez7lo6h2P9dgbFEGoWX+mYtYJgugdfJ5c0qd4e+27iFxMKp3xxpECx9
 xRRML6lfS50bG135l5lxU7Qv/Pq3rIto0UVaxTaXrhmgbEiRjb4CL2B4NRLq5hSkdil0
 gNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc;
 bh=PZ595QoZa8bP4cwqIpnehML+1Dy9UIuh1b9whHG0gKs=;
 b=rf9RuxNGiuMleCtmUgyDWYXfaLGsPEGwJ/z1yCjQ+5sP/icjupw9TUjLiFWq8w6Xgv
 UFYVjEwBH1wMhr1Q+usmMJJaaqHeDIgt+TrIE3ftDN6iolMt43wmg5EMT1Duce7n0AEZ
 OkoiGWggfwk6Qb5MdTBYwgMH5urZSKVhtfLptqlDuaVSyLurokxGamQWL8GJRECZRsD2
 ZQi0JNu19gTBz1/qbezANQPG0112BGQ7qH3EviP9/7oLfRHn7CjJ4WKIPZ3nn3miJU7Y
 09i74b1bLKEOEQUuRvzsr+ou/0484xIPdqbitGsJPIC+E40LiyidxTGfIbyBzZZpwF3t
 HR+g==
X-Gm-Message-State: ACgBeo19sqwET6pzD1lfdCwFGD+42VGrYyhNJPTEm7YN0WGG1cB5PsFQ
 HP5+I55WcEBWFij73y16chIndA==
X-Google-Smtp-Source: AA6agR6KElwLD6InLhGTAlll4uDJT/P4HD0PoJbOUphOvAkaITAfOGN3lW7tHiwR8bqgRNq4gv9mFg==
X-Received: by 2002:a05:6a00:1d0f:b0:52f:d42c:8c60 with SMTP id
 a15-20020a056a001d0f00b0052fd42c8c60mr19954400pfx.82.1660629695705; 
 Mon, 15 Aug 2022 23:01:35 -0700 (PDT)
Received: from smtpclient.apple (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a170902d38900b0016dcc381bbasm7999102pld.144.2022.08.15.23.01.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Aug 2022 23:01:35 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2 1/3] media: vsp1: add premultiplied alpha support
From: Takanari Hayama <taki@igel.co.jp>
In-Reply-To: <0a9fd415-a4e8-2f87-3cbd-8e31b758cede@omp.ru>
Date: Tue, 16 Aug 2022 15:01:30 +0900
Content-Transfer-Encoding: quoted-printable
Message-Id: <8FCFDD0A-A885-43E9-9E85-5EABDB2362A5@igel.co.jp>
References: <20220810083711.219642-1-taki@igel.co.jp>
 <20220810083711.219642-2-taki@igel.co.jp>
 <0a9fd415-a4e8-2f87-3cbd-8e31b758cede@omp.ru>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, kieran.bingham+renesas@ideasonboard.com,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> 2022/08/11 2:41=E3=80=81Sergey Shtylyov =
<s.shtylyov@omp.ru>=E3=81=AE=E3=83=A1=E3=83=BC=E3=83=AB:
>=20
> Hello!
>=20
> On 8/10/22 11:37 AM, Takanari Hayama wrote:
>=20
>> To support DRM blend mode in R-Car DU driver, we must be able to pass
>> a plane with the premultiplied alpha. Adding a new property to
>> vsp1_du_atomic_config allows the R-Car DU driver to pass the
>> premultiplied alpha plane.
>>=20
>> Signed-off-by: Takanari Hayama <taki@igel.co.jp>
>> ---
>> drivers/media/platform/renesas/vsp1/vsp1_drm.c | 2 ++
>> include/media/vsp1.h                           | 2 ++
>> 2 files changed, 4 insertions(+)
>>=20
>> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c =
b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
>> index 0c2507dc03d6..019e18976bd8 100644
>> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
>> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
>> @@ -856,6 +856,8 @@ int vsp1_du_atomic_update(struct device *dev, =
unsigned int pipe_index,
>> 	rpf->mem.addr[1] =3D cfg->mem[1];
>> 	rpf->mem.addr[2] =3D cfg->mem[2];
>>=20
>> +	rpf->format.flags =3D (cfg->premult) ? =
V4L2_PIX_FMT_FLAG_PREMUL_ALPHA : 0;
>> +
>=20
>  Parens are hardly needed here... :-)

True. :) Thank you.

Cheers,
Takanari Hayama, Ph.D. <taki@igel.co.jp>
IGEL Co., Ltd.
https://www.igel.co.jp/=
