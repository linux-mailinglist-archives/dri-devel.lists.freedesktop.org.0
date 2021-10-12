Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A71742AF87
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 00:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E486E9EE;
	Tue, 12 Oct 2021 22:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC7F6E9EE
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 22:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634076596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jZp6Vs1PH3sFie+1X/wQbc6EMp+/kOpNB3NJU6elbXg=;
 b=GqUBDg77M/069EjAYq4YGsm3ZItO010h40A1L/ZAyyamo9d60T1Uddz2yB3Zzq5QwOo/Z7
 45rYtapWUjp2ZCgju4DM//grvBzfxPWwfqHPbf57Aa1CCbg4KRc75OKboLpyKWavJhY9Hd
 9Pn+Rw3tZyD+NoJPJh1MlrO5fIBrhhA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-CMqMhxPmNNigF6tZAsbxIg-1; Tue, 12 Oct 2021 18:09:55 -0400
X-MC-Unique: CMqMhxPmNNigF6tZAsbxIg-1
Received: by mail-qv1-f71.google.com with SMTP id
 c13-20020a056214224d00b00382f21b95fcso862748qvc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 15:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version;
 bh=Bs3Bn8aYAM366jYiAUUXp6gJ2vLtbLpoSvXRTBPq0LI=;
 b=dK/vmfAhWil9/AWQ1JBN+zwu5/BqewU6jxiVXYWCinXchQnL7X3n3ypWlHR3XtOg06
 P9MYHTRKB9/oc+6/8kWYQMz6ynBMir6QIfRGQVWQxbo24mz26r+4ty4WdaoZSgYbteQi
 xRFv+wUGo8idjJcqocA98RTyYpXUbASc17Y92x5ZgQpirwD83L0W970ZHIKdmc6u/LoU
 h1YgKRF3tPIcALWiLjS0GHaUVmtydYqqZP8zBMWmO87KbmNQ/9FojP4Yuu+piaDXTlwB
 6pWolDQYNTXgJlooVdhEBCkDOMCYy8b6+AWPy+FcjXNW8rNWgG0LZgyhkJ+P07fkNiQ7
 Trig==
X-Gm-Message-State: AOAM5308kaL9zXiSOOv4wbdBjtwRgVL6NMWef1XAH+/wYn42X7AQkd4a
 Y+2G7TsLl9iAX5t/lVA/QMhxWcL6s19I1Gbi9GVW+uKsMBXdJ+mmbQhvUOwjI5lx8eUSHR6TtSS
 whvkA0ETQ7ay00TzeYmqvjjP04Ljs
X-Received: by 2002:ac8:7c53:: with SMTP id o19mr25955802qtv.228.1634076594646; 
 Tue, 12 Oct 2021 15:09:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+EjgHnUAL0Tsp3Sd2+UCptpLaFDMZXcszuG4YjoGa4g2wMoc3leHPvEeCITDUjecsDF62vQ==
X-Received: by 2002:ac8:7c53:: with SMTP id o19mr25955775qtv.228.1634076594412; 
 Tue, 12 Oct 2021 15:09:54 -0700 (PDT)
Received: from [192.168.8.206] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id 125sm2696134qkf.95.2021.10.12.15.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 15:09:54 -0700 (PDT)
Message-ID: <5eb5d41847fc13e418b4a7964fe305fdf4a65fc9.camel@redhat.com>
Subject: Re: [PATCH] drm: Update MST First Link Slot Information Based on
 Encoding Format
From: Lyude Paul <lyude@redhat.com>
To: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Zuo, Jerry"
 <Jerry.Zuo@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Cc: "Wentland, Harry" <Harry.Wentland@amd.com>, "Lin, Wayne"
 <Wayne.Lin@amd.com>,  "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Date: Tue, 12 Oct 2021 18:09:51 -0400
In-Reply-To: <MW3PR12MB4554BC7B5C42768A7036454DF9B69@MW3PR12MB4554.namprd12.prod.outlook.com>
References: <5e463fbc3d633eea1078e838ba5be0065ffbeb1e.camel@redhat.com>
 <20211012215848.1507023-1-Bhawanpreet.Lakha@amd.com>
 <MW3PR12MB4554BC7B5C42768A7036454DF9B69@MW3PR12MB4554.namprd12.prod.outlook.com>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="=-IS1JWVDl8SN9TBIg44Fe"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-IS1JWVDl8SN9TBIg44Fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

