Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03370260DCC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 10:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA2C6E199;
	Tue,  8 Sep 2020 08:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net
 [194.109.24.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23E36E199
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 08:41:31 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id FZBvkWMsNMeQuFZBwkfEso; Tue, 08 Sep 2020 10:41:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1599554490; bh=AQvpE90imbtcIDG4V2WxYb2iJCg77f2qjbgyPSUlRuc=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=wQHmFTHgMsA1Jy62WHxzFpV1f5P1aa6rhXG7umxaWThv8UoIZLvBI/cVyTm2RdjN5
 USYsZoojECcbBPWeRhbjr0GuUNBGQMk44nd0O8CByqLA6pYZBlt+dBKDASBXctzMch
 as57Zp+wsvRvvQFIAQPepjj5jPSfC968TpwvtJFmc/uwnqx+wiABRgIQu+6Kr20JCm
 FwjlQM8SfAnTLpD47rhXDGRGgEWyBkQaKc1NzGWm+rkcEAfZuYpU7Nw/Ba+U4jS8xg
 QhkdkekNaRB/3i9lC4omE6p6QCdoLEaWPYy6Dm8Ea0otyvi8WOXxrpEKyUt7BGJW0c
 lx9o1h9WNwBBA==
Subject: Re: [PATCH 4/5] drm_dp_cec: add plumbing in preparation for MST
 support
To: Sam McNally <sammc@chromium.org>, LKML <linux-kernel@vger.kernel.org>
References: <20200901162133.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
 <20200901162133.4.I900b1b80709b7632a47d0ddb4cd375b4a3616c9e@changeid>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2f1e64e4-bb37-0cfb-6b3b-3f51fd5faca3@xs4all.nl>
Date: Tue, 8 Sep 2020 10:41:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901162133.4.I900b1b80709b7632a47d0ddb4cd375b4a3616c9e@changeid>
Content-Language: en-US
X-CMAE-Envelope: MS4wfHz6rVM5/ECaUJ5Mt6JfyH8yYyfdOz7LyjzrGRpN5U8iJI039Wq60UxQJCQ82NhNMgJB9bQLpG24tbwI9XbmBkSFKkunPEEJscayJNaAJxeoArKYTOut
 uPlnlCkBz3xHnsmrgSm1EbaB+j2jU1DP6KrF1DJGI8skOO8/xNnSytrGpMKOVVZSqEs59oxNTgRAP71WCFeWLOv4QFqf6jJiDv/E2vMHdJsmwlIIn/vu2Pzv
 ClXAlwwB/bUtrBguK8ghXQ2yWwp5c+bHkaoGkSV1YYlb2BBZp0eL51+MDz2MQj5BIpyglkYhvIYWSelLQ+i5AB36nNOpG3Tt8Lg5O/wvTpFkTDD1TT+hzrNB
 7WdTNViEGmmJ3AzbTxKTRG5xURNFWTcKLaSJXHdotkvGYOA9x4+EiGCWWwHa1AanUOuN9G0YAJffpBrd6BJZRj1mgjaB09N11xW01TpBthJDCx7SsvsvRVn4
 aY07xj62VhLn2RHLG3YX1rKb3zJ0zjc4aq19wIrYLf8abiZfUTT75hcfRxaVk1kPN63UdDpzKcyoasvjtmNuOIaKyLssWvoi/GPcfVHhmSk/PpPeck69fANr
 HYZtxUVryhbu9vKE4gvYhoPnAk16u9QO9dMtIjnSJtNCBBTTwGV4EW/1AR3f23ti3HQLwiRRpDZhFaO+TFy8iLJy6BmLwthPe6gw+z7c6Mu2Poh5ehj8UuFY
 y8khoQXwdG20S94epeVNtbelVC9D9vzUcO9RCGTZaz6iB6y+EVh5+G+SajyooLMbsfKV6LniY+npUwB+p1OtEqXJ9salkXcX1pqzwvu13N3r27A+2vCp/qon
 wD79o3oHfehxc6cOKBz05xy5wuxdwMVSLBxtx5Dyi6pNV5pr4+METtFiobqobQ/vTboFh8PRRvRlUpUd5ktJrlANDXSNmr2OveNYb2sd1MZ8RrtT3sWxWTFF
 AjneWsnF5xQ/6Ba2iJcZ6Ec8SV7cinwz+N7QtBSNDANeJI4RqSAXrVxRA3tQB6gNOklzXAo6ogbmPBnA7R/cW0F5+oHhDBytM+NyPc5hW71nHfIr
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 David Francis <David.Francis@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Leo Li <sunpeng.li@amd.com>,
 =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Wambui Karuga <wambui.karugax@gmail.com>, intel-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/09/2020 08:22, Sam McNally wrote:
> From: Hans Verkuil <hans.verkuil@cisco.com>
> 
> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> [sammc@chromium.org:
>  - rebased
>  - removed polling-related changes
>  - moved the calls to drm_dp_cec_(un)set_edid() into the next patch
> ]
> Signed-off-by: Sam McNally <sammc@chromium.org>
> ---
> 
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  2 +-
>  drivers/gpu/drm/drm_dp_cec.c                  | 22 ++++++++++---------
>  drivers/gpu/drm/i915/display/intel_dp.c       |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_connector.c   |  2 +-
>  include/drm/drm_dp_helper.h                   |  6 +++--
>  5 files changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 461fa4da0a34..6e7075893ec9 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -419,7 +419,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>  
>  	drm_dp_aux_init(&aconnector->dm_dp_aux.aux);
>  	drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
> -				      &aconnector->base);
> +				      &aconnector->base, false);
>  
>  	if (aconnector->base.connector_type == DRM_MODE_CONNECTOR_eDP)
>  		return;
> diff --git a/drivers/gpu/drm/drm_dp_cec.c b/drivers/gpu/drm/drm_dp_cec.c
> index 3ab2609f9ec7..04ab7b88055c 100644
> --- a/drivers/gpu/drm/drm_dp_cec.c
> +++ b/drivers/gpu/drm/drm_dp_cec.c
> @@ -14,6 +14,7 @@
>  #include <drm/drm_connector.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_dp_helper.h>
> +#include <drm/drm_dp_mst_helper.h>
>  
>  /*
>   * Unfortunately it turns out that we have a chicken-and-egg situation
> @@ -338,8 +339,6 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
>  	if (aux->cec.adap) {
>  		if (aux->cec.adap->capabilities == cec_caps &&
>  		    aux->cec.adap->available_log_addrs == num_las) {
> -			/* Unchanged, so just set the phys addr */
> -			cec_s_phys_addr_from_edid(aux->cec.adap, edid);
>  			goto unlock;
>  		}
>  		/*
> @@ -364,15 +363,16 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
>  	if (cec_register_adapter(aux->cec.adap, connector->dev->dev)) {
>  		cec_delete_adapter(aux->cec.adap);
>  		aux->cec.adap = NULL;
> -	} else {
> -		/*
> -		 * Update the phys addr for the new CEC adapter. When called
> -		 * from drm_dp_cec_register_connector() edid == NULL, so in
> -		 * that case the phys addr is just invalidated.
> -		 */
> -		cec_s_phys_addr_from_edid(aux->cec.adap, edid);
>  	}
>  unlock:
> +	/*
> +	 * Update the phys addr for the new CEC adapter. When called
> +	 * from drm_dp_cec_register_connector() edid == NULL, so in
> +	 * that case the phys addr is just invalidated.
> +	 */

