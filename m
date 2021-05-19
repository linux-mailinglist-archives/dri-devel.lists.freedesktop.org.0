Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908133885B7
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 05:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13C188E2B;
	Wed, 19 May 2021 03:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E5A88E2B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 03:51:51 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id n10so11659493ion.8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 20:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F3rBHhDQbBx1wOT0QbN7Xss4LCPEbuQCtwZ1D1sLMgw=;
 b=IJI7KuFW4k0nj8sdxLgCyxnWKjewqfJc2ybZGl5AUmfsRPppOkm4slxtyPyCdtl6Kt
 s5KKY1aihxpPuPqDsj0uqfQYY87YFAJ0M+jbqoVBJDA6SBJ4dCUuZ/VAmWiANPLggyw2
 iT032sIG4DCwF3+8+uBdIau/GPHmHppA80bqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F3rBHhDQbBx1wOT0QbN7Xss4LCPEbuQCtwZ1D1sLMgw=;
 b=IhdnLfCm5GNrMV/bRKQbtrEU6MGJMzBVDYhTvwrmyXdYhSXcjntcH/XnH8wT1Y5gs5
 vkPLAkBG8Xoe4ugKWQ2y4iX0iMJ4dQEmYqp6eDJ1MMxzcCe89z4TrKcbUHoD43KUpszD
 WKLVLFJnPj6uP1CQVKryiTmRZloLzbi611fawOJ90e12L3jB3YIgSn9XmAh8PxlP5mZ2
 nUESU872JsKtccBEH3ioBhB3ZZSJn7OkuGdoPPZVZbLO4pt7aYAJHv05OC039CqXAoWh
 zGTg+b4pvHseeN3BVr5/wIxUOp/M83NwWfMPMNGkGeU8B/OGdjYuv+fYaPn4wzd2dbjU
 z0Dg==
X-Gm-Message-State: AOAM533NAQzrxxSlgQ3PncxdDoUT3BdYnFMyfCiur9UcQQsFbWY5zSOp
 x6zKp+Kh5xwXimjj05iCVvTrM5lAO/G7sk8WaqE2nQ==
X-Google-Smtp-Source: ABdhPJwNlDS5GV3d1BKYcyqbDjYJC1iX6hm5RLbWXjr+1NNZgNBW2AIT+lpp0/2oJkgXgWIoy1DR1EG998SLyQJ3smo=
X-Received: by 2002:a05:6602:2bef:: with SMTP id
 d15mr7855177ioy.13.1621396310016; 
 Tue, 18 May 2021 20:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210518223508.v4.1.I6f50a7996687318ba298c24a3663c8be7dd432c7@changeid>
 <faee62cc5308ded52538c5bab8d47cd1d01e42c2.camel@redhat.com>
In-Reply-To: <faee62cc5308ded52538c5bab8d47cd1d01e42c2.camel@redhat.com>
From: Sam McNally <sammc@chromium.org>
Date: Wed, 19 May 2021 13:51:12 +1000
Message-ID: <CAJqEsoDAm6YAiEOqVFcojLEP10rQ9FbfeBHLkUN5KxwTw6j2LA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] drm/dp_mst: Add self-tests for up requests
To: lyude@redhat.com
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 May 2021 at 08:01, Lyude Paul <lyude@redhat.com> wrote:
>
> Looks like these tests might still need to be fixed up a bit:
>
> [   34.785042]  (null): [drm:drm_dp_sideband_parse_req [drm_kms_helper]] connection status reply parse length fail 2 1
> [   34.785082]  (null): [drm:drm_dp_sideband_parse_req [drm_kms_helper]] resource status reply parse length fail 2 1
> [   34.785114]  (null): [drm:drm_dp_sideband_parse_req [drm_kms_helper]] sink event notify parse length fail 2 1
> [   34.785146]  (null): [drm] *ERROR* Got unknown request 0x23 (REMOTE_I2C_WRITE)
>

