Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB9F54E571
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 16:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BC411A418;
	Thu, 16 Jun 2022 14:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB7711A418
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:55:21 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id x17so2209758wrg.6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 07:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=i61TpzN79pFd8jTgYBxbOsIXd3ZePgcEGIUlQDrP1oA=;
 b=M/0k6QEAATbj8kUW5XwyTvB1JajbQWDuSL/nFsg2g4nuZM6ljYMq0q3I0sLs2205Dl
 9Pewsmz/LnfdEd+7a2J0V9T4JScjQUlSwbRcl9v7EWkC2nsARiDxxKfrOGQvMTPLjVXF
 Bt6OjKJuvmG6yndpzucExvXSGXyHVv+ffey0bSoaGLk94nMaxPao93IKOcDj48zpuG/M
 9cH6aBjoaQOkknW2oQlhQ3N7WbWeNVf7WPjwpGNE11abmuMGgRxBiXgony8A2AY9bTPA
 dRhUeY37FIi4i5E79o/M5TRMbzmHFmcBj9+M60rkByb2PgJT5hKqaHRN6enYys9bDtUn
 PFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=i61TpzN79pFd8jTgYBxbOsIXd3ZePgcEGIUlQDrP1oA=;
 b=mHs2Yso5Er6Ykom7rpqL8NeKQ+5gOojCJXQqHTNpmikosdJHjy/S8Rr8W0VnTGmNIB
 cd7RbmcAoEoymRcaHdjt80QBwKjF9tWe1ztFcTg2MrB7EqanCg4owcBeQH3oOPOp/HPk
 56431ChvBLSuV+MONQphhoV53PENzoBvcNJt2KirC8+Yu6Bs7/RP2+kn/5OilsEnEtGh
 sA9YNUgHcPRPzCmy1fpEVwGD+5CIDHPGMdYYPW+FP653Oo8JGOEXKypvfkZiguaLx9LG
 yZzo+s7cfY9MVrsWXMgfa/oTEvfP5gojg7RmhpX8jGP+16cZ4HajLqRsP8ANEDOUmRmS
 ATGg==
X-Gm-Message-State: AJIora9Hv6c3WhFd8AWhwWe0HKS//nRsDZ1Cxik/IRvnu3w3O+iYpkAS
 Say68xwNGJo6ttpE7UMGodaxGEhW7Y10mpddqfRCNA==
X-Google-Smtp-Source: AGRyM1vln/RJNFB5gnVroReIptb3DCyDVdXiSGVTD0fsO1X/g7WEyvgJkHlyCbvxclOodYlVPdUzKesDei1IR6d9Itk=
X-Received: by 2002:a05:6000:1889:b0:218:4de1:25a3 with SMTP id
 a9-20020a056000188900b002184de125a3mr5084396wri.622.1655391319594; Thu, 16
 Jun 2022 07:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220615135824.15522-1-maira.canal@usp.br>
In-Reply-To: <20220615135824.15522-1-maira.canal@usp.br>
From: David Gow <davidgow@google.com>
Date: Thu, 16 Jun 2022 22:55:08 +0800
Message-ID: <CABVgOSkVOKx1EEYtg-Os+kui-UivfFLT9OSEB9+sDxcgcxh5Mg@mail.gmail.com>
Subject: Re: [PATCH 00/10] drm: selftest: Convert to KUnit
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, Daniel Latypov <dlatypov@google.com>,
 Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 n@nfraprado.net, Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 magalilemes00@gmail.com, Javier Martinez Canillas <javierm@redhat.com>,
 mwen@igalia.com, Shuah Khan <skhan@linuxfoundation.org>,
 KUnit Development <kunit-dev@googlegroups.com>, michal.winiarski@intel.com,
 tales.aparecida@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 leandro.ribeiro@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 15, 2022 at 9:59 PM Ma=C3=ADra Canal <maira.canal@usp.br> wrote=
:
>
> KUnit unifies the test structure and provides helper tools that simplify
> the development of tests. The basic use case allows running tests as regu=
lar
> processes, which makes it easier to run unit tests on a development machi=
ne
> and to integrate the tests into a CI system.
>
> That said, the conversion of selftests for DRM to KUnit tests is benefici=
al
> as it unifies the testing API by using the KUnit API.
>
> KUnit is beneficial for developers as it eases the process to run unit te=
sts.
> It is possible to run the tests by using the kunit-tool on userspace with=
 the
> following command:
>
> ./tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/gpu/drm/tests =
--arch=3Dx86_64
>
> For CI system, it is possible to execute during the build. But, we also t=
hink
> about IGT: we are developing a patch to introduce KUnit to IGT.
>
> These patches were developed during a KUnit hackathon [0] last October. N=
ow,
> we believe that both the IGT side and the Kernel side are in good shape f=
or
> submission.
>
> If you are willing to check the output, here is the Pastebin with the out=
put
> and execution times [1].
>
> [0] https://groups.google.com/g/kunit-dev/c/YqFR1q2uZvk/m/IbvItSfHBAAJ
> [1] https://pastebin.com/FJjLPKsC
>
> - Arthur Grillo, Isabella Basso, and Ma=C3=ADra Canal

Great to see these going upstream!

I've tested them on my machine, both with x86_64 qemu and with UML using:
./tools/testing/kunit/kunit.py run
--kunitconfig=3Ddrivers/gpu/drm/tests/.kunitconfig \
--kconfig_add CONFIG_UML_PCI_OVER_VIRTIO=3Dy \
--kconfig_add CONFIG_VIRTIO_UML=3Dy

And all 114 tests pass, and everything looks good. My only minor notes
(from a quick look at the results, rather than a detailed review of
the code) are that the test names have a few small oddities:
- The suites all end in _tests (or _test, in the case of
drm_plane_helper_test). This is a bit redundant (and while there is
only one drm_plane_helper_test, the inconsistency with the others is a
bit awkward), so removing the suffix may be cleaner. (Or at least
being optimistic, and making drm_plane_helper_test plural.)
- The drm_cmdline_parser_tests suite's tests have some inconsistencies
name-wise: they're the only ones to start with drm_, not igt_, and
they have a few capital letters in some of the
'drm_cmdline_test_force_D_' tests. (It's also technically redundant to
start all of the test names with drm_cmdline_test, given the suite
name.)

Of course, if you're trying to keep compatibility with existing tests
or tooling, or there's some deeper reason they're named like this,
it's definitely not a dealbreaker.

Either way, this whole series is:

Tested-by: David Gow <davidgow@google.com>

Cheers,
-- David
