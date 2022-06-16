Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173E554E510
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 16:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9217113A14;
	Thu, 16 Jun 2022 14:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649BB112E98
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:39:23 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 x6-20020a1c7c06000000b003972dfca96cso984878wmc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 07:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FEM1Uf5duJRx7g0l0kd4cIvvZ1+75a2y+0Eok25cSmM=;
 b=O+MTudmHgt+i7rtSY2PXtqsNNlchKEJZaScaV8u7BZR01lV2AQ9m/ghcMlLr8A5J2v
 5w0eF0QqkXCbpLEo+f6Gpg2SmHkfwSmPnA8FOxvPptdflh1h31UuSr3FE10sNbXQGM+0
 NXGiHkrhy8L0q29QulKvfEYSSRWSV0RFSBQMVb9+JrfzWlLUGmpW+ZPo7Mahg2cKsh5/
 5PDJCPTFis/5GP9x5JLD5yuYaI6EISEY55YJwyNwHonQoZLXMVeDPrXlS6aq6SDbdxPZ
 YFf/ufuwMQSEWK980FaRoZntBeu4zN2eirl71xNyHNPqO3Sm5f70stoRnYFOXH0+0jGG
 EIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FEM1Uf5duJRx7g0l0kd4cIvvZ1+75a2y+0Eok25cSmM=;
 b=qaljUGTigS9u/QujwCYLfz0sXPpFpgKqzf29nZry+2YDb9O5/XGjmgZNYmUveGH7rr
 5/BnrXtIIyzW43GxJfgUkChb9M0t3X5xgA782R5u0+16VqTNoFfpPOs/Ys3M8hyIDYkd
 D8r3+duDurWySSzLK9EtsbDKOc4Mi9pfjICrW3Ce//enOk4lwL2jhBeS6veNQmlVgZhJ
 Cfn+Ta+TYsNbHaRESBYeJhJJJ+tQakuS/u8i/eGwzuNWAIyIH06wJkMAXyjiBVDcgtv/
 xmgzsvX6bTymqJ4kpo0g6brz+s1ord5pXtUFxQgIod1I9FK/Tnc+/FLdgVs68yflYz2n
 R1Bw==
X-Gm-Message-State: AJIora+oU3xCyRbrWxyuAzamikK2b6zX0Mo3ssYgU74iyHHDkXlhVSAn
 nH8X8E4oOQEiuhpkeZkroEQMrTNPWjPQeiLZTq8xhg==
X-Google-Smtp-Source: AGRyM1sQqeAEHeE4SPnRemtsjCPjUsThJLHHPx63FK6t+loyl6xOOqwQXqPAqnrX/PYD2sT7CQMZqCp+l9LF2xGMIuQ=
X-Received: by 2002:a1c:6a16:0:b0:39c:655a:ac2c with SMTP id
 f22-20020a1c6a16000000b0039c655aac2cmr5492500wmc.66.1655390361741; Thu, 16
 Jun 2022 07:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220608010709.272962-1-maira.canal@usp.br>
In-Reply-To: <20220608010709.272962-1-maira.canal@usp.br>
From: David Gow <davidgow@google.com>
Date: Thu, 16 Jun 2022 22:39:10 +0800
Message-ID: <CABVgOSmesj5MGfQrtdWCgXzm1VXRoG0fAMCbkBCAvtqediqAjQ@mail.gmail.com>
Subject: Re: [RFC 0/3] drm/amd/display: Introduce KUnit to Display Mode Library
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
Cc: Harrison Chiu <harrison.chiu@amd.com>, Daniel Latypov <dlatypov@google.com>,
 Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 Jun Lei <jun.lei@amd.com>, magalilemes00@gmail.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, mwen@igalia.com,
 Sean Paul <seanpaul@chromium.org>,
 KUnit Development <kunit-dev@googlegroups.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Nicholas Choi <Nicholas.Choi@amd.com>, tales.aparecida@gmail.com,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 8, 2022 at 9:08 AM Ma=C3=ADra Canal <maira.canal@usp.br> wrote:
>
> This RFC is a preview of the work being developed by Isabella Basso [1],
> Ma=C3=ADra Canal [2], and Tales Lelo [3], as part of their Google Summer =
of Code
> projects [4], and Magali Lemes [5], as part of her capstone project.
>
> Our main goal is to bring unit testing to the AMDPGU driver; in particula=
r,
> we'll focus on the Display Mode Library (DML) for DCN2.0 and some of the =
DCE
> functions. The modern AMD Linux kernel graphics driver is the single larg=
est
> driver in the mainline Linux codebase [6]. As AMD releases new GPU models=
,
> the size of AMDGPU drivers is only becoming even larger.
>
> Assuring the drivers' quality and reliability becomes a complex task with=
out
> systematic testing, especially for graphic drivers - which usually involv=
e
> tons of complex calculations. Also, keeping bugs away becomes an increasi=
ngly
> hard task with the introduction of new code. Moreover, developers might w=
ant
> to refactor old code without fear of the introduction of new issues.
>
> In that sense, it is possible to argue for the benefits of implementing u=
nit
> testing at the AMDGPU drivers. This implementation will help developers t=
o
> recognize bugs before they are merged into the mainline and also makes it
> possible for future code refactors of the AMDGPU driver.
>
> When analyzing the AMDGPU driver, a particular part of the driver highlig=
hts
> itself as a good candidate for the implementation of unit tests: the Disp=
lay
> Mode Library (DML), as it is focused on mathematical operations.
>
> For the implementation of the tests, we decided to go with the Kernel Uni=
t
> Testing Framework (KUnit). KUnit makes it possible to run test suites on
> kernel boot or load the tests as a module. It reports all test case resul=
ts
> through a TAP (Test Anything Protocol) in the kernel log.
>
> Moreover, KUnit unifies the test structure and provides tools to simplify=
 the
> testing for developers and CI systems.
>
> That said, we developed a little snippet on what we intend to develop in =
our
> summer. We planned the basic structure on how the tests will be introduce=
d
> into the codebase and, on the concern of the CI systems, developed a stru=
cture
> where the unit tests can be introduced as modules and run on IGT (the IGT=
 patch
> will be introduced soon).

It's awesome to see this! It's definitely one of the more ambitious
KUnit test projects out there, and the DML code does seem particularly
well suited to unit-testings.

> The way the modules are implemented might seem a little unusual for KUnit
> developers. We need to call the KUnit init function inside the AMDGPU sta=
ck,
> otherwise, the test won't compile as a module. So, the solution to this
> problem was based on the unit tests for the Thunderbolt driver, which use=
s
> KUnit and also tests a physical driver.
>
> As kunit_test_suites() defines itself as an init_module(), it conflicts w=
ith
> the existing one at amdgpu_drv. So, if we use kunit_test_suites(), we won=
't
> be able to compile the tests as modules and, therefore, won't be able to =
use
> IGT to run the tests. This problem with kunit_test_suites() was already
> discussed in the KUnit mailing list, as can be seen in [7].

I'm not sure I fully understand why these tests need to be part of the
amdgpu module, though admittedly I've not played with IGT much. Would
it be possible to compile these tests as separate modules, which could
depend on amdgpu (or maybe include the DML stuff directly), and
therefore not have this conflict? I definitely was able to get these
tests working under kunit_tool (albeit as built-ins) by using
kunit_test_suites(). If each suite were built as a separate module (or
indeed, even if all the tests were in one module, with one list of
suites), then it should be possible to avoid the init_module()
conflict. That'd also make it possible to run these tests without
actually needing the driver to initialise, which seems like it might
require actual hardware(?)

