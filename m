Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3DA6A9221
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 09:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCE810E60F;
	Fri,  3 Mar 2023 08:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8906310E60B;
 Fri,  3 Mar 2023 08:06:23 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id kb15so1746069pjb.1;
 Fri, 03 Mar 2023 00:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677830783;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2GNgFypKn/0hc5Isav8O5f3I0hf4LLGb3YNTok/vC30=;
 b=Ux8u3jgY4xPsXvtIDLngtm6THaaqQKr8ISSap3TtA42a9SIGaO7kOXmvJtURJTC7eU
 ucpvgT3jdlM5QrvkTUaWCkj/ksmrJtpcp9sbpGb25MGQQ32ucJSJtaVBUnV+zGoSaOMU
 qdLfegpB4yjaX0JZE+a+Ke4gCVS00j3fmQAIoEX0OkimEozc3WaldkliB+2TfcxlD/TT
 b1fXh0LRXeaC/PKaECznitkJj4H8qUzZ4i9RWNUGCTUQlOhPhueSOEs86QjHHAwn6oop
 NLMCDRiHxdXEHxN40O9Km1m23oE3XntsDCWjxh7Z1Do6zWaNmt3DTnOnd6rJ7BKJj0+K
 qRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677830783;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2GNgFypKn/0hc5Isav8O5f3I0hf4LLGb3YNTok/vC30=;
 b=3VpifyugzWEEmhoe1N7OyTq7bqqDh2Zpd06P73klEKkB7rGLgoxWlXKSWRFlLAkEFV
 YO/VuaXP1kr5JFeVzjiH6HMidTGfEpNEtYyFSDbJA96SqFlq/q8H7+0SDPcZZ6KPNS6i
 6J7h3MLtI40v266iZciqerTqqs1MqeBYAc2Wa6nHbtUaAFsSvpWpJ0yr0DY9h+z0K8nC
 csg/fZyTBjfy58RWWeL1jI7KtXG23HrPMjYaFMMLNKvNYHFBuQ8XkcdV+gpQcIR7hve5
 UFWdhlRAGuB25Fu8qdbU0j/fUHaUDBW6NtOFJamWkCgP610S9f3Z4YEwvdPFfGTb5JTC
 6q7A==
X-Gm-Message-State: AO0yUKUUXw4JpUNU8dlvKs4kV2KJctAbDcOHm50cF+abmBGFqjg2zZac
 s19Z5gQuA4onzQhkB8wliL0=
X-Google-Smtp-Source: AK7set/y0ZWmbann7eE3oSNJgm0cy1BGxnKo48BhulCfaGdm1imER6hOYVoRuA6vUXdoT5U9GtHDhw==
X-Received: by 2002:a05:6a20:8c97:b0:c7:5cb6:2ff7 with SMTP id
 k23-20020a056a208c9700b000c75cb62ff7mr1397114pzh.22.1677830782975; 
 Fri, 03 Mar 2023 00:06:22 -0800 (PST)
Received: from debian.me (subs32-116-206-28-31.three.co.id. [116.206.28.31])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a634407000000b005038291e5cbsm918858pga.35.2023.03.03.00.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:06:22 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
 id 267F1106180; Fri,  3 Mar 2023 15:06:18 +0700 (WIB)
Date: Fri, 3 Mar 2023 15:06:18 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
 Intel GFX Mailing List <intel-gfx@lists.freedesktop.org>
Subject: Re: Linux 6.2.1 hits a display driver bug (list_del corruption,
 ffff88811b4af298->next is NULL)
Message-ID: <ZAGqet3U8AMm4Uf1@debian.me>
References: <6feae796-db3f-1135-a607-cfefb0259788@gnuweeb.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SfEzHmcCPaMIkdPc"
Content-Disposition: inline
In-Reply-To: <6feae796-db3f-1135-a607-cfefb0259788@gnuweeb.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--SfEzHmcCPaMIkdPc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2023 at 03:46:56AM +0700, Ammar Faizi wrote:
> Hi,
>=20
> Linux 6.2.1 hits a display driver bug (list_del corruption, ffff88811b4af=
298->next is NULL).
>=20
> Unfortunately, I don't know the last good commit and the first bad commit.

Can you please try v6.1?

--=20
An old man doll... just what I always wanted! - Clara

--SfEzHmcCPaMIkdPc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZAGqdAAKCRD2uYlJVVFO
o6tYAPsHUCjEZzvaAnu5vqweP64uXu3vAHJpeX3chmv8QC747QD9FtDdYRCRW/a6
ed37mcnX36rkPmyFZayYgbJln2MDjgg=
=8ymv
-----END PGP SIGNATURE-----

--SfEzHmcCPaMIkdPc--