No problem, thanks for the patches! Will take a look at this tomorrow

On Tue, 2021-10-12 at 22:02 +0000, Lakha, Bhawanpreet wrote:
> [AMD Official Use Only]
> 
> Hi Lyude,
> 
> Jerry is busy these few weeks so I will be taking a look at this. I added
> the start/total slots to the mst_state and am updating them in atomic_check.
> 
> Also ignore the V2 "* Remove get_mst_link_encoding_cap" I got a bit lost in
> trying to figure out the patch layout that was sent before.
> 
> 
> Thanks,
> Bhawan
> 
> From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Sent: October 12, 2021 5:58 PM
> To: Zuo, Jerry <Jerry.Zuo@amd.com>; dri-devel@lists.freedesktop.org <dri-
> devel@lists.freedesktop.org>; lyude@redhat.com <lyude@redhat.com>
> Cc: Wentland, Harry <Harry.Wentland@amd.com>; Lin, Wayne
> <Wayne.Lin@amd.com>; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>;
> Lakha, Bhawanpreet <Bhawanpreet.Lakha@amd.com>
> Subject: [PATCH] drm: Update MST First Link Slot Information Based on
> Encoding Format 
> 8b/10b encoding format requires to reserve the first slot for
> recording metadata. Real data transmission starts from the second slot,
> with a total of available 63 slots available.
> 
> In 128b/132b encoding format, metadata is transmitted separately
> in LLCP packet before MTP. Real data transmission starts from
> the first slot, with a total of 64 slots available.
> 
> v2:
> * Remove get_mst_link_encoding_cap
> * Move total/start slots to mst_state, and copy it to mst_mgr in
> atomic_check
> 
> Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
> Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 28 +++++++++++++++
>  drivers/gpu/drm/drm_dp_mst_topology.c         | 35 +++++++++++++++----
>  include/drm/drm_dp_mst_helper.h               | 13 +++++++
>  3 files changed, 69 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 5020f2d36fe1..4ad50eb0091a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -10612,6 +10612,8 @@ static int amdgpu_dm_atomic_check(struct drm_device
> *dev,
>  #if defined(CONFIG_DRM_AMD_DC_DCN)
>          struct dsc_mst_fairness_vars vars[MAX_PIPES];
>  #endif
> +       struct drm_dp_mst_topology_state *mst_state;
> +       struct drm_dp_mst_topology_mgr *mgr;
>  
>          trace_amdgpu_dm_atomic_check_begin(state);
>  
> @@ -10819,6 +10821,32 @@ static int amdgpu_dm_atomic_check(struct drm_device
> *dev,
>                  lock_and_validation_needed = true;
>          }
>  
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +       for_each_new_mst_mgr_in_state(state, mgr, mst_state, i) {
> +               struct amdgpu_dm_connector *aconnector;
> +               struct drm_connector *connector;
> +               struct drm_connector_list_iter iter;
> +               u8 link_coding_cap;
> +
> +               if (!mgr->mst_state )
> +                       continue;
> +
> +               drm_connector_list_iter_begin(dev, &iter);
> +               drm_for_each_connector_iter(connector, &iter) {
> +                       int id = connector->index;
> +
> +                       if (id == mst_state->mgr->conn_base_id) {
> +                               aconnector =
> to_amdgpu_dm_connector(connector);
> +                               link_coding_cap =
> dc_link_dp_mst_decide_link_encoding_format(aconnector->dc_link);
> +                               drm_dp_mst_update_coding_cap(mst_state,
> link_coding_cap);
> +
> +                               break;
> +                       }
> +               }
> +               drm_connector_list_iter_end(&iter);
> +
> +       }
> +#endif
>          /**
>           * Streams and planes are reset when there are changes that affect
>           * bandwidth. Anything that affects bandwidth needs to go through
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index ad0795afc21c..fb5c47c4cb2e 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -3368,7 +3368,7 @@ int drm_dp_update_payload_part1(struct
> drm_dp_mst_topology_mgr *mgr)
>          struct drm_dp_payload req_payload;
>          struct drm_dp_mst_port *port;
>          int i, j;
> -       int cur_slots = 1;
> +       int cur_slots = mgr->start_slot;
>          bool skip;
>  
>          mutex_lock(&mgr->payload_lock);
> @@ -4321,7 +4321,7 @@ int drm_dp_find_vcpi_slots(struct
> drm_dp_mst_topology_mgr *mgr,
>          num_slots = DIV_ROUND_UP(pbn, mgr->pbn_div);
>  
>          /* max. time slots - one slot for MTP header */
> -       if (num_slots > 63)
> +       if (num_slots > mgr->total_avail_slots)
>                  return -ENOSPC;
>          return num_slots;
>  }
> @@ -4333,7 +4333,7 @@ static int drm_dp_init_vcpi(struct
> drm_dp_mst_topology_mgr *mgr,
>          int ret;
>  
>          /* max. time slots - one slot for MTP header */
> -       if (slots > 63)
> +       if (slots > mgr->total_avail_slots)
>                  return -ENOSPC;
>  
>          vcpi->pbn = pbn;
> @@ -4507,6 +4507,18 @@ int drm_dp_atomic_release_vcpi_slots(struct
> drm_atomic_state *state,
>  }
>  EXPORT_SYMBOL(drm_dp_atomic_release_vcpi_slots);
>  
> +void drm_dp_mst_update_coding_cap(struct drm_dp_mst_topology_state
> *mst_state, uint8_t link_coding_cap)
> +{
> +       if (link_coding_cap == DP_CAP_ANSI_128B132B) {
> +               mst_state->total_avail_slots = 64;
> +               mst_state->start_slot = 0;
> +       }
> +
> +       DRM_DEBUG_KMS("%s coding format on mgr 0x%p\n",
> +                       (link_coding_cap == DP_CAP_ANSI_128B132B) ?
> "128b/132b":"8b/10b", mst_state->mgr);
> +}
> +EXPORT_SYMBOL(drm_dp_mst_update_coding_cap);
> +
>  /**
>   * drm_dp_mst_allocate_vcpi() - Allocate a virtual channel
>   * @mgr: manager for this port
> @@ -4538,8 +4550,8 @@ bool drm_dp_mst_allocate_vcpi(struct
> drm_dp_mst_topology_mgr *mgr,
>  
>          ret = drm_dp_init_vcpi(mgr, &port->vcpi, pbn, slots);
>          if (ret) {
> -               drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d max=63
> ret=%d\n",
> -                           DIV_ROUND_UP(pbn, mgr->pbn_div), ret);
> +               drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d max=%d
> ret=%d\n",
> +                           DIV_ROUND_UP(pbn, mgr->pbn_div), mgr-
> >total_avail_slots, ret);
>                  drm_dp_mst_topology_put_port(port);
>                  goto out;
>          }
> @@ -5226,7 +5238,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct
> drm_dp_mst_topology_mgr *mgr,
>                                           struct drm_dp_mst_topology_state
> *mst_state)
>  {
>          struct drm_dp_vcpi_allocation *vcpi;
> -       int avail_slots = 63, payload_count = 0;
> +       int avail_slots = mgr->total_avail_slots, payload_count = 0;
>  
>          list_for_each_entry(vcpi, &mst_state->vcpis, next) {
>                  /* Releasing VCPI is always OK-even if the port is gone */
> @@ -5255,7 +5267,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct
> drm_dp_mst_topology_mgr *mgr,
>                  }
>          }
>          drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p VCPI avail=%d
> used=%d\n",
> -                      mgr, mst_state, avail_slots, 63 - avail_slots);
> +                      mgr, mst_state, avail_slots, mgr->total_avail_slots -
> avail_slots);
>  
>          return 0;
>  }
> @@ -5421,6 +5433,10 @@ int drm_dp_mst_atomic_check(struct drm_atomic_state
> *state)
>                          break;
>  
>                  mutex_lock(&mgr->lock);
> +
> +               mgr->start_slot = mst_state->start_slot;
> +               mgr->total_avail_slots = mst_state->total_avail_slots;
> +
>                  ret = drm_dp_mst_atomic_check_mstb_bw_limit(mgr-
> >mst_primary,
>                                                              mst_state);
>                  mutex_unlock(&mgr->lock);
> @@ -5527,11 +5543,16 @@ int drm_dp_mst_topology_mgr_init(struct
> drm_dp_mst_topology_mgr *mgr,
>          if (!mgr->proposed_vcpis)
>                  return -ENOMEM;
>          set_bit(0, &mgr->payload_mask);
> +       mgr->total_avail_slots = 63;
> +       mgr->start_slot = 1;
>  
>          mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
>          if (mst_state == NULL)
>                  return -ENOMEM;
>  
> +       mst_state->total_avail_slots = 63;
> +       mst_state->start_slot = 1;
> +
>          mst_state->mgr = mgr;
>          INIT_LIST_HEAD(&mst_state->vcpis);
>  
> diff --git a/include/drm/drm_dp_mst_helper.h
> b/include/drm/drm_dp_mst_helper.h
> index ddb9231d0309..f8152dfb34ed 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -554,6 +554,8 @@ struct drm_dp_mst_topology_state {
>          struct drm_private_state base;
>          struct list_head vcpis;
>          struct drm_dp_mst_topology_mgr *mgr;
> +       u8 total_avail_slots;
> +       u8 start_slot;
>  };
>  
>  #define to_dp_mst_topology_mgr(x) container_of(x, struct
> drm_dp_mst_topology_mgr, base)
> @@ -661,6 +663,16 @@ struct drm_dp_mst_topology_mgr {
>           */
>          int pbn_div;
>  
> +       /**
> +        * @total_avail_slots: 63 for 8b/10b, 64 for 128/132b
> +        */
> +       u8 total_avail_slots;
> +
> +       /**
> +        * @start_slot: 1 for 8b/10b, 0 for 128/132b
> +        */
> +       u8 start_slot;
> +
>          /**
>           * @funcs: Atomic helper callbacks
>           */
> @@ -806,6 +818,7 @@ int drm_dp_mst_get_vcpi_slots(struct
> drm_dp_mst_topology_mgr *mgr, struct drm_dp
>  
>  void drm_dp_mst_reset_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,
> struct drm_dp_mst_port *port);
>  
> +void drm_dp_mst_update_coding_cap(struct drm_dp_mst_topology_state
> *mst_state, uint8_t link_coding_cap);
>  
>  void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
>                                  struct drm_dp_mst_port *port);