There are two other reasons the 'thunderbolt'-style technique is one
we want to avoid:
1. It makes it much more difficult to run tests using kunit_tool and
KUnit-based CI tools: these tests would not run automatically, and if
they were built-in as-is, they'd need to be
2. We're planning to improve module support to replace the
init_module()-based implementation of kunit_test_suites() with one
which won't have these conflicts, so the need for this should be
short-lived.

If you're curious, an early version of the improved module support can
be found here, though it's out-of-date enough it won't apply or work
as-is:
https://lore.kernel.org/all/101d12fc9250b7a445ff50a9e7a25cd74d0e16eb.camel@=
codeconstruct.com.au/

Now, that's unlikely to be ready very soon, but I'd be hesitant to
implement too extensive a system for avoiding kunit_test_suites()
given at some point it should work and we'll need to migrate back to
it.

At the very least, having the dependency on KUNIT=3Dm is a very bad
idea: it should be possible to have tests built as modules, even if
KUnit itself isn't, and ideally (even if this sort-of implementation
is required), it _should_ be possible to have these tests be built-in
if all their dependencies (KUnit, amdgpu) are, which would make it
possible to run the tests without a userland.

That being said, I've got basically no knowledge of amdgpu (or even
drm in general), so there could be something I'm missing.

>
> The first patch configures the basic structure of the KUnit Tests, settin=
g the
> proper Makefile, Kconfig, and init function. It also contains a simple te=
st
> involving DML logging, which is the pretext for building the testing stru=
cture.
>
> The second patch adds KUnit tests to bw_fixed functions. This patch repre=
sents
> what we intend to do on the rest of the DML modules: systematic testing o=
f the
> public functions of the DML, especially mathematically complicated functi=
ons.
> Also, it shows how simple it is to add new tests to the DML with the stru=
cture
> we built.
>
> Any feedback or ideas for the project are welcome!
>
Looks great to me so far: I'll try to get a more detailed review in soon.

Cheers,
-- David

> [1] https://crosscat.me
> [2] https://mairacanal.github.io
> [3] https://tales-aparecida.github.io/
> [4] https://summerofcode.withgoogle.com/programs/2022/organizations/xorg-=
foundation
> [5] https://magalilemes.github.io/
> [6] https://www.phoronix.com/scan.php?page=3Dnews_item&px=3DAMDGPU-Closin=
g-4-Million
> [7] https://groups.google.com/g/kunit-dev/c/hbJbh8L37FU/m/EmszZE9qBAAJ
>
> - Isabella Basso, Magali Lemes, Ma=C3=ADra Canal, and Tales Lelo
>
> Magali Lemes (1):
>   drm/amd/display: Introduce KUnit tests to the bw_fixed library
>
> Ma=C3=ADra Canal (2):
>   drm/amd/display: Introduce KUnit to DML
>   drm/amd/display: Move bw_fixed macros to header file
>
>  drivers/gpu/drm/amd/display/Kconfig           |   1 +
>  .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   5 +
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   3 +
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   3 +
>  .../drm/amd/display/amdgpu_dm/tests/Kconfig   |  41 +++
>  .../drm/amd/display/amdgpu_dm/tests/Makefile  |  18 +
>  .../amdgpu_dm/tests/calcs/bw_fixed_test.c     | 322 ++++++++++++++++++
>  .../amdgpu_dm/tests/display_mode_lib_test.c   |  83 +++++
>  .../amd/display/amdgpu_dm/tests/dml_test.c    |  26 ++
>  .../amd/display/amdgpu_dm/tests/dml_test.h    |  21 ++
>  .../drm/amd/display/dc/dml/calcs/bw_fixed.c   |  14 +-
>  drivers/gpu/drm/amd/display/dc/inc/bw_fixed.h |  14 +
>  12 files changed, 538 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/Kconfig
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/Makefile
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/calcs/bw_=
fixed_test.c
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/display_m=
ode_lib_test.c
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.=
c
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.=
h
>
> --
> 2.36.1
>
