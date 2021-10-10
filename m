Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B69C84283A2
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 22:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060006E3F2;
	Sun, 10 Oct 2021 20:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD0A6E3F2
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 20:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=180p9fb+elBeRuoqEawvqFUI9vLDBl8hrC/K7xu8wEA=; b=JGcETydjQvzsFcwFHMJTNf9r21
 B62GmzW67qrMEQAAiuM5xm9FM+aKQr1NhlTXMV1p/xTUSANIvbNLmcgbHBSInvWbZcFSPyQgOW+Gs
 zi8KuPQV9ozozKA8jbh4MfjGkToniH/RNgylKlhiUki16WuTRHf2l4VO7I3JV3SSgtaVu/NgwCVbc
 ALPqam35umXB8uZZAqVFYcqEWylOnzTlJ0n0wsODaf5CuEMLmgFIaYtxKlvJ+bGsbMXf6WtSNT8B5
 gcSt0T+pDePD7WpcFYgjh3pWPJ8VGOP7e3YgIWBXAKIeJQn3fUC2fy6dTkAplVN+TqHNMI8xiTIXf
 1dGEVDDw==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZfsZ-007Mqi-9o; Sun, 10 Oct 2021 20:57:07 +0000
Subject: Re: [PATCH -next] drm/connector: fix all kernel-doc warnings
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Derek Basehore <dbasehore@chromium.org>, Hans de Goede
 <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20211007005305.15171-1-rdunlap@infradead.org>
 <YWNHMsBo5xhuwuAw@ravnborg.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1189b525-52e6-a2de-fb70-d30b693c7840@infradead.org>
Date: Sun, 10 Oct 2021 13:57:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWNHMsBo5xhuwuAw@ravnborg.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Hi Sam,

On 10/10/21 1:04 PM, Sam Ravnborg wrote:
> Hi Randy,
> 
> I noticed a few things that in my opinion could be improved.
> See below.
> 
> 	Sam
> 
> 
> On Wed, Oct 06, 2021 at 05:53:05PM -0700, Randy Dunlap wrote:
>> Clean up all of the kernel-doc issues in drm_connector.c:
>>
>> drivers/gpu/drm/drm_connector.c:2611: warning: Excess function parameter 'connector' description in 'drm_connector_oob_hotplug_event'
>> drivers/gpu/drm/drm_connector.c:2611: warning: Function parameter or member 'connector_fwnode' not described in 'drm_connector_oob_hotplug_event'
>>
>> drm_connector.c:630: warning: No description found for return value of 'drm_get_connector_status_name'
>> drm_connector.c:715: warning: No description found for return value of 'drm_connector_list_iter_next'
>> drm_connector.c:785: warning: No description found for return value of 'drm_get_subpixel_order_name'
>> drm_connector.c:816: warning: No description found for return value of 'drm_display_info_set_bus_formats'
>> drm_connector.c:1331: warning: No description found for return value of 'drm_mode_create_dvi_i_properties'
>> drm_connector.c:1412: warning: No description found for return value of 'drm_connector_attach_content_type_property'
>> drm_connector.c:1492: warning: No description found for return value of 'drm_mode_create_tv_margin_properties'
>> drm_connector.c:1534: warning: No description found for return value of 'drm_mode_create_tv_properties'
>> drm_connector.c:1627: warning: No description found for return value of 'drm_mode_create_scaling_mode_property'
>> drm_connector.c:1944: warning: No description found for return value of 'drm_mode_create_suggested_offset_properties'
>>
>> drm_connector.c:2315: warning: missing initial short description on line:
>>   * drm_connector_set_panel_orientation_with_quirk -
>>
>> [The last warning listed is probably a quirk/bug in scripts/kernel-doc.]
>>
>> Fixes: 613051dac40d ("drm: locking&new iterators for connector_list")
>> Fixes: 522171951761 ("drm: Extract drm_connector.[hc]")
>> Fixes: b3c6c8bfe378 ("drm: document drm_display_info")
>> Fixes: 50525c332b55 ("drm: content-type property for HDMI connector")
>> Fixes: 6c4f52dca36f ("drm/connector: Allow creation of margin props alone")
>> Fixes: 69654c632d80 ("drm/connector: Split out orientation quirk detection (v2)")
>> Fixes: 72ad49682dde ("drm/connector: Add support for out-of-band hotplug notification (v3)")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Boris Brezillon <boris.brezillon@bootlin.com>
>> Cc: Derek Basehore <dbasehore@chromium.org>
>> Cc: Hans de Goede <hdegoede@redhat.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>> 72ad49682dde ("drm/connector: Add support for out-of-band hotplug notification (v3)")
>>    is only in linux-next. The others are in mainline.
>>
>>   drivers/gpu/drm/drm_connector.c |   30 ++++++++++++++++++++++++++----
>>   1 file changed, 26 insertions(+), 4 deletions(-)
>>
>> --- linux-next-20211006.orig/drivers/gpu/drm/drm_connector.c
>> +++ linux-next-20211006/drivers/gpu/drm/drm_connector.c
>> @@ -625,6 +625,8 @@ int drm_connector_register_all(struct dr
>>    *
>>    * In contrast to the other drm_get_*_name functions this one here returns a
>>    * const pointer and hence is threadsafe.
>> + *
>> + * Returns: connector status string
>>    */
>>   const char *drm_get_connector_status_name(enum drm_connector_status status)
>>   {
>> @@ -707,7 +709,7 @@ __drm_connector_put_safe(struct drm_conn
>>    * drm_connector_list_iter_next - return next connector
>>    * @iter: connector_list iterator
>>    *
>> - * Returns the next connector for @iter, or NULL when the list walk has
>> + * Returns: the next connector for @iter, or NULL when the list walk has
>>    * completed.
>>    */
>>   struct drm_connector *
>> @@ -780,6 +782,8 @@ static const struct drm_prop_enum_list d
>>    *
>>    * Note you could abuse this and return something out of bounds, but that
>>    * would be a caller error.  No unscrubbed user data should make it here.
>> + *
>> + * Returns: string describing an enumerated subpixel property
>>    */
>>   const char *drm_get_subpixel_order_name(enum subpixel_order order)
>>   {
>> @@ -809,6 +813,9 @@ static const struct drm_prop_enum_list d
>>    * Store the supported bus formats in display info structure.
>>    * See MEDIA_BUS_FMT_* definitions in include/uapi/linux/media-bus-format.h for
>>    * a full list of available formats.
>> + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
> I prefer the following variant:
> "0 on success or a negative error code on failure."
> 
> Then we do not use the overloaded "errno" name.
> At least in include/drm/* my preferred variant is the most popular for
> what it is worth.

OK, I'll change it to that.

> 
>>    */
>>   int drm_display_info_set_bus_formats(struct drm_display_info *info,
>>   				     const u32 *formats,
>> @@ -1326,6 +1333,8 @@ int drm_connector_create_standard_proper
>>    * @dev: DRM device
>>    *
>>    * Called by a driver the first time a DVI-I connector is made.
>> + *
>> + * Returns: %0
> Looks like some macro gone wrong - but I looked it up.
> It is kernel-doc syntax for a named constant.
> 
> My personal preference would be a plain "0" - but that just
> bikeshedding.

Yeah, I would prefer to use kernel-doc notation for constants.
It is documented and has been around for a long time.

I will resend the patch.

Thanks.

-- 
~Randy
