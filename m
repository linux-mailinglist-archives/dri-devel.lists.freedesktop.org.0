Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 893EF632DFB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 21:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FD710E331;
	Mon, 21 Nov 2022 20:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0736210E1A9;
 Mon, 21 Nov 2022 20:30:49 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id b9so15766023ljr.5;
 Mon, 21 Nov 2022 12:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yfpG9eV9KNVg6+qRSV5QIiQhtEjfHqp5OQWIwTqY8sA=;
 b=Ze5g2f/gPvQ3Tp9Cc8ktS01XE453EfrnyYaf+/a3VDrFFSP4CJO3aUfyiY+dOwYhRf
 19y5fnAixQ0LpEiHwAfYBKxS6oixdLF89sVOfNWSGjkqQCIteMAo7nhKr7HwBJX++HYw
 Y7Ax6q0yOQyRIVBnUrcSnGFj7Wx/KzucaNwjMkgcgFxZByJ5QEPbtQzQSFUVzUl4wkcG
 Sm8W77Bo1bisA2AXtJ0Bu1wlMNp5TyyOW0nkHK0QCCm92Kclg9rh1IN5SgNX1tApr/F0
 2g8ILU8TvDQOyJiywHaHtOIQi2yh6zfiAikOQeQ1u6d9uJBG4peZ7KOrGfpJCU/kBHZJ
 7m/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yfpG9eV9KNVg6+qRSV5QIiQhtEjfHqp5OQWIwTqY8sA=;
 b=mH68UOfTj/KT82OFGRK/baxM1rDd7laGoeNrvsPg6amgkoYWFKrdy+nPHKM9pdORuF
 uaaRSykA6XDQ+ZRy5lsZVy6IA1t3akezFR02ft9o7Wf7zBgjEtf3pKaa9Xof/nVykGNA
 Uwy9EBvOYbKoFSOgQ0APoFdQOS8LYulKeWawW7/rtYY/MLvq/s3k9ekmNb7WdnTGDmzr
 TVqaFQP/yPB3CNV6UQRHW4PZe/CA2lnHsYuVJkTmNgc8oylZYMU6EvcerDbkOzCYUVH/
 w5Hs7qzkkbAGygItXeWCBITRHMRonUqJkp7HhX4sDuqgG1rIDuKMx6Bx8AkTxABAV1DB
 ZtTw==
X-Gm-Message-State: ANoB5pmvW3J3Os2Bx59uLwJ2JuPfhQl1Gw054acIy/9rWokxyNX2cryL
 1HBE+bOickTuiVGzwVcmNRs=
X-Google-Smtp-Source: AA0mqf4jNu8dHA6JfWXDhB4DyXYt8qsKIcM6lNMaXNk/PE24lBhpjgzvIjCR5uxjAMvvwmnDlhywFQ==
X-Received: by 2002:a2e:2d01:0:b0:278:ebb5:ddd2 with SMTP id
 t1-20020a2e2d01000000b00278ebb5ddd2mr6025246ljt.494.1669062647681; 
 Mon, 21 Nov 2022 12:30:47 -0800 (PST)
Received: from ?IPV6:2a02:a31a:a240:1700:cd97:47f7:90db:67bf?
 ([2a02:a31a:a240:1700:cd97:47f7:90db:67bf])
 by smtp.googlemail.com with ESMTPSA id
 r17-20020a2e9951000000b00261ccf566e3sm1555644ljj.65.2022.11.21.12.30.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 12:30:46 -0800 (PST)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <069ff6bb-c49e-e7c9-ce45-35999ff725c5@gmail.com>
Date: Mon, 21 Nov 2022 21:30:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v10 18/19] drm/vc4: vec: Add support for more analog TV
 standards
Content-Language: pl
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
 <20220728-rpi-analog-tv-properties-v10-18-256dad125326@cerno.tech>
 <20221117164928.200b3a1a@maurocar-mobl2>
In-Reply-To: <20221117164928.200b3a1a@maurocar-mobl2>
Content-Type: text/plain; charset=UTF-8
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
Reply-To: kfyatek+publicgit@gmail.com
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

As the author of the original version of this commit, and also a person who
argued quite a bit on these descriptions and decisions, let me chip in a bit.