Those are expected parse failures - testing that parse rejects
messages that are too short or are unsupported. I'll set the mock
device name to make this clearer in the next version, producing
logging like:
[   25.163682]  [drm_dp_mst_helper] expected parse failure:
[drm:drm_dp_sideband_parse_req] connection status reply parse length
fail 2 1
[   25.163706]  [drm_dp_mst_helper] expected parse failure:
[drm:drm_dp_sideband_parse_req] resource status reply parse length
fail 2 1
[   25.163719]  [drm_dp_mst_helper] expected parse failure:
[drm:drm_dp_sideband_parse_req] sink event notify parse length fail 2
1
[   25.163730]  [drm_dp_mst_helper] expected parse failure: [drm]
*ERROR* Got unknown request 0x23 (REMOTE_I2C_WRITE)

>
> On Tue, 2021-05-18 at 22:35 +1000, Sam McNally wrote:
> Up requests are decoded by drm_dp_sideband_parse_req(), which operates
> on a drm_dp_sideband_msg_rx, unlike down requests. Expand the existing
> self-test helper sideband_msg_req_encode_decode() to copy the message
> contents and length from a drm_dp_sideband_msg_tx to
> drm_dp_sideband_msg_rx and use the parse function under test in place of
> decode.
>
> Add support for currently-supported up requests to
> drm_dp_dump_sideband_msg_req_body(); add support to
> drm_dp_encode_sideband_req() to allow encoding for the self-tests.
>
> Add self-tests for CONNECTION_STATUS_NOTIFY and RESOURCE_STATUS_NOTIFY.
>
> Signed-off-by: Sam McNally <sammc@chromium.org>
> ---
>
> Changes in v4:
> - New in v4
>
>  drivers/gpu/drm/drm_dp_mst_topology.c         |  54 ++++++-
>  .../gpu/drm/drm_dp_mst_topology_internal.h    |   4 +
>  .../drm/selftests/test-drm_dp_mst_helper.c    | 147 ++++++++++++++++--
>  3 files changed, 190 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 54604633e65c..573f39a3dc16 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -442,6 +442,37 @@ drm_dp_encode_sideband_req(const struct
> drm_dp_sideband_msg_req_body *req,
>                 idx++;
>                 }
>                 break;
> +       case DP_CONNECTION_STATUS_NOTIFY: {
> +               const struct drm_dp_connection_status_notify *msg;
> +
> +               msg = &req->u.conn_stat;
> +               buf[idx] = (msg->port_number & 0xf) << 4;
> +               idx++;
> +               memcpy(&raw->msg[idx], msg->guid, 16);
> +               idx += 16;
> +               raw->msg[idx] = 0;
> +               raw->msg[idx] |= msg->legacy_device_plug_status ? BIT(6) : 0;
> +               raw->msg[idx] |= msg->displayport_device_plug_status ? BIT(5) :
> 0;
> +               raw->msg[idx] |= msg->message_capability_status ? BIT(4) : 0;
> +               raw->msg[idx] |= msg->input_port ? BIT(3) : 0;
> +               raw->msg[idx] |= FIELD_PREP(GENMASK(2, 0), msg-
> >peer_device_type);
> +               idx++;
> +               break;
> +       }
> +       case DP_RESOURCE_STATUS_NOTIFY: {
> +               const struct drm_dp_resource_status_notify *msg;
> +
> +               msg = &req->u.resource_stat;
> +               buf[idx] = (msg->port_number & 0xf) << 4;
> +               idx++;
> +               memcpy(&raw->msg[idx], msg->guid, 16);
> +               idx += 16;
> +               buf[idx] = (msg->available_pbn & 0xff00) >> 8;
> +               idx++;
> +               buf[idx] = (msg->available_pbn & 0xff);
> +               idx++;
> +               break;
> +       }
>         }
>         raw->cur_len = idx;
>  }
> @@ -672,6 +703,22 @@ drm_dp_dump_sideband_msg_req_body(const struct
> drm_dp_sideband_msg_req_body *req
>                   req->u.enc_status.stream_behavior,
>                   req->u.enc_status.valid_stream_behavior);
>                 break;
> +       case DP_CONNECTION_STATUS_NOTIFY:
> +               P("port=%d guid=%*ph legacy=%d displayport=%d messaging=%d
> input=%d peer_type=%d",
> +                 req->u.conn_stat.port_number,
> +                 (int)ARRAY_SIZE(req->u.conn_stat.guid), req->u.conn_stat.guid,
> +                 req->u.conn_stat.legacy_device_plug_status,
> +                 req->u.conn_stat.displayport_device_plug_status,
> +                 req->u.conn_stat.message_capability_status,
> +                 req->u.conn_stat.input_port,
> +                 req->u.conn_stat.peer_device_type);
> +               break;
> +       case DP_RESOURCE_STATUS_NOTIFY:
> +               P("port=%d guid=%*ph pbn=%d",
> +                 req->u.resource_stat.port_number,
> +                 (int)ARRAY_SIZE(req->u.resource_stat.guid), req-
> >u.resource_stat.guid,
> +                 req->u.resource_stat.available_pbn);
> +               break;
>         default:
>                 P("???\n");
>                 break;
> @@ -1116,9 +1163,9 @@ static bool
> drm_dp_sideband_parse_resource_status_notify(const struct drm_dp_mst
>         return false;
>  }
>
> -static bool drm_dp_sideband_parse_req(const struct drm_dp_mst_topology_mgr
> *mgr,
> -                                     struct drm_dp_sideband_msg_rx *raw,
> -                                     struct drm_dp_sideband_msg_req_body *msg)
> +bool drm_dp_sideband_parse_req(const struct drm_dp_mst_topology_mgr *mgr,
> +                              struct drm_dp_sideband_msg_rx *raw,
> +                              struct drm_dp_sideband_msg_req_body *msg)
>  {
>         memset(msg, 0, sizeof(*msg));
>         msg->req_type = (raw->msg[0] & 0x7f);
> @@ -1134,6 +1181,7 @@ static bool drm_dp_sideband_parse_req(const struct
> drm_dp_mst_topology_mgr *mgr,
>                 return false;
>         }
>  }
> +EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_dp_sideband_parse_req);
>
>  static void build_dpcd_write(struct drm_dp_sideband_msg_tx *msg,
>                              u8 port_num, u32 offset, u8 num_bytes, u8 *bytes)
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology_internal.h
> b/drivers/gpu/drm/drm_dp_mst_topology_internal.h
> index eeda9a61c657..0356a2e0dba1 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology_internal.h
> +++ b/drivers/gpu/drm/drm_dp_mst_topology_internal.h
> @@ -21,4 +21,8 @@ void
>  drm_dp_dump_sideband_msg_req_body(const struct drm_dp_sideband_msg_req_body
> *req,
>                                   int indent, struct drm_printer *printer);
>
> +bool
> +drm_dp_sideband_parse_req(const struct drm_dp_mst_topology_mgr *mgr,
> +                         struct drm_dp_sideband_msg_rx *raw,
> +                         struct drm_dp_sideband_msg_req_body *msg);
>  #endif /* !_DRM_DP_MST_HELPER_INTERNAL_H_ */
> diff --git a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> index 6b4759ed6bfd..22aaedc63aec 100644
> --- a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> +++ b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> @@ -13,6 +13,10 @@
>  #include "../drm_dp_mst_topology_internal.h"
>  #include "test-drm_modeset_common.h"
>
> +static void mock_release(struct device *dev)
> +{
> +}
> +
>  int igt_dp_mst_calc_pbn_mode(void *ignored)
>  {
>         int pbn, i;
> @@ -120,27 +124,59 @@ sideband_msg_req_equal(const struct
> drm_dp_sideband_msg_req_body *in,
>  static bool
>  sideband_msg_req_encode_decode(struct drm_dp_sideband_msg_req_body *in)
>  {
> -       struct drm_dp_sideband_msg_req_body *out;
> +       struct drm_dp_sideband_msg_req_body *out = NULL;
>         struct drm_printer p = drm_err_printer(PREFIX_STR);
> -       struct drm_dp_sideband_msg_tx *txmsg;
> +       struct drm_dp_sideband_msg_tx *txmsg = NULL;
> +       struct drm_dp_sideband_msg_rx *rxmsg = NULL;
> +       struct drm_dp_mst_topology_mgr *mgr = NULL;
>         int i, ret;
> -       bool result = true;
> +       bool result = false;
>
>         out = kzalloc(sizeof(*out), GFP_KERNEL);
>         if (!out)
> -               return false;
> +               goto out;
>
>         txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
>         if (!txmsg)
> -               return false;
> +               goto out;
>
> -       drm_dp_encode_sideband_req(in, txmsg);
> -       ret = drm_dp_decode_sideband_req(txmsg, out);
> -       if (ret < 0) {
> -               drm_printf(&p, "Failed to decode sideband request: %d\n",
> -                          ret);
> -               result = false;
> +       rxmsg = kzalloc(sizeof(*rxmsg), GFP_KERNEL);
> +       if (!rxmsg)
>                 goto out;
> +
> +       mgr = kzalloc(sizeof(*mgr), GFP_KERNEL);
> +       if (!mgr)
> +               goto out;
> +
> +       mgr->dev = kzalloc(sizeof(*mgr->dev), GFP_KERNEL);
> +       if (!mgr->dev)
> +               goto out;
> +
> +       mgr->dev->dev = kzalloc(sizeof(*mgr->dev->dev), GFP_KERNEL);
> +       if (!mgr->dev->dev)
> +               goto out;
> +
> +       mgr->dev->dev->release = mock_release;
> +       device_initialize(mgr->dev->dev);
> +
> +       drm_dp_encode_sideband_req(in, txmsg);
> +       switch (in->req_type) {
> +       case DP_CONNECTION_STATUS_NOTIFY:
> +       case DP_RESOURCE_STATUS_NOTIFY:
> +               memcpy(&rxmsg->msg, txmsg->msg, ARRAY_SIZE(rxmsg->msg));
> +               rxmsg->curlen = txmsg->cur_len;
> +               if (!drm_dp_sideband_parse_req(mgr, rxmsg, out)) {
> +                       drm_printf(&p, "Failed to decode sideband request\n");
> +                       goto out;
> +               }
> +               break;
> +       default:
> +               ret = drm_dp_decode_sideband_req(txmsg, out);
> +               if (ret < 0) {
> +                       drm_printf(&p, "Failed to decode sideband request:
> %d\n", ret);
> +                       goto out;
> +               }
> +               break;
>         }
>
>         if (!sideband_msg_req_equal(in, out)) {
> @@ -148,9 +184,9 @@ sideband_msg_req_encode_decode(struct
> drm_dp_sideband_msg_req_body *in)
>                 drm_dp_dump_sideband_msg_req_body(in, 1, &p);
>                 drm_printf(&p, "Got:\n");
>                 drm_dp_dump_sideband_msg_req_body(out, 1, &p);
> -               result = false;
>                 goto out;
>         }
> +       result = true;
>
>         switch (in->req_type) {
>         case DP_REMOTE_DPCD_WRITE:
> @@ -171,6 +207,65 @@ sideband_msg_req_encode_decode(struct
> drm_dp_sideband_msg_req_body *in)
>  out:
>         kfree(out);
>         kfree(txmsg);
> +       kfree(rxmsg);
> +       if (mgr) {
> +               if (mgr->dev) {
> +                       put_device(mgr->dev->dev);
> +                       kfree(mgr->dev);
> +               }
> +               kfree(mgr);
> +       }
> +       return result;
> +}
> +
> +static bool
> +sideband_msg_req_parse(int req_type)
> +{
> +       struct drm_dp_sideband_msg_req_body *out = NULL;
> +       struct drm_printer p = drm_err_printer(PREFIX_STR);
> +       struct drm_dp_sideband_msg_rx *rxmsg = NULL;
> +       struct drm_dp_mst_topology_mgr *mgr = NULL;
> +       bool result = false;
> +
> +       out = kzalloc(sizeof(*out), GFP_KERNEL);
> +       if (!out)
> +               goto out;
> +
> +       rxmsg = kzalloc(sizeof(*rxmsg), GFP_KERNEL);
> +       if (!rxmsg)
> +               goto out;
> +
> +       mgr = kzalloc(sizeof(*mgr), GFP_KERNEL);
> +       if (!mgr)
> +               goto out;
> +
> +       mgr->dev = kzalloc(sizeof(*mgr->dev), GFP_KERNEL);
> +       if (!mgr->dev)
> +               goto out;
> +
> +       mgr->dev->dev = kzalloc(sizeof(*mgr->dev->dev), GFP_KERNEL);
> +       if (!mgr->dev->dev)
> +               goto out;
> +
> +       mgr->dev->dev->release = mock_release;
> +       device_initialize(mgr->dev->dev);
> +
> +       rxmsg->curlen = 1;
> +       rxmsg->msg[0] = req_type & 0x7f;
> +       if (drm_dp_sideband_parse_req(mgr, rxmsg, out))
> +               drm_printf(&p, "Unexpectedly decoded invalid sideband
> request\n");
> +       else
> +               result = true;
> +out:
> +       kfree(out);
> +       kfree(rxmsg);
> +       if (mgr) {
> +               if (mgr->dev) {
> +                       put_device(mgr->dev->dev);
> +                       kfree(mgr->dev);
> +               }
> +               kfree(mgr);
> +       }
>         return result;
>  }
>
> @@ -268,6 +363,34 @@ int igt_dp_mst_sideband_msg_req_decode(void *unused)
>         in.u.enc_status.valid_stream_behavior = 1;
>         DO_TEST();
>
> +       in.req_type = DP_CONNECTION_STATUS_NOTIFY;
> +       in.u.conn_stat.port_number = 0xf;
> +       get_random_bytes(in.u.conn_stat.guid, sizeof(in.u.conn_stat.guid));
> +       in.u.conn_stat.legacy_device_plug_status = 1;
> +       in.u.conn_stat.displayport_device_plug_status = 0;
> +       in.u.conn_stat.message_capability_status = 0;
> +       in.u.conn_stat.input_port = 0;
> +       in.u.conn_stat.peer_device_type = 7;
> +       DO_TEST();
> +       in.u.conn_stat.displayport_device_plug_status = 1;
> +       DO_TEST();
> +       in.u.conn_stat.message_capability_status = 1;
> +       DO_TEST();
> +       in.u.conn_stat.input_port = 1;
> +       DO_TEST();
> +
> +       in.req_type = DP_RESOURCE_STATUS_NOTIFY;
> +       in.u.resource_stat.port_number = 0xf;
> +       get_random_bytes(in.u.resource_stat.guid,
> sizeof(in.u.resource_stat.guid));
> +       in.u.resource_stat.available_pbn = 0xcdef;
> +       DO_TEST();
> +
> +#undef DO_TEST
> +#define DO_TEST(req_type) FAIL_ON(!sideband_msg_req_parse(req_type))
> +       DO_TEST(DP_CONNECTION_STATUS_NOTIFY);
> +       DO_TEST(DP_RESOURCE_STATUS_NOTIFY);
> +
> +       DO_TEST(DP_REMOTE_I2C_WRITE);
>  #undef DO_TEST
>         return 0;
>  }
>
> --
> Sincerely,
>    Lyude Paul (she/her)
>    Software Engineer at Red Hat
>
> Note: I deal with a lot of emails and have a lot of bugs on my plate. If you've
> asked me a question, are waiting for a review/merge on a patch, etc. and I
> haven't responded in a while, please feel free to send me another email to check
> on my status. I don't bite!
>
