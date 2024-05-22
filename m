Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3E98CBA23
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 05:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B67910E246;
	Wed, 22 May 2024 03:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="LlID4CcQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA96A10E246
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 03:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=osxaeLaX5nBB9D5+ieZeEr9PNV6/GcH4p3qbFsmiY1A=; b=LlID4CcQ1pVEsx8hhj0Mg9wEKk
 uqAOcPKtWtlBrS1JpFGIJwTNrsRahTTxE4Xbt3BtnL+rTQ5sJzpf0jFk0NCEav9a5yio9q6uL7wtY
 y29o1aIIsNcUZ7z1dRPqNGmvGrI0Ma2GiTFAPvL0B9lVTJjlaqbTTNvgsvQK/m53wjHv5ZfPOnAHR
 TAVLUA0P05RCbQSwEm4HIJvHAZoWGI4nN3dgaynNHiDEuwhsO4zKk1LSadJngoNlLHujKoriBayQ+
 hupDTLqxhZo/md516s1m0S4NscU77a0O/yAOWggTwcardVdBwh9XVfOOzJADs5Lhfo1h/DtzeJDfX
 0dC7qrYA==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1s9d86-00000001vfS-46es; Wed, 22 May 2024 03:59:07 +0000
Message-ID: <b47a415d-2e8c-4d09-8131-d361aa28dc60@infradead.org>
Date: Tue, 21 May 2024 20:59:06 -0700
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
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <p2n7d7lhiogmn3niblqg3sj5nx7c7tx2m6h6z2xlyf3ks74753@7qze6k4jhp2k>
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

Hi Dmitry,

On 5/20/24 3:37 AM, Dmitry Baryshkov wrote:
> On Wed, May 15, 2024 at 05:26:42PM -0700, Randy Dunlap wrote:
>> Fix a struct member name in &struct drm_dp_as_sdp.
>> Add Returns: kernel-doc syntax for 4 functions.
>> In the Returns: sections, spell "%true" and "%false" consistently.
>>
>> Fixes these kernel-doc warnings:
>>
>> drm_dp_helper.h:126: warning: Function parameter or struct member 'mode' not described in 'drm_dp_as_sdp'
>> drm_dp_helper.h:126: warning: Excess struct member 'operation_mode' description in 'drm_dp_as_sdp'
>> drm_dp_helper.h:237: warning: No description found for return value of 'drm_dp_dsc_sink_supports_format'
>> drm_dp_helper.h:539: warning: No description found for return value of 'drm_dp_dpcd_readb'
>> drm_dp_helper.h:554: warning: No description found for return value of 'drm_dp_dpcd_writeb'
>> drm_dp_helper.h:721: warning: No description found for return value of 'drm_dp_has_quirk'
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> ---
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>
>>  include/drm/display/drm_dp_helper.h |   17 +++++++++--------
>>  1 file changed, 9 insertions(+), 8 deletions(-)
>>
>> diff -- a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
>> --- a/include/drm/display/drm_dp_helper.h
>> +++ b/include/drm/display/drm_dp_helper.h
>> @@ -112,7 +112,7 @@ struct drm_dp_vsc_sdp {
>>   * @target_rr: Target Refresh
>>   * @duration_incr_ms: Successive frame duration increase
>>   * @duration_decr_ms: Successive frame duration decrease
>> - * @operation_mode: Adaptive Sync Operation Mode
>> + * @mode: Adaptive Sync Operation Mode
>>   */
>>  struct drm_dp_as_sdp {
>>  	unsigned char sdp_type;
>> @@ -230,7 +230,8 @@ drm_dp_dsc_sink_max_slice_width(const u8
>>   * @dsc_dpcd : DSC-capability DPCDs of the sink
>>   * @output_format: output_format which is to be checked
>>   *
>> - * Returns true if the sink supports DSC with the given output_format, false otherwise.
>> + * Returns: %true if the sink supports DSC with the given output_format,
>> + * %false otherwise.
>>   */
>>  static inline bool
>>  drm_dp_dsc_sink_supports_format(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE], u8 output_format)
>> @@ -280,8 +281,8 @@ drm_dp_sink_can_do_video_without_timing_
>>   * backlight features but which require the brightness be set through PWM, and don't support setting
>>   * the brightness level via the DPCD.
>>   *
>> - * Returns: %True if @edp_dpcd indicates that VESA backlight controls are supported, %false
>> - * otherwise
>> + * Returns: %true if @edp_dpcd indicates that VESA backlight controls are
>> + * supported, %false otherwise
> 
> If you are touching this part, maybe it's better to change 'Returns' to
> 'Return' as documented by Documentation/doc-guide/kernel-doc.rst ?
> (the same comment applies to other chunks in the patch, I've trimmed
> them).

scripts/kernel-doc accepts either spelling, but sure, I can change these.
Thanks.

>>   */
>>  static inline bool
>>  drm_edp_backlight_supported(const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE])
> 

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html