W dniu 17.11.2022 o 16:49, Mauro Carvalho Chehab pisze:
> On Thu, 17 Nov 2022 10:29:01 +0100
> Maxime Ripard <maxime@cerno.tech> wrote:
>
>> From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
>>
>> Add support for the following composite output modes (all of them are
>> somewhat more obscure than the previously defined ones):
>>
>> - NTSC_443 - NTSC-style signal with the chroma subcarrier shifted to
>>   4.43361875 MHz (the PAL subcarrier frequency). Never used for
>>   broadcasting, but sometimes used as a hack to play NTSC content in PAL
>>   regions (e.g. on VCRs).
>
>> - PAL_N - PAL with alternative chroma subcarrier frequency,
>>   3.58205625 MHz. Used as a broadcast standard in Argentina, Paraguay
>>   and Uruguay to fit 576i50 with colour in 6 MHz channel raster.
>
> That's not right. Argentina uses a different standard than Paraguay and
> Uruguai.
>
> See, there are two variants of PAL/N. The original one and PAL/N' - also
> called PAL/NC or PAL/CN (Combination N). Some of the timings are 
> different on /NC variant.
>
> As far as I'm aware, PAL/Nc is used in Argentina, while
> PAL/N is used in Paraguai and Uruguai, but I may be wrong on that,
> as it has been a long time since had to touch on this.

If you say so - maybe that's true. But I tried to find any differences between
PAL-N and PAL-Nc many times and haven't found anything concrete. The only
authoritative source where System N and "Combination N/PAL" seem to be mentioned
as separate entities is BT.1701
<https://www.itu.int/rec/R-REC-BT.1701-1-200508-I/en>. However:

a) the differences are very subtle (with "combination N/PAL" being just a tad
   stricter than what's mentioned for System N)
b) "Combination N/PAL" can be understood as just "System N combined with PAL
   color", as opposed to "raw", black&white System N. This intepretation is also
   what the user calling themselves "Alcahemist" suggests here:
   https://en.wikipedia.org/wiki/Talk:PAL#PAL-N_versus_PAL-Nc

This is of course far from an authoritative source. If you have a definitive
source for PAL-N and PAL-Nc being different, or concrete information on what is
different between them specifically, then so be it. But I tried and haven't
found anything conclusive.

>> - PAL60 - 480i60 signal with PAL-style color at normal European PAL
>>   frequency. Another non-standard, non-broadcast mode, used in similar
>>   contexts as NTSC_443. Some displays support one but not the other.
>
>> - SECAM - French frequency-modulated analog color standard; also have
>>   been broadcast in Eastern Europe and various parts of Africa and Asia.
>>   Uses the same 576i50 timings as PAL.
>
> This is also wrong. just like PAL, there are several variants of SECAM,
> one used in France, and a different one in France overseas and on
> previous France colonies in Africa and Asia. Eastern Europe also used
> different variants of SECAM.

This is true. However, those differed only in RF modulation. For example,
French SECAM-L used positive video modulation and AM sound, while Eastern
European SECAM-D/K used negative video modulation and FM sound. But the
baseband composite signals were identical.

There were several other variants of SECAM, like early SECAM/V vs. SECAM/H
("Field identification" vs. "Line identification") which moved the color
identification signals from VBI to HBI. But that's a change that all SECAM
regions, including both France and Eastern Europe did in the 1980s to
acommodate for teletext. Again, authoritative sources are scarce, but see e.g.
https://web.archive.org/web/20160303232903/http://www.pembers.freeserve.co.uk/World-TV-Standards/Colour-Standards.html
(search for "Synchronisation of SECAM colour transmissions" on the page).

There's also MESECAM, but that only applies to encoding on VHS and Betamax
tapes, not the signals themselves. There was also SECAM-M for 525-line (480i)
signals, but I haven't found any conclusive evidence that it was ever used for
broadcast anywhere

So yeah, SECAM can be a bit confusing, but AFAIK there's only one standard if
we're talking about the composite video layer.

--

