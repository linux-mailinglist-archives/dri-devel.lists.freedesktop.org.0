Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AE68CC3E4
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 17:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777D110EF04;
	Wed, 22 May 2024 15:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="rWli4Ug/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3950B10EF04
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 15:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=nSoJJiwwzp87yvVkXYkB8RsZAhVEmfC9M1NZ6wVDvfs=; b=rWli4Ug/juiaCj4Nq/03xCcYny
 4qzp8OacJPblkyrusEHc771lCNK1HlqcAFgKBeV6U6ElwCEzUC0s5mq4yA9GhYIxWwUwIe5tx8MGU
 4PPx+DixYSAeIHP0oSbPKgO0LBBNQ+SwLA+Zr76B6exSeHPJ/re4cRu5mrw1gJFDMDYD0gomyJFcS
 h6Op1cXDAGkfHsxcAxnEx1YN4mbRxkj+Q/QrGi+epSqop5fdGc3GwTNoTEip6WkHAVWz5nI1zibyT
 +uk3P8+2wFMhpCQcL1vI46AVJpUw/htoej+NFAfJJuJp84RahOUnQMNi1PloMWtIdP2QG0MZtG9Lg
 PQT3g4rA==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1s9ndZ-00000003KLv-2HKP; Wed, 22 May 2024 15:12:18 +0000
Message-ID: <aeb0fddd-09ff-4b96-9905-927427b51838@infradead.org>
Date: Wed, 22 May 2024 08:12:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/display/dp: fix all kernel-doc warnings
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20240516002642.6659-1-rdunlap@infradead.org>
 <p2n7d7lhiogmn3niblqg3sj5nx7c7tx2m6h6z2xlyf3ks74753@7qze6k4jhp2k>
 <b47a415d-2e8c-4d09-8131-d361aa28dc60@infradead.org>
 <q3525v4os3yrrgr2bcllc7xbnw4tdtc3373hsqg7cxfpea7isp@wxdh3xrz6vb4>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <q3525v4os3yrrgr2bcllc7xbnw4tdtc3373hsqg7cxfpea7isp@wxdh3xrz6vb4>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/22/24 2:37 AM, Dmitry Baryshkov wrote:
> On Tue, May 21, 2024 at 08:59:06PM -0700, Randy Dunlap wrote:
>> Hi Dmitry,
>>
>> On 5/20/24 3:37 AM, Dmitry Baryshkov wrote:
>>> On Wed, May 15, 2024 at 05:26:42PM -0700, Randy Dunlap wrote:
>>>> Fix a struct member name in &struct drm_dp_as_sdp.
>>>> Add Returns: kernel-doc syntax for 4 functions.
>>>> In the Returns: sections, spell "%true" and "%false" consistently.
>>>>
>>>> Fixes these kernel-doc warnings:
>>>>
>>>> drm_dp_helper.h:126: warning: Function parameter or struct member 'mode' not described in 'drm_dp_as_sdp'
>>>> drm_dp_helper.h:126: warning: Excess struct member 'operation_mode' description in 'drm_dp_as_sdp'
>>>> drm_dp_helper.h:237: warning: No description found for return value of 'drm_dp_dsc_sink_supports_format'
>>>> drm_dp_helper.h:539: warning: No description found for return value of 'drm_dp_dpcd_readb'
>>>> drm_dp_helper.h:554: warning: No description found for return value of 'drm_dp_dpcd_writeb'
>>>> drm_dp_helper.h:721: warning: No description found for return value of 'drm_dp_has_quirk'
>>>>
>>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>>> ---
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>
>>>>  include/drm/display/drm_dp_helper.h |   17 +++++++++--------
>>>>  1 file changed, 9 insertions(+), 8 deletions(-)
>>>>
>>>> diff -- a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
>>>> --- a/include/drm/display/drm_dp_helper.h
>>>> +++ b/include/drm/display/drm_dp_helper.h
>>>> @@ -112,7 +112,7 @@ struct drm_dp_vsc_sdp {
>>>>   * @target_rr: Target Refresh
>>>>   * @duration_incr_ms: Successive frame duration increase
>>>>   * @duration_decr_ms: Successive frame duration decrease
>>>> - * @operation_mode: Adaptive Sync Operation Mode
>>>> + * @mode: Adaptive Sync Operation Mode
>>>>   */
>>>>  struct drm_dp_as_sdp {
>>>>  	unsigned char sdp_type;
>>>> @@ -230,7 +230,8 @@ drm_dp_dsc_sink_max_slice_width(const u8
>>>>   * @dsc_dpcd : DSC-capability DPCDs of the sink
>>>>   * @output_format: output_format which is to be checked
>>>>   *
>>>> - * Returns true if the sink supports DSC with the given output_format, false otherwise.
>>>> + * Returns: %true if the sink supports DSC with the given output_format,
>>>> + * %false otherwise.
>>>>   */
>>>>  static inline bool
>>>>  drm_dp_dsc_sink_supports_format(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE], u8 output_format)
>>>> @@ -280,8 +281,8 @@ drm_dp_sink_can_do_video_without_timing_
>>>>   * backlight features but which require the brightness be set through PWM, and don't support setting
>>>>   * the brightness level via the DPCD.
>>>>   *
>>>> - * Returns: %True if @edp_dpcd indicates that VESA backlight controls are supported, %false
>>>> - * otherwise
>>>> + * Returns: %true if @edp_dpcd indicates that VESA backlight controls are
>>>> + * supported, %false otherwise
>>>
>>> If you are touching this part, maybe it's better to change 'Returns' to
>>> 'Return' as documented by Documentation/doc-guide/kernel-doc.rst ?
>>> (the same comment applies to other chunks in the patch, I've trimmed
>>> them).
>>
>> scripts/kernel-doc accepts either spelling, but sure, I can change these.
>> Thanks.
> 
> An alternative way would be to fix kernel-doc.rst :-)

Yes, I thought of that last night.
I'll submit such a change.
Thanks.

>>
>>>>   */
>>>>  static inline bool
>>>>  drm_edp_backlight_supported(const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE])
>>>
>>
>> -- 
>> #Randy
>> https://people.kernel.org/tglx/notes-about-netiquette
>> https://subspace.kernel.org/etiquette.html
> 

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html
