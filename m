Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FFD695FBE
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 10:50:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7DF8924F;
	Tue, 14 Feb 2023 09:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3827F8924F;
 Tue, 14 Feb 2023 09:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676368240; x=1707904240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EhBWla462uE1/WQewQ2F+AfWTlZLdWeKkC1spHlwS1w=;
 b=dEqfISczJoXvld6TK9G8NEX988aOwsTalTIft8Wr5Us6qxs3gb2DmqwX
 VOSBt2d6NYl7djWNcH3IxiepG42d8Mp+2AkcTvPnu81NX22Wof3rUfFmi
 5qDUPHBg8PzYjX54nvfyV6xuYim/PAQJT+xrDU4IPhGtoYzOueeADYlx7
 v2Gy8BAy6um+IFSZ9cErqIf1mh2LxBdU6YDjlNoAnhJzepsSggL5SeWvH
 JjI+v/2KIDzNlD94tzjGnH3ru2fp9rTuKvIAIO9chSNdyyQXfdg4AK5on
 QSaxUYlXWG7aNlAcKg5Y5/XLGBv66pRFH7xsyrNK5xw2YP0th6b7ocLw1 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="417341085"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="417341085"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 01:50:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="701601503"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="701601503"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.19.67])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 01:50:33 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Isabella Basso <isabbasso@riseup.net>
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/4] lib/igt_kmod: add compatibility
 for KUnit
Date: Tue, 14 Feb 2023 10:50:30 +0100
Message-ID: <4438162.8F6SAcFxjW@jkrzyszt-mobl1.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <F50369FC-2168-44EC-9BD9-53CF23A5EB97@riseup.net>
References: <20220829000920.38185-1-isabbasso@riseup.net>
 <7621786.lvqk35OSZv@jkrzyszt-mobl1.ger.corp.intel.com>
 <F50369FC-2168-44EC-9BD9-53CF23A5EB97@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 linux-kselftest@vger.kernel.org, Magali Lemes <magalilemes00@gmail.com>,
 =?ISO-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>,
 Daniel Latypov <dlatypov@google.com>,
 Tales Aparecida <tales.aparecida@gmail.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 kernel list <linux-kernel@vger.kernel.org>, leandro.ribeiro@collabora.com,
 igt-dev@lists.freedesktop.org, ML dri-devel <dri-devel@lists.freedesktop.org>,
 n@nfraprado.net, David Gow <davidgow@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 =?ISO-8859-1?Q?Andr=E9?= Almeida <andrealmeid@riseup.net>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Isabella,

On Friday, 10 February 2023 17:55:34 CET Isabella Basso wrote:
> Hi, Janusz,
>=20
> > Am 2023-02-10 um 11:56 AM schrieb Janusz Krzysztofik <janusz.krzysztofi=
k@linux.intel.com>:
> >=20
> > Hi Isabella,
> >=20
> > On Monday, 19 September 2022 22:55:44 CET Isabella Basso wrote:
> >> Hi, Janusz,
> >>=20
> >>> Am 09/09/2022 um 12:18 PM schrieb Janusz Krzysztofik <janusz.krzyszto=
fik@linux.intel.com>:
> >>>=20
> >>> ...
> >>>=20
> >>> Anyway, related to my comment about naming that function a parser, I =
think the=20
> >>> best approach would be for that parser to return a generic set of res=
ults from=20
> >>> kunit execution, then we could feed that data into an IGT specific ha=
ndler=20
> >>> that would convert them to IGT results (SUCCESS, FAIL, or SKIP) as if=
 returned=20
> >>> by a set of IGT dynamic subtests.
> >>=20
> >> That sounds like a good idea to me, I might take some extra time befor=
e v3 to
> >> do that, though.=20
> >=20
> > Were you able to make any progress?  Do you need any help?
>=20
> I=E2=80=99ve already handled most common cases but I still have to addres=
s Chehab=E2=80=99s comments =E2=80=94 specifically in what concerns crashes=
=2E I=E2=80=99ve been doing most of the development by myself as GSoC has e=
nded so I=E2=80=99m taking my time on this.
>=20
> My most up-to-date work is available at [1], so if you have any suggestio=
ns as to what might be done I=E2=80=99d love to hear them before sending ou=
t v3 to the mailing list.
>=20
> [1] - https://gitlab.freedesktop.org/isinyaaa/igt-gpu-tools/-/merge_reque=
sts/1

Thanks for pointing me to that merge request, it's great to know there is=20
some progress.  I've just had a look and I can see you are now working on s=
ome=20
comments from Maria and Tales.  I've requested to be notified on new posts =
to=20
that merge request so I hope to review your next update when available.

As soon as you resolve issues and feel comfortable with sharing your work,=
=20
please submit your changes to the igt-dev list to give them a try on our CI=
=20
system.

Thanks,
Janusz

>=20
> Cheers,
> --
> Isabella Basso
>=20
> > Thanks,
> > Janusz
> >=20
> >=20
>=20
>=20




