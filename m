Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AE9A78686
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 04:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A86010E07E;
	Wed,  2 Apr 2025 02:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=verizon.net header.i=@verizon.net header.b="jJ+LSDUz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic309-15.consmr.mail.bf2.yahoo.com
 (sonic309-15.consmr.mail.bf2.yahoo.com [74.6.129.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6A210E07E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 02:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verizon.net; s=a2048;
 t=1743561897; bh=6xZA5dEAxSEuEyfDTQc4tMXYDO6J8DFJKAPKzbaCXWE=;
 h=From:To:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=jJ+LSDUzmyINoukQY+B+iDCtLj3p+1Q2otDMdUUCNlcJ5BimWY3Ong81Y7FjWazDXGsu4RS1RtV3Xbc03j2p4pxdMdQgnqhlaSODIIkX46L+l+Pb1iWtIRu3OzWYH47sFHZukFub8RH4CLFoBBlinWfMyh4Fs24n5DX2e+CjnV9ILkpp2IoEEsSzgC0mWMbMm3QnVcyLPFgHzRWcQAR40kusgyMcs973uaBd/+gr8atuDqzpMQ5dtyMUmfaUHrTlSDbfSCHyiQvZrBzYX8sVzN6kH8JC2IkhXx5yMdQbG8NOxXnnB3CWIiGsEuCV/S0KGHmxSR5ww7zzq7s6zW43BQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1743561897; bh=AhnQKIr+LTAhiw4MtWnF99pPWBs1UV2+1kgs0dg05sm=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=Okyl754ljWPVrdfcvgV9OpqKUyTBxdXbvH387L0/NBhl9VbN5mqqlQ687qc63Rlz+LNnwFLdq8vlkcJfIgSOOpN09chXCKpQ5kTgg0g3yAsPBFHM2LjLAWY0OhKcQVdLwyJ25N7SC73ZZPDvU6KzlcNO/Ake53VSkZA0QKwvxQUGkZV08IDuQZIrWqDsjMeRo7On59Dj+u1xgEUuPG0M6ySZ9RCGbHZ+dhHY2NAUKvO/fK/PISvJruM/dynUj0Q6hjQVhpBRNWVqS7kiIXwg6haMlXUW2j8oYR2+pnxpEuxo8+s09HWnq8xqnBuyrJO8xfdL2sC4/q82+NGOnXzGLA==
X-YMail-OSG: sMQur6YVM1kUbyeRx9g_o.gzyQS2xxB05r2TapohyjB.4JiKrYIWGyiXtJsRlht
 oyS40Yn6F420YNUzN58WkwZzGNvdOdFt1RtyrvTPfMKuePW.TL_sdDbu9KYkhcW3Nnl9XOmYUdU6
 mgAPkmF3BQaM1mLY7C9x2o3N7I0.ArD63Wy3LcLpwSa2khHngU9vdpxM0FEv.qszvsIN6J9nmr9q
 FZWqrX6HV3FoDfg3eYtN2E25c0zZZBmALT67nowkRuRjPNHQyZTso3pXQT5O89v6WqSGM3pZXrFu
 WXKMXhfxYhOHWPFgQ10MG1SNH6Revxw4kGz7c2YJfX0ZrPGrKpL7l8wsYF9uOqL_OorUxA.JiGgV
 322XVPkxi9jv38JxegJU7QBxZJzUdwyyRC7F5Tsw6gHBF_tJQL9K1MeU_2SszTsNXmqgKnp_Nvtf
 DLfc7tCIfluhNeY9lxOArdJN7lNlGEEf4dk1QzY4XJHfoBmrMLMuqeI7sC0oWloVsjT5exYL3h2P
 cdUSQCUrDG89zyXvlBb3Rf8yKXj0Ls1D.bY2US6Gdw1xS9XcrHkNVKhZbNM8d38NXweE1_2mfwoj
 G43BJ_aN4NA7UORy9DZsuYEE6l9W2e5ABITjmI._CTAUBHIEVf5mfuydV0a9Z_RztdhLcm9wWI1f
 aJcCdsaSdeoc6DEZUJyYZmU7htW32EGqbqfThgqNf7lPWEIuZE4Is7sSwnjUWxSIGXs.l3nBw9r_
 UpB7WtWV3gwTZ9MUMpbnDfHoaCDuZ6cmH2UtM21zGQkPsWPOhFxRA6gSBd_UsZchfITn0ob7c51X
 PLEsEa_BCLdsqX8PMliKG94oZeDIb5Ev40D1waNf4ej4i90q.KBn.hlSpieP9mMPT50IjxPdo2BE
 KocokNhzHCn29zIe31n2LePdyFk7VzBlbcQKZhJjag.mueERh56c41HoaTSEYaYqfc5HiG_1l60U
 jIEoiz0jUMH0g4PzGFoa5eVQZyynKXEBggrcVb8jq6YD_zOf92qJwM5_nnq02fOaap1jpJMjKNKK
 Vwsf8F5K7nW5u9Xw24JZUuvwKSNAKn9ZTPls9JV6jpwhC4A2yQIl5aQp4ChWVyYm36jPB9IEvpJQ
 TH.wAbXN0hxXDikQIAmRJRHyU5OalP4hnST_ZBWTK61YHVHnHy6coVERjkgkaXCntU1yPfS5D7mg
 _inQIm9dZ3VrOwDmuxWA7r.48qoJmOEo1Tj767J795YLkSn9yiymIBaKJrHN.nJWlMXLwIh0sU48
 XhhF5a6smOZfMSg3cREC.MKTjv3.ZP5Ec5iCdnsh7xE3PoZtYg_Z5XrIqxsIjrqWhy.isDJfGENW
 3wqFLe3xzBJy4bfbgD8V01GmvzmRcx6zkZivplBuKz6f3250rzoIUT2R35t3m.n84lZTdq8JmXBH
 vpWgJYtxQ4ruMVamAwjTiXjIK44lSIWcq_lLgnyIuNJ09lKlUuvryNSW963CM3frWBe_r.J2CqJC
 NKyH_BMGRcRV1YatBirZLHRkVGs9Vp_amRoigjKC5EMXS2dgxeNFGCv3g5MO2oodvtjfsUstObRI
 EyYaCAzEl4rd6E6TpsJwew788R.VT.JDI_lhT1ZleIgb8wu4PIEctf48UHG0MqAkTm7XwadDX.NE
 4i_SA5VgkEZy54O0fl7vzxsNc7rHc0E1iNd5A6kC1vdG67h3hRUUK7aJxEIBHXpen7zEg4YHVXZS
 ULT7q._eQ2.dCUn8ZBU2.f.r1d5sB4rQn8kTPh5clV0ePyHvhoTO6rFUozSIHR5vQugu.GTzexvd
 rZIakqNbsa750vMQalZYusXsU_meIGydd76S4t8xc6F0T4uAwXtoxEmObkeoGK9UTCksFnUEra8U
 HTR6pebW_IRzkpIBdFhAOHOl2nZwR5GWWJVmRX4GK0rg8GGqukms4oHVmhkSdveyu1skno1ni2xq
 .PQrAudpQLsm1gwdZ9Y5Yj_RSn5lDWmo0sUVs4BBl.K87t5NawWH2Gc.OrkpOCeDhQ.AV68bIIi5
 0ukf5rykFChEaWgM2bbyAw7vlemAAHufh0t0.2Y2LNSvuRuHuIjYP7meguaOS3LH7DBrw9zfjUvf
 0ad1xlfqb8Y6fI8_sRsMjhcodRfhe6N5a2CbiUpifwgUVxy.j4qgbe5LfAFnd5KFbd6G8LWGSx1D
 0yhUZ5__RruIl8nf73VUM6lNi9_datpshDKp.WACiCXMCCzeLjSQjg2B.MmVaZZY31wkGcoGL_Sc
 H1tWpIw3cFOJ0Oil08Lgcxv1HMw3zY.YN4JNlDS4lyxEl7H5rTbBOb.lhwQ--
X-Sonic-MF: <bluescreen_avenger@verizon.net>
X-Sonic-ID: c0939ea0-bb57-4890-9f2f-87d32f393959
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.bf2.yahoo.com with HTTP; Wed, 2 Apr 2025 02:44:57 +0000
Received: by hermes--production-bf1-745f8664bc-h7cm6 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID a34d9a53ec98689f25e484add225fcbc; 
 Wed, 02 Apr 2025 02:44:55 +0000 (UTC)
From: nerdopolis <bluescreen_avenger@verizon.net>
To: javierm@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/18] drm: Provide helpers for system framebuffers and add
 efidrm/vesadrm
Date: Tue, 01 Apr 2025 22:44:55 -0400
Message-ID: <13593223.nUPlyArG6x@nerdopolis2>
In-Reply-To: <a39065a1-cf81-4605-bb7d-5c4ffe7a8e96@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <7990728.29KlJPOoH8@nerdopolis2>
 <a39065a1-cf81-4605-bb7d-5c4ffe7a8e96@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Mailer: WebService/1.1.23590
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

On Monday, March 31, 2025 9:39:26 AM EDT Thomas Zimmermann wrote:
> Hi
> 
> Am 19.03.25 um 13:50 schrieb nerdopolis:
> [...]
> > FYI When this gets merged,
> > https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/hw/xfree86/common/xf86platformBus.c?ref_type=heads#L589
> > might need to be updated to add exceptions for vesadrm and efidrm like there
> > is for simpledrm.
> > I am willing to open a merge request, but freedesktop is readonly for now
> > during their migration.
> 
> I've sent out an MR with this update.
> 
> Best regards
> Thomas
> 
Sweet thanks, Yeah I noticed you were the one that added in those other two
drivers as well in the workaround list, but only after I sent that message.
I should have checked the commit log. Sorry about the unneeded reminder, as
you were obviously already aware that it needs those workarounds
> >
> >
> >
> 
> 




