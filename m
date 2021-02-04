Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8BF30F001
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 10:55:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA60F6EC94;
	Thu,  4 Feb 2021 09:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E736E02B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 09:55:05 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id v123so2525684yba.13
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 01:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7IzzBgfqkR0XduGUbxj9/KczKugoj7rYyCKR9If1m+o=;
 b=XyhU70E0WJ2Yx2Ye3uRlrIyNyeOsyCiJDOvVc/+dfeGcpn2AezKuE2DKAsO4lPJovj
 z0cAl86qniSYZ1HNxBSxYXpBdHdPCopsFu6cJDMTAxb41M82ZRaBoWCiqjOHKICe56MX
 8bBwL7XMTAJWccwMYfYdtrLwwlNhPqCRXeaSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7IzzBgfqkR0XduGUbxj9/KczKugoj7rYyCKR9If1m+o=;
 b=Bg8LXYIg+C6G4htWFqgCOqojmn4fEGxhOtoLTXnMXQsThR27UTMobt1ijmHPF2Slmb
 FMFbGni4tTtyRKf/d0n4UEX1REpAATFLgRP2jRw2r9CE26Yjtpc9oyTYXWGTIAM592q+
 /CYqBTJ458/ABvWTxp1RZ3oZUOagmG6x2v+QbyiYCxmdOrs0JpYH1P4vogWmn9ktOGet
 WWEMEwVqJLAv/u9wvnDBhqeQ2opir/QVChOKwWirBDpkUHSJtGRLmcKsI8LYKbGI1KvR
 T6WQ50gwmCLkgCzsTZShuYn2XFasws1Oz8hb3y6hu3rolJtK8nYHAFfv/WWr2NoWX6aL
 yOOg==
X-Gm-Message-State: AOAM531J42OlDvpxpwbOn+9y4UI5caVFp9wT8nihyfu/GmLu5GwCKcQp
 +kFjd4x5StsjGNe1DbWFmyJG0USxxf3ATF158LPp9Q==
X-Google-Smtp-Source: ABdhPJysUIMWSJISAvUpk0QiGDWkSOy27ahpGKdhVlPjhnWRNTgApyJD4c8+NjTtSjLyrpthyEHZWzSGCh1pc0m6CYk=
X-Received: by 2002:a25:be4b:: with SMTP id d11mr12291667ybm.16.1612432504033; 
 Thu, 04 Feb 2021 01:55:04 -0800 (PST)
MIME-Version: 1.0
References: <20200923121320.v3.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
 <57384ff32e3b42e8ea72ca298e9ae1f7fdac25d7.camel@redhat.com>
 <a2a23c6a-4c38-59ee-7b96-70140ada0f44@xs4all.nl>
In-Reply-To: <a2a23c6a-4c38-59ee-7b96-70140ada0f44@xs4all.nl>
From: Sam McNally <sammc@chromium.org>
Date: Thu, 4 Feb 2021 20:54:27 +1100
Message-ID: <CAJqEsoAAgqnirFirxfiAvTObG-j9DRE_qvMd1uu5DRTHAyFq=Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dp/dp_mst: Add support for sink event notify
 messages
To: Hans Verkuil <hverkuil@xs4all.nl>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: multipart/mixed; boundary="===============0261599882=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0261599882==
Content-Type: multipart/alternative; boundary="000000000000a1029805ba7fb28f"

--000000000000a1029805ba7fb28f
Content-Type: text/plain; charset="UTF-8"

I can for this patch; I'm not really sure of the right approach for the
other two though.

On Wed, 3 Feb 2021 at 20:57, Hans Verkuil <hverkuil@xs4all.nl> wrote:

