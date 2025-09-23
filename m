Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30836B9546F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B06810E3AD;
	Tue, 23 Sep 2025 09:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="Pdtkq7QF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic308-54.consmr.mail.gq1.yahoo.com
 (sonic308-54.consmr.mail.gq1.yahoo.com [98.137.68.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8565F10E3AD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1758620289; bh=i/JkHt1ifQgSIgiBIhpJlMuTHUzyhCx7VIPvnsPszlg=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=Pdtkq7QFru32r+TVxefNIvLAQu9wFqGZZOKsxBIFSUM+hZQLyFp/8FHlV5/XYazZdTMCYWQRizpk/2X31wza4g8f7qpA8flIDmnnoSl3/XhKnE4cjj1/txqQuKdL/IzErWTH2lagW7ihXp9nNMPdhAtBkCiJtbWgRcWVSTFYsuooTRjetpr6jPornnDZalQOwxRoD5H8p3H/10LiTdAU9JapiCyg8KK+JFEC7RBYdTIy4gPio0+u7ghCeg5awi9en+8nzNrVNuItvNAdNo5LWouUQSq2FUlWZm6gfOdXno8juofrjfKnp0S24DSi7E6JwwXUn7STIEg9KfEilCdPSg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1758620289; bh=MSDvzCB3TGUrTSf9feK2NVOv0QHfulqSszg9XZWpKvK=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=OCWjefJvrLlL1OglnAwBwvwOPb+z/pJpY+D9QaS3rjbzAJ9g1oC7In3QLqjjTx1sWirMtKKG5aTuGRTrgtHnrtJm4kZr89GRlZ+vVGXx7Tyv8/9YiSbcnBT4l5OASAW3UrXWxkTWU6FkXiPUrvr9q8QX/8uTDGcOd3Cy7/Yu7cQvE9zVdOfGzzSlkjYa158l6yyREnae4yxtbuJP4hnD2VWITawLWv/gOGET5Zi2WdjcI2XwdY5GRfdm5l5Et90Smi8NZegunS2FlnNhdk+pgukJsiN+IGco7g+Rjfidm9IaIrM5ptp1GzYkeCWPzj4Ra381H2EnVkeLHVvjVzTPgg==
X-YMail-OSG: 6r4yxZ8VM1kDtKln9tqtbbvwmJ4QlPpaRhmNTWbAZXLcK1eu0jjmlq.iUtcaK8p
 SsPOcQuJoJczYGr9Cha.vp5aAy3ZxL2nVriqE26mmIUymNBw4JvQNWafUfpXHYEWsRUca5dNF_QK
 9XAHuPwQx5fTTMTI3_jB6XjRMGIsmHiFQsqY1eAk1.bUoFpbAHocskIEmsWDKtpPZZ.1cuy6tBbN
 Ji.1aQU1rfqjTPboaMg8m6T.pSFul9m_oHHXMCuK1YyVdoHPoQk9Mrcu1smpIxQ1WUherqv64JCV
 Z5KBPcjOJm9mE2vH4AunF_NKdpwB3W0KPDlXHMzihthRm7fkdkIHic991IhkNRrDu4kUbDtEl7Sq
 cPbyyVemliu51Prs2yvt4sL5xqHRPTo964mRJfj7vfhE7BStCSZnO2OgO6KTGmlXWYs649u8p_Gf
 eDZJL.z5VHQiIGFUv_lAuiulIVPW332F8Cy8nu_KvKGAkssgzRLfJ1Bepa4hZ6PkoKBaA5vT3lhW
 9UUwrbjJNZxCmgwKXhLbH79ylC1qxBRldWI_T5kQYvzxwp8AWIrmeZe2qXagBpyrZm3faoZsL35S
 Zz_2tprtP0wZV1DvkNwtosYGIUNDaxYprZ4PLOPN9bzcAjor1w5_D3XYKCobok4Z9J89TGgsvQdE
 1k0jNrvt1ha1yAmOzDAbo6y3CZC2vbobmMW7kRrY4JumjqO9Jmp1HOFODGyLiHKIlgbCQnzHRsh1
 G_rCNPQfxy.6SARYp8NyqSVfU5BcvAE8THe8_Qtr1G5KKVQu1l4gIh3sushNNCJBoSIRDQATu9GP
 YYi.Z79TwGyL1U87VVaIATe.jFSrpO4oNSrZzhOrBrwoGo6fXqY2RU3zKWsTDcXymWDU4wmy.gqg
 Vr5WvdAGvTA20nHzi5VD.t_gVMiYy_cMoGrkexevHR6RQOc2DsTMxvLWuZbapF5yH9..qXbJU5k8
 KuLfrtNknmd11sQPJFZBTpJUVVmjwempNxKPV1I_q2jBcrXWgxSfG05tEsKXLN_h6rQ2.Cz8LgXX
 ggpONaRgNOJGfhLAPxwDHFvxSJTHZsvpz73OdrT2N6TY27UNTGCnX5NVr_Vu4h6SthfvulQmHRut
 t5.18rNezpaouyayfY.EnEimWZ.7xWKvQ2Iy72rOtLIdjXacI8HncR2Vh_LCF_H3Rv7RJdWSYggA
 Z8J9IjntE0q.9Z5jcZl.Mh59GmJnQX.phaxPqPVkuURMju.T881VoJ4lXuPKveuNf8RKfi7_wW7M
 w2si4_dYoFrAwHqCOEhZlmNk0QW00W0S83pD.SVidAgs9WfPDb94XR755lxewEn25W0ml5sQ_iW9
 7eJm8_Si5VbP7RTaCafurw9xNBdT2kIPHr1iv2yDADPYtuA.7wNvfw3xePj7UOp1D_Htq02gJkO4
 ex7YLd9FPtv8RO6vyVjdDr_ZEItat1MDZhJyGb.c20YPrSnfPgdyuhoNSv1D5HLeCtT0tVcwcQNj
 JvBJrijLpYrEfMpdFR6zflnCqRziDLvmT0Mm_FbouEMTmUqqqo7n81qIEd1QyBmIGRq2haPp1szO
 3al6DvhsNTOI2n_7n01oEfXHZwKpCTcP5M_EFnfuErRFXi1LEDqa0ahlI8ZuCrHPe7SWw4_YC3MH
 r1hgnAUP5YjEC.K5VeTXr0IuAG_jh04i0WRqb9jh.zr7RJzkqsYxogdmRXhGk9nSCp_jHw35Z_Zz
 DiAymKVF8MT6A.JGU7xM55GIzzHNdOs6HYQ4zFee6h2typLP4FaaAPvcM0y3SvikaCuhBj1g7PPP
 ymbCxOTzezqnl3o950cTfboyWwLU7IeBuq3Lu8NTXa_zdz6gFmM65jYwJRGDC7I79aylCILQHlr4
 Ty._0YWFUy54AMzHAAKhH8SKTshHCE3qPZ7AY.NjSdXTbKH4TL0HOBXBPVi_TPUinLohs7pxbniB
 EUS3HYwy8lv5PeJN7uTE0PilZ.bEHa_h5LWT3uc2mMHw_n2AvCqZSYZFlxRS1aAJamCGTIVRKj9I
 z57XnY83zmEClnqVscKjXnLAgNBVfa9sqlkjytnyoHq2uSziam.5ooXj5H9.vfQKb6b5osRz2t.N
 e8JGQIomy0GRiQTiHuSz7fLpt5mZ92K90k9FTs_8BQxXv3UtuBTffJm8QtwKsnnJRwrLcdsdms7l
 62osUoFio_tu.iMCSd4KesKdpq71Um1unrSaDOB_I.UqGJMYtKTnIP300aELqW25BlZFjsjSM9kh
 e0RbmrfOA_qmvBlIxBg--
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 1e1e5ad4-a8c9-4f36-9c23-3e7ab320e928
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Tue, 23 Sep 2025 09:38:09 +0000
Received: by hermes--production-ir2-74585cff4f-wj49j (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 56b981eec5e43184558809b98bba93d9; 
 Tue, 23 Sep 2025 09:38:06 +0000 (UTC)
Message-ID: <9625a9e34aee0157e57ca5b6a6bfeeeceba5ed38.camel@aol.com>
Subject: Re: [PATCH] drm/gud: fix accidentally deleted IS_ERR() check
From: Ruben Wauters <rubenru09@aol.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, lkp@intel.com, 
 oe-kbuild@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 23 Sep 2025 10:38:03 +0100
In-Reply-To: <a8e2ce0c-0aed-41b6-9856-acf62f60551b@suse.de>
References: <20250922173836.5608-1-rubenru09.ref@aol.com>
 <20250922173836.5608-1-rubenru09@aol.com>
 <a8e2ce0c-0aed-41b6-9856-acf62f60551b@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Mailer: WebService/1.1.24425
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
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

On Tue, 2025-09-23 at 09:57 +0200, Thomas Zimmermann wrote:
> FYI I got the following warnings. I'll fix them when I merge the
> patch.
>=20
> -:6: ERROR:GIT_COMMIT_ID: Please use git commit description style=20
> 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit
> 2d2f1dc74cfb=20
> ("drm: gud: replace WARN_ON/WARN_ON_ONCE with drm versions")'
> #6:
> During conversion of WARN_ON_ONCE to drm_WARN_ON_ONCE in commit

I'm not 100% sure why it's complaining about this one, the format
matches. I assume it's a problem with the line break in it? but I'm not
100% sure.

> -:15: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be
> immediately=20
> followed by Closes: with a URL to the report
> #15:
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>

I believe it's intentional to have two reported bys in a row, as both
of them are followed by a Closes tag at the end.

Thanks

> Am 22.09.25 um 19:32 schrieb Ruben Wauters:
> > During conversion of WARN_ON_ONCE to drm_WARN_ON_ONCE in commit
> > 2d2f1dc74cfb ("drm: gud: replace WARN_ON/WARN_ON_ONCE with drm
> > versions"), the IS_ERR check was accidentally removed, breaking the
> > gud_connector_add_properties() function, as any valid pointer in
> > state_val would produce an error.
> >=20
> > The warning was reported by kernel test robot, and is fixed in this
> > patch.
> >=20
> > Fixes: 2d2f1dc74cfb ("drm: gud: replace WARN_ON/WARN_ON_ONCE with
> > drm versions")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes:
> > https://lore.kernel.org/r/202509212215.c8v3RKmL-lkp@intel.com/
> > Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> > ---
> > =C2=A0 drivers/gpu/drm/gud/gud_connector.c | 2 +-
> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/gud/gud_connector.c
> > b/drivers/gpu/drm/gud/gud_connector.c
> > index 62e349b06dbe..1726a3fadff8 100644
> > --- a/drivers/gpu/drm/gud/gud_connector.c
> > +++ b/drivers/gpu/drm/gud/gud_connector.c
> > @@ -593,7 +593,7 @@ int gud_connector_fill_properties(struct
> > drm_connector_state *connector_state,
> > =C2=A0=C2=A0			unsigned int *state_val;
> > =C2=A0=20
> > =C2=A0=C2=A0			state_val =3D
> > gud_connector_tv_state_val(prop, &connector_state->tv);
> > -			if (drm_WARN_ON_ONCE(connector_state-
> > >connector->dev, state_val))
> > +			if (drm_WARN_ON_ONCE(connector_state-
> > >connector->dev, IS_ERR(state_val)))
> > =C2=A0=C2=A0				return PTR_ERR(state_val);
> > =C2=A0=20
> > =C2=A0=C2=A0			val =3D *state_val;
