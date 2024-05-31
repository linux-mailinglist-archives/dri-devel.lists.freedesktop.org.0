Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0208D5DDC
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 11:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C3A10E08A;
	Fri, 31 May 2024 09:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FURK34fc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8C610E08A;
 Fri, 31 May 2024 09:11:21 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-420180b5922so23385215e9.2; 
 Fri, 31 May 2024 02:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717146679; x=1717751479; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ge2Owzh3S5cehKRYUUe+V39V9v0+HbuSHCXDNGT09Ys=;
 b=FURK34fclEtDCoYOmMtl9USfYyaMSXMaFQ982mn7lUqtTGbNlpczZibxnT14eDi2yQ
 +r86lAoHUYkOdXG3SxKSlTHtI6KQNFMpxSyRpla48b5I9SxMOTSmfv8FJvLi/mXL4Ouq
 goAdYeK/o3iIG6KKzZRnQQfQpJbM1EvkVzWOyyLd/+CzlAhC8+GDDLLqZLJYIJBPzteu
 2F2n0vnTKQ+l0SqQb85jVqVQ/xDUJOW+5cK/xPDFmML/Q/QkohaAcPyR1yQQXlPMlfSe
 jlUZP0qUekGL0/Tj0SIR1PUNr3l0l+Jni4qbkbUJdSYCxkUrUThqdRIv8n2n60GTMnJ1
 axTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717146679; x=1717751479;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ge2Owzh3S5cehKRYUUe+V39V9v0+HbuSHCXDNGT09Ys=;
 b=HtKA3GoKY6TS/uDBTWLe1Bfa8PVxVMJd6PSOn1dUICCNq04brz2u8+n9sVk+EVVNG1
 uOxP1R9ifIe9Rr5itRfxZHJWHZLY+w3DpFm+XkbGyF5we3ISQSjj0QmF2vaF3syqb449
 ptrbn+bhIolUJ5P3PFem+xWC5ezqeqfFQkiCw+zBHH/hE7pKFTsB6kKJ8fyZaDUp0Lx+
 0q/vEkwM8YI8rrrQxTf4DTzayEL5oTkP6ed27XPvh31YoYt+b20YmI7uB5Fl+OFyDngv
 H8WsSCK+8/HfSyk44th+CVEGmQ/aVSvc4J2RgEB2/5zvsOi+QIzrc+Lvg1R20xawSbe/
 ylVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT62g7Bm4Nnh3K8PistUNLdLBuJHyE1RUI47gDIbeaPR80uQqsYbYrO38VdgxrGCIbWrWxg9yN4vOfXLDPcL7zlQYpyJZUO698JpzveQlNcZABqIUVJQlmVx1rcFRmJBX8mDCeKm4q5afqHQccZcdj
X-Gm-Message-State: AOJu0YzkAlAgkZwQtb72ouJdAeclolK13Q5NfTmZgkxrBodk6gpsdk6f
 0HTDgJGEQTqVA1pg7jTvZmoyrU23b8r4pzvXgmdT2H5Bi8RfZtZd
X-Google-Smtp-Source: AGHT+IHjSCeQFuSwL4zgQTAANKUrOtLq+ipp/4k2/cpZCON8iuqmoX8dSGF/d93BBGIHlUH85jMQVg==
X-Received: by 2002:a5d:664d:0:b0:354:f536:31d3 with SMTP id
 ffacd0b85a97d-35e0f325184mr986696f8f.54.1717146679010; 
 Fri, 31 May 2024 02:11:19 -0700 (PDT)