> Hi Sam,
>
> Are you able to work on a v4?
>
> I haven't heard from you for some time now. I would be willing to take over
> this series if it wasn't for the fact that I do not have any hardware to
> test
> this with.
>
> Regards,
>
>         Hans
>
> On 01/02/2021 22:56, Lyude Paul wrote:
> > On Wed, 2020-09-23 at 12:13 +1000, Sam McNally wrote:
> >> Sink event notify messages are used for MST CEC IRQs. Add parsing
> >> support for sink event notify messages in preparation for handling MST
> >> CEC IRQs.
> >>
> >> Signed-off-by: Sam McNally <sammc@chromium.org>
> >> ---
> >>
> >> (no changes since v1)
> >>
> >>  drivers/gpu/drm/drm_dp_mst_topology.c | 37 ++++++++++++++++++++++++++-
> >>  include/drm/drm_dp_mst_helper.h       | 14 ++++++++++
> >>  2 files changed, 50 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> >> b/drivers/gpu/drm/drm_dp_mst_topology.c
> >> index 17dbed0a9800..15b6cc39a754 100644
> >> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> >> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> >> @@ -1027,6 +1027,30 @@ static bool
> >> drm_dp_sideband_parse_resource_status_notify(struct drm_dp_sideband_
> >>         return false;
> >>  }
> >>
> >> +static bool drm_dp_sideband_parse_sink_event_notify(
> >> +       struct drm_dp_sideband_msg_rx *raw,
> >> +       struct drm_dp_sideband_msg_req_body *msg)
> >> +{
> >> +       int idx = 1;
> >> +
> >> +       msg->u.sink_event.port_number = (raw->msg[idx] & 0xf0) >> 4;
> >> +       idx++;
> >> +       if (idx > raw->curlen)
> >> +               goto fail_len;
> >> +
> >> +       memcpy(msg->u.sink_event.guid, &raw->msg[idx], 16);
> >> +       idx += 16;
> >> +       if (idx > raw->curlen)
> >> +               goto fail_len;
> >> +
> >> +       msg->u.sink_event.event_id = (raw->msg[idx] << 8) |
> (raw->msg[idx +
> >> 1]);
> >> +       idx++;
> >> +       return true;
> >> +fail_len:
> >> +       DRM_DEBUG_KMS("sink event notify parse length fail %d %d\n",
> idx, raw-
> >>> curlen);
> >
> > Is it possible for us to use drm_dbg_kms() here?
> >
> > Also-there is an MST selftest you should update for this
> >
> >> +       return false;
> >> +}
> >> +
> >>  static bool drm_dp_sideband_parse_req(struct drm_dp_sideband_msg_rx
> *raw,
> >>                                       struct
> drm_dp_sideband_msg_req_body
> >> *msg)
> >>  {
> >> @@ -1038,6 +1062,8 @@ static bool drm_dp_sideband_parse_req(struct
> >> drm_dp_sideband_msg_rx *raw,
> >>                 return
> drm_dp_sideband_parse_connection_status_notify(raw,
> >> msg);
> >>         case DP_RESOURCE_STATUS_NOTIFY:
> >>                 return
> drm_dp_sideband_parse_resource_status_notify(raw, msg);
> >> +       case DP_SINK_EVENT_NOTIFY:
> >> +               return drm_dp_sideband_parse_sink_event_notify(raw,
> msg);
> >>         default:
> >>                 DRM_ERROR("Got unknown request 0x%02x (%s)\n",
> msg->req_type,
> >>                           drm_dp_mst_req_type_str(msg->req_type));
> >> @@ -3875,6 +3901,8 @@ drm_dp_mst_process_up_req(struct
> drm_dp_mst_topology_mgr
> >> *mgr,
> >>                         guid = msg->u.conn_stat.guid;
> >>                 else if (msg->req_type == DP_RESOURCE_STATUS_NOTIFY)
> >>                         guid = msg->u.resource_stat.guid;
> >> +               else if (msg->req_type == DP_SINK_EVENT_NOTIFY)
> >> +                       guid = msg->u.sink_event.guid;
> >>
> >>                 if (guid)
> >>                         mstb = drm_dp_get_mst_branch_device_by_guid(mgr,
> >> guid);
> >> @@ -3948,7 +3976,8 @@ static int drm_dp_mst_handle_up_req(struct
> >> drm_dp_mst_topology_mgr *mgr)
> >>         drm_dp_sideband_parse_req(&mgr->up_req_recv, &up_req->msg);
> >>
> >>         if (up_req->msg.req_type != DP_CONNECTION_STATUS_NOTIFY &&
> >> -           up_req->msg.req_type != DP_RESOURCE_STATUS_NOTIFY) {
> >> +           up_req->msg.req_type != DP_RESOURCE_STATUS_NOTIFY &&
> >> +           up_req->msg.req_type != DP_SINK_EVENT_NOTIFY) {
> >>                 DRM_DEBUG_KMS("Received unknown up req type, ignoring:
> %x\n",
> >>                               up_req->msg.req_type);
> >>                 kfree(up_req);
> >> @@ -3976,6 +4005,12 @@ static int drm_dp_mst_handle_up_req(struct
> >> drm_dp_mst_topology_mgr *mgr)
> >>                 DRM_DEBUG_KMS("Got RSN: pn: %d avail_pbn %d\n",
> >>                               res_stat->port_number,
> >>                               res_stat->available_pbn);
> >> +       } else if (up_req->msg.req_type == DP_SINK_EVENT_NOTIFY) {
> >> +               const struct drm_dp_sink_event_notify *sink_event =
> >> +                       &up_req->msg.u.sink_event;
> >> +
> >> +               DRM_DEBUG_KMS("Got SEN: pn: %d event_id %d\n",
> >> +                             sink_event->port_number,
> sink_event->event_id);
> >>         }
> >>
> >>         up_req->hdr = mgr->up_req_recv.initial_hdr;
> >> diff --git a/include/drm/drm_dp_mst_helper.h
> b/include/drm/drm_dp_mst_helper.h
> >> index 6ae5860d8644..c7c79e0ced18 100644
> >> --- a/include/drm/drm_dp_mst_helper.h
> >> +++ b/include/drm/drm_dp_mst_helper.h
> >> @@ -402,6 +402,19 @@ struct drm_dp_resource_status_notify {
> >>         u16 available_pbn;
> >>  };
> >>
> >> +#define DP_SINK_EVENT_PANEL_REPLAY_ACTIVE_FRAME_CRC_ERROR      BIT(0)
> >> +#define DP_SINK_EVENT_PANEL_REPLAY_RFB_STORAGE_ERROR           BIT(1)
> >> +#define DP_SINK_EVENT_DSC_RC_BUFFER_UNDER_RUN                  BIT(2)
> >> +#define DP_SINK_EVENT_DSC_RC_BUFFER_OVERFLOW                   BIT(3)
> >> +#define DP_SINK_EVENT_DSC_CHUNK_LENGTH_ERROR                   BIT(4)
> >> +#define DP_SINK_EVENT_CEC_IRQ_EVENT                            BIT(5)
> >> +
> >> +struct drm_dp_sink_event_notify {
> >> +       u8 port_number;
> >> +       u8 guid[16];
> >> +       u16 event_id;
> >> +};
> >> +
> >>  struct drm_dp_query_payload_ack_reply {
> >>         u8 port_number;
> >>         u16 allocated_pbn;
> >> @@ -413,6 +426,7 @@ struct drm_dp_sideband_msg_req_body {
> >>                 struct drm_dp_connection_status_notify conn_stat;
> >>                 struct drm_dp_port_number_req port_num;
> >>                 struct drm_dp_resource_status_notify resource_stat;
> >> +               struct drm_dp_sink_event_notify sink_event;
> >>
> >>                 struct drm_dp_query_payload query_payload;
> >>                 struct drm_dp_allocate_payload allocate_payload;
> >
>
>

--000000000000a1029805ba7fb28f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SSBjYW4gZm9yIHRoaXMgcGF0Y2g7IEkmIzM5O20gbm90IHJlYWxseSBz
dXJlIG9mIHRoZSByaWdodCBhcHByb2FjaCBmb3IgdGhlIG90aGVyIHR3byB0aG91Z2guPC9kaXY+
PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxf
YXR0ciI+T24gV2VkLCAzIEZlYiAyMDIxIGF0IDIwOjU3LCBIYW5zIFZlcmt1aWwgJmx0OzxhIGhy
ZWY9Im1haWx0bzpodmVya3VpbEB4czRhbGwubmwiPmh2ZXJrdWlsQHhzNGFsbC5ubDwvYT4mZ3Q7
IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJt
YXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0
LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+SGkgU2FtLDxicj4NCjxicj4NCkFyZSB5b3UgYWJsZSB0
byB3b3JrIG9uIGEgdjQ/PGJyPg0KPGJyPg0KSSBoYXZlbiYjMzk7dCBoZWFyZCBmcm9tIHlvdSBm
b3Igc29tZSB0aW1lIG5vdy4gSSB3b3VsZCBiZSB3aWxsaW5nIHRvIHRha2Ugb3Zlcjxicj4NCnRo
aXMgc2VyaWVzIGlmIGl0IHdhc24mIzM5O3QgZm9yIHRoZSBmYWN0IHRoYXQgSSBkbyBub3QgaGF2
ZSBhbnkgaGFyZHdhcmUgdG8gdGVzdDxicj4NCnRoaXMgd2l0aC48YnI+DQo8YnI+DQpSZWdhcmRz
LDxicj4NCjxicj4NCsKgIMKgIMKgIMKgIEhhbnM8YnI+DQo8YnI+DQpPbiAwMS8wMi8yMDIxIDIy
OjU2LCBMeXVkZSBQYXVsIHdyb3RlOjxicj4NCiZndDsgT24gV2VkLCAyMDIwLTA5LTIzIGF0IDEy
OjEzICsxMDAwLCBTYW0gTWNOYWxseSB3cm90ZTo8YnI+DQomZ3Q7Jmd0OyBTaW5rIGV2ZW50IG5v
dGlmeSBtZXNzYWdlcyBhcmUgdXNlZCBmb3IgTVNUIENFQyBJUlFzLiBBZGQgcGFyc2luZzxicj4N
CiZndDsmZ3Q7IHN1cHBvcnQgZm9yIHNpbmsgZXZlbnQgbm90aWZ5IG1lc3NhZ2VzIGluIHByZXBh
cmF0aW9uIGZvciBoYW5kbGluZyBNU1Q8YnI+DQomZ3Q7Jmd0OyBDRUMgSVJRcy48YnI+DQomZ3Q7
Jmd0Ozxicj4NCiZndDsmZ3Q7IFNpZ25lZC1vZmYtYnk6IFNhbSBNY05hbGx5ICZsdDs8YSBocmVm
PSJtYWlsdG86c2FtbWNAY2hyb21pdW0ub3JnIiB0YXJnZXQ9Il9ibGFuayI+c2FtbWNAY2hyb21p
dW0ub3JnPC9hPiZndDs8YnI+DQomZ3Q7Jmd0OyAtLS08YnI+DQomZ3Q7Jmd0Ozxicj4NCiZndDsm
Z3Q7IChubyBjaGFuZ2VzIHNpbmNlIHYxKTxicj4NCiZndDsmZ3Q7PGJyPg0KJmd0OyZndDsgwqBk
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMzcgKysrKysrKysrKysrKysr
KysrKysrKysrKystPGJyPg0KJmd0OyZndDsgwqBpbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBl
ci5owqDCoMKgwqDCoMKgIHwgMTQgKysrKysrKysrKzxicj4NCiZndDsmZ3Q7IMKgMiBmaWxlcyBj
aGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pPGJyPg0KJmd0OyZndDs8YnI+
DQomZ3Q7Jmd0OyBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xv
Z3kuYzxicj4NCiZndDsmZ3Q7IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3ku
Yzxicj4NCiZndDsmZ3Q7IGluZGV4IDE3ZGJlZDBhOTgwMC4uMTViNmNjMzlhNzU0IDEwMDY0NDxi
cj4NCiZndDsmZ3Q7IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmM8
YnI+DQomZ3Q7Jmd0OyArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
PGJyPg0KJmd0OyZndDsgQEAgLTEwMjcsNiArMTAyNywzMCBAQCBzdGF0aWMgYm9vbDxicj4NCiZn
dDsmZ3Q7IGRybV9kcF9zaWRlYmFuZF9wYXJzZV9yZXNvdXJjZV9zdGF0dXNfbm90aWZ5KHN0cnVj
dCBkcm1fZHBfc2lkZWJhbmRfPGJyPg0KJmd0OyZndDsgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBm
YWxzZTs8YnI+DQomZ3Q7Jmd0OyDCoH08YnI+DQomZ3Q7Jmd0OyDCoDxicj4NCiZndDsmZ3Q7ICtz
dGF0aWMgYm9vbCBkcm1fZHBfc2lkZWJhbmRfcGFyc2Vfc2lua19ldmVudF9ub3RpZnkoPGJyPg0K
Jmd0OyZndDsgK8KgwqDCoMKgwqDCoMKgc3RydWN0IGRybV9kcF9zaWRlYmFuZF9tc2dfcnggKnJh
dyw8YnI+DQomZ3Q7Jmd0OyArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21z
Z19yZXFfYm9keSAqbXNnKTxicj4NCiZndDsmZ3Q7ICt7PGJyPg0KJmd0OyZndDsgK8KgwqDCoMKg
wqDCoMKgaW50IGlkeCA9IDE7PGJyPg0KJmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7ICvCoMKgwqDC
oMKgwqDCoG1zZy0mZ3Q7dS5zaW5rX2V2ZW50LnBvcnRfbnVtYmVyID0gKHJhdy0mZ3Q7bXNnW2lk
eF0gJmFtcDsgMHhmMCkgJmd0OyZndDsgNDs8YnI+DQomZ3Q7Jmd0OyArwqDCoMKgwqDCoMKgwqBp
ZHgrKzs8YnI+DQomZ3Q7Jmd0OyArwqDCoMKgwqDCoMKgwqBpZiAoaWR4ICZndDsgcmF3LSZndDtj
dXJsZW4pPGJyPg0KJmd0OyZndDsgK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8g
ZmFpbF9sZW47PGJyPg0KJmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7ICvCoMKgwqDCoMKgwqDCoG1l
bWNweShtc2ctJmd0O3Uuc2lua19ldmVudC5ndWlkLCAmYW1wO3Jhdy0mZ3Q7bXNnW2lkeF0sIDE2
KTs8YnI+DQomZ3Q7Jmd0OyArwqDCoMKgwqDCoMKgwqBpZHggKz0gMTY7PGJyPg0KJmd0OyZndDsg
K8KgwqDCoMKgwqDCoMKgaWYgKGlkeCAmZ3Q7IHJhdy0mZ3Q7Y3VybGVuKTxicj4NCiZndDsmZ3Q7
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGZhaWxfbGVuOzxicj4NCiZndDsm
Z3Q7ICs8YnI+DQomZ3Q7Jmd0OyArwqDCoMKgwqDCoMKgwqBtc2ctJmd0O3Uuc2lua19ldmVudC5l
dmVudF9pZCA9IChyYXctJmd0O21zZ1tpZHhdICZsdDsmbHQ7IDgpIHwgKHJhdy0mZ3Q7bXNnW2lk
eCArPGJyPg0KJmd0OyZndDsgMV0pOzxicj4NCiZndDsmZ3Q7ICvCoMKgwqDCoMKgwqDCoGlkeCsr
Ozxicj4NCiZndDsmZ3Q7ICvCoMKgwqDCoMKgwqDCoHJldHVybiB0cnVlOzxicj4NCiZndDsmZ3Q7
ICtmYWlsX2xlbjo8YnI+DQomZ3Q7Jmd0OyArwqDCoMKgwqDCoMKgwqBEUk1fREVCVUdfS01TKCZx
dW90O3NpbmsgZXZlbnQgbm90aWZ5IHBhcnNlIGxlbmd0aCBmYWlsICVkICVkXG4mcXVvdDssIGlk
eCwgcmF3LTxicj4NCiZndDsmZ3Q7Jmd0OyBjdXJsZW4pOzxicj4NCiZndDsgPGJyPg0KJmd0OyBJ
cyBpdCBwb3NzaWJsZSBmb3IgdXMgdG8gdXNlIGRybV9kYmdfa21zKCkgaGVyZT88YnI+DQomZ3Q7
IDxicj4NCiZndDsgQWxzby10aGVyZSBpcyBhbiBNU1Qgc2VsZnRlc3QgeW91IHNob3VsZCB1cGRh
dGUgZm9yIHRoaXM8YnI+DQomZ3Q7IDxicj4NCiZndDsmZ3Q7ICvCoMKgwqDCoMKgwqDCoHJldHVy
biBmYWxzZTs8YnI+DQomZ3Q7Jmd0OyArfTxicj4NCiZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyDC
oHN0YXRpYyBib29sIGRybV9kcF9zaWRlYmFuZF9wYXJzZV9yZXEoc3RydWN0IGRybV9kcF9zaWRl
YmFuZF9tc2dfcnggKnJhdyw8YnI+DQomZ3Q7Jmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qg
ZHJtX2RwX3NpZGViYW5kX21zZ19yZXFfYm9keTxicj4NCiZndDsmZ3Q7ICptc2cpPGJyPg0KJmd0
OyZndDsgwqB7PGJyPg0KJmd0OyZndDsgQEAgLTEwMzgsNiArMTA2Miw4IEBAIHN0YXRpYyBib29s
IGRybV9kcF9zaWRlYmFuZF9wYXJzZV9yZXEoc3RydWN0PGJyPg0KJmd0OyZndDsgZHJtX2RwX3Np
ZGViYW5kX21zZ19yeCAqcmF3LDxicj4NCiZndDsmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcmV0dXJuIGRybV9kcF9zaWRlYmFuZF9wYXJzZV9jb25uZWN0aW9uX3N0YXR1c19u
b3RpZnkocmF3LDxicj4NCiZndDsmZ3Q7IG1zZyk7PGJyPg0KJmd0OyZndDsgwqDCoMKgwqDCoMKg
wqDCoGNhc2UgRFBfUkVTT1VSQ0VfU1RBVFVTX05PVElGWTo8YnI+DQomZ3Q7Jmd0OyDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBkcm1fZHBfc2lkZWJhbmRfcGFyc2VfcmVz
b3VyY2Vfc3RhdHVzX25vdGlmeShyYXcsIG1zZyk7PGJyPg0KJmd0OyZndDsgK8KgwqDCoMKgwqDC
oMKgY2FzZSBEUF9TSU5LX0VWRU5UX05PVElGWTo8YnI+DQomZ3Q7Jmd0OyArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGRybV9kcF9zaWRlYmFuZF9wYXJzZV9zaW5rX2V2ZW50
X25vdGlmeShyYXcsIG1zZyk7PGJyPg0KJmd0OyZndDsgwqDCoMKgwqDCoMKgwqDCoGRlZmF1bHQ6
PGJyPg0KJmd0OyZndDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBEUk1fRVJST1Io
JnF1b3Q7R290IHVua25vd24gcmVxdWVzdCAweCUwMnggKCVzKVxuJnF1b3Q7LCBtc2ctJmd0O3Jl
cV90eXBlLDxicj4NCiZndDsmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGRybV9kcF9tc3RfcmVxX3R5cGVfc3RyKG1zZy0mZ3Q7cmVxX3R5cGUp
KTs8YnI+DQomZ3Q7Jmd0OyBAQCAtMzg3NSw2ICszOTAxLDggQEAgZHJtX2RwX21zdF9wcm9jZXNz
X3VwX3JlcShzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3I8YnI+DQomZ3Q7Jmd0OyAqbWdy
LDxicj4NCiZndDsmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGd1aWQgPSBtc2ctJmd0O3UuY29ubl9zdGF0Lmd1aWQ7PGJyPg0KJmd0OyZndDsgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlbHNlIGlmIChtc2ctJmd0O3JlcV90eXBlID09
IERQX1JFU09VUkNFX1NUQVRVU19OT1RJRlkpPGJyPg0KJmd0OyZndDsgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ3VpZCA9IG1zZy0mZ3Q7dS5yZXNvdXJj
ZV9zdGF0Lmd1aWQ7PGJyPg0KJmd0OyZndDsgK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGVsc2UgaWYgKG1zZy0mZ3Q7cmVxX3R5cGUgPT0gRFBfU0lOS19FVkVOVF9OT1RJRlkpPGJyPg0K
Jmd0OyZndDsgK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBn
dWlkID0gbXNnLSZndDt1LnNpbmtfZXZlbnQuZ3VpZDs8YnI+DQomZ3Q7Jmd0OyDCoDxicj4NCiZn
dDsmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGd1aWQpPGJyPg0KJmd0
OyZndDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbXN0
YiA9IGRybV9kcF9nZXRfbXN0X2JyYW5jaF9kZXZpY2VfYnlfZ3VpZChtZ3IsPGJyPg0KJmd0OyZn
dDsgZ3VpZCk7PGJyPg0KJmd0OyZndDsgQEAgLTM5NDgsNyArMzk3Niw4IEBAIHN0YXRpYyBpbnQg
ZHJtX2RwX21zdF9oYW5kbGVfdXBfcmVxKHN0cnVjdDxicj4NCiZndDsmZ3Q7IGRybV9kcF9tc3Rf
dG9wb2xvZ3lfbWdyICptZ3IpPGJyPg0KJmd0OyZndDsgwqDCoMKgwqDCoMKgwqDCoGRybV9kcF9z
aWRlYmFuZF9wYXJzZV9yZXEoJmFtcDttZ3ItJmd0O3VwX3JlcV9yZWN2LCAmYW1wO3VwX3JlcS0m
Z3Q7bXNnKTs8YnI+DQomZ3Q7Jmd0OyDCoDxicj4NCiZndDsmZ3Q7IMKgwqDCoMKgwqDCoMKgwqBp
ZiAodXBfcmVxLSZndDttc2cucmVxX3R5cGUgIT0gRFBfQ09OTkVDVElPTl9TVEFUVVNfTk9USUZZ
ICZhbXA7JmFtcDs8YnI+DQomZ3Q7Jmd0OyAtwqDCoMKgwqDCoMKgwqDCoMKgwqAgdXBfcmVxLSZn
dDttc2cucmVxX3R5cGUgIT0gRFBfUkVTT1VSQ0VfU1RBVFVTX05PVElGWSkgezxicj4NCiZndDsm
Z3Q7ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCB1cF9yZXEtJmd0O21zZy5yZXFfdHlwZSAhPSBEUF9S
RVNPVVJDRV9TVEFUVVNfTk9USUZZICZhbXA7JmFtcDs8YnI+DQomZ3Q7Jmd0OyArwqDCoMKgwqDC
oMKgwqDCoMKgwqAgdXBfcmVxLSZndDttc2cucmVxX3R5cGUgIT0gRFBfU0lOS19FVkVOVF9OT1RJ
RlkpIHs8YnI+DQomZ3Q7Jmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoERSTV9E
RUJVR19LTVMoJnF1b3Q7UmVjZWl2ZWQgdW5rbm93biB1cCByZXEgdHlwZSwgaWdub3Jpbmc6ICV4
XG4mcXVvdDssPGJyPg0KJmd0OyZndDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1cF9yZXEtJmd0O21zZy5yZXFfdHlwZSk7PGJyPg0K
Jmd0OyZndDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBrZnJlZSh1cF9yZXEpOzxi
cj4NCiZndDsmZ3Q7IEBAIC0zOTc2LDYgKzQwMDUsMTIgQEAgc3RhdGljIGludCBkcm1fZHBfbXN0
X2hhbmRsZV91cF9yZXEoc3RydWN0PGJyPg0KJmd0OyZndDsgZHJtX2RwX21zdF90b3BvbG9neV9t
Z3IgKm1ncik8YnI+DQomZ3Q7Jmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoERS
TV9ERUJVR19LTVMoJnF1b3Q7R290IFJTTjogcG46ICVkIGF2YWlsX3BibiAlZFxuJnF1b3Q7LDxi
cj4NCiZndDsmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmVzX3N0YXQtJmd0O3BvcnRfbnVtYmVyLDxicj4NCiZndDsmZ3Q7IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmVzX3N0YXQtJmd0O2F2YWlsYWJsZV9wYm4pOzxicj4NCiZndDsmZ3Q7ICvCoMKgwqDCoMKgwqDC
oH0gZWxzZSBpZiAodXBfcmVxLSZndDttc2cucmVxX3R5cGUgPT0gRFBfU0lOS19FVkVOVF9OT1RJ
RlkpIHs8YnI+DQomZ3Q7Jmd0OyArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29uc3Qg
c3RydWN0IGRybV9kcF9zaW5rX2V2ZW50X25vdGlmeSAqc2lua19ldmVudCA9PGJyPg0KJmd0OyZn
dDsgK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAmYW1wO3Vw
X3JlcS0mZ3Q7bXNnLnUuc2lua19ldmVudDs8YnI+DQomZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsg
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoERSTV9ERUJVR19LTVMoJnF1b3Q7R290IFNF
TjogcG46ICVkIGV2ZW50X2lkICVkXG4mcXVvdDssPGJyPg0KJmd0OyZndDsgK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNpbmtfZXZlbnQt
Jmd0O3BvcnRfbnVtYmVyLCBzaW5rX2V2ZW50LSZndDtldmVudF9pZCk7PGJyPg0KJmd0OyZndDsg
wqDCoMKgwqDCoMKgwqDCoH08YnI+DQomZ3Q7Jmd0OyDCoDxicj4NCiZndDsmZ3Q7IMKgwqDCoMKg
wqDCoMKgwqB1cF9yZXEtJmd0O2hkciA9IG1nci0mZ3Q7dXBfcmVxX3JlY3YuaW5pdGlhbF9oZHI7
PGJyPg0KJmd0OyZndDsgZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVy
LmggYi9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oPGJyPg0KJmd0OyZndDsgaW5kZXgg
NmFlNTg2MGQ4NjQ0Li5jN2M3OWUwY2VkMTggMTAwNjQ0PGJyPg0KJmd0OyZndDsgLS0tIGEvaW5j
bHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaDxicj4NCiZndDsmZ3Q7ICsrKyBiL2luY2x1ZGUv
ZHJtL2RybV9kcF9tc3RfaGVscGVyLmg8YnI+DQomZ3Q7Jmd0OyBAQCAtNDAyLDYgKzQwMiwxOSBA
QCBzdHJ1Y3QgZHJtX2RwX3Jlc291cmNlX3N0YXR1c19ub3RpZnkgezxicj4NCiZndDsmZ3Q7IMKg
wqDCoMKgwqDCoMKgwqB1MTYgYXZhaWxhYmxlX3Bibjs8YnI+DQomZ3Q7Jmd0OyDCoH07PGJyPg0K
Jmd0OyZndDsgwqA8YnI+DQomZ3Q7Jmd0OyArI2RlZmluZSBEUF9TSU5LX0VWRU5UX1BBTkVMX1JF
UExBWV9BQ1RJVkVfRlJBTUVfQ1JDX0VSUk9SwqDCoMKgwqDCoMKgQklUKDApPGJyPg0KJmd0OyZn
dDsgKyNkZWZpbmUgRFBfU0lOS19FVkVOVF9QQU5FTF9SRVBMQVlfUkZCX1NUT1JBR0VfRVJST1LC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgQklUKDEpPGJyPg0KJmd0OyZndDsgKyNkZWZpbmUgRFBfU0lO
S19FVkVOVF9EU0NfUkNfQlVGRkVSX1VOREVSX1JVTsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoEJJVCgyKTxicj4NCiZndDsmZ3Q7ICsjZGVmaW5lIERQX1NJTktfRVZFTlRfRFND
X1JDX0JVRkZFUl9PVkVSRkxPV8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
QklUKDMpPGJyPg0KJmd0OyZndDsgKyNkZWZpbmUgRFBfU0lOS19FVkVOVF9EU0NfQ0hVTktfTEVO
R1RIX0VSUk9SwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBCSVQoNCk8YnI+
DQomZ3Q7Jmd0OyArI2RlZmluZSBEUF9TSU5LX0VWRU5UX0NFQ19JUlFfRVZFTlTCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEJJVCg1KTxicj4N
CiZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyArc3RydWN0IGRybV9kcF9zaW5rX2V2ZW50X25vdGlm
eSB7PGJyPg0KJmd0OyZndDsgK8KgwqDCoMKgwqDCoMKgdTggcG9ydF9udW1iZXI7PGJyPg0KJmd0
OyZndDsgK8KgwqDCoMKgwqDCoMKgdTggZ3VpZFsxNl07PGJyPg0KJmd0OyZndDsgK8KgwqDCoMKg
wqDCoMKgdTE2IGV2ZW50X2lkOzxicj4NCiZndDsmZ3Q7ICt9Ozxicj4NCiZndDsmZ3Q7ICs8YnI+
DQomZ3Q7Jmd0OyDCoHN0cnVjdCBkcm1fZHBfcXVlcnlfcGF5bG9hZF9hY2tfcmVwbHkgezxicj4N
CiZndDsmZ3Q7IMKgwqDCoMKgwqDCoMKgwqB1OCBwb3J0X251bWJlcjs8YnI+DQomZ3Q7Jmd0OyDC
oMKgwqDCoMKgwqDCoMKgdTE2IGFsbG9jYXRlZF9wYm47PGJyPg0KJmd0OyZndDsgQEAgLTQxMyw2
ICs0MjYsNyBAQCBzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21zZ19yZXFfYm9keSB7PGJyPg0KJmd0
OyZndDsgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX2RwX2Nvbm5l
Y3Rpb25fc3RhdHVzX25vdGlmeSBjb25uX3N0YXQ7PGJyPg0KJmd0OyZndDsgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX2RwX3BvcnRfbnVtYmVyX3JlcSBwb3J0X251
bTs8YnI+DQomZ3Q7Jmd0OyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBk
cm1fZHBfcmVzb3VyY2Vfc3RhdHVzX25vdGlmeSByZXNvdXJjZV9zdGF0Ozxicj4NCiZndDsmZ3Q7
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX2RwX3NpbmtfZXZlbnRf
bm90aWZ5IHNpbmtfZXZlbnQ7PGJyPg0KJmd0OyZndDsgwqA8YnI+DQomZ3Q7Jmd0OyDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1fZHBfcXVlcnlfcGF5bG9hZCBxdWVy
eV9wYXlsb2FkOzxicj4NCiZndDsmZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
c3RydWN0IGRybV9kcF9hbGxvY2F0ZV9wYXlsb2FkIGFsbG9jYXRlX3BheWxvYWQ7PGJyPg0KJmd0
OyA8YnI+DQo8YnI+DQo8L2Jsb2NrcXVvdGU+PC9kaXY+DQo=
--000000000000a1029805ba7fb28f--

--===============0261599882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0261599882==--
