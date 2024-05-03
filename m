Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F20B48BB0C2
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 18:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D7810F923;
	Fri,  3 May 2024 16:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="OJY7SQpJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic305-21.consmr.mail.ne1.yahoo.com
 (sonic305-21.consmr.mail.ne1.yahoo.com [66.163.185.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C239D10F923
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1714753225; bh=OpuBHTwhnfArlf2PsQ6g2wnS/DKkhtNrSqNbd0Cd8cY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=OJY7SQpJPzFrXmeylgxlGlD3BCSE3qOAxtwPdYkVU5FOxoLQRKJF00tEYfmhaZK5iKlWOa1/JjjV3eH5JM2lkvEgYwXSMN2TYCphU3hLPn6KbqF1Rj/25IatAeHosRSq3yFt10J95fl7tGkina6PY5ns5e6q74dtMuyD6gERnI1RySrwQf23ZltBNfLXPMdRXH5udLAJ2h/8SmvLmdIuNJw2BOm3ocVmKh6moWugYmx9dm9auVM2M44Hb3/30RTwNCAXsebxMTB2Hxq5cXS4rVZ2q301QKyzYNDGGKm96RYCeoiBvvY3ZTsoE41Br0FOufHwquVo3bVShNWRkPQ2+A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1714753225; bh=gPCGN3rmhpceV7xys+Q2GhOmTSmNqpsqTtrlqRdgO1X=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=V5CLgOtQ0no4pFxBD1z0CO1DCpcuj0doeAwUEFljJGxIAQTKleE86ex1gGEoZ1bGiooafFJU12Wpv2Y4lkwfnaR8uqWfZP2WI3bvnjHW6ORKMHakTJ2ARzRLeixzdG3FoCCeP4K62/I9xHLzyqg8DEbl3bhFey5vqnQZ4Et4w+b8s2i+X/NIGl99B5H0poNXBIFVJdDMsnGKUjPrC1re6as0OmJra+WpDtuBIIZBVn0wHkck0pB/h0tve3WBR6v2FTKdA8J089oVjL+9aMHtnhHhchoVsgiFJgRsu2Ufjse3VagAL9Z1BH/sp41tu6VU5Fju51g7+np6PWG27rIB8A==
X-YMail-OSG: u7CikhkVM1mEMBJgRhgeFfykAxEVELBK2D8SuCjgxXEHVfhg2Mh1jCun.7euP4n
 YuKTaefJTFGNeHA6y0GKN8r5o3pt6uZ4L7fJsdR9huBW4xI._HbSxGmtwL7Q.r.q2HNLUhrxNcqJ
 iQk0clfL4rJB7emk22t.djOQDkv.3brzpvxYm7mD76etPxjsHtjznB4tUyLYzXFO.6IDvqV7cuVU
 s7YU8V1I5QXnD2RY954jhO_zWBG1FHHEhnmc2lafLzGClMxUD1sSeuRmEUnPzd9UJb1XvnNuPzoR
 HDhGIP5Qbmk9vsiiNBfzez4x4g8KFg3M.G5Uk5n2WX7L_k6B9_ZGCVtrDh348xQOjY1Y_1Cd81b4
 noQswoJiZsryvGYbOrdRyqJAQrn1NxglYFDVVQ8ihsj3JFsAg8idJ57wbS4lW1zJR0z2hwX0D5L8
 Ah9_5UWH5vGNxPLESZLBXSsL8X91UjsCxu6TnFw7uhzNds6_ofPqhWISo6wokWtoHo4s5i_Dd1g1
 pgusS5pHJ1PX8KPBpv1fMxnUGbma5Mq06lphYU_SSXY4i5qCBUK37DNnJIV5AgXDEbpreAvPY5KN
 vR8Tb6Q2yF6axmhLYw2qwsfnAUr0vA_Jzc2pUUzAeDxF6I0UPkjLA7a7yiaDIczakKX6dwdSJ.mG
 58OM_lkjw52d71AdkfrDJUX2MksGHq1K63WSXuFurdzA3S18AlusvV.5PFProfYCIRztn0BDISD2
 Qa0GpFEiFwlzby4x0fgGxV8dJZ7Xq5ugd4xBCV.6.A2dnjy26PjzG0jwSLH9GPjFaJGaVk9uUasX
 Ix6sSXmG_K_jm3KYote_PDn6JLIa0hbq_HNpR__3cjgTP1plr_6Akyd1GFihjkHF_mscqbk6S76Q
 jpIhhLUmyHcsZ.NWMfj678JphFYyxPaOOxLXXAMfL_zhiEjNUJvyW4VexTTgNZ3xy4unuIoacAoJ
 i65ljO1IAGxShzOLanEqKFAMguiVBBN84wbYDBpr0kbG1lU32E1cGTIczqgW2w82DRV0zMHp7_sk
 RkIuj5k_JzxlnN5zNfGNQ27h3I4gVCCP9gOc5wekqRwLV8ifLYRb0bPkd8tD7JmD2LZ4W42b5344
 HsLeoU48IJJDVr0YJZVirumWrxsKvF2I3o7_KXaVyliAP25U_deLjmT.BBE1UONAftNh2kNMOZhG
 ak5IKdiwLyK6_12ip8oazaBJj_0W2q_gqrvjiq4bKG6iI._HycRHunW22uHeF9wvQrk5tc_APutn
 ySnbWQ9ziXxvaBWtboypHwNZUDPR.1KsQgcqJSY2RL3r9XfaUo845YNVfdFuXJRnWkIvdttDKler
 fyJKbvSmeSCJKhNzvxBHRQYh5n.3NYvEikv_TsZJacJhbUnWXZUvXasP37MGyoQ7GLT5da687ovE
 MPDnTVH5iJuFgVqg.nx3oyRUA1nTBGBfvFZYSiKFVAvWHa4stTt3NH3SSaTDdTBWfIGRsYGhkvLA
 dGy3Z7XijAEEDsjVV7IcaVpLVWIbJ5jIIBJ13eYMxWVJ5f4A4lIZrv_SZBpvByB1sfv.DS7gSonq
 1VNOutIuK8hijTa9otiRaFsP5_Q0XVFGUteywvHokJuiKc9VgRr3JHFzTPQ4VicD_5wUtc5IFJ1G
 Whv.16lmZ496l.ekC09_B7nK3cP4JcBG1bvLevBfXuZGDgqGnk69NAcG7XfInLZXd.siTtH_j2Hu
 Um8ryul1Tv18C0USqxm8iwpFTlN8Nnzyfmboy0o0wiQplgRXpa.HUUaRAp_Q1evqftIW2KXhIQd.
 PgvidYsIBtF.XIaFWMsLdcMg1GvBlnp_6PRqwXVoLM2PAqh5VqVkQQTOfaBeMPEn8jtbd6qNLLqP
 0LUJpjXA1La1EIPftMu6oPuaNY5s2vCt4KwXJcivqOm8eJpB7YSB6SjubeIV9IqXdILqqdTIJ5I1
 loXhSfvkPvTocCDcdoz7FvbKaejGqeAjQjG8RIM0v82Pdtw0DCF.8aCwGPn7CiVmUwVA3AB8L30S
 N_n9FCd6TcDBPoK5HwRSX..z0kdfVosVSs6SS2qsrOs3jY06vlXP0PhNz2EG_YmgI7YvRoqKxbY7
 PKcwpvJsXvM7YBuftOiseBjk3I_KzychmFW.f.Ls34I5eM8XzWMW0LfYeBAwTIprJKhvL6V_Vrms
 tgESrkIU7v9UtaRwWh7DKRHDJUDHgqExo6lBS0mqHPrUKy.hVNgkJlB2PDa_Qv4JSP3Rf1VmTgvH
 Fcv96CSp4tjyCAXFkI47vWUo4VCWan1qd7NG.JaBVJ1kVaf_Z0uiLr9CVPVJD6A.o_UxUDqo-
X-Sonic-MF: <ashokemailat@yahoo.com>
X-Sonic-ID: b20f7dc0-ce88-4f67-8215-c25d657d58b6
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.ne1.yahoo.com with HTTP; Fri, 3 May 2024 16:20:25 +0000
Date: Fri, 3 May 2024 16:20:24 +0000 (UTC)
From: Ashok Kumar <ashokemailat@yahoo.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, 
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "outreachy@lists.linux.dev" <outreachy@lists.linux.dev>
Message-ID: <1389558595.6771301.1714753224419@mail.yahoo.com>
In-Reply-To: <c8d24241-1763-f7b7-4491-2e5aa3ea3be@inria.fr>
References: <ZjRDUO6/M+RDCcQJ.ref@c> <ZjRDUO6/M+RDCcQJ@c>
 <c8d24241-1763-f7b7-4491-2e5aa3ea3be@inria.fr>
Subject: Re: [PATCH] staging: fb_tinylcd Alignment to open parenthesis
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.22256 YMailNorrin
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


On Thursday, May 2, 2024 at 11:54:58 PM PDT, Julia Lawall <julia.lawall@inr=
ia.fr> wrote:=20







On Thu, 2 May 2024, Ashok Kumar wrote:

> Corrected coding style CHECK: Alignment should match open parenthesis

Ashok, I think the code is nicer as is, because it has all the constant
numbers lined up.

julia

Thanks for the update I will ignore this change.=C2=A0

Is there a list of exceptions to the checkpatch information that we can ign=
ore in general.


>
> Signed-off-by: Ashok Kumar <ashokemailat@yahoo.com>
> ---
>=C2=A0 drivers/staging/fbtft/fb_tinylcd.c | 2 +-
>=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/f=
b_tinylcd.c
> index 9469248f2c50..60cda57bcb33 100644
> --- a/drivers/staging/fbtft/fb_tinylcd.c
> +++ b/drivers/staging/fbtft/fb_tinylcd.c
> @@ -38,7 +38,7 @@ static int init_display(struct fbtft_par *par)
>=C2=A0 =C2=A0=C2=A0=C2=A0 write_reg(par, 0xE5, 0x00);
>=C2=A0 =C2=A0=C2=A0=C2=A0 write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
>=C2=A0 =C2=A0=C2=A0=C2=A0 write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x0=
0, 0x00,
> -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00, 0x35, 0=
x33, 0x00, 0x00, 0x00);
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 0x00, 0x35, 0x33, 0x00, 0x0=
0, 0x00);
>=C2=A0 =C2=A0=C2=A0=C2=A0 write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
>=C2=A0 =C2=A0=C2=A0=C2=A0 write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
>=C2=A0 =C2=A0=C2=A0=C2=A0 udelay(250);
> --
> 2.34.1
>
>
>
