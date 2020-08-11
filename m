Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC02241C9F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 16:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE1B6E513;
	Tue, 11 Aug 2020 14:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E246E513
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 14:44:15 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id x1so10793716ilp.7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 07:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=llv1I8Ra+lp9TzfZXB+4c+RHx+SY68vPYt6JZN696BY=;
 b=Q2Bf4wE9qJbOyOa5HZsEazeuk9Vb7fii1PA0EPZewz40QPOXVy2x9Ns9l4Tr0KOZgy
 8/IMxjIhJ2MDVIY6hqd7aaODwop13pqmcpc0zY2tj07pYbcFaADCKTDxIAGX5bpfPgek
 zts0h6pyMavAGVZczE4XbP/xSj1MjiXC/muR3Iu3kT8VoU9GuAD1wxuWqbYzcb+Ukx8M
 cDzBfxfsP1Q/YsYf45hdGav2F/303oeQyIr7V7oZZWJVpjJDoQQX9QNVdl0UFJLxC/5Y
 HaBKNUGyWJ6vbtSwPo8Gw0CtJRPybpeCHeGD0CAzZO5cFXWJWJYD1PvK0w0ZlHUEm0mT
 3J3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=llv1I8Ra+lp9TzfZXB+4c+RHx+SY68vPYt6JZN696BY=;
 b=BzZ2+5FKGIKTmPHjl0jZUiuBU606ohq+0IIFgyV67/H+gVR65igOQL2Ucw2IPsrJVB
 cQJMfk66IMMMHrOEE2C+vSy6lGmPjvSA9HHhJN0wVCOOIwFiodjwsxwVEeZLoUDgE7O6
 0Yw4CJWNt0YSgst2uYXMQIa8mw+dsiGIRGOcYbdhYWLvcnFNq7zVe/Av92TRGXmRm6eT
 f8LSwJ0V9PyHzX/LanBssDiYIBX/fMis6ZBIxdpuFG/bvgSo2TiwB3C2v+XshkzpTQNb
 8NQ9P4T1ET3+4e4vW57H3I9rMTphqO+3rDrcPL0fXLvuR/O4GiP9nd/jHw837ItPcifT
 3Nyw==
X-Gm-Message-State: AOAM532fBokqZYqUpuW5p52XJMZ4jrAvoAvSqrA2R16eQ1Om9kdjsowZ
 z+Y3RbSiojfUa6O3hEmZ1P0TcJurAlz8h7qut4kUGg==
X-Google-Smtp-Source: ABdhPJwFrp+IcPLMO2hQJ8agcIfNl3SiBkux6taNKa25v1JCODrPr+0zFA9adIeQhYM5uC88RML1by2Hhwj5OUje5Ds=
X-Received: by 2002:a92:c74b:: with SMTP id y11mr10156463ilp.264.1597157054511; 
 Tue, 11 Aug 2020 07:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200623155907.22961-1-sean@poorly.run>
 <20200623155907.22961-16-sean@poorly.run>
 <20200630140929.GE15183@intel.com>
 <CAMavQK+mkmUWfV-F_+=qN1RuTDvJ6QF=UhjfPXZFhbk7FQwXwg@mail.gmail.com>
 <20200702143736.GF15183@intel.com>
In-Reply-To: <20200702143736.GF15183@intel.com>
From: Sean Paul <sean@poorly.run>
Date: Tue, 11 Aug 2020 10:43:38 -0400
Message-ID: <CAMavQKJBzTjj4-sZt0adeqaWjf3M5N6sdErJb9_7sy0+X7TzyA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v7 15/17] drm/mst: Add support for
 QUERY_STREAM_ENCRYPTION_STATUS MST sideband message
To: Anshuman Gupta <anshuman.gupta@intel.com>
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 2, 2020 at 10:49 AM Anshuman Gupta <anshuman.gupta@intel.com> wrote:
>
> On 2020-06-30 at 12:48:34 -0400, Sean Paul wrote:
> > On Tue, Jun 30, 2020 at 10:21 AM Anshuman Gupta
> > <anshuman.gupta@intel.com> wrote:
> > >

\snip

> > > > +static bool
> > > > +drm_dp_sideband_parse_query_stream_enc_status(
> > > > +                             struct drm_dp_sideband_msg_rx *raw,
> > > > +                             struct drm_dp_sideband_msg_reply_body *repmsg)
> > > > +{
> > > > +     struct drm_dp_query_stream_enc_status_ack_reply *reply;
> > > > +
> > > > +     reply = &repmsg->u.enc_status;
> > > > +
> > > > +     reply->stream_id = raw->msg[3];
> It seems msg[0] is not part of reply data,
> could you help me with pointers, where msg is formatted.

msg[0] is the reply type, see drm_dp_sideband_parse_reply()

> > > > +
> > > > +     reply->reply_signed = raw->msg[2] & BIT(0);
> > > > +
> > > > +     reply->hdcp_1x_device_present = raw->msg[2] & BIT(3);
> > > > +     reply->hdcp_2x_device_present = raw->msg[2] & BIT(4);
> > > > +
> > > > +     reply->query_capable_device_present = raw->msg[2] & BIT(5);
> > > > +     reply->legacy_device_present = raw->msg[2] & BIT(6);
> > > > +     reply->unauthorizable_device_present = raw->msg[2] & BIT(7);
> > > > +
> > > > +     reply->auth_completed = !!(raw->msg[1] & BIT(3));
> > > > +     reply->encryption_enabled = !!(raw->msg[1] & BIT(4));
> > > > +     reply->repeater_present = !!(raw->msg[1] & BIT(5));
> > > > +     reply->state = (raw->msg[1] & GENMASK(7, 6)) >> 6;
> > > > +
> > > > +     return true;
> > > > +}
> > > > +

