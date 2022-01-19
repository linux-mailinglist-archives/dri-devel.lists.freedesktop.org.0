Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 539EA4931E5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 01:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15D510E2B3;
	Wed, 19 Jan 2022 00:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC53E10E2B3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 00:28:29 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id b13so3272629edn.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 16:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k770UvFQuKYA09ODLFNeQInfG3ompPvV6ci5ajQJqu0=;
 b=Qwh2E5xwzIVgvyW/H48iv2mutWjV6G4mcVFE6aWlwG+mW3yINpVQ12nn0k7C3x0bxb
 Bv5HLZ9GAq3BvuIEhJ3IstTCDBIsmMDP8hgc35oUJdv9EhfHSq5O4SQ+mcQy8sIbnDu8
 Cid+0AIkOhBtYqmUDFdag4y3icwqua8s2TJW5u0XKNcIa2YDZxsZEm5C4nJ/TixFA8PI
 MPaO9o1a7pOQTlGP/zj8NuUAGPtUYxCSX/UY3z+qb6IsuS3Lvkz9DiqonNKFFwHFRODh
 5094l2Dw6PjKSbGtnQyLAX9gsma0UaJB88OHznWzZtNVyVqoR/7yW9KovMHac2tW1XKA
 +IZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k770UvFQuKYA09ODLFNeQInfG3ompPvV6ci5ajQJqu0=;
 b=Olje9x4uesELo9oqG0Ac3Ig3HRTjvYxQHxz4q8BX3LK6rvK8jMwIJnZ9NofZq/ZL6C
 1YskXQ04XIDjvG97ksgqr/sNd+0ouZL3pQCnN4WVQRYW3FqZMCVU7FF2BywynMPSoX9d
 DQA+t0AgUYK7jv11KsQ9iUEdLVZjhrH9FIeBH4GfT9qvGRKBJden2WwFHqAnbi0sc1ML
 L+X0fzKW8UjQwSxKgKta7XtVhYrOmSQ4TsxtOGViyHNw6ptBV82hpg9TXxsCiX3Zt46a
 3gFAEBO1z/JuUBR19GeCBD2t8H2UT5d6sQtWfTL1SQtNQe0SHyiuH9t2AHgCG57V6Cl8
 eF0w==
X-Gm-Message-State: AOAM531klOpY1kqiHuriGKKvihMYx6bg2VtfUaumBmbh2h0D6cIRuwdV
 6XL8PcdFGExgimF4nh8LTocLqHkwNsAEb2uL+GxrHA==
X-Google-Smtp-Source: ABdhPJxEpqId00KgaCoG7aIoarfeGNeCFcgZoAPBbpgcO0jyqIuHm5P09KYpsbDYvQsyMopEd65+/9fNxed9F+pU58E=
X-Received: by 2002:a05:6402:1e91:: with SMTP id
 f17mr26079803edf.229.1642552108181; 
 Tue, 18 Jan 2022 16:28:28 -0800 (PST)
MIME-Version: 1.0
References: <20220117232259.180459-1-michal.winiarski@intel.com>
 <20220117232259.180459-7-michal.winiarski@intel.com>
In-Reply-To: <20220117232259.180459-7-michal.winiarski@intel.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Tue, 18 Jan 2022 16:28:11 -0800
Message-ID: <CAGS_qxo+Jeuoo7QQnEW883bT5z3HJqz2sCX=kzhra3UsEM9xOQ@mail.gmail.com>
Subject: Re: [RFC 06/10] drm: test-drm_dp_mst_helper: Convert to KUnit
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
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
Cc: linux-kselftest@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Brendan Higgins <brendanhiggins@google.com>,
 dri-devel@lists.freedesktop.org, Arkadiusz Hiler <arek@hiler.eu>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 17, 2022 at 3:24 PM Micha=C5=82 Winiarski
