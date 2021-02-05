Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092AA3105ED
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 08:36:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6EB6E935;
	Fri,  5 Feb 2021 07:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC02A6E935
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 07:36:17 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id v123so5793784yba.13
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 23:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7R7/3cVbAHaf6iFxwozcMAUWpMqowGknUNyt7aIHbxo=;
 b=j6Tf9h85o/0tsEXp16+z/L6Ij22LwzI+XBY8H51ywuPnW9R3iVo9pHZq3XdxCLd5VM
 cPewAguNRIHQt6TDIfo4dhEDXVP+sZs/dw39ROf9pFJb29Z6lQfMhd2Fwa3DoxzKOgN9
 9zdaITLkd6MDwHUnTsM8AWuE09L9VumWCVSg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7R7/3cVbAHaf6iFxwozcMAUWpMqowGknUNyt7aIHbxo=;
 b=so0PAgwwVxuchTEDNMMThIrMuDJczv0rLG631ScRcpSiQzf5lTC3VTKBtd1S4B5+3J
 wXPBP/IPf58einLggxBaJhgvrwqQclKqVNH37NNDhxnCVWSsy4hpMZM2hL8NxcwEQ/NF
 +5iU5AEw0ZbZrfqw9qveNj5e42+5GKN00M2ZoGGYqcG/B4060p37P5ycOHoExcK94YFQ
 fE+CYUjvO88dK4To+txDB7zEnd7H4CqHogNrtSudHMuSl+Rp30JcyqfmsY5kbZHotnzD
 1q6EmhDd3WH89IjzRJ3R2JsQYnM4MuJNHkx5gx+wQCgrWOi75qHEg6k9yjbdv+a6LFHw
 V4BQ==
X-Gm-Message-State: AOAM530NWE70xodFPFPdHTACPudq5USnudXfsZQvfUMkP/6gqngfZ+fk
 IQi6g8gTXcWZV89EpeGh2rNfJ2gTJSz0TS+Dl+CghQ==
X-Google-Smtp-Source: ABdhPJyBAJq0cUiqx0ES7c14eY2vzSmcrcV2IkIkrFQAcdBlF/WBVyk8f0R93Z15LoVlIsd3Sy2uMLblhVnLjA9k04E=
X-Received: by 2002:a25:7397:: with SMTP id o145mr4997851ybc.523.1612510576675; 
 Thu, 04 Feb 2021 23:36:16 -0800 (PST)
MIME-Version: 1.0
References: <20200923121320.v3.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
 <20200923121320.v3.4.If7fc06fd679af0665ada9ff0524291c61dd35d24@changeid>
 <ad36a026-e5b4-1822-15c2-e918aa2cbc7e@xs4all.nl>
