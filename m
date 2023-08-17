Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F1777FD25
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 19:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7121210E522;
	Thu, 17 Aug 2023 17:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 356 seconds by postgrey-1.36 at gabe;
 Thu, 17 Aug 2023 14:36:01 UTC
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4B510E4B7;
 Thu, 17 Aug 2023 14:36:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1692282599; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=nwPkhHHF9c9LhTjHQfyxTjtNxewFjRyvhDkQFl0tsLHpQq+MiGqAUhyS6oy0J10aOI
 jd2+0ruRG8BD9bdOnrxnOKnvtSPLgP5LOdP+2T8/WN7ZyL6Dh4Q9ravEEayVXhJL/yhp
 c+UIC2PYL4kk5O0E6coVG+8CooJSJGjUb+vluuW/VyeF229GRrGSD+Vl9egDID3sE8st
 zQO+w2IjFkIzb4w369WgjpsKOWikaEPw7WDQVltGAYzJPFnr9F/C4F7RXh15L6+lXIyb
 hy39cJzKXC1XvGd4jzQHi07CfeHJHXoHlx6GRnyrRNaxy4snezvuv9+gN4GekVuaKSuz
 292A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1692282599;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=aJx1+Gq6572ZJqz9J1SRBPonJNmw4x17hkYbeGde3aw=;
 b=QMx1TTxHkj6iIy73/N3CPEXhKeBe3EqIDfxVv1I3XsdR+EK5Ry+NBxKmRA2TQYIiiM
 j10zXLD9ZaV0IrMJrOttUAT/GXsMC6wEJUvDD7wsCtdc+f6S1YZtEDIzr3G84Dm/sp+7
 UTgESR3FCv7coETYiahV+XLKXucc9UOzHDcuPH6L7ofBqa13ahqkQVNyeW8FsvCgZS1C
 3fGKlqRPHIMgf0TX7OteoIN1CLwcWLX9awvFy1RzGrKp0KLm0MT6hiFMivJfMTaIg5Jd
 1R9e8ysvcjHFz4d/a5Kj7C/7yaQuEfgHjVOUT0/0YIp8ur3x3MO7fehrk90Rk9+bU4cV
 b71Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1692282599;
 s=strato-dkim-0002; d=dj-l.de;
 h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=aJx1+Gq6572ZJqz9J1SRBPonJNmw4x17hkYbeGde3aw=;
 b=hMFomRmlhqrYhghz2DULhbOK0eY3OY3UVGURkNoBQb5W253Y2qs87PtXYGNDamjW5S
 IZVYTkKSkkEJYNpFCaTseYR60GR/gBoFh6GGcOJW/gk5FPCKq/IEAZNzVsnUYDDP20nW
 4K9AoD/5cY8OULmQvjnOtjL0Pqdjv3cGvGlpitRaUQvGTndn/3/0xgpUkl5I9lyiFE19
 bHnGd+SyhuPeHllQeah8Tv7qLJEid2EaWX2WhfcRqM55dVBx+kq8ITeUEulHXt5dNicp
 VGmpWm9DOulS9FN9gcaAhtRYkb0fWDJng0NWHyrOr3tWBAXr2wocflX8xY47qLP3tc6E
 hIhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1692282599;
 s=strato-dkim-0003; d=dj-l.de;
 h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=aJx1+Gq6572ZJqz9J1SRBPonJNmw4x17hkYbeGde3aw=;
 b=O7h5QQo+yVX2cOm9623RGrFrenzgaNT0Njv+nYASmuRaQX0caep03AaUnjrNo2Cy+T
 GpW5f/GdjBlnspdbiUBg==
X-RZG-AUTH: ":P3kUZU+6b98krx+obdayI8W03AmGfcBvHDl7XjDebWJQeuUnG9IEOXb1Jjptvu5y9w=="
Received: from [192.168.63.137] by smtp.strato.de (RZmta 49.6.6 DYNA|AUTH)
 with ESMTPSA id ja88a5z7HETw3Sm
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 17 Aug 2023 16:29:58 +0200 (CEST)
Message-ID: <481c8c19-d1db-417f-b4f2-ed2df21231bb@dj-l.de>
Date: Thu, 17 Aug 2023 16:29:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/edid: Fix "Analog composite sync!" for current
 eDP display panels
Content-Language: en-US, de-DE
To: Jani Nikula <jani.nikula@intel.com>, Dirk Lehmann <develop@dj-l.de>,
 stable@vger.kernel.org
References: <20230815101907.2900768-1-jani.nikula@intel.com>
 <E1qWbpR-0007ey-0B@djlnb.local> <87o7j595u3.fsf@intel.com>
From: Dirk Lehmann <support@dj-l.de>
In-Reply-To: <87o7j595u3.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 17 Aug 2023 17:42:52 +0000
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Jani,