<michal.winiarski@intel.com> wrote:
>
> igt_dp_mst_calc_pbn_mode was converted one-to-one,
> igt_dp_mst_sideband_msg_req_decode was refactored to parameterized test.
>
> Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/selftests/Makefile            |   3 +-
>  .../gpu/drm/selftests/drm_modeset_selftests.h |   2 -
>  .../drm/selftests/test-drm_dp_mst_helper.c    | 502 ++++++++++++------
>  .../drm/selftests/test-drm_modeset_common.h   |   2 -
>  4 files changed, 330 insertions(+), 179 deletions(-)
>
> diff --git a/drivers/gpu/drm/selftests/Makefile b/drivers/gpu/drm/selftes=
ts/Makefile
> index 35f2f40dbaf3..77e37eebf099 100644
> --- a/drivers/gpu/drm/selftests/Makefile
> +++ b/drivers/gpu/drm/selftests/Makefile
> @@ -1,7 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  test-drm_modeset-$(CONFIG_DRM_DEBUG_SELFTEST) :=3D \
>                       test-drm_modeset_common.o \
> -                     test-drm_dp_mst_helper.o \
>                       test-drm_rect.o
>
>  obj-$(CONFIG_DRM_DEBUG_SELFTEST) +=3D test-drm_mm.o test-drm_modeset.o
> @@ -9,4 +8,4 @@ obj-$(CONFIG_DRM_DEBUG_SELFTEST) +=3D test-drm_mm.o test-=
drm_modeset.o
>  obj-$(CONFIG_DRM_KUNIT_TEST) :=3D \
>         test-drm_cmdline_parser.o test-drm_plane_helper.o \
>         test-drm_format.o test-drm_framebuffer.o \
> -       test-drm_damage_helper.o
> +       test-drm_damage_helper.o test-drm_dp_mst_helper.o
> diff --git a/drivers/gpu/drm/selftests/drm_modeset_selftests.h b/drivers/=
gpu/drm/selftests/drm_modeset_selftests.h
> index b6a6dba66b64..630770d30aba 100644
> --- a/drivers/gpu/drm/selftests/drm_modeset_selftests.h
> +++ b/drivers/gpu/drm/selftests/drm_modeset_selftests.h
> @@ -10,5 +10,3 @@ selftest(drm_rect_clip_scaled_div_by_zero, igt_drm_rect=
_clip_scaled_div_by_zero)
>  selftest(drm_rect_clip_scaled_not_clipped, igt_drm_rect_clip_scaled_not_=
clipped)
>  selftest(drm_rect_clip_scaled_clipped, igt_drm_rect_clip_scaled_clipped)
>  selftest(drm_rect_clip_scaled_signed_vs_unsigned, igt_drm_rect_clip_scal=
ed_signed_vs_unsigned)
> -selftest(dp_mst_calc_pbn_mode, igt_dp_mst_calc_pbn_mode)
> -selftest(dp_mst_sideband_msg_req_decode, igt_dp_mst_sideband_msg_req_dec=
ode)
> diff --git a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c b/drivers=
/gpu/drm/selftests/test-drm_dp_mst_helper.c
> index 6b4759ed6bfd..d0719f3c5a42 100644
> --- a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> +++ b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> @@ -3,54 +3,97 @@
>   * Test cases for for the DRM DP MST helpers
>   */
>
> -#define PREFIX_STR "[drm_dp_mst_helper]"
> -
> +#include <kunit/test.h>
>  #include <linux/random.h>
>
>  #include <drm/drm_dp_mst_helper.h>
>  #include <drm/drm_print.h>
>
>  #include "../drm_dp_mst_topology_internal.h"
> -#include "test-drm_modeset_common.h"
>
> -int igt_dp_mst_calc_pbn_mode(void *ignored)
> +struct dp_mst_calc_pbn_mode_test {
> +       int rate;
> +       int bpp;
> +       int expected;
> +       bool dsc;
> +};
> +
> +static void dp_mst_calc_pbn_mode(struct kunit *test)
>  {
> -       int pbn, i;
> -       const struct {
> -               int rate;
> -               int bpp;
> -               int expected;
> -               bool dsc;
> -       } test_params[] =3D {
> -               { 154000, 30, 689, false },
> -               { 234000, 30, 1047, false },
> -               { 297000, 24, 1063, false },
> -               { 332880, 24, 50, true },
> -               { 324540, 24, 49, true },
> -       };
> +       const struct dp_mst_calc_pbn_mode_test *params =3D test->param_va=
lue;
> +       int pbn;
>
> -       for (i =3D 0; i < ARRAY_SIZE(test_params); i++) {
> -               pbn =3D drm_dp_calc_pbn_mode(test_params[i].rate,
> -                                          test_params[i].bpp,
> -                                          test_params[i].dsc);
> -               FAIL(pbn !=3D test_params[i].expected,
> -                    "Expected PBN %d for clock %d bpp %d, got %d\n",
> -                    test_params[i].expected, test_params[i].rate,
> -                    test_params[i].bpp, pbn);
> -       }
> +       pbn =3D drm_dp_calc_pbn_mode(params->rate,
> +                                  params->bpp,
> +                                  params->dsc);
> +
> +       KUNIT_EXPECT_EQ(test, pbn, params->expected);
> +}
>
> -       return 0;
> +static const struct dp_mst_calc_pbn_mode_test dp_mst_calc_pbn_mode_tests=
[] =3D {
> +       {
> +               .rate =3D 154000,
> +               .bpp =3D 30,
> +               .expected =3D 689,
> +               .dsc =3D false,
> +       },
> +       {
> +               .rate =3D 234000,
> +               .bpp =3D 30,
> +               .expected =3D 1047,
> +               .dsc =3D false,
> +       },
> +       {
> +               .rate =3D 297000,
> +               .bpp =3D 24,
> +               .expected =3D 1063,
> +               .dsc =3D false,
> +       },
> +       {
> +               .rate =3D 332880,
> +               .bpp =3D 24,
> +               .expected =3D 50,
> +               .dsc =3D true,
> +       },
> +       {
> +               .rate =3D 324540,
> +               .bpp =3D 24,
> +               .expected =3D 49,
> +               .dsc =3D true,
> +       },
> +};
> +
> +static void dp_mst_calc_pbn_mode_desc(const struct dp_mst_calc_pbn_mode_=
test *t,
> +                                     char *desc)
> +{
> +       sprintf(desc, "rate =3D %d, bpp =3D %d, dsc =3D %s",
> +               t->rate, t->bpp, t->dsc ? "true" : "false");
>  }
>
> -static bool
> -sideband_msg_req_equal(const struct drm_dp_sideband_msg_req_body *in,
> -                      const struct drm_dp_sideband_msg_req_body *out)
> +KUNIT_ARRAY_PARAM(dp_mst_calc_pbn_mode, dp_mst_calc_pbn_mode_tests, dp_m=
st_calc_pbn_mode_desc);
> +
> +static void
> +drm_dp_mst_helper_printfn(struct drm_printer *p, struct va_format *vaf)
> +{
> +       struct kunit *test =3D p->arg;
> +
> +       kunit_err(test, "%pV", vaf);
> +}
> +
> +static void
> +expect_sideband_msg_req_equal(struct kunit *test,
> +                             const struct drm_dp_sideband_msg_req_body *=
in,
> +                             const struct drm_dp_sideband_msg_req_body *=
out)
>  {
>         const struct drm_dp_remote_i2c_read_tx *txin, *txout;
> +       struct drm_printer p =3D {
> +               .printfn =3D drm_dp_mst_helper_printfn,
> +               .arg =3D test
> +       };
>         int i;
>
>         if (in->req_type !=3D out->req_type)
> -               return false;
> +               goto fail;

Briefly skimming over this code, it looks like it'd be simpler to have
this function remain unchanged.
There's only the one caller.
It could take on the responsibility of creating the drm_printer and
redirect the printfn to kunit_err, afaik.

Passing in `test` would be useful if we were generating custom error
messages for each of the `return false` lines, which I assume was the
original motivation for doing so?
But looking at this, I'd agree it seems like too much work.

Tangent:
It might have been easier to do that if the kunit assertions returned pass/=
fail.
E.g. instead of having to do

if (!<long-condition>) {
  KUNIT_FAIL("<long-condition> not met");
  return;
}

if we could do

if(!KUNIT_EXPECT_TRUE(long-condition))
  return;

or if there was a new macro type

KUNIT_EXPECT_RET_TRUE(long-condition); // like ASSERT, but just return
from this func on failure


>
>         switch (in->req_type) {
>         /*
> @@ -65,7 +108,7 @@ sideband_msg_req_equal(const struct drm_dp_sideband_ms=
g_req_body *in,
>                     IN.num_transactions !=3D OUT.num_transactions ||
>                     IN.port_number !=3D OUT.port_number ||
>                     IN.read_i2c_device_id !=3D OUT.read_i2c_device_id)
> -                       return false;
> +                       goto fail;
>
>                 for (i =3D 0; i < IN.num_transactions; i++) {
>                         txin =3D &IN.transactions[i];
> @@ -76,11 +119,11 @@ sideband_msg_req_equal(const struct drm_dp_sideband_=
msg_req_body *in,
>                             txin->num_bytes !=3D txout->num_bytes ||
>                             txin->i2c_transaction_delay !=3D
>                             txout->i2c_transaction_delay)
> -                               return false;
> +                               goto fail;
>
>                         if (memcmp(txin->bytes, txout->bytes,
>                                    txin->num_bytes) !=3D 0)
> -                               return false;
> +                               goto fail;
>                 }
>                 break;
>  #undef IN
> @@ -92,9 +135,12 @@ sideband_msg_req_equal(const struct drm_dp_sideband_m=
sg_req_body *in,
>                 if (IN.dpcd_address !=3D OUT.dpcd_address ||
>                     IN.num_bytes !=3D OUT.num_bytes ||
>                     IN.port_number !=3D OUT.port_number)
> -                       return false;
> +                       goto fail;
>
> -               return memcmp(IN.bytes, OUT.bytes, IN.num_bytes) =3D=3D 0=
;
> +               if (memcmp(IN.bytes, OUT.bytes, IN.num_bytes) !=3D 0)
> +                       goto fail;
> +
> +               break;
>  #undef IN
>  #undef OUT
>
> @@ -104,55 +150,65 @@ sideband_msg_req_equal(const struct drm_dp_sideband=
_msg_req_body *in,
>                 if (IN.port_number !=3D OUT.port_number ||
>                     IN.write_i2c_device_id !=3D OUT.write_i2c_device_id |=
|
>                     IN.num_bytes !=3D OUT.num_bytes)
> -                       return false;
> +                       goto fail;
>
> -               return memcmp(IN.bytes, OUT.bytes, IN.num_bytes) =3D=3D 0=
;
> +               if (memcmp(IN.bytes, OUT.bytes, IN.num_bytes) !=3D 0)
> +                       goto fail;
> +
> +               break;
>  #undef IN
>  #undef OUT
>
>         default:
> -               return memcmp(in, out, sizeof(*in)) =3D=3D 0;
> +               if (memcmp(in, out, sizeof(*in)) !=3D 0)
> +                       goto fail;
>         }
>
> -       return true;
> +       return;
> +
> +fail:
> +       drm_printf(&p, "Expected:\n");
> +       drm_dp_dump_sideband_msg_req_body(in, 1, &p);
> +       drm_printf(&p, "Got:\n");
> +       drm_dp_dump_sideband_msg_req_body(out, 1, &p);
> +       KUNIT_FAIL(test, "Encode/decode failed");
> +}
> +
> +struct dp_mst_sideband_msg_req_decode_test {
> +       const struct drm_dp_sideband_msg_req_body req;
> +       const struct drm_dp_sideband_msg_req_body
> +               (*f)(const struct drm_dp_sideband_msg_req_body *in);
> +};
> +
> +const struct drm_dp_sideband_msg_req_body
> +param_to_dp_mst_sideband_msg_req_body(const struct dp_mst_sideband_msg_r=
eq_decode_test *t)
> +{
> +       if (t->f)
> +               return t->f(&t->req);
> +
> +       return t->req;
>  }
>
> -static bool
> -sideband_msg_req_encode_decode(struct drm_dp_sideband_msg_req_body *in)
> +static void dp_mst_sideband_msg_req_decode(struct kunit *test)
>  {
> +       const struct drm_dp_sideband_msg_req_body in =3D
> +               param_to_dp_mst_sideband_msg_req_body(test->param_value);
>         struct drm_dp_sideband_msg_req_body *out;
> -       struct drm_printer p =3D drm_err_printer(PREFIX_STR);
>         struct drm_dp_sideband_msg_tx *txmsg;
> -       int i, ret;
> -       bool result =3D true;
> -
> -       out =3D kzalloc(sizeof(*out), GFP_KERNEL);
> -       if (!out)
> -               return false;
> -
> -       txmsg =3D kzalloc(sizeof(*txmsg), GFP_KERNEL);
> -       if (!txmsg)
> -               return false;
> -
> -       drm_dp_encode_sideband_req(in, txmsg);
> -       ret =3D drm_dp_decode_sideband_req(txmsg, out);
> -       if (ret < 0) {
> -               drm_printf(&p, "Failed to decode sideband request: %d\n",
> -                          ret);
> -               result =3D false;
> -               goto out;
> -       }
> +       int i;
>
> -       if (!sideband_msg_req_equal(in, out)) {
> -               drm_printf(&p, "Encode/decode failed, expected:\n");
> -               drm_dp_dump_sideband_msg_req_body(in, 1, &p);
> -               drm_printf(&p, "Got:\n");
> -               drm_dp_dump_sideband_msg_req_body(out, 1, &p);
> -               result =3D false;
> -               goto out;
> -       }
> +       out =3D kunit_kzalloc(test, sizeof(*out), GFP_KERNEL);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, out);
>
> -       switch (in->req_type) {
> +       txmsg =3D kunit_kzalloc(test, sizeof(*txmsg), GFP_KERNEL);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, txmsg);
> +
> +       drm_dp_encode_sideband_req(&in, txmsg);
> +       KUNIT_ASSERT_EQ(test, drm_dp_decode_sideband_req(txmsg, out), 0);
> +
> +       expect_sideband_msg_req_equal(test, &in, out);
> +
> +       switch (in.req_type) {
>         case DP_REMOTE_DPCD_WRITE:
>                 kfree(out->u.dpcd_write.bytes);
>                 break;
> @@ -164,110 +220,210 @@ sideband_msg_req_encode_decode(struct drm_dp_side=
band_msg_req_body *in)
>                 kfree(out->u.i2c_write.bytes);
>                 break;
>         }
> -
> -       /* Clear everything but the req_type for the input */
> -       memset(&in->u, 0, sizeof(in->u));
> -
> -out:
> -       kfree(out);
> -       kfree(txmsg);
> -       return result;
>  }
>
> -int igt_dp_mst_sideband_msg_req_decode(void *unused)
> +static u8 data[] =3D { 0xff, 0x0, 0xdd };
> +
> +const struct drm_dp_sideband_msg_req_body
> +random_dp_query_enc_client_id(const struct drm_dp_sideband_msg_req_body =
*in)
>  {
> -       struct drm_dp_sideband_msg_req_body in =3D { 0 };
> -       u8 data[] =3D { 0xff, 0x0, 0xdd };
> -       int i;
> +       struct drm_dp_query_stream_enc_status enc_status =3D { };
>
> -#define DO_TEST() FAIL_ON(!sideband_msg_req_encode_decode(&in))
> -
> -       in.req_type =3D DP_ENUM_PATH_RESOURCES;
> -       in.u.port_num.port_number =3D 5;
> -       DO_TEST();
> -
> -       in.req_type =3D DP_POWER_UP_PHY;
> -       in.u.port_num.port_number =3D 5;
> -       DO_TEST();
> -
> -       in.req_type =3D DP_POWER_DOWN_PHY;
> -       in.u.port_num.port_number =3D 5;
> -       DO_TEST();
> -
> -       in.req_type =3D DP_ALLOCATE_PAYLOAD;
> -       in.u.allocate_payload.number_sdp_streams =3D 3;
> -       for (i =3D 0; i < in.u.allocate_payload.number_sdp_streams; i++)
> -               in.u.allocate_payload.sdp_stream_sink[i] =3D i + 1;
> -       DO_TEST();
> -       in.u.allocate_payload.port_number =3D 0xf;
> -       DO_TEST();
> -       in.u.allocate_payload.vcpi =3D 0x7f;
> -       DO_TEST();
> -       in.u.allocate_payload.pbn =3D U16_MAX;
> -       DO_TEST();
> -
> -       in.req_type =3D DP_QUERY_PAYLOAD;
> -       in.u.query_payload.port_number =3D 0xf;
> -       DO_TEST();
> -       in.u.query_payload.vcpi =3D 0x7f;
> -       DO_TEST();
> -
> -       in.req_type =3D DP_REMOTE_DPCD_READ;
> -       in.u.dpcd_read.port_number =3D 0xf;
> -       DO_TEST();
> -       in.u.dpcd_read.dpcd_address =3D 0xfedcb;
> -       DO_TEST();
> -       in.u.dpcd_read.num_bytes =3D U8_MAX;
> -       DO_TEST();
> -
> -       in.req_type =3D DP_REMOTE_DPCD_WRITE;
> -       in.u.dpcd_write.port_number =3D 0xf;
> -       DO_TEST();
> -       in.u.dpcd_write.dpcd_address =3D 0xfedcb;
> -       DO_TEST();
> -       in.u.dpcd_write.num_bytes =3D ARRAY_SIZE(data);
> -       in.u.dpcd_write.bytes =3D data;
> -       DO_TEST();
> -
> -       in.req_type =3D DP_REMOTE_I2C_READ;
> -       in.u.i2c_read.port_number =3D 0xf;
> -       DO_TEST();
> -       in.u.i2c_read.read_i2c_device_id =3D 0x7f;
> -       DO_TEST();
> -       in.u.i2c_read.num_transactions =3D 3;
> -       in.u.i2c_read.num_bytes_read =3D ARRAY_SIZE(data) * 3;
> -       for (i =3D 0; i < in.u.i2c_read.num_transactions; i++) {
> -               in.u.i2c_read.transactions[i].bytes =3D data;
> -               in.u.i2c_read.transactions[i].num_bytes =3D ARRAY_SIZE(da=
ta);
> -               in.u.i2c_read.transactions[i].i2c_dev_id =3D 0x7f & ~i;
> -               in.u.i2c_read.transactions[i].i2c_transaction_delay =3D 0=
xf & ~i;
> -       }
> -       DO_TEST();
> -
> -       in.req_type =3D DP_REMOTE_I2C_WRITE;
> -       in.u.i2c_write.port_number =3D 0xf;
> -       DO_TEST();
> -       in.u.i2c_write.write_i2c_device_id =3D 0x7f;
> -       DO_TEST();
> -       in.u.i2c_write.num_bytes =3D ARRAY_SIZE(data);
> -       in.u.i2c_write.bytes =3D data;
> -       DO_TEST();
> -
> -       in.req_type =3D DP_QUERY_STREAM_ENC_STATUS;
> -       in.u.enc_status.stream_id =3D 1;
> -       DO_TEST();
> -       get_random_bytes(in.u.enc_status.client_id,
> -                        sizeof(in.u.enc_status.client_id));
> -       DO_TEST();
> -       in.u.enc_status.stream_event =3D 3;
> -       DO_TEST();
> -       in.u.enc_status.valid_stream_event =3D 0;
> -       DO_TEST();
> -       in.u.enc_status.stream_behavior =3D 3;
> -       DO_TEST();
> -       in.u.enc_status.valid_stream_behavior =3D 1;
> -       DO_TEST();
> -
> -#undef DO_TEST
> -       return 0;
> +       get_random_bytes(enc_status.client_id, sizeof(enc_status.client_i=
d));
> +
> +       return (const struct drm_dp_sideband_msg_req_body) { .req_type =
=3D in->req_type,
> +                                                            .u.enc_statu=
s =3D enc_status
> +       };
>  }
> +
> +static const struct dp_mst_sideband_msg_req_decode_test dp_msg_sideband_=
msg_req_decode_tests[] =3D {
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_ENUM_PATH_RESOURCES,
> +                       .u.port_num.port_number =3D 5,
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_POWER_UP_PHY,
> +                       .u.port_num.port_number =3D 5,
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_POWER_DOWN_PHY,
> +                       .u.port_num.port_number =3D 5,
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_ALLOCATE_PAYLOAD,
> +                       .u.allocate_payload.number_sdp_streams =3D 3,
> +                       .u.allocate_payload.sdp_stream_sink =3D { 1, 2, 3=
 },
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_ALLOCATE_PAYLOAD,
> +                       .u.allocate_payload.port_number =3D 0xf,
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_ALLOCATE_PAYLOAD,
> +                       .u.allocate_payload.vcpi =3D 0x7f,
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_ALLOCATE_PAYLOAD,
> +                       .u.allocate_payload.pbn =3D U16_MAX,
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_QUERY_PAYLOAD,
> +                       .u.query_payload.port_number =3D 0xf,
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_QUERY_PAYLOAD,
> +                       .u.query_payload.vcpi =3D 0x7f,
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_REMOTE_DPCD_READ,
> +                       .u.dpcd_read.port_number =3D 0xf,
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_REMOTE_DPCD_READ,
> +                       .u.dpcd_read.dpcd_address =3D 0xfedcb,
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_REMOTE_DPCD_READ,
> +                       .u.dpcd_read.num_bytes =3D U8_MAX,
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_REMOTE_DPCD_WRITE,
> +                       .u.dpcd_write.port_number =3D 0xf,
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_REMOTE_DPCD_WRITE,
> +                       .u.dpcd_write.dpcd_address =3D 0xfedcb,
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_REMOTE_DPCD_WRITE,
> +                       .u.dpcd_write.num_bytes =3D ARRAY_SIZE(data),
> +                       .u.dpcd_write.bytes =3D data,
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_REMOTE_I2C_READ,
> +                       .u.i2c_read.port_number =3D 0xf,
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_REMOTE_I2C_READ,
> +                       .u.i2c_read.read_i2c_device_id =3D 0x7f,
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_REMOTE_I2C_READ,
> +                       .u.i2c_read.num_transactions =3D 3,
> +                       .u.i2c_read.num_bytes_read =3D ARRAY_SIZE(data) *=
 3,
> +                       .u.i2c_read.transactions =3D {
> +                               { .bytes =3D data, .num_bytes =3D ARRAY_S=
IZE(data),
> +                                 .i2c_dev_id =3D 0x7f, .i2c_transaction_=
delay =3D 0xf, },
> +                               { .bytes =3D data, .num_bytes =3D ARRAY_S=
IZE(data),
> +                                 .i2c_dev_id =3D 0x7e, .i2c_transaction_=
delay =3D 0xe, },
> +                               { .bytes =3D data, .num_bytes =3D ARRAY_S=
IZE(data),
> +                                 .i2c_dev_id =3D 0x7d, .i2c_transaction_=
delay =3D 0xd, },
> +                       },
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_REMOTE_I2C_WRITE,
> +                       .u.i2c_write.port_number =3D 0xf,
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_REMOTE_I2C_WRITE,
> +                       .u.i2c_write.write_i2c_device_id =3D 0x7f,
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_REMOTE_I2C_WRITE,
> +                       .u.i2c_write.num_bytes =3D ARRAY_SIZE(data),
> +                       .u.i2c_write.bytes =3D data,
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_QUERY_STREAM_ENC_STATUS,
> +                       .u.enc_status.stream_id =3D 1,
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_QUERY_STREAM_ENC_STATUS,
> +               },
> +               .f =3D random_dp_query_enc_client_id,
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_QUERY_STREAM_ENC_STATUS,
> +                       .u.enc_status.stream_event =3D 3,
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_QUERY_STREAM_ENC_STATUS,
> +                       .u.enc_status.valid_stream_event =3D 0,
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_QUERY_STREAM_ENC_STATUS,
> +                       .u.enc_status.stream_behavior =3D 3,
> +               },
> +       },
> +       {
> +               .req =3D {
> +                       .req_type =3D DP_QUERY_STREAM_ENC_STATUS,
> +                       .u.enc_status.valid_stream_behavior =3D 1,
> +               },
> +       },
> +};
> +
> +KUNIT_ARRAY_PARAM(dp_mst_sideband_msg_req, dp_msg_sideband_msg_req_decod=
e_tests, NULL);
> +
> +static struct kunit_case drm_dp_mst_helper_tests[] =3D {
> +       KUNIT_CASE_PARAM(dp_mst_calc_pbn_mode, dp_mst_calc_pbn_mode_gen_p=
arams),
> +       KUNIT_CASE_PARAM(dp_mst_sideband_msg_req_decode, dp_mst_sideband_=
msg_req_gen_params),
> +       {}
> +};
> +
> +static struct kunit_suite drm_dp_mst_helper_test_suite =3D {
> +       .name =3D "drm_dp_mst_helper_tests",
> +       .test_cases =3D drm_dp_mst_helper_tests,
> +};
> +
> +kunit_test_suite(drm_dp_mst_helper_test_suite);
> diff --git a/drivers/gpu/drm/selftests/test-drm_modeset_common.h b/driver=
s/gpu/drm/selftests/test-drm_modeset_common.h
> index 1501d99aee2f..c7cc5edc65f1 100644
> --- a/drivers/gpu/drm/selftests/test-drm_modeset_common.h
> +++ b/drivers/gpu/drm/selftests/test-drm_modeset_common.h
> @@ -20,7 +20,5 @@ int igt_drm_rect_clip_scaled_div_by_zero(void *ignored)=
;
>  int igt_drm_rect_clip_scaled_not_clipped(void *ignored);
>  int igt_drm_rect_clip_scaled_clipped(void *ignored);
>  int igt_drm_rect_clip_scaled_signed_vs_unsigned(void *ignored);
> -int igt_dp_mst_calc_pbn_mode(void *ignored);
> -int igt_dp_mst_sideband_msg_req_decode(void *ignored);
>
>  #endif
> --
> 2.34.1
>