Some *really* old (like, 1960s old) versions of CCIR documents also listed more
substantial differences between various 625-line systems, including the number
of active lines varying from 571 to 589. But all revisions from 1974 onward list
the modern value of 575 active lines for all the variants, making them differ
only in RF modulation details. Which is beyond the scope of what the "TV mode"
property is supposed to do.

>> Also added some comments explaining color subcarrier frequency
>> registers.
>>
>> Acked-by: Noralf Trønnes <noralf@tronnes.org>
>> Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
>> Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>
>> ---
>> Changes in v6:
>> - Support PAL60 again
>> ---
>>  drivers/gpu/drm/vc4/vc4_vec.c | 111 ++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 107 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
>> index a828fc6fb776..d23dbad3cbf6 100644
>> --- a/drivers/gpu/drm/vc4/vc4_vec.c
>> +++ b/drivers/gpu/drm/vc4/vc4_vec.c
>> @@ -46,6 +46,7 @@
>>  #define VEC_CONFIG0_YDEL(x)		((x) << 26)
>>  #define VEC_CONFIG0_CDEL_MASK		GENMASK(25, 24)
>>  #define VEC_CONFIG0_CDEL(x)		((x) << 24)
>> +#define VEC_CONFIG0_SECAM_STD		BIT(21)
>>  #define VEC_CONFIG0_PBPR_FIL		BIT(18)
>>  #define VEC_CONFIG0_CHROMA_GAIN_MASK	GENMASK(17, 16)
>>  #define VEC_CONFIG0_CHROMA_GAIN_UNITY	(0 << 16)
>> @@ -76,6 +77,27 @@
>>  #define VEC_SOFT_RESET			0x10c
>>  #define VEC_CLMP0_START			0x144
>>  #define VEC_CLMP0_END			0x148
>> +
>> +/*
>> + * These set the color subcarrier frequency
>> + * if VEC_CONFIG1_CUSTOM_FREQ is enabled.
>> + *
>> + * VEC_FREQ1_0 contains the most significant 16-bit half-word,
>> + * VEC_FREQ3_2 contains the least significant 16-bit half-word.
>> + * 0x80000000 seems to be equivalent to the pixel clock
>> + * (which itself is the VEC clock divided by 8).
>> + *
>> + * Reference values (with the default pixel clock of 13.5 MHz):
>> + *
>> + * NTSC  (3579545.[45] Hz)     - 0x21F07C1F
>> + * PAL   (4433618.75 Hz)       - 0x2A098ACB
>> + * PAL-M (3575611.[888111] Hz) - 0x21E6EFE3
>> + * PAL-N (3582056.25 Hz)       - 0x21F69446
>> + *
>> + * NOTE: For SECAM, it is used as the Dr center frequency,
>> + * regardless of whether VEC_CONFIG1_CUSTOM_FREQ is enabled or not;
>> + * that is specified as 4406250 Hz, which corresponds to 0x29C71C72.
>> + */
>>  #define VEC_FREQ3_2			0x180
>>  #define VEC_FREQ1_0			0x184
>>  
>> @@ -118,6 +140,14 @@
>>  
>>  #define VEC_INTERRUPT_CONTROL		0x190
>>  #define VEC_INTERRUPT_STATUS		0x194
>> +
>> +/*
>> + * Db center frequency for SECAM; the clock for this is the same as for
>> + * VEC_FREQ3_2/VEC_FREQ1_0, which is used for Dr center frequency.
>> + *
>> + * This is specified as 4250000 Hz, which corresponds to 0x284BDA13.
>> + * That is also the default value, so no need to set it explicitly.
>> + */
>>  #define VEC_FCW_SECAM_B			0x198
>>  #define VEC_SECAM_GAIN_VAL		0x19c
>>  
>> @@ -197,10 +227,15 @@ enum vc4_vec_tv_mode_id {
>>  	VC4_VEC_TV_MODE_NTSC_J,
>>  	VC4_VEC_TV_MODE_PAL,
>>  	VC4_VEC_TV_MODE_PAL_M,
>> +	VC4_VEC_TV_MODE_NTSC_443,
>> +	VC4_VEC_TV_MODE_PAL_60,
>> +	VC4_VEC_TV_MODE_PAL_N,
>> +	VC4_VEC_TV_MODE_SECAM,
>>  };
>>  
>>  struct vc4_vec_tv_mode {
>>  	unsigned int mode;
>> +	u16 expected_htotal;
>>  	u32 config0;
>>  	u32 config1;
>>  	u32 custom_freq;
>> @@ -236,35 +271,68 @@ static const struct debugfs_reg32 vec_regs[] = {
>>  static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
>>  	{
>>  		.mode = DRM_MODE_TV_MODE_NTSC,
>> +		.expected_htotal = 858,
>>  		.config0 = VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,
>>  		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
>>  	},
>> +	{
>> +		.mode = DRM_MODE_TV_MODE_NTSC_443,
>> +		.expected_htotal = 858,
>> +		.config0 = VEC_CONFIG0_NTSC_STD,
>> +		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
>> +		.custom_freq = 0x2a098acb,
>> +	},
>>  	{
>>  		.mode = DRM_MODE_TV_MODE_NTSC_J,
>> +		.expected_htotal = 858,
>>  		.config0 = VEC_CONFIG0_NTSC_STD,
>>  		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
>>  	},
>>  	{
>>  		.mode = DRM_MODE_TV_MODE_PAL,
>> +		.expected_htotal = 864,
>>  		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
>>  		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
>>  	},
>> +	{
>> +		/* PAL-60 */
>> +		.mode = DRM_MODE_TV_MODE_PAL,
>> +		.expected_htotal = 858,
>> +		.config0 = VEC_CONFIG0_PAL_M_STD,
>> +		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
>> +		.custom_freq = 0x2a098acb,
>> +	},
>>  	{
>>  		.mode = DRM_MODE_TV_MODE_PAL_M,
>> +		.expected_htotal = 858,
>>  		.config0 = VEC_CONFIG0_PAL_M_STD,
>>  		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
>>  	},
>> +	{
>> +		.mode = DRM_MODE_TV_MODE_PAL_N,
>> +		.expected_htotal = 864,
>> +		.config0 = VEC_CONFIG0_PAL_N_STD,
>> +		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
>> +	},
>> +	{
>> +		.mode = DRM_MODE_TV_MODE_SECAM,
>> +		.expected_htotal = 864,
>> +		.config0 = VEC_CONFIG0_SECAM_STD,
>> +		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
>> +		.custom_freq = 0x29c71c72,
>> +	},
>>  };
>>  
>>  static inline const struct vc4_vec_tv_mode *
>> -vc4_vec_tv_mode_lookup(unsigned int mode)
>> +vc4_vec_tv_mode_lookup(unsigned int mode, u16 htotal)
>>  {
>>  	unsigned int i;
>>  
>>  	for (i = 0; i < ARRAY_SIZE(vc4_vec_tv_modes); i++) {
>>  		const struct vc4_vec_tv_mode *tv_mode = &vc4_vec_tv_modes[i];
>>  
>> -		if (tv_mode->mode == mode)
>> +		if (tv_mode->mode == mode &&
>> +		    tv_mode->expected_htotal == htotal)
>>  			return tv_mode;
>>  	}
>>  
>> @@ -273,9 +341,13 @@ vc4_vec_tv_mode_lookup(unsigned int mode)
>>  
>>  static const struct drm_prop_enum_list legacy_tv_mode_names[] = {
>>  	{ VC4_VEC_TV_MODE_NTSC, "NTSC", },
>> +	{ VC4_VEC_TV_MODE_NTSC_443, "NTSC-443", },
>>  	{ VC4_VEC_TV_MODE_NTSC_J, "NTSC-J", },
>>  	{ VC4_VEC_TV_MODE_PAL, "PAL", },
>> +	{ VC4_VEC_TV_MODE_PAL_60, "PAL-60", },
>>  	{ VC4_VEC_TV_MODE_PAL_M, "PAL-M", },
>> +	{ VC4_VEC_TV_MODE_PAL_N, "PAL-N", },
>> +	{ VC4_VEC_TV_MODE_SECAM, "SECAM", },
>>  };
>>  
>>  static enum drm_connector_status
>> @@ -306,11 +378,16 @@ vc4_vec_connector_set_property(struct drm_connector *connector,
>>  		state->tv.mode = DRM_MODE_TV_MODE_NTSC;
>>  		break;
>>  
>> +	case VC4_VEC_TV_MODE_NTSC_443:
>> +		state->tv.mode = DRM_MODE_TV_MODE_NTSC_443;
>> +		break;
>> +
>>  	case VC4_VEC_TV_MODE_NTSC_J:
>>  		state->tv.mode = DRM_MODE_TV_MODE_NTSC_J;
>>  		break;
>>  
>>  	case VC4_VEC_TV_MODE_PAL:
>> +	case VC4_VEC_TV_MODE_PAL_60:
>>  		state->tv.mode = DRM_MODE_TV_MODE_PAL;
>>  		break;
>>  
>> @@ -318,6 +395,14 @@ vc4_vec_connector_set_property(struct drm_connector *connector,
>>  		state->tv.mode = DRM_MODE_TV_MODE_PAL_M;
>>  		break;
>>  
>> +	case VC4_VEC_TV_MODE_PAL_N:
>> +		state->tv.mode = DRM_MODE_TV_MODE_PAL_N;
>> +		break;
>> +
>> +	case VC4_VEC_TV_MODE_SECAM:
>> +		state->tv.mode = DRM_MODE_TV_MODE_SECAM;
>> +		break;
>> +
>>  	default:
>>  		return -EINVAL;
>>  	}
>> @@ -341,6 +426,10 @@ vc4_vec_connector_get_property(struct drm_connector *connector,
>>  		*val = VC4_VEC_TV_MODE_NTSC;
>>  		break;
>>  
>> +	case DRM_MODE_TV_MODE_NTSC_443:
>> +		*val = VC4_VEC_TV_MODE_NTSC_443;
>> +		break;
>> +
>>  	case DRM_MODE_TV_MODE_NTSC_J:
>>  		*val = VC4_VEC_TV_MODE_NTSC_J;
>>  		break;
>> @@ -353,6 +442,14 @@ vc4_vec_connector_get_property(struct drm_connector *connector,
>>  		*val = VC4_VEC_TV_MODE_PAL_M;
>>  		break;
>>  
>> +	case DRM_MODE_TV_MODE_PAL_N:
>> +		*val = VC4_VEC_TV_MODE_PAL_N;
>> +		break;
>> +
>> +	case DRM_MODE_TV_MODE_SECAM:
>> +		*val = VC4_VEC_TV_MODE_SECAM;
>> +		break;
>> +
>>  	default:
>>  		return -EINVAL;
>>  	}
>> @@ -448,13 +545,16 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
>>  	struct drm_connector *connector = &vec->connector;
>>  	struct drm_connector_state *conn_state =
>>  		drm_atomic_get_new_connector_state(state, connector);
>> +	struct drm_display_mode *adjusted_mode =
>> +		&encoder->crtc->state->adjusted_mode;
>>  	const struct vc4_vec_tv_mode *tv_mode;
>>  	int idx, ret;
>>  
>>  	if (!drm_dev_enter(drm, &idx))
>>  		return;
>>  
>> -	tv_mode = vc4_vec_tv_mode_lookup(conn_state->tv.mode);
>> +	tv_mode = vc4_vec_tv_mode_lookup(conn_state->tv.mode,
>> +					 adjusted_mode->htotal);
>>  	if (!tv_mode)
>>  		goto err_dev_exit;
>>  
>> @@ -648,9 +748,12 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
>>  
>>  	ret = drm_mode_create_tv_properties(drm,
>>  					    BIT(DRM_MODE_TV_MODE_NTSC) |
>> +					    BIT(DRM_MODE_TV_MODE_NTSC_443) |
>>  					    BIT(DRM_MODE_TV_MODE_NTSC_J) |
>>  					    BIT(DRM_MODE_TV_MODE_PAL) |
>> -					    BIT(DRM_MODE_TV_MODE_PAL_M));
>> +					    BIT(DRM_MODE_TV_MODE_PAL_M) |
>> +					    BIT(DRM_MODE_TV_MODE_PAL_N) |
>> +					    BIT(DRM_MODE_TV_MODE_SECAM));
>>  	if (ret)
>>  		return ret;
>>  
>>

Best regards,
Mateusz Kwiatkowski

