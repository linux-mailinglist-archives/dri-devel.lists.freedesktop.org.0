Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9843B8A8C4E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 21:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8538910F419;
	Wed, 17 Apr 2024 19:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="T+bRSjrY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic305-21.consmr.mail.ne1.yahoo.com
 (sonic305-21.consmr.mail.ne1.yahoo.com [66.163.185.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC9C10F202
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 17:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1713376511; bh=U/piKB9Wfuwz4dJlXxQfbdbmZItS6Racb9B8UGl68jI=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=T+bRSjrYP4RkhpHZv2vPwvNXgFBnjbMhvl9NFE1GUsQksh7CCCcT5/3B7o1reepREVXKlTZwb6EbIX9WXOr3dJbvUEVQ4v+o+7kZR/BNH6xPQAbzsua+RB4IfyoQnZp6jbiSZE22uAHgSPuavarfpgwtyUkdNWmVvsuOzvtEpusDHgEFH3gC+cP/9gV8NagLsk/Zxz5NMR7JHh44AWL8Wt0pftyuy5wsOyruBVYYKfXVICUKo38Np5TJX7X3NEovbSzQVQlQXZe5i7LYr27E7/WLQ+Xd4kFOIrWb8z/iNQPmguu/L0dpm8XXUp11HRKICJ9P2rmNPefYqIopnbc60Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1713376511; bh=0dNt1dHsM5rew6y2AUxLL2C0IN8ejkhhs8pcoufWIAO=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=hOUDEpwNQgq9KtoTKiMB5fU7dTJVabShB+EAGR7d6ktyePN+O80KZJ8tmxKkaW00fOhhmdhf2cotKhW8MZ6LoQ559PYs5hHQ9Iaveu/Z/GH7HFtwdRKR/Ah35WUIAX/SpWmci9iQEe6Wk06Upyflh6NBTUverZo/a+xeEb4V4Mk1jQSO1fzSYrlFjJIRutWgqbopvCKsTCLAIxHNC0pYP3CAFz+fpHE9xb3UXdD5/+ymIxkNF1Y+B/Yjs173t97yjn4MnvdWsxpe35YS4xJ/fzgKHdfemHRy+nnmQY6ZmwAc5TEt8+wEHmlBamFSuFQnddzNWw9y6I5ZzKPk9T2MQQ==
X-YMail-OSG: 3sXsXG4VM1lF1_Xch_VjjpZqUQU_c0.qRSmu4hH6O7hYVemHsMR4dWNyMiKmg7Y
 qjzYee14XbVBIcECFFbjysgA8XTovciso.ij4zFblIKtEfXPOu4di3ASM6LioqmVqph29yO4YWj7
 bRNH.L4AchKFn.jWpLieAelAa2JFQUUm8qMVPfgvz8J56Sc0V3EXp_TUmfcYdl1QgyvqrtOscinX
 oMtPGXwABVmRdTSJ38lPIWlB4bf8Yx90M74mqETcHK.dEkVUvvSx1.KxKG3HiNG5Sgka._gFbCfx
 D19rXwsMTRFcsWkfjoz7ucZgRdgkj6y_pv5NqP2GbHnEVTA9BfKw1XsTUIJufzbiDHFKxwZEV5L5
 CYq.ss9hvLMcxe2QsBz5Smb3Q1X3y4IUsVMUPiWR6jCahyq34QxlwQmrM_.aaEDz8r3gPsjoStSF
 AFLR2C84se3a5r6EeQ0FS7EaPvl4q3G7XnvQ5dpAQgZ56HjBiR9DdwjOAvxV_i0MYHt8F9SAvQCA
 w3VE5k60n1Kn6iLyb13CN76eHYFYJHJI10uNopSEHx_7PyHv4yAJtb0UUCFRMau8Y7Mh64ja5yp5
 zlurdNtnWG9hhqc0jK5dAGfroMAM_ihXjJ5qSTgbg7jaqkwrv1.PPB_udIvsVjJki6zhd0lw7Jqb
 JeNcQ81p6WzO9YfgGxGeJZ3pW7et_G5Tlinb5uVe3uEFC9gQOqKksrmeqYp4Ik.EIud27hNM3C7d
 DPobc9hH6Hca7ljEDIozYBi9Oa2_n_MwI53wziitNjxnJXjqo2cmXryQKhdd8vFsxczM5wM.Ii.g
 T2GMOOVXZURxOEBAO37zcLZr0sEyzjdvaZOgIFWns1Do4XzGpmVhAa3nu65djwr5IUgrKJR7N486
 kEX_9glTEdtYIQb4GWbrlxgBNg7hpBDVtVcIhRd78P6oP5xoK5OMxO06n5_mBRHT5GeuJH4ilMdk
 4e0R7sav26xyVthT4MGDBsr845Ru_dyMH8rDb9br32kyC1l_yp5Hk6nBM8B.h_yqu53v6FnWgNGf
 5wywY6ojaRxL2p1mfNwQKfZjK6P7FzGi3DuCtTELgHjV9uKpbCJ6AkalWJT_XpSxWOl0m1L8NZQ0
 GNWUzY9uCO0JZUXEnSv1jtZqTVh.i5xJda1vIs9xzuU5qyBSn46zS6ezBZFJoILq5kjs4dVfTlam
 rHBZz5RSl.BwjC2YwyadFfIcE_zffrn2HfnugW36wAUv_ste820EBxZz.DYqd9KF_WwhrgRPFPay
 McZ83ESNhD58I12eMBwqM1uVwYtBrbD_gC3a8DkTuVY9gIwduNmzyhrYqDaoovbhVGtpmS7x2FyG
 a28xt8mPYxQGgFysP.ztrbfY_TpvWFRWBpaV.iKVFR86vW8ElIIURo5VlltxDht.rApA0HYxj_QW
 HIRJlkSc5kkbfy0IqhVzN9k98AOa__wV6ka4_wXUJqrddThnnrsLFR1AnRMbudkurjphBWdTC4Zx
 5FFKvdIcE9Nrk0_rLS1.k3EXs3zv9NCd9ee7J4VvlyUn9pcst9tkaOdlFUW7S1h8V.atprwc99uK
 A_d4TecgD4AvgtD2.BVeHjmdUfIWfyTCZw9zC7LDStRDawmc8pJ_TCWRhxun8EG.bTIobV7.5Plm
 e3RM2XmSvZNsJDGdzLOOUguWGZ9shPMnDaYrd0fgSuRWzyYatlUSc_7dwl7snolH_Mkfdm4gyl8S
 uJuoZjdjmzB_724oZENrYzwl1FnV7WKmC733.eRs5_VJGt64Xj2zS5A9o_3et_R2Ci6ZFIZrTF9z
 OfLCIVvH8Wu3XmqzK21ZO6ngHlsmHcnus_dlmbuNBUgsMK0Kzp0rNHFvXC7VD0gbAwVuHxNGsOcy
 YdBttMNwhWOXhIgM.HizzwXciw_sBobCaZ.AlE5SHHP3LKa81jXfOIi6HrjjW9RQFCt61b4qwvJx
 nuiOQJx1FYVulCTIXMAek7M2uZbiLwzXyhnGPp7uYtEsTyNcLs0jxiihwUd0ddE4AiGKBqV.h3Ef
 WRlz.yzgy.b.59JgcBn0FhdanSXR8mFXtKBissWRqWjDCjIZJ.H5UJ157wAmvbwrBpX_t.SASCjj
 6kYEQSEZVsif8TOif3Kj8vsHBIf0l2GDByWPx4ea0034byQpT7.irYUmra15b8ZFjkR_AlVma2A3
 PrkwvCSPwiZzutzAdR__wSSHlXuxM9tdRUOft38vQMPHV74MvKtKj_8GUEYgwVEtgbHOdYbLqwVX
 iHiTUn7QlDKxw2u7GQX7tU7OjDOuDuTyUXdFMmMJam9WCs5SNzeodIZpqVUo33EZtSG_dneuk6U1
 9O0hhp3LkFff9Wv_bKfs6guNm29oK5.GTMJDna8RU
X-Sonic-MF: <ashokemailat@yahoo.com>
X-Sonic-ID: 76638ec4-78ee-42a9-8715-12c8a8eea5b5
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.ne1.yahoo.com with HTTP; Wed, 17 Apr 2024 17:55:11 +0000
Received: by hermes--production-ne1-6488576888-g2rhl (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID efdf6dd4ecf39af123b3653e35a72d7e; 
 Wed, 17 Apr 2024 17:55:07 +0000 (UTC)
Message-ID: <6f429c19256722f0478e5264b42c0a2a4312abc5.camel@yahoo.com>
Subject: Re: [PATCH] staging: fbtft Removed redundant parentheses
From: A <ashokemailat@yahoo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 outreachy@lists.linux.dev
Date: Wed, 17 Apr 2024 10:55:06 -0700
In-Reply-To: <2024041724-barricade-hardly-c554@gregkh>
References: <cc9b9357d30c4abac7301767ff01fe7947f811c4.camel.ref@yahoo.com>
 <cc9b9357d30c4abac7301767ff01fe7947f811c4.camel@yahoo.com>
 <2024041724-barricade-hardly-c554@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Mailer: WebService/1.1.22256
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Mailman-Approved-At: Wed, 17 Apr 2024 19:48:55 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2024-04-17 at 09:07 +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 16, 2024 at 01:14:52PM -0700, A wrote:
> > > From 6dbcb120581fc7cb45812193227b0a197abd8ba4 Mon Sep 17 00:00:00
> > > 2001
> > From: Ashok Kumar <ashokemailat@yahoo.com>
> > Date: Tue, 16 Apr 2024 09:19:32 -0700
> > Subject: [PATCH] [PATCH] staging: fbtft Removed redundant
> > parentheses on
> > =C2=A0logical expr
> >=20
> > Adhere to Linux Kernel coding style removed redundant parentheses,
> > multiple blank lines and indentation alignment.
> >=20
> > Reported by checkpatch.pl
> >=20
> > ------
> > fb_ili9320.c
> >=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((devcode !=3D 0x0000) && (dev=
code !=3D 0x9320))
> >=20
> > ------
> > fb_ra8875.c
> >=20
> > CHECK: Unnecessary parentheses around 'par->info->var.xres =3D=3D 320'
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((par->info->var.xres =3D=3D 320) &&=
 (par->info->var.yres =3D=3D
> > 240)) {
> >=20
> > ------
> > fb_ssd1325.c
> >=20
> > CHECK: Please don't use multiple blank lines
> > ------
> >=20
> > fb_tinylcd.c=C2=A0=C2=A0=C2=A0 - indentation adjustment
> >=20
> > -----
> > fbtft-bus.c
> >=20
> > CHECK: Unnecessary parentheses around 'par->spi->bits_per_word =3D=3D
> > 8'
> >=20
> > ------
> > fbtft-core.c
> >=20
> > CHECK: Please don't use multiple blank lines
> >=20
> > CHECK: Unnecessary parentheses around '!txbuflen'
> >=20
> > CHECK: Please don't use multiple blank lines
> > ------
> >=20
> > Signed-off-by: Ashok Kumar <ashokemailat@yahoo.com>
> > ---
> > =C2=A0drivers/staging/fbtft/fb_ili9320.c | 2 +-
> > =C2=A0drivers/staging/fbtft/fb_ra8875.c=C2=A0 | 8 ++++----
> > =C2=A0drivers/staging/fbtft/fb_ssd1325.c | 2 --
> > =C2=A0drivers/staging/fbtft/fb_tinylcd.c | 2 +-
> > =C2=A0drivers/staging/fbtft/fbtft-bus.c=C2=A0 | 6 +++---
> > =C2=A0drivers/staging/fbtft/fbtft-core.c | 7 +------
> > =C2=A06 files changed, 10 insertions(+), 17 deletions(-)
> >=20
> > diff --git a/drivers/staging/fbtft/fb_ili9320.c
> > b/drivers/staging/fbtft/fb_ili9320.c
> > index 0be7c2d51548..409b54cc562e 100644
> > --- a/drivers/staging/fbtft/fb_ili9320.c
> > +++ b/drivers/staging/fbtft/fb_ili9320.c
> > @@ -37,7 +37,7 @@ static int init_display(struct fbtft_par *par)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0devcode =3D read_device=
code(par);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fbtft_par_dbg(DEBUG_INI=
T_DISPLAY, par, "Device code:
> > 0x%04X\n",
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 devcode);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if ((devcode !=3D 0x0000) &&=
 (devcode !=3D 0x9320))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (devcode !=3D 0x0000 && d=
evcode !=3D 0x9320)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_warn(par->info->device,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "Unrecognized Device code: 0x%04X
> > (expected
> > 0x9320)\n",
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
devcode);
> > diff --git a/drivers/staging/fbtft/fb_ra8875.c
> > b/drivers/staging/fbtft/fb_ra8875.c
> > index 398bdbf53c9a..4b79fb48c5f0 100644
> > --- a/drivers/staging/fbtft/fb_ra8875.c
> > +++ b/drivers/staging/fbtft/fb_ra8875.c
> > @@ -50,7 +50,7 @@ static int init_display(struct fbtft_par *par)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0par->fbtftops.reset(par=
);
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if ((par->info->var.xres =3D=
=3D 320) && (par->info->var.yres =3D=3D
> > 240)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (par->info->var.xres =3D=
=3D 320 && par->info->var.yres =3D=3D
> > 240)
> > {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0/* PLL clock frequency */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0write_reg(par, 0x88, 0x0A);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0write_reg(par, 0x89, 0x02);
> > @@ -74,8 +74,8 @@ static int init_display(struct fbtft_par *par)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0write_reg(par, 0x1D, 0x0E);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0write_reg(par, 0x1E, 0x00);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0write_reg(par, 0x1F, 0x02);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else if ((par->info->var.x=
res =3D=3D 480) &&
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (par->info->var.yres =3D=3D 272)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else if (par->info->var.xr=
es =3D=3D 480 &&
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 par->info->var.yres =3D=3D 272) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0/* PLL clock frequency=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0write_reg(par, 0x88, 0x0A);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0write_reg(par, 0x89, 0x02);
> > @@ -111,7 +111,7 @@ static int init_display(struct fbtft_par *par)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0write_reg(par, 0x04, 0x01);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0mdelay(1);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0/* horizontal settings */
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0write_reg(par, 0x14, 0x4F);
> > +write_reg(par, 0x14, 0x4F);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0write_reg(par, 0x15, 0x05);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0write_reg(par, 0x16, 0x0F);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0write_reg(par, 0x17, 0x01);
> > diff --git a/drivers/staging/fbtft/fb_ssd1325.c
> > b/drivers/staging/fbtft/fb_ssd1325.c
> > index 796a2ac3e194..69aa808c7e23 100644
> > --- a/drivers/staging/fbtft/fb_ssd1325.c
> > +++ b/drivers/staging/fbtft/fb_ssd1325.c
> > @@ -109,8 +109,6 @@ static int set_gamma(struct fbtft_par *par, u32
> > *curves)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int i;
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fbtft_par_dbg(DEBUG_INIT_DIS=
PLAY, par, "%s()\n", __func__);
> > -
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < GAMMA=
_LEN; i++) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (i > 0 && curves[i] < 1) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
dev_err(par->info->device,
> > diff --git a/drivers/staging/fbtft/fb_tinylcd.c
> > b/drivers/staging/fbtft/fb_tinylcd.c
> > index 9469248f2c50..60cda57bcb33 100644
> > --- a/drivers/staging/fbtft/fb_tinylcd.c
> > +++ b/drivers/staging/fbtft/fb_tinylcd.c
> > @@ -38,7 +38,7 @@ static int init_display(struct fbtft_par *par)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0write_reg(par, 0xE5, 0x=
00);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0write_reg(par, 0xF0, 0x=
36, 0xA5, 0x53);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0write_reg(par, 0xE0, 0x=
00, 0x35, 0x33, 0x00, 0x00, 0x00,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00, 0x35, 0x33,=
 0x00, 0x00, 0x00);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0write_reg(par, MIPI_DCS=
_SET_PIXEL_FORMAT, 0x55);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0write_reg(par, MIPI_DCS=
_EXIT_SLEEP_MODE);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0udelay(250);
> > diff --git a/drivers/staging/fbtft/fbtft-bus.c
> > b/drivers/staging/fbtft/fbtft-bus.c
> > index 3d422bc11641..02d7dbd38678 100644
> > --- a/drivers/staging/fbtft/fbtft-bus.c
> > +++ b/drivers/staging/fbtft/fbtft-bus.c
> > @@ -62,9 +62,9 @@
> > out:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > =C2=A0}=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > =C2=A0=C2=A0=20
> > \
> > =C2=A0EXPORT_SYMBOL(func);
> > =C2=A0
> > -define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
> > +define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8,)
> > =C2=A0define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16,
> > cpu_to_be16)
> > -define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
> > +define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16,)
> > =C2=A0
> > =C2=A0void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
> > =C2=A0{
> > @@ -85,7 +85,7 @@ void fbtft_write_reg8_bus9(struct fbtft_par *par,
> > int
> > len, ...)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (len <=3D 0)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (par->spi && (par->spi->b=
its_per_word =3D=3D 8)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (par->spi && par->spi->bi=
ts_per_word =3D=3D 8) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0/* we're emulating 9-bit, pad start of buffer wi=
th
> > no-
> > ops
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 * (assuming here that zero is a no-op)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > diff --git a/drivers/staging/fbtft/fbtft-core.c
> > b/drivers/staging/fbtft/fbtft-core.c
> > index 38845f23023f..98ffca49df81 100644
> > --- a/drivers/staging/fbtft/fbtft-core.c
> > +++ b/drivers/staging/fbtft/fbtft-core.c
> > @@ -216,8 +216,6 @@ static void fbtft_reset(struct fbtft_par *par)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!par->gpio.reset)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fbtft_par_dbg(DEBUG_RESET, p=
ar, "%s()\n", __func__);
> > -
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gpiod_set_value_canslee=
p(par->gpio.reset, 1);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0usleep_range(20, 40);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gpiod_set_value_canslee=
p(par->gpio.reset, 0);
> > @@ -667,7 +665,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct
> > fbtft_display *display,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0txbuflen =3D 0;
> > =C2=A0
> > =C2=A0#ifdef __LITTLE_ENDIAN
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if ((!txbuflen) && (bpp > 8)=
)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!txbuflen && bpp > 8)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0txbuflen =3D PAGE_SIZE; /* need buffer for
> > byteswapping
> > */
> > =C2=A0#endif
> > =C2=A0
> > @@ -1053,8 +1051,6 @@ static int fbtft_verify_gpios(struct
> > fbtft_par
> > *par)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct fbtft_platform_d=
ata *pdata =3D par->pdata;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int i;
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fbtft_par_dbg(DEBUG_VERIFY_G=
PIOS, par, "%s()\n", __func__);
> > -
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (pdata->display.busw=
idth !=3D 9 &&=C2=A0 par->startbyte =3D=3D 0 &&
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !par=
->gpio.dc) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_err(par->info->device,
> > @@ -1159,7 +1155,6 @@ int fbtft_probe_common(struct fbtft_display
> > *display,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0dev =3D &pdev->dev;
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (unlikely(display->d=
ebug & DEBUG_DRIVER_INIT_FUNCTIONS))
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0dev_info(dev, "%s()\n", __func__);
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pdata =3D dev->platform=
_data;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!pdata) {
> > --=20
> > 2.34.1
> >=20
> >=20
>=20
> Hi,
>=20
> This is the friendly patch-bot of Greg Kroah-Hartman.=C2=A0 You have sent
> him
> a patch that has triggered this response.=C2=A0 He used to manually
> respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.=C2=A0 Hopefully you will not take offence and will fix the
> problem
> in your patch and resubmit it so that it can be accepted into the
> Linux
> kernel tree.
>=20
> You are receiving this message because of the following common
> error(s)
> as indicated below:
>=20
> - Your patch contains warnings and/or errors noticed by the
> =C2=A0 scripts/checkpatch.pl tool.
>=20
>>>  Per guidelines in Newbies site for this 1st submission
>>>  picked up "CHECK" type fixes only. Other types in separate=20
>>>  patch.=20
>>>  Also Warnings were not fixed for following reasons as per
>>>  PatchPhilosophy guidelines=20
>>>  i) Warnings related to License issues  ("Please avoid sending=C2=A0
>>>  patches for the Licence related checkpatch.pl warnings. It=C2=A0
>>>  requires lot more discussion by driver authors and companies
>>>  before doing so and is not often preferred by maintainers to
>>>  accept them when sent by newbies")
>>>  ii) Warnings related Udelay skipped per Patch Philosophy guidance
>>>  ("Changes to udelay are also better to avoid. It is hard to be
>>>  sure that such changes are correct without access to the=C2=A0
>>>  device=C2=A0for careful testing.")
>>>  ERROR type will be a separate patch and not included in this=20
>>>  first patch is contains only "CHECK"

> - Your patch is malformed (tabs converted to spaces, linewrapped,
> etc.)
> =C2=A0 and can not be applied.=C2=A0 Please read the file,
> =C2=A0 Documentation/process/email-clients.rst in order to fix this.
>=20
> - Your patch was attached, please place it inline so that it can be
> =C2=A0 applied directly from the email message itself.
>=20
>>> Sent it using Evolution as per instruction in the above document
>>> Created Patch using git format-patch command
>>> In Evolution set the Format->Paragraph Style to Preformatted
>>> Then Insert Text file and picked the file formatted by git
>>> having issues in connecting mutt or git sendmail to yahoo email=20
>>> Trying to get it resolved. =20
>>> Help from anyone with similar exp welcome.

> - Your patch did many different things all at once, making it
> difficult
> =C2=A0 to review.=C2=A0 All Linux kernel patches need to only do one thin=
g at a
> =C2=A0 time.=C2=A0 If you need to do multiple things (such as clean up al=
l
> coding
> =C2=A0 style issues in a file/driver), do it in a sequence of patches,
> each
> =C2=A0 one doing only one thing.=C2=A0 This will make it easier to review=
 the
> =C2=A0 patches to ensure that they are correct, and to help alleviate any
> =C2=A0 merge issues that larger patches can cause.
>=20
>>> Will correct it and use patchset concept and resend it again

> - You did not specify a description of why the patch is needed, or
> =C2=A0 possibly, any description at all, in the email body.=C2=A0 Please =
read
> the
> =C2=A0 section entitled "The canonical patch format" in the kernel file,
> =C2=A0 Documentation/process/submitting-patches.rst for what is needed in
> =C2=A0 order to properly describe the change.
>=20
>>> Had description in the body. Any help to refine/reformat welcome

> - You did not write a descriptive Subject: for the patch, allowing
> Greg,
> =C2=A0 and everyone else, to know what this patch is all about.=C2=A0 Ple=
ase
> read
> =C2=A0 the section entitled "The canonical patch format" in the kernel
> file,
> =C2=A0 Documentation/process/submitting-patches.rst for what a proper
> =C2=A0 Subject: line should look like.
>=20
>>> Tried best to put the subject as per document. However
>>> In the body of the mail I see [PATCH] [PATCH] repeated twice
>>> Help to refine/reformat this welcome.  The beginning of this=20
>>> email shows what went out originally

> If you wish to discuss this problem further, or you have questions
> about
> how to resolve this issue, please feel free to respond to this email
> and
> Greg will reply once he has dug out from the pending patches received
> from other developers.
>=20
> thanks,
>=20
> greg k-h's patch email bot

