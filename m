Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 967EBB181BF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 14:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62BDD10E28D;
	Fri,  1 Aug 2025 12:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926EE10E28D;
 Fri,  1 Aug 2025 12:27:28 +0000 (UTC)
Received: from dummy.faircode.eu (om126253232019.31.openmobile.ne.jp
 [126.253.232.19])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 0BEB43F116;
 Fri,  1 Aug 2025 14:27:24 +0200 (CEST)
Date: Fri, 1 Aug 2025 21:27:13 +0900 (GMT+09:00)
From: Simon.Richter@hogyros.de
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <5adad479-1dec-41ac-a491-26a9ce2f4e50@hogyros.de>
In-Reply-To: <460b95285cdf23dc6723972ba69ee726b3b3cfba.camel@linux.intel.com>
References: <20250727070413.9743-1-Simon.Richter@hogyros.de>
 <20250727070413.9743-2-Simon.Richter@hogyros.de>
 <460b95285cdf23dc6723972ba69ee726b3b3cfba.camel@linux.intel.com>
Subject: Re: [PATCH v2 1/1] Mark xe driver as BROKEN if kernel page size is
 not 4kB
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_12_246275870.1754051233716"
X-Correlation-ID: <5adad479-1dec-41ac-a491-26a9ce2f4e50@hogyros.de>
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

------=_Part_12_246275870.1754051233716
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

added COMPILE_TEST =E2=80=94 the goal behind this patch is to revert it as =
soon as possible, which will require some more testing though, and Debian w=
ants something we can release that does not Oops on boot.

Presumably, the same change needs to be done for a few others (nouveau? amd=
?), but I haven't gotten around to testing yet if they actually fail with 6=
4k pages, because this involves moving GPUs around =E2=80=94 and testing 16=
k and 256k is even more effort, especially 256k, because that is larger tha=
n the default alignment of ELF binaries.

=C2=A0=C2=A0 Simon

------=_Part_12_246275870.1754051233716
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
 <head>
  <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-scale=3D=
1.0">
 </head>
 <body>
  <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">Hi,</span>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">added COMP=
ILE_TEST =E2=80=94 the goal behind this patch is to revert it as soon as po=
ssible, which will require some more testing though, and Debian wants somet=
hing we can release that does not Oops on boot.</span>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">Presumably=
, the same change needs to be done for a few others (nouveau? amd?), but I =
haven't gotten around to testing yet if they actually fail with 64k pages, =
because this involves moving GPUs around =E2=80=94 and testing 16k and 256k=
 is even more effort, especially 256k, because that is larger than the defa=
ult alignment of ELF binaries.</span>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&nbsp;&nbs=
p; Simon</span>
  <br>
 </body>
</html>
------=_Part_12_246275870.1754051233716--