The comment is no longer in sync with the code: if EDID == NULL, then
nothing is done due to the edid check in the 'if' below.

> +	if (aux->cec.adap && edid) {

I think this should just be: if (aux->cec.adap)

Also, the {} aren't necessary here.

> +		cec_s_phys_addr_from_edid(aux->cec.adap, edid);
> +	}
>  	mutex_unlock(&aux->cec.lock);
>  }
>  EXPORT_SYMBOL(drm_dp_cec_set_edid);

Frankly, the changes to this function should be dropped completely, from
what I can see they are not necessary. It was done in my original patch
because of the way I handled mst, but you did it differently (and I think
better), so these changes are no longer needed.

I know I am actually commenting on my old patch, but that patch was from a
work-in-progress git branch and was never meant as a 'proper' patch.

However, what complicates matters is that after digging a bit more I discovered
that commit 732300154980 ("drm: Do not call drm_dp_cec_set_edid() while registering
DP connectors") changed drm_dp_cec_register_connector() so that it no longer
calls drm_dp_cec_set_edid(), but the comments there and in this function were
not updated. It would be nice if you can add a patch fixing these outdated
comments.

Regardless of that change in commit 732300154980, the edid pointer can still be
NULL and the existing behavior should be kept (i.e. create a CEC device, but with
an invalid physical address since there is no EDID for some reason).

Regards,

	Hans

> @@ -418,6 +418,7 @@ EXPORT_SYMBOL(drm_dp_cec_unset_edid);
>   * drm_dp_cec_register_connector() - register a new connector
>   * @aux: DisplayPort AUX channel
>   * @connector: drm connector
> + * @is_mst: set to true if this is an MST branch
>   *
>   * A new connector was registered with associated CEC adapter name and
>   * CEC adapter parent device. After registering the name and parent
> @@ -425,12 +426,13 @@ EXPORT_SYMBOL(drm_dp_cec_unset_edid);
>   * CEC and to register a CEC adapter if that is the case.
>   */
>  void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
> -				   struct drm_connector *connector)
> +				   struct drm_connector *connector, bool is_mst)
>  {
>  	WARN_ON(aux->cec.adap);
>  	if (WARN_ON(!aux->transfer))
>  		return;
>  	aux->cec.connector = connector;
> +	aux->cec.is_mst = is_mst;
>  	INIT_DELAYED_WORK(&aux->cec.unregister_work,
>  			  drm_dp_cec_unregister_work);
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 82b9de274f65..744cb55572f9 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -6261,7 +6261,7 @@ intel_dp_connector_register(struct drm_connector *connector)
>  	intel_dp->aux.dev = connector->kdev;
>  	ret = drm_dp_aux_register(&intel_dp->aux);
>  	if (!ret)
> -		drm_dp_cec_register_connector(&intel_dp->aux, connector);
> +		drm_dp_cec_register_connector(&intel_dp->aux, connector, false);
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 49dd0cbc332f..671a70e95cd1 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -1414,7 +1414,7 @@ nouveau_connector_create(struct drm_device *dev,
>  	switch (type) {
>  	case DRM_MODE_CONNECTOR_DisplayPort:
>  	case DRM_MODE_CONNECTOR_eDP:
> -		drm_dp_cec_register_connector(&nv_connector->aux, connector);
> +		drm_dp_cec_register_connector(&nv_connector->aux, connector, false);
>  		break;
>  	}
>  
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 85513eeb2196..12bca1b9512b 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1495,12 +1495,14 @@ struct drm_connector;
>   * @lock: mutex protecting this struct
>   * @adap: the CEC adapter for CEC-Tunneling-over-AUX support.
>   * @connector: the connector this CEC adapter is associated with
> + * @is_mst: this is an MST branch
>   * @unregister_work: unregister the CEC adapter
>   */
>  struct drm_dp_aux_cec {
>  	struct mutex lock;
>  	struct cec_adapter *adap;
>  	struct drm_connector *connector;
> +	bool is_mst;
>  	struct delayed_work unregister_work;
>  };
>  
> @@ -1746,7 +1748,7 @@ drm_dp_has_quirk(const struct drm_dp_desc *desc, u32 edid_quirks,
>  #ifdef CONFIG_DRM_DP_CEC
>  void drm_dp_cec_irq(struct drm_dp_aux *aux);
>  void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
> -				   struct drm_connector *connector);
> +				   struct drm_connector *connector, bool is_mst);
>  void drm_dp_cec_unregister_connector(struct drm_dp_aux *aux);
>  void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid);
>  void drm_dp_cec_unset_edid(struct drm_dp_aux *aux);
> @@ -1757,7 +1759,7 @@ static inline void drm_dp_cec_irq(struct drm_dp_aux *aux)
>  
>  static inline void
>  drm_dp_cec_register_connector(struct drm_dp_aux *aux,
> -			      struct drm_connector *connector)
> +			      struct drm_connector *connector, bool is_mst)
>  {
>  }
>  
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
