Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF8F3201EE
	for <lists+dri-devel@lfdr.de>; Sat, 20 Feb 2021 00:42:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A946EC7E;
	Fri, 19 Feb 2021 23:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AB76EC78;
 Fri, 19 Feb 2021 23:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=Ujc49kt9eo68ReIbNwWQjhrzEZMk/8nIE0bWp20uh7I=; b=rqqinnM+XuYTrQ5+5XbuydvhVX
 2PKbS5x9MPinq/CtNTG5iXunSKuiHI6mFGWmxRUBzwL/bpKdsQtlzyUOHI0XjJkwkQlzBgE50DOMw
 2mhjKySue2iQPnmwy9YsNHXndzRkJDi1kQlPxAvQacFJgMfje+4pMB4jga6apNGeYQwnPgW9QxoOb
 6VXBsbPiCWwfZJ1r7dlZqXZtvKtcP6q6CB9LaarSP8XVLpBbuFDPPaynSqmVTF8tQN9ZcmQK2QHBj
 F+M2zQqaMXdZAYxNCeLo+zu7csNF3PYexO/Grvh18B45zcFuIeZns8U1rKKk4NcdiU22xSStnhJBk
 03In6QSQ==;
Received: from [2601:1c0:6280:3f0::d05b]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDFQ0-0008AI-9u; Fri, 19 Feb 2021 23:42:40 +0000
Subject: Re: [PATCH 01/30] drm/dp: Rewrap kdocs for struct drm_dp_aux
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20210219215326.2227596-1-lyude@redhat.com>
 <20210219215326.2227596-2-lyude@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <712dc0c3-8ef3-ae3a-8838-93276529dff7@infradead.org>
Date: Fri, 19 Feb 2021 15:42:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219215326.2227596-2-lyude@redhat.com>
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/19/21 1:52 PM, Lyude Paul wrote:
> Since we're about to be adding some more fields and update this
> documentation, let's rewrap it to the new column limit of 100 beforehand.
> No actual doc or functional changes are made here.
>

The preferred column limit is still 80.
For some (exceptional) cases, going up to 100 is OK,
but I don't see any reason here to go beyond 80.


> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  include/drm/drm_dp_helper.h | 42 ++++++++++++++++---------------------
>  1 file changed, 18 insertions(+), 24 deletions(-)
> 
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index edffd1dcca3e..2891a98eebc8 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1839,34 +1839,28 @@ struct drm_dp_aux_cec {
>   * @crc_count: counter of captured frame CRCs
>   * @transfer: transfers a message representing a single AUX transaction
>   *
> - * The .dev field should be set to a pointer to the device that implements
> - * the AUX channel.
> + * The .dev field should be set to a pointer to the device that implements the AUX channel.
>   *
> - * The .name field may be used to specify the name of the I2C adapter. If set to
> - * NULL, dev_name() of .dev will be used.
> + * The .name field may be used to specify the name of the I2C adapter. If set to NULL, dev_name() of
> + * .dev will be used.
>   *
> - * Drivers provide a hardware-specific implementation of how transactions
> - * are executed via the .transfer() function. A pointer to a drm_dp_aux_msg
> - * structure describing the transaction is passed into this function. Upon
> - * success, the implementation should return the number of payload bytes
> - * that were transferred, or a negative error-code on failure. Helpers
> - * propagate errors from the .transfer() function, with the exception of
> - * the -EBUSY error, which causes a transaction to be retried. On a short,
> - * helpers will return -EPROTO to make it simpler to check for failure.
> + * Drivers provide a hardware-specific implementation of how transactions are executed via the
> + * .transfer() function. A pointer to a drm_dp_aux_msg structure describing the transaction is
> + * passed into this function. Upon success, the implementation should return the number of payload
> + * bytes that were transferred, or a negative error-code on failure. Helpers propagate errors from
> + * the .transfer() function, with the exception of the -EBUSY error, which causes a transaction to
> + * be retried. On a short, helpers will return -EPROTO to make it simpler to check for failure.
>   *
> - * An AUX channel can also be used to transport I2C messages to a sink. A
> - * typical application of that is to access an EDID that's present in the
> - * sink device. The .transfer() function can also be used to execute such
> - * transactions. The drm_dp_aux_register() function registers an I2C
> - * adapter that can be passed to drm_probe_ddc(). Upon removal, drivers
> - * should call drm_dp_aux_unregister() to remove the I2C adapter.
> - * The I2C adapter uses long transfers by default; if a partial response is
> - * received, the adapter will drop down to the size given by the partial
> - * response for this transaction only.
> + * An AUX channel can also be used to transport I2C messages to a sink. A typical application of
> + * that is to access an EDID that's present in the sink device. The .transfer() function can also be
> + * used to execute such transactions. The drm_dp_aux_register() function registers an I2C adapter
> + * that can be passed to drm_probe_ddc(). Upon removal, drivers should call drm_dp_aux_unregister()
> + * to remove the I2C adapter. The I2C adapter uses long transfers by default; if a partial response
> + * is received, the adapter will drop down to the size given by the partial response for this
> + * transaction only.
>   *
> - * Note that the aux helper code assumes that the .transfer() function
> - * only modifies the reply field of the drm_dp_aux_msg structure.  The
> - * retry logic and i2c helpers assume this is the case.
> + * Note that the aux helper code assumes that the .transfer() function only modifies the reply field
> + * of the drm_dp_aux_msg structure. The retry logic and i2c helpers assume this is the case.
>   */
>  struct drm_dp_aux {
>  	const char *name;
> 


-- 
~Randy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
