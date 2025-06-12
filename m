Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A39AD6AE4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 10:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5120010E76C;
	Thu, 12 Jun 2025 08:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [91.218.175.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755AD10E76C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 08:33:32 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1749717208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=swmlZMJH09cFUofPvWeB6ZnlWtkBql9sNt4rq78/05Y=;
 b=U5Nexlz7hLsJC9DMK0hOtFaxm+jU4zSUkXv17LcuCFzXLfKxlhuvUShTbvb/v12C5lDEX9
 MFKmVzE+5zGhGpuy9HESTXB0MZbNIiO8zX1Og0desHox++3MtJEhnk/F8Wj2jwY5ZEUgWp
 zYtzC8OZ3g+KE9SWdRX6dhsrkXMjABmHygDScAuiapStwQfgzuTRHGlLiAW5fGtBcvdq82
 v9kBdvBGXCK2MbgkFQRPQTJ0E/iKfKnPMlTAv69gneUlqjkh5+juDYn4qkdf9yeuwx9hBX
 J+DBCBlPJzBZvnFluQ3SijOLxCuTnLJneeulxhyrY4x7BhkBHdP3VBQNujaWqg==
Content-Type: multipart/signed;
 boundary=0170c55d779959132851b9c3f3ea4d566a91cf78513dc7a38a145c7e7688;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 12 Jun 2025 10:33:18 +0200
Message-Id: <DAKEZCDSGTEU.3M0D171ZZS8JE@cknow.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Andy Yan" <andyshrk@163.com>
Cc: "Piotr Zalewski" <pZ010001011111@proton.me>, <hjc@rock-chips.com>,
 <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, "Dang Huynh"
 <danct12@riseup.net>, <dri-devel@lists.freedesktop.org>,
 <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH drm-misc-next] rockchip/drm: vop2: don't check
 color_mgmt_changed in atomic_enable
References: <20241206192013.342692-3-pZ010001011111@proton.me>
 <DAEVDSTMWI1E.J454VZN0R9MA@cknow.org>
 <mArHDRo5bhIAjG8sDOR-kM7DsVdbXxxcC8hfuEEPfUWIdMwNnSUy8ZFoLis66DFSuIEq8TrnAxUGkyo5IUTGw3AG4k3vuVVz0fsoI27BAms=@proton.me>
 <DAH3S8O66J47.3NT18EJCXWKL9@cknow.org>
 <47773829.1fce.1974f732545.Coremail.andyshrk@163.com>
 <DAH60H3HYG7M.3NFXBJ7576RH1@cknow.org>
 <3161fa6a.93d0.19753f8c5e0.Coremail.andyshrk@163.com>
 <DAI0A1Y753FJ.B0NMT8L5VPEH@cknow.org>
 <4b380a57.8ab2.197591815a8.Coremail.andyshrk@163.com>
 <DAISW8MXEU0G.3AMRSKNYQUJY8@cknow.org>
 <4e600374.6dc7.1975df03a2d.Coremail.andyshrk@163.com>
 <DAJNEG81JCU5.35KVU8KAT5MDU@cknow.org>
 <b25ddc.a29c.1975eea8033.Coremail.andyshrk@163.com>
 <DAJPBG7GPPH2.3BDCMH0U3FU0E@cknow.org>
 <562b38e5.a496.1975f09f983.Coremail.andyshrk@163.com>
In-Reply-To: <562b38e5.a496.1975f09f983.Coremail.andyshrk@163.com>
X-Migadu-Flow: FLOW_OUT
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

--0170c55d779959132851b9c3f3ea4d566a91cf78513dc7a38a145c7e7688
Content-Type: multipart/mixed;
 boundary=41f2c4a24b6ad542ac2997287897e3366741717150c20a9ed2e8c2e83a21

--41f2c4a24b6ad542ac2997287897e3366741717150c20a9ed2e8c2e83a21
Content-Type: multipart/alternative;
 boundary=cc296c4bb25d5a36aefbf12d26ad1335f5aa1d404b3ab254bc0b53874da2

--cc296c4bb25d5a36aefbf12d26ad1335f5aa1d404b3ab254bc0b53874da2
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Content-Type: text/plain; charset=UTF-8

Hi Andy,

On Wed Jun 11, 2025 at 2:49 PM CEST, Andy Yan wrote:
> The root case for the problem is now clear=E3=80=82

\o/

> ...
>
> Actually, there is another question. I still haven't figured out why
> this problem doesn't occur when compiling rockchipdrm=3Dy .=20

Thus far I had compiled all my kernels with this:

```sh
make clean
cp ../config-6.14-arm64-cknow .config
scripts/config --enable LOCALVERSION_AUTO
scripts/config --enable DEBUG_INFO_NONE
scripts/config --disable DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
make oldconfig
time make -j `nproc` bindeb-pkg
```

And with ``make oldconfig`` I accepted all the defaults (during
git bisect I did say 'y' to a new Rockchip related setting)