Received: from localhost
 (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04c0f47sm1409029f8f.8.2024.05.31.02.11.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 02:11:18 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=44e1abd3ea18a8ea349c6fb2b07d82a6bec49652599fd2a60f6af9c26a3c;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Fri, 31 May 2024 11:11:17 +0200
Message-Id: <D1NPP1PJ5UYS.2IGK7FBR9Q6LN@gmail.com>
Cc: "Jonathan Corbet" <corbet@lwn.net>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>, "Rob Clark" <robdclark@gmail.com>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Sean Paul" <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, <workflows@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Masahiro
 Yamada" <masahiroy@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH] docs: document python version used for compilation
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
 <87o79faq4a.fsf@meer.lwn.net> <D1N564M136RW.3CRPYTGKMW1NP@gmail.com>
 <CAMuHMdVA7MU8LMUW6rR=VWtCDs8erpKgx30woL5eUucRYiK-Fg@mail.gmail.com>
In-Reply-To: <CAMuHMdVA7MU8LMUW6rR=VWtCDs8erpKgx30woL5eUucRYiK-Fg@mail.gmail.com>
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

--44e1abd3ea18a8ea349c6fb2b07d82a6bec49652599fd2a60f6af9c26a3c
Content-Type: multipart/mixed;
 boundary=5dd707c8aefca53a80287b4aa87859be5f60dd9e69ea1e2dfc6c279ce4ae
Mime-Version: 1.0

--5dd707c8aefca53a80287b4aa87859be5f60dd9e69ea1e2dfc6c279ce4ae
Content-Type: multipart/alternative;
 boundary=07a5dde67ef47e9448bf0ccc85db98c9dc1a803fa3ba19fc3678c11852c2

--07a5dde67ef47e9448bf0ccc85db98c9dc1a803fa3ba19fc3678c11852c2
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Content-Type: text/plain; charset=UTF-8

On Fri May 31, 2024 at 9:33 AM CEST, Geert Uytterhoeven wrote:
> Hi Thierry,
>
> On Thu, May 30, 2024 at 7:07=E2=80=AFPM Thierry Reding <thierry.reding@gm=
ail.com> wrote:
> > Alternatively, maybe Kconfig could be taught about build dependencies?
>
> git grep "depends on \$(" -- "*Kconf*"

Duh... of course there's something like this already. =3D)

Maybe something like the attached patch?

Thierry

--07a5dde67ef47e9448bf0ccc85db98c9dc1a803fa3ba19fc3678c11852c2--

--5dd707c8aefca53a80287b4aa87859be5f60dd9e69ea1e2dfc6c279ce4ae
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename=0001-kbuild-Allow-Kconfig-dependendencies-on-Python.patch
Content-Type: text/x-patch; charset=utf-8;
 name=0001-kbuild-Allow-Kconfig-dependendencies-on-Python.patch

RnJvbSAxNTNlYWVjNjE1MTNlMTRmNWE3ZjhmMmE5OTg2MDBkMDdmMTdiYzg0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgpE
YXRlOiBGcmksIDMxIE1heSAyMDI0IDEwOjUxOjQyICswMjAwClN1YmplY3Q6IFtQQVRDSF0ga2J1
aWxkOiBBbGxvdyBLY29uZmlnIGRlcGVuZGVuZGVuY2llcyBvbiBQeXRob24KClJlY2VudGx5IGRy
aXZlcnMgaGF2ZSBzdGFydGVkIGRlcGVuZGluZyBvbiBQeXRob24gdG8gZ2VuZXJhdGUgcmVnaXN0
ZXIKZGVmaW5pdGlvbnMgZHVyaW5nIHRoZSBidWlsZCBwcm9jZXNzLiBJbiBvcmRlciB0byBwcmV2
ZW50IHN1Y2ggZHJpdmVycwpmcm9tIGJyZWFraW5nIGJ1aWxkcyBvbiBzeXN0ZW1zIHRoYXQgZG9u
J3QgaGF2ZSBQeXRob24gaW5zdGFsbGVkLCBtYWtlCnRoZW0gZGVwZW5kIG9uIHRoZSBtaW5pbXVt
IHJlcXVpcmVkIFB5dGhvbiB2ZXJzaW9uIHRoYXQgdGhleSBuZWVkIHZpYQpLY29uZmlnLiBJZiBQ
eXRob24gaXMgbm90IGluc3RhbGxlZCBvbiB0aGUgc3lzdGVtLCB0aGVzZSBkcml2ZXJzIHdpbGwK
YmUgYXV0b21hdGljYWxseSBkaXNhYmxlZC4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5n
IDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9LY29uZmlnIHwg
IDEgKwogc2NyaXB0cy9taW4tdG9vbC12ZXJzaW9uLnNoIHwgIDMgKysrCiBzY3JpcHRzL3B5dGhv
bi12ZXJzaW9uLnNoICAgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiAzIGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDc1NSBz
Y3JpcHRzL3B5dGhvbi12ZXJzaW9uLnNoCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21z
bS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL21zbS9LY29uZmlnCmluZGV4IDE5MzFlY2Y3M2Uz
Mi4uNWY3Zjg0ZGU1NWU0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL0tjb25maWcK
KysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9LY29uZmlnCkBAIC0xMSw2ICsxMSw3IEBAIGNvbmZp
ZyBEUk1fTVNNCiAJZGVwZW5kcyBvbiBRQ09NX0xMQ0MgfHwgUUNPTV9MTENDPW4KIAlkZXBlbmRz
IG9uIFFDT01fQ09NTUFORF9EQiB8fCBRQ09NX0NPTU1BTkRfREI9bgogCWRlcGVuZHMgb24gUE0K
KwlkZXBlbmRzIG9uICQoc3VjY2VzcywkKHNyY3RyZWUpL3NjcmlwdHMvcHl0aG9uLXZlcnNpb24u
c2gpCiAJc2VsZWN0IElPTU1VX0lPX1BHVEFCTEUKIAlzZWxlY3QgUUNPTV9NRFRfTE9BREVSIGlm
IEFSQ0hfUUNPTQogCXNlbGVjdCBSRUdVTEFUT1IKZGlmZiAtLWdpdCBhL3NjcmlwdHMvbWluLXRv
b2wtdmVyc2lvbi5zaCBiL3NjcmlwdHMvbWluLXRvb2wtdmVyc2lvbi5zaAppbmRleCA5MWM5MTIw
MTIxMmMuLjQ0N2EzYWQ0YzBiZiAxMDA3NTUKLS0tIGEvc2NyaXB0cy9taW4tdG9vbC12ZXJzaW9u
LnNoCisrKyBiL3NjcmlwdHMvbWluLXRvb2wtdmVyc2lvbi5zaApAQCAtMzgsNiArMzgsOSBAQCBy
dXN0YykKIGJpbmRnZW4pCiAJZWNobyAwLjY1LjEKIAk7OworcHl0aG9uKQorCWVjaG8gMy41LjAK
Kwk7OwogKikKIAllY2hvICIkMTogdW5rbm93biB0b29sIiA+JjIKIAlleGl0IDEKZGlmZiAtLWdp
dCBhL3NjcmlwdHMvcHl0aG9uLXZlcnNpb24uc2ggYi9zY3JpcHRzL3B5dGhvbi12ZXJzaW9uLnNo
Cm5ldyBmaWxlIG1vZGUgMTAwNzU1CmluZGV4IDAwMDAwMDAwMDAwMC4uYzk5N2Q0MDQxOGRjCi0t
LSAvZGV2L251bGwKKysrIGIvc2NyaXB0cy9weXRob24tdmVyc2lvbi5zaApAQCAtMCwwICsxLDQx
IEBACisjIS9iaW4vc2gKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQor
IworIyBQcmludCB0aGUgUHl0aG9uIHZlcnNpb24gaW4gYSA1IG9yIDYtZGlnaXQgZm9ybS4KKyMg
QWxzbywgcGVyZm9ybSB0aGUgbWluaW11bSB2ZXJzaW9uIGNoZWNrLgorCitzZXQgLWUKKworUFlU
SE9OPSR7UFlUSE9OOi1weXRob259CisKK2dldF9jYW5vbmljYWxfdmVyc2lvbigpCit7CisJSUZT
PS4KKwlzZXQgLS0gJDEKKworCSMgSWYgdGhlIDJuZCBvciAzcmQgZmllbGQgaXMgbWlzc2luZywg
ZmlsbCBpdCB3aXRoIGEgemVyby4KKwllY2hvICQoKDEwMDAwICogJDEgKyAxMDAgKiAkezI6LTB9
ICsgJHszOi0wfSkpCit9CisKK291dHB1dD0kKExDX0FMTD1DICIkUFlUSE9OIiAtLXZlcnNpb24p
CisKKyMgU3BsaXQgdGhlIGxpbmUgb24gc3BhY2VzLgorSUZTPScgJworc2V0IC0tICRvdXRwdXQK
K25hbWU9JDEKK3ZlcnNpb249JDIKKworbWluX3Rvb2xfdmVyc2lvbj0kKGRpcm5hbWUgJDApL21p
bi10b29sLXZlcnNpb24uc2gKK21pbl92ZXJzaW9uPSQoJG1pbl90b29sX3ZlcnNpb24gcHl0aG9u
KQorCitjdmVyc2lvbj0kKGdldF9jYW5vbmljYWxfdmVyc2lvbiAkdmVyc2lvbikKK21pbl92ZXJz
aW9uPSQoZ2V0X2Nhbm9uaWNhbF92ZXJzaW9uICRtaW5fdmVyc2lvbikKKworaWYgWyAiJGN2ZXJz
aW9uIiAtbHQgIiRtaW5fdmVyc2lvbiIgXTsgdGhlbgorCWVjaG8gPiYyICIqKioiCisJZWNobyA+
JjIgIioqKiBQeXRob24gaXMgdG9vIG9sZC4iCisJZWNobyA+JjIgIioqKiIKKwlleGl0IDEKK2Zp
CisKK2VjaG8gJG5hbWUgJHZlcnNpb24KLS0gCjIuNDQuMAoK
--5dd707c8aefca53a80287b4aa87859be5f60dd9e69ea1e2dfc6c279ce4ae--

--44e1abd3ea18a8ea349c6fb2b07d82a6bec49652599fd2a60f6af9c26a3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZZlDYACgkQ3SOs138+
s6HXBRAAsSmvbEsN51NCB4QBYVV1Jn9Y+Tptu+xCkkaqDLbKNSCLAseuPQph4+Sm
yP9zBadxx9tzZ9IiJos2zcoidgtSZz6qf/fltaBjgKesq+YhIoRcjlEOjeBBK9li
d0jZrccvkzNDPJqvQWfCrT7GHcZO5xe1RJKw5YcH5acTmYI0JTkHUpmHPWdC5GFO
3gkvHGeth0Mus2+mGUyWXHgEWaL1iOyrm8fCDhuuFZlYxQfkuYbtsOGDz1gKsJWM
tQcCruBMsml9b5cF88NTLJpJ3drz5RqNkxaM793DXcZVTL0rPt9Pc5m331xaKlKl
yWf84jYCgaxFDk2f3IkWcg0Mm35a0dQi7LZ+LecsXtLZZB915wcAQV67dCIOFmyW
qyxex5Tu5jzxDoOJx5/SJrhIdB2Lz33u+XC6nvgAAhsiAKM6lnTkSq0E/s7dIW9z
9Dwhl4k7KpZ4MAPPqzvEH0osPi8ZqbUiv6xIUHtbo+g5ejAvqr/JXauknDacbvJ4
xSyYAkh7Aqpu6K/y9tuI/A9sDBHhUD8D/JqRXEc9BOxjOetDeg0vpvkMQbrntX/a
kk1pkuJrQwIsffqTOWrje9UcjkvbdzmNOknrC/uv+UTrgut/0Rn8p5zsuReU0hjD
SzzXJF890v2QiUMen3kfPuH5vxdiwXehagUZuHDJuUMmwaMcISs=
=cZjs
-----END PGP SIGNATURE-----

--44e1abd3ea18a8ea349c6fb2b07d82a6bec49652599fd2a60f6af9c26a3c--