On 8/17/23 15:05, Jani Nikula wrote:
> On Thu, 17 Aug 2023, Dirk Lehmann <develop@dj-l.de> wrote:
>> VESA Enhanced EDID Standard does not clearly describe how display
>> panel vendors should setup the Sync Signal Defintions (bit 4 & 3) in
>> the Detailed Timing Definition (relative offset 17, absolute offset
>> 47h[+18]) for Digital Video Signal Interfaces (bit 7 at offset 14h).
>>
>> In practice many eDP panels which using a Digital Video Signal
>> Interfaces (bit 7 at offset 14h == 1) are leaving the Sync Signal
>> Defintions at offset 47h[+18] blank 0x00, which would mean concerned
>> with the VESA Standard [1] that they are using "Analog Composite
>> Sync".
>>
>> Fix: Just detect Analog Sync Signal if an Analog Video Signal
>>       Interface (bit 7 at offset 14h == 0) is in use.  Just detect
>>       Digital Sync Signal if an Digital Video Signal Interface is in
>>       use.
>>
>> Reference: [1] VESA Enhanced EDID Standard, Release A, Rev.2, Page 35
> 
> Please don't reply with patches in-reply-to other people's patches.

Sorry, I am new with such patch lists :/ ...

> 
>> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8789
> 
> This is now fixed by the revert that I just pushed.
> 
>> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8146
> 
> I don't think this patch fixes that one; see below.
> 
>> Signed-off-by: Dirk Lehmann <develop@dj-l.de>
>> ---
>>   drivers/gpu/drm/drm_edid.c | 74 ++++++++++++++++++++++++++++++++------
>>   include/drm/drm_edid.h     | 12 +++++--
>>   2 files changed, 73 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 1f470968ed14..6afdc34e55ce 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -3437,6 +3437,7 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
>>   	const struct drm_display_info *info = &connector->display_info;
>>   	struct drm_device *dev = connector->dev;
>>   	struct drm_display_mode *mode;
>> +	const struct edid *edid = drm_edid->edid;
>>   	const struct detailed_pixel_timing *pt = &timing->data.pixel_data;
>>   	unsigned hactive = (pt->hactive_hblank_hi & 0xf0) << 4 | pt->hactive_lo;
>>   	unsigned vactive = (pt->vactive_vblank_hi & 0xf0) << 4 | pt->vactive_lo;
>> @@ -3456,10 +3457,6 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
>>   			    connector->base.id, connector->name);
>>   		return NULL;
>>   	}
>> -	if (!(pt->misc & DRM_EDID_PT_SEPARATE_SYNC)) {
>> -		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Composite sync not supported\n",
>> -			    connector->base.id, connector->name);
>> -	}
>>   
>>   	/* it is incorrect if hsync/vsync width is zero */
>>   	if (!hsync_pulse_width || !vsync_pulse_width) {
>> @@ -3505,11 +3502,68 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
>>   
>>   	if (info->quirks & EDID_QUIRK_DETAILED_SYNC_PP) {
>>   		mode->flags |= DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC;
>> +	} else if (edid->input & DRM_EDID_INPUT_DIGITAL) {
>> +		/* !info->quirks && edid->input == DIGITAL  */
>> +		switch (pt->misc & DRM_EDID_PT_SYNC_MASK) {
>> +		/* VESA Enhanced EDID Standard, Release A, Rev.2, Page 35
>> +		 *
>> +		 * CASE DRM_EDID_PT_ANALOG_CSYNC:
>> +		 *
>> +		 * (pt->misc & DRM_EDID_PT_SYNC_MASK == 0x00) means
>> +		 * "Analog Composite Sync" as described in VESA
>> +		 * Standard.  But many digital display panels without
>> +		 * composite sync are also using 0x00 here.
>> +		 *
>> +		 * Therefore use DEFAULT: as we are currently on an
>> +		 * digital video signal interface.
>> +		 */
>> +		case DRM_EDID_PT_DIGITAL_CSYNC:
>> +			drm_dbg_kms(dev,
>> +				"[CONNECTOR:%d:%s] Digital composite sync!\n",
>> +				connector->base.id, connector->name);
>> +			mode->flags |= DRM_MODE_FLAG_CSYNC;
>> +			mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
>> +				DRM_MODE_FLAG_PCSYNC : DRM_MODE_FLAG_NCSYNC;
>> +			break;
>> +		case DRM_EDID_PT_DIGITAL_SEPARATE_SYNC:
>> +			drm_dbg_kms(dev,
>> +				"[CONNECTOR:%d:%s] Digital seperate sync!\n",
>> +				connector->base.id, connector->name);
>> +			goto digital_default;
>> +			break; /* Missing BREAK throws a compiler warning  */
> 
> fallthrough; will do the trick.

Cool, that's new for me.  FALLTHROUGH really works, great :)

> 
>> +		default:
>> +digital_default:
>> +			mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
>> +				DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
>> +			mode->flags |= (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
>> +				DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
> 
> The failing mode in bug [1] has 0x0a for flags, so it ends up here, and
> for that display this patch is a no-op.

Aaaeem yes, something is wrong here.  If the EDID data are correct, then 
since 0001-*_5.15.patch in [1] should broke the implementation.

   (0x1a & (3 << 3)) == (3 << 3) == DRM_EDID_PT_DIGITAL_SEPARATE_SYNC

But this implementation here I made and we are discussing should be have 
the same behavior as before in that case of [1].  The no-op should also 
be before.  But then the fix ca62297b2085b before is useless.  Yes, you 
are right, then reverting is the better idea xD

> 
> As I explained in [2], all the problematic cases have invalid data, but
> the ones fixed by the revert need to ignore the analog sync *flags* and
> accept the mode, and the display in [1] needs to have the whole *mode*
> rejected.
> 

I don't know about the other problematic cases.  I don't have the data 
of the use cases for that.

> [1] https://gitlab.freedesktop.org/drm/intel/-/issues/8146
> [2] https://gitlab.freedesktop.org/drm/intel/-/issues/8789#note_2047902
> 
>> +			break;
>> +		}
>>   	} else {
>> -		mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
>> -			DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
>> -		mode->flags |= (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
>> -			DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
>> +		/* !info->quirks && edid->input == ANALOG  */
>> +		switch (pt->misc & DRM_EDID_PT_SYNC_MASK) {
>> +		/* VESA Enhanced EDID Standard, Release A, Rev.2, Page 35
>> +		 *
>> +		 * CASE DRM_EDID_PT_ANALOG_CSYNC:
>> +		 *
>> +		 * (pt->misc & DRM_EDID_PT_SYNC_MASK == 0x00) for
>> +		 * "Analog Composite Sync" is possible here, as we are
>> +		 * currently on an analog video signal interface.
>> +		 */
>> +		case DRM_EDID_PT_ANALOG_CSYNC:
>> +		case DRM_EDID_PT_BIPOLAR_ANALOG_CSYNC:
>> +			drm_dbg_kms(dev,
>> +				"[CONNECTOR:%d:%s] Analog composite sync!\n",
>> +				connector->base.id, connector->name);
>> +			mode->flags |= DRM_MODE_FLAG_CSYNC | DRM_MODE_FLAG_NCSYNC;
>> +			break;
>> +		default:
>> +			mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
>> +				DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
>> +			mode->flags |= (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
>> +				DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
>> +			break;
>> +		}
> 
> Another angle is that for analog displays, EDID offset 0x14 has info
> about the supported sync modes. If we're separating digital/analog sync
> handling, we should probably filter the analog sync with the info from
> 0x14.

Yeah I also saw that in the VESA Standard, but I reflected that the 
analog display implementation should be more stable, as they are longer 
exist.  For current digital eDP panels which have 0x00 at 47h are these 
composite bits at 14h not reachable --- because bit 7 of 14h is 1.  It 
may just have effects on older analog displays.

> 
> BR,
> Jani.
> 

Okay, summary: You may be right, as the fix commit ca62297b2085b makes 
less sense.

Yeah, greets and thanks for the fast fix.  Really great =D
Dirk

> 
>>   	}
>>   
>>   set_size:
>> @@ -3522,8 +3576,8 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
>>   	}
>>   
>>   	if (info->quirks & EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE) {
>> -		mode->width_mm = drm_edid->edid->width_cm * 10;
>> -		mode->height_mm = drm_edid->edid->height_cm * 10;
>> +		mode->width_mm = edid->width_cm * 10;
>> +		mode->height_mm = edid->height_cm * 10;
>>   	}
>>   
>>   	mode->type = DRM_MODE_TYPE_DRIVER;
>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>> index 48e93f909ef6..169755d3de19 100644
>> --- a/include/drm/drm_edid.h
>> +++ b/include/drm/drm_edid.h
>> @@ -61,9 +61,15 @@ struct std_timing {
>>   	u8 vfreq_aspect;
>>   } __attribute__((packed));
>>   
>> -#define DRM_EDID_PT_HSYNC_POSITIVE (1 << 1)
>> -#define DRM_EDID_PT_VSYNC_POSITIVE (1 << 2)
>> -#define DRM_EDID_PT_SEPARATE_SYNC  (3 << 3)
>> +#define DRM_EDID_PT_SYNC_MASK              (3 << 3)
>> +# define DRM_EDID_PT_ANALOG_CSYNC          (0 << 3)
>> +# define DRM_EDID_PT_BIPOLAR_ANALOG_CSYNC  (1 << 3)
>> +# define DRM_EDID_PT_DIGITAL_CSYNC         (2 << 3)
>> +#  define DRM_EDID_PT_CSYNC_ON_RGB         (1 << 1) /* analog csync only */
>> +#  define DRM_EDID_PT_CSYNC_SERRATE        (1 << 2)
>> +# define DRM_EDID_PT_DIGITAL_SEPARATE_SYNC (3 << 3)
>> +#  define DRM_EDID_PT_HSYNC_POSITIVE       (1 << 1) /* also digital csync */
>> +#  define DRM_EDID_PT_VSYNC_POSITIVE       (1 << 2)
>>   #define DRM_EDID_PT_STEREO         (1 << 5)
>>   #define DRM_EDID_PT_INTERLACED     (1 << 7)
> 