/snip

> > > >
> > > > +struct drm_dp_query_stream_enc_status_ack_reply {
> > > > +     /* Bit[23:16]- Stream Id */
> > > > +     u8 stream_id;
> > > > +
> > > > +     /* Bit[15]- Signed */
> > > > +     bool reply_signed;
> > > > +
> > > > +     /* Bit[10:8]- Stream Output Sink Type */
> > > > +     bool unauthorizable_device_present;
> > > > +     bool legacy_device_present;
> > > > +     bool query_capable_device_present;
> > > > +
> > > > +     /* Bit[12:11]- Stream Output CP Type */
> > > > +     bool hdcp_1x_device_present;
> > > > +     bool hdcp_2x_device_present;
> > > > +
> > > > +     /* Bit[4]- Stream Authentication */
> > > > +     bool auth_completed;
> > > > +
> > > > +     /* Bit[3]- Stream Encryption */
> > > > +     bool encryption_enabled;
> > > > +
> > > > +     /* Bit[2]- Stream Repeater Function Present */
> > > > +     bool repeater_present;
> > > > +
> > > > +     /* Bit[1:0]- Stream State */
> > > > +     u8 state;
> reply msg also has 20 byte of signature L' (HDCP 1.4),

Yeah, I haven't done signature parsing because we simply can't. To
compute the signature we need Link_s, which maps to M0 in HDCP 1.4
terms. The Intel HDCP bspec states "M0 cannot be exposed to
software. It is kept internal to hardware". So it's impossible to
compute/verify on the host side.

Sean

> AFAIU it has lefted out for HDCP 2.2 implementation, which is of 32 bytes for HDCP 2.2.
> Please correct me if i am wrong here.
> Thanks,
> Anshuman Gupta.
> > > > +};
> > > >
> > > >  #define DRM_DP_MAX_SDP_STREAMS 16
> > > >  struct drm_dp_allocate_payload {
> > > > @@ -374,6 +402,15 @@ struct drm_dp_remote_i2c_write {
> > > >       u8 *bytes;
> > > >  };
> > > >
> > > > +struct drm_dp_query_stream_enc_status {
> > > > +     u8 stream_id;
> > > > +     u8 client_id[7];        /* 56-bit nonce */
> > > > +     u8 stream_event;
> > > > +     bool valid_stream_event;
> > > > +     u8 stream_behavior;
> > > > +     u8 valid_stream_behavior;
> > > > +};
> > > > +
> > > >  /* this covers ENUM_RESOURCES, POWER_DOWN_PHY, POWER_UP_PHY */
> > > >  struct drm_dp_port_number_req {
> > > >       u8 port_number;
> > > > @@ -422,6 +459,8 @@ struct drm_dp_sideband_msg_req_body {
> > > >
> > > >               struct drm_dp_remote_i2c_read i2c_read;
> > > >               struct drm_dp_remote_i2c_write i2c_write;
> > > > +
> > > > +             struct drm_dp_query_stream_enc_status enc_status;
> > > >       } u;
> > > >  };
> > > >
> > > > @@ -444,6 +483,8 @@ struct drm_dp_sideband_msg_reply_body {
> > > >               struct drm_dp_remote_i2c_read_ack_reply remote_i2c_read_ack;
> > > >               struct drm_dp_remote_i2c_read_nak_reply remote_i2c_read_nack;
> > > >               struct drm_dp_remote_i2c_write_ack_reply remote_i2c_write_ack;
> > > > +
> > > > +             struct drm_dp_query_stream_enc_status_ack_reply enc_status;
> > > >       } u;
> > > >  };
> > > >
> > > > @@ -808,6 +849,9 @@ drm_dp_atomic_release_vcpi_slots(struct drm_atomic_state *state,
> > > >                                struct drm_dp_mst_port *port);
> > > >  int drm_dp_send_power_updown_phy(struct drm_dp_mst_topology_mgr *mgr,
> > > >                                struct drm_dp_mst_port *port, bool power_up);
> > > > +int drm_dp_send_query_stream_enc_status(struct drm_dp_mst_topology_mgr *mgr,
> > > > +             struct drm_dp_mst_port *port,
> > > > +             struct drm_dp_query_stream_enc_status_ack_reply *status);
> > > >  int __must_check drm_dp_mst_atomic_check(struct drm_atomic_state *state);
> > > >
> > > >  void drm_dp_mst_get_port_malloc(struct drm_dp_mst_port *port);
> > > > --
> > > > Sean Paul, Software Engineer, Google / Chromium OS
> > > >
> > > > _______________________________________________
> > > > Intel-gfx mailing list
> > > > Intel-gfx@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
