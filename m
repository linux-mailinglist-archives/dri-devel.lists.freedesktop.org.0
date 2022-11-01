Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCAC615067
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 18:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C98710E0B4;
	Tue,  1 Nov 2022 17:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9947210E0B4;
 Tue,  1 Nov 2022 17:17:35 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4N1xXt5cLpzDql0;
 Tue,  1 Nov 2022 17:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1667323055; bh=LgAWbPZqi1ZXCh+fazxGqEjob05/uqBjqnQibRDbwZI=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=LvspmUySm1IXKYV8vpdqfWpgPEPWfruGlB2IVAjsqD5+MMm2Shi/CpOVedaUTWi98
 Hsr25UFbRL6/KII/IYipVvdJyNQKuE4rWdsWbTUxF2tJqn/zS12zNLruaDfyMuP3n9
 RW636ojurHVQf4rqHFH36vgremYeqX5XVq1TiWyM=
X-Riseup-User-ID: CC02644C02845D0D9CF95341F98F056B4885011B995F0079F6C24C598E4A82E6
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4N1xXn6WlQz1yZp;
 Tue,  1 Nov 2022 17:17:29 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/4] lib/igt_kmod: add compatibility
 for KUnit
From: Isabella Basso <isabbasso@riseup.net>
In-Reply-To: <20221101133323.72101670@maurocar-mobl2>
Date: Tue, 1 Nov 2022 14:17:26 -0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <F263C946-123C-407F-984D-7AC284CC1B29@riseup.net>
References: <20220829000920.38185-1-isabbasso@riseup.net>
 <20220829000920.38185-4-isabbasso@riseup.net>
 <CABVgOS=HO9XAf8C5X7ZD6aTW37r06ify==7AW9a8cpKsgLVfFw@mail.gmail.com>
 <D53B4EB1-1A95-48F1-BF49-8EC0CC7B5418@riseup.net>
 <20221101133323.72101670@maurocar-mobl2>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
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
Cc: linux-kselftest@vger.kernel.org, Magali Lemes <magalilemes00@gmail.com>,
 =?utf-8?Q?Ma=C3=ADra_Canal?= <maira.canal@usp.br>,
 Daniel Latypov <dlatypov@google.com>, n@nfraprado.net,
 Brendan Higgins <brendanhiggins@google.com>,
 kernel list <linux-kernel@vger.kernel.org>, leandro.ribeiro@collabora.com,
 igt-dev@lists.freedesktop.org, ML dri-devel <dri-devel@lists.freedesktop.org>,
 David Gow <davidgow@google.com>, Tales Aparecida <tales.aparecida@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@riseup.net>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Mauro,

> Am 01/11/2022 um 9:33 AM schrieb Mauro Carvalho Chehab =
<mauro.chehab@linux.intel.com>:
>=20
> Hi Isabella,
>=20
> On Mon, 19 Sep 2022 17:43:19 -0300
> Isabella Basso <isabbasso@riseup.net> wrote:
>=20
>>> Do you want to _require_ KUnit be built as a module, rather than =
built-in here? =20
>>=20
>> I=E2=80=99ll change the comment and the warning in v3 to clarify =
this.
>=20
> When do you intend to submit v3?

I=E2=80=99m currently waiting for my peers to review some refactorings =
and test
things thoroughly. I hope to submit it in a week or two. Sorry it=E2=80=99=
s taking so
long.

Cheers,
--
Isabella Basso

> Regards,
> Mauro

