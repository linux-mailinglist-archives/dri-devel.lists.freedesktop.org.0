Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5280169DF01
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 12:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA5410E30F;
	Tue, 21 Feb 2023 11:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 664 seconds by postgrey-1.36 at gabe;
 Tue, 21 Feb 2023 11:38:54 UTC
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CB410E30F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 11:38:54 +0000 (UTC)
X-KPN-MessageId: c2e2ba49-b1da-11ed-b20d-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.39])
 by ewsoutbound.so.kpn.org (Halon) with ESMTPS
 id c2e2ba49-b1da-11ed-b20d-005056abbe64;
 Tue, 21 Feb 2023 12:27:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=xs4all01;
 h=content-type:from:to:subject:mime-version:date:message-id;
 bh=2SXulZ7Tcata1/Hl2YgVzZkdNuGDl6U6KAoQFoQ52oM=;
 b=OGHqN1BZ8TObIAW6OS1FsjqBz83Yu9zuThC4R3+Mm/x+ikLZBHxGzH3ZpzmCMbN1CCzwv4vE6ZY9c
 nNiQcijvp22pm1/Zol0eCXB21VRQB6xb5foCkF/ahYZc/qmgA5l1oC8IFyonVtBeeLXsGN99ANzXEj
 /DE4h19EsFi4zKfLP+6mJcUZ7fzNpnwIHKyyAjOjE+tCRBDoojVBlv1jre2GzCH6Of4Ncb47/kHRjY
 zAh5TSh1oewtpF0nznQX690v9NVt2O0c9B9EwvBytorKCZczbxyy2DGwYrMVw+B6kRs1V2OlLM29gN
 pWKdrawQEd1xIfiM89+OLNioEhU3H+g==
X-KPN-MID: 33|SZCsgezzSUgDKaxnj+V5Iw6pCrCyE1DfjNo2kiqDEOQuCR0P8deYrCyXv8E39Sz
 5OdWfnsCuNRy29YXuP8X9fKN+5iUqqGh6AY/yM4sItdE=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|jRFwycXxc2BzA54ce0WZ1rpJLX3HJdlqnHG87IjVJ3fVsepKRZPG7DgTjZVqlDQ
 6vUtnoNCQYOC7Lak1ZXVPMg==
X-Originating-IP: 173.38.220.58
Received: from [10.47.77.219] (unknown [173.38.220.58])
 by smtp.xs4all.nl (Halon) with ESMTPSA
 id c40fe7d1-b1da-11ed-ab4c-005056ab7447;
 Tue, 21 Feb 2023 12:27:47 +0100 (CET)
Message-ID: <57fae8cf-1727-4943-68b8-99dc16dadfc1@xs4all.nl>
Date: Tue, 21 Feb 2023 12:27:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/9] drm/vc4: hdmi: Add Broadcast RGB property to allow
 override of RGB range
Content-Language: en-US
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech>
 <20221207-rpi-hdmi-improvements-v2-3-8ace2d8221ad@cerno.tech>
 <8802bf80-19a7-4064-0089-12deffad6636@xs4all.nl>
 <CAPY8ntCVXq=C0uGDtz+JJnptSDa74arTK9ogYkpZ0uWTN8LvPQ@mail.gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAPY8ntCVXq=C0uGDtz+JJnptSDa74arTK9ogYkpZ0uWTN8LvPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/20/23 16:23, Dave Stevenson wrote:
> Hi Hans
> 
> On Sat, 18 Feb 2023 at 11:33, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> Hi Maxime, Dave,
>>
>> On 26/01/2023 14:46, Maxime Ripard wrote:
>>> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>>
>>> Copy Intel's "Broadcast RGB" property semantics to add manual override
>>> of the HDMI pixel range for monitors that don't abide by the content
>>> of the AVI Infoframe.
>>
>> Do we have to copy that property as-is?
> 
> Firstly I'll agree with your later comment that having this control
> allows testing of a range of output modes, and working around HDMI
> sinks that have dodgy implementations.
> (In our vendor kernel we now also have a property to override the
> kernel chosen output format to enable testing of YCbCr4:4:4 and 4:2:2
> output).
> 
> The DRM subsystem has the requirement for an open-source userspace
> project to be using any new property before it will be merged [1].
> This property already exists for i915 and gma-500, therefore avoids
> that requirement.
> 
> There are objections to the UAPI for Broadcast RGB [2], but if it's
> good enough for the existing implementations then there can be no
> objection to it being implemented in the same way for other drivers.
> Otherwise it is a missing feature of the DRM API, and the linked
> discussion is realistically at least a year away from being resolved.
> Why bury our heads in the sand for that period?
> 
> [1] https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements
> [2] https://lists.freedesktop.org/archives/dri-devel/2023-February/391061.html
> 
>> First of all, I think this should really be a drm-level property, rather than
>> a driver property: RGB Quantization Range mismatches are the bane of my life,
>> and I think a way to override this would help everyone.
> 
> Linked to above, if it were the preferred method for controlling this
> then I would expect it to become a drm-level property.
> 
>> Secondly, I hate the name they came up with: 'Broadcast RGB' is pretty meaningless.
>> Can't we stick to something closer to what the CTA-861/HDMI specs use, which is
>> 'RGB Quantization Range'? So either use that, or just 'RGB Range'.
>>
>> In addition, 'Limited 16:235' should just be 'Limited' since the actual range
>> depends on the bits-per-color-component.
> 
> It's documented UAPI with those names[3], therefore any change would
> be a change to user-space's expectation and a regression. At least by
> sticking with the same names then any user space implementation that
> exists for i915 or gma-500 will also work in the same way on vc4.
> 
> [3] https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#existing-kms-properties

Thank you for linking to these threads. It's a terrible name, but it is still
better to have this property than to not have it :-)

