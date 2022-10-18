Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 773B9603468
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 22:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4414310E957;
	Tue, 18 Oct 2022 20:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55AA810E955;
 Tue, 18 Oct 2022 20:57:11 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id r14so24762152lfm.2;
 Tue, 18 Oct 2022 13:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4q8+ZZXGKoh6iTQurAmJvf03RKoxifLtlwxrMQru1hE=;
 b=kt8lC+lO4gSY3YG0906oJiNdGLU7GhkVYc9H88KhNuvwjumuuchbdPapkO7dxBf/Qy
 BoDMNcubA39QyDexTULFTiZaU7aDUsPZdwQojRw+xlCeZ2FP/rlSY9fvBGCEeu5NgYE1
 zVoh9LYbcej1ow4N6cLbaE+lDZeOB1v/1BSRHabYjz6zOJf2NcUenT+Ap/6lzQwSiK/I
 mlfYogp/zJo5VBiA1eANhCvnKdKTUeB/E4rMC8r+poPJuWlQldvWIkta/4sPXBwuMnDH
 8xdUvhBvP4s3zBZV8Ig0pbp7QaiLgQRGGd2Qn8+rLaxzbul2vaXrnjy/QMa5jir9u/45
 pCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4q8+ZZXGKoh6iTQurAmJvf03RKoxifLtlwxrMQru1hE=;
 b=1vqX8vi7mBK2RjjEDhnq5U762kCxNIDUy1bpxACgdq22Q/soboFyE6/5BtE2Sq251O
 4eWM8fKrdZfFRqfgwlUEzHwvIVUJ7SIhLEvzs1eH9nAw/eppx2WREH7BkxxqP/PoKZTx
 LJQSaE4AtlYKKeDtN3UTaIb+sL+Ovl+NqbTlXpnOEnv5LVvv9NUzgvL7eLldKuvoQNzf
 n/CXzX3pQSR5qla1kl+aJFyshxU1qSBZQ9sp/x7dt4O5jo0J3OzoEbaQI6nBhwazkhPp
 3by3QN+6mRkOQXcz1b6ML4BRj/LxraYPjX8VkJDt+nSgC5ewmi7wKKgi81h7SkpiuJzT
 Y1Pw==
X-Gm-Message-State: ACrzQf3lYJMN7K1FaSu6B8q1bDc1C7odEvWCJ1bZgMTYlSvPmw069/2r
 7fSaU99aELC4LfUEhu6e/h8=
X-Google-Smtp-Source: AMsMyM43gEnq7ci5pkLxJm4400YhMYoE1+4aaJJ/DU7cyGERdBh2fCJRUyqe3H9D3aDzTea6EsoYiQ==
X-Received: by 2002:a05:6512:114a:b0:4a2:58a3:95f2 with SMTP id
 m10-20020a056512114a00b004a258a395f2mr1687359lfg.7.1666126629466; 
 Tue, 18 Oct 2022 13:57:09 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:ade4:dc4:81f3:286b?
 ([2a02:a31a:a240:1700:ade4:dc4:81f3:286b])
 by smtp.googlemail.com with ESMTPSA id
 u13-20020a05651220cd00b0049d83646ce7sm2002435lfr.110.2022.10.18.13.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 13:57:08 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <0afdeda7-558e-647f-ef28-1fcd80807c1b@gmail.com>
Date: Tue, 18 Oct 2022 22:57:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH] drm/vc4: vec: Add support for PAL-60
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <20220728-rpi-analog-tv-properties-v5-21-d841cc64fe4b@cerno.tech>
 <93bf9fcc-c645-b042-011f-8f1fc957af48@gmail.com>
 <20221018083153.okkqpd5ccfrnwdj3@houat>
In-Reply-To: <20221018083153.okkqpd5ccfrnwdj3@houat>
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
Reply-To: kfyatek+publicgit@gmail.com
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Karol Herbst <kherbst@redhat.com>,
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

Hi Maxime,

W dniu 18.10.2022 o 10:31, Maxime Ripard pisze:
> Hi,
>
> On Sun, Oct 16, 2022 at 09:46:49PM +0200, Mateusz Kwiatkowski wrote:
>> @@ -308,14 +324,15 @@ static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
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
>
> Is there any reason we're not using the refresh rate to filter this? It
> seems more natural to me.

Let me give you an example first.

There are actually two ways to configure PAL-60-ish mode on VC4/VEC:

a) Modeline 13.5 720 734 798 858 480 487 493 525 Interlace, standard registers
   set to VEC_CONFIG0_PAL_M_STD, custom frequency enabled and set to 0x2a098acb;
   Setting the standard registers to "PAL-M" puts the VEC in true 59.94 Hz mode,
   so the video timings are identical as for NTSC (or PAL-M), and the custom
   frequency makes the color subcarrier compatible with regular PAL receivers.
   This is the "true" PAL-60, thanks to the true System M timings.

a) Modeline 13.5 720 740 804 864 480 486 492 525 Interlace, standards registers
   set to VEC_CONFIG0_PAL with standard frequency; This is a "fake" PAL-60 mode,
   the refresh rate is actually ~59.524 Hz. Most "NTSC" sets will be able to
   sync with this mode no problem, but the VEC is actually operating in its
   50 Hz mode - it's just the "premature" vertical sync signal causes it to
   output something that is similar to the 525-line system, however strictly
   speaking non-standard due to lower horizontal sync frequency.

This comes down to the fact that:

- When VEC's standard registers are set to VEC_CONFIG0_NTSC_STD or
  VEC_CONFIG0_PAL_M_STD, it operates in the "CCIR System M" mode, expects htotal
  to be exactly 858 pixels (and it will generate horizontal sync pulse every 858
  pixels on its own regardless of what comes out of the PV - so there will be
  garbage on screen if you set it to anything else), and vtotal to be 525 lines.
  It will not accept vtotal that's any higher (it will generate its own vertical
  sync as demanded by System M if not triggered by the PV), but it can be lower
  - resulting in modes that are non-standard, but otherwise valid.

- Likewise, when the registers are set to VEC_CONFIG0_PAL_BDGHI_STD,
  VEC_CONFIG0_PAL_N_STD or VEC_CONFIG0_SECAM_STD (SECAM is a bit special, but
  that's irrelevant here), it operates in the "CCIR System B/D/G/H/I/N" mode,
  and likewise, expects htotal to be exactly 864 pixels (garbage on screen
  otherwise), vtotal limit is 625 lines, etc.

Checking for the refresh rate would only work for standard-compliant modes and
have the potential of completely breaking on any custom modes. Conversely,
checking for htotal aligns perfectly with the limitations of the hardware, and
allows the user to set any modeline that the hardware is able to output with
any level of sanity.

Footnote: all this information on VEC's behavior comes from my own
experimentation, messing around with its registers and seeing what happens
(both on screen and on an oscilloscope). I've never seen any Broadcom docs on
this chip, so it's by no means official.

Best regards,
Mateusz Kwiatkowski

