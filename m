Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB50614AC6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 13:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A078110E398;
	Tue,  1 Nov 2022 12:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E5510E398;
 Tue,  1 Nov 2022 12:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667306014; x=1698842014;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TPNf+FzQp/e3Et/6Wapw/U8UpkpopWkGTZenhVM/bIM=;
 b=OdnbsLNfM0+Yzi4wwsrf2MvcNm8SNfPiWeL8kpGaj+r1tcPsnCDNA0D4
 /FvcLJT6ak5Jsz/Lotal1u6UlmiZmNI8GxAXioiJU38JjVLwyRulEBQSf
 ZJ5n2sQjtwFGNoRuV7R+vn4tIP6CQ3ZBg/sIaK7fbA+5os2weBdVH3V5l
 9NWPwo8aJA2hl9uEwQTwDC/ooShe6yo1PZvfzyNsORj5AHgX7Gb/IsZOa
 DJwX1p4nIEwGghHG0oyE87YV3lT9/2s9xOr6zM6PID6toCuEO26EXLXM/
 ubLCzE/sV6noR1x1L9pITtfHF8t2FdiScIR6jB2oBPVu05M7gtmTgzEPY g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="310832172"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="310832172"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 05:33:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="697384294"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="697384294"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 01 Nov 2022 05:33:32 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.252.29.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1A5CF580B9D;
 Tue,  1 Nov 2022 05:33:26 -0700 (PDT)
Date: Tue, 1 Nov 2022 13:33:23 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Isabella Basso <isabbasso@riseup.net>
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/4] lib/igt_kmod: add compatibility
 for KUnit
Message-ID: <20221101133323.72101670@maurocar-mobl2>
In-Reply-To: <D53B4EB1-1A95-48F1-BF49-8EC0CC7B5418@riseup.net>
References: <20220829000920.38185-1-isabbasso@riseup.net>
 <20220829000920.38185-4-isabbasso@riseup.net>
 <CABVgOS=HO9XAf8C5X7ZD6aTW37r06ify==7AW9a8cpKsgLVfFw@mail.gmail.com>
 <D53B4EB1-1A95-48F1-BF49-8EC0CC7B5418@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: David Gow <davidgow@google.com>, Magali Lemes <magalilemes00@gmail.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <maira.canal@usp.br>,
 Daniel Latypov <dlatypov@google.com>,
 Tales Aparecida <tales.aparecida@gmail.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 kernel list <linux-kernel@vger.kernel.org>, leandro.ribeiro@collabora.com,
 igt-dev@lists.freedesktop.org, ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kselftest@vger.kernel.org, n@nfraprado.net,
 Shuah Khan <skhan@linuxfoundation.org>,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@riseup.net>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Isabella,

On Mon, 19 Sep 2022 17:43:19 -0300
Isabella Basso <isabbasso@riseup.net> wrote:

> > Do you want to _require_ KUnit be built as a module, rather than built-=
in here? =20
>=20
> I=E2=80=99ll change the comment and the warning in v3 to clarify this.

When do you intend to submit v3?

Regards,
Mauro