> 
>>>
>>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>> ---
>>>  drivers/gpu/drm/vc4/vc4_hdmi.c | 97 ++++++++++++++++++++++++++++++++++++++++--
>>>  drivers/gpu/drm/vc4/vc4_hdmi.h |  9 ++++
>>>  2 files changed, 102 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
>>> index 4b3bf77bb5cd..78749c6fa837 100644
>>> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
>>> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
>>> @@ -150,10 +150,16 @@ static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode,
>>>  }
>>>
>>>  static bool vc4_hdmi_is_full_range_rgb(struct vc4_hdmi *vc4_hdmi,
>>> -                                    const struct drm_display_mode *mode)
>>> +                                    struct vc4_hdmi_connector_state *vc4_state)
>>>  {
>>> +     const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
>>>       struct drm_display_info *display = &vc4_hdmi->connector.display_info;
>>>
>>> +     if (vc4_state->broadcast_rgb == VC4_HDMI_BROADCAST_RGB_LIMITED)
>>> +             return false;
>>> +     else if (vc4_state->broadcast_rgb == VC4_HDMI_BROADCAST_RGB_FULL)
>>> +             return true;
>>> +
>>>       return !display->is_hdmi ||
>>>               drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_FULL;
>>>  }
>>> @@ -524,8 +530,12 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
>>>  {
>>>       struct drm_connector_state *old_state =
>>>               drm_atomic_get_old_connector_state(state, connector);
>>> +     struct vc4_hdmi_connector_state *old_vc4_state =
>>> +             conn_state_to_vc4_hdmi_conn_state(old_state);
>>>       struct drm_connector_state *new_state =
>>>               drm_atomic_get_new_connector_state(state, connector);
>>> +     struct vc4_hdmi_connector_state *new_vc4_state =
>>> +             conn_state_to_vc4_hdmi_conn_state(new_state);
>>>       struct drm_crtc *crtc = new_state->crtc;
>>>
>>>       if (!crtc)
>>> @@ -558,6 +568,7 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
>>>       }
>>>
>>>       if (old_state->colorspace != new_state->colorspace ||
>>> +         old_vc4_state->broadcast_rgb != new_vc4_state->broadcast_rgb ||
>>
>> The problem with this is that this will cause a mode change, even though all
>> that is necessary is to update the csc matrix and AVI InfoFrame.
>>
>> I used this code (added just before the 'return 0;' at the end of this function):
>>
>>         if (old_vc4_state->broadcast_rgb != new_vc4_state->broadcast_rgb) {
>>                 const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
>>
>>                 old_vc4_state->broadcast_rgb = new_vc4_state->broadcast_rgb;
>>                 vc4_hdmi_set_avi_infoframe(encoder);
>>                 if (vc4_hdmi->variant->csc_setup)
>>                         vc4_hdmi->variant->csc_setup(vc4_hdmi, old_state, mode);
>>         }
>>
>> I'm certain this is in the wrong place, but I'm not familiar enough with the drm API
>> to determine where this should go.
> 
> atomic_check is meant to validate the state, but must never touch the
> hardware [4].
> atomic_commit updates the hardware, although for struct
> drm_connector_helper_funcs atomic_commit is documented as only being
> applicable for writeback connectors [5]. Hence our only sensible
> options are to trigger a mode change which reprograms everything, or
> ignore the helpers.
> There may be scope for improving this, but it'll need significant
> driver (and possibly framework) rework in order to be done properly.
> 
> [4] https://elixir.bootlin.com/linux/latest/source/include/drm/drm_modeset_helper_vtables.h#L1083
> [5] https://elixir.bootlin.com/linux/latest/source/include/drm/drm_modeset_helper_vtables.h#L1101
> 
>> This approach probably applies to the hdr_metadata metadata as well, that too
>> doesn't need a mode change.
>>
>> I see that the i915 driver has a 'fastset' mechanism for changes like this, but
>> it is not clear to me how that interacts with the drm API.
>>
>> I've been playing around with this vc4 driver and it is proving to be very useful
>> for debugging all sorts of quantization range bugs in other equipment.
> 
> Glad it's proving useful.
> 
> We're also needing it as users have misbehaving monitors, and telling
> them to replace the monitor as it breaks the HDMI spec generally
> doesn't go down well! Likewise I've had users needing YCbCr444 output
> because of some limitation in their receiving device, hence overriding
> the kernel choice of output mode. It'd be nice if there were consensus
> on the correct way to achieve that.

In any case, given this background you can add my:

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> 
> Cheers.
>   Dave
> 
>> Regards,
>>
>>         Hans
>>
>>>           !drm_connector_atomic_hdr_metadata_equal(old_state, new_state)) {
>>>               struct drm_crtc_state *crtc_state;
>>>
>>> @@ -571,6 +582,49 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
>>>       return 0;
>>>  }
>>>
>>> +static int vc4_hdmi_connector_get_property(struct drm_connector *connector,
>>> +                                        const struct drm_connector_state *state,
>>> +                                        struct drm_property *property,
>>> +                                        uint64_t *val)
>>> +{
>>> +     struct drm_device *drm = connector->dev;
>>> +     struct vc4_hdmi *vc4_hdmi =
>>> +             connector_to_vc4_hdmi(connector);
>>> +     const struct vc4_hdmi_connector_state *vc4_conn_state =
>>> +             conn_state_to_vc4_hdmi_conn_state(state);
>>> +
>>> +     if (property == vc4_hdmi->broadcast_rgb_property) {
>>> +             *val = vc4_conn_state->broadcast_rgb;
>>> +     } else {
>>> +             drm_dbg(drm, "Unknown property [PROP:%d:%s]\n",
>>> +                     property->base.id, property->name);
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int vc4_hdmi_connector_set_property(struct drm_connector *connector,
>>> +                                        struct drm_connector_state *state,
>>> +                                        struct drm_property *property,
>>> +                                        uint64_t val)
>>> +{
>>> +     struct drm_device *drm = connector->dev;
>>> +     struct vc4_hdmi *vc4_hdmi =
>>> +             connector_to_vc4_hdmi(connector);
>>> +     struct vc4_hdmi_connector_state *vc4_conn_state =
>>> +             conn_state_to_vc4_hdmi_conn_state(state);
>>> +
>>> +     if (property == vc4_hdmi->broadcast_rgb_property) {
>>> +             vc4_conn_state->broadcast_rgb = val;
>>> +             return 0;
>>> +     }
>>> +
>>> +     drm_dbg(drm, "Unknown property [PROP:%d:%s]\n",
>>> +             property->base.id, property->name);
>>> +     return -EINVAL;
>>> +}
>>> +
>>>  static void vc4_hdmi_connector_reset(struct drm_connector *connector)
>>>  {
>>>       struct vc4_hdmi_connector_state *old_state =
>>> @@ -590,6 +644,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
>>>       new_state->base.max_bpc = 8;
>>>       new_state->base.max_requested_bpc = 8;
>>>       new_state->output_format = VC4_HDMI_OUTPUT_RGB;
>>> +     new_state->broadcast_rgb = VC4_HDMI_BROADCAST_RGB_AUTO;
>>>       drm_atomic_helper_connector_tv_margins_reset(connector);
>>>  }
>>>
>>> @@ -607,6 +662,7 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
>>>       new_state->tmds_char_rate = vc4_state->tmds_char_rate;
>>>       new_state->output_bpc = vc4_state->output_bpc;
>>>       new_state->output_format = vc4_state->output_format;
>>> +     new_state->broadcast_rgb = vc4_state->broadcast_rgb;
>>>       __drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
>>>
>>>       return &new_state->base;
>>> @@ -617,6 +673,8 @@ static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
>>>       .reset = vc4_hdmi_connector_reset,
>>>       .atomic_duplicate_state = vc4_hdmi_connector_duplicate_state,
>>>       .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>>> +     .atomic_get_property = vc4_hdmi_connector_get_property,
>>> +     .atomic_set_property = vc4_hdmi_connector_set_property,
>>>  };
>>>
>>>  static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs = {
>>> @@ -625,6 +683,33 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
>>>       .atomic_check = vc4_hdmi_connector_atomic_check,
>>>  };
>>>
>>> +static const struct drm_prop_enum_list broadcast_rgb_names[] = {
>>> +     { VC4_HDMI_BROADCAST_RGB_AUTO, "Automatic" },
>>> +     { VC4_HDMI_BROADCAST_RGB_FULL, "Full" },
>>> +     { VC4_HDMI_BROADCAST_RGB_LIMITED, "Limited 16:235" },
>>> +};
>>> +
>>> +static void
>>> +vc4_hdmi_attach_broadcast_rgb_property(struct drm_device *dev,
>>> +                                    struct vc4_hdmi *vc4_hdmi)
>>> +{
>>> +     struct drm_property *prop = vc4_hdmi->broadcast_rgb_property;
>>> +
>>> +     if (!prop) {
>>> +             prop = drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,
>>> +                                             "Broadcast RGB",
>>> +                                             broadcast_rgb_names,
>>> +                                             ARRAY_SIZE(broadcast_rgb_names));
>>> +             if (!prop)
>>> +                     return;
>>> +
>>> +             vc4_hdmi->broadcast_rgb_property = prop;
>>> +     }
>>> +
>>> +     drm_object_attach_property(&vc4_hdmi->connector.base, prop,
>>> +                                VC4_HDMI_BROADCAST_RGB_AUTO);
>>> +}
>>> +
>>>  static int vc4_hdmi_connector_init(struct drm_device *dev,
>>>                                  struct vc4_hdmi *vc4_hdmi)
>>>  {
>>> @@ -671,6 +756,8 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
>>>       if (vc4_hdmi->variant->supports_hdr)
>>>               drm_connector_attach_hdr_output_metadata_property(connector);
>>>
>>> +     vc4_hdmi_attach_broadcast_rgb_property(dev, vc4_hdmi);
>>> +
>>>       drm_connector_attach_encoder(connector, encoder);
>>>
>>>       return 0;
>>> @@ -825,7 +912,7 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
>>>
>>>       drm_hdmi_avi_infoframe_quant_range(&frame.avi,
>>>                                          connector, mode,
>>> -                                        vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode) ?
>>> +                                        vc4_hdmi_is_full_range_rgb(vc4_hdmi, vc4_state) ?
>>>                                          HDMI_QUANTIZATION_RANGE_FULL :
>>>                                          HDMI_QUANTIZATION_RANGE_LIMITED);
>>>       drm_hdmi_avi_infoframe_colorimetry(&frame.avi, cstate);
>>> @@ -1066,6 +1153,8 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
>>>                              struct drm_connector_state *state,
>>>                              const struct drm_display_mode *mode)
>>>  {
>>> +     struct vc4_hdmi_connector_state *vc4_state =
>>> +             conn_state_to_vc4_hdmi_conn_state(state);
>>>       struct drm_device *drm = vc4_hdmi->connector.dev;
>>>       unsigned long flags;
>>>       u32 csc_ctl;
>>> @@ -1079,7 +1168,7 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
>>>       csc_ctl = VC4_SET_FIELD(VC4_HD_CSC_CTL_ORDER_BGR,
>>>                               VC4_HD_CSC_CTL_ORDER);
>>>
>>> -     if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
>>> +     if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, vc4_state)) {
>>>               /* CEA VICs other than #1 requre limited range RGB
>>>                * output unless overridden by an AVI infoframe.
>>>                * Apply a colorspace conversion to squash 0-255 down
>>> @@ -1232,7 +1321,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
>>>       case VC4_HDMI_OUTPUT_RGB:
>>>               if_xbar = 0x354021;
>>>
>>> -             if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode))
>>> +             if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, vc4_state))
>>>                       vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_limited_rgb);
>>>               else
>>>                       vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_unity);
>>> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
>>> index 5d249ac54cd1..89800c48aa24 100644
>>> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
>>> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
>>> @@ -117,6 +117,12 @@ enum vc4_hdmi_output_format {
>>>       VC4_HDMI_OUTPUT_YUV420,
>>>  };
>>>
>>> +enum vc4_hdmi_broadcast_rgb {
>>> +     VC4_HDMI_BROADCAST_RGB_AUTO,
>>> +     VC4_HDMI_BROADCAST_RGB_FULL,
>>> +     VC4_HDMI_BROADCAST_RGB_LIMITED,
>>> +};
>>> +
>>>  /* General HDMI hardware state. */
>>>  struct vc4_hdmi {
>>>       struct vc4_hdmi_audio audio;
>>> @@ -129,6 +135,8 @@ struct vc4_hdmi {
>>>
>>>       struct delayed_work scrambling_work;
>>>
>>> +     struct drm_property *broadcast_rgb_property;
>>> +
>>>       struct i2c_adapter *ddc;
>>>       void __iomem *hdmicore_regs;
>>>       void __iomem *hd_regs;
>>> @@ -238,6 +246,7 @@ struct vc4_hdmi_connector_state {
>>>       unsigned long long              tmds_char_rate;
>>>       unsigned int                    output_bpc;
>>>       enum vc4_hdmi_output_format     output_format;
>>> +     enum vc4_hdmi_broadcast_rgb     broadcast_rgb;
>>>  };
>>>
>>>  #define conn_state_to_vc4_hdmi_conn_state(_state)                    \
>>>
>>