Wanting to see ``DRM_ROCKCHIP=3Dy`` for myself, I added

```sh
scripts/config --enable DRM_ROCKCHIP
scripts/config --enable DRM
```

before ``make oldconfig`` and built a new kernel.
I can confirm I'm seeing it work now too.
Attached you'll find the ``.config`` diff between the 2 builds.

HTH,
  Diederik

--cc296c4bb25d5a36aefbf12d26ad1335f5aa1d404b3ab254bc0b53874da2--

--41f2c4a24b6ad542ac2997287897e3366741717150c20a9ed2e8c2e83a21
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename=kernel-config-diff-with-drm_rockchip-y.diff
Content-Type: text/x-patch; charset=utf-8;
 name=kernel-config-diff-with-drm_rockchip-y.diff

cm9vdEBwdDItc2NtaTovYm9vdCMgZGlmZiAtdSBjb25maWctNi4xNC4wLXJjMS0wMDAwMS1nZmJl
MTdkOWI3N2IwIGNvbmZpZy02LjE0LjAtcmMxLTAwMDAyLWdiYzg1ZmEzZGVjNjggCi0tLSBjb25m
aWctNi4xNC4wLXJjMS0wMDAwMS1nZmJlMTdkOWI3N2IwICAgICAgIDIwMjUtMDYtMDkgMTE6NDc6
MDkuMDAwMDAwMDAwICswMjAwCisrKyBjb25maWctNi4xNC4wLXJjMS0wMDAwMi1nYmM4NWZhM2Rl
YzY4ICAgICAgIDIwMjUtMDYtMTEgMTg6NDM6MjQuMDAwMDAwMDAwICswMjAwCkBAIC02MTkzLDEz
ICs2MTkzLDEyIEBACiBDT05GSUdfUkNfQVRJX1JFTU9URT1tCiBDT05GSUdfUkNfTE9PUEJBQ0s9
bQogIyBDT05GSUdfUkNfWEJPWF9EVkQgaXMgbm90IHNldAotQ09ORklHX0NFQ19DT1JFPW0KK0NP
TkZJR19DRUNfQ09SRT15CiBDT05GSUdfQ0VDX05PVElGSUVSPXkKIAogIwogIyBDRUMgc3VwcG9y
dAogIwotQ09ORklHX01FRElBX0NFQ19SQz15CiBDT05GSUdfTUVESUFfQ0VDX1NVUFBPUlQ9eQog
IyBDT05GSUdfQ0VDX0NINzMyMiBpcyBub3Qgc2V0CiAjIENPTkZJR19DRUNfQ1JPU19FQyBpcyBu
b3Qgc2V0CkBAIC03MTg1LDE2ICs3MTg0LDE2IEBACiBDT05GSUdfVEVHUkFfSE9TVDFYX0NPTlRF
WFRfQlVTPXkKIENPTkZJR19URUdSQV9IT1NUMVg9bQogQ09ORklHX1RFR1JBX0hPU1QxWF9GSVJF
V0FMTD15Ci1DT05GSUdfRFJNPW0KK0NPTkZJR19EUk09eQogQ09ORklHX0RSTV9NSVBJX0RTST15
CiAjIENPTkZJR19EUk1fREVCVUdfTU0gaXMgbm90IHNldAotQ09ORklHX0RSTV9LTVNfSEVMUEVS
PW0KK0NPTkZJR19EUk1fS01TX0hFTFBFUj15CiAjIENPTkZJR19EUk1fUEFOSUMgaXMgbm90IHNl
dAogIyBDT05GSUdfRFJNX0RFQlVHX0RQX01TVF9UT1BPTE9HWV9SRUZTIGlzIG5vdCBzZXQKICMg
Q09ORklHX0RSTV9ERUJVR19NT0RFU0VUX0xPQ0sgaXMgbm90IHNldAogQ09ORklHX0RSTV9DTElF
TlQ9eQotQ09ORklHX0RSTV9DTElFTlRfTElCPW0KLUNPTkZJR19EUk1fQ0xJRU5UX1NFTEVDVElP
Tj1tCitDT05GSUdfRFJNX0NMSUVOVF9MSUI9eQorQ09ORklHX0RSTV9DTElFTlRfU0VMRUNUSU9O
PXkKIENPTkZJR19EUk1fQ0xJRU5UX1NFVFVQPXkKIAogIwpAQCAtNzIxMCw3ICs3MjA5LDcgQEAK
IAogQ09ORklHX0RSTV9MT0FEX0VESURfRklSTVdBUkU9eQogQ09ORklHX0RSTV9ESVNQTEFZX0RQ
X0FVWF9CVVM9bQotQ09ORklHX0RSTV9ESVNQTEFZX0hFTFBFUj1tCitDT05GSUdfRFJNX0RJU1BM
QVlfSEVMUEVSPXkKIENPTkZJR19EUk1fQlJJREdFX0NPTk5FQ1RPUj15CiAjIENPTkZJR19EUk1f
RElTUExBWV9EUF9BVVhfQ0VDIGlzIG5vdCBzZXQKIENPTkZJR19EUk1fRElTUExBWV9EUF9BVVhf
Q0hBUkRFVj15CkBAIC03MjI2LDcgKzcyMjUsNyBAQAogQ09ORklHX0RSTV9CVUREWT1tCiBDT05G
SUdfRFJNX1ZSQU1fSEVMUEVSPW0KIENPTkZJR19EUk1fVFRNX0hFTFBFUj1tCi1DT05GSUdfRFJN
X0dFTV9ETUFfSEVMUEVSPW0KK0NPTkZJR19EUk1fR0VNX0RNQV9IRUxQRVI9eQogQ09ORklHX0RS
TV9HRU1fU0hNRU1fSEVMUEVSPW0KIENPTkZJR19EUk1fU1VCQUxMT0NfSEVMUEVSPW0KIENPTkZJ
R19EUk1fU0NIRUQ9bQpAQCAtNzMxNyw3ICs3MzE2LDcgQEAKIENPTkZJR19EUk1fVkdFTT1tCiAj
IENPTkZJR19EUk1fVktNUyBpcyBub3Qgc2V0CiAjIENPTkZJR19EUk1fRVhZTk9TIGlzIG5vdCBz
ZXQKLUNPTkZJR19EUk1fUk9DS0NISVA9bQorQ09ORklHX0RSTV9ST0NLQ0hJUD15CiBDT05GSUdf
Uk9DS0NISVBfVk9QPXkKIENPTkZJR19ST0NLQ0hJUF9WT1AyPXkKIENPTkZJR19ST0NLQ0hJUF9B
TkFMT0dJWF9EUD15CkBAIC03NTIwLDcgKzc1MTksNyBAQAogIyBDT05GSUdfRFJNX1RJX1RQRDEy
UzAxNSBpcyBub3Qgc2V0CiBDT05GSUdfRFJNX0FOQUxPR0lYX0FOWDYzNDU9bQogIyBDT05GSUdf
RFJNX0FOQUxPR0lYX0FOWDc4WFggaXMgbm90IHNldAotQ09ORklHX0RSTV9BTkFMT0dJWF9EUD1t
CitDT05GSUdfRFJNX0FOQUxPR0lYX0RQPXkKIENPTkZJR19EUk1fQU5BTE9HSVhfQU5YNzYyNT1t
CiBDT05GSUdfRFJNX0kyQ19BRFY3NTExPW0KIENPTkZJR19EUk1fSTJDX0FEVjc1MTFfQVVESU89
eQpAQCAtNzUzNSwxMyArNzUzNCwxMyBAQAogIyBDT05GSUdfRFJNX0lNWDhRWFBfUElYRUxfQ09N
QklORVIgaXMgbm90IHNldAogIyBDT05GSUdfRFJNX0lNWDhRWFBfUElYRUxfTElOS19UT19EUEkg
aXMgbm90IHNldAogIyBDT05GSUdfRFJNX0lNWDkzX01JUElfRFNJIGlzIG5vdCBzZXQKLUNPTkZJ
R19EUk1fRFdfSERNST1tCitDT05GSUdfRFJNX0RXX0hETUk9eQogIyBDT05GSUdfRFJNX0RXX0hE
TUlfQUhCX0FVRElPIGlzIG5vdCBzZXQKIENPTkZJR19EUk1fRFdfSERNSV9JMlNfQVVESU89bQog
IyBDT05GSUdfRFJNX0RXX0hETUlfR1BfQVVESU8gaXMgbm90IHNldAogQ09ORklHX0RSTV9EV19I
RE1JX0NFQz1tCi1DT05GSUdfRFJNX0RXX0hETUlfUVA9bQotQ09ORklHX0RSTV9EV19NSVBJX0RT
ST1tCitDT05GSUdfRFJNX0RXX0hETUlfUVA9eQorQ09ORklHX0RSTV9EV19NSVBJX0RTST15CiAj
IGVuZCBvZiBEaXNwbGF5IEludGVyZmFjZSBCcmlkZ2VzCiAKIENPTkZJR19EUk1fSU1YX0RDU1M9
bQo=
--41f2c4a24b6ad542ac2997287897e3366741717150c20a9ed2e8c2e83a21--

--0170c55d779959132851b9c3f3ea4d566a91cf78513dc7a38a145c7e7688
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaEqQ0QAKCRDXblvOeH7b
btEBAP9ikRs180NM9TdBhOPuOz9c3oqiKp6LMyvafPPMeSLjBAEA0fqh/5C2ZAAD
QDzxNLX9VjwMbTUib434QQya8nXq3gE=
=76HI
-----END PGP SIGNATURE-----

--0170c55d779959132851b9c3f3ea4d566a91cf78513dc7a38a145c7e7688--