-- 
Cheers,
Lyude Paul (she/her)
Software Engineer at Red Hat

--=-IS1JWVDl8SN9TBIg44Fe
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head>

<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr"><div>No problem, thanks for the patches! Will take a look=
 at this tomorrow</div><div><br></div><div>On Tue, 2021-10-12 at 22:02 +000=
0, Lakha, Bhawanpreet wrote:</div><blockquote type=3D"cite" style=3D"margin=
:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><p style=3D"fo=
nt-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" align=3D"Left">[A=
MD Official Use Only]<br></p><div><br></div><div><div style=3D"font-family:=
 Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0=
);"><pre>Hi Lyude,<br><br>Jerry is busy these few weeks so I will be taking=
 a look at this. I added the start/total slots to the mst_state and am upda=
ting them in atomic_check.<br><br>Also ignore the V2 "<font size=3D"2"><spa=
n style=3D"font-size:11pt">* Remove get_mst_link_encoding_cap</span></font>=
" I got a bit lost in trying to figure out the patch layout that was sent b=
efore.<br><br><br>Thanks,<br>Bhawan<br></pre><br></div><div id=3D"appendons=
end"></div><hr style=3D"display:inline-block;width:98%" tabindex=3D"-1"><di=
v id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" style=
=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Bhawanpreet Lakha &lt;Bh=
awanpreet.Lakha@amd.com&gt;<br><b>Sent:</b> October 12, 2021 5:58 PM<br><b>=
To:</b> Zuo, Jerry &lt;Jerry.Zuo@amd.com&gt;; dri-devel@lists.freedesktop.o=
rg &lt;dri-devel@lists.freedesktop.org&gt;; lyude@redhat.com &lt;lyude@redh=
at.com&gt;<br><b>Cc:</b> Wentland, Harry &lt;Harry.Wentland@amd.com&gt;; Li=
n, Wayne &lt;Wayne.Lin@amd.com&gt;; Kazlauskas, Nicholas &lt;Nicholas.Kazla=
uskas@amd.com&gt;; Lakha, Bhawanpreet &lt;Bhawanpreet.Lakha@amd.com&gt;<br>=
<b>Subject:</b> [PATCH] drm: Update MST First Link Slot Information Based o=
n Encoding Format</font><div>&nbsp;</div></div><div class=3D"BodyFragment">=
<font size=3D"2"><span style=3D"font-size:11pt;"><div class=3D"PlainText">8=
b/10b encoding format requires to reserve the first slot for<br>recording m=
etadata. Real data transmission starts from the second slot,<br>with a tota=
l of available 63 slots available.<br><br>In 128b/132b encoding format, met=
adata is transmitted separately<br>in LLCP packet before MTP. Real data tra=
nsmission starts from<br>the first slot, with a total of 64 slots available=
.<br><br>v2:<br>* Remove get_mst_link_encoding_cap<br>* Move total/start sl=
ots to mst_state, and copy it to mst_mgr in<br>atomic_check<br><br>Signed-o=
ff-by: Fangzhi Zuo &lt;Jerry.Zuo@amd.com&gt;<br>Signed-off-by: Bhawanpreet =
Lakha &lt;Bhawanpreet.Lakha@amd.com&gt;<br>---<br>&nbsp;.../gpu/drm/amd/dis=
play/amdgpu_dm/amdgpu_dm.c | 28 +++++++++++++++<br>&nbsp;drivers/gpu/drm/dr=
m_dp_mst_topology.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 35 ++=
+++++++++++++----<br>&nbsp;include/drm/drm_dp_mst_helper.h&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 13 ++=
+++++<br>&nbsp;3 files changed, 69 insertions(+), 7 deletions(-)<br><br>dif=
f --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/d=
rm/amd/display/amdgpu_dm/amdgpu_dm.c<br>index 5020f2d36fe1..4ad50eb0091a 10=
0644<br>--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>+++ b/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>@@ -10612,6 +10612,8 @@ =
static int amdgpu_dm_atomic_check(struct drm_device *dev,<br>&nbsp;#if defi=
ned(CONFIG_DRM_AMD_DC_DCN)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct dsc_mst_fairness_vars vars[MAX_PIPES];<br>&nbsp;#endif<br>+&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_dp_mst_topology_state *mst_state=
;<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_dp_mst_topology_mgr *=
mgr;<br>&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trace_am=
dgpu_dm_atomic_check_begin(state);<br>&nbsp;<br>@@ -10819,6 +10821,32 @@ st=
atic int amdgpu_dm_atomic_check(struct drm_device *dev,<br>&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; lock_and_validation_needed =3D true;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>&nbsp;<br>+#if defined(CONFIG_DRM_AMD_DC_DCN)<br>+=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_new_mst_mgr_in_state(state, m=
gr, mst_state, i) {<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_dm_connector *aconnector;<b=
r>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; struct drm_connector *connector;<br>+&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_conn=
ector_list_iter iter;<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 link_coding_cap;<br>+<br>+&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
if (!mgr-&gt;mst_state )<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; continue;<br>+<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_connector_list_iter_begin(dev,=
 &amp;iter);<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; drm_for_each_connector_iter(connector, &amp;iter=
) {<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int id =
=3D connector-&gt;index;<br>+<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (id =3D=3D mst_state-&gt;mgr-&gt;conn_base_id) {<br>+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; aconnector =3D to_amdgpu_dm_connector(connecto=
r);<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; link_coding_cap =3D dc_link_dp_mst_d=
ecide_link_encoding_format(aconnector-&gt;dc_link);<br>+&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; drm_dp_mst_update_coding_cap(mst_state, link_coding_cap);<br>+<=
br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>+&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_connector_=
list_iter_end(&amp;iter);<br>+<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<b=
r>+#endif<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /**<br>&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Streams and planes are r=
eset when there are changes that affect<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; * bandwidth. Anything that affects bandwidth needs t=
o go through<br>diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/driver=
s/gpu/drm/drm_dp_mst_topology.c<br>index ad0795afc21c..fb5c47c4cb2e 100644<=
br>--- a/drivers/gpu/drm/drm_dp_mst_topology.c<br>+++ b/drivers/gpu/drm/drm=
_dp_mst_topology.c<br>@@ -3368,7 +3368,7 @@ int drm_dp_update_payload_part1=
(struct drm_dp_mst_topology_mgr *mgr)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; struct drm_dp_payload req_payload;<br>&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_dp_mst_port *port;<br>&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i, j;<br>-&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; int cur_slots =3D 1;<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int=
 cur_slots =3D mgr-&gt;start_slot;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; bool skip;<br>&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; mutex_lock(&amp;mgr-&gt;payload_lock);<br>@@ -4321,7 +4321,7 @@ i=
nt drm_dp_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,<br>&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_slots =3D DIV_ROUND_UP(pbn, mgr=
-&gt;pbn_div);<br>&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; /* max. time slots - one slot for MTP header */<br>-&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (num_slots &gt; 63)<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; if (num_slots &gt; mgr-&gt;total_avail_slots)<br>&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 return -ENOSPC;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return=
 num_slots;<br>&nbsp;}<br>@@ -4333,7 +4333,7 @@ static int drm_dp_init_vcpi=
(struct drm_dp_mst_topology_mgr *mgr,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; int ret;<br>&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* max. time slots - one slot for MTP header */<br>-&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; if (slots &gt; 63)<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; if (slots &gt; mgr-&gt;total_avail_slots)<br>&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; return -ENOSPC;<br>&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; vcpi-&gt;pbn =3D pbn;<br>@@ -4507,6 +4507,18 @@ int drm_dp_atomic_rele=
ase_vcpi_slots(struct drm_atomic_state *state,<br>&nbsp;}<br>&nbsp;EXPORT_S=
YMBOL(drm_dp_atomic_release_vcpi_slots);<br>&nbsp;<br>+void drm_dp_mst_upda=
te_coding_cap(struct drm_dp_mst_topology_state *mst_state, uint8_t link_cod=
ing_cap)<br>+{<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (link_coding_cap=
 =3D=3D DP_CAP_ANSI_128B132B) {<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mst_state-&gt;total_avail_slo=
ts =3D 64;<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; mst_state-&gt;start_slot =3D 0;<br>+&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; }<br>+<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_=
DEBUG_KMS("%s coding format on mgr 0x%p\n",<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (link_coding_cap =3D=3D DP_CAP_ANSI_128B132B=
) ? "128b/132b":"8b/10b", mst_state-&gt;mgr);<br>+}<br>+EXPORT_SYMBOL(drm_d=
p_mst_update_coding_cap);<br>+<br>&nbsp;/**<br>&nbsp; * drm_dp_mst_allocate=
_vcpi() - Allocate a virtual channel<br>&nbsp; * @mgr: manager for this por=
t<br>@@ -4538,8 +4550,8 @@ bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_=
topology_mgr *mgr,<br>&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ret =3D drm_dp_init_vcpi(mgr, &amp;port-&gt;vcpi, pbn, slots);<br>&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>-&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_=
dbg_kms(mgr-&gt;dev, "failed to init vcpi slots=3D%d max=3D63 ret=3D%d\n",<=
br>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; DIV_ROUND_UP(pbn, mgr-&gt;pbn_div), ret);<br>+&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dbg_=
kms(mgr-&gt;dev, "failed to init vcpi slots=3D%d max=3D%d ret=3D%d\n",<br>+=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; DIV_ROUND_UP(pbn, mgr-&gt;pbn_div), mgr-&gt;total_avail_slots, ret);=
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; drm_dp_mst_topology_put_port(port);<br>&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; goto out;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }=
<br>@@ -5226,7 +5238,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct d=
rm_dp_mst_topology_mgr *mgr,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_dp_mst_top=
ology_state *mst_state)<br>&nbsp;{<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; struct drm_dp_vcpi_allocation *vcpi;<br>-&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; int avail_slots =3D 63, payload_count =3D 0;<br>+&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; int avail_slots =3D mgr-&gt;total_avail_slots, pa=
yload_count =3D 0;<br>&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; list_for_each_entry(vcpi, &amp;mst_state-&gt;vcpis, next) {<br>&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; /* Releasing VCPI is always OK-even if the port is gone */<=
br>@@ -5255,7 +5267,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct dr=
m_dp_mst_topology_mgr *mgr,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; drm_dbg_atomic(mgr-&gt;dev, "[MST MGR:%p] mst state %p VCPI avai=
l=3D%d used=3D%d\n",<br>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; mgr, mst_state, avail_slots, 63 - avail_slots);<br>+&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mgr, mst_state, avail_slots, mgr-&gt;total_a=
vail_slots - avail_slots);<br>&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; return 0;<br>&nbsp;}<br>@@ -5421,6 +5433,10 @@ int drm_dp_mst=
_atomic_check(struct drm_atomic_state *state)<br>&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>&nbsp;<br>&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mutex_lock(&amp;mgr-&gt;lock);<br>+<br>+&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mgr-&gt;start_=
slot =3D mst_state-&gt;start_slot;<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mgr-&gt;total_avail_slots =
=3D mst_state-&gt;total_avail_slots;<br>+<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D =
drm_dp_mst_atomic_check_mstb_bw_limit(mgr-&gt;mst_primary,<br>&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mst_state);<br>&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; mutex_unlock(&amp;mgr-&gt;lock);<br>@@ -5527,11 +5543,16 @@ int d=
rm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,<br>&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!mgr-&gt;proposed_vcpis)<br>&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; set_bit(0, &amp;mgr-&gt;payload_mask);<br>+&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; mgr-&gt;total_avail_slots =3D 63;<br>+&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; mgr-&gt;start_slot =3D 1;<br>&nbsp;<br>&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mst_state =3D kzalloc(sizeof(*mst_state), G=
FP_KERNEL);<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (mst_sta=
te =3D=3D NULL)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>&nbsp;<br>+&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mst_state-&gt;total_avail_slots =3D 63;<br=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mst_state-&gt;start_slot =3D 1;<br>+=
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mst_state-&gt;mgr =3D =
mgr;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INIT_LIST_HEAD(&am=
p;mst_state-&gt;vcpis);<br>&nbsp;<br>diff --git a/include/drm/drm_dp_mst_he=
lper.h b/include/drm/drm_dp_mst_helper.h<br>index ddb9231d0309..f8152dfb34e=
d 100644<br>--- a/include/drm/drm_dp_mst_helper.h<br>+++ b/include/drm/drm_=
dp_mst_helper.h<br>@@ -554,6 +554,8 @@ struct drm_dp_mst_topology_state {<b=
r>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_private_state=
 base;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct list_head=
 vcpis;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_dp_m=
st_topology_mgr *mgr;<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 total_ava=
il_slots;<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 start_slot;<br>&nbsp;=
};<br>&nbsp;<br>&nbsp;#define to_dp_mst_topology_mgr(x) container_of(x, str=
uct drm_dp_mst_topology_mgr, base)<br>@@ -661,6 +663,16 @@ struct drm_dp_ms=
t_topology_mgr {<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
*/<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int pbn_div;<br>&nbs=
p;<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /**<br>+&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; * @total_avail_slots: 63 for 8b/10b, 64 for 128/132b<br=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>+&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; u8 total_avail_slots;<br>+<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; /**<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @start_slot: 1 =
for 8b/10b, 0 for 128/132b<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *=
/<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 start_slot;<br>+<br>&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /**<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; * @funcs: Atomic helper callbacks<br>&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>@@ -806,6 +818,7 @@ int d=
rm_dp_mst_get_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp=
<br>&nbsp;<br>&nbsp;void drm_dp_mst_reset_vcpi_slots(struct drm_dp_mst_topo=
logy_mgr *mgr, struct drm_dp_mst_port *port);<br>&nbsp;<br>+void drm_dp_mst=
_update_coding_cap(struct drm_dp_mst_topology_state *mst_state, uint8_t lin=
k_coding_cap);<br>&nbsp;<br>&nbsp;void drm_dp_mst_deallocate_vcpi(struct dr=
m_dp_mst_topology_mgr *mgr,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
truct drm_dp_mst_port *port);<br></div></span></font></div></div></blockquo=
te><div><br></div><div><span><pre>-- <br></pre><div data-evo-paragraph=3D""=
 class=3D"" style=3D"width: 78ch;" data-evo-signature-plain-text-mode=3D"">=
Cheers,</div><div data-evo-paragraph=3D"" class=3D"" style=3D"width: 78ch;"=
><span class=3D"Apple-tab-span" style=3D"white-space:pre">=09</span>Lyude P=
aul (she/her)</div><div data-evo-paragraph=3D"" class=3D"" style=3D"width: =
78ch;"><span class=3D"Apple-tab-span" style=3D"white-space:pre">=09</span>S=
oftware Engineer at Red Hat</div></span></div></body></html>

--=-IS1JWVDl8SN9TBIg44Fe--