In-Reply-To: <ad36a026-e5b4-1822-15c2-e918aa2cbc7e@xs4all.nl>
From: Sam McNally <sammc@chromium.org>
Date: Fri, 5 Feb 2021 18:35:39 +1100
Message-ID: <CAJqEsoC1VMM7R7X50oELZFprvkLOccOfp3OZEzGP7jFTqbgxrw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm_dp_cec: add MST support
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 4 Feb 2021 at 21:42, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 23/09/2020 04:13, Sam McNally wrote:
> > With DP v2.0 errata E5, CEC tunneling can be supported through an MST
> > topology.
> >
> > There are some minor differences for CEC tunneling through an MST
> > topology compared to CEC tunneling to an SST port:
> > - CEC IRQs are delivered via a sink event notify message
> > - CEC-related DPCD registers are accessed via remote DPCD reads and
> >   writes.
> >
> > This results in the MST implementation diverging from the existing SST
> > implementation:
> > - sink event notify messages with CEC_IRQ ID set indicate CEC IRQ rather
> >   than ESI1
> > - setting edid and handling CEC IRQs, which can be triggered from
> >   contexts where locks held preclude HPD handling, are deferred to avoid
> >   remote DPCD access which would block until HPD handling is performed
> >   or a timeout
> >
> > Register and unregister for all MST connectors, ensuring their
> > drm_dp_aux_cec struct won't be accessed uninitialized.
> >
> > Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Signed-off-by: Sam McNally <sammc@chromium.org>
> > ---
> >
> > Changes in v3:
> > - Fixed whitespace in drm_dp_cec_mst_irq_work()
> > - Moved drm_dp_cec_mst_set_edid_work() with the other set_edid functions
> >
> > Changes in v2:
> > - Used aux->is_remote instead of aux->cec.is_mst, removing the need for
> >   the previous patch in the series
> > - Added a defensive check for null edid in the deferred set_edid work,
> >   in case the edid is no longer valid at that point
> >
> >  drivers/gpu/drm/drm_dp_cec.c          | 68 +++++++++++++++++++++++++--
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 24 ++++++++++
> >  include/drm/drm_dp_helper.h           |  4 ++
> >  3 files changed, 91 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_cec.c b/drivers/gpu/drm/drm_dp_cec.c
> > index 3ab2609f9ec7..1020b2cffdf0 100644
> > --- a/drivers/gpu/drm/drm_dp_cec.c
> > +++ b/drivers/gpu/drm/drm_dp_cec.c
> > @@ -14,6 +14,7 @@
> >  #include <drm/drm_connector.h>
> >  #include <drm/drm_device.h>
> >  #include <drm/drm_dp_helper.h>
> > +#include <drm/drm_dp_mst_helper.h>
> >
> >  /*
> >   * Unfortunately it turns out that we have a chicken-and-egg situation
> > @@ -248,6 +249,10 @@ void drm_dp_cec_irq(struct drm_dp_aux *aux)
> >       if (!aux->transfer)
> >               return;
> >
> > +     if (aux->is_remote) {
> > +             schedule_work(&aux->cec.mst_irq_work);
> > +             return;
> > +     }
>
> Are these workqueues for cec_irq and cec_set_edid actually needed? They are called
> directly from drm_dp_mst_topology.c, and I think they can be handled identically to
> a normal, non-remote, aux device.
>
> Avoiding using a workqueue probably also means that there is no need for exporting
> drm_dp_mst_topology_get_port_validated and drm_dp_mst_topology_put_port.
>
> Provided that I am not missing something, this should simplify the code quite a bit.

Indeed; with commit 9408cc94eb04 ("drm/dp_mst: Handle UP requests
asynchronously") they're unnecessary. This all simplifies quite
nicely.
>
> Regards,
>
>         Hans
>
> >       mutex_lock(&aux->cec.lock);
> >       if (!aux->cec.adap)
> >               goto unlock;
> > @@ -276,6 +281,23 @@ static bool drm_dp_cec_cap(struct drm_dp_aux *aux, u8 *cec_cap)
> >       return true;
> >  }
> >
> > +static void drm_dp_cec_mst_irq_work(struct work_struct *work)
> > +{
> > +     struct drm_dp_aux *aux = container_of(work, struct drm_dp_aux,
> > +                                           cec.mst_irq_work);
> > +     struct drm_dp_mst_port *port =
> > +             container_of(aux, struct drm_dp_mst_port, aux);
> > +
> > +     port = drm_dp_mst_topology_get_port_validated(port->mgr, port);
> > +     if (!port)
> > +             return;
> > +     mutex_lock(&aux->cec.lock);
> > +     if (aux->cec.adap)
> > +             drm_dp_cec_handle_irq(aux);
> > +     mutex_unlock(&aux->cec.lock);
> > +     drm_dp_mst_topology_put_port(port);
> > +}
> > +
> >  /*
> >   * Called if the HPD was low for more than drm_dp_cec_unregister_delay
> >   * seconds. This unregisters the CEC adapter.
> > @@ -297,7 +319,8 @@ static void drm_dp_cec_unregister_work(struct work_struct *work)
> >   * were unchanged and just update the CEC physical address. Otherwise
> >   * unregister the old CEC adapter and create a new one.
> >   */
> > -void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
> > +static void drm_dp_cec_handle_set_edid(struct drm_dp_aux *aux,
> > +                                    const struct edid *edid)
> >  {
> >       struct drm_connector *connector = aux->cec.connector;
> >       u32 cec_caps = CEC_CAP_DEFAULTS | CEC_CAP_NEEDS_HPD |
> > @@ -306,10 +329,6 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
> >       unsigned int num_las = 1;
> >       u8 cap;
> >
> > -     /* No transfer function was set, so not a DP connector */
> > -     if (!aux->transfer)
> > -             return;
> > -
> >  #ifndef CONFIG_MEDIA_CEC_RC
> >       /*
> >        * CEC_CAP_RC is part of CEC_CAP_DEFAULTS, but it is stripped by
> > @@ -320,6 +339,7 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
> >        */
> >       cec_caps &= ~CEC_CAP_RC;
> >  #endif
> > +     cancel_work_sync(&aux->cec.mst_irq_work);
> >       cancel_delayed_work_sync(&aux->cec.unregister_work);
> >
> >       mutex_lock(&aux->cec.lock);
> > @@ -375,8 +395,40 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
> >  unlock:
> >       mutex_unlock(&aux->cec.lock);
> >  }
> > +
> > +void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
> > +{
> > +     /* No transfer function was set, so not a DP connector */
> > +     if (!aux->transfer)
> > +             return;
> > +
> > +     if (aux->is_remote)
> > +             schedule_work(&aux->cec.mst_set_edid_work);
> > +     else
> > +             drm_dp_cec_handle_set_edid(aux, edid);
> > +}
> >  EXPORT_SYMBOL(drm_dp_cec_set_edid);
> >
> > +static void drm_dp_cec_mst_set_edid_work(struct work_struct *work)
> > +{
> > +     struct drm_dp_aux *aux =
> > +             container_of(work, struct drm_dp_aux, cec.mst_set_edid_work);
> > +     struct drm_dp_mst_port *port =
> > +             container_of(aux, struct drm_dp_mst_port, aux);
> > +     struct edid *edid = NULL;
> > +
> > +     port = drm_dp_mst_topology_get_port_validated(port->mgr, port);
> > +     if (!port)
> > +             return;
> > +
> > +     edid = drm_get_edid(port->connector, &port->aux.ddc);
> > +
> > +     if (edid)
> > +             drm_dp_cec_handle_set_edid(aux, edid);
> > +
> > +     drm_dp_mst_topology_put_port(port);
> > +}
> > +
> >  /*
> >   * The EDID disappeared (likely because of the HPD going down).
> >   */
> > @@ -393,6 +445,8 @@ void drm_dp_cec_unset_edid(struct drm_dp_aux *aux)
> >               goto unlock;
> >
> >       cec_phys_addr_invalidate(aux->cec.adap);
> > +     cancel_work_sync(&aux->cec.mst_irq_work);
> > +
> >       /*
> >        * We're done if we want to keep the CEC device
> >        * (drm_dp_cec_unregister_delay is >= NEVER_UNREG_DELAY) or if the
> > @@ -433,6 +487,8 @@ void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
> >       aux->cec.connector = connector;
> >       INIT_DELAYED_WORK(&aux->cec.unregister_work,
> >                         drm_dp_cec_unregister_work);
> > +     INIT_WORK(&aux->cec.mst_irq_work, drm_dp_cec_mst_irq_work);
> > +     INIT_WORK(&aux->cec.mst_set_edid_work, drm_dp_cec_mst_set_edid_work);
> >  }
> >  EXPORT_SYMBOL(drm_dp_cec_register_connector);
> >
> > @@ -442,6 +498,8 @@ EXPORT_SYMBOL(drm_dp_cec_register_connector);
> >   */
> >  void drm_dp_cec_unregister_connector(struct drm_dp_aux *aux)
> >  {
> > +     cancel_work_sync(&aux->cec.mst_irq_work);
> > +     cancel_work_sync(&aux->cec.mst_set_edid_work);
> >       if (!aux->cec.adap)
> >               return;
> >       cancel_delayed_work_sync(&aux->cec.unregister_work);
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index c783a2a1c114..221c30133739 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -2183,6 +2183,8 @@ static void build_mst_prop_path(const struct drm_dp_mst_branch *mstb,
> >  int drm_dp_mst_connector_late_register(struct drm_connector *connector,
> >                                      struct drm_dp_mst_port *port)
> >  {
> > +     drm_dp_cec_register_connector(&port->aux, connector);
> > +
> >       DRM_DEBUG_KMS("registering %s remote bus for %s\n",
> >                     port->aux.name, connector->kdev->kobj.name);
> >
> > @@ -2206,6 +2208,8 @@ void drm_dp_mst_connector_early_unregister(struct drm_connector *connector,
> >       DRM_DEBUG_KMS("unregistering %s remote bus for %s\n",
> >                     port->aux.name, connector->kdev->kobj.name);
> >       drm_dp_aux_unregister_devnode(&port->aux);
> > +
> > +     drm_dp_cec_unregister_connector(&port->aux);
> >  }
> >  EXPORT_SYMBOL(drm_dp_mst_connector_early_unregister);
> >
> > @@ -2515,6 +2519,21 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch *mstb,
> >               queue_work(system_long_wq, &mstb->mgr->work);
> >  }
> >
> > +static void
> > +drm_dp_mst_handle_sink_event(struct drm_dp_mst_branch *mstb,
> > +                         struct drm_dp_sink_event_notify *sink_event)
> > +{
> > +     struct drm_dp_mst_port *port;
> > +
> > +     if (sink_event->event_id & DP_SINK_EVENT_CEC_IRQ_EVENT) {
> > +             port = drm_dp_get_port(mstb, sink_event->port_number);
> > +             if (port) {
> > +                     drm_dp_cec_irq(&port->aux);
> > +                     drm_dp_mst_topology_put_port(port);
> > +             }
> > +     }
> > +}
> > +
> >  static struct drm_dp_mst_branch *drm_dp_get_mst_branch_device(struct drm_dp_mst_topology_mgr *mgr,
> >                                                              u8 lct, u8 *rad)
> >  {
> > @@ -3954,6 +3973,8 @@ drm_dp_mst_process_up_req(struct drm_dp_mst_topology_mgr *mgr,
> >       if (msg->req_type == DP_CONNECTION_STATUS_NOTIFY) {
> >               drm_dp_mst_handle_conn_stat(mstb, &msg->u.conn_stat);
> >               hotplug = true;
> > +     } else if (msg->req_type == DP_SINK_EVENT_NOTIFY) {
> > +             drm_dp_mst_handle_sink_event(mstb, &msg->u.sink_event);
> >       }
> >
> >       drm_dp_mst_topology_put_mstb(mstb);
> > @@ -4147,6 +4168,8 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
> >               break;
> >       }
> >  out:
> > +     if (ret != connector_status_connected)
> > +             drm_dp_cec_unset_edid(&port->aux);
> >       drm_dp_mst_topology_put_port(port);
> >       return ret;
> >  }
> > @@ -4177,6 +4200,7 @@ struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct drm_dp_
> >               edid = drm_get_edid(connector, &port->aux.ddc);
> >       }
> >       port->has_audio = drm_detect_monitor_audio(edid);
> > +     drm_dp_cec_set_edid(&port->aux, edid);
> >       drm_dp_mst_topology_put_port(port);
> >       return edid;
> >  }
> > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> > index 85513eeb2196..d8ee24a6319c 100644
> > --- a/include/drm/drm_dp_helper.h
> > +++ b/include/drm/drm_dp_helper.h
> > @@ -1496,12 +1496,16 @@ struct drm_connector;
> >   * @adap: the CEC adapter for CEC-Tunneling-over-AUX support.
> >   * @connector: the connector this CEC adapter is associated with
> >   * @unregister_work: unregister the CEC adapter
> > + * @mst_irq_work: IRQ for CEC events on an MST branch
> > + * @mst_set_edid_work: set the EDID for an MST branch
> >   */
> >  struct drm_dp_aux_cec {
> >       struct mutex lock;
> >       struct cec_adapter *adap;
> >       struct drm_connector *connector;
> >       struct delayed_work unregister_work;
> > +     struct work_struct mst_irq_work;
> > +     struct work_struct mst_set_edid_work;
> >  };
> >
> >  /**
> >
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
