Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFD62506BF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 19:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A4F6E3F5;
	Mon, 24 Aug 2020 17:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C886E3F5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 17:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598290970;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KPku6gi3dxvRkdI/qQKB9W9BzXhpWhnoZ4SMbqlznzE=;
 b=bXg65SK1sTenbD5tg5QWqqZ+v3IlolYU2OjTOCsHBcMSpwF1p7rdGkwIKVjnKublSMgndJ
 FC1q73beKoRX6wwjwiND58pJQlrdiQcN9LNMNHfutt2sD3cNSGHs3z8FWViRSqM38W2ofg
 W/2Yj7H3sMvAQBJIrR89IwohqF8wZ3s=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-pEdeePQ5OpKFm43FgiKAVg-1; Mon, 24 Aug 2020 13:42:44 -0400
X-MC-Unique: pEdeePQ5OpKFm43FgiKAVg-1
Received: by mail-qk1-f197.google.com with SMTP id v16so6941579qka.18
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 10:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=KPku6gi3dxvRkdI/qQKB9W9BzXhpWhnoZ4SMbqlznzE=;
 b=i/1jUBXDAnoQW0Vm3S+MH4tfjhavKVgITn/hRNYjSDQ8ju799Ce5AMMFK1w/09fXMX
 etLMQDktXJr8Xo+BcR5TB3FzTIjTxZvoioYD15LgOg8sFCNzcCIJJey5ieQdfoXpU5X5
 iaiYZiBlJM/Ro4hpiiEGxbWGri5xdL08E3WOV4aE1veW/Kd2Igc8odMsHMvssrlApMuP
 +Kic4Xyw64YNi3FZT8uUA252WvtV8kT3nRWRJBlXYiydp3Jimaqe6FlLI7tsHZIupJZI
 +4zLBynb+QlVqPBFDQn3eUlj9T9eSUnNy00kwxzg10pCUSy0m41Wfh6gVSvqOGzyJ81X
 pq/A==
X-Gm-Message-State: AOAM5329xaUIYPdlVEPkJCWeIq89NWPYHz4N2fDVf8ipRr5Dv7MWdAg2
 f3We+sDX+/MwxS+tOTzL8ScYcwRmoprETkHHeZVI7zQ2YUIVp0kT/nHHpT/OcvA7EIWmIhSyTGO
 o+Uwmh/sRBffijNTTaKLdR9DUzhfX
X-Received: by 2002:aed:27c8:: with SMTP id m8mr5875609qtg.302.1598290960280; 
 Mon, 24 Aug 2020 10:42:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQKDdo8b9kvRwWyqdcP/7EWeSYoDxC/s9/kKoIVYfvr8IIOZZIKqfcbvdgATi94yqrwv0sCA==
X-Received: by 2002:aed:27c8:: with SMTP id m8mr5875581qtg.302.1598290959896; 
 Mon, 24 Aug 2020 10:42:39 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id y26sm11209366qto.75.2020.08.24.10.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 10:42:39 -0700 (PDT)
Message-ID: <aafb77646e6f6efdc35789d3654dab14891c7f48.camel@redhat.com>
Subject: Re: [PATCH] drm/dp_mst: Add ddc i2c device links for DP MST connectors
From: Lyude Paul <lyude@redhat.com>
To: imre.deak@intel.com, Sam McNally <sammc@chromium.org>, Wayne Lin
 <Wayne.Lin@amd.com>
Date: Mon, 24 Aug 2020 13:42:38 -0400
In-Reply-To: <20200820180312.GC2423@ideak-desk.fi.intel.com>
References: <20200729161510.1.Iaa9c3d7c4332cf8717653f3d3ae6f2b955aa3fc6@changeid>
 <20200814145956.GA12962@ideak-desk.fi.intel.com>
 <CAJqEsoCAR-3NNL+pD4QeUWioq-uLdEdZwNrPVkzjULM39KiayA@mail.gmail.com>
 <20200820180312.GC2423@ideak-desk.fi.intel.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-08-20 at 21:03 +0300, Imre Deak wrote:
> On Thu, Aug 20, 2020 at 12:27:03PM +1000, Sam McNally wrote:
> > > > [...]
> > > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > index 1ac874e4e7a1..73a2299c2faa 100644
> > > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > @@ -2161,11 +2161,23 @@ static void build_mst_prop_path(const struct
> > > > drm_dp_mst_branch *mstb,
> > > >  int drm_dp_mst_connector_late_register(struct drm_connector *connector,
> > > >                                      struct drm_dp_mst_port *port)
> > > >  {
> > > > +     int ret;
> > > >       DRM_DEBUG_KMS("registering %s remote bus for %s\n",
> > > >                     port->aux.name, connector->kdev->kobj.name);
> > > > 
> > > >       port->aux.dev = connector->kdev;
> > > > -     return drm_dp_aux_register_devnode(&port->aux);
> > > > +     ret = drm_dp_aux_register_devnode(&port->aux);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     if (port->pdt != DP_PEER_DEVICE_NONE &&
> > > > +         drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
> > > 
> > > How can we get here when drm_dp_mst_is_end_device(port) is not true?
> > > AFAICS that's only case where we should create a connector and an i2c
> > > device. (IOW we don't create them for branch ports.)
> > 
> > I'm not sure what you mean. Wouldn't this condition be checked during
> > the registration of any MST connector? This follows the pattern used
> > in drm_dp_mst_port_add_connector() [0], which seems like it's invoked
> > in the same cases as drm_dp_mst_connector_late_register(), modulo
> > early outs for errors.
> 
> Re-reading the code, a DRM connector is created whenever the MST port is
> an output port, so even in the case of an output branch port.
> 
> I'm still not sure why we can't register/unregister the I2C bus whenever
> creating/removing the DRM connector. That's also the scope of the AUX
> bus, which is what I2C depends on, and if a port doesn't support I2C
> messaging then the corresponding AUX messages would be NAKed.

FWIW - I'm totally fine with this, as long as it works :)
> 
> --Imre
> 
> > [0] 
> > https://cgit.freedesktop.org/drm-tip/tree/drivers/gpu/drm/drm_dp_mst_topology.c?id=1939e049a8ec6cef03a098f7cc99cb0bbcff21c6#n2188
> > 
> > 
> > 
> > > > +             ret = sysfs_create_link(&port->connector->kdev->kobj,
> > > > +                                     &port->aux.ddc.dev.kobj, "ddc");
> > > > +             if (ret)
> > > > +                     drm_dp_aux_unregister_devnode(&port->aux);
> > > > +     }
> > > > +     return ret;
> > > >  }
> > > >  EXPORT_SYMBOL(drm_dp_mst_connector_late_register);
> > > > 
> > > > @@ -5490,6 +5502,7 @@ static int drm_dp_mst_register_i2c_bus(struct
> > > > drm_dp_mst_port *port)
> > > >  {
> > > >       struct drm_dp_aux *aux = &port->aux;
> > > >       struct device *parent_dev = port->mgr->dev->dev;
> > > > +     int ret;
> > > > 
> > > >       aux->ddc.algo = &drm_dp_mst_i2c_algo;
> > > >       aux->ddc.algo_data = aux;
> > > > @@ -5504,7 +5517,17 @@ static int drm_dp_mst_register_i2c_bus(struct
> > > > drm_dp_mst_port *port)
> > > >       strlcpy(aux->ddc.name, aux->name ? aux->name :
> > > > dev_name(parent_dev),
> > > >               sizeof(aux->ddc.name));
> > > > 
> > > > -     return i2c_add_adapter(&aux->ddc);
> > > > +     ret = i2c_add_adapter(&aux->ddc);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     if (port->connector && port->connector->kdev) {
> > > > +             ret = sysfs_create_link(&port->connector->kdev->kobj,
> > > > +                                     &port->aux.ddc.dev.kobj, "ddc");
> > > > +             if (ret)
> > > > +                     i2c_del_adapter(&port->aux.ddc);
> > > > +     }
> > > > +     return ret;
> > > >  }
> > > > 
> > > >  /**
> > > > @@ -5513,6 +5536,8 @@ static int drm_dp_mst_register_i2c_bus(struct
> > > > drm_dp_mst_port *port)
> > > >   */
> > > >  static void drm_dp_mst_unregister_i2c_bus(struct drm_dp_mst_port *port)
> > > >  {
> > > > +     if (port->connector && port->connector->kdev)
> > > > +             sysfs_remove_link(&port->connector->kdev->kobj, "ddc");
> > > >       i2c_del_adapter(&port->aux.ddc);
> > > >  }
> > > > 
> > > > --
> > > > 2.28.0.rc0.142.g3c755180ce-goog
> > > > 
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
